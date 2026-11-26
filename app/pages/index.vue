<template>
  <div>
    <!-- قسم الهيرو الرئيسي بخلفية الفيديو والتأثيرات ثلاثية الأبعاد -->
    <HeroVideo />

    <!-- شريط الركائز الثلاثية Value Proposition Cards (3D Brand Cards) -->
    <section class="py-16 -mt-16 relative z-20 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <!-- كارت 1: Compliance Without the Stress -->
        <div
          class="relative p-8 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200/90 dark:border-slate-800 shadow-xl shadow-brand-500/5 hover:border-brand-500/50 transition-all duration-300 hover:-translate-y-2 group"
          data-aos="fade-up"
          data-aos-delay="100"
        >
          <div class="w-14 h-14 rounded-2xl bg-brand-500 text-white flex items-center justify-center text-2xl mb-6 shadow-lg shadow-brand-500/30 group-hover:scale-110 transition-transform">
            <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/>
            </svg>
          </div>
          <h3 class="text-2xl font-black text-brand-600 dark:text-brand-400 mb-3">
            Compliance Without the Stress
          </h3>
          <p class="text-slate-600 dark:text-slate-300 text-sm leading-relaxed">
            We stay ahead of tax laws, regulations, and reporting deadlines—so you never have to worry about penalties or surprises.
          </p>
        </div>

        <!-- كارت 2: Numbers That Actually Make Sense -->
        <div
          class="relative p-8 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200/90 dark:border-slate-800 shadow-xl shadow-brand-500/5 hover:border-brand-500/50 transition-all duration-300 hover:-translate-y-2 group"
          data-aos="fade-up"
          data-aos-delay="200"
        >
          <div class="w-14 h-14 rounded-2xl bg-brand-500 text-white flex items-center justify-center text-2xl mb-6 shadow-lg shadow-brand-500/30 group-hover:scale-110 transition-transform">
            <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/>
            </svg>
          </div>
          <h3 class="text-2xl font-black text-brand-600 dark:text-brand-400 mb-3">
            Numbers That Actually Make Sense
          </h3>
          <p class="text-slate-600 dark:text-slate-300 text-sm leading-relaxed">
            No jargon. No confusion. Just clear financial insights that help you make smarter, faster business decisions.
          </p>
        </div>

        <!-- كارت 3: Advisors, Not Just Accountants -->
        <div
          class="relative p-8 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200/90 dark:border-slate-800 shadow-xl shadow-brand-500/5 hover:border-brand-500/50 transition-all duration-300 hover:-translate-y-2 group"
          data-aos="fade-up"
          data-aos-delay="300"
        >
          <div class="w-14 h-14 rounded-2xl bg-brand-500 text-white flex items-center justify-center text-2xl mb-6 shadow-lg shadow-brand-500/30 group-hover:scale-110 transition-transform">
            <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
            </svg>
          </div>
          <h3 class="text-2xl font-black text-brand-600 dark:text-brand-400 mb-3">
            Advisors, Not Just Accountants
          </h3>
          <p class="text-slate-600 dark:text-slate-300 text-sm leading-relaxed">
            We don’t just record numbers—we help you grow, optimize cashflow, and strategically plan for what’s next.
          </p>
        </div>
      </div>
    </section>

    <!-- قسم نبذة عنا About Us مع صورة خلفية لكامل القسم وفوقها النص (Full Background Image) -->
    <section class="relative py-28 overflow-hidden bg-slate-950 text-white">
      <!-- صورة الخلفية الكاملة للسكشن Full Section Background Image -->
      <div class="absolute inset-0 z-0">
        <img
          src="https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=2000&q=85"
          alt="Modern Financial Architecture"
          class="w-full h-full object-cover filter brightness-[0.22] contrast-125 scale-105"
        />
        <!-- تدرجات لونية وطبقات إضاءة زرقاء متناسقة مع الهوية -->
        <div class="absolute inset-0 bg-gradient-to-r from-slate-950 via-slate-950/85 to-brand-950/80"></div>
        <div class="absolute inset-0 bg-gradient-to-t from-slate-950 via-transparent to-slate-950"></div>
        <div class="absolute top-1/3 left-1/4 w-96 h-96 bg-brand-500/15 rounded-full blur-[140px] pointer-events-none"></div>
      </div>

      <!-- محتوى السكشن فوق الصورة -->
      <div class="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="max-w-3xl space-y-6" data-aos="fade-up">
          <span class="inline-block px-4 py-1.5 rounded-full text-xs font-bold uppercase tracking-wider bg-brand-500/20 text-brand-300 border border-brand-400/30 backdrop-blur-md">
            ABOUT US
          </span>

          <h2 class="text-4xl sm:text-5xl lg:text-6xl font-black text-white tracking-tight leading-tight">
            Your Financial <span class="bg-gradient-to-r from-brand-300 via-sky-300 to-cyan-200 bg-clip-text text-transparent">Backbone</span>
          </h2>

          <p class="text-slate-200 text-lg sm:text-xl leading-relaxed font-normal">
            We are a professional tax and financial services firm built to support modern businesses. From startups to established enterprises, we help organizations stay compliant, financially healthy, and strategically strong.
          </p>

          <p class="text-slate-300 text-base sm:text-lg leading-relaxed">
            Our approach blends deep technical expertise with practical business insight. That means you get more than reports—you get clarity, confidence, and a financial partner invested in your success.
          </p>

          <!-- شبكة إحصائيات مصغرة مدمجة -->
          <div class="grid grid-cols-2 sm:grid-cols-3 gap-6 pt-4 border-t border-white/10">
            <div>
              <div class="text-3xl font-extrabold text-brand-400">20+</div>
              <div class="text-xs text-slate-300 mt-0.5">Years Experience</div>
            </div>
            <div>
              <div class="text-3xl font-extrabold text-sky-400">5000+</div>
              <div class="text-xs text-slate-300 mt-0.5">Satisfied Clients</div>
            </div>
            <div>
              <div class="text-3xl font-extrabold text-cyan-300">100%</div>
              <div class="text-xs text-slate-300 mt-0.5">IRS Compliance</div>
            </div>
          </div>

          <!-- الأزرار التفاعلية -->
          <div class="flex flex-wrap items-center gap-4 pt-4">
            <NuxtLink
              to="/about-us"
              class="px-8 py-4 rounded-xl bg-gradient-to-r from-brand-500 to-sky-500 hover:from-brand-400 hover:to-sky-400 text-white font-extrabold text-sm transition-all shadow-xl shadow-brand-500/25 hover:-translate-y-0.5"
            >
              Learn More
            </NuxtLink>
            <a
              href="tel:786-244-5823"
              class="px-8 py-4 rounded-xl bg-white/10 hover:bg-white/20 text-white font-bold text-sm border border-white/20 backdrop-blur-md transition hover:-translate-y-0.5 flex items-center gap-2"
            >
              <span>📞 786-244-5823</span>
            </a>
          </div>
        </div>
      </div>
    </section>

    <!-- قسم الخدمات الأربعة الرئيسية Core Services -->
    <section class="py-24 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <SectionHeader
        badge="SUPPORT SERVICES"
        title="What We Do Best"
        subtitle="With our experts and CPAs, you will be able to save money, enjoy peace of mind, and focus on your real priorities."
      />

      <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
        <!-- خدمة 1: Tax Return Preparation -->
        <div
          class="relative p-8 sm:p-10 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200/90 dark:border-slate-800 shadow-xl hover:border-brand-500 transition-all duration-300 hover:-translate-y-2 group"
          data-aos="fade-up"
          data-aos-delay="100"
        >
          <div class="w-16 h-16 rounded-2xl bg-brand-50 dark:bg-brand-950/60 text-brand-500 flex items-center justify-center text-3xl mb-6 group-hover:scale-110 transition-transform">
            📑
          </div>
          <h3 class="text-2xl font-black text-slate-900 dark:text-white mb-4">
            Tax Return Preparation Services
          </h3>
          <p class="text-slate-600 dark:text-slate-400 text-sm sm:text-base leading-relaxed mb-6">
            Accurate, timely, and compliant tax return preparation for businesses and individuals. We focus on minimizing tax liability while ensuring full compliance with local and international tax regulations. No last-minute panic. No costly mistakes.
          </p>
          <NuxtLink to="/services" class="inline-flex items-center gap-2 font-bold text-sm text-brand-500 hover:text-brand-600 group-hover:gap-3 transition-all">
            <span>Learn More</span>
            <span>→</span>
          </NuxtLink>
        </div>

        <!-- خدمة 2: IRS / Sales Tax Representation -->
        <div
          class="relative p-8 sm:p-10 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200/90 dark:border-slate-800 shadow-xl hover:border-brand-500 transition-all duration-300 hover:-translate-y-2 group"
          data-aos="fade-up"
          data-aos-delay="200"
        >
          <div class="w-16 h-16 rounded-2xl bg-brand-50 dark:bg-brand-950/60 text-brand-500 flex items-center justify-center text-3xl mb-6 group-hover:scale-110 transition-transform">
            ⚖️
          </div>
          <h3 class="text-2xl font-black text-slate-900 dark:text-white mb-4">
            IRS / Sales Tax Representation
          </h3>
          <p class="text-slate-600 dark:text-slate-400 text-sm sm:text-base leading-relaxed mb-6">
            Independent and transparent audit services that strengthen financial credibility and meet regulatory requirements. Our audit process is thorough, objective, and designed to protect your business from financial and compliance risks.
          </p>
          <NuxtLink to="/services" class="inline-flex items-center gap-2 font-bold text-sm text-brand-500 hover:text-brand-600 group-hover:gap-3 transition-all">
            <span>Learn More</span>
            <span>→</span>
          </NuxtLink>
        </div>

        <!-- خدمة 3: Accounting Services -->
        <div
          class="relative p-8 sm:p-10 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200/90 dark:border-slate-800 shadow-xl hover:border-brand-500 transition-all duration-300 hover:-translate-y-2 group"
          data-aos="fade-up"
          data-aos-delay="300"
        >
          <div class="w-16 h-16 rounded-2xl bg-brand-50 dark:bg-brand-950/60 text-brand-500 flex items-center justify-center text-3xl mb-6 group-hover:scale-110 transition-transform">
            💼
          </div>
          <h3 class="text-2xl font-black text-slate-900 dark:text-white mb-4">
            Accounting Services
          </h3>
          <p class="text-slate-600 dark:text-slate-400 text-sm sm:text-base leading-relaxed mb-6">
            Complete accounting solutions including bookkeeping, financial statements, payroll support, and reporting. We ensure your financial records are accurate, organized, and always ready for review or decision-making.
          </p>
          <NuxtLink to="/services" class="inline-flex items-center gap-2 font-bold text-sm text-brand-500 hover:text-brand-600 group-hover:gap-3 transition-all">
            <span>Learn More</span>
            <span>→</span>
          </NuxtLink>
        </div>

        <!-- خدمة 4: Consulting Services -->
        <div
          class="relative p-8 sm:p-10 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200/90 dark:border-slate-800 shadow-xl hover:border-brand-500 transition-all duration-300 hover:-translate-y-2 group"
          data-aos="fade-up"
          data-aos-delay="400"
        >
          <div class="w-16 h-16 rounded-2xl bg-brand-50 dark:bg-brand-950/60 text-brand-500 flex items-center justify-center text-3xl mb-6 group-hover:scale-110 transition-transform">
            💡
          </div>
          <h3 class="text-2xl font-black text-slate-900 dark:text-white mb-4">
            Consulting Services
          </h3>
          <p class="text-slate-600 dark:text-slate-400 text-sm sm:text-base leading-relaxed mb-6">
            Strategic financial and business consulting focused on performance improvement, risk management, and long-term growth. We help you turn financial data into smart, actionable strategies.
          </p>
          <NuxtLink to="/services" class="inline-flex items-center gap-2 font-bold text-sm text-brand-500 hover:text-brand-600 group-hover:gap-3 transition-all">
            <span>Learn More</span>
            <span>→</span>
          </NuxtLink>
        </div>
      </div>
    </section>

    <!-- بانر حجز الاستشارة CTA Banner -->
    <section class="py-16 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div
        class="relative rounded-3xl overflow-hidden bg-gradient-to-r from-slate-950 via-brand-950 to-slate-950 p-10 sm:p-14 text-white text-center shadow-2xl border border-brand-500/30"
        data-aos="zoom-in"
      >
        <div class="relative z-10 max-w-3xl mx-auto space-y-6">
          <span class="inline-block px-4 py-1.5 rounded-full text-xs font-bold bg-brand-500/20 text-brand-300 border border-brand-400/30 uppercase tracking-wider">
            Take Action
          </span>
          <h2 class="text-3xl sm:text-5xl font-black tracking-tight leading-tight">
            Stop Guessing. Start Growing.
          </h2>
          <p class="text-slate-300 text-base sm:text-lg">
            Get expert financial guidance tailored to your business goals. Speak with an advisor today.
          </p>
          <div class="pt-4 flex flex-wrap items-center justify-center gap-4">
            <NuxtLink
              to="/contact-us"
              class="px-8 py-4 rounded-xl bg-brand-500 hover:bg-brand-400 text-white font-extrabold text-sm transition shadow-lg shadow-brand-500/30 hover:-translate-y-0.5"
            >
              Book a Free Consultation
            </NuxtLink>
            <a
              href="tel:786-244-5823"
              class="px-8 py-4 rounded-xl bg-slate-800 hover:bg-slate-700 text-white font-bold text-sm transition border border-slate-700"
            >
              Call 786-244-5823
            </a>
          </div>
        </div>
      </div>
    </section>

    <!-- قسم الأسئلة الشائعة FAQ -->
    <section class="py-20 bg-slate-100/50 dark:bg-slate-900/30">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <SectionHeader
          badge="FAQS"
          title="Frequently Asked Questions"
          subtitle="Everything you need to know about our accounting, audit, and tax consulting services."
        />
        <FaqAccordion :items="faqItems" />
      </div>
    </section>

    <!-- قسم آراء وتقييمات العملاء Testimonials -->
    <section class="py-24 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <SectionHeader
        badge="TESTIMONIALS"
        title="Trusted by Business Owners"
        subtitle="Trusted by business owners who care about real results, compliance, and growth."
      />
      <TestimonialSlider />
    </section>

    <!-- قسم أحدث المقالات من المدونة Blog Section Preview -->
    <section class="py-20 bg-slate-100/50 dark:bg-slate-900/30">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <SectionHeader
          badge="BLOG & NEWS"
          title="Our Latest Articles"
          subtitle="We specialize in providing comprehensive financial services tailored to meet the unique needs of our clients."
        />

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div
            v-for="(post, index) in recentPosts"
            :key="index"
            class="rounded-3xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 overflow-hidden shadow-lg hover:shadow-xl hover:border-brand-500/50 transition-all duration-300 hover:-translate-y-1.5 flex flex-col group"
            data-aos="fade-up"
            :data-aos-delay="index * 100"
          >
            <div class="h-48 overflow-hidden bg-slate-800">
              <img :src="post.image" :alt="post.title" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
            </div>
            <div class="p-8 flex-1 flex flex-col justify-between">
              <div>
                <span class="inline-block px-3 py-1 rounded-full text-xs font-bold text-brand-600 dark:text-brand-400 bg-brand-50 dark:bg-brand-950/50 mb-3">
                  {{ post.category }}
                </span>
                <h3 class="text-xl font-extrabold text-slate-900 dark:text-white mb-3 group-hover:text-brand-500 transition">
                  <NuxtLink :to="post.link">{{ post.title }}</NuxtLink>
                </h3>
                <p class="text-slate-600 dark:text-slate-400 text-sm leading-relaxed mb-6">
                  {{ post.description }}
                </p>
              </div>
              <NuxtLink :to="post.link" class="inline-flex items-center gap-2 font-bold text-sm text-brand-500 hover:text-brand-600 group-hover:gap-3 transition-all">
                <span>Read More</span>
                <span>→</span>
              </NuxtLink>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- قسم التواصل السريع المباشر Contact Preview -->
    <section class="py-24 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
        <div data-aos="fade-right" class="space-y-6">
          <span class="inline-block px-4 py-1.5 rounded-full text-xs font-bold uppercase tracking-wider bg-brand-50 dark:bg-brand-950/60 text-brand-600 dark:text-brand-300 border border-brand-500/20">
            CONTACT US
          </span>
          <h2 class="text-3xl sm:text-5xl font-black text-slate-900 dark:text-white leading-tight">
            We Are Ready To Serve You
          </h2>
          <p class="text-slate-600 dark:text-slate-300 text-base leading-relaxed">
            We specialize in providing comprehensive financial services tailored to meet the unique needs of our clients and support success across industries.
          </p>

          <div class="space-y-4 pt-4">
            <div class="flex items-center gap-4 p-4 rounded-2xl bg-slate-100 dark:bg-slate-900 border border-slate-200 dark:border-slate-800">
              <div class="w-12 h-12 rounded-xl bg-brand-500 text-white flex items-center justify-center text-xl shrink-0">
                📞
              </div>
              <div>
                <div class="text-xs text-slate-500 dark:text-slate-400">Give us a call</div>
                <a href="tel:786-244-5823" class="text-base font-bold text-slate-900 dark:text-white hover:text-brand-500">786-244-5823</a>
              </div>
            </div>

            <div class="flex items-center gap-4 p-4 rounded-2xl bg-slate-100 dark:bg-slate-900 border border-slate-200 dark:border-slate-800">
              <div class="w-12 h-12 rounded-xl bg-sky-500 text-white flex items-center justify-center text-xl shrink-0">
                ✉️
              </div>
              <div>
                <div class="text-xs text-slate-500 dark:text-slate-400">Send us an email</div>
                <a href="mailto:Info@HamdanTax.com" class="text-base font-bold text-slate-900 dark:text-white hover:text-brand-500">Info@HamdanTax.com</a>
              </div>
            </div>

            <div class="flex items-center gap-4 p-4 rounded-2xl bg-slate-100 dark:bg-slate-900 border border-slate-200 dark:border-slate-800">
              <div class="w-12 h-12 rounded-xl bg-blue-600 text-white flex items-center justify-center text-xl shrink-0">
                📍
              </div>
              <div>
                <div class="text-xs text-slate-500 dark:text-slate-400">Visit Our Office</div>
                <div class="text-base font-bold text-slate-900 dark:text-white">Hallandale Beach, FL</div>
              </div>
            </div>
          </div>
        </div>

        <div data-aos="fade-left">
          <ContactForm />
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
const faqItems = [
  {
    question: 'Do you work with small businesses and startups?',
    answer: 'Absolutely. We work with businesses of all sizes, from early-stage startups to established companies, tailoring our solutions to your specific scale.'
  },
  {
    question: 'Do you help with tax planning or just filing?',
    answer: 'Both. We focus heavily on proactive tax planning throughout the year, not just last-minute seasonal filings, to optimize your tax position.'
  },
  {
    question: 'Can you handle everything remotely?',
    answer: 'Yes. Our services and secure document portals are fully adaptable to remote and hybrid business models across the United States.'
  },
  {
    question: 'How do I get started?',
    answer: 'Simple—schedule a free consultation or call us at 786-244-5823, and we will assess your needs and recommend the right tailored package.'
  }
]

const recentPosts = [
  {
    title: 'How to Build Your Personal Credit',
    category: 'Credit & Finance',
    image: 'https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?auto=format&fit=crop&w=800&q=80',
    description: 'Learn the core strategies for building, maintaining, and repairing your personal credit profile effectively.',
    link: '/blog/how-to-build-your-personal-credit'
  },
  {
    title: 'Understanding Tax Laws',
    category: 'Tax Advisory',
    image: 'https://images.unsplash.com/photo-1450133064473-71024230f91b?auto=format&fit=crop&w=800&q=80',
    description: 'A comprehensive guide on navigating modern tax regulations and keeping your business 100% compliant.',
    link: '/blog/understanding-tax-laws'
  },
  {
    title: 'Setting Up Your Business',
    category: 'Business Planning',
    image: 'https://images.unsplash.com/photo-1507679799987-c73779587ccf?auto=format&fit=crop&w=800&q=80',
    description: 'Step-by-step guidance on structuring your business entity for maximum tax efficiency and protection.',
    link: '/blog/setting-up-your-business'
  }
]
</script>
