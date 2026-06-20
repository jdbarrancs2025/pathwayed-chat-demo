import { supabase } from '@/lib/supabase'

/**
 * Whether the signed-in parent has consent on record.
 *
 * Consent lives in the `consents` table — one row per consenting parent
 * (keyed by `parent_id` = the auth user id), written when a parent completes
 * the attestation. The presence of a row means consent has been given. On any
 * error (e.g. the table isn't reachable) we return false so the caller routes
 * the parent to the consent screen rather than past it.
 */
export async function getConsentStatus(userId: string): Promise<boolean> {
  const { data, error } = await supabase
    .from('consents')
    .select('id')
    .eq('parent_id', userId)
    .limit(1)
    .maybeSingle()

  if (error) return false
  return data != null
}
