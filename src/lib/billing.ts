import { loadStripe, type Stripe } from '@stripe/stripe-js'

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

// Publishable key only — the secret key never reaches the client.
let stripePromise: Promise<Stripe | null> | null = null
function getStripe(): Promise<Stripe | null> {
  if (!stripePromise) stripePromise = loadStripe(import.meta.env.VITE_STRIPE_PUBLISHABLE_KEY)
  return stripePromise
}

interface CheckoutInput {
  plan: PlanId
  billingPeriod: BillingPeriod
  totalKids: number
  email: string
  userId: string
}

/** Create a Checkout session server-side and hand off to Stripe's hosted page. */
export async function startCheckout(input: CheckoutInput): Promise<void> {
  const res = await fetch('/api/create-checkout', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(input),
  })
  if (!res.ok) throw new Error('Checkout failed')
  const { id, url } = (await res.json()) as { id?: string; url?: string }

  const stripe = await getStripe()
  if (stripe && id) {
    const { error } = await stripe.redirectToCheckout({ sessionId: id })
    if (!error) return
  }
  if (url) {
    window.location.href = url
    return
  }
  throw new Error('No checkout URL returned')
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
