import { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router'
import { getStudent, type Student } from '@/lib/students'
import { SUBJECTS, type SubjectDef } from '@/lib/subjects'
import {
  scopeBandForGrade,
  hasAnyMastery,
  nextLesson,
  SCOPE_SUBJECTS,
  type Lesson,
} from '@/lib/lessonPath'
import type { ScopeSubject } from '@/lib/scopeSequence'
import { TopMenu } from '@/components/TopMenu'
import { NikkiOrb } from '@/components/NikkiOrb'
import '@/styles/app-screens.css'

// Remember the subject the kid last built, so a return visit leads with it.
const lastSubjectKey = (id: string) => `pathwayed:lastSubject:${id}`
function readLastSubject(id: string): ScopeSubject | null {
  const v = localStorage.getItem(lastSubjectKey(id))
  return v === 'math' || v === 'reading' || v === 'writing' ? v : null
}
function writeLastSubject(id: string, subject: ScopeSubject) {
  try {
    localStorage.setItem(lastSubjectKey(id), subject)
  } catch {
    /* private mode / storage full — leading-subject memory is a nicety, ignore */
  }
}

const subjectDefs = new Map<string, SubjectDef>(SUBJECTS.map((s) => [s.id, s]))

const hero = {
  display: 'flex',
  flexDirection: 'column' as const,
  alignItems: 'center',
  textAlign: 'center' as const,
  gap: 4,
  marginBottom: 22,
}

/**
 * Skills building — the learning-path entry. First arrival (no mastery) runs the
 * reused placement diagnostic; then Nikki asks which subject, walks that subject's
 * approved sequence to today's lesson, names it, and launches the chat Session
 * with the skill as focus. Science and k-2 have no track → coming-soon → homework.
 */
export function SkillsBuilding() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const [student, setStudent] = useState<Student | null>(null)
  const [phase, setPhase] = useState<'loading' | 'coming-soon' | 'need-check' | 'pick' | 'lesson'>('loading')
  const [lastSubject, setLastSubject] = useState<ScopeSubject | null>(null)
  const [lesson, setLesson] = useState<Lesson | null>(null)
  const [lessonLoading, setLessonLoading] = useState(false)

  useEffect(() => {
    if (!id) return
    let active = true
    ;(async () => {
      const s = await getStudent(id)
      if (!active) return
      if (!s) {
        navigate('/students', { replace: true })
        return
      }
      setStudent(s)
      if (!scopeBandForGrade(s.grade)) {
        setPhase('coming-soon')
        return
      }
      const assessed = await hasAnyMastery(s.id)
      if (!active) return
      if (!assessed) {
        setPhase('need-check')
        return
      }
      setLastSubject(readLastSubject(s.id))
      setPhase('pick')
    })()
    return () => {
      active = false
    }
  }, [id, navigate])

  const pickSubject = async (subject: ScopeSubject) => {
    if (!student) return
    writeLastSubject(student.id, subject)
    setLesson(null)
    setLessonLoading(true)
    setPhase('lesson')
    const l = await nextLesson(student.id, student.grade, subject)
    setLesson(l)
    setLessonLoading(false)
  }

  const startLesson = () => {
    if (!student || !lesson) return
    navigate(`/students/${student.id}/session/${lesson.subject}?skill=${encodeURIComponent(lesson.slug)}`)
  }

  if (phase === 'loading' || !student) {
    return (
      <div className="kid-screen">
        <div className="shell">
          <p className="muted">Loading…</p>
        </div>
      </div>
    )
  }

  // Subjects to offer, leading with the one the kid was last in.
  const orderedSubjects: ScopeSubject[] = lastSubject
    ? [lastSubject, ...SCOPE_SUBJECTS.filter((s) => s !== lastSubject)]
    : SCOPE_SUBJECTS

  return (
    <div className="kid-screen">
      <div className="shell">
        <TopMenu />

        {phase === 'coming-soon' && (
          <>
            <div style={hero}>
              <NikkiOrb size={96} />
              <h1 className="greet">Skills building</h1>
              <p className="muted">
                My guided lessons for this grade are coming soon. In the meantime, bring me your homework and we’ll
                work through it together.
              </p>
            </div>
            <button type="button" className="bigcard" onClick={() => navigate(`/students/${student.id}/homework`)}>
              <div className="ico" style={{ background: 'var(--grow)', color: '#fff', fontSize: 22 }}>
                ✎
              </div>
              <div>
                <h3>Homework help</h3>
                <p>Bring an assignment and we’ll work through it together.</p>
              </div>
            </button>
            <button type="button" className="opener-reassess" onClick={() => navigate(`/students/${student.id}`)}>
              ← Back
            </button>
          </>
        )}

        {phase === 'need-check' && (
          <>
            <div style={hero}>
              <NikkiOrb size={96} />
              <h1 className="greet">Let’s get started, {student.first_name}!</h1>
              <p className="muted">
                First, a quick check so I can pick just-right lessons for you. It’s short — no grades, just so I know
                where to begin.
              </p>
            </div>
            <button
              type="button"
              className="btn btn-navy"
              onClick={() =>
                navigate(
                  `/students/${student.id}/diagnostic?return=${encodeURIComponent(`/students/${student.id}/learn`)}`,
                )
              }
            >
              Start the quick check
            </button>
            <button type="button" className="opener-reassess" onClick={() => navigate(`/students/${student.id}`)}>
              ← Back
            </button>
          </>
        )}

        {phase === 'pick' && (
          <>
            <div style={hero}>
              <NikkiOrb size={96} />
              <h1 className="greet">What do you want to build today?</h1>
              <p className="muted">Pick a subject and I’ll pull up your next lesson.</p>
            </div>
            <section className="opener">
              {orderedSubjects.map((subj, i) => {
                const def = subjectDefs.get(subj)
                return (
                  <button key={subj} type="button" className="bigcard" onClick={() => pickSubject(subj)}>
                    {i === 0 && lastSubject && <span className="resume">Continue</span>}
                    <div
                      className="ico"
                      style={{ background: def?.accent }}
                      dangerouslySetInnerHTML={{ __html: def?.icon ?? '' }}
                    />
                    <div>
                      <h3>{def?.name ?? subj}</h3>
                      <p>{def?.blurb ?? ''}</p>
                    </div>
                  </button>
                )
              })}
            </section>
            <button type="button" className="opener-reassess" onClick={() => navigate(`/students/${student.id}`)}>
              ← Back
            </button>
          </>
        )}

        {phase === 'lesson' && (
          <>
            <div style={hero}>
              <NikkiOrb size={96} state={lessonLoading ? 'thinking' : 'idle'} />
              {lessonLoading ? (
                <h1 className="greet">Picking today’s lesson…</h1>
              ) : lesson ? (
                <>
                  <h1 className="greet">Today we’re working on {lesson.label}.</h1>
                  <p className="muted">
                    {lesson.trackComplete
                      ? `You’ve mastered every ${lesson.subject} skill here — let’s keep ${lesson.label} sharp.`
                      : `I’ll show you how it works and we’ll practice together.`}
                  </p>
                </>
              ) : (
                <h1 className="greet">Hmm, I couldn’t line up a lesson.</h1>
              )}
            </div>
            {!lessonLoading && lesson && (
              <button type="button" className="btn btn-navy" onClick={startLesson}>
                Let’s go →
              </button>
            )}
            <button type="button" className="opener-reassess" onClick={() => setPhase('pick')}>
              ← Pick a different subject
            </button>
          </>
        )}
      </div>
    </div>
  )
}
