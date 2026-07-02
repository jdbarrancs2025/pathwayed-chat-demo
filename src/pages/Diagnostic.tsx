import { useEffect, useRef, useState } from 'react'
import { useNavigate, useParams } from 'react-router'
import { getStudent, type Student } from '@/lib/students'
import { fetchDiagnosticQuestions, recordQuestionAttempt, scoreChoice, type PracticeQuestion } from '@/lib/questions'
import { MathText } from '@/components/MathText'
import { TopMenu } from '@/components/TopMenu'
import '@/styles/app-screens.css'

/**
 * Placement diagnostic — PHASE 1 (silent scoring). Serves one published question
 * from each practiceable skill and RECORDS each answer (append-only
 * question_attempts) with NO teaching feedback: no correct/try-again, no
 * solution, no Stage-4 explanation. Just present -> record -> advance.
 *
 * This reuses the normal serve + score path (fetchDiagnosticQuestions +
 * scoreChoice + recordQuestionAttempt). It deliberately does NOT seed mastery or
 * compute a placement — Phase 2 will turn the recorded attempts into a level
 * estimate. Temporary verification route: /students/:id/diagnostic (NOT wired
 * into onboarding).
 */
export function Diagnostic() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()
  const [student, setStudent] = useState<Student | null>(null)
  const [questions, setQuestions] = useState<PracticeQuestion[] | null>(null)
  const [index, setIndex] = useState(0)
  const [done, setDone] = useState(false)
  // When the current question was presented, for time_ms. Stamped in an effect
  // (Date.now() is only valid outside render), never in the click handler.
  const shownAtRef = useRef(0)

  useEffect(() => {
    if (!id) return
    let active = true
    Promise.all([getStudent(id), fetchDiagnosticQuestions(1)]).then(([s, qs]) => {
      if (!active) return
      if (!s) {
        navigate('/students', { replace: true })
        return
      }
      setStudent(s)
      setQuestions(qs)
    })
    return () => {
      active = false
    }
  }, [id, navigate])

  // Stamp the presented-at time whenever a new question is shown.
  useEffect(() => {
    shownAtRef.current = Date.now()
  }, [index, questions])

  if (!student || !questions) {
    return (
      <div className="kid-screen">
        <div className="shell">
          <p className="muted">Loading…</p>
        </div>
      </div>
    )
  }

  if (questions.length === 0) {
    return (
      <div className="kid-screen">
        <div className="shell">
          <TopMenu />
          <h1 className="greet">Check back soon</h1>
          <p className="muted">No diagnostic questions are ready yet.</p>
          <button className="btn btn-navy" onClick={() => navigate(`/students/${student.id}`)}>
            Back to my dashboard
          </button>
        </div>
      </div>
    )
  }

  // Silent scoring: score the pick, record the attempt (fire-and-forget), and
  // advance immediately. No feedback of any kind is shown.
  const handlePick = (choiceIndex: number) => {
    const current = questions[index]
    if (!current) return
    const { isCorrect, misconceptionToken } = scoreChoice(current.choices, choiceIndex)
    void recordQuestionAttempt({
      studentId: student.id,
      generatedQuestionId: current.id,
      skillId: current.skill_id,
      satAlignment: current.sat_alignment,
      isCorrect,
      chosenChoiceIndex: choiceIndex,
      chosenMisconceptionToken: misconceptionToken,
      shownAtMs: shownAtRef.current,
    })
    if (index + 1 < questions.length) {
      setIndex(index + 1)
    } else {
      setDone(true)
    }
  }

  if (done) {
    return (
      <div className="kid-screen">
        <div className="shell">
          <TopMenu />
          <h1 className="greet">All done, {student.first_name}!</h1>
          <p className="muted">Thanks for working through those — your answers are saved.</p>
          <button className="btn btn-navy" onClick={() => navigate(`/students/${student.id}`)}>
            Back to my dashboard
          </button>
        </div>
      </div>
    )
  }

  const current = questions[index]
  return (
    <div className="kid-screen">
      <div className="shell">
        <TopMenu />
        <p className="practice-solo">Just do your best — this helps us find the right level for you.</p>
        <div className="practice-progress muted">
          Question {index + 1} of {questions.length}
        </div>
        <div className="panel practice-q">
          <div className="practice-stem">
            <MathText content={current.stem} />
          </div>
          <div className="practice-choices">
            {current.choices.map((c, i) => (
              <button key={i} className="practice-choice" onClick={() => handlePick(i)}>
                <MathText content={c.text} />
              </button>
            ))}
          </div>
        </div>
      </div>
    </div>
  )
}
