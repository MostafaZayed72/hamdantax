import type { Config } from 'tailwindcss'

export default <Partial<Config>>{
  darkMode: 'class',
  content: [
    './app/**/*.{vue,js,ts,jsx,tsx}',
    './components/**/*.{vue,js,ts,jsx,tsx}',
    './layouts/**/*.{vue,js,ts,jsx,tsx}',
    './pages/**/*.{vue,js,ts,jsx,tsx}',
    './plugins/**/*.{vue,js,ts,jsx,tsx}',
    './app.vue',
    './error.vue'
  ],
  theme: {
    extend: {
      colors: {
        brand: {
          50: '#f0f8ff',
          100: '#e0f0fe',
          200: '#bae2fd',
          300: '#7ccbfb',
          400: '#38b0f6',
          500: '#318BD5', // اللون اللبني الأصلي للهوية
          600: '#1c70ba',
          700: '#175997',
          800: '#174c7d',
          900: '#184068',
          950: '#102945'
        }
      },
      fontFamily: {
        tajawal: ['Tajawal', 'sans-serif'],
        sans: ['Tajawal', 'sans-serif']
      }
    }
  }
}
