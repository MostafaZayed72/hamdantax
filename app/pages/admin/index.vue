<template>
  <NuxtLayout name="admin">
    <!-- شاشة تسجيل الدخول في حال لم يكن المستخدم مسجلاً -->
    <div v-if="!isAuthenticated" class="min-h-[70vh] flex items-center justify-center py-12 px-4">
      <div class="w-full max-w-md bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-3xl p-6 sm:p-8 shadow-2xl shadow-slate-200/50 dark:shadow-none space-y-6 relative overflow-hidden">
        <!-- إضاءة خلفية -->
        <div class="absolute -top-12 -left-12 w-44 h-44 bg-brand-500/10 rounded-full blur-2xl pointer-events-none"></div>

        <div class="text-center space-y-2">
          <div class="w-14 h-14 mx-auto rounded-2xl bg-gradient-to-tr from-brand-600 to-sky-500 text-white flex items-center justify-center shadow-lg shadow-brand-500/25">
            <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
            </svg>
          </div>
          <h2 class="text-xl sm:text-2xl font-black text-slate-900 dark:text-white">تسجيل الدخول للوحة الإدارة</h2>
          <p class="text-xs text-slate-500 dark:text-slate-400">
            أدخل بيانات الدخول المصرح بها للوصول إلى حجوزات العملاء
          </p>
        </div>

        <form @submit.prevent="handleLogin" class="space-y-4">
          <!-- رسالة الخطأ -->
          <div v-if="loginError" class="p-3.5 rounded-xl bg-rose-500/10 border border-rose-500/20 text-rose-600 dark:text-rose-400 text-xs font-bold flex items-center gap-2">
            <svg class="w-4 h-4 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <span>{{ loginError }}</span>
          </div>

          <div>
            <label class="block text-xs font-bold uppercase tracking-wider text-slate-700 dark:text-slate-300 mb-1.5">
              اسم المستخدم
            </label>
            <input
              v-model="loginUsername"
              type="text"
              required
              autocomplete="username"
              placeholder="مثال: admin"
              class="w-full px-4 py-3 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-900 dark:text-white text-sm focus:outline-none focus:border-brand-500 focus:ring-2 focus:ring-brand-500/20 transition font-mono"
            />
          </div>

          <div>
            <label class="block text-xs font-bold uppercase tracking-wider text-slate-700 dark:text-slate-300 mb-1.5">
              كلمة المرور
            </label>
            <div class="relative">
              <input
                v-model="loginPassword"
                :type="showPassword ? 'text' : 'password'"
                required
                autocomplete="current-password"
                placeholder="•••••"
                class="w-full pr-4 pl-11 py-3 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-900 dark:text-white text-sm focus:outline-none focus:border-brand-500 focus:ring-2 focus:ring-brand-500/20 transition font-mono"
              />
              <button
                type="button"
                @click="showPassword = !showPassword"
                class="absolute inset-y-0 left-0 pl-3.5 flex items-center text-slate-400 hover:text-slate-600 dark:hover:text-slate-200 transition"
                tabindex="-1"
              >
                <svg v-if="showPassword" class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l18 18" />
                </svg>
                <svg v-else class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                </svg>
              </button>
            </div>
          </div>

          <button
            type="submit"
            :disabled="loginSubmitting"
            class="w-full py-3.5 rounded-xl bg-gradient-to-r from-brand-600 to-sky-600 hover:from-brand-700 hover:to-sky-700 text-white font-black text-sm shadow-xl shadow-brand-500/25 transition disabled:opacity-60 flex items-center justify-center gap-2"
          >
            <svg v-if="loginSubmitting" class="w-4 h-4 animate-spin text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
            </svg>
            <span>{{ loginSubmitting ? 'جارٍ التحقق...' : 'دخول لوحة التحكم' }}</span>
          </button>
        </form>
      </div>
    </div>

    <!-- المحتوى الفعلي للوحة التحكم عند تسجيل الدخول -->
    <div v-else class="space-y-6">
      <!-- تنبيه حالة الربط مع سوبابيس -->
      <div
        v-if="!isConfigured"
        class="p-4 rounded-2xl bg-amber-500/10 border border-amber-500/20 text-amber-800 dark:text-amber-200 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3"
      >
        <div class="flex items-center gap-3">
          <div class="p-2 rounded-xl bg-amber-500/20 text-amber-600 dark:text-amber-300">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
          </div>
          <div>
            <p class="text-sm font-bold">لوحة التحكم تعمل حالياً ببيانات تجريبية محلية</p>
            <p class="text-xs text-amber-700/80 dark:text-amber-300/80">
              لم يتم ربط مفاتيح سوبابيس بعد. يمكنك إدخال الرابط والمفتاح الآن لربط البيانات الحية وتفعيل ان8ان.
            </p>
          </div>
        </div>
        <button
          @click="showConfigModal = true"
          class="px-4 py-2 rounded-xl bg-amber-600 hover:bg-amber-700 text-white text-xs font-bold transition shadow-sm"
        >
          إعداد الربط الآن
        </button>
      </div>

      <div
        v-else
        class="p-4 rounded-2xl bg-emerald-500/10 border border-emerald-500/20 text-emerald-800 dark:text-emerald-200 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3"
      >
        <div class="flex items-center gap-3">
          <div class="w-2.5 h-2.5 rounded-full bg-emerald-500 animate-pulse"></div>
          <div>
            <span class="text-xs font-bold">قاعدة بيانات سوبابيس متصلة بنجاح ومزامنة فورية نشطة</span>
            <span class="text-xs opacity-70 block sm:inline sm:mr-2">({{ supabaseUrl }})</span>
          </div>
        </div>
        <button
          @click="showConfigModal = true"
          class="text-xs font-bold text-emerald-700 dark:text-emerald-300 hover:underline"
        >
          تعديل مفاتيح الربط
        </button>
      </div>

      <!-- ترويسة الصفحة والإجراءات الرئيسية -->
      <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <h1 class="text-2xl sm:text-3xl font-black text-slate-900 dark:text-white">إدارة حجوزات العملاء</h1>
          <p class="text-sm text-slate-600 dark:text-slate-400 mt-1">
            متابعة وتحديث طلبات الاستشارات الضريبية والمحاسبية وإدارتها بكل سهولة
          </p>
        </div>

        <div class="flex flex-wrap items-center gap-2.5">
          <button
            @click="exportToCSV"
            class="px-3.5 py-2.5 rounded-xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900 hover:bg-slate-50 dark:hover:bg-slate-800/80 text-slate-700 dark:text-slate-300 text-xs font-bold flex items-center gap-2 transition"
          >
            <svg class="w-4 h-4 text-emerald-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
            </svg>
            <span>تصدير إكسل</span>
          </button>

          <button
            @click="fetchBookings"
            :disabled="loading"
            class="px-3.5 py-2.5 rounded-xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900 hover:bg-slate-50 dark:hover:bg-slate-800/80 text-slate-700 dark:text-slate-300 text-xs font-bold flex items-center gap-2 transition disabled:opacity-50"
          >
            <svg :class="{'animate-spin': loading}" class="w-4 h-4 text-brand-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
            </svg>
            <span>تحديث</span>
          </button>

          <button
            @click="openCreateModal"
            class="px-4 py-2.5 rounded-xl bg-gradient-to-r from-brand-600 to-sky-600 hover:from-brand-700 hover:to-sky-700 text-white text-xs sm:text-sm font-bold flex items-center gap-2 transition shadow-md shadow-brand-500/20"
          >
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
            </svg>
            <span>إضافة حجز يدوي</span>
          </button>
        </div>
      </div>

      <!-- إحصائيات سريعة -->
      <div class="grid grid-cols-2 lg:grid-cols-5 gap-3.5 sm:gap-5">
        <div class="p-4 sm:p-5 rounded-2xl bg-white dark:bg-slate-900 border border-slate-200/80 dark:border-slate-800 shadow-sm">
          <span class="text-xs font-bold text-slate-500 dark:text-slate-400">إجمالي الحجوزات</span>
          <div class="text-2xl sm:text-3xl font-black text-slate-900 dark:text-white mt-1">{{ stats.total }}</div>
        </div>

        <div class="p-4 sm:p-5 rounded-2xl bg-amber-500/5 border border-amber-500/20 shadow-sm">
          <span class="text-xs font-bold text-amber-600 dark:text-amber-400">قيد الانتظار</span>
          <div class="text-2xl sm:text-3xl font-black text-amber-600 dark:text-amber-400 mt-1">{{ stats.pending }}</div>
        </div>

        <div class="p-4 sm:p-5 rounded-2xl bg-sky-500/5 border border-sky-500/20 shadow-sm">
          <span class="text-xs font-bold text-sky-600 dark:text-sky-400">مؤكدة</span>
          <div class="text-2xl sm:text-3xl font-black text-sky-600 dark:text-sky-400 mt-1">{{ stats.confirmed }}</div>
        </div>

        <div class="p-4 sm:p-5 rounded-2xl bg-emerald-500/5 border border-emerald-500/20 shadow-sm">
          <span class="text-xs font-bold text-emerald-600 dark:text-emerald-400">مكتملة</span>
          <div class="text-2xl sm:text-3xl font-black text-emerald-600 dark:text-emerald-400 mt-1">{{ stats.completed }}</div>
        </div>

        <div class="p-4 sm:p-5 rounded-2xl bg-rose-500/5 border border-rose-500/20 shadow-sm col-span-2 lg:col-span-1">
          <span class="text-xs font-bold text-rose-600 dark:text-rose-400">ملغاة</span>
          <div class="text-2xl sm:text-3xl font-black text-rose-600 dark:text-rose-400 mt-1">{{ stats.cancelled }}</div>
        </div>
      </div>

      <!-- شريط البحث والفلترة -->
      <div class="p-4 rounded-2xl bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 shadow-sm flex flex-col md:flex-row items-stretch md:items-center justify-between gap-3">
        <!-- البحث بالاسم أو البريد أو الهاتف -->
        <div class="relative flex-1">
          <span class="absolute inset-y-0 right-0 pr-3.5 flex items-center pointer-events-none text-slate-400">
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
          </span>
          <input
            v-model="searchQuery"
            type="text"
            placeholder="البحث بالاسم، البريد الإلكتروني، أو رقم الهاتف..."
            class="w-full pr-10 pl-4 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-sm text-slate-900 dark:text-white placeholder-slate-400 focus:outline-none focus:border-brand-500 transition"
          />
        </div>

        <!-- فلتر الحالة -->
        <div class="flex items-center gap-2 overflow-x-auto pb-1 md:pb-0">
          <button
            v-for="filter in statusFilters"
            :key="filter.value"
            @click="selectedStatus = filter.value"
            :class="[
              selectedStatus === filter.value
                ? 'bg-brand-600 text-white shadow-sm'
                : 'bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-300 hover:bg-slate-200 dark:hover:bg-slate-700'
            ]"
            class="px-3 py-2 rounded-xl text-xs font-bold whitespace-nowrap transition"
          >
            {{ filter.label }}
          </button>
        </div>
      </div>

      <!-- جدول الحجوزات -->
      <div class="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-3xl overflow-hidden shadow-sm">
        <div class="overflow-x-auto">
          <table class="w-full text-right text-sm">
            <thead class="bg-slate-50 dark:bg-slate-800/60 border-b border-slate-200 dark:border-slate-800 text-xs text-slate-500 dark:text-slate-400 uppercase tracking-wider">
              <tr>
                <th class="px-5 py-4 font-bold">العميل</th>
                <th class="px-5 py-4 font-bold">الخدمة المطلوبة</th>
                <th class="px-5 py-4 font-bold">الموعد والتاريخ</th>
                <th class="px-5 py-4 font-bold">الحالة</th>
                <th class="px-5 py-4 font-bold">تاريخ الطلب</th>
                <th class="px-5 py-4 font-bold text-center">إجراءات</th>
              </tr>
            </thead>
            <tbody class="divide-y divide-slate-100 dark:divide-slate-800">
              <tr v-if="loading" class="animate-pulse">
                <td colspan="6" class="px-6 py-12 text-center text-slate-400">
                  <div class="flex items-center justify-center gap-2">
                    <svg class="w-5 h-5 animate-spin text-brand-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
                    </svg>
                    <span>جارٍ تحميل الحجوزات...</span>
                  </div>
                </td>
              </tr>

              <tr v-else-if="filteredBookings.length === 0">
                <td colspan="6" class="px-6 py-16 text-center text-slate-500 dark:text-slate-400">
                  <div class="w-16 h-16 mx-auto mb-3 rounded-full bg-slate-100 dark:bg-slate-800 flex items-center justify-center text-slate-400">
                    <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
                    </svg>
                  </div>
                  <p class="font-bold text-base text-slate-700 dark:text-slate-300">لا توجد حجوزات مطابقة</p>
                  <p class="text-xs text-slate-500 mt-1">جرّب تغيير كلمات البحث أو تغيير فلتر الحالة</p>
                </td>
              </tr>

              <tr
                v-for="booking in filteredBookings"
                :key="booking.id"
                class="hover:bg-slate-50/70 dark:hover:bg-slate-800/40 transition group"
              >
                <!-- معلومات العميل -->
                <td class="px-5 py-4">
                  <div class="font-bold text-slate-900 dark:text-white">{{ booking.name }}</div>
                  <div class="text-xs text-slate-500 dark:text-slate-400 flex flex-col gap-0.5 mt-0.5">
                    <span class="hover:text-brand-500 transition">{{ booking.email }}</span>
                    <span v-if="booking.phone" dir="ltr" class="text-right">{{ booking.phone }}</span>
                  </div>
                </td>

                <!-- الخدمة المطلوبة -->
                <td class="px-5 py-4">
                  <span class="inline-block px-2.5 py-1 rounded-lg text-xs font-semibold bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300">
                    {{ booking.service }}
                  </span>
                  <div v-if="booking.message" class="text-xs text-slate-500 dark:text-slate-400 truncate max-w-xs mt-1" :title="booking.message">
                    {{ booking.message }}
                  </div>
                </td>

                <!-- التاريخ والموعد -->
                <td class="px-5 py-4 text-xs">
                  <div class="font-semibold text-slate-800 dark:text-slate-200">
                    {{ booking.preferred_date || 'غير محدد' }}
                  </div>
                  <div class="text-slate-500 dark:text-slate-400 mt-0.5">
                    {{ booking.preferred_time || '--' }}
                  </div>
                </td>

                <!-- الحالة -->
                <td class="px-5 py-4">
                  <div class="relative inline-block text-right">
                    <select
                      :value="booking.status"
                      @change="handleQuickStatusChange(booking.id, ($event.target as HTMLSelectElement).value)"
                      :class="getStatusBadgeClass(booking.status)"
                      class="appearance-none pr-3 pl-7 py-1.5 rounded-xl text-xs font-bold border cursor-pointer focus:outline-none transition"
                    >
                      <option value="pending">قيد الانتظار</option>
                      <option value="confirmed">مؤكد</option>
                      <option value="completed">مكتمل</option>
                      <option value="cancelled">ملغي</option>
                    </select>
                    <span class="absolute inset-y-0 left-0 pl-2 flex items-center pointer-events-none">
                      <svg class="w-3.5 h-3.5 opacity-60" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                      </svg>
                    </span>
                  </div>
                </td>

                <!-- تاريخ الإنشاء -->
                <td class="px-5 py-4 text-xs text-slate-500 dark:text-slate-400 whitespace-nowrap">
                  {{ formatDate(booking.created_at) }}
                </td>

                <!-- أزرار الإجراءات -->
                <td class="px-5 py-4 text-center">
                  <div class="flex items-center justify-center gap-1.5">
                    <button
                      @click="openEditModal(booking)"
                      class="p-2 rounded-lg text-slate-500 hover:text-brand-600 hover:bg-brand-500/10 transition"
                      title="عرض وتعديل"
                    >
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                      </svg>
                    </button>
                    <button
                      @click="confirmDelete(booking)"
                      class="p-2 rounded-lg text-slate-500 hover:text-rose-600 hover:bg-rose-500/10 transition"
                      title="حذف الحجز"
                    >
                      <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                      </svg>
                    </button>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- نافذة إضافة أو تعديل حجز (Modal) -->
      <div
        v-if="showModal"
        class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-950/60 backdrop-blur-sm"
      >
        <div class="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-3xl w-full max-w-2xl max-h-[90vh] overflow-y-auto shadow-2xl p-6 sm:p-8 space-y-6">
          <div class="flex items-center justify-between border-b border-slate-100 dark:border-slate-800 pb-4">
            <h3 class="text-xl font-black text-slate-900 dark:text-white">
              {{ isEditing ? 'تعديل بيانات الحجز' : 'إضافة حجز جديد' }}
            </h3>
            <button
              @click="closeModal"
              class="p-2 rounded-xl text-slate-400 hover:text-slate-600 dark:hover:text-slate-200 hover:bg-slate-100 dark:hover:bg-slate-800 transition"
            >
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>

          <form @submit.prevent="saveBooking" class="space-y-4">
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
              <div>
                <label class="block text-xs font-bold uppercase text-slate-700 dark:text-slate-300 mb-1.5">اسم العميل *</label>
                <input
                  v-model="activeBooking.name"
                  type="text"
                  required
                  class="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-sm text-slate-900 dark:text-white focus:outline-none focus:border-brand-500"
                />
              </div>

              <div>
                <label class="block text-xs font-bold uppercase text-slate-700 dark:text-slate-300 mb-1.5">البريد الإلكتروني *</label>
                <input
                  v-model="activeBooking.email"
                  type="email"
                  required
                  class="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-sm text-slate-900 dark:text-white focus:outline-none focus:border-brand-500"
                />
              </div>

              <div>
                <label class="block text-xs font-bold uppercase text-slate-700 dark:text-slate-300 mb-1.5">رقم الهاتف</label>
                <input
                  v-model="activeBooking.phone"
                  type="tel"
                  dir="ltr"
                  placeholder="+1 786-244-5823"
                  class="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-sm text-slate-900 dark:text-white focus:outline-none focus:border-brand-500 text-right"
                />
              </div>

              <div>
                <label class="block text-xs font-bold uppercase text-slate-700 dark:text-slate-300 mb-1.5">الخدمة المطلوبة *</label>
                <select
                  v-model="activeBooking.service"
                  required
                  class="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-sm text-slate-900 dark:text-white focus:outline-none focus:border-brand-500"
                >
                  <option value="Tax Return Preparation">Tax Return Preparation Services</option>
                  <option value="IRS / Sales Tax Representation">IRS / Sales Tax Representation</option>
                  <option value="Accounting Services">Accounting Services</option>
                  <option value="Consulting Services">Consulting Services</option>
                  <option value="General Inquiry">General Financial Inquiry</option>
                </select>
              </div>

              <div>
                <label class="block text-xs font-bold uppercase text-slate-700 dark:text-slate-300 mb-1.5">التاريخ المفضل</label>
                <input
                  v-model="activeBooking.preferred_date"
                  type="date"
                  class="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-sm text-slate-900 dark:text-white focus:outline-none focus:border-brand-500"
                />
              </div>

              <div>
                <label class="block text-xs font-bold uppercase text-slate-700 dark:text-slate-300 mb-1.5">الوقت المفضل</label>
                <input
                  v-model="activeBooking.preferred_time"
                  type="text"
                  placeholder="مثال: 10:00 AM أو 02:30 PM"
                  class="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-sm text-slate-900 dark:text-white focus:outline-none focus:border-brand-500"
                />
              </div>
            </div>

            <div>
              <label class="block text-xs font-bold uppercase text-slate-700 dark:text-slate-300 mb-1.5">حالة الحجز</label>
              <select
                v-model="activeBooking.status"
                class="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-sm text-slate-900 dark:text-white focus:outline-none focus:border-brand-500"
              >
                <option value="pending">قيد الانتظار</option>
                <option value="confirmed">مؤكد</option>
                <option value="completed">مكتمل</option>
                <option value="cancelled">ملغي</option>
              </select>
            </div>

            <div>
              <label class="block text-xs font-bold uppercase text-slate-700 dark:text-slate-300 mb-1.5">تفاصيل رسالة العميل</label>
              <textarea
                v-model="activeBooking.message"
                rows="3"
                placeholder="تفاصيل طلب العميل أو استفساره..."
                class="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-sm text-slate-900 dark:text-white focus:outline-none focus:border-brand-500 resize-none"
              ></textarea>
            </div>

            <div>
              <label class="block text-xs font-bold uppercase text-slate-700 dark:text-slate-300 mb-1.5">ملاحظات الإدارة الداخلية</label>
              <textarea
                v-model="activeBooking.notes"
                rows="2"
                placeholder="ملاحظات سرية للإدارة لمتابعة الحجز..."
                class="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-sm text-slate-900 dark:text-white focus:outline-none focus:border-brand-500 resize-none"
              ></textarea>
            </div>

            <div class="flex items-center justify-end gap-3 pt-4 border-t border-slate-100 dark:border-slate-800">
              <button
                type="button"
                @click="closeModal"
                class="px-4 py-2.5 rounded-xl border border-slate-200 dark:border-slate-700 text-slate-600 dark:text-slate-300 text-xs font-bold hover:bg-slate-50 dark:hover:bg-slate-800 transition"
              >
                إلغاء
              </button>
              <button
                type="submit"
                :disabled="saving"
                class="px-5 py-2.5 rounded-xl bg-brand-600 hover:bg-brand-700 text-white text-xs font-bold shadow-md shadow-brand-500/20 transition disabled:opacity-50 flex items-center gap-2"
              >
                <span v-if="saving">جارٍ الحفظ...</span>
                <span v-else>{{ isEditing ? 'تحديث الحجز' : 'حفظ الحجز' }}</span>
              </button>
            </div>
          </form>
        </div>
      </div>

      <!-- نافذة تأكيد الحذف (Delete Confirmation Modal) -->
      <div
        v-if="bookingToDelete"
        class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-950/60 backdrop-blur-sm"
      >
        <div class="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-3xl w-full max-w-md shadow-2xl p-6 space-y-4">
          <div class="w-12 h-12 rounded-2xl bg-rose-500/10 text-rose-600 flex items-center justify-center">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
            </svg>
          </div>
          <div>
            <h4 class="text-lg font-black text-slate-900 dark:text-white">هل أنت متأكد من حذف هذا الحجز؟</h4>
            <p class="text-xs text-slate-500 mt-1">
              سيتم حذف حجز العميل <strong>{{ bookingToDelete.name }}</strong> نهائياً ولا يمكن التراجع عن هذا الإجراء.
            </p>
          </div>
          <div class="flex items-center justify-end gap-3 pt-3">
            <button
              @click="bookingToDelete = null"
              class="px-4 py-2 rounded-xl border border-slate-200 dark:border-slate-700 text-slate-600 dark:text-slate-300 text-xs font-bold hover:bg-slate-50 dark:hover:bg-slate-800 transition"
            >
              تراجع
            </button>
            <button
              @click="executeDelete"
              :disabled="deleting"
              class="px-4 py-2 rounded-xl bg-rose-600 hover:bg-rose-700 text-white text-xs font-bold shadow-md shadow-rose-500/20 transition disabled:opacity-50"
            >
              {{ deleting ? 'جارٍ الحذف...' : 'نعم، تأكيد الحذف' }}
            </button>
          </div>
        </div>
      </div>

      <!-- نافذة إعداد مفاتيح سوبابيس (Supabase Config Modal) -->
      <div
        v-if="showConfigModal"
        class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-950/60 backdrop-blur-sm"
      >
        <div class="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-3xl w-full max-w-lg shadow-2xl p-6 sm:p-8 space-y-5">
          <div class="flex items-center justify-between border-b border-slate-100 dark:border-slate-800 pb-3">
            <h3 class="text-lg font-black text-slate-900 dark:text-white">إعداد بيانات الربط مع سوبابيس</h3>
            <button
              @click="showConfigModal = false"
              class="p-1.5 rounded-xl text-slate-400 hover:text-slate-600 dark:hover:text-slate-200"
            >
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>

          <p class="text-xs text-slate-600 dark:text-slate-400 leading-relaxed">
            يمكنك إدخال رابط المشروع ومفتاح الإذن هنا ليتم تخزينها والاتصال مباشرة بقاعدة البيانات:
          </p>

          <div class="space-y-4">
            <div>
              <label class="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">رابط المشروع (Project URL)</label>
              <input
                v-model="tempUrl"
                type="text"
                placeholder="https://xyzcompany.supabase.co"
                class="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-xs text-slate-900 dark:text-white focus:outline-none focus:border-brand-500 font-mono"
              />
            </div>

            <div>
              <label class="block text-xs font-bold text-slate-700 dark:text-slate-300 mb-1">المفتاح العام (Anon Key أو Service Key)</label>
              <input
                v-model="tempKey"
                type="password"
                placeholder="eyJhbGciOiJIUzI1NiIsInR5cCI6..."
                class="w-full px-3.5 py-2.5 rounded-xl bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-xs text-slate-900 dark:text-white focus:outline-none focus:border-brand-500 font-mono"
              />
            </div>
          </div>

          <div class="flex items-center justify-end gap-3 pt-4 border-t border-slate-100 dark:border-slate-800">
            <button
              @click="showConfigModal = false"
              class="px-4 py-2 rounded-xl border border-slate-200 dark:border-slate-700 text-slate-600 dark:text-slate-300 text-xs font-bold"
            >
              إغلاق
            </button>
            <button
              @click="saveConfiguration"
              class="px-5 py-2 rounded-xl bg-brand-600 hover:bg-brand-700 text-white text-xs font-bold shadow-md shadow-brand-500/20"
            >
              حفظ وتطبيق الاتصال
            </button>
          </div>
        </div>
      </div>

    </div>
  </NuxtLayout>
