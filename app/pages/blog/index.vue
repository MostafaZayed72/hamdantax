<template>
  <div class="py-12">
    <!-- رأس صفحة المدونة -->
    <section class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mb-16 text-center" data-aos="fade-up">
      <span class="inline-block px-4 py-1.5 rounded-full text-xs font-bold uppercase tracking-wider bg-brand-50 dark:bg-brand-950/60 text-brand-600 dark:text-brand-300 border border-brand-500/20 mb-4">
        ARTICLE & NEWS
      </span>
      <h1 class="text-4xl sm:text-6xl font-black text-slate-900 dark:text-white leading-tight mb-6">
        Tax Insights & Financial Strategies
      </h1>
      <p class="text-lg sm:text-xl text-slate-600 dark:text-slate-300 max-w-3xl mx-auto leading-relaxed mb-8">
        We specialize in providing comprehensive financial advice and actionable insights tailored to help businesses and individuals thrive.
      </p>

      <!-- شريط البحث والفلترة -->
      <div class="max-w-md mx-auto">
        <div class="relative">
          <input
            v-model="searchQuery"
            type="text"
            placeholder="Search articles & topics..."
            class="w-full px-5 py-3.5 pl-11 rounded-2xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 text-slate-900 dark:text-white placeholder-slate-400 focus:outline-none focus:border-brand-500 focus:ring-2 focus:ring-brand-500/20 shadow-md transition"
          />
          <svg class="w-5 h-5 text-slate-400 absolute left-4 top-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
          </svg>
        </div>
      </div>
    </section>

    <!-- شبكة المقالات 3D Grid -->
    <section class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mb-24">
      <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
        <article
          v-for="(post, index) in filteredPosts"
          :key="post.slug"
          class="rounded-3xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 overflow-hidden shadow-xl hover:shadow-2xl hover:border-brand-500/50 transition-all duration-300 hover:-translate-y-2 flex flex-col group"
          data-aos="fade-up"
          :data-aos-delay="index * 100"
        >
          <!-- صورة المقال -->
          <div class="relative h-60 overflow-hidden bg-slate-800">
            <img
              :src="post.image"
              :alt="post.title"
              class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
            />
            <div class="absolute inset-0 bg-gradient-to-t from-slate-950/80 via-transparent to-transparent"></div>
            <div class="absolute bottom-4 left-4 right-4 flex items-center justify-between text-xs text-white font-medium">
              <span class="px-3 py-1 rounded-full bg-brand-500/90 backdrop-blur font-bold">
                {{ post.category }}
              </span>
              <span class="bg-black/40 backdrop-blur px-2.5 py-1 rounded-md">
                {{ post.readTime }}
              </span>
            </div>
          </div>

          <!-- تفاصيل المقال -->
          <div class="p-8 flex-1 flex flex-col justify-between space-y-6">
            <div class="space-y-3">
              <div class="text-xs text-slate-500 dark:text-slate-400 font-semibold">
                {{ post.date }} • By {{ post.author }}
              </div>
              <h2 class="text-2xl font-black text-slate-900 dark:text-white group-hover:text-brand-500 dark:group-hover:text-brand-400 transition-colors leading-snug">
                <NuxtLink :to="`/blog/${post.slug}`">{{ post.title }}</NuxtLink>
              </h2>
              <p class="text-slate-600 dark:text-slate-300 text-sm leading-relaxed">
                {{ post.excerpt }}
              </p>
            </div>

            <div class="pt-4 border-t border-slate-100 dark:border-slate-800 flex items-center justify-between">
              <NuxtLink
                :to="`/blog/${post.slug}`"
                class="inline-flex items-center gap-2 font-bold text-sm text-brand-500 hover:text-brand-600 group-hover:gap-3 transition-all"
              >
                <span>Read Full Article</span>
                <span>→</span>
              </NuxtLink>
            </div>
          </div>
        </article>
      </div>

      <!-- حالة عدم وجود نتائج -->
      <div v-if="filteredPosts.length === 0" class="text-center py-16 text-slate-500">
        <p class="text-lg">No articles found matching "{{ searchQuery }}".</p>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
const { posts } = useBlogPosts()
const searchQuery = ref('')

const filteredPosts = computed(() => {
  if (!searchQuery.value.trim()) return posts
  const q = searchQuery.value.toLowerCase()
  return posts.filter(
    (p) =>
      p.title.toLowerCase().includes(q) ||
      p.excerpt.toLowerCase().includes(q) ||
      p.category.toLowerCase().includes(q)
  )
})

useSeoMeta({
  title: 'Tax Insights, Bookkeeping & Financial Strategies | Hamdan Tax Blog',
  description: 'Expert guidance on small business bookkeeping, LLC formation, IRS tax representation, and strategic accounting in Hallandale Beach, Florida.',
  keywords: 'business bookkeeping, small business tax planning, IRS tax laws, LLC formation, accounting advice Florida, Hamdan Tax',
  ogTitle: 'Tax Insights & Bookkeeping Strategies | Hamdan Tax Blog',
  ogDescription: 'Expert guidance on business bookkeeping, IRS compliance, and strategic financial management.',
  ogImage: 'https://images.unsplash.com/photo-1554224154-26032ffc0d07?auto=format&fit=crop&w=1200&q=80',
  ogType: 'website',
  twitterCard: 'summary_large_image'
})
</script>
