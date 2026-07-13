/// <reference types="vite/client" />

interface ImportMetaEnv {
  readonly VITE_SUPABASE_URL: string
  readonly VITE_SUPABASE_ANON_KEY: string
  readonly VITE_STRIPE_PUBLISHABLE_KEY: string
  // Dean project (staff SSO for K-8 PIN). Anon key — public-safe.
  readonly VITE_DEAN_SUPABASE_URL: string
  readonly VITE_DEAN_SUPABASE_ANON_KEY: string
}

interface ImportMeta {
  readonly env: ImportMetaEnv
}
