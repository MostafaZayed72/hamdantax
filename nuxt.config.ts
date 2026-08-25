// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-07-15',
  devtools: { enabled: true },

  modules: [
    '@nuxtjs/tailwindcss',
    '@nuxt/image',
    '@nuxtjs/color-mode',
    '@nuxtjs/google-fonts'
  ],

  googleFonts: {
    families: {
      Tajawal: [200, 300, 400, 500, 700, 800, 900]
    },
    display: 'swap',
    download: true
  },

  colorMode: {
    classSuffix: '',
    preference: 'system',
    fallback: 'light'
  },

  css: [
    '~/assets/css/main.css',
    'aos/dist/aos.css'
  ],

  app: {
    head: {
      htmlAttrs: {
        lang: 'en',
        dir: 'ltr'
      },
      title: 'Hamdan Tax | Certified Accounting & Tax Advisory',
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { name: 'description', content: 'Expert tax preparation, IRS representation, accounting, and financial consulting in Hallandale Beach, Florida.' }
      ]
    }
  }
})
