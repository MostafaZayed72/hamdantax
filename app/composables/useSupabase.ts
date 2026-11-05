import { createClient, SupabaseClient } from '@supabase/supabase-js'

let supabaseInstance: SupabaseClient | null = null

const cleanSupabaseUrl = (url: string) => {
  if (!url) return ''
  return url.trim().replace(/\/rest\/v1\/?$/, '').replace(/\/+$/, '')
}

export const useSupabase = () => {
  const config = useRuntimeConfig()
  
  // فحص ما إذا كان هناك مفاتيح محفوظة في التخزين المحلي كبديل سريع
  const getStoredConfig = () => {
    if (import.meta.client) {
      const url = localStorage.getItem('supabase_url') || ''
      const key = localStorage.getItem('supabase_key') || ''
      return { url: cleanSupabaseUrl(url), key: key.trim() }
    }
    return { url: '', key: '' }
  }

  const stored = getStoredConfig()
  const rawUrl = (config.public.supabaseUrl as string) || stored.url
  const supabaseUrl = cleanSupabaseUrl(rawUrl)
  const supabaseKey = ((config.public.supabaseKey as string) || stored.key).trim()

  const isConfigured = Boolean(supabaseUrl && supabaseKey)

  const getClient = (): SupabaseClient | null => {
    if (!isConfigured) return null
    if (!supabaseInstance) {
      supabaseInstance = createClient(supabaseUrl, supabaseKey)
    }
    return supabaseInstance
  }

  const updateCredentials = (url: string, key: string) => {
    const cleanedUrl = cleanSupabaseUrl(url)
    const cleanedKey = key.trim()
    if (import.meta.client) {
      localStorage.setItem('supabase_url', cleanedUrl)
      localStorage.setItem('supabase_key', cleanedKey)
      supabaseInstance = createClient(cleanedUrl, cleanedKey)
    }
  }

  return {
    client: getClient(),
    isConfigured,
    supabaseUrl,
    supabaseKey,
    updateCredentials
  }
}