</template>

<script setup lang="ts">
interface Booking {
  id: string
  created_at: string
  name: string
  email: string
  phone: string
  service: string
  preferred_date?: string
  preferred_time?: string
  message?: string
  status: 'pending' | 'confirmed' | 'completed' | 'cancelled'
  notes?: string
}

// نظام التحقق من الأدمن
const { isAuthenticated, initAuth, login } = useAdminAuth()
const loginUsername = ref('')
const loginPassword = ref('')
const loginError = ref('')
const loginSubmitting = ref(false)
const showPassword = ref(false)

const handleLogin = () => {
  loginError.value = ''
  loginSubmitting.value = true
  const res = login(loginUsername.value, loginPassword.value)
  loginSubmitting.value = false
  if (res.success) {
    fetchBookings()
  } else {
    loginError.value = res.message || 'اسم المستخدم أو كلمة المرور غير صحيحة'
  }
}

const { client, isConfigured, supabaseUrl, supabaseKey, updateCredentials } = useSupabase()

const bookings = ref<Booking[]>([])
const loading = ref(false)
const saving = ref(false)
const deleting = ref(false)
const searchQuery = ref('')
const selectedStatus = ref('all')

const showModal = ref(false)
const isEditing = ref(false)
const bookingToDelete = ref<Booking | null>(null)

