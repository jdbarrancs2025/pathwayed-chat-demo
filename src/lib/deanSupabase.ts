import { createClient } from "@supabase/supabase-js"

// Second Supabase client, pointed at the DEAN project, used ONLY for staff SSO in
// the K-8 school station. A Dean staff member signs in with Google here; the
// resulting Dean access token is the staff_session_token passed to the PIN login.
//
// Isolated from the tutoring client: its own storage key, and PKCE flow (code in
// the query string) so its OAuth return never collides with the tutoring client's
// implicit-flow hash parsing. Null when the Dean env vars aren't configured.
const url = import.meta.env.VITE_DEAN_SUPABASE_URL
const anon = import.meta.env.VITE_DEAN_SUPABASE_ANON_KEY

export const deanSupabase =
  url && anon
    ? createClient(url, anon, {
        auth: {
          storageKey: "pathwayed.dean.auth",
          flowType: "pkce",
          detectSessionInUrl: true,
          persistSession: true,
          autoRefreshToken: true,
        },
      })
    : null
