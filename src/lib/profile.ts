import { supabase } from '@/lib/supabase'

export async function getDisplayName(parentId: string): Promise<string> {
  const { data } = await supabase.from('profiles').select('display_name').eq('id', parentId).maybeSingle()
  return data?.display_name ?? ''
}

export async function updateDisplayName(parentId: string, name: string): Promise<void> {
  await supabase.from('profiles').update({ display_name: name }).eq('id', parentId)
}

export async function getSubscriptionStatus(parentId: string): Promise<string | null> {
  const { data } = await supabase
    .from('profiles')
    .select('subscription_status')
    .eq('id', parentId)
    .maybeSingle()
  return data?.subscription_status ?? null
}

export interface Subscription {
  status: string | null
  plan: string | null
  billingPeriod: string | null
  extraKids: number
  trialEnd: string | null
  currentPeriodEnd: string | null
  hasTrialed: boolean
  paidSeats: number | null
  // Present once the family has any Stripe subscription (plan OR prep-only), so
  // the billing UI can offer the portal even when the learning status is not
  // active (e.g. a prep-only account whose trial has ended).
  stripeCustomerId: string | null
}

// ---------------------------------------------------------------------------
// Optional account "parent PIN" (migration 0013). Gates the Parent dashboard /
// Settings / Sign out when a child is signed in on a shared device. Null hash =
// no PIN = open access (the requested fallback). The raw PIN is hashed by the
// set_parent_pin RPC; the client only reads whether one exists and asks the DB
// to verify an attempt (verify_parent_pin keys on the caller's own auth.uid()).
// ---------------------------------------------------------------------------

/** Whether this account has a parent PIN set (so kid-session exits are gated). */
export async function hasParentPin(parentId: string): Promise<boolean> {
  const { data } = await supabase
    .from('profiles')
    .select('parent_pin_hash')
    .eq('id', parentId)
    .maybeSingle()
  return !!data?.parent_pin_hash
}

/** Set/replace the account's 4-digit parent PIN (hashed server-side). */
export async function setParentPin(pin: string) {
  return supabase.rpc('set_parent_pin', { p_pin: pin })
}

/** Remove the account's parent PIN (returns the parent area to open access). */
export async function clearParentPin() {
  return supabase.rpc('clear_parent_pin')
}

/** Verify a parent PIN attempt. Returns false on any error or mismatch. */
export async function verifyParentPin(pin: string): Promise<boolean> {
  const { data, error } = await supabase.rpc('verify_parent_pin', { p_pin: pin })
  return !error && data === true
}

export async function getSubscription(parentId: string): Promise<Subscription> {
  const { data } = await supabase
    .from('profiles')
    .select(
      'subscription_status, plan, billing_period, extra_kids, trial_end, current_period_end, has_trialed, paid_seats, stripe_customer_id',
    )
    .eq('id', parentId)
    .maybeSingle()
  return {
    status: data?.subscription_status ?? null,
    plan: data?.plan ?? null,
    billingPeriod: data?.billing_period ?? null,
    extraKids: data?.extra_kids ?? 0,
    trialEnd: data?.trial_end ?? null,
    currentPeriodEnd: data?.current_period_end ?? null,
    hasTrialed: data?.has_trialed ?? false,
    paidSeats: data?.paid_seats ?? null,
    stripeCustomerId: data?.stripe_customer_id ?? null,
  }
}