const showConfigModal = ref(false)
const tempUrl = ref(supabaseUrl || '')
const tempKey = ref(supabaseKey || '')

const initialFormState: Omit<Booking, 'id' | 'created_at'> = {
  name: '',
  email: '',
  phone: '',
  service: 'Tax Return Preparation',
  preferred_date: '',
  preferred_time: '',
  message: '',
  status: 'pending',
  notes: ''
}

const activeBooking = ref<any>({ ...initialFormState })

// فلاتر الحالة
const statusFilters = [
  { label: 'الكل', value: 'all' },
  { label: 'قيد الانتظار', value: 'pending' },
  { label: 'مؤكدة', value: 'confirmed' },
  { label: 'مكتملة', value: 'completed' },
  { label: 'ملغاة', value: 'cancelled' }
]

// بيانات تجريبية افتراضية في حال عدم ضبط سوبابيس
const initialMockData: Booking[] = [
  {
    id: 'mock-1',
    created_at: new Date(Date.now() - 3600000 * 2).toISOString(),
    name: 'أحمد الشمري',
    email: 'ahmed.alshammari@example.com',
    phone: '+971 50 123 4567',
    service: 'Tax Return Preparation',
    preferred_date: '2026-11-10',
    preferred_time: '10:00 AM',
    message: 'أرغب في مراجعة الإقرار الضريبي للشركة وتفادي أي غرامات.',
    status: 'pending',
    notes: 'تم التواصل الأولي عبر الواتساب'
  },
  {
    id: 'mock-2',
    created_at: new Date(Date.now() - 3600000 * 24).toISOString(),
    name: 'سارة المنصوري',
    email: 'sara.mansoor@example.com',
    phone: '+971 52 987 6543',
    service: 'Accounting Services',
    preferred_date: '2026-11-12',
    preferred_time: '02:00 PM',
    message: 'طلب خدمات مسك الدفاتر المحاسبية ربع السنوية.',
    status: 'confirmed',
    notes: 'تم تأكيد الموعد وإرسال رابط الاجتماع'
  },
  {
    id: 'mock-3',
    created_at: new Date(Date.now() - 3600000 * 48).toISOString(),
    name: 'جون سميث (John Smith)',
    email: 'john.smith@taxclient.com',
    phone: '+1 786-555-0199',
    service: 'IRS / Sales Tax Representation',
    preferred_date: '2026-11-08',
    preferred_time: '11:30 AM',
    message: 'IRS audit assistance needed for sales tax in Florida.',
    status: 'completed',
    notes: 'تم تسليم التقرير وإنهاء المشكلة بنجاح'
  }
]

