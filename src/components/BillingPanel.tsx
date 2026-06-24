import { useEffect, useRef, useState } from 'react'
import type { Student } from '@/lib/students'
import { getSubscription, type Subscription } from '@/lib/profile'
import {
  ADDON_PRICE,
  PLANS,
  formatMoney,
  intervalSuffix,
  openPortal,
  planPrice,
  startCheckout,
  suggestPlan,
  totalPrice,
  type BillingPeriod,
  type PlanId,
} from '@/lib/billing'

function statusBadge(status: string): { label: string; bg: string; color: string } {
  if (status === 'trialing') return { label: 'Free trial', bg: '#FBEEE9', color: '#B0432E' }
  if (status === 'active') return { label: 'Active', bg: '#E7F5EF', color: '#1F9E6F' }
  if (status === 'past_due') return { label: 'Past due', bg: '#FBE3DE', color: '#C0492F' }
  return { label: status, bg: '#F4EEE4', color: '#5A6172' }
}

/** Friendly date like "January 3, 2026", or null if the ISO string is missing/invalid. */
function formatFriendlyDate(iso: string | null): string | null {
  if (!iso) return null
  const d = new Date(iso)
  if (isNaN(d.getTime())) return null
  return d.toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' })
}

const badgeStyle = (bg: string, color: string): React.CSSProperties => ({
  background: bg,
  color,
  fontSize: 11.5,
  fontWeight: 700,
  padding: '3px 9px',
  borderRadius: 999,
})

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

export function BillingPanel({ students, userId, email }: { students: Student[]; userId: string; email: string }) {
  const [sub, setSub] = useState<Subscription | null>(null)
  const [loading, setLoading] = useState(true)
  const [billingPeriod, setBillingPeriod] = useState<BillingPeriod>('monthly')
  const [plan, setPlan] = useState<PlanId>(() => suggestPlan(students.map((c) => c.grade)))
  const [totalKids, setTotalKids] = useState(() => Math.max(1, students.length))
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const inFlight = useRef(false)

  useEffect(() => {
    let active = true
    getSubscription(userId).then((s) => {
      if (!active) return
      setSub(s)
      setLoading(false)
    })
    return () => {
      active = false
    }
  }, [userId])

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

  if (loading) {
    return (
      <div className="panel" style={{ padding: '16px 18px' }}>
        <h3 style={{ margin: 0 }}>Billing</h3>
        <p className="muted" style={{ fontSize: 13, margin: '8px 0 0' }}>Loading…</p>
      </div>
    )
  }

  const status = sub?.status ?? null
  const isSubscribed = status === 'trialing' || status === 'active' || status === 'past_due'

  // --- Subscribed: compact current-plan summary, no picker ---
  if (isSubscribed && status) {
    const badge = statusBadge(status)
    const period: BillingPeriod = sub?.billingPeriod === 'annual' ? 'annual' : 'monthly'
    const planDef = PLANS.find((p) => p.id === sub?.plan)
    const extraKids = sub?.extraKids ?? 0
    const total = planDef ? totalPrice(planDef.id, period, extraKids) : null

    // trial_end is only meaningful while trialing (a stale value can linger after conversion).
    const trialEndsLabel = status === 'trialing' ? formatFriendlyDate(sub?.trialEnd ?? null) : null
    const renewsLabel = status === 'active' ? formatFriendlyDate(sub?.currentPeriodEnd ?? null) : null
    const dateLine = trialEndsLabel
      ? `Free trial ends ${trialEndsLabel}`
      : renewsLabel
        ? `Renews ${renewsLabel}`
        : null

    return (
      <div className="panel" style={{ padding: '16px 18px' }}>
        <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: 10 }}>
          <h3 style={{ margin: 0 }}>Billing</h3>
          <span style={badgeStyle(badge.bg, badge.color)}>{badge.label}</span>
        </div>
        <div style={{ marginTop: 8 }}>
          <div style={{ fontWeight: 700, fontSize: 15, color: '#1C2230' }}>
            {planDef ? `${planDef.name} · ${planDef.grades}` : 'Your plan'}
          </div>
          {total != null && (
            <div style={{ fontSize: 13.5, color: '#5A6172', marginTop: 2 }}>
              {formatMoney(total)}
              {intervalSuffix(period)}
              {extraKids > 0
                ? ` · includes ${extraKids} extra ${extraKids === 1 ? 'child' : 'children'}`
                : ''}
            </div>
          )}
          {dateLine && (
            <div style={{ fontSize: 13.5, color: '#5A6172', marginTop: 2 }}>{dateLine}</div>
          )}
        </div>
        <button className="btn btn-soft" style={{ marginTop: 12 }} disabled={busy} onClick={portal}>
          Manage billing
        </button>
        {error && <p style={{ color: '#C0492F', fontSize: 14, fontWeight: 500, margin: '10px 0 0' }}>{error}</p>}
      </div>
    )
  }

  // --- No active subscription: priced plan picker ---
  const included = PLANS.find((p) => p.id === plan)?.included ?? 1
  const extra = Math.max(0, totalKids - included)
  const total = totalPrice(plan, billingPeriod, extra)

  return (
    <div className="panel" style={{ padding: '16px 18px' }}>
      <h3 style={{ margin: '0 0 8px' }}>Billing</h3>
      <p className="muted" style={{ fontSize: 13, margin: '0 0 10px' }}>
        Start a 7-day free trial. Cancel anytime.
      </p>

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
        {busy ? 'Opening Stripe…' : 'Start free trial'}
      </button>
      {error && <p style={{ color: '#C0492F', fontSize: 14, fontWeight: 500, marginTop: 10 }}>{error}</p>}
    </div>
  )
}
