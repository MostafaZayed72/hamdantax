<template>
  <div class="py-12">
    <article v-if="post" class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
      <!-- مسار التنقل Breadcrumb -->
      <nav class="flex items-center gap-2 text-xs font-semibold text-slate-500 mb-8" data-aos="fade-up">
        <NuxtLink to="/" class="hover:text-brand-500">Home</NuxtLink>
        <span>/</span>
        <NuxtLink to="/blog" class="hover:text-brand-500">Blog</NuxtLink>
        <span>/</span>
        <span class="text-slate-900 dark:text-white truncate">{{ post.title }}</span>
      </nav>

      <!-- عنوان المقال -->
      <header class="mb-10 text-center" data-aos="fade-up">
        <span class="inline-block px-4 py-1 rounded-full text-xs font-bold text-brand-600 dark:text-brand-400 bg-brand-50 dark:bg-brand-950/60 border border-brand-500/20 mb-4">
          {{ post.category }}
        </span>
        <h1 class="text-3xl sm:text-5xl font-black text-slate-900 dark:text-white leading-tight mb-4">
          {{ post.title }}
        </h1>
        <p class="text-lg text-slate-600 dark:text-slate-400 mb-6">
          {{ post.subtitle }}
        </p>
        <div class="flex items-center justify-center gap-4 text-xs sm:text-sm text-slate-500 font-medium">
          <span>📅 {{ post.date }}</span>
          <span>•</span>
          <span>⏱️ {{ post.readTime }}</span>
          <span>•</span>
          <span>✍️ {{ post.author }}</span>
        </div>
      </header>

      <!-- صورة المقال الرئيسية -->
      <div class="rounded-3xl overflow-hidden shadow-2xl mb-12" data-aos="zoom-in">
        <img :src="post.image" :alt="post.title" class="w-full h-auto max-h-[480px] object-cover" />
      </div>

      <!-- محتوى المقال -->
      <div class="prose dark:prose-invert max-w-none text-slate-700 dark:text-slate-300 space-y-6 text-base sm:text-lg leading-relaxed mb-16" data-aos="fade-up">
        <p v-for="(paragraph, idx) in post.content" :key="idx" class="leading-relaxed">
          {{ paragraph }}
        </p>
      </div>

      <!-- بطاقة الكاتب و CTA -->
      <div class="p-8 rounded-3xl bg-slate-100 dark:bg-slate-900 border border-slate-200 dark:border-slate-800 mb-16 flex flex-col sm:flex-row items-center justify-between gap-6" data-aos="fade-up">
        <div class="flex items-center gap-4">
          <div class="w-14 h-14 rounded-2xl bg-brand-500 text-white font-black text-2xl flex items-center justify-center shadow-lg shadow-brand-500/30">
            H
          </div>
          <div>
            <h4 class="font-bold text-slate-900 dark:text-white">{{ post.author }}</h4>
            <p class="text-xs text-slate-500">Hamdan Tax Certified Advisory Team</p>
          </div>
        </div>
        <NuxtLink
          to="/contact-us"
          class="px-6 py-3 rounded-xl bg-brand-500 hover:bg-brand-600 text-white font-bold text-sm shadow-md transition"
        >
          Book Consultation
        </NuxtLink>
      </div>

      <!-- قسم التعليقات Comments Section -->
      <section class="p-8 sm:p-10 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-xl mb-16" data-aos="fade-up">
        <h3 class="text-2xl font-black text-slate-900 dark:text-white mb-2">Leave a Reply</h3>
        <p class="text-xs text-slate-500 mb-6">Your email address will not be published. Required fields are marked *</p>

        <form @submit.prevent="handleComment" class="space-y-4">
          <div>
            <textarea
              v-model="commentText"
              rows="4"
              required
              placeholder="Your comment here..."
              class="w-full px-4 py-3 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-900 dark:text-white text-sm focus:outline-none focus:border-brand-500 resize-none"
            ></textarea>
          </div>
          <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <input
              v-model="commentName"
              type="text"
              required
              placeholder="Name *"
              class="w-full px-4 py-3 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-900 dark:text-white text-sm focus:outline-none focus:border-brand-500"
            />
            <input
              v-model="commentEmail"
              type="email"
              required
              placeholder="Email *"
              class="w-full px-4 py-3 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-900 dark:text-white text-sm focus:outline-none focus:border-brand-500"
            />
          </div>
          <button
            type="submit"
            class="px-8 py-3.5 rounded-xl bg-brand-500 hover:bg-brand-600 text-white font-bold text-sm shadow-md transition"
          >
            {{ commentPosted ? 'Comment Submitted ✓' : 'Post Comment' }}
          </button>
        </form>
      </section>

      <!-- زر العودة لجميع المقالات -->
      <div class="text-center">
        <NuxtLink
          to="/blog"
          class="inline-flex items-center gap-2 font-bold text-sm text-brand-500 hover:underline"
        >
          <span>← Back to All Articles</span>
        </NuxtLink>
      </div>
    </article>

    <!-- في حال عدم وجود المقال -->
    <div v-else class="max-w-md mx-auto text-center py-20">
      <h2 class="text-2xl font-bold mb-4">Article Not Found</h2>
      <NuxtLink to="/blog" class="px-6 py-3 rounded-xl bg-brand-500 text-white font-bold inline-block">
        Return to Blog
      </NuxtLink>
    </div>
  </div>
</template>

<script setup lang="ts">
const route = useRoute()
const { getPostBySlug } = useBlogPosts()

const post = computed(() => getPostBySlug(route.params.slug as string))

const commentText = ref('')
const commentName = ref('')
const commentEmail = ref('')
const commentPosted = ref(false)

const handleComment = () => {
  if (commentText.value && commentName.value) {
    commentPosted.value = true
    commentText.value = ''
    commentName.value = ''
    commentEmail.value = ''
    setTimeout(() => {
      commentPosted.value = false
    }, 4000)
  }
}
</script>
