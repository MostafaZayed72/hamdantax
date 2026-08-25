<template>
  <footer class="relative bg-slate-950 text-slate-300 pt-16 pb-12 overflow-hidden border-t border-slate-800">
    <!-- إضاءة خلفية بلون الهوية اللبني -->
    <div class="absolute -top-32 left-1/2 -translate-x-1/2 w-96 h-96 bg-brand-500/10 rounded-full blur-3xl pointer-events-none"></div>
    <div class="absolute -bottom-24 right-0 w-80 h-80 bg-sky-500/10 rounded-full blur-3xl pointer-events-none"></div>

    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-10 mb-12">
        <!-- العمود 1: عن الشركة مع الشعار الرسمي بحجم كبير -->
        <div class="space-y-4">
          <NuxtLink to="/" class="inline-block py-1">
            <img
              src="/logo.png"
              alt="Hamdan Tax"
              class="h-14 sm:h-16 w-auto object-contain brightness-105"
            />
          </NuxtLink>
          <p class="text-sm text-slate-400 leading-relaxed">
            We deliver expert tax, audit, accounting, and consulting services that keep your business compliant, profitable, and future-ready.
          </p>
          <div class="flex items-center gap-3 pt-2">
            <a href="https://facebook.com" target="_blank" class="w-9 h-9 rounded-lg bg-slate-900 hover:bg-brand-500 hover:text-white flex items-center justify-center transition" aria-label="Facebook">
              <svg class="w-4 h-4 fill-current" viewBox="0 0 24 24"><path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/></svg>
            </a>
            <a href="https://twitter.com" target="_blank" class="w-9 h-9 rounded-lg bg-slate-900 hover:bg-brand-500 hover:text-white flex items-center justify-center transition" aria-label="Twitter">
              <svg class="w-4 h-4 fill-current" viewBox="0 0 24 24"><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg>
            </a>
            <a href="https://instagram.com" target="_blank" class="w-9 h-9 rounded-lg bg-slate-900 hover:bg-brand-500 hover:text-white flex items-center justify-center transition" aria-label="Instagram">
              <svg class="w-4 h-4 fill-current" viewBox="0 0 24 24"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/></svg>
            </a>
          </div>
        </div>

        <!-- العمود 2: روابط سريعة Quick Links -->
        <div>
          <h4 class="text-white font-bold text-base mb-4 tracking-wide">Quick Links</h4>
          <ul class="space-y-2.5 text-sm">
            <li>
              <NuxtLink to="/" class="hover:text-brand-400 transition flex items-center gap-2">
                <span class="text-brand-400">›</span> Home
              </NuxtLink>
            </li>
            <li>
              <NuxtLink to="/about-us" class="hover:text-brand-400 transition flex items-center gap-2">
                <span class="text-brand-400">›</span> About Us
              </NuxtLink>
            </li>
            <li>
              <NuxtLink to="/services" class="hover:text-brand-400 transition flex items-center gap-2">
                <span class="text-brand-400">›</span> Services
              </NuxtLink>
            </li>
            <li>
              <NuxtLink to="/blog" class="hover:text-brand-400 transition flex items-center gap-2">
                <span class="text-brand-400">›</span> Blogs & News
              </NuxtLink>
            </li>
            <li>
              <NuxtLink to="/contact-us" class="hover:text-brand-400 transition flex items-center gap-2">
                <span class="text-brand-400">›</span> Contact Us
              </NuxtLink>
            </li>
          </ul>
        </div>

        <!-- العمود 3: معلومات التواصل Contact Info -->
        <div>
          <h4 class="text-white font-bold text-base mb-4 tracking-wide">Contact Us</h4>
          <ul class="space-y-3 text-sm">
            <li class="flex items-start gap-3">
              <span class="text-brand-400 text-lg">📍</span>
              <div>
                <span class="block text-slate-400 text-xs">Location</span>
                <span class="text-white font-medium">Hallandale Beach, Florida</span>
              </div>
            </li>
            <li class="flex items-start gap-3">
              <span class="text-brand-400 text-lg">📞</span>
              <div>
                <span class="block text-slate-400 text-xs">Call any time</span>
                <a href="tel:786-244-5823" class="text-white font-medium hover:text-brand-400 transition">786-244-5823</a>
              </div>
            </li>
            <li class="flex items-start gap-3">
              <span class="text-brand-400 text-lg">✉️</span>
              <div>
                <span class="block text-slate-400 text-xs">Email Us</span>
                <a href="mailto:Info@HamdanTax.com" class="text-white font-medium hover:text-brand-400 transition">Info@HamdanTax.com</a>
              </div>
            </li>
          </ul>
        </div>

        <!-- العمود 4: النشرة البريدية Newsletter -->
        <div>
          <h4 class="text-white font-bold text-base mb-4 tracking-wide">Newsletter</h4>
          <p class="text-sm text-slate-400 mb-4">
            Sign up to receive the earliest promotional information and tax updates from us.
          </p>
          <form @submit.prevent="handleSubscribe" class="space-y-2">
            <div class="relative">
              <input
                v-model="emailInput"
                type="email"
                required
                placeholder="Enter your email"
                class="w-full px-4 py-3 rounded-xl bg-slate-900 border border-slate-800 text-white placeholder-slate-500 text-sm focus:outline-none focus:border-brand-500 transition"
              />
            </div>
            <button
              type="submit"
              class="w-full py-3 rounded-xl bg-gradient-to-r from-brand-500 to-sky-500 text-white font-bold text-sm hover:from-brand-600 hover:to-sky-600 transition shadow-lg shadow-brand-500/20"
            >
              {{ subscribed ? 'Subscribed ✓' : 'Subscribe' }}
            </button>
          </form>
        </div>
      </div>

      <!-- حقوق الملكية -->
      <div class="pt-8 border-t border-slate-800 text-center text-xs text-slate-500 flex flex-col sm:flex-row items-center justify-between gap-4">
        <span>Copyright © 2026 Hamdan Tax & Associates. All rights reserved.</span>
        <span>Built with Nuxt 4 & Tailwind CSS</span>
      </div>
    </div>
  </footer>
</template>

<script setup lang="ts">
const emailInput = ref('')
const subscribed = ref(false)

const handleSubscribe = () => {
  if (emailInput.value) {
    subscribed.value = true
    emailInput.value = ''
    setTimeout(() => {
      subscribed.value = false
    }, 4000)
  }
}
</script>
