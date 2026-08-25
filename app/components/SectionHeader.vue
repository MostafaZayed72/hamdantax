<template>
  <div class="text-center max-w-3xl mx-auto mb-16" :data-aos="aosAnimation || 'fade-up'">
    <!-- الشارة Badge -->
    <span
      v-if="badge"
      class="inline-block px-4 py-1.5 rounded-full text-xs font-bold uppercase tracking-wider bg-brand-50 dark:bg-brand-950/60 text-brand-600 dark:text-brand-300 border border-brand-500/20 mb-3"
    >
      {{ badge }}
    </span>

    <!-- العنوان Title -->
    <h2 class="text-3xl sm:text-4xl lg:text-5xl font-black tracking-tight text-slate-900 dark:text-white leading-tight mb-4">
      <slot name="title">{{ title }}</slot>
    </h2>

    <!-- النص الفرعي Subtitle -->
    <p v-if="subtitle" class="text-base sm:text-lg text-slate-600 dark:text-slate-400 font-medium leading-relaxed">
      {{ subtitle }}
    </p>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  badge?: string
  title?: string
  subtitle?: string
  aosAnimation?: string
}>()
</script>
