import { useEffect, useState } from 'react'
import { useLocation, useNavigate, useParams } from 'react-router'
import '@/styles/app-screens.css'
import { useAuth } from '@/context/AuthContext'
import {
  GRADES,
  LEVELS,
  avatarModeOf,
  createStudent,
  getStudent,
  gradeLabel,
  listStudents,
  setAboveGradeConsent,
  updateStudent,
  type AvatarMode,
  type StudentLevel,
} from '@/lib/students'
import { AvatarModePicker } from '@/components/AvatarModePicker'
import { Switch } from '@/components/ui/switch'
import { getSubscription, type Subscription } from '@/lib/profile'
import {
  ADDON_PRICE,
  PLANS,
  formatMoney,
  intervalSuffix,
  updateSeats,
  type BillingPeriod,
} from '@/lib/billing'

const card: React.CSSProperties = {
  background: '#FFFFFF',
  border: '1px solid #ECE4D8',
  borderRadius: 20,
  boxShadow: '0 1px 2px rgba(28,34,48,.04),0 10px 30px rgba(28,34,48,.07)',
  width: '100%',
  maxWidth: 480,
  padding: 34,
}

const inputBase: React.CSSProperties = {
  width: '100%',
  padding: '14px 16px',
  border: '1.6px solid #ECE4D8',
  borderRadius: 14,
  background: '#fff',
  fontSize: 16,
  color: '#1C2230',
}

const inputErr: React.CSSProperties = {
  borderColor: '#C0492F',
  boxShadow: '0 0 0 4px rgba(192,73,47,.12)',
}

