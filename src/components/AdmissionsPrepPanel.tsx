import { useEffect, useMemo, useState } from 'react'
import type { Student } from '@/lib/students'
import { PREP_MODULES } from '@/lib/prep/registry'
import { PREP_PRICE_MONTHLY } from '@/lib/prep/pricing'
import {
  ACTIVE_PREP_STATUSES,
  cancelPrep,
  eligibilityReason,
  getPrepEntitlements,
  isGradeEligible,
  purchasePrep,
  type PrepEntitlement,
} from '@/lib/prep/entitlements'
import { formatMoney, intervalSuffix } from '@/lib/billing'

const priceLabel = `${formatMoney(PREP_PRICE_MONTHLY)}${intervalSuffix('monthly')}`

/** Friendly date like "January 3, 2026", or '' if the ISO string is missing/invalid. */
function formatDate(iso: string | null): string {
  if (!iso) return ''
  const d = new Date(iso)
  return isNaN(d.getTime()) ? '' : d.toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' })
}

/**
 * Admissions Prep card on the billing surface. Lists the child's current prep
 * entitlements as per-child line items, and lets a parent buy a module for one or
 * more eligible children. Purchase adds the prep price to the family's existing
 * subscription when there is one (proration, no redirect), or opens Stripe
 * Checkout when there is not. Each active line item can be canceled per child
 * (api/cancel-prep) without touching the plan.
 *
 * Billing + entitlements only: nothing here appears in the kid experience.
 */
