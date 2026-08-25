<template>
  <!-- الأزرار العائمة الثابتة مكدسة عمودياً: سهم الصعود للأعلى وفوقه زر واتساب -->
  <div class="fixed bottom-5 right-4 sm:bottom-6 sm:right-6 z-50 flex flex-col items-center gap-3">
    <!-- زر الصعود للأعلى (Scroll To Top) فوق زر الواتساب -->
    <button
      v-show="showScrollTop"
      @click="scrollToTop"
      class="w-11 h-11 sm:w-12 sm:h-12 rounded-full bg-white dark:bg-slate-900 text-slate-800 dark:text-slate-100 border border-slate-200 dark:border-slate-800 shadow-2xl flex items-center justify-center transition-all duration-300 hover:-translate-y-1 hover:bg-brand-500 hover:text-white dark:hover:bg-brand-500 hover:border-brand-400 focus:outline-none group animate-in fade-in zoom-in duration-300"
      aria-label="Scroll to top"
      title="Scroll to top"
    >
      <svg class="w-5 h-5 group-hover:-translate-y-0.5 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M5 10l7-7m0 0l7 7m-7-7v18"/>
      </svg>
    </button>

    <!-- زر واتساب أيقونة دائرية فقط WhatsApp Icon Only Button -->
    <a
      href="https://wa.me/17862445823?text=Hello%20Hamdan%20Tax,%20I%20would%20like%20to%20inquire%20about%20your%20services."
      target="_blank"
      rel="noopener noreferrer"
      class="relative w-12 h-12 sm:w-13 sm:h-13 p-3 bg-[#25D366] hover:bg-[#20ba59] text-white rounded-full shadow-2xl shadow-emerald-500/40 transition-all duration-300 hover:scale-110 hover:-translate-y-1 flex items-center justify-center group focus:outline-none"
      aria-label="Chat on WhatsApp"
      title="Chat on WhatsApp"
    >
      <!-- نقطة تنبيه حركية -->
      <span class="absolute -top-1 -right-1 flex h-3 w-3">
        <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-red-400 opacity-75"></span>
        <span class="relative inline-flex rounded-full h-3 w-3 bg-red-500 border-2 border-white"></span>
      </span>

      <!-- أيقونة واتساب SVG -->
      <svg class="w-6 h-6 sm:w-7 sm:h-7 fill-current" viewBox="0 0 24 24">
        <path d="M.057 24l1.687-6.163c-1.041-1.804-1.588-3.849-1.587-5.946.003-6.556 5.338-11.891 11.893-11.891 3.181.001 6.167 1.24 8.413 3.488 2.245 2.248 3.481 5.236 3.48 8.414-.003 6.557-5.338 11.892-11.893 11.892-1.99-.001-3.951-.5-5.688-1.448l-6.305 1.654zm6.597-3.807c1.676.995 3.276 1.591 5.392 1.592 5.448 0 9.886-4.434 9.889-9.885.002-5.462-4.415-9.89-9.881-9.892-5.452 0-9.887 4.434-9.889 9.884-.001 2.225.651 3.891 1.746 5.634l-.999 3.648 3.742-.981zm11.387-5.464c-.074-.124-.272-.198-.57-.347-.297-.149-1.758-.868-2.031-.967-.272-.099-.47-.149-.669.149-.198.297-.768.967-.941 1.165-.173.198-.347.223-.644.074-.297-.149-1.255-.462-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.297-.347.446-.521.151-.172.2-.296.3-.495.099-.198.05-.372-.025-.521-.075-.148-.669-1.611-.916-2.206-.242-.579-.487-.501-.669-.51l-.57-.01c-.198 0-.52.074-.792.372s-1.04 1.016-1.04 2.479 1.065 2.876 1.213 3.074c.149.198 2.095 3.2 5.076 4.487.709.306 1.263.489 1.694.626.712.226 1.36.194 1.872.118.571-.085 1.758-.719 2.006-1.413.248-.695.248-1.29.173-1.414z"/>
      </svg>
    </a>
  </div>
</template>

<script setup lang="ts">
const showScrollTop = ref(false)

const handleScroll = () => {
  if (typeof window !== 'undefined') {
    showScrollTop.value = window.scrollY > 250
  }
}

const scrollToTop = () => {
  if (typeof window !== 'undefined') {
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    })
  }
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>
