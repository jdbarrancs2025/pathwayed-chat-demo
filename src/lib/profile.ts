import { supabase } from '@/lib/supabase'

/** The parent's chosen Nikki appearance ('orb' | 'p1' | 'p2' | 'p3'); defaults to 'orb'. */
export async function getNikkiChoice(parentId: string): Promise<string> {
  const { data } = await supabase.from('profiles').select('nikki').eq('id', parentId).maybeSingle()
  return data?.nikki ?? 'orb'
}

export async function getDisplayName(parentId: string): Promise<string> {
  const { data } = await supabase.from('profiles').select('display_name').eq('id', parentId).maybeSingle()
  return data?.display_name ?? ''
}

export async function setNikkiChoice(parentId: string, nikki: string): Promise<void> {
  await supabase.from('profiles').update({ nikki }).eq('id', parentId)
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
}

export async function getSubscription(parentId: string): Promise<Subscription> {
  const { data } = await supabase
    .from('profiles')
    .select('subscription_status, plan, billing_period, extra_kids, trial_end, current_period_end')
    .eq('id', parentId)
    .maybeSingle()
  return {
    status: data?.subscription_status ?? null,
    plan: data?.plan ?? null,
    billingPeriod: data?.billing_period ?? null,
    extraKids: data?.extra_kids ?? 0,
    trialEnd: data?.trial_end ?? null,
    currentPeriodEnd: data?.current_period_end ?? null,
  }
}