// الإحصائيات
const stats = computed(() => {
  const total = bookings.value.length
  const pending = bookings.value.filter(b => b.status === 'pending').length
  const confirmed = bookings.value.filter(b => b.status === 'confirmed').length
  const completed = bookings.value.filter(b => b.status === 'completed').length
  const cancelled = bookings.value.filter(b => b.status === 'cancelled').length

  return { total, pending, confirmed, completed, cancelled }
})

// تصفية الحجوزات
const filteredBookings = computed(() => {
  return bookings.value.filter(item => {
    const matchesStatus = selectedStatus.value === 'all' || item.status === selectedStatus.value
    const query = searchQuery.value.trim().toLowerCase()
    const matchesQuery =
      !query ||
      item.name.toLowerCase().includes(query) ||
      item.email.toLowerCase().includes(query) ||
      (item.phone && item.phone.toLowerCase().includes(query)) ||
      item.service.toLowerCase().includes(query)

    return matchesStatus && matchesQuery
  })
})

// جلب الحجوزات من سوبابيس أو من التخزين المحلي
const fetchBookings = async () => {
  loading.value = true
  try {
    if (isConfigured && client) {
      const { data, error } = await client
        .from('bookings')
        .select('*')
        .order('created_at', { ascending: false })

      if (error) throw error
      bookings.value = data || []
    } else {
      // استخدام التخزين المحلي كبديل سريع
      if (import.meta.client) {
        const stored = localStorage.getItem('mock_bookings')
        if (stored) {
          bookings.value = JSON.parse(stored)
        } else {
          bookings.value = [...initialMockData]
          localStorage.setItem('mock_bookings', JSON.stringify(bookings.value))
        }
      } else {
        bookings.value = [...initialMockData]
      }
    }
  } catch (err: any) {
    console.error('Error fetching bookings:', err)
  } finally {
    loading.value = false
  }
}

