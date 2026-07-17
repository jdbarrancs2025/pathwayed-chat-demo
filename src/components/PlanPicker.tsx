import { useRef, useState } from 'react'
import type { Student } from '@/lib/students'
import {
  ADDON_PRICE,
  PLANS,
  formatMoney,
  intervalSuffix,
  planPrice,
  startCheckout,
  suggestPlan,
  totalPrice,
  type BillingPeriod,
  type PlanId,
} from '@/lib/billing'

const segBtn = (on: boolean): React.CSSProperties => ({
  flex: 1,
  padding: '7px',
  borderRadius: 8,
  fontWeight: 700,
  fontSize: 13,
  cursor: 'pointer',
  border: 'none',
  background: on ? '#003078' : 'transparent',
  color: on ? '#fff' : '#5A6172',
})

const chipBtn: React.CSSProperties = {
  width: 32,
  height: 32,
  borderRadius: 999,
  border: '1.6px solid #ECE4D8',
  background: '#fff',
  fontWeight: 700,
  fontSize: 17,
  color: '#003078',
  cursor: 'pointer',
}

/**
 * The priced plan picker + pay-now checkout button. Shared by the Billing card
 * (free-trial and expired states) and the route-level lock screen, so the plan
 * picker looks and behaves identically everywhere a parent is asked to subscribe.
 * Charging is immediate (the trial is app-managed); the CTA reads "Subscribe now".
 */
export function PlanPicker({
  students,
  userId,
  email,
  ctaLabel = 'Subscribe now',
}: {
  students: Student[]
  userId: string
  email: string
  ctaLabel?: string
}) {
  const [billingPeriod, setBillingPeriod] = useState<BillingPeriod>('monthly')
  const [plan, setPlan] = useState<PlanId>(() => suggestPlan(students.map((c) => c.grade)))
  const [totalKids, setTotalKids] = useState(() => Math.max(1, students.length))
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const inFlight = useRef(false)

  const subscribe = async () => {
    if (inFlight.current) return
    inFlight.current = true
    setBusy(true)
    setError('')
    try {
      // On success this navigates to Stripe, so the page unloads — no reset needed.
      await startCheckout({ plan, billingPeriod, totalKids, email, userId })
    } catch {
      setError('Could not start checkout. Please try again.')
      setBusy(false)
      inFlight.current = false
    }
  }

  const included = PLANS.find((p) => p.id === plan)?.included ?? 1
  const extra = Math.max(0, totalKids - included)
  const total = totalPrice(plan, billingPeriod, extra)

  return (
    <>
      <div style={{ display: 'flex', gap: 6, background: '#F4EEE4', padding: 4, borderRadius: 10, marginBottom: 10 }}>
        <button type="button" style={segBtn(billingPeriod === 'monthly')} onClick={() => setBillingPeriod('monthly')}>
          Monthly
        </button>
        <button type="button" style={segBtn(billingPeriod === 'annual')} onClick={() => setBillingPeriod('annual')}>
          Annual
        </button>
      </div>

      <div style={{ display: 'grid', gap: 8 }}>
        {PLANS.map((p) => {
          const on = plan === p.id
          return (
            <button
              key={p.id}
              type="button"
              onClick={() => setPlan(p.id)}
              style={{
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'space-between',
                textAlign: 'left',
                gap: 10,
                padding: '11px 13px',
                border: on ? '1.6px solid #CC543C' : '1.6px solid #ECE4D8',
                borderRadius: 12,
                background: on ? '#FBEEE9' : '#fff',
                cursor: 'pointer',
              }}
            >
              <span>
                <span style={{ display: 'block', fontWeight: 700, fontSize: 14.5, color: '#1C2230' }}>{p.name}</span>
                <span style={{ display: 'block', fontSize: 12.5, color: '#5A6172' }}>
                  {p.grades} · {p.included === 1 ? '1 child' : `up to ${p.included} children`}
                </span>
              </span>
              <span style={{ fontWeight: 700, fontSize: 15, color: '#003078', flexShrink: 0 }}>
                {formatMoney(planPrice(p.id, billingPeriod))}
                <span style={{ fontSize: 12, fontWeight: 600, color: '#5A6172' }}>{intervalSuffix(billingPeriod)}</span>
              </span>
            </button>
          )
        })}
      </div>

      <div style={{ display: 'flex', alignItems: 'center', gap: 10, margin: '12px 0 6px' }}>
        <span style={{ fontWeight: 600, fontSize: 13.5, flex: 1 }}>How many children?</span>
        <button type="button" style={chipBtn} onClick={() => setTotalKids((n) => Math.max(1, n - 1))} aria-label="Fewer">
          −
        </button>
        <b style={{ minWidth: 18, textAlign: 'center', fontSize: 15 }}>{totalKids}</b>
        <button type="button" style={chipBtn} onClick={() => setTotalKids((n) => Math.min(10, n + 1))} aria-label="More">
          +
        </button>
      </div>

      <p className="muted" style={{ fontSize: 13, margin: '0 0 10px' }}>
        Total:{' '}
        <b style={{ color: '#1C2230' }}>
          {formatMoney(total)}
          {intervalSuffix(billingPeriod)}
        </b>
        {extra > 0
          ? ` (${formatMoney(planPrice(plan, billingPeriod))} plan + ${extra} × ${formatMoney(ADDON_PRICE[billingPeriod])})`
          : ''}
      </p>

      <button className="btn btn-primary" disabled={busy} onClick={subscribe}>
        {busy ? 'Opening Stripe…' : ctaLabel}
      </button>
      {error && <p style={{ color: '#C0492F', fontSize: 14, fontWeight: 500, marginTop: 10 }}>{error}</p>}
    </>
  )
}
