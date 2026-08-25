<template>
  <section class="relative min-h-[92vh] flex items-center justify-center overflow-hidden bg-slate-950 text-white">
    <!-- خلفية الفيديو مع وضوح عالي وملاءمة خاصة للموبايل والديسكتوب -->
    <div class="absolute inset-0 z-0 overflow-hidden">
      <!-- فيديو مخصص لشاشات الموبايل Mobile Video (Portrait / Mobile Optimized) -->
      <video
        autoplay
        loop
        muted
        playsinline
        webkit-playsinline
        disablePictureInPicture
        preload="auto"
        class="block sm:hidden w-full h-full object-cover filter brightness-[0.82] contrast-105"
      >
        <source src="https://res.cloudinary.com/de09liz3w/video/upload/v1787676608/test_cqgxk8.webm" type="video/webm" />
      </video>

      <!-- فيديو مخصص لشاشات الديسكتوب والتابلت Desktop Video -->
      <video
        autoplay
        loop
        muted
        playsinline
        webkit-playsinline
        disablePictureInPicture
        preload="auto"
        class="hidden sm:block w-full h-full object-cover scale-105 filter brightness-[0.78] contrast-105"
      >
        <source :src="activeDesktopVideoUrl" type="video/webm" />
        <source src="https://res.cloudinary.com/de09liz3w/video/upload/v1787675328/test_z8frky.webm" type="video/webm" />
      </video>

      <!-- طبقات تظليل سينمائية خفيفة تبرز تفاصيل الفيديو مع الحفاظ على وضوح النص -->
      <div class="absolute inset-0 bg-gradient-to-t from-slate-950/90 via-slate-950/20 to-slate-950/35"></div>
      <div class="absolute inset-0 bg-gradient-to-r from-slate-950/60 via-transparent to-slate-950/60"></div>

      <!-- إضاءات ثلاثية الأبعاد خافتة بلون الهوية اللبني -->
      <div class="absolute top-1/4 left-1/4 w-96 h-96 bg-brand-500/15 rounded-full blur-[140px] pointer-events-none"></div>
      <div class="absolute bottom-1/4 right-1/4 w-96 h-96 bg-sky-400/15 rounded-full blur-[140px] pointer-events-none"></div>
    </div>

    <!-- المحتوى الرئيسي للهيرو -->
    <div class="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20 sm:py-28 text-center">
      <!-- شارة الثقة العلوية Brand 3D Badge -->
      <div
        data-aos="fade-down"
        class="inline-flex items-center gap-2.5 px-4 sm:px-5 py-2 rounded-full bg-slate-900/80 border border-brand-400/50 text-brand-300 text-xs sm:text-sm font-bold mb-6 sm:mb-8 backdrop-blur-md shadow-2xl shadow-black/40"
      >
        <span class="flex h-2.5 w-2.5 relative">
          <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-brand-400 opacity-75"></span>
          <span class="relative inline-flex rounded-full h-2.5 w-2.5 bg-brand-500"></span>
        </span>
        <span class="tracking-wide">Trusted Accountants & Strategic Advisors</span>
      </div>

      <!-- العنوان الرئيسي الكبير بتدرج اللون اللبني مع ظل نصوص عميق -->
      <h1
        data-aos="fade-up"
        data-aos-delay="100"
        class="text-3xl sm:text-6xl lg:text-7xl font-black tracking-tight leading-[1.2] max-w-5xl mx-auto mb-5 sm:mb-6 drop-shadow-[0_4px_16px_rgba(0,0,0,0.8)]"
      >
        Smart Tax.
        <span class="bg-gradient-to-r from-brand-300 via-sky-400 to-cyan-300 bg-clip-text text-transparent"> Strong Numbers.</span>
        <br class="hidden sm:inline" />
        Confident Decisions.
      </h1>

      <!-- النص التعريفي مع ظل خفيف للوضوح التام -->
      <p
        data-aos="fade-up"
        data-aos-delay="200"
        class="text-base sm:text-xl text-slate-100 max-w-3xl mx-auto mb-8 sm:mb-10 font-normal leading-relaxed drop-shadow-[0_2px_10px_rgba(0,0,0,0.8)]"
      >
        Running a business is hard. Your finances shouldn’t be. We deliver expert tax, audit, accounting, and consulting services that keep your business compliant, profitable, and future-ready.
      </p>

      <!-- أزرار الإجراء السريع CTA Buttons -->
      <div
        data-aos="fade-up"
        data-aos-delay="300"
        class="flex flex-col sm:flex-row items-center justify-center gap-3.5 sm:gap-4 max-w-md mx-auto"
      >
        <NuxtLink
          to="/contact-us"
          class="w-full sm:w-auto px-7 sm:px-8 py-3.5 sm:py-4 rounded-2xl bg-gradient-to-r from-brand-500 via-sky-500 to-brand-600 text-white font-extrabold text-sm sm:text-base hover:from-brand-400 hover:to-sky-400 transition-all duration-300 shadow-2xl shadow-brand-500/40 hover:shadow-brand-500/60 hover:-translate-y-1 flex items-center justify-center gap-2 group"
        >
          <span>Contact Us Today</span>
          <svg class="w-5 h-5 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"/>
          </svg>
        </NuxtLink>

        <NuxtLink
          to="/services"
          class="w-full sm:w-auto px-7 sm:px-8 py-3.5 sm:py-4 rounded-2xl bg-slate-900/90 hover:bg-slate-800 text-white font-bold text-sm sm:text-base border border-slate-700 hover:border-brand-400 transition-all duration-300 backdrop-blur-md hover:-translate-y-1 flex items-center justify-center gap-2 shadow-xl shadow-black/40"
        >
          <span>Explore Services</span>
        </NuxtLink>
      </div>

      <!-- إحصائيات سريعة ثلاثية الأبعاد 3D Stat Cards -->
      <div
        data-aos="fade-up"
        data-aos-delay="400"
        class="grid grid-cols-2 md:grid-cols-4 gap-3 sm:gap-6 mt-12 sm:mt-16 max-w-5xl mx-auto"
      >
        <div class="p-4 sm:p-5 rounded-2xl bg-slate-900/85 border border-slate-800/90 backdrop-blur-md hover:border-brand-500/40 transition hover:-translate-y-1 shadow-2xl shadow-black/40">
          <div class="text-2xl sm:text-4xl font-extrabold bg-gradient-to-r from-brand-400 to-sky-300 bg-clip-text text-transparent">13+</div>
          <div class="text-xs sm:text-sm text-slate-200 mt-1 font-semibold">Years Experience</div>
        </div>
        <div class="p-4 sm:p-5 rounded-2xl bg-slate-900/85 border border-slate-800/90 backdrop-blur-md hover:border-brand-500/40 transition hover:-translate-y-1 shadow-2xl shadow-black/40">
          <div class="text-2xl sm:text-4xl font-extrabold bg-gradient-to-r from-brand-400 to-sky-300 bg-clip-text text-transparent">100%</div>
          <div class="text-xs sm:text-sm text-slate-200 mt-1 font-semibold">IRS Compliance</div>
        </div>
        <div class="p-4 sm:p-5 rounded-2xl bg-slate-900/85 border border-slate-800/90 backdrop-blur-md hover:border-brand-500/40 transition hover:-translate-y-1 shadow-2xl shadow-black/40">
          <div class="text-2xl sm:text-4xl font-extrabold bg-gradient-to-r from-brand-400 to-sky-300 bg-clip-text text-transparent">500+</div>
          <div class="text-xs sm:text-sm text-slate-200 mt-1 font-semibold">Happy Clients</div>
        </div>
        <div class="p-4 sm:p-5 rounded-2xl bg-slate-900/85 border border-slate-800/90 backdrop-blur-md hover:border-brand-500/40 transition hover:-translate-y-1 shadow-2xl shadow-black/40">
          <div class="text-2xl sm:text-4xl font-extrabold bg-gradient-to-r from-brand-400 to-sky-300 bg-clip-text text-transparent">24/7</div>
          <div class="text-xs sm:text-sm text-slate-200 mt-1 font-semibold">Advisory Support</div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
const props = defineProps<{
  videoUrl?: string
}>()

// روابط الفيديو المخصصة
const defaultDesktopVideo = 'https://res.cloudinary.com/de09liz3w/video/upload/v1787675328/test_z8frky.webm'

const activeDesktopVideoUrl = computed(() => props.videoUrl || defaultDesktopVideo)
</script>
