// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-07-15',
  devtools: { enabled: true },

  runtimeConfig: {
    public: {
      supabaseUrl: process.env.NUXT_PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL || '',
      supabaseKey: process.env.NUXT_PUBLIC_SUPABASE_KEY || process.env.SUPABASE_KEY || ''
    }
  },

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
      link: [
        { rel: 'icon', type: 'image/png', href: '/logo.png' },
        { rel: 'apple-touch-icon', href: '/logo.png' }
      ],
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { name: 'description', content: 'Expert tax preparation, IRS representation, accounting, and financial consulting in Hallandale Beach, Florida.' },
        
        // Open Graph / Facebook / WhatsApp Meta Tags
        { property: 'og:type', content: 'website' },
        { property: 'og:site_name', content: 'Hamdan Tax' },
        { property: 'og:title', content: 'Hamdan Tax | Certified Accounting & Tax Advisory' },
        { property: 'og:description', content: 'Expert tax preparation, IRS representation, accounting, and financial consulting in Hallandale Beach, Florida.' },
        { property: 'og:image', content: 'https://hamdantax.vercel.app/logo.png' },
        { property: 'og:image:secure_url', content: 'https://hamdantax.vercel.app/logo.png' },
        { property: 'og:image:type', content: 'image/png' },
        { property: 'og:image:width', content: '1200' },
        { property: 'og:image:height', content: '630' },
        { property: 'og:image:alt', content: 'Hamdan Tax Certified Accounting & Tax Advisory' },
        { property: 'og:url', content: 'https://hamdantax.vercel.app/' },

        // Twitter Card Meta Tags
        { name: 'twitter:card', content: 'summary_large_image' },
        { name: 'twitter:title', content: 'Hamdan Tax | Certified Accounting & Tax Advisory' },
        { name: 'twitter:description', content: 'Expert tax preparation, IRS representation, accounting, and financial consulting in Hallandale Beach, Florida.' },
        { name: 'twitter:image', content: 'https://hamdantax.vercel.app/logo.png' }
      ]
    }
  }
})
