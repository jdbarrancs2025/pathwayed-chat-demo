import { supabase } from '@/lib/supabase'

/**
 * Headers for an authenticated call to our own api/ endpoints.
 *
 * The access token comes from the live Supabase session, so this is correct for
 * all three identity paths without branching: a B2C parent, a school SSO student,
 * and a K-8 child whose PIN login adopted a minted session via
 * supabase.auth.setSession all return a token here.
 *
 * Returns the plain JSON headers when there is no session. The server answers 401,
 * which is the right outcome: a signed-out caller should not reach the model.
 */
export async function authedJsonHeaders(): Promise<Record<string, string>> {
  const base: Record<string, string> = { 'Content-Type': 'application/json' }
  try {
    const { data } = await supabase.auth.getSession()
    const token = data.session?.access_token
    if (token) base.Authorization = `Bearer ${token}`
  } catch (err) {
    console.error('authedJsonHeaders: session read failed', err)
  }
  return base
}
