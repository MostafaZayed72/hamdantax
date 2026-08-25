import AOS from 'aos'

export default defineNuxtPlugin((nuxtApp) => {
  if (import.meta.client) {
    nuxtApp.hook('app:suspense:resolve', () => {
      AOS.init({
        once: true,
        duration: 700,
        easing: 'ease-out-cubic',
        offset: 30,
        disableMutationObserver: false
      })
    })

    // إعادة تحديث بعد تحميل الصفحة بالكامل
    if (typeof window !== 'undefined') {
      window.addEventListener('load', () => {
        AOS.refresh()
      })
    }
  }
})
