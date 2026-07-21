export type PlanId = 'elementary' | 'middle' | 'high'
export type BillingPeriod = 'monthly' | 'annual'

export interface PlanDef {
  id: PlanId
  name: string
  grades: string
  included: number
  monthly: number
  annual: number
}

// Display prices for the UI — these must match the configured Stripe prices.
export const PLANS: PlanDef[] = [
  { id: 'elementary', name: 'Elementary', grades: 'Grades K–5', included: 1, monthly: 15, annual: 149 },
  { id: 'middle', name: 'Middle School', grades: 'Grades 6–8', included: 2, monthly: 24, annual: 239 },
  { id: 'high', name: 'High School', grades: 'Grades 9–12', included: 2, monthly: 39, annual: 389 },
]

export const ADDON_PRICE: Record<BillingPeriod, number> = { monthly: 7.99, annual: 79 }

export function planPrice(plan: PlanId, period: BillingPeriod): number {
  const def = PLANS.find((p) => p.id === plan)
  if (!def) return 0
  return period === 'monthly' ? def.monthly : def.annual
}

export function totalPrice(plan: PlanId, period: BillingPeriod, extraKids: number): number {
  return planPrice(plan, period) + Math.max(0, extraKids) * ADDON_PRICE[period]
}

export function formatMoney(amount: number): string {
  return amount % 1 === 0 ? `$${amount}` : `$${amount.toFixed(2)}`
}

export function intervalSuffix(period: BillingPeriod): string {
  return period === 'monthly' ? '/mo' : '/yr'
}

/** Suggest the plan that fits the family's oldest child's grade. */
export function suggestPlan(grades: string[]): PlanId {
  const nums = grades.map((g) => (g === 'K' ? 0 : parseInt(g, 10))).filter((n) => !Number.isNaN(n))
  const oldest = nums.length ? Math.max(...nums) : 0
  if (oldest >= 9) return 'high'
  if (oldest >= 6) return 'middle'
  return 'elementary'
}

/** Grade coverage per plan tier (Elementary K-5, Middle 6-8, High 9-12). The
 *  single source for which plans qualify for a prep module's grade band. */
export const PLAN_GRADES: Record<PlanId, [number, number]> = {
  elementary: [0, 5],
  middle: [6, 8],
  high: [9, 12],
}

/**
 * Whether the account may PURCHASE a prep module for the given grade band: the
 * subscription must be active or trialing, and the plan's coverage must reach the
 * band (its top grade >= the band's first grade). So Elementary is excluded for a
 * 6-8 module while Middle and High qualify. Coverage comes from PLAN_GRADES, not a
 * hardcoded grade list.
 */
export function planQualifiesForBand(
  status: string | null,
  plan: string | null,
  band: [number, number],
): boolean {
  if (status !== 'active' && status !== 'trialing') return false
  const range = PLAN_GRADES[plan as PlanId] as [number, number] | undefined
  return range != null && range[1] >= band[0]
}

interface CheckoutInput {
  plan: PlanId
  billingPeriod: BillingPeriod
  totalKids: number
  email: string
  userId: string
}

/**
 * Create a Checkout session server-side, then redirect to Stripe's hosted page.
 * The server returns a full Stripe Checkout URL, so we just navigate to it —
 * no Stripe.js / redirectToCheckout needed (card entry happens on Stripe).
 */
export async function startCheckout(input: CheckoutInput): Promise<void> {
  const res = await fetch('/api/create-checkout', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(input),
  })
  if (!res.ok) throw new Error('Checkout failed')
  const { url } = (await res.json()) as { url?: string }
  if (!url) throw new Error('No checkout URL returned')
  window.location.href = url
}

/**
 * Adjust the per-child add-on quantity on the parent's existing subscription to
 * match a new total child count. The server prorates the change. Use this when
 * a parent with an active/trialing subscription adds a child beyond their plan's
 * included seats. Returns the resulting billable extra-kid count.
 */
export async function updateSeats(userId: string, totalKids: number): Promise<number> {
  const res = await fetch('/api/update-seats', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ userId, totalKids }),
  })
  if (!res.ok) throw new Error('Could not update your subscription')
  const { extraKids } = (await res.json()) as { extraKids?: number }
  return extraKids ?? 0
}

/** Open the Stripe customer portal for the parent. */
export async function openPortal(userId: string): Promise<void> {
  const res = await fetch('/api/create-portal', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ userId }),
  })
  if (!res.ok) throw new Error('Portal failed')
  const { url } = (await res.json()) as { url?: string }
  if (!url) throw new Error('No portal URL returned')
  window.location.href = url
}
