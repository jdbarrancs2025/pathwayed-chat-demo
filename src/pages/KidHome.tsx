import { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router'
import { getStudent, gradeLabel, levelLabel, avatarModeOf, type Student } from '@/lib/students'
import { HOMEWORK } from '@/lib/subjects'
import { TopMenu } from '@/components/TopMenu'
import { NikkiFace } from '@/components/NikkiFace'
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
        <TopMenu />

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
          <NikkiFace mode={avatarModeOf(student)} size={104} />
          <h1 className="greet">Hi, {student.first_name}!</h1>
          <p className="muted">Great to see you. What are we doing today?</p>
        </div>

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
              <h3>Homework</h3>
              <p>Bring an assignment and we’ll work through it together.</p>
            </div>
          </button>
        </section>

        <div className="foot">
          Working level: {levelLabel(student.level).toLowerCase()} for {gradeLabel(student.grade).toLowerCase()}
        </div>
      </div>
    </div>
  )
}
