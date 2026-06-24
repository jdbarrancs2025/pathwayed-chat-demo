import { useEffect, useRef, useState } from 'react'
import type { Student } from '@/lib/students'
import { getSubscriptionStatus } from '@/lib/profile'
import { PLANS, openPortal, startCheckout, suggestPlan, type BillingPeriod, type PlanId } from '@/lib/billing'

function statusLabel(status: string): string {
  if (status === 'trialing') return 'Free trial'
  if (status === 'active') return 'Active'
  if (status === 'past_due') return 'Past due'
  if (status === 'canceled') return 'Canceled'
  return status
}

const segBtn = (on: boolean): React.CSSProperties => ({
  flex: 1,
  padding: '9px',
  borderRadius: 9,
  fontWeight: 700,
  fontSize: 13.5,
  cursor: 'pointer',
  border: 'none',
  background: on ? '#003078' : 'transparent',
  color: on ? '#fff' : '#5A6172',
})

const chipBtn: React.CSSProperties = {
  width: 36,
  height: 36,
  borderRadius: 999,
  border: '1.6px solid #ECE4D8',
  background: '#fff',
  fontWeight: 700,
  fontSize: 18,
  color: '#003078',
  cursor: 'pointer',
}

export function BillingPanel({ students, userId, email }: { students: Student[]; userId: string; email: string }) {
  const [status, setStatus] = useState<string | null>(null)
  const [billingPeriod, setBillingPeriod] = useState<BillingPeriod>('monthly')
  const [plan, setPlan] = useState<PlanId>(() => suggestPlan(students.map((c) => c.grade)))
  const [totalKids, setTotalKids] = useState(() => Math.max(1, students.length))
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  // Synchronous guard: `busy` state updates too late to block a rapid second click.
  const inFlight = useRef(false)

  useEffect(() => {
    let active = true
    getSubscriptionStatus(userId).then((s) => {
      if (active) setStatus(s)
    })
    return () => {
      active = false
    }
  }, [userId])

  const hasSubscription = status === 'active' || status === 'trialing' || status === 'past_due'
  const included = PLANS.find((p) => p.id === plan)?.included ?? 1
  const extra = Math.max(0, totalKids - included)

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

  const portal = async () => {
    if (inFlight.current) return
    inFlight.current = true
    setBusy(true)
    setError('')
    try {
      await openPortal(userId)
    } catch {
      setError('Could not open the billing portal.')
      setBusy(false)
      inFlight.current = false
    }
  }

  return (
    <div className="panel">
      <h3>Billing</h3>
      <p className="muted" style={{ fontSize: 13, margin: '0 0 12px' }}>
        {status ? `Status: ${statusLabel(status)}` : 'No subscription yet — start a 7-day free trial.'}
      </p>

      {/* Monthly / annual toggle */}
      <div style={{ display: 'flex', gap: 6, background: '#F4EEE4', padding: 4, borderRadius: 12, marginBottom: 12 }}>
        <button type="button" style={segBtn(billingPeriod === 'monthly')} onClick={() => setBillingPeriod('monthly')}>
          Monthly
        </button>
        <button type="button" style={segBtn(billingPeriod === 'annual')} onClick={() => setBillingPeriod('annual')}>
          Annual
        </button>
      </div>

      {/* Plan cards */}
      <div style={{ display: 'grid', gap: 10 }}>
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
                gap: 12,
                padding: '14px 16px',
                border: on ? '1.6px solid #CC543C' : '1.6px solid #ECE4D8',
                borderRadius: 14,
                background: on ? '#FBEEE9' : '#fff',
                cursor: 'pointer',
              }}
            >
              <span>
                <span style={{ display: 'block', fontWeight: 700, fontSize: 15, color: '#1C2230' }}>{p.name}</span>
                <span style={{ display: 'block', fontSize: 13, color: '#5A6172', marginTop: 2 }}>{p.grades}</span>
              </span>
              <span style={{ fontSize: 12.5, color: '#5A6172', flexShrink: 0 }}>
                {p.included === 1 ? '1 kid included' : `up to ${p.included} kids included`}
              </span>
            </button>
          )
        })}
      </div>

      {/* Add-a-kid stepper */}
      <div style={{ display: 'flex', alignItems: 'center', gap: 12, margin: '14px 0 4px' }}>
        <span style={{ fontWeight: 600, fontSize: 14, flex: 1 }}>How many children?</span>
        <button type="button" style={chipBtn} onClick={() => setTotalKids((n) => Math.max(1, n - 1))} aria-label="Fewer">
          −
        </button>
        <b style={{ minWidth: 20, textAlign: 'center', fontSize: 16 }}>{totalKids}</b>
        <button type="button" style={chipBtn} onClick={() => setTotalKids((n) => Math.min(10, n + 1))} aria-label="More">
          +
        </button>
      </div>
      <p className="muted" style={{ fontSize: 12.5, margin: '0 0 14px' }}>
        {included} included{extra > 0 ? ` · ${extra} additional ${extra === 1 ? 'child' : 'children'}` : ''}
      </p>

      <button className="btn btn-primary" disabled={busy} onClick={subscribe}>
        {busy ? 'Opening Stripe…' : hasSubscription ? 'Change plan' : 'Start free trial'}
      </button>
      {hasSubscription && (
        <button className="btn btn-soft" style={{ marginTop: 10 }} disabled={busy} onClick={portal}>
          Update payment
        </button>
      )}
      {error && (
        <p style={{ color: '#C0492F', fontSize: 14, fontWeight: 500, marginTop: 10 }}>{error}</p>
      )}
    </div>
  )
}
