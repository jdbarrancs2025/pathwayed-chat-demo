import { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router'
import { getStudent, type Student } from '@/lib/students'
import {
  fetchPracticeQuestions,
  recordQuestionAttempt,
  scoreChoice,
  summarizeAttempts,
  type PracticeQuestion,
} from '@/lib/questions'
import { recordPracticeResult } from '@/lib/skills'
import { MathText } from '@/components/MathText'
import { TopMenu } from '@/components/TopMenu'
import '@/styles/app-screens.css'

const SESSION_LENGTH = 10

/**
 * Question Engine, Stage 3 — minimal serve -> score -> mastery Practice flow.
 * One question at a time, immediate feedback + solution, and at session end the
 * aggregate accuracy feeds recordPracticeResult (real scored mastery). Kept
 * deliberately simple. Encouraging throughout — a low score never feels punishing.
 */
export function Practice() {
  const { id, skill } = useParams<{ id: string; skill: string }>()
  const skillSlug = skill ?? 'multiplication'
  const navigate = useNavigate()

  const [student, setStudent] = useState<Student | null>(null)
  const [questions, setQuestions] = useState<PracticeQuestion[] | null>(null)
  const [index, setIndex] = useState(0)
  const [selected, setSelected] = useState<number | null>(null)
  const [results, setResults] = useState<{ isCorrect: boolean }[]>([])
  const [shownAt, setShownAt] = useState(0)
  const [done, setDone] = useState(false)
  const [saving, setSaving] = useState(false)

  useEffect(() => {
    if (!id) return
    let active = true
    Promise.all([getStudent(id), fetchPracticeQuestions(skillSlug, SESSION_LENGTH)]).then(([s, qs]) => {
      if (!active) return
      if (!s) {
        navigate('/students', { replace: true })
        return
      }
      setStudent(s)
      setQuestions(qs)
      setShownAt(Date.now())
    })
    return () => {
      active = false
    }
  }, [id, skillSlug, navigate])

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
          <h1 className="greet">Practice</h1>
          <p className="muted">No practice questions are ready yet — check back soon!</p>
          <button className="btn btn-navy" onClick={() => navigate(`/students/${student.id}`)}>
            Back to my dashboard
          </button>
        </div>
      </div>
    )
  }

  const handlePick = (choiceIndex: number) => {
    // TEMP diagnostic — confirms the click handler fires (remove after verify).
    console.debug('[practice] handlePick', { choiceIndex, alreadyAnswered: selected !== null })
    const current = questions[index]
    if (selected !== null || !current) return
    setSelected(choiceIndex)
    const { isCorrect, misconceptionToken } = scoreChoice(current.choices, choiceIndex)
    setResults((r) => [...r, { isCorrect }])
    // Append-only, fire-and-forget: a mid-session quit still records this answer.
    void recordQuestionAttempt({
      studentId: student.id,
      generatedQuestionId: current.id,
      skillId: current.skill_id,
      satAlignment: current.sat_alignment,
      isCorrect,
      chosenChoiceIndex: choiceIndex,
      chosenMisconceptionToken: misconceptionToken,
      shownAtMs: shownAt,
    })
  }

  const handleNext = async () => {
    if (index + 1 < questions.length) {
      setIndex(index + 1)
      setSelected(null)
      setShownAt(Date.now())
      return
    }
    // Last question answered -> finish. One practice session = one mastery
    // attempt increment, from the session's aggregate accuracy.
    setDone(true)
    setSaving(true)
    const summary = summarizeAttempts(results)
    try {
      await recordPracticeResult(student.id, questions[0].skill_id, summary.accuracy)
    } catch (err) {
      console.error('recordPracticeResult failed', err)
    }
    setSaving(false)
  }

  if (done) {
    const summary = summarizeAttempts(results)
    return (
      <div className="kid-screen">
        <div className="shell">
          <TopMenu />
          <h1 className="greet">Nice work, {student.first_name}!</h1>
          <div className="panel practice-summary">
            <p className="practice-score">
              {summary.correct} <span className="muted">/ {summary.total}</span>
            </p>
            <p className="practice-encourage">{encouragement(summary.accuracy)}</p>
            {saving && <p className="muted">Saving your progress…</p>}
          </div>
          <button className="btn btn-navy" disabled={saving} onClick={() => navigate(`/students/${student.id}`)}>
            Back to my dashboard
          </button>
        </div>
      </div>
    )
  }

  const current = questions[index]
  const answered = selected !== null
  const lastResult = results[results.length - 1]

  return (
    <div className="kid-screen">
      <div className="shell">
        <TopMenu />
        <div className="practice-progress muted">
          Question {index + 1} of {questions.length}
        </div>
        <div className="panel practice-q">
          <div className="practice-stem">
            <MathText content={current.stem} />
          </div>
          <div className="practice-choices">
            {current.choices.map((c, i) => {
              const state = !answered ? '' : c.is_correct ? 'correct' : i === selected ? 'chosen-wrong' : 'dim'
              return (
                <button
                  key={i}
                  className={`practice-choice ${state}`}
                  disabled={answered}
                  onClick={() => handlePick(i)}
                >
                  <MathText content={c.text} />
                </button>
              )
            })}
          </div>

          {answered && (
            <div className="practice-feedback">
              <p className={`practice-verdict ${lastResult?.isCorrect ? 'good' : 'soft'}`}>
                {lastResult?.isCorrect ? 'Correct! 🎉' : `Good try — the answer is ${current.correct_answer}.`}
              </p>
              {current.solution && (
                <div className="practice-solution">
                  <MathText content={current.solution} />
                </div>
              )}
              <button className="btn btn-navy" onClick={() => void handleNext()}>
                {index + 1 < questions.length ? 'Next question' : 'Finish'}
              </button>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}

// Always encouraging — even a low score is framed as progress, never punishing.
function encouragement(accuracy: number): string {
  if (accuracy >= 80) return "You're really getting this. Keep up the great work!"
  if (accuracy >= 50) return 'Nice effort! Every round of practice makes you stronger.'
  return 'Great job sticking with it — practice is exactly how we get better. Try another round soon!'
}