// فتح نافذة الإضافة
const openCreateModal = () => {
  isEditing.value = false
  activeBooking.value = { ...initialFormState }
  showModal.value = true
}

// فتح نافذة التعديل
const openEditModal = (booking: Booking) => {
  isEditing.value = true
  activeBooking.value = { ...booking }
  showModal.value = true
}

const closeModal = () => {
  showModal.value = false
}

// حفظ أو تحديث الحجز
const saveBooking = async () => {
  saving.value = true
  try {
    if (isConfigured && client) {
      if (isEditing.value) {
        const { error } = await client
          .from('bookings')
          .update({
            name: activeBooking.value.name,
            email: activeBooking.value.email,
            phone: activeBooking.value.phone,
            service: activeBooking.value.service,
            preferred_date: activeBooking.value.preferred_date || null,
            preferred_time: activeBooking.value.preferred_time || null,
            message: activeBooking.value.message || null,
            status: activeBooking.value.status,
            notes: activeBooking.value.notes || null
          })
          .eq('id', activeBooking.value.id)

        if (error) throw error
      } else {
        const { error } = await client
          .from('bookings')
          .insert([
            {
              name: activeBooking.value.name,
              email: activeBooking.value.email,
              phone: activeBooking.value.phone,
              service: activeBooking.value.service,
              preferred_date: activeBooking.value.preferred_date || null,
              preferred_time: activeBooking.value.preferred_time || null,
              message: activeBooking.value.message || null,
              status: activeBooking.value.status,
              notes: activeBooking.value.notes || null
            }
          ])

        if (error) throw error
      }
      await fetchBookings()
    } else {
      // الحفظ في المحاكاة المحلية
      if (isEditing.value) {
        const idx = bookings.value.findIndex(b => b.id === activeBooking.value.id)
        if (idx !== -1) {
          bookings.value[idx] = { ...activeBooking.value }
        }
      } else {
        const newBooking: Booking = {
          ...activeBooking.value,
          id: 'mock-' + Date.now(),
          created_at: new Date().toISOString()
        }
        bookings.value.unshift(newBooking)
      }
      if (import.meta.client) {
        localStorage.setItem('mock_bookings', JSON.stringify(bookings.value))
      }
    }

    closeModal()
  } catch (err: any) {
    console.error('Error saving booking:', err)
    alert('حدث خطأ أثناء حفظ البيانات: ' + (err.message || ''))
  } finally {
    saving.value = false
  }
}

