import { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router'
import { getStudent, type Student } from '@/lib/students'
import { scoreChoice, summarizeAttempts, type PracticeQuestion } from '@/lib/questions'
import {
  assembleMathSection,
  assembleReadingWritingSection,
  canTakePracticeSat,
  sectionOf,
  PRACTICE_SAT_MATH_LENGTH,
} from '@/lib/practiceSat'
import { recordSatMisses } from '@/lib/focusSkills'
import { explainMisconception } from '@/lib/misconceptions'
import { MathText } from '@/components/MathText'
import { TopMenu } from '@/components/TopMenu'
import '@/styles/app-screens.css'

type Phase = 'loading' | 'intro' | 'test' | 'done'

/**
 * Practice SAT — Phase 3 (HS-only, consent-gated): a short Reading & Writing
 * section then Math, SAT-shaped at small scale. Deferred scoring: answer every
 * item with no per-question feedback, then a RAW score per section + overall
 * (no scaled 400–1600) and a review of missed items with the Stage-4 explanation
 * + worked solution. Read-only apart from writing missed skills to the focus
 * mechanism. It's a practice test, not a full SAT.
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
      // Reading & Writing first, then Math — real-SAT order, at small scale.
      const [rw, math] = await Promise.all([
        assembleReadingWritingSection(),
        assembleMathSection(PRACTICE_SAT_MATH_LENGTH),
      ])
      if (!active) return
      setStudent(s)
      setQuestions([...rw, ...math])
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
          <h1 className="greet">SAT Practice</h1>
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
          <h1 className="greet">SAT Practice</h1>
          <div className="panel">
            <p style={{ margin: 0 }}>
              A short, SAT-style practice test — {questions.length} questions across a{' '}
              <strong>Reading &amp; Writing</strong> section and a <strong>Math</strong> section. Answer them all, then
              I’ll show your score for each section and walk through anything you missed.
            </p>
            <p className="muted" style={{ margin: '12px 0 0', fontSize: 13.5 }}>
              This is a shortened practice test, not a full SAT, and it doesn’t affect your progress. Take your time and
              give each one your best shot.
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
    const scored = questions.map((q, i) => ({ q, chosen: answers[i], section: sectionOf(q), ...scoreChoice(q.choices, answers[i]) }))
    const summary = summarizeAttempts(scored)
    const rwSummary = summarizeAttempts(scored.filter((r) => r.section === 'rw'))
    const mathSummary = summarizeAttempts(scored.filter((r) => r.section === 'math'))
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
            <div className="sat-section-scores">
              {rwSummary.total > 0 && (
                <span>
                  Reading &amp; Writing <strong>{rwSummary.correct}/{rwSummary.total}</strong>
                </span>
              )}
              {mathSummary.total > 0 && (
                <span>
                  Math <strong>{mathSummary.correct}/{mathSummary.total}</strong>
                </span>
              )}
            </div>
            <p className="practice-encourage">{encouragement(summary.accuracy)}</p>
            <p className="muted" style={{ fontSize: 12.5, marginTop: 6 }}>
              Raw practice score per section — not a scaled SAT score.
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
                    {q.passage && (
                      <div className="practice-passage">
                        <MathText content={q.passage} />
                      </div>
                    )}
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
  const sectionLabel = sectionOf(current) === 'rw' ? 'Reading & Writing' : 'Math'

  const handleNext = () => {
    if (selected === null) return
    const nextAnswers = [...answers, selected]
    setAnswers(nextAnswers)
    setSelected(null)
    if (isLast) {
      // Phase 2: record the missed SKILLS as focus skills so the learning path
      // serves them next. The only practice-SAT DB write; still no mastery or
      // question_attempts writes. Best-effort, fire-and-forget.
      const missedSkillIds = questions
        .filter((q, i) => !scoreChoice(q.choices, nextAnswers[i]).isCorrect)
        .map((q) => q.skill_id)
      void recordSatMisses(student.id, missedSkillIds)
      setPhase('done')
    } else {
      setIndex(index + 1)
    }
  }

  return (
    <div className="kid-screen">
      <div className="shell">
        <TopMenu />
        <p className="practice-solo">SAT Practice — answer your best, review at the end.</p>
        <div className="practice-progress muted">
          <span className="sat-section-tag">{sectionLabel}</span> · Question {index + 1} of {questions.length}
        </div>
        <div className="panel practice-q">
          {current.passage && (
            <div className="practice-passage">
              <MathText content={current.passage} />
            </div>
          )}
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
  if (accuracy >= 80) return "Strong work — you're handling real SAT-style questions well."
  if (accuracy >= 50) return 'Solid effort! Reviewing the misses below is exactly how the score climbs.'
  return 'Great job sticking with it — the SAT takes practice. Review below and try again soon.'
}
