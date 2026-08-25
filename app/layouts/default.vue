<template>
  <div class="min-h-screen flex flex-col bg-slate-50 dark:bg-slate-950 text-slate-900 dark:text-slate-100 transition-colors duration-300 font-tajawal antialiased selection:bg-brand-500 selection:text-white overflow-x-hidden w-full max-w-full">
    <!-- النافبار العلوي -->
    <AppNavbar />

    <!-- المحتوى الرئيسي للصفحة -->
    <main class="flex-1 w-full max-w-full overflow-x-hidden">
      <slot />
    </main>

    <!-- الفوتر السفلي -->
    <AppFooter />

    <!-- الأزرار الثابتة: واتساب والصعود للأعلى -->
    <FloatingWidgets />
  </div>
</template>

<script setup lang="ts">
// تهيئة التخطيط العام
</script>