// تغيير سريع للحالة
const handleQuickStatusChange = async (id: string, newStatus: string) => {
  try {
    if (isConfigured && client) {
      const { error } = await client
        .from('bookings')
        .update({ status: newStatus })
        .eq('id', id)

      if (error) throw error
    }

    const item = bookings.value.find(b => b.id === id)
    if (item) {
      item.status = newStatus as any
      if (!isConfigured && import.meta.client) {
        localStorage.setItem('mock_bookings', JSON.stringify(bookings.value))
      }
    }
  } catch (err: any) {
    console.error('Error updating status:', err)
  }
}

// نافذة الحذف
const confirmDelete = (booking: Booking) => {
  bookingToDelete.value = booking
}

const executeDelete = async () => {
  if (!bookingToDelete.value) return
  deleting.value = true
  try {
    const id = bookingToDelete.value.id
    if (isConfigured && client) {
      const { error } = await client.from('bookings').delete().eq('id', id)
      if (error) throw error
    }

    bookings.value = bookings.value.filter(b => b.id !== id)
    if (!isConfigured && import.meta.client) {
      localStorage.setItem('mock_bookings', JSON.stringify(bookings.value))
    }
    bookingToDelete.value = null
  } catch (err: any) {
    console.error('Error deleting booking:', err)
    alert('حدث خطأ أثناء الحذف: ' + err.message)
  } finally {
    deleting.value = false
  }
}

