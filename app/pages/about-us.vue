<template>
  <div class="py-12">
    <!-- رأس الصفحة Page Header -->
    <section class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mb-16 text-center" data-aos="fade-up">
      <span class="inline-block px-4 py-1.5 rounded-full text-xs font-bold uppercase tracking-wider bg-brand-50 dark:bg-brand-950/60 text-brand-600 dark:text-brand-300 border border-brand-500/20 mb-4">
        ABOUT US
      </span>
      <h1 class="text-4xl sm:text-6xl font-black text-slate-900 dark:text-white leading-tight mb-6">
        More Than Accountants.
        <br />
        <span class="bg-gradient-to-r from-brand-600 via-sky-500 to-blue-600 dark:from-brand-300 dark:via-sky-400 dark:to-blue-300 bg-clip-text text-transparent">
          We’re Strategic Financial Partners.
        </span>
      </h1>
      <p class="text-lg sm:text-xl text-slate-600 dark:text-slate-300 max-w-3xl mx-auto leading-relaxed">
        We are a professional tax and financial services firm committed to helping businesses stay compliant, profitable, and prepared for the future.
      </p>
    </section>

    <!-- كارت النبذة الكبيرة 3D Hero Profile -->
    <section class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mb-24">
      <div class="grid grid-cols-1 lg:grid-cols-12 gap-10 items-center">
        <div class="lg:col-span-7 space-y-6" data-aos="fade-right">
          <h2 class="text-3xl sm:text-4xl font-black text-slate-900 dark:text-white leading-tight">
            Protecting Your Business Today, Growing Smarter Tomorrow.
          </h2>
          <p class="text-slate-600 dark:text-slate-300 text-base sm:text-lg leading-relaxed">
            Our expertise spans taxation, audit, accounting, and financial consulting—delivered with precision, transparency, and purpose. We work closely with business owners, startups, and growing enterprises to simplify complex financial matters and turn numbers into actionable insights.
          </p>
          <p class="text-slate-700 dark:text-slate-200 text-base sm:text-lg leading-relaxed font-bold text-brand-600 dark:text-brand-400">
            Our goal is straightforward: protect your business today and help you grow smarter tomorrow.
          </p>

          <div class="flex items-center gap-4 pt-4">
            <a
              href="tel:786-244-5823"
              class="px-8 py-4 rounded-xl bg-gradient-to-r from-brand-500 to-sky-500 hover:from-brand-600 hover:to-sky-600 text-white font-bold transition shadow-lg shadow-brand-500/25 flex items-center gap-2"
            >
              <span>📞 Call 786-244-5823</span>
            </a>
            <NuxtLink
              to="/contact-us"
              class="px-8 py-4 rounded-xl border border-slate-300 dark:border-slate-700 hover:border-brand-500 font-bold text-slate-700 dark:text-slate-200 transition"
            >
              Get In Touch
            </NuxtLink>
          </div>
        </div>

        <!-- بطاقة الإحصائيات ثلاثية الأبعاد مع صورة احترافية -->
        <div class="lg:col-span-5" data-aos="fade-left">
          <div class="relative rounded-3xl overflow-hidden shadow-2xl border border-slate-200 dark:border-slate-800">
            <img
              src="https://images.unsplash.com/photo-1450133064473-71024230f91b?auto=format&fit=crop&w=800&q=80"
              alt="Tax Consultation Team"
              class="w-full h-72 object-cover"
            />
            <div class="p-8 bg-slate-900 text-white space-y-6">
              <div class="flex items-center justify-between border-b border-white/10 pb-4">
                <div>
                  <div class="text-4xl font-black text-brand-300">20+</div>
                  <div class="text-xs text-slate-300 font-medium">Years of Experience</div>
                </div>
                <div class="w-12 h-12 rounded-xl bg-brand-500/20 text-brand-300 flex items-center justify-center text-2xl">
                  🏆
                </div>
              </div>
              <div class="grid grid-cols-2 gap-4">
                <div>
                  <div class="text-2xl font-extrabold text-sky-300">5000+</div>
                  <div class="text-xs text-slate-400">Active Business Clients</div>
                </div>
                <div>
                  <div class="text-2xl font-extrabold text-brand-400">100%</div>
                  <div class="text-xs text-slate-400">Accurate & Compliant</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- قسم لماذا تختارنا WHY CHOOSE US -->
    <section class="py-20 bg-slate-100/60 dark:bg-slate-900/40">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <SectionHeader
          badge="WHY CHOOSE US"
          title="Why Businesses Trust Us With Their Numbers"
          subtitle="Our approach blends deep technical expertise with practical business insight."
        />

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <!-- كارت 1: Expertise That Actually Delivers -->
          <div
            class="p-8 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-xl hover:border-brand-500 transition-all duration-300 hover:-translate-y-2 group"
            data-aos="fade-up"
            data-aos-delay="100"
          >
            <div class="w-14 h-14 rounded-2xl bg-brand-50 dark:bg-brand-950/60 text-brand-500 flex items-center justify-center text-2xl mb-6 group-hover:scale-110 transition-transform shadow-md">
              🎯
            </div>
            <h3 class="text-xl font-extrabold text-slate-900 dark:text-white mb-3">
              Expertise That Actually Delivers
            </h3>
            <p class="text-slate-600 dark:text-slate-400 text-sm leading-relaxed">
              Our team brings deep industry knowledge and hands-on experience across tax planning, audits, accounting systems, and financial consulting. We don’t guess—we guide with facts.
            </p>
          </div>

          <!-- كارت 2: Clear Communication, Zero Confusion -->
          <div
            class="p-8 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-xl hover:border-brand-500 transition-all duration-300 hover:-translate-y-2 group"
            data-aos="fade-up"
            data-aos-delay="200"
          >
            <div class="w-14 h-14 rounded-2xl bg-brand-50 dark:bg-brand-950/60 text-brand-500 flex items-center justify-center text-2xl mb-6 group-hover:scale-110 transition-transform shadow-md">
              💬
            </div>
            <h3 class="text-xl font-extrabold text-slate-900 dark:text-white mb-3">
              Clear Communication, Zero Confusion
            </h3>
            <p class="text-slate-600 dark:text-slate-400 text-sm leading-relaxed">
              We believe financial clarity drives better decisions. That’s why we explain everything in plain language, keeping you informed, confident, and always in control.
            </p>
          </div>

          <!-- كارت 3: Results-Driven Approach -->
          <div
            class="p-8 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-xl hover:border-brand-500 transition-all duration-300 hover:-translate-y-2 group"
            data-aos="fade-up"
            data-aos-delay="300"
          >
            <div class="w-14 h-14 rounded-2xl bg-brand-50 dark:bg-brand-950/60 text-brand-500 flex items-center justify-center text-2xl mb-6 group-hover:scale-110 transition-transform shadow-md">
              📈
            </div>
            <h3 class="text-xl font-extrabold text-slate-900 dark:text-white mb-3">
              Results-Driven Approach
            </h3>
            <p class="text-slate-600 dark:text-slate-400 text-sm leading-relaxed">
              We focus on outcomes, not paperwork. Every strategy, report, and recommendation is designed to improve compliance, efficiency, and long-term growth.
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- قسم مراحل العمل OUR PROCESS (4 Steps Timeline) -->
    <section class="py-24 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <SectionHeader
        badge="OUR PROCESS"
        title="How We Work — Simple, Structured, Effective"
        subtitle="A streamlined four-step workflow built to eliminate complexity and maximize value."
      />

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
        <!-- خطوة 1 -->
        <div
          class="relative p-8 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-lg hover:border-brand-500 transition"
          data-aos="fade-up"
          data-aos-delay="100"
        >
          <div class="w-10 h-10 rounded-full bg-brand-500 text-white font-black flex items-center justify-center text-sm mb-4">
            01
          </div>
          <h3 class="text-lg font-black text-slate-900 dark:text-white mb-2">Understand Your Business</h3>
          <p class="text-xs sm:text-sm text-slate-600 dark:text-slate-400 leading-relaxed">
            We start by learning your goals, challenges, and financial structure to ensure our services align perfectly with your needs.
          </p>
        </div>

        <!-- خطوة 2 -->
        <div
          class="relative p-8 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-lg hover:border-brand-500 transition"
          data-aos="fade-up"
          data-aos-delay="200"
        >
          <div class="w-10 h-10 rounded-full bg-brand-500 text-white font-black flex items-center justify-center text-sm mb-4">
            02
          </div>
          <h3 class="text-lg font-black text-slate-900 dark:text-white mb-2">Analyze & Strategize</h3>
          <p class="text-xs sm:text-sm text-slate-600 dark:text-slate-400 leading-relaxed">
            Our experts assess your financial data, tax position, and compliance status to build a tailored, forward-thinking strategy.
          </p>
        </div>

        <!-- خطوة 3 -->
        <div
          class="relative p-8 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-lg hover:border-brand-500 transition"
          data-aos="fade-up"
          data-aos-delay="300"
        >
          <div class="w-10 h-10 rounded-full bg-brand-500 text-white font-black flex items-center justify-center text-sm mb-4">
            03
          </div>
          <h3 class="text-lg font-black text-slate-900 dark:text-white mb-2">Execute With Precision</h3>
          <p class="text-xs sm:text-sm text-slate-600 dark:text-slate-400 leading-relaxed">
            From tax filings to audits and accounting, we implement solutions accurately, efficiently, and on time.
          </p>
        </div>

        <!-- خطوة 4 -->
        <div
          class="relative p-8 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-lg hover:border-brand-500 transition"
          data-aos="fade-up"
          data-aos-delay="400"
        >
          <div class="w-10 h-10 rounded-full bg-brand-500 text-white font-black flex items-center justify-center text-sm mb-4">
            04
          </div>
          <h3 class="text-lg font-black text-slate-900 dark:text-white mb-2">Ongoing Support</h3>
          <p class="text-xs sm:text-sm text-slate-600 dark:text-slate-400 leading-relaxed">
            We don’t disappear after delivery. We stay involved, continuously optimizing your financial performance as your business evolves.
          </p>
        </div>
      </div>
    </section>

    <!-- بانر الحجز CTA -->
    <section class="py-12 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
      <div class="p-10 sm:p-14 rounded-3xl bg-gradient-to-r from-brand-600 via-sky-600 to-blue-700 text-white shadow-2xl" data-aos="zoom-in">
        <h2 class="text-3xl sm:text-4xl font-black mb-4">Looking for a Financial Partner You Can Trust?</h2>
        <p class="text-slate-100 text-base sm:text-lg mb-8 max-w-2xl mx-auto">
          Let’s simplify your finances and strengthen your business foundation.
        </p>
        <NuxtLink
          to="/contact-us"
          class="px-8 py-4 rounded-xl bg-white text-slate-900 hover:bg-slate-100 font-extrabold text-sm transition shadow-lg"
        >
          Schedule a Free Consultation
        </NuxtLink>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
// صفحة من نحن
</script>
