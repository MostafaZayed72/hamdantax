<template>
  <div class="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-7xl mx-auto">
    <div
      v-for="(t, index) in testimonials"
      :key="index"
      class="relative p-8 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-xl shadow-slate-200/50 dark:shadow-none hover:border-brand-500/50 transition-all duration-300 hover:-translate-y-2 group"
      data-aos="fade-up"
      :data-aos-delay="index * 150"
    >
      <!-- تأثير إضاءة علوي -->
      <div class="absolute -top-px left-8 right-8 h-px bg-gradient-to-r from-transparent via-brand-500 to-transparent opacity-0 group-hover:opacity-100 transition-opacity"></div>

      <!-- النجوم Rating -->
      <div class="flex items-center gap-1 text-amber-400 mb-6 text-sm">
        <span v-for="star in 5" :key="star">★</span>
      </div>

      <!-- نص الرأي Quote -->
      <p class="text-slate-600 dark:text-slate-300 text-sm sm:text-base leading-relaxed italic mb-8">
        “{{ t.quote }}”
      </p>

      <!-- بيانات صاحب الرأي -->
      <div class="flex items-center gap-4 pt-4 border-t border-slate-100 dark:border-slate-800">
        <div class="w-12 h-12 rounded-full bg-gradient-to-tr from-brand-600 to-sky-400 flex items-center justify-center text-white font-bold text-lg shadow-md shadow-brand-500/20">
          {{ t.name.charAt(0) }}
        </div>
        <div>
          <h4 class="font-extrabold text-slate-900 dark:text-white text-base">
            {{ t.name }}
          </h4>
          <p class="text-xs text-brand-600 dark:text-brand-400 font-semibold">
            {{ t.role }}
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
const testimonials = [
  {
    name: 'Sarah M',
    role: 'Business Owner',
    quote: 'Professional, responsive, and incredibly knowledgeable. They completely transformed how we manage our finances.'
  },
  {
    name: 'James R',
    role: 'Managing Director',
    quote: 'Clear advice, no guesswork. Their consulting helped us scale with confidence.'
  },
  {
    name: 'Ayesha K',
    role: 'Founder & CEO',
    quote: 'Finally, a financial firm that actually understands business. Their proactive tax planning saved us thousands.'
  }
]
</script>