// تصدير كملف إكسل / سي إس في
const exportToCSV = () => {
  if (bookings.value.length === 0) return

  const headers = ['المعرف', 'الاسم', 'البريد الإلكتروني', 'الهاتف', 'الخدمة', 'التاريخ المفضل', 'الوقت', 'الحالة', 'تاريخ الإنشاء', 'الملاحظات']
  const rows = bookings.value.map(b => [
    b.id,
    `"${b.name}"`,
    `"${b.email}"`,
    `"${b.phone || ''}"`,
    `"${b.service}"`,
    `"${b.preferred_date || ''}"`,
    `"${b.preferred_time || ''}"`,
    `"${b.status}"`,
    `"${b.created_at}"`,
    `"${(b.notes || '').replace(/"/g, '""')}"`
  ])

  const csvContent = '\uFEFF' + [headers.join(','), ...rows.map(e => e.join(','))].join('\n')
  const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' })
  const url = URL.createObjectURL(blob)
  const link = document.createElement('a')
  link.setAttribute('href', url)
  link.setAttribute('download', `bookings_hamdantax_${new Date().toISOString().slice(0, 10)}.csv`)
  document.body.appendChild(link)
  link.click()
  document.body.removeChild(link)
}

// حفظ بيانات الاتصال
const saveConfiguration = () => {
  if (!tempUrl.value || !tempKey.value) {
    alert('يرجى إدخال الرابط والمفتاح معاً')
    return
  }
  updateCredentials(tempUrl.value, tempKey.value)
  showConfigModal.value = false
  fetchBookings()
}