export function AddChild() {
  const { id } = useParams<{ id: string }>()
  const editing = !!id
  const { user } = useAuth()
  const navigate = useNavigate()
  const location = useLocation()
  // Where to go after saving/cancelling. Settings launches this flow with
  // returnTo:'/settings' so account management returns to Settings; the
  // first-time onboarding entry has no state and continues to '/children'
  // (the "add another or continue" step → student picker).
  const returnTo = (location.state as { returnTo?: string } | null)?.returnTo ?? '/children'

  const [name, setName] = useState('')
  const [grade, setGrade] = useState('')
  const [originalGrade, setOriginalGrade] = useState('')
  const [confirmReassess, setConfirmReassess] = useState(false)
  const [level, setLevel] = useState<StudentLevel>('on')
  const [avatarMode, setAvatarMode] = useState<AvatarMode>('video')
  // SAT / above-grade FRAMING consent (the students.above_grade_ok field the
  // onboarding placement step writes). Framing/emphasis only — never access.
  const [aboveGradeOk, setAboveGradeOk] = useState(false)
  const [nameError, setNameError] = useState(false)
  const [gradeError, setGradeError] = useState(false)
  const [errMsg, setErrMsg] = useState('')
  const [loading, setLoading] = useState(editing)
  const [saving, setSaving] = useState(false)
  // Billing state (only relevant when adding, not editing).
  const [sub, setSub] = useState<Subscription | null>(null)
  const [childCount, setChildCount] = useState(0)
  const [billingLoaded, setBillingLoaded] = useState(editing)
  const [confirmBilling, setConfirmBilling] = useState(false)

  useEffect(() => {
    if (!editing || !id) return
    let active = true
    getStudent(id).then((student) => {
      if (!active) return
      if (!student) {
        navigate(returnTo, { replace: true })
        return
      }
      setName(student.first_name)
      setGrade(student.grade)
      setOriginalGrade(student.grade)
      setLevel((student.level as StudentLevel) ?? 'on')
      setAvatarMode(avatarModeOf(student))
      setAboveGradeOk(!!student.above_grade_ok)
      setLoading(false)
    })
    return () => {
      active = false
    }
  }, [editing, id, navigate, returnTo])

  // When adding a child, learn the parent's subscription and current child count
  // so we can tell whether this child exceeds their plan's included seats.
  useEffect(() => {
    if (editing || !user) return
    let active = true
    Promise.all([getSubscription(user.id), listStudents(user.id)]).then(([s, kids]) => {
      if (!active) return
      setSub(s)
      setChildCount(kids.length)
      setBillingLoaded(true)
    })
    return () => {
      active = false
    }
  }, [editing, user])

  const includedSeats = PLANS.find((p) => p.id === sub?.plan)?.included ?? 1
  const hasSubscription = sub?.status === 'active' || sub?.status === 'trialing'
  // This add is billable only with an active/trialing sub and a count over seats.
  const willBill = !editing && hasSubscription && childCount + 1 > includedSeats
  const period: BillingPeriod = sub?.billingPeriod === 'annual' ? 'annual' : 'monthly'
  const addCost = `${formatMoney(ADDON_PRICE[period])}${intervalSuffix(period)}`

  const handleSave = async () => {
    if (saving || !user) return
    const trimmed = name.trim()
    const missingName = trimmed.length === 0
    const missingGrade = grade.length === 0
    setNameError(missingName)
    setGradeError(missingGrade)
    if (missingName || missingGrade) {
      setErrMsg('Please fill in the highlighted fields to continue.')
      return
    }
    setErrMsg('')

    // If this child is billable, require an explicit confirmation of the cost
    // first — never charge silently.
    if (willBill && !confirmBilling) {
      setConfirmBilling(true)
      return
    }

    // Editing + grade changed → prompt first; on confirm, save and route into a
    // fresh assessment that resets their level (layered on existing mastery).
    const gradeChanged = editing && grade !== originalGrade
    if (gradeChanged && !confirmReassess) {
      setConfirmReassess(true)
      return
    }

    setSaving(true)

    const input = { first_name: trimmed, grade, level, avatar_mode: avatarMode }

    if (editing && id) {
      // Save the details and the SAT/above-grade framing consent together, both
      // through the existing student update path (consent = above_grade_ok).
      const [{ error: updateError }, { error: consentError }] = await Promise.all([
        updateStudent(id, input),
        setAboveGradeConsent(id, aboveGradeOk),
      ])
      if (updateError || consentError) {
        setErrMsg('Sorry — something went wrong saving. Please try again.')
        setSaving(false)
        setConfirmReassess(false)
        return
      }
      navigate(gradeChanged ? `/students/${id}/diagnostic?fresh=1` : returnTo, { replace: true })
      return
    }

    // Adding a child. Bill the extra seat first (with proration) so we never add
    // an unpaid child; the seat change is idempotent, so a retry won't double-charge.
    if (willBill) {
      try {
        await updateSeats(user.id, childCount + 1)
      } catch {
        setErrMsg("Sorry — we couldn't update your billing. Please try again.")
        setSaving(false)
        setConfirmBilling(false)
        return
      }
    }

    const { id: newId, error } = await createStudent(user.id, input)
    if (error || !newId) {
      setErrMsg('Sorry — something went wrong saving. Please try again.')
      setSaving(false)
      setConfirmBilling(false)
      return
    }
    // New child → run the one-time placement diagnostic (consent + adaptive
    // questions + seeding), which lands on the child's dashboard when finished.
    // Existing children are never re-created, so they're never force-placed.
    navigate(`/students/${newId}/diagnostic`, { replace: true })
  }

  return (
    <div className="auth-screen" style={{ color: '#1C2230' }}>
      <div className="auth-card" style={card}>
        <p
          style={{
            color: '#CC543C',
            fontWeight: 700,
            fontSize: 12,
            letterSpacing: '.1em',
            textTransform: 'uppercase',
          }}
        >
          {editing ? 'Edit child' : 'Add a child'}
        </p>
        <h1
          style={{
            fontFamily: '"Baloo 2", "Trebuchet MS", system-ui, sans-serif',
            color: '#003078',
            fontSize: 23,
            fontWeight: 700,
            margin: '5px 0 14px',
          }}
        >
          {editing ? 'Update their details' : 'Tell us about them'}
        </h1>

        {loading ? (
          <p style={{ color: '#5A6172', fontSize: 14.5 }}>Loading…</p>
        ) : (
          <>
            <div style={{ margin: '16px 0', textAlign: 'left' }}>
              <label
                htmlFor="child-name"
                style={{ display: 'block', fontWeight: 600, fontSize: 14, marginBottom: 7 }}
              >
                First name
              </label>
              <input
                id="child-name"
                value={name}
                maxLength={20}
                placeholder="Their first name"
                onChange={(e) => {
                  setName(e.target.value)
                  if (nameError) setNameError(false)
                }}
                style={nameError ? { ...inputBase, ...inputErr } : inputBase}
              />
            </div>

            <div style={{ margin: '16px 0', textAlign: 'left' }}>
              <label
                htmlFor="child-grade"
                style={{ display: 'block', fontWeight: 600, fontSize: 14, marginBottom: 7 }}
              >
                Current grade
              </label>
              <select
                id="child-grade"
                value={grade}
                onChange={(e) => {
                  setGrade(e.target.value)
                  if (gradeError) setGradeError(false)
                }}
                style={gradeError ? { ...inputBase, ...inputErr } : inputBase}
              >
                <option value="">Choose a grade</option>
                {GRADES.map((g) => (
                  <option key={g} value={g}>
                    {gradeLabel(g)}
                  </option>
                ))}
              </select>
            </div>

            <div style={{ margin: '16px 0', textAlign: 'left' }}>
              <label style={{ display: 'block', fontWeight: 600, fontSize: 14, marginBottom: 7 }}>
                How should Nikki challenge them?
              </label>
              {LEVELS.map((opt) => {
                const on = level === opt.id
                return (
                  <button
                    key={opt.id}
                    type="button"
                    onClick={() => setLevel(opt.id)}
                    style={{
                      display: 'block',
                      width: '100%',
                      textAlign: 'left',
                      border: on ? '1.6px solid #CC543C' : '1.6px solid #ECE4D8',
                      borderRadius: 14,
                      padding: '14px 16px',
                      marginBottom: 10,
                      background: on ? '#FBEEE9' : '#fff',
                      cursor: 'pointer',
                    }}
                  >
                    <div style={{ fontWeight: 700, fontSize: 15, color: '#1C2230' }}>{opt.label}</div>
                    <div style={{ fontSize: 13, color: '#5A6172', marginTop: 2 }}>{opt.desc}</div>
                  </button>
                )
              })}
            </div>

            <AvatarModePicker value={avatarMode} onChange={setAvatarMode} />

            {/* SAT / above-grade FRAMING consent — editable post-onboarding. Wired
                to the same students.above_grade_ok field the placement step writes.
                Framing/emphasis only: it enables SAT-readiness framing + the SAT
                Practice card, never access or advancement (mastery still governs). */}
            {editing && (
              <div
                style={{
                  display: 'flex',
                  alignItems: 'flex-start',
                  gap: 14,
                  border: aboveGradeOk ? '1.6px solid #CC543C' : '1.6px solid #ECE4D8',
                  borderRadius: 14,
                  padding: '14px 16px',
                  margin: '16px 0',
                  background: aboveGradeOk ? '#FBEEE9' : '#fff',
                  textAlign: 'left',
                }}
              >
                <div style={{ flex: 1 }}>
                  <label
                    htmlFor="above-grade-ok"
                    style={{ display: 'block', fontWeight: 700, fontSize: 15, color: '#1C2230' }}
                  >
                    SAT &amp; above-grade framing
                  </label>
                  <p style={{ fontSize: 13, color: '#5A6172', margin: '4px 0 0' }}>
                    When on, Nikki can show SAT-readiness framing and unlock SAT practice for this child. This changes
                    how work is framed, not what your child is allowed to learn. They advance at their real mastery level
                    either way.
                  </p>
                </div>
                <Switch
                  id="above-grade-ok"
                  checked={aboveGradeOk}
                  onCheckedChange={setAboveGradeOk}
                  aria-label="SAT and above-grade framing"
                  style={{ marginTop: 3 }}
                />
              </div>
            )}

            {/* Heads-up when this child goes beyond the plan's included seats. */}
            {willBill && !confirmBilling && (
              <p style={{ color: '#5A6172', fontSize: 13.5, margin: '4px 2px 0' }}>
                This child is beyond your plan’s included seats, so it adds{' '}
                <b style={{ color: '#1C2230' }}>{addCost}</b>, prorated for this period.
              </p>
            )}

            {/* Explicit confirmation before any charge. */}
            {willBill && confirmBilling && (
              <div
                style={{
                  border: '1.6px solid #CC543C',
                  background: '#FBEEE9',
                  borderRadius: 14,
                  padding: '13px 15px',
                  margin: '12px 0 0',
                  textAlign: 'left',
                }}
              >
                <div style={{ fontWeight: 700, fontSize: 14.5, color: '#1C2230' }}>Confirm extra child</div>
                <p style={{ fontSize: 13.5, color: '#5A6172', margin: '4px 0 0' }}>
                  Adding a child adds <b style={{ color: '#1C2230' }}>{addCost}</b>, prorated for this
                  period. Continue?
                </p>
              </div>
            )}

            {/* Grade changed → a fresh assessment is needed to reset their level. */}
            {confirmReassess && (
              <div
                style={{
                  border: '1.6px solid #003078',
                  background: '#EAF1FB',
                  borderRadius: 14,
                  padding: '13px 15px',
                  margin: '12px 0 0',
                  textAlign: 'left',
                }}
              >
                <div style={{ fontWeight: 700, fontSize: 14.5, color: '#1C2230' }}>New grade — quick re-check</div>
                <p style={{ fontSize: 13.5, color: '#5A6172', margin: '4px 0 0' }}>
                  Changing {name.trim() || 'their'}’s grade means we’ll do a short fresh assessment to reset their
                  level. What they’ve already mastered is kept — we’ll save and start it now.
                </p>
              </div>
            )}

            <div
              style={{
                color: '#C0492F',
                fontSize: 14,
                fontWeight: 500,
                minHeight: 18,
                marginTop: 8,
              }}
            >
              {errMsg}
            </div>

            <button
              type="button"
              onClick={handleSave}
              disabled={saving || (!editing && !billingLoaded)}
              style={{
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                width: '100%',
                padding: '15px 22px',
                borderRadius: 999,
                fontWeight: 700,
                fontSize: 15.5,
                background: '#CC543C',
                color: '#fff',
                cursor: saving || (!editing && !billingLoaded) ? 'not-allowed' : 'pointer',
                opacity: saving || (!editing && !billingLoaded) ? 0.45 : 1,
              }}
            >
              {saving
                ? 'Saving…'
                : editing
                  ? confirmReassess
                    ? 'Save & start assessment'
                    : 'Save changes'
                  : confirmBilling
                    ? `Confirm & add child (${addCost})`
                    : 'Save child'}
            </button>
            <button
              type="button"
              disabled={saving}
              onClick={() =>
                confirmBilling
                  ? setConfirmBilling(false)
                  : confirmReassess
                    ? setConfirmReassess(false)
                    : navigate(returnTo)
              }
              style={{
                display: 'block',
                margin: '12px auto 0',
                background: 'none',
                color: '#003078',
                fontWeight: 700,
                fontSize: 14.5,
                textDecoration: 'underline',
                textUnderlineOffset: 3,
                cursor: saving ? 'not-allowed' : 'pointer',
                opacity: saving ? 0.45 : 1,
              }}
            >
              {confirmBilling || confirmReassess ? 'Not now' : 'Cancel'}
            </button>
          </>
        )}
      </div>
    </div>
  )
}
