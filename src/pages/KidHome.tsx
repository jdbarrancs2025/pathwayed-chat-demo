import { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router'
import { getStudent, gradeLabel, levelLabel, type Student } from '@/lib/students'
import { SUBJECTS, HOMEWORK } from '@/lib/subjects'
import { listSavedSubjects } from '@/lib/sessions'
import { TopMenu } from '@/components/TopMenu'
import '@/styles/app-screens.css'

export function KidHome() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const [student, setStudent] = useState<Student | null>(null)
  const [savedSubjects, setSavedSubjects] = useState<Set<string>>(new Set())
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (!id) return
    let active = true
    Promise.all([getStudent(id), listSavedSubjects(id)]).then(([s, subjects]) => {
      if (!active) return
      if (!s) {
        navigate('/students', { replace: true })
        return
      }
      setStudent(s)
      setSavedSubjects(new Set(subjects))
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

  const open = (subject: string) => navigate(`/students/${student.id}/session/${subject}`)

  return (
    <div className="kid-screen">
      <div className="shell">
        <TopMenu />

        <h1 className="greet">Hi, {student.first_name}.</h1>
        <p className="muted">What do you want to work on today?</p>

        <div className="subjects">
          {SUBJECTS.map((s) => (
            <button key={s.id} className="subject" onClick={() => open(s.id)}>
              {savedSubjects.has(s.id) && <span className="resume">Continue</span>}
              <div
                className="ico"
                style={{ background: s.accent }}
                dangerouslySetInnerHTML={{ __html: s.icon }}
              />
              <h3>{s.name}</h3>
              <p>{s.blurb}</p>
            </button>
          ))}
        </div>

        <button className="bigcard" onClick={() => open('homework')}>
          {savedSubjects.has('homework') && <span className="resume">Continue</span>}
          <div
            className="ico"
            style={{ background: HOMEWORK.accent }}
            dangerouslySetInnerHTML={{ __html: HOMEWORK.icon }}
          />
          <div>
            <h3>{HOMEWORK.name}</h3>
            <p>{HOMEWORK.blurb}</p>
          </div>
        </button>

        <div className="foot">
          Working level: {levelLabel(student.level).toLowerCase()} for {gradeLabel(student.grade).toLowerCase()}
        </div>
      </div>
    </div>
  )
}
