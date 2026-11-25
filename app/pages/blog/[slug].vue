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

      <!-- عنوان وتفاصيل المقال -->
      <header class="mb-10 text-center" data-aos="fade-up">
        <span class="inline-block px-4 py-1.5 rounded-full text-xs font-bold text-brand-600 dark:text-brand-400 bg-brand-50 dark:bg-brand-950/60 border border-brand-500/20 mb-4 tracking-wide uppercase">
          {{ post.category }}
        </span>
        <h1 class="text-3xl sm:text-5xl font-black text-slate-900 dark:text-white leading-tight mb-4">
          {{ post.title }}
        </h1>
        <p class="text-lg sm:text-xl text-slate-600 dark:text-slate-400 mb-6 max-w-3xl mx-auto leading-relaxed">
          {{ post.subtitle }}
        </p>
        <div class="flex flex-wrap items-center justify-center gap-3 sm:gap-6 text-xs sm:text-sm text-slate-500 font-medium">
          <span class="flex items-center gap-1.5">
            <svg class="w-4 h-4 text-brand-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
            {{ post.date }}
          </span>
          <span>•</span>
          <span class="flex items-center gap-1.5">
            <svg class="w-4 h-4 text-brand-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
            {{ post.readTime }}
          </span>
          <span>•</span>
          <span class="flex items-center gap-1.5">
            <svg class="w-4 h-4 text-brand-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg>
            {{ post.author }}
          </span>
        </div>
      </header>

      <!-- صورة المقال الرئيسية مع بيانات SEO بديلة -->
      <div class="rounded-3xl overflow-hidden shadow-2xl mb-10 border border-slate-200/80 dark:border-slate-800" data-aos="zoom-in">
        <img 
          :src="post.image" 
          :alt="post.title" 
          class="w-full h-auto max-h-[500px] object-cover" 
          loading="eager"
        />
      </div>

      <!-- صندوق أهم النقاط السريعة Key Takeaways للظهور في مقتطفات جوجل (Google Featured Snippets) -->
      <section v-if="post.keyTakeaways && post.keyTakeaways.length" class="mb-12 p-6 sm:p-8 rounded-3xl bg-brand-50/60 dark:bg-slate-900 border border-brand-500/20 shadow-sm" data-aos="fade-up">
        <h3 class="text-lg font-black text-slate-900 dark:text-white flex items-center gap-2.5 mb-4">
          <span class="p-1.5 rounded-lg bg-brand-500 text-white">
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"/></svg>
          </span>
          Key Takeaways (Executive Summary)
        </h3>
        <ul class="space-y-3">
          <li v-for="(takeaway, idx) in post.keyTakeaways" :key="idx" class="flex items-start gap-3 text-sm sm:text-base text-slate-700 dark:text-slate-300">
            <span class="text-emerald-500 font-bold shrink-0 mt-0.5">✓</span>
            <span>{{ takeaway }}</span>
          </li>
        </ul>
      </section>

      <!-- محتوى المقال (سواء HTML منسق أو فقرات قياسية) -->
      <div 
        v-if="post.htmlContent" 
        v-html="post.htmlContent" 
        class="prose dark:prose-invert max-w-none text-slate-700 dark:text-slate-300 space-y-6 text-base sm:text-lg leading-relaxed mb-16" 
        data-aos="fade-up"
      ></div>

      <div 
        v-else 
        class="prose dark:prose-invert max-w-none text-slate-700 dark:text-slate-300 space-y-6 text-base sm:text-lg leading-relaxed mb-16" 
        data-aos="fade-up"
      >
        <p v-for="(paragraph, idx) in post.content" :key="idx" class="leading-relaxed">
          {{ paragraph }}
        </p>
      </div>

      <!-- قسم الأسئلة الشائعة مع دعم Schema لنتائج بحث جوجل -->
      <section v-if="post.faqs && post.faqs.length" class="mb-16 p-8 rounded-3xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-xl" data-aos="fade-up">
        <div class="mb-6">
          <span class="text-xs font-bold uppercase tracking-wider text-brand-600 dark:text-brand-400">Knowledge Hub</span>
          <h3 class="text-2xl font-black text-slate-900 dark:text-white mt-1">Frequently Asked Questions</h3>
          <p class="text-sm text-slate-500 mt-1">Common small business bookkeeping and tax advisory inquiries answered by our CPAs.</p>
        </div>

        <div class="space-y-3">
          <div 
            v-for="(faq, fIndex) in post.faqs" 
            :key="fIndex" 
            class="rounded-2xl border border-slate-200/80 dark:border-slate-800 overflow-hidden transition"
          >
            <button 
              @click="toggleFaq(fIndex)" 
              class="w-full p-4 sm:p-5 text-left font-bold text-slate-900 dark:text-white flex items-center justify-between gap-4 hover:bg-slate-50 dark:hover:bg-slate-800/50 transition"
            >
              <span class="text-base sm:text-lg">{{ faq.question }}</span>
              <svg 
                :class="{'rotate-180 text-brand-500': openFaqs.includes(fIndex)}" 
                class="w-5 h-5 text-slate-400 shrink-0 transition-transform duration-200" 
                fill="none" 
                stroke="currentColor" 
                viewBox="0 0 24 24"
              >
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
              </svg>
            </button>
            <div 
              v-show="openFaqs.includes(fIndex)" 
              class="px-5 pb-5 pt-1 text-sm sm:text-base text-slate-600 dark:text-slate-400 leading-relaxed border-t border-slate-100 dark:border-slate-800/60 bg-slate-50/50 dark:bg-slate-800/20"
            >
              {{ faq.answer }}
            </div>
          </div>
        </div>
      </section>

      <!-- مشاركة المقال على شبكات التواصل Social Sharing -->
      <div class="mb-12 p-6 rounded-2xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-800 flex flex-col sm:flex-row items-center justify-between gap-4" data-aos="fade-up">
        <span class="text-sm font-bold text-slate-800 dark:text-slate-200">Share this guide with your business network:</span>
        <div class="flex items-center gap-3">
          <button 
            @click="copyArticleLink" 
            class="px-4 py-2 rounded-xl text-xs font-bold bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-700 dark:text-slate-300 hover:text-brand-500 transition shadow-sm"
          >
            {{ copied ? 'Link Copied! ✓' : 'Copy Link' }}
          </button>
        </div>
      </div>

      <!-- بطاقة الكاتب و CTA المباشر لطلب استشارة -->
      <div class="p-8 sm:p-10 rounded-3xl bg-gradient-to-br from-slate-900 via-slate-950 to-brand-950 text-white shadow-2xl mb-16 flex flex-col md:flex-row items-center justify-between gap-8" data-aos="fade-up">
        <div class="flex items-center gap-5">
          <div class="w-16 h-16 rounded-2xl bg-gradient-to-tr from-brand-500 to-sky-400 text-white font-black text-2xl flex items-center justify-center shadow-lg shadow-brand-500/40 shrink-0">
            H
          </div>
          <div>
            <span class="text-xs font-semibold text-brand-300 uppercase tracking-wider">Expert Advisory</span>
            <h4 class="text-xl font-bold">{{ post.author }}</h4>
            <p class="text-xs text-slate-300 mt-1 max-w-md">Certified Accounting, IRS Representation & Small Business Bookkeeping Specialists in Hallandale Beach, Florida.</p>
          </div>
        </div>
        <NuxtLink
          to="/contact-us"
          class="w-full md:w-auto px-8 py-4 rounded-xl bg-gradient-to-r from-brand-500 to-sky-500 hover:from-brand-600 hover:to-sky-600 text-white font-extrabold text-sm shadow-xl shadow-brand-500/25 transition-all text-center whitespace-nowrap hover:-translate-y-0.5"
        >
          Book a Free Consultation
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
              placeholder="Your comment or bookkeeping questions here..."
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
            class="px-8 py-3.5 rounded-xl bg-brand-500 hover:bg-brand-600 text-white font-bold text-sm shadow-md transition cursor-pointer"
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

