import { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router'
import { getStudent, gradeLabel, levelLabel, avatarModeOf, updateAvatarMode, type AvatarMode, type Student } from '@/lib/students'
import { canTakePracticeSat } from '@/lib/practiceSat'
import { HOMEWORK } from '@/lib/subjects'
import { TopMenu } from '@/components/TopMenu'
import { NikkiFace } from '@/components/NikkiFace'
import { AvatarModePicker } from '@/components/AvatarModePicker'
import '@/styles/app-screens.css'

/**
 * Returning-student welcome. Nikki greets by name and offers exactly two,
 * Nikki-led choices: build skills, or get homework help. No subject tiles, no
 * skill browse menu — the learning path (skills building) and the homework flow
 * own what happens next. Both choices route to their own screens (stubs for now;
 * skills building = Phase 2, homework = Phase 3).
 */
export function KidHome() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const [student, setStudent] = useState<Student | null>(null)
  const [loading, setLoading] = useState(true)
  const [pickingAvatar, setPickingAvatar] = useState(false)

  useEffect(() => {
    if (!id) return
    let active = true
    getStudent(id).then((s) => {
      if (!active) return
      if (!s) {
        navigate('/students', { replace: true })
        return
      }
      setStudent(s)
      setLoading(false)
    })
    return () => {
      active = false
    }
  }, [id, navigate])

  // Kid picks how Nikki appears to them. Writes the same students.avatar_mode
  // field the parent's Edit form uses, so kid and parent changes stay in sync.
  // Optimistic: Nikki above re-renders instantly, then we persist.
  const chooseAvatar = async (mode: AvatarMode) => {
    if (!student) return
    setStudent((prev) => (prev ? { ...prev, avatar_mode: mode } : prev))
    await updateAvatarMode(student.id, mode)
  }

  if (loading || !student) {
    return (
      <div className="kid-screen">
        <div className="shell">
          <p className="muted">Loading…</p>
        </div>
      </div>
    )
  }

  return (
    <div className="kid-screen">
      <div className="shell">
        {/* Welcome header sized up (this screen only): logo ~4x the 52px mark and a
            larger hamburger to stay balanced with the logo and Nikki. */}
        <TopMenu logoHeight={208} menuSize={72} />

        <div
          style={{
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
            textAlign: 'center',
            gap: 4,
            marginBottom: 22,
          }}
        >
          <NikkiFace mode={avatarModeOf(student)} size={180} />
          <h1 className="greet">Hi, {student.first_name}!</h1>
          <p className="muted">Great to see you. What are we doing today?</p>
          <button
            type="button"
            onClick={() => setPickingAvatar((v) => !v)}
            style={{
              background: 'none',
              border: 'none',
              color: '#5A6172',
              fontSize: 13,
              fontWeight: 600,
              textDecoration: 'underline',
              textUnderlineOffset: 3,
              cursor: 'pointer',
              marginTop: 2,
            }}
          >
            {pickingAvatar ? 'Done' : 'How should I appear?'}
          </button>
        </div>

        {pickingAvatar && (
          <div style={{ maxWidth: 380, margin: '0 auto 22px' }}>
            <AvatarModePicker
              value={avatarModeOf(student)}
              onChange={(m) => void chooseAvatar(m)}
              label="Tap how you'd like me to appear:"
            />
          </div>
        )}

        <section className="opener">
          <button
            type="button"
            className="bigcard"
            onClick={() => navigate(`/students/${student.id}/learn`)}
          >
            <div className="ico" style={{ background: 'var(--grow)', color: '#fff', fontSize: 22 }}>
              ✦
            </div>
            <div>
              <h3>Skills building</h3>
              <p>I’ll pick today’s lesson and we’ll learn it together.</p>
            </div>
          </button>

          <button
            type="button"
            className="bigcard"
            onClick={() => navigate(`/students/${student.id}/homework`)}
          >
            <div
              className="ico"
              style={{ background: HOMEWORK.accent }}
              dangerouslySetInnerHTML={{ __html: HOMEWORK.icon }}
            />
            <div>
              <h3>Homework help</h3>
              <p>Stuck on an assignment? Bring it here and Nikki will help you (or your child) work through it and really understand it.</p>
            </div>
          </button>

          {/* Practice SAT — HS only (grades 9–12) AND SAT-framing consent. Hidden
              for everyone else; the route re-checks the same gate. */}
          {canTakePracticeSat(student) && (
            <button
              type="button"
              className="bigcard"
              onClick={() => navigate(`/students/${student.id}/practice-sat`)}
            >
              <div className="ico" style={{ background: 'var(--navy)', color: '#fff', fontSize: 20 }}>
                ✓
              </div>
              <div>
                <h3>SAT Math Practice</h3>
                <p>A short, SAT-style Math practice section — see how you’d do.</p>
              </div>
            </button>
          )}
        </section>

        <div className="foot">
          Working level: {levelLabel(student.level).toLowerCase()} for {gradeLabel(student.grade).toLowerCase()}
        </div>
      </div>
    </div>
  )
}