export function AdmissionsPrepPanel({
  students,
  userId,
  email,
}: {
  students: Student[]
  userId: string
  email: string
}) {
  const [entitlements, setEntitlements] = useState<PrepEntitlement[] | null>(null)
  const [moduleId, setModuleId] = useState<string>(PREP_MODULES[0]?.id ?? '')
  const [selected, setSelected] = useState<Set<string>>(new Set())
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState('')
  const [notice, setNotice] = useState('')
  const [confirming, setConfirming] = useState<string | null>(null)
  const [cancelBusy, setCancelBusy] = useState(false)

  const studentIds = useMemo(() => students.map((s) => s.id), [students])

  useEffect(() => {
    let active = true
    getPrepEntitlements(studentIds).then((e) => {
      if (active) setEntitlements(e)
    })
    return () => {
      active = false
    }
  }, [studentIds])

  const module = PREP_MODULES.find((m) => m.id === moduleId) ?? PREP_MODULES[0]

  const nameOf = (studentId: string) => students.find((s) => s.id === studentId)?.first_name ?? 'Child'
  const moduleName = (id: string) => PREP_MODULES.find((m) => m.id === id)?.name ?? id

  // Active line items to show, one per (child, module) currently entitled.
  const activeItems = (entitlements ?? []).filter((e) => ACTIVE_PREP_STATUSES.has(e.status))

  // Whether a child already has an active entitlement to the selected module.
  const hasActive = (studentId: string, id: string) =>
    (entitlements ?? []).some(
      (e) => e.studentId === studentId && e.moduleId === id && ACTIVE_PREP_STATUSES.has(e.status),
    )

  const toggle = (studentId: string) => {
    setSelected((prev) => {
      const next = new Set(prev)
      if (next.has(studentId)) next.delete(studentId)
      else next.add(studentId)
      return next
    })
  }

  const pickModule = (id: string) => {
    setModuleId(id)
    setSelected(new Set())
    setError('')
    setNotice('')
  }

  const cancel = async (mId: string, sId: string) => {
    if (cancelBusy) return
    setCancelBusy(true)
    setError('')
    setNotice('')
    try {
      await cancelPrep({ userId, moduleId: mId, studentIds: [sId] })
      const refreshed = await getPrepEntitlements(studentIds)
      setEntitlements(refreshed)
      setConfirming(null)
      setNotice('Canceled.')
    } catch {
      setError('Could not cancel. Please try again.')
    } finally {
      setCancelBusy(false)
    }
  }

  const buy = async () => {
    if (busy || !module || selected.size === 0) return
    setBusy(true)
    setError('')
    setNotice('')
    try {
      const { added } = await purchasePrep({
        userId,
        moduleId: module.id,
        studentIds: [...selected],
        email,
      })
      if (added) {
        // Added to the existing subscription (no redirect) — refresh line items.
        const refreshed = await getPrepEntitlements(studentIds)
        setEntitlements(refreshed)
        setSelected(new Set())
        setNotice('Added to your subscription.')
        setBusy(false)
      }
      // Otherwise the browser is navigating to Stripe; leave busy until unload.
    } catch {
      setError('Could not start the purchase. Please try again.')
      setBusy(false)
    }
  }

  return (
    <div className="panel" style={{ padding: '16px 18px', marginTop: 16 }}>
      <h3 style={{ margin: 0 }}>Admissions Prep</h3>
      <p className="muted" style={{ fontSize: 13, margin: '6px 0 0' }}>
        Add a test-prep module for a child. {priceLabel} per student.
      </p>

      {/* Current entitlements as per-child line items, each cancelable. */}
      {activeItems.length > 0 && (
        <div style={{ marginTop: 12, display: 'grid', gap: 10 }}>
          {activeItems.map((e) => {
            const key = `${e.studentId}-${e.moduleId}`
            // status active + ends_at = scheduled to end (does not renew).
            const scheduledEnd = e.status === 'active' && e.endsAt ? formatDate(e.endsAt) : ''
            return (
              <div key={key} style={{ display: 'grid', gap: 5 }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', gap: 10, fontSize: 13.5 }}>
                  <span style={{ color: '#1C2230' }}>
                    {moduleName(e.moduleId)} Prep — {nameOf(e.studentId)}
                    {e.status === 'past_due' && (
                      <span style={{ color: '#B0432E', fontWeight: 600 }}> (payment past due)</span>
                    )}
                  </span>
                  {scheduledEnd ? (
                    <span className="muted" style={{ fontSize: 12.5, flexShrink: 0 }}>ends {scheduledEnd}</span>
                  ) : (
                    <b style={{ color: '#1C2230', flexShrink: 0 }}>{priceLabel}</b>
                  )}
                </div>

                {scheduledEnd ? null : confirming === key ? (
                  <div style={{ display: 'flex', alignItems: 'center', gap: 8, flexWrap: 'wrap' }}>
                    <span className="muted" style={{ fontSize: 12.5 }}>
                      Cancel {moduleName(e.moduleId)} Prep for {nameOf(e.studentId)}? Access ends now, and
                      you’ll be credited for the unused part of this billing period.
                    </span>
                    <button
                      className="btn btn-soft"
                      style={{ fontSize: 12, padding: '4px 10px' }}
                      disabled={cancelBusy}
                      onClick={() => cancel(e.moduleId, e.studentId)}
                    >
                      {cancelBusy ? 'Canceling…' : 'Confirm cancel'}
                    </button>
                    <button
                      className="btn btn-soft"
                      style={{ fontSize: 12, padding: '4px 10px' }}
                      disabled={cancelBusy}
                      onClick={() => setConfirming(null)}
                    >
                      Keep
                    </button>
                  </div>
                ) : (
                  <button
                    className="btn btn-soft"
                    style={{ alignSelf: 'start', fontSize: 12, padding: '3px 9px' }}
                    onClick={() => {
                      setConfirming(key)
                      setError('')
                      setNotice('')
                    }}
                  >
                    Cancel
                  </button>
                )}
              </div>
            )
          })}
        </div>
      )}

      {/* Module picker. */}
      <div style={{ display: 'grid', gap: 8, marginTop: 14 }}>
        {PREP_MODULES.map((m) => {
          const on = module?.id === m.id
          return (
            <button
              key={m.id}
              type="button"
              onClick={() => pickModule(m.id)}
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
              <span style={{ fontWeight: 700, fontSize: 14.5, color: '#1C2230' }}>{m.name} Prep</span>
              <span style={{ fontWeight: 700, fontSize: 15, color: '#003078', flexShrink: 0 }}>
                {priceLabel}
                <span style={{ fontSize: 12, fontWeight: 600, color: '#5A6172' }}> / student</span>
              </span>
            </button>
          )
        })}
      </div>

      {/* Child selection for the chosen module. */}
      {module && (
        <div style={{ marginTop: 12 }}>
          <p style={{ fontWeight: 600, fontSize: 13.5, margin: '0 0 6px' }}>Which children?</p>
          {students.length === 0 && (
            <p className="muted" style={{ fontSize: 13, margin: 0 }}>
              Add a child first to buy a prep module.
            </p>
          )}
          <div style={{ display: 'grid', gap: 6 }}>
            {students.map((s) => {
              const already = hasActive(s.id, module.id)
              const eligible = isGradeEligible(s.grade, module)
              const disabled = already || !eligible
              const reason = already ? 'Added' : !eligible ? eligibilityReason(module) : ''
              return (
                <label
                  key={s.id}
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'space-between',
                    gap: 10,
                    padding: '9px 11px',
                    border: '1.4px solid #ECE4D8',
                    borderRadius: 10,
                    background: disabled ? '#F7F3EC' : '#fff',
                    opacity: disabled ? 0.7 : 1,
                    cursor: disabled ? 'default' : 'pointer',
                  }}
                >
                  <span style={{ display: 'flex', alignItems: 'center', gap: 9 }}>
                    <input
                      type="checkbox"
                      checked={selected.has(s.id)}
                      disabled={disabled}
                      onChange={() => toggle(s.id)}
                    />
                    <span style={{ fontWeight: 600, fontSize: 14, color: '#1C2230' }}>
                      {s.first_name}
                    </span>
                  </span>
                  {reason && <span className="muted" style={{ fontSize: 12 }}>{reason}</span>}
                </label>
              )
            })}
          </div>

          <button
            className="btn btn-primary"
            style={{ marginTop: 12 }}
            disabled={busy || selected.size === 0}
            onClick={buy}
          >
            {busy
              ? 'Working…'
              : `Add ${module.name} Prep${selected.size ? ` (${selected.size} × ${priceLabel})` : ''}`}
          </button>
        </div>
      )}

      {notice && <p style={{ color: '#1F9E6F', fontSize: 14, fontWeight: 500, margin: '10px 0 0' }}>{notice}</p>}
      {error && <p style={{ color: '#C0492F', fontSize: 14, fontWeight: 500, margin: '10px 0 0' }}>{error}</p>}
    </div>
  )
}