// التفاعل مع الأسئلة الشائعة FAQ Accordion
const openFaqs = ref<number[]>([0])
const toggleFaq = (index: number) => {
  if (openFaqs.value.includes(index)) {
    openFaqs.value = openFaqs.value.filter((i) => i !== index)
  } else {
    openFaqs.value.push(index)
  }
}

// نسخ الرابط
const copied = ref(false)
const copyArticleLink = () => {
  if (import.meta.client) {
    navigator.clipboard.writeText(window.location.href)
    copied.value = true
    setTimeout(() => {
      copied.value = false
    }, 2500)
  }
}

// التعليقات
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

// إعداد بيانات السيو الشاملة (SEO Meta Tags & Social Graphs)
useSeoMeta({
  title: () => post.value ? (post.value.metaTitle || `${post.value.title} | Hamdan Tax`) : 'Article | Hamdan Tax',
  description: () => post.value?.metaDescription || post.value?.excerpt || '',
  keywords: () => post.value?.keywords?.join(', ') || '',
  ogTitle: () => post.value?.metaTitle || post.value?.title || '',
  ogDescription: () => post.value?.metaDescription || post.value?.excerpt || '',
  ogImage: () => post.value?.image || 'https://hamdantax.vercel.app/logo.png',
  ogType: 'article',
  ogSiteName: 'Hamdan Tax Certified Accounting & Advisory',
  twitterCard: 'summary_large_image',
  twitterTitle: () => post.value?.metaTitle || post.value?.title || '',
  twitterDescription: () => post.value?.metaDescription || post.value?.excerpt || '',
  twitterImage: () => post.value?.image || 'https://hamdantax.vercel.app/logo.png'
})

