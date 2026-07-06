import { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router'
import { SUBJECTS } from '@/lib/subjects'
import { getStudent, avatarModeOf, type Student } from '@/lib/students'
import { TopMenu } from '@/components/TopMenu'
import { NikkiFace } from '@/components/NikkiFace'
import '@/styles/app-screens.css'

/**
 * Homework — Nikki asks which subject the assignment is, then opens that
 * subject's session in homework mode: the matching workspace interface plus the
 * photo/PDF upload so Nikki can see the assignment. Homework sessions are keyed
 * by subject (no per-skill scoping).
 */
export function HomeworkStart() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const [student, setStudent] = useState<Student | null>(null)

  useEffect(() => {
    if (!id) return
    let active = true
    getStudent(id).then((s) => {
      if (active) setStudent(s)
    })
    return () => {
      active = false
    }
  }, [id])

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
          <NikkiFace mode={avatarModeOf(student)} size={96} />
          <h1 className="greet">What’s the homework?</h1>
          <p className="muted">Pick the subject and bring me a photo or PDF — we’ll work through it together.</p>
        </div>
        <section className="opener">
          {SUBJECTS.map((s) => (
            <button
              key={s.id}
              type="button"
              className="bigcard"
              onClick={() => navigate(`/students/${id}/session/${s.id}?mode=homework`)}
            >
              <div className="ico" style={{ background: s.accent }} dangerouslySetInnerHTML={{ __html: s.icon }} />
              <div>
                <h3>{s.name}</h3>
                <p>{s.blurb}</p>
              </div>
            </button>
          ))}
        </section>
        <button type="button" className="opener-reassess" onClick={() => navigate(`/students/${id}`)}>
          ← Back
        </button>
      </div>
    </div>
  )
}
