<template>
  <header class="sticky top-0 z-50 transition-all duration-300 border-b border-slate-200/80 dark:border-slate-800/80 bg-white/95 dark:bg-slate-950/95 backdrop-blur-xl shadow-sm">
    <!-- الشريط العلوي المصغر للتواصل السريع -->
    <div class="hidden md:block bg-gradient-to-r from-slate-950 via-brand-950 to-slate-950 text-slate-300 py-2 px-4 sm:px-6 lg:px-8 text-xs border-b border-white/5">
      <div class="max-w-7xl mx-auto flex items-center justify-between">
        <div class="flex items-center gap-6">
          <a href="tel:786-244-5823" class="flex items-center gap-2 hover:text-brand-300 transition font-sans">
            <span class="w-2 h-2 rounded-full bg-brand-400 animate-ping inline-block"></span>
            <svg class="w-3.5 h-3.5 text-brand-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>
            </svg>
            786-244-5823
          </a>
          <a href="mailto:Info@HamdanTax.com" class="flex items-center gap-2 hover:text-brand-300 transition font-sans">
            <svg class="w-3.5 h-3.5 text-brand-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
            </svg>
            Info@HamdanTax.com
          </a>
        </div>
        <div class="flex items-center gap-4 text-xs font-medium">
          <span>📍 Hallandale Beach, FL</span>
          <span class="text-brand-400 font-semibold">13+ Years Experience</span>
        </div>
      </div>
    </div>

    <!-- النافبار الرئيسي مع لوجو بحجم أكبر وأوضح -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex items-center justify-between h-24">
        <!-- الشعار الرسمي logo.png بحجم أكبر وبارز -->
        <NuxtLink to="/" class="flex items-center group py-2">
          <img
            src="/logo.png"
            alt="Hamdan Tax"
            class="h-16 sm:h-18 lg:h-20 w-auto object-contain transition-transform duration-300 group-hover:scale-105"
          />
        </NuxtLink>

        <!-- روابط التنقل Navigation Links (Desktop) -->
        <nav class="hidden lg:flex items-center gap-1 bg-slate-100/80 dark:bg-slate-900/80 px-4 py-2 rounded-full border border-slate-200/60 dark:border-slate-800/60 backdrop-blur">
          <NuxtLink
            v-for="item in navItems"
            :key="item.path"
            :to="item.path"
            class="px-5 py-2.5 rounded-full text-sm font-bold transition-all duration-200"
            :class="route.path === item.path ? 'bg-brand-500 text-white shadow-md shadow-brand-500/20' : 'text-slate-700 dark:text-slate-300 hover:text-brand-500 dark:hover:text-brand-400'"
          >
            {{ item.name }}
          </NuxtLink>
        </nav>

        <!-- أدوات التحكم والأزرار الجانبية -->
        <div class="flex items-center gap-3.5">
          <!-- زر تبديل الوضع المظلم/الفاتح -->
          <button
            @click="toggleColorMode"
            class="w-11 h-11 rounded-xl border border-slate-200 dark:border-slate-800 bg-slate-100 dark:bg-slate-900 hover:bg-slate-200 dark:hover:bg-slate-800 transition flex items-center justify-center text-slate-700 dark:text-amber-400 shadow-sm cursor-pointer"
            aria-label="Toggle Color Mode"
          >
            <svg v-if="colorMode.value === 'dark'" class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z" />
            </svg>
            <svg v-else class="w-5 h-5 text-slate-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z" />
            </svg>
          </button>

          <!-- زر الاتصال السريع المباشر -->
          <a
            href="tel:786-244-5823"
            class="hidden sm:inline-flex items-center gap-2 px-6 py-3 rounded-xl text-sm font-extrabold bg-gradient-to-r from-brand-500 to-sky-500 text-white hover:from-brand-600 hover:to-sky-600 transition-all shadow-lg shadow-brand-500/25 hover:shadow-brand-500/40 hover:-translate-y-0.5"
          >
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>
            </svg>
            <span>Call 786-244-5823</span>
          </a>

          <!-- زر القائمة للأجهزة الذكية -->
          <button
            @click="mobileMenuOpen = !mobileMenuOpen"
            class="lg:hidden w-11 h-11 rounded-xl border border-slate-200 dark:border-slate-800 bg-slate-100 dark:bg-slate-900 flex items-center justify-center text-slate-700 dark:text-slate-300"
            aria-label="Toggle Menu"
          >
            <svg v-if="!mobileMenuOpen" class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
            </svg>
            <svg v-else class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>
      </div>
    </div>

    <!-- القائمة المنبثقة للجوال Mobile Menu -->
    <div
      v-if="mobileMenuOpen"
      class="lg:hidden border-b border-slate-200 dark:border-slate-800 bg-white/95 dark:bg-slate-950/95 backdrop-blur-xl px-4 pt-2 pb-6 space-y-2 animate-in slide-in-from-top-4 duration-200"
    >
      <NuxtLink
        v-for="item in navItems"
        :key="item.path"
        :to="item.path"
        @click="mobileMenuOpen = false"
        class="block px-4 py-3 rounded-xl text-base font-bold transition"
        :class="route.path === item.path ? 'bg-brand-50 dark:bg-brand-950/50 text-brand-600 dark:text-brand-400' : 'text-slate-700 dark:text-slate-200 hover:bg-slate-100 dark:hover:bg-slate-900'"
      >
        {{ item.name }}
      </NuxtLink>

      <div class="pt-4 border-t border-slate-200 dark:border-slate-800 flex flex-col gap-3">
        <a
          href="tel:786-244-5823"
          class="flex items-center justify-center gap-2 py-3 rounded-xl bg-brand-500 text-white font-bold"
        >
          <span>Call 786-244-5823</span>
        </a>
      </div>
    </div>
  </header>
</template>

<script setup lang="ts">
const route = useRoute()
const colorMode = useColorMode()
const mobileMenuOpen = ref(false)

const navItems = [
  { name: 'Home', path: '/' },
  { name: 'About Us', path: '/about-us' },
  { name: 'Services', path: '/services' },
  { name: 'Blog', path: '/blog' },
  { name: 'Contact', path: '/contact-us' }
]

const toggleColorMode = () => {
  colorMode.preference = colorMode.value === 'dark' ? 'light' : 'dark'
}
</script>
