import { createClient } from '@supabase/supabase-js'
import type { Database } from '@/lib/database.types'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error(
    'Missing Supabase configuration. Set VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY.',
  )
}

/** Typed Supabase browser client (anon key — safe for the client). */
export const supabase = createClient<Database>(supabaseUrl, supabaseAnonKey, {
  auth: {
    // Consume the session from the OAuth redirect URL on load (implicit flow
    // returns the token in the `#access_token=…` fragment). Explicit here so the
    // behavior can't be silently changed by a default. `AuthContext` adds a
    // belt-and-suspenders capture in case a redirect races this parse.
    detectSessionInUrl: true,
    persistSession: true,
    autoRefreshToken: true,
  },
})
