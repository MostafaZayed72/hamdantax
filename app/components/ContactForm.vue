<template>
  <div class="relative p-5 sm:p-10 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-2xl shadow-slate-200/50 dark:shadow-none">
    <!-- إضاءة خافتة خلفية -->
    <div class="absolute -top-12 -right-12 w-48 h-48 bg-brand-500/10 rounded-full blur-2xl pointer-events-none"></div>

    <h3 class="text-2xl font-black text-slate-900 dark:text-white mb-2">Send A Message</h3>
    <p class="text-sm text-slate-600 dark:text-slate-400 mb-8">
      Fill out the form below and our tax experts will get back to you within 24 hours.
    </p>

    <form @submit.prevent="handleSubmit" class="space-y-5">
      <div>
        <label class="block text-xs font-bold uppercase tracking-wider text-slate-700 dark:text-slate-300 mb-2">
          Your Name *
        </label>
        <input
          v-model="form.name"
          type="text"
          required
          placeholder="e.g. John Smith"
          class="w-full px-4 py-3.5 rounded-xl bg-slate-50 dark:bg-slate-800/80 border border-slate-200 dark:border-slate-700 text-slate-900 dark:text-white placeholder-slate-400 focus:outline-none focus:border-brand-500 focus:ring-2 focus:ring-brand-500/20 transition text-sm sm:text-base"
        />
      </div>

      <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
        <div>
          <label class="block text-xs font-bold uppercase tracking-wider text-slate-700 dark:text-slate-300 mb-2">
            Email Address *
          </label>
          <input
            v-model="form.email"
            type="email"
            required
            placeholder="john@example.com"
            class="w-full px-4 py-3.5 rounded-xl bg-slate-50 dark:bg-slate-800/80 border border-slate-200 dark:border-slate-700 text-slate-900 dark:text-white placeholder-slate-400 focus:outline-none focus:border-brand-500 focus:ring-2 focus:ring-brand-500/20 transition text-sm sm:text-base"
          />
        </div>
        <div>
          <label class="block text-xs font-bold uppercase tracking-wider text-slate-700 dark:text-slate-300 mb-2">
            Phone Number
          </label>
          <input
            v-model="form.phone"
            type="tel"
            placeholder="786-244-5823"
            class="w-full px-4 py-3.5 rounded-xl bg-slate-50 dark:bg-slate-800/80 border border-slate-200 dark:border-slate-700 text-slate-900 dark:text-white placeholder-slate-400 focus:outline-none focus:border-brand-500 focus:ring-2 focus:ring-brand-500/20 transition text-sm sm:text-base"
          />
        </div>
      </div>

      <div>
        <label class="block text-xs font-bold uppercase tracking-wider text-slate-700 dark:text-slate-300 mb-2">
          Service Needed
        </label>
        <select
          v-model="form.service"
          class="w-full px-4 py-3.5 rounded-xl bg-slate-50 dark:bg-slate-800/80 border border-slate-200 dark:border-slate-700 text-slate-900 dark:text-white focus:outline-none focus:border-brand-500 focus:ring-2 focus:ring-brand-500/20 transition text-sm sm:text-base"
        >
          <option value="Tax Return Preparation">Tax Return Preparation Services</option>
          <option value="IRS / Sales Tax Representation">IRS / Sales Tax Representation</option>
          <option value="Accounting Services">Accounting Services</option>
          <option value="Consulting Services">Consulting Services</option>
          <option value="General Inquiry">General Financial Inquiry</option>
        </select>
      </div>

      <div>
        <label class="block text-xs font-bold uppercase tracking-wider text-slate-700 dark:text-slate-300 mb-2">
          Message *
        </label>
        <textarea
          v-model="form.message"
          rows="4"
          required
          placeholder="Describe your financial goals or questions..."
          class="w-full px-4 py-3.5 rounded-xl bg-slate-50 dark:bg-slate-800/80 border border-slate-200 dark:border-slate-700 text-slate-900 dark:text-white placeholder-slate-400 focus:outline-none focus:border-brand-500 focus:ring-2 focus:ring-brand-500/20 transition resize-none text-sm sm:text-base"
        ></textarea>
      </div>

      <button
        type="submit"
        :disabled="submitting"
        class="w-full py-4 rounded-xl bg-gradient-to-r from-brand-500 via-sky-500 to-brand-600 hover:from-brand-600 hover:to-sky-600 text-white font-extrabold text-base transition-all duration-300 shadow-xl shadow-brand-500/25 hover:shadow-brand-500/40 hover:-translate-y-0.5 disabled:opacity-70 flex items-center justify-center gap-2 cursor-pointer"
      >
        <span v-if="submitting">Sending Message...</span>
        <span v-else-if="submitted">Message Sent Successfully ✓</span>
        <span v-else>Send Message</span>
      </button>
    </form>
  </div>
</template>

<script setup lang="ts">
const { client, isConfigured } = useSupabase()

const form = ref({
  name: '',
  email: '',
  phone: '',
  service: 'Tax Return Preparation',
  message: ''
})

const submitting = ref(false)
const submitted = ref(false)
const errorMessage = ref('')

const handleSubmit = async () => {
  submitting.value = true
  errorMessage.value = ''

  try {
    if (isConfigured && client) {
      const { error } = await client.from('bookings').insert([
        {
          name: form.value.name,
          email: form.value.email,
          phone: form.value.phone,
          service: form.value.service,
          message: form.value.message,
          status: 'pending'
        }
      ])
      if (error) throw error
    } else {
      // محاكاة الإرسال في حال عدم ربط سوبابيس بعد
      await new Promise((resolve) => setTimeout(resolve, 800))
    }

    submitted.value = true
    form.value = {
      name: '',
      email: '',
      phone: '',
      service: 'Tax Return Preparation',
      message: ''
    }
    setTimeout(() => {
      submitted.value = false
    }, 5000)
  } catch (err: any) {
    console.error('Error submitting booking:', err)
    errorMessage.value = err.message || 'حدث خطأ أثناء إرسال الرسالة، يرجى المحاولة لاحقاً'
  } finally {
    submitting.value = false
  }
}
</script>
