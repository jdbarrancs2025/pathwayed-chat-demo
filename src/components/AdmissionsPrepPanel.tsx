import { useEffect, useMemo, useRef, useState } from 'react'
import type { Student } from '@/lib/students'
import { PREP_MODULES, getPrepModule } from '@/lib/prep/registry'
import type { PrepModule } from '@/lib/prep/types'
import { loadPrepProgress } from '@/lib/prep/prepProgressLoad'
import { TEASER_MIN_COVERED_SKILLS, type PrepProgress } from '@/lib/prep/prepProgress'
import { PREP_PRICE_MONTHLY } from '@/lib/prep/pricing'
import {
  ACTIVE_PREP_STATUSES,
  cancelPrep,
  eligibilityReason,
  getPrepEntitlements,
  getPrepSettings,
  isGradeEligible,
  previewCancelPrep,
  purchasePrep,
  setPrepTestDate,
  type CancelPrepPreview,
  type PrepEntitlement,
} from '@/lib/prep/entitlements'
import { formatMoney, intervalSuffix, planQualifiesForBand } from '@/lib/billing'
import { getSubscription, type Subscription } from '@/lib/profile'

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
  const [preview, setPreview] = useState<CancelPrepPreview | null>(null)
  const [cancelBusy, setCancelBusy] = useState(false)

  const [settings, setSettings] = useState<Map<string, string | null>>(new Map())
  const [sub, setSub] = useState<Subscription | null>(null)

  const studentIds = useMemo(() => students.map((s) => s.id), [students])

  useEffect(() => {
    let active = true
    getPrepEntitlements(studentIds).then((e) => {
      if (active) setEntitlements(e)
    })
    getPrepSettings(studentIds).then((m) => {
      if (active) setSettings(m)
    })
    return () => {
      active = false
    }
  }, [studentIds])

  useEffect(() => {
    let active = true
    getSubscription(userId).then((s) => {
      if (active) setSub(s)
    })
    return () => {
      active = false
    }
  }, [userId])

  // Parent sets a child's test date per module; it drives the kid tile + module
  // header countdown. Optimistic, then a direct client write (owns_student grant).
  const saveTestDate = async (studentId: string, mId: string, value: string) => {
    const date = value || null
    setSettings((prev) => {
      const next = new Map(prev)
      next.set(`${studentId}:${mId}`, date)
      return next
    })
    try {
      await setPrepTestDate(studentId, mId, date)
    } catch {
      setError('Could not save the test date.')
    }
  }

  const module = PREP_MODULES.find((m) => m.id === moduleId) ?? PREP_MODULES[0]

  // Purchase requires an active/trialing learning plan whose grade coverage
  // reaches this module's band (Middle or High for a 6-8 module). This mirrors the
  // server enforcement in api/purchase-prep — the client gate is convenience only.
  const accountEligible = !!module && planQualifiesForBand(sub?.status ?? null, sub?.plan ?? null, module.gradeBand)

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

  // Free readiness teasers: grade-eligible children on a qualifying plan who are NOT
  // yet entitled to a module. One teaser card per (child, module). Non-qualifying
  // accounts (no plan) get none — they can't buy, so no upsell.
  const teasers = useMemo(() => {
    const out: { student: Student; module: PrepModule }[] = []
    for (const s of students) {
      for (const m of PREP_MODULES) {
        if (!planQualifiesForBand(sub?.status ?? null, sub?.plan ?? null, m.gradeBand)) continue
        if (!isGradeEligible(s.grade, m)) continue
        const entitled = (entitlements ?? []).some(
          (e) => e.studentId === s.id && e.moduleId === m.id && ACTIVE_PREP_STATUSES.has(e.status),
        )
        if (entitled) continue
        out.push({ student: s, module: m })
      }
    }
    return out
  }, [students, sub, entitlements])

  // Buy area, scrolled into view when a teaser's "Unlock" preselects a child/module.
  const buyRef = useRef<HTMLDivElement>(null)
  const startUnlock = (studentId: string, mId: string) => {
    setModuleId(mId)
    setSelected(new Set([studentId]))
    setError('')
    setNotice('')
    setTimeout(() => buyRef.current?.scrollIntoView({ behavior: 'smooth', block: 'center' }), 60)
  }

  const pickModule = (id: string) => {
    setModuleId(id)
    setSelected(new Set())
    setError('')
    setNotice('')
  }

  // Clicking Cancel first asks the server which path applies (preview), so the
  // confirm copy is accurate before anything is mutated.
  const startCancel = async (mId: string, sId: string, key: string) => {
    setConfirming(key)
    setPreview(null)
    setError('')
    setNotice('')
    try {
      setPreview(await previewCancelPrep({ userId, moduleId: mId, studentIds: [sId] }))
    } catch {
      setError('Could not load cancel details. Please try again.')
      setConfirming(null)
    }
  }

  const cancel = async (mId: string, sId: string) => {
    if (cancelBusy) return
    setCancelBusy(true)
    setError('')
    setNotice('')
    try {
      const path = await cancelPrep({ userId, moduleId: mId, studentIds: [sId] })
      const refreshed = await getPrepEntitlements(studentIds)
      setEntitlements(refreshed)
      setConfirming(null)
      setPreview(null)
      setNotice(
        path === 'schedule' && preview?.periodEnd
          ? `Set to end ${formatDate(preview.periodEnd)}.`
          : 'Canceled.',
      )
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

                {/* Test date drives the child's home tile + module countdown. */}
                <label style={{ display: 'flex', alignItems: 'center', gap: 8, fontSize: 12.5, color: '#5A6172' }}>
                  Test date
                  <input
                    type="date"
                    value={settings.get(`${e.studentId}:${e.moduleId}`) ?? ''}
                    onChange={(ev) => void saveTestDate(e.studentId, e.moduleId, ev.target.value)}
                    style={{ padding: '5px 8px', border: '1.4px solid #ECE4D8', borderRadius: 8, fontSize: 13 }}
                  />
                </label>

                {/* Readiness + progress for this child's module (client-computed
                    from prep_attempts + mastery the parent already reads under RLS). */}
                <PrepChildProgress studentId={e.studentId} moduleId={e.moduleId} moduleName={moduleName(e.moduleId)} />

                {scheduledEnd ? null : confirming === key ? (
                  <div style={{ display: 'flex', alignItems: 'center', gap: 8, flexWrap: 'wrap' }}>
                    <span className="muted" style={{ fontSize: 12.5 }}>
                      {!preview
                        ? 'Loading…'
                        : preview.path === 'schedule'
                          ? `Cancel ${moduleName(e.moduleId)} Prep for ${nameOf(e.studentId)}? Access continues until ${formatDate(preview.periodEnd)}, then it won’t renew.`
                          : `Cancel ${moduleName(e.moduleId)} Prep for ${nameOf(e.studentId)}? Access ends now, and you’ll be credited for the unused part of this billing period.`}
                    </span>
                    <button
                      className="btn btn-soft"
                      style={{ fontSize: 12, padding: '4px 10px' }}
                      disabled={cancelBusy || !preview}
                      onClick={() => cancel(e.moduleId, e.studentId)}
                    >
                      {cancelBusy ? 'Canceling…' : 'Confirm cancel'}
                    </button>
                    <button
                      className="btn btn-soft"
                      style={{ fontSize: 12, padding: '4px 10px' }}
                      disabled={cancelBusy}
                      onClick={() => {
                        setConfirming(null)
                        setPreview(null)
                      }}
                    >
                      Keep
                    </button>
                  </div>
                ) : (
                  <button
                    className="btn btn-soft"
                    style={{ alignSelf: 'start', fontSize: 12, padding: '3px 9px' }}
                    onClick={() => void startCancel(e.moduleId, e.studentId, key)}
                  >
                    Cancel
                  </button>
                )}
              </div>
            )
          })}
        </div>
      )}

      {/* Free readiness teasers — the discovery funnel. One per (grade-eligible,
          not-yet-entitled) child × module, on qualifying accounts only. Shows the
          mastery-only readiness number (or a building state) and an Unlock action
          that preselects the child + module in the purchase flow below. */}
      {teasers.length > 0 && (
        <div style={{ marginTop: 14, display: 'grid', gap: 10 }}>
          {teasers.map(({ student, module: m }) => (
            <PrepTeaserCard
              key={`${student.id}-${m.id}`}
              student={student}
              module={m}
              moduleName={m.name}
              onUnlock={() => startUnlock(student.id, m.id)}
            />
          ))}
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

      {/* No qualifying plan: show the modules but no purchase action. */}
      {module && !accountEligible && (
        <p className="muted" style={{ fontSize: 13, margin: '12px 0 0' }}>
          Available with a Middle or High School plan.
        </p>
      )}

      {/* Child selection — only when the account holds a qualifying plan. */}
      {module && accountEligible && (
        <div style={{ marginTop: 12 }} ref={buyRef}>
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

/** Readiness band color for the parent headline number. */
function readinessColor(score: number): string {
  if (score >= 75) return '#1F9E6F'
  if (score >= 50) return '#003078'
  if (score >= 25) return '#B87A2E'
  return '#8A7F6D'
}

const TREND: Record<'up' | 'down' | 'flat', { s: string; c: string }> = {
  up: { s: '▲', c: '#1F9E6F' },
  flat: { s: '▬', c: '#8A7F6D' },
  down: { s: '▼', c: '#B0432E' },
}

/**
 * Parent-facing readiness + progress for one child's prep module. Entirely
 * client-computed (loadPrepProgress) from prep_attempts and mastery the parent can
 * already read under RLS — no new tables, no server work. Shows:
 *   - a 0-100 readiness headline (blend of per-type mastery + recent section scores),
 *   - latest timed section scores with a trend arrow vs the prior attempt,
 *   - the weakest areas in plain parent language.
 * Readiness is a coaching signal, stated as such — never a predicted test score.
 */
function PrepChildProgress({
  studentId,
  moduleId,
  moduleName,
}: {
  studentId: string
  moduleId: string
  moduleName: string
}) {
  const module: PrepModule | undefined = useMemo(() => getPrepModule(moduleId as PrepModule['id']), [moduleId])
  const [progress, setProgress] = useState<PrepProgress | null>(null)
  const [loading, setLoading] = useState(!!module)

  useEffect(() => {
    if (!module) return
    let active = true
    loadPrepProgress(studentId, module)
      .then((p) => active && setProgress(p))
      .catch(() => active && setProgress(null))
      .finally(() => active && setLoading(false))
    return () => {
      active = false
    }
  }, [studentId, module])

  if (!module) return null
  if (loading) {
    return <p className="muted" style={{ fontSize: 12.5, margin: 0 }}>Loading progress…</p>
  }
  if (!progress) return null

  const hasReadiness = progress.readiness != null
  const wrap: React.CSSProperties = {
    marginTop: 2,
    padding: '10px 12px',
    background: '#FBF8F3',
    border: '1px solid #ECE4D8',
    borderRadius: 10,
    display: 'grid',
    gap: 8,
  }

  return (
    <div style={wrap}>
      {/* Readiness headline. */}
      {hasReadiness ? (
        <div>
          <div style={{ display: 'flex', alignItems: 'baseline', gap: 7 }}>
            <span style={{ fontSize: 24, fontWeight: 800, color: readinessColor(progress.readiness as number), lineHeight: 1 }}>
              {progress.readiness}
            </span>
            <span style={{ fontSize: 12, fontWeight: 600, color: '#5A6172' }}>/ 100 · {moduleName} readiness</span>
          </div>
          <p className="muted" style={{ fontSize: 12, margin: '4px 0 0' }}>
            A blend of practice mastery and recent timed-section scores — a coaching signal to guide practice, not a predicted test score.
          </p>
        </div>
      ) : (
        <p className="muted" style={{ fontSize: 12.5, margin: 0 }}>
          {moduleName} readiness will appear once {`there's`} a little timed practice to measure.
        </p>
      )}

      {/* Latest section scores + trend vs prior attempt. */}
      {progress.sections.length > 0 && (
        <div style={{ display: 'grid', gap: 4 }}>
          {progress.sections.map((s) => {
            const arrow = s.trend ? TREND[s.trend] : null
            return (
              <div key={s.sectionId} style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: 8, fontSize: 12.5 }}>
                <span style={{ color: '#1C2230' }}>{s.name}</span>
                <span style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
                  {arrow && (
                    <span style={{ color: arrow.c, fontSize: 11, fontWeight: 800 }} title={s.priorScore != null ? `was ${s.priorScore}%` : undefined}>
                      {arrow.s}
                    </span>
                  )}
                  <b style={{ color: '#003078' }}>{s.latestScore}%</b>
                </span>
              </div>
            )
          })}
        </div>
      )}

      {/* Weakest areas in parent language. */}
      {progress.weakestTypes.length > 0 && (
        <p className="muted" style={{ fontSize: 12, margin: 0 }}>
          <b style={{ color: '#5A6172' }}>Focus areas:</b> {progress.weakestTypes.map((t) => t.label).join(', ')}
        </p>
      )}
    </div>
  )
}

/** "math", "math and reading", "math, reading, and language". */
function humanList(items: string[]): string {
  if (items.length <= 1) return items[0] ?? ''
  if (items.length === 2) return `${items[0]} and ${items[1]}`
  return `${items.slice(0, -1).join(', ')}, and ${items[items.length - 1]}`
}

/**
 * Free readiness teaser (discovery funnel) for a grade-eligible child who is NOT yet
 * entitled to this module, on a qualifying account. Shows the MASTERY-ONLY readiness
 * number when there's enough coverage (TEASER_MIN_COVERED_SKILLS distinct skills with
 * graded evidence), otherwise a friendly "building a picture" state — never a number
 * from almost nothing. Both states end in the same Unlock action, which preselects
 * this child + module in the purchase flow. Client-computed from mastery under
 * existing RLS; the child has no timed attempts, so masteryReadiness == readiness.
 */
function PrepTeaserCard({
  student,
  module,
  moduleName,
  onUnlock,
}: {
  student: Student
  module: PrepModule
  moduleName: string
  onUnlock: () => void
}) {
  const [progress, setProgress] = useState<PrepProgress | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    let active = true
    loadPrepProgress(student.id, module)
      .then((p) => active && setProgress(p))
      .catch(() => active && setProgress(null))
      .finally(() => active && setLoading(false))
    return () => {
      active = false
    }
  }, [student.id, module])

  const firstName = student.first_name || 'Your child'
  const showNumber =
    !!progress && progress.masteryReadiness != null && progress.coveredSkillCount >= TEASER_MIN_COVERED_SKILLS
  const subjects = progress?.coveredSubjects ?? []

  const wrap: React.CSSProperties = {
    padding: '13px 15px',
    background: '#F4F8FF',
    border: '1px dashed #B9CCEC',
    borderRadius: 12,
    display: 'grid',
    gap: 10,
  }

  return (
    <div style={wrap}>
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: 8 }}>
        <span style={{ fontSize: 11.5, fontWeight: 700, color: '#3A5A9A', letterSpacing: 0.3, textTransform: 'uppercase' }}>
          {moduleName} Prep · free preview
        </span>
      </div>

      {loading ? (
        <p className="muted" style={{ fontSize: 12.5, margin: 0 }}>Loading {firstName}’s preview…</p>
      ) : showNumber ? (
        <div>
          <div style={{ display: 'flex', alignItems: 'baseline', gap: 8 }}>
            <span style={{ fontSize: 14.5, fontWeight: 700, color: '#1C2230' }}>{firstName}’s {moduleName} readiness:</span>
            <span style={{ fontSize: 26, fontWeight: 800, color: readinessColor(progress!.masteryReadiness as number), lineHeight: 1 }}>
              {progress!.masteryReadiness}
            </span>
          </div>
          <p className="muted" style={{ fontSize: 12, margin: '5px 0 0' }}>
            An early read from the practice {firstName} has already done — a coaching signal, not a predicted test score.
            {subjects.length > 0 && <> Based on their work in {humanList(subjects)} so far.</>}
          </p>
        </div>
      ) : (
        <div>
          <p style={{ fontSize: 14, fontWeight: 600, color: '#1C2230', margin: 0 }}>
            We’re building a picture of {firstName}’s {moduleName} readiness.
          </p>
          <p className="muted" style={{ fontSize: 12, margin: '4px 0 0' }}>
            As {firstName} keeps practicing, an early readiness read will appear here.
          </p>
        </div>
      )}

      <button
        className="btn btn-primary"
        style={{ width: 'auto', alignSelf: 'start', fontSize: 13, padding: '8px 16px' }}
        onClick={onUnlock}
      >
        Unlock full test prep
      </button>
    </div>
  )
}
