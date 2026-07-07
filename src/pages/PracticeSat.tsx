import { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router'
import { getStudent, type Student } from '@/lib/students'
import { scoreChoice, summarizeAttempts, type PracticeQuestion } from '@/lib/questions'
import { assembleMathSection, canTakePracticeSat, PRACTICE_SAT_MATH_LENGTH } from '@/lib/practiceSat'
import { explainMisconception } from '@/lib/misconceptions'
import { MathText } from '@/components/MathText'
import { TopMenu } from '@/components/TopMenu'
import '@/styles/app-screens.css'

type Phase = 'loading' | 'intro' | 'test' | 'done'

/**
 * Practice SAT — Phase 1 (HS-only, consent-gated, Math-only). Deferred scoring:
 * answer every item with no per-question feedback, then a raw score and a review
 * of missed items with the Stage-4 explanation + worked solution. Read-only —
 * no mastery or question_attempts writes. It's a practice section, not a full SAT.
 */
export function PracticeSat() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()

  const [student, setStudent] = useState<Student | null>(null)
  const [questions, setQuestions] = useState<PracticeQuestion[]>([])
  const [phase, setPhase] = useState<Phase>('loading')
  const [index, setIndex] = useState(0)
  const [selected, setSelected] = useState<number | null>(null)
  const [answers, setAnswers] = useState<number[]>([])

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
      // Defense-in-depth: block direct-URL access for anyone who isn't 9–12 with
      // SAT-framing consent — the entry card is hidden for them too.
      if (!canTakePracticeSat(s)) {
        navigate(`/students/${s.id}`, { replace: true })
        return
      }
      const qs = await assembleMathSection(PRACTICE_SAT_MATH_LENGTH)
      if (!active) return
      setStudent(s)
      setQuestions(qs)
      setPhase('intro')
    })()
    return () => {
      active = false
    }
  }, [id, navigate])

  if (phase === 'loading' || !student) {
    return (
      <div className="kid-screen">
        <div className="shell">
          <p className="muted">Loading…</p>
        </div>
      </div>
    )
  }

  const backToDashboard = () => navigate(`/students/${student.id}`)

  // Nothing to serve (bank not ready) — honest empty state.
  if (questions.length === 0) {
    return (
      <div className="kid-screen">
        <div className="shell">
          <TopMenu />
          <h1 className="greet">SAT Math Practice</h1>
          <p className="muted">No practice questions are ready yet — check back soon!</p>
          <button className="btn btn-navy" onClick={backToDashboard}>
            Back to my dashboard
          </button>
        </div>
      </div>
    )
  }

  if (phase === 'intro') {
    return (
      <div className="kid-screen">
        <div className="shell">
          <TopMenu />
          <h1 className="greet">SAT Math Practice</h1>
          <div className="panel">
            <p style={{ margin: 0 }}>
              A short, SAT-style <strong>Math</strong> practice section — {questions.length} questions. Answer them all,
              then I’ll show your score and walk through anything you missed.
            </p>
            <p className="muted" style={{ margin: '12px 0 0', fontSize: 13.5 }}>
              This is a practice Math section, not a full SAT yet — no reading or writing here, and it doesn’t affect
              your progress. Take your time and give each one your best shot.
            </p>
          </div>
          <button className="btn btn-navy" onClick={() => setPhase('test')}>
            Start practice
          </button>
          <button className="btn btn-soft" style={{ marginTop: 10 }} onClick={backToDashboard}>
            Not now
          </button>
        </div>
      </div>
    )
  }

  if (phase === 'done') {
    const scored = questions.map((q, i) => ({ q, chosen: answers[i], ...scoreChoice(q.choices, answers[i]) }))
    const summary = summarizeAttempts(scored)
    const missed = scored.filter((r) => !r.isCorrect)

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
            <p className="muted" style={{ fontSize: 12.5, marginTop: 6 }}>
              Practice Math section — not a full SAT score.
            </p>
          </div>

          {missed.length > 0 ? (
            <div className="panel">
              <div className="pd-label">Let’s review what you missed</div>
              {missed.map(({ q, chosen }, k) => {
                const chosenChoice = chosen != null ? q.choices[chosen] : undefined
                const hint = explainMisconception(chosenChoice?.misconception_token)
                return (
                  <div key={q.id} className="sat-review-item">
                    <div className="sat-review-q">
                      <span className="sat-review-n">{k + 1}.</span>
                      <MathText content={q.stem} />
                    </div>
                    <p className="sat-review-line">
                      <span className="muted">Your answer:</span>{' '}
                      {chosenChoice ? <MathText content={chosenChoice.text} /> : <em>—</em>}
                    </p>
                    <p className="sat-review-line">
                      <span className="muted">Correct answer:</span>{' '}
                      <strong>{q.correct_answer}</strong>
                    </p>
                    {hint && <p className="practice-explain">{hint}</p>}
                    {q.solution && (
                      <div className="practice-solution">
                        <MathText content={q.solution} />
                      </div>
                    )}
                  </div>
                )
              })}
            </div>
          ) : (
            <div className="panel">
              <p style={{ margin: 0 }}>Perfect score — you didn’t miss any. 🎉</p>
            </div>
          )}

          <button className="btn btn-navy" onClick={backToDashboard}>
            Back to my dashboard
          </button>
        </div>
      </div>
    )
  }

  // phase === 'test' — one question at a time, no feedback until the end.
  const current = questions[index]
  const isLast = index + 1 >= questions.length

  const handleNext = () => {
    if (selected === null) return
    const nextAnswers = [...answers, selected]
    setAnswers(nextAnswers)
    setSelected(null)
    if (isLast) setPhase('done')
    else setIndex(index + 1)
  }

  return (
    <div className="kid-screen">
      <div className="shell">
        <TopMenu />
        <p className="practice-solo">SAT Math Practice — answer your best, review at the end.</p>
        <div className="practice-progress muted">
          Question {index + 1} of {questions.length}
        </div>
        <div className="panel practice-q">
          <div className="practice-stem">
            <MathText content={current.stem} />
          </div>
          <div className="practice-choices">
            {current.choices.map((c, i) => (
              <button
                key={i}
                className={`practice-choice ${selected === i ? 'chosen' : ''}`}
                onClick={() => setSelected(i)}
              >
                <MathText content={c.text} />
              </button>
            ))}
          </div>
          <button className="btn btn-navy" disabled={selected === null} onClick={handleNext}>
            {isLast ? 'Finish & see score' : 'Next question'}
          </button>
        </div>
      </div>
    </div>
  )
}

// Always encouraging — a practice score is progress, never punishing.
function encouragement(accuracy: number): string {
  if (accuracy >= 80) return "Strong work — you're handling real SAT-style math well."
  if (accuracy >= 50) return 'Solid effort! Reviewing the misses below is exactly how the score climbs.'
  return 'Great job sticking with it — SAT math takes practice. Review below and try again soon.'
}
