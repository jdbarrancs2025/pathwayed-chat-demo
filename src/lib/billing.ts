export type PlanId = 'elementary' | 'middle' | 'high'
export type BillingPeriod = 'monthly' | 'annual'

export const PLANS: { id: PlanId; name: string; grades: string; included: number }[] = [
  { id: 'elementary', name: 'Elementary', grades: 'Grades K–5', included: 1 },
  { id: 'middle', name: 'Middle School', grades: 'Grades 6–8', included: 2 },
  { id: 'high', name: 'High School', grades: 'Grades 9–12', included: 2 },
]

/** Suggest the plan that fits the family's oldest child's grade. */
export function suggestPlan(grades: string[]): PlanId {
  const nums = grades.map((g) => (g === 'K' ? 0 : parseInt(g, 10))).filter((n) => !Number.isNaN(n))
  const oldest = nums.length ? Math.max(...nums) : 0
  if (oldest >= 9) return 'high'
  if (oldest >= 6) return 'middle'
  return 'elementary'
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
