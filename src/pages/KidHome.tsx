import { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router'
import { getStudent, gradeLabel, levelLabel, type Student, type StudentLevel } from '@/lib/students'
import { SUBJECTS } from '@/lib/subjects'
import { listSavedSubjects } from '@/lib/sessions'
import { nextPracticeSkill, type PracticeableSkill } from '@/lib/questions'
import { showKidSatFraming } from '@/lib/satFraming'
import { TopMenu } from '@/components/TopMenu'
import { StudentProgress } from '@/components/StudentProgress'
import { PracticeSkills } from '@/components/PracticeSkills'
import { SessionOpener } from '@/components/SessionOpener'
import '@/styles/app-screens.css'

export function KidHome() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const [student, setStudent] = useState<Student | null>(null)
  const [savedSubjects, setSavedSubjects] = useState<Set<string>>(new Set())
  const [nextSkill, setNextSkill] = useState<PracticeableSkill | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (!id) return
    let active = true
    Promise.all([getStudent(id), listSavedSubjects(id), nextPracticeSkill(id)]).then(([s, subjects, next]) => {
      if (!active) return
      if (!s) {
        navigate('/students', { replace: true })
        return
      }
      setStudent(s)
      setSavedSubjects(new Set(subjects))
      setNextSkill(next)
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
        <p className="muted">What’s the plan today?</p>

        {/* Session opener — the branch: homework help vs. keep going at their
            real level, with re-checking always available. */}
        <SessionOpener
          studentId={student.id}
          studentName={student.first_name}
          level={student.level as StudentLevel}
          nextSkill={nextSkill}
        />

        <p className="muted opener-more">Or pick a subject to learn something new:</p>
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

        <PracticeSkills studentId={student.id} />

        <StudentProgress
          studentId={student.id}
          grade={student.grade}
          onOpenSubject={open}
          showSatFraming={showKidSatFraming({ grade: student.grade, above_grade_ok: student.above_grade_ok })}
        />

        <div className="foot">
          Working level: {levelLabel(student.level).toLowerCase()} for {gradeLabel(student.grade).toLowerCase()}
        </div>
      </div>
    </div>
  )
}
