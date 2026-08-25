<template>
  <div class="py-12">
    <!-- رأس صفحة التواصل -->
    <section class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mb-16 text-center" data-aos="fade-up">
      <span class="inline-block px-4 py-1.5 rounded-full text-xs font-bold uppercase tracking-wider bg-brand-50 dark:bg-brand-950/60 text-brand-600 dark:text-brand-300 border border-brand-500/20 mb-4">
        CONTACT US
      </span>
      <h1 class="text-4xl sm:text-6xl font-black text-slate-900 dark:text-white leading-tight mb-6">
        We Are Ready To Serve
      </h1>
      <p class="text-lg sm:text-xl text-slate-600 dark:text-slate-300 max-w-3xl mx-auto leading-relaxed">
        We specialize in providing comprehensive financial services tailored to meet the unique needs of our clients and support success across industries.
      </p>
    </section>

    <!-- شبكة التواصل ونموذج الرسائل 3D Contact Layout -->
    <section class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mb-24">
      <div class="grid grid-cols-1 lg:grid-cols-12 gap-12 items-start">
        <!-- معلومات التواصل المباشرة Direct Info -->
        <div class="lg:col-span-5 space-y-6" data-aos="fade-right">
          <div class="p-8 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-xl space-y-8">
            <h2 class="text-2xl font-black text-slate-900 dark:text-white border-b border-slate-100 dark:border-slate-800 pb-4">
              Get In Touch With Our CPAs
            </h2>

            <!-- بطاقة الهاتف -->
            <div class="flex items-start gap-4">
              <div class="w-12 h-12 rounded-2xl bg-brand-50 dark:bg-brand-950/60 text-brand-500 flex items-center justify-center text-2xl shrink-0 shadow-sm">
                📞
              </div>
              <div>
                <span class="block text-xs font-bold uppercase text-slate-400">Call Any Time</span>
                <a href="tel:786-244-5823" class="text-lg font-bold text-slate-900 dark:text-white hover:text-brand-500 transition font-sans">
                  786-244-5823
                </a>
                <p class="text-xs text-slate-500 mt-0.5">Monday – Friday: 9:00 AM – 6:00 PM</p>
              </div>
            </div>

            <!-- بطاقة البريد الإلكتروني -->
            <div class="flex items-start gap-4">
              <div class="w-12 h-12 rounded-2xl bg-sky-50 dark:bg-sky-950/60 text-sky-500 flex items-center justify-center text-2xl shrink-0 shadow-sm">
                ✉️
              </div>
              <div>
                <span class="block text-xs font-bold uppercase text-slate-400">Email Address</span>
                <a href="mailto:Info@HamdanTax.com" class="text-lg font-bold text-slate-900 dark:text-white hover:text-brand-500 transition font-sans">
                  Info@HamdanTax.com
                </a>
                <p class="text-xs text-slate-500 mt-0.5">Fast response within 24 business hours</p>
              </div>
            </div>

            <!-- بطاقة الموقع -->
            <div class="flex items-start gap-4">
              <div class="w-12 h-12 rounded-2xl bg-blue-50 dark:bg-blue-950/60 text-blue-600 flex items-center justify-center text-2xl shrink-0 shadow-sm">
                📍
              </div>
              <div>
                <span class="block text-xs font-bold uppercase text-slate-400">Office Location</span>
                <span class="text-lg font-bold text-slate-900 dark:text-white">
                  Hallandale Beach, FL
                </span>
                <p class="text-xs text-slate-500 mt-0.5">Serving clients nationwide remotely & locally</p>
              </div>
            </div>

            <!-- بطاقة واتساب السريعة -->
            <div class="pt-4 border-t border-slate-100 dark:border-slate-800">
              <a
                href="https://wa.me/17862445823?text=Hello%20Hamdan%20Tax,%20I%20would%20like%20to%20inquire%20about%20your%20services."
                target="_blank"
                class="w-full py-3.5 px-6 rounded-2xl bg-[#25D366] hover:bg-[#20ba59] text-white font-bold text-sm flex items-center justify-center gap-2 shadow-lg shadow-emerald-500/20 transition"
              >
                <span>💬 Chat with an Advisor on WhatsApp</span>
              </a>
            </div>
          </div>
        </div>

        <!-- نموذج التواصل Form -->
        <div class="lg:col-span-7" data-aos="fade-left">
          <ContactForm />
        </div>
      </div>
    </section>

    <!-- بطاقة الخريطة والاتجاهات التفاعلية -->
    <section class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mb-12" data-aos="fade-up">
      <div class="rounded-3xl bg-slate-900 text-white p-8 sm:p-12 shadow-2xl border border-slate-800 flex flex-col md:flex-row items-center justify-between gap-8">
        <div>
          <span class="text-xs uppercase tracking-widest text-brand-300 font-bold">Location & Access</span>
          <h3 class="text-2xl sm:text-3xl font-black mt-2 mb-3">Visit Hamdan Tax in Hallandale Beach</h3>
          <p class="text-slate-400 text-sm max-w-xl">
            We welcome in-person appointments at our Hallandale Beach office, as well as seamless digital consultations for clients throughout Florida and across the US.
          </p>
        </div>
        <a
          href="https://maps.google.com/?q=Hallandale+Beach+FL"
          target="_blank"
          class="px-8 py-4 rounded-2xl bg-brand-500 hover:bg-brand-600 text-white font-bold text-sm shrink-0 shadow-lg shadow-brand-500/30 transition"
        >
          Open in Google Maps ↗
        </a>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
// صفحة اتصل بنا
</script>