// بناء المخطط الهيكلي لقوقل (JSON-LD Schema for Google Rich Results)
useHead(() => {
  if (!post.value) return {}

  const currentUrl = `https://hamdantax.vercel.app/blog/${post.value.slug}`

  const schemaArticle = {
    '@context': 'https://schema.org',
    '@type': 'Article',
    mainEntityOfPage: {
      '@type': 'WebPage',
      '@id': currentUrl
    },
    headline: post.value.title,
    description: post.value.metaDescription || post.value.excerpt,
    image: post.value.image,
    author: {
      '@type': 'Organization',
      name: post.value.author,
      url: 'https://hamdantax.vercel.app/'
    },
    publisher: {
      '@type': 'Organization',
      name: 'Hamdan Tax Certified Accounting & Advisory',
      logo: {
        '@type': 'ImageObject',
        url: 'https://hamdantax.vercel.app/logo.png'
      }
    },
    datePublished: '2026-11-25T08:00:00+00:00',
    dateModified: '2026-11-25T08:00:00+00:00'
  }

  const breadcrumbsSchema = {
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: [
      {
        '@type': 'ListItem',
        position: 1,
        name: 'Home',
        item: 'https://hamdantax.vercel.app/'
      },
      {
        '@type': 'ListItem',
        position: 2,
        name: 'Blog',
        item: 'https://hamdantax.vercel.app/blog'
      },
      {
        '@type': 'ListItem',
        position: 3,
        name: post.value.title,
        item: currentUrl
      }
    ]
  }

  // مخطط الأسئلة الشائعة إن وجدت لظهورها مباشرة في بحث قوقل
  const schemas: any[] = [schemaArticle, breadcrumbsSchema]
  if (post.value.faqs && post.value.faqs.length) {
    const faqSchema = {
      '@context': 'https://schema.org',
      '@type': 'FAQPage',
      mainEntity: post.value.faqs.map((faq) => ({
        '@type': 'Question',
        name: faq.question,
        acceptedAnswer: {
          '@type': 'Answer',
          text: faq.answer
        }
      }))
    }
    schemas.push(faqSchema)
  }

  return {
    link: [{ rel: 'canonical', href: currentUrl }],
    script: schemas.map((schema) => ({
      type: 'application/ld+json',
      children: JSON.stringify(schema)
    }))
  }
})
</script>
