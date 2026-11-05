export const useAdminAuth = () => {
  const isAuthenticated = useState<boolean>('admin_is_authenticated', () => false)

  // التحقق من حالة تسجيل الدخول المخزنة عند تحميل التطبيق في المتصفح
  const initAuth = () => {
    if (import.meta.client) {
      const stored = localStorage.getItem('hamdantax_admin_session')
      if (stored === 'active_authenticated') {
        isAuthenticated.value = true
      }
    }
  }

  // محاولة تسجيل الدخول
  const login = (username: string, password: string): { success: boolean; message?: string } => {
    const cleanUser = username.trim().toLowerCase()
    const cleanPass = password.trim()

    if (cleanUser === 'admin' && cleanPass === '12345') {
      isAuthenticated.value = true
      if (import.meta.client) {
        localStorage.setItem('hamdantax_admin_session', 'active_authenticated')
      }
      return { success: true }
    }

    return {
      success: false,
      message: 'اسم المستخدم أو كلمة المرور غير صحيحة، يرجى المحاولة مرة أخرى.'
    }
  }

  // تسجيل الخروج
  const logout = () => {
    isAuthenticated.value = false
    if (import.meta.client) {
      localStorage.removeItem('hamdantax_admin_session')
    }
  }

  return {
    isAuthenticated,
    initAuth,
    login,
    logout
  }
}

