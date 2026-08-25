<template>
  <div class="max-w-4xl mx-auto space-y-4" data-aos="fade-up">
    <div
      v-for="(faq, index) in items"
      :key="index"
      class="rounded-2xl border transition-all duration-200 overflow-hidden shadow-sm"
      :class="isOpen(index) ? 'bg-white dark:bg-slate-900 border-brand-500 shadow-md shadow-brand-500/5 ring-1 ring-brand-500/30' : 'bg-white dark:bg-slate-900/60 border-slate-200 dark:border-slate-800 hover:border-brand-300 dark:hover:border-slate-700'"
    >
      <!-- زر السؤال الرئيسي -->
      <button
        type="button"
        @click="toggle(index)"
        class="w-full px-6 py-5 flex items-center justify-between text-left gap-4 transition-colors cursor-pointer select-none"
        :aria-expanded="isOpen(index)"
      >
        <span class="font-extrabold text-base sm:text-lg text-slate-900 dark:text-white flex items-center gap-3">
          <span class="w-2.5 h-2.5 rounded-full bg-brand-500 shrink-0"></span>
          {{ faq.question }}
        </span>
        <div
          class="w-8 h-8 rounded-full flex items-center justify-center shrink-0 transition-transform duration-300 shadow-sm"
          :class="isOpen(index) ? 'bg-brand-500 text-white rotate-180' : 'bg-slate-100 dark:bg-slate-800 text-slate-500 dark:text-slate-400'"
        >
          <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M19 9l-7 7-7-7"/>
          </svg>
        </div>
      </button>

      <!-- نص الإجابة -->
      <div
        v-show="isOpen(index)"
        class="px-6 pb-6 pt-2 text-slate-600 dark:text-slate-300 text-sm sm:text-base leading-relaxed border-t border-slate-100 dark:border-slate-800/80"
      >
        {{ faq.answer }}
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import AOS from 'aos'

interface FaqItem {
  question: string
  answer: string
}

const props = defineProps<{
  items: FaqItem[]
}>()

// مصفوفة الفهارس المفتوحة - العنصر الأول مفتوح افتراضياً
const openIndices = ref<number[]>([0])

const isOpen = (idx: number) => openIndices.value.includes(idx)

const toggle = (idx: number) => {
  if (openIndices.value.includes(idx)) {
    openIndices.value = openIndices.value.filter((i) => i !== idx)
  } else {
    openIndices.value.push(idx)
  }

  // تحديث حسابات أبعاد الشاشة لـ AOS عند تغير الارتفاع
  if (import.meta.client && typeof window !== 'undefined') {
    nextTick(() => {
      try {
        AOS.refresh()
      } catch (e) {}
    })
  }
}
</script>