// تنسيق فئة لون شارة الحالة
const getStatusBadgeClass = (status: string) => {
  switch (status) {
    case 'pending':
      return 'bg-amber-500/10 text-amber-700 dark:text-amber-400 border-amber-500/20'
    case 'confirmed':
      return 'bg-sky-500/10 text-sky-700 dark:text-sky-400 border-sky-500/20'
    case 'completed':
      return 'bg-emerald-500/10 text-emerald-700 dark:text-emerald-400 border-emerald-500/20'
    case 'cancelled':
      return 'bg-rose-500/10 text-rose-700 dark:text-rose-400 border-rose-500/20'
    default:
      return 'bg-slate-100 text-slate-700 border-slate-200'
  }
}

// تنسيق التاريخ
const formatDate = (dateStr: string) => {
  if (!dateStr) return '--'
  try {
    const d = new Date(dateStr)
    return d.toLocaleDateString('ar-EG', {
      year: 'numeric',
      month: 'short',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    })
  } catch {
    return dateStr
  }
}

// الاشتراك في التحديثات الفورية (Realtime)
let channel: any = null

watch(isAuthenticated, (val) => {
  if (val) {
    fetchBookings()
  }
})

onMounted(() => {
  initAuth()
  if (isAuthenticated.value) {
    fetchBookings()
  }

  if (isConfigured && client) {
    channel = client
      .channel('table-db-changes')
      .on(
        'postgres_changes',
        { event: '*', schema: 'public', table: 'bookings' },
        () => {
          fetchBookings()
        }
      )
      .subscribe()
  }
})

onUnmounted(() => {
  if (channel && client) {
    client.removeChannel(channel)
  }
})
</script>

