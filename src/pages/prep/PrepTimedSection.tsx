import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { useNavigate, useParams } from 'react-router'
import { getStudent, type Student } from '@/lib/students'
import { getPrepModule } from '@/lib/prep/registry'
import type { PrepModule, PrepSection } from '@/lib/prep/types'
import { getPrepEntitlements, isKidEntitled } from '@/lib/prep/entitlements'
import {
  finalizeAttempt,
  findInProgressAttempt,
  getRemaining,
  saveAnswers,
  startOrResumeSection,
  type PrepAttempt,
} from '@/lib/prep/timedSection'
import { fetchQuestionsByIds, type PracticeQuestion } from '@/lib/questions'
import { MathText } from '@/components/MathText'
import '@/styles/app-screens.css'

// NOTE: No Nikki / voice imports in this file. The timed test never involves Nikki
// (rule 2); explanations return only on the review screen.

type Phase = 'loading' | 'notenough' | 'prestart' | 'intest' | 'error'
const SYNC_MS = 20000 // how often to re-sync the countdown to the server clock
const URGENT_SEC = 120 // visual urgency threshold

function mmss(total: number | null): string {
  const s = Math.max(0, Math.floor(total ?? 0))
  const m = Math.floor(s / 60)
  const r = s % 60
  return `${m}:${r.toString().padStart(2, '0')}`
}

function minutesLabel(sec: number): string {
  const m = Math.round(sec / 60)
  return `${m} min`
}

export function PrepTimedSection() {
  const { id, moduleId, sectionId } = useParams<{ id: string; moduleId: string; sectionId: string }>()
  const navigate = useNavigate()

  const module: PrepModule | undefined = moduleId ? getPrepModule(moduleId as PrepModule['id']) : undefined
  const section: PrepSection | undefined = module?.sections.find((s) => s.id === sectionId)

  const [phase, setPhase] = useState<Phase>('loading')
  const [, setStudent] = useState<Student | null>(null)
  const [attempt, setAttempt] = useState<PrepAttempt | null>(null)
  const [questions, setQuestions] = useState<PracticeQuestion[]>([])
  const [answers, setAnswers] = useState<Record<string, number>>({})
  const [flags, setFlags] = useState<Set<string>>(new Set())
  const [idx, setIdx] = useState(0)
  const [remaining, setRemaining] = useState<number | null>(null)
  const [frozen, setFrozen] = useState(false)
  const [confirmSubmit, setConfirmSubmit] = useState(false)
  const [leaving, setLeaving] = useState(false)
  const [starting, setStarting] = useState(false)

  const answersRef = useRef<Record<string, number>>({})
  const submittedRef = useRef(false)
  const saveTimer = useRef<ReturnType<typeof setTimeout> | null>(null)

  // ---- Finalize (submit or expiry). Single-shot; flushes answers first. --------
  const finalize = useCallback(
    async (clientExpired: boolean) => {
      const a = attempt
      if (submittedRef.current || !a) return
      submittedRef.current = true
      setFrozen(true)
      if (saveTimer.current) clearTimeout(saveTimer.current)
      await saveAnswers(a.id, answersRef.current) // best-effort flush (trigger may reject if past window)
      try {
        const fin = await finalizeAttempt(a.id, clientExpired)
        navigate(`/students/${id}/prep/${moduleId}/review/${fin.id}`, { replace: true })
      } catch {
        submittedRef.current = false
        setPhase('error')
      }
    },
    [attempt, id, moduleId, navigate],
  )

  // ---- Load / guard / resume ---------------------------------------------------
  useEffect(() => {
    if (!id || !moduleId || !sectionId) return
    let active = true
    ;(async () => {
      const s = await getStudent(id)
      if (!active) return
      if (!s) {
        navigate('/students', { replace: true })
        return
      }
      const ents = await getPrepEntitlements([id])
      if (!active) return
      const ok = !!module && !!section && ents.some((e) => e.moduleId === moduleId && isKidEntitled(e.status))
      if (!ok) {
        navigate(`/students/${id}`, { replace: true })
        return
      }
      setStudent(s)

      // Resume an existing in-progress attempt without a pre-start screen.
      const existing = await findInProgressAttempt(id, moduleId, sectionId)
      if (!active) return
      if (existing) {
        const rem = await getRemaining(existing.id)
        if (!active) return
        if (rem !== null && rem <= 0) {
          // Reopened after time ran out: finalize (server marks expired) -> review.
          const fin = await finalizeAttempt(existing.id, false)
          navigate(`/students/${id}/prep/${moduleId}/review/${fin.id}`, { replace: true })
          return
        }
        const qs = await fetchQuestionsByIds(existing.questionIds)
        if (!active) return
        setAttempt(existing)
        setQuestions(qs)
        setAnswers(existing.answers)
        answersRef.current = existing.answers
        setRemaining(rem)
        setPhase('intest')
      } else {
        setPhase('prestart')
      }
    })().catch(() => {
      if (active) setPhase('error')
    })
    return () => {
      active = false
    }
  }, [id, moduleId, sectionId, module, section, navigate])

  // ---- Countdown tick (local, anchored to the last server sync) ----------------
  useEffect(() => {
    if (phase !== 'intest' || frozen || remaining === null) return
    if (remaining <= 0) {
      // Time is up: autosubmit, deferred out of the effect body (finalize sets
      // state); submittedRef makes it single-shot.
      const t = setTimeout(() => void finalize(true), 0)
      return () => clearTimeout(t)
    }
    const t = setTimeout(() => setRemaining((r) => (r === null ? r : r - 1)), 1000)
    return () => clearTimeout(t)
  }, [phase, frozen, remaining, finalize])

  // ---- Periodic + on-focus re-sync to the server clock (authoritative) ----------
  useEffect(() => {
    if (phase !== 'intest' || !attempt) return
    let active = true
    const sync = async () => {
      const rem = await getRemaining(attempt.id)
      if (active && rem !== null) setRemaining(rem)
    }
    const iv = setInterval(sync, SYNC_MS)
    const onVis = () => {
      if (document.visibilityState === 'visible') void sync()
    }
    document.addEventListener('visibilitychange', onVis)
    return () => {
      active = false
      clearInterval(iv)
      document.removeEventListener('visibilitychange', onVis)
    }
  }, [phase, attempt])

  // Hold the attempt id for the debounced save without re-creating the callback.
  const attemptIdRef = useRef<string>('')
  useEffect(() => {
    attemptIdRef.current = attempt?.id ?? ''
  }, [attempt])

  const scheduleSave = useCallback(() => {
    if (saveTimer.current) clearTimeout(saveTimer.current)
    saveTimer.current = setTimeout(() => {
      void saveAnswers(attemptIdRef.current, answersRef.current)
    }, 600)
  }, [])

  const selectAnswer = (qid: string, choiceIndex: number) => {
    if (frozen) return
    const next = { ...answersRef.current, [qid]: choiceIndex }
    answersRef.current = next
    setAnswers(next)
    scheduleSave()
  }

  const toggleFlag = (qid: string) => {
    setFlags((prev) => {
      const next = new Set(prev)
      if (next.has(qid)) next.delete(qid)
      else next.add(qid)
      return next
    })
  }

  const start = async () => {
    if (starting || !module || !section || !id) return
    setStarting(true)
    try {
      const res = await startOrResumeSection(id, module, section)
      if ('notEnough' in res) {
        setPhase('notenough')
        setStarting(false)
        return
      }
      setAttempt(res.attempt)
      setQuestions(res.questions)
      setAnswers(res.attempt.answers)
      answersRef.current = res.attempt.answers
      setRemaining(res.attempt.remainingSeconds)
      setPhase('intest')
    } catch {
      setPhase('error')
      setStarting(false)
    }
  }

  const unanswered = useMemo(
    () => questions.filter((q) => answers[q.id] === undefined).length,
    [questions, answers],
  )

  // ---- Render ------------------------------------------------------------------
  if (!module || !section) {
    return (
      <div className="kid-screen">
        <div className="shell">
          <p className="muted">Loading…</p>
        </div>
      </div>
    )
  }

  if (phase === 'loading') {
    return (
      <div className="kid-screen">
        <div className="shell">
          <p className="muted">Loading…</p>
        </div>
      </div>
    )
  }

  if (phase === 'error') {
    return (
      <div className="kid-screen">
        <div className="shell">
          <div className="panel" style={{ padding: 20, textAlign: 'center' }}>
            <h3>Something went wrong</h3>
            <p className="muted" style={{ fontSize: 13.5 }}>Let’s head back and try again.</p>
            <button className="btn btn-soft" style={{ marginTop: 12 }} onClick={() => navigate(`/students/${id}/prep/${moduleId}?tab=test`)}>
              Back to {module.name} Prep
            </button>
          </div>
        </div>
      </div>
    )
  }

  if (phase === 'notenough') {
    return (
      <div className="kid-screen">
        <div className="shell">
          <div className="panel" style={{ padding: 22, textAlign: 'center' }}>
            <div style={{ fontSize: 32, marginBottom: 6 }}>🧩</div>
            <h3 style={{ margin: '0 0 6px' }}>Not enough questions yet</h3>
            <p className="muted" style={{ margin: '0 auto', maxWidth: 340, fontSize: 13.5 }}>
              This section doesn’t have enough practice questions ready for a timed run yet. Try Train or
              Practice for now, and check back soon.
            </p>
            <button className="btn btn-soft" style={{ marginTop: 14 }} onClick={() => navigate(`/students/${id}/prep/${moduleId}?tab=test`)}>
              Back
            </button>
          </div>
        </div>
      </div>
    )
  }

  if (phase === 'prestart') {
    return (
      <div className="kid-screen">
        <div className="shell">
          <div className="panel" style={{ padding: 24, textAlign: 'center', maxWidth: 460, margin: '20px auto 0' }}>
            <div style={{ fontSize: 34, marginBottom: 8 }}>⏱️</div>
            <h2 style={{ margin: '0 0 4px' }}>{section.name}</h2>
            <p className="muted" style={{ margin: '0 0 16px', fontSize: 14 }}>
              Up to {section.questionCount} questions · {minutesLabel(section.timeLimitSec)}
            </p>
            <p style={{ fontSize: 14, color: '#1C2230', margin: '0 auto 18px', maxWidth: 360 }}>
              The timer starts as soon as you begin and keeps running until you finish or time is up. Ready?
            </p>
            <button className="btn btn-primary" disabled={starting} onClick={() => void start()}>
              {starting ? 'Getting ready…' : 'Start section'}
            </button>
            <div>
              <button className="link" style={{ marginTop: 12 }} onClick={() => navigate(`/students/${id}/prep/${moduleId}?tab=test`)}>
                Not now
              </button>
            </div>
          </div>
        </div>
      </div>
    )
  }

  // phase === 'intest'
  const q = questions[idx]
  const urgent = remaining !== null && remaining <= URGENT_SEC

  return (
    <div className="kid-screen">
      <div className="shell">
        {/* Top bar: leave (warns), progress, timer. No TopMenu/Nikki here. */}
        <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: 10, marginBottom: 10 }}>
          <button className="btn btn-soft" style={{ width: 'auto', fontSize: 13, padding: '6px 12px' }} onClick={() => setLeaving(true)}>
            ← Leave
          </button>
          <span style={{ fontSize: 13.5, fontWeight: 600, color: '#5A6172' }}>
            Question {idx + 1} of {questions.length}
          </span>
          <span
            aria-live="polite"
            style={{
              fontVariantNumeric: 'tabular-nums',
              fontWeight: 800,
              fontSize: 18,
              padding: '4px 12px',
              borderRadius: 999,
              color: urgent ? '#B0432E' : '#003078',
              background: urgent ? '#FBE3DE' : '#EAF0FB',
            }}
          >
            {mmss(remaining)}
          </span>
        </div>
        {urgent && (
          <p style={{ textAlign: 'center', color: '#B0432E', fontSize: 12.5, fontWeight: 600, margin: '0 0 8px' }}>
            Under two minutes, wrap up your answers.
          </p>
        )}

        {q && (
          <div className="panel" style={{ padding: '16px 18px' }}>
            {q.passage && (
              <div style={{ fontSize: 13.5, color: '#5A6172', marginBottom: 10, whiteSpace: 'pre-wrap' }}>
                <MathText content={q.passage} />
              </div>
            )}
            <div style={{ fontSize: 15.5, color: '#1C2230', marginBottom: 12 }}>
              <MathText content={q.stem} />
            </div>
            <div style={{ display: 'grid', gap: 8 }}>
              {q.choices.map((c, ci) => {
                const chosen = answers[q.id] === ci
                return (
                  <button
                    key={ci}
                    type="button"
                    disabled={frozen}
                    onClick={() => selectAnswer(q.id, ci)}
                    style={{
                      textAlign: 'left',
                      padding: '11px 13px',
                      border: chosen ? '1.8px solid #003078' : '1.6px solid #ECE4D8',
                      borderRadius: 12,
                      background: chosen ? '#EAF0FB' : '#fff',
                      cursor: frozen ? 'default' : 'pointer',
                    }}
                  >
                    <MathText content={c.text} />
                  </button>
                )
              })}
            </div>

            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginTop: 12, gap: 10 }}>
              <button
                type="button"
                onClick={() => toggleFlag(q.id)}
                style={{
                  background: 'none',
                  border: 'none',
                  color: flags.has(q.id) ? '#CC543C' : '#5A6172',
                  fontWeight: 600,
                  fontSize: 13,
                  cursor: 'pointer',
                }}
              >
                {flags.has(q.id) ? '★ Flagged for review' : '☆ Flag for review'}
              </button>
              <div style={{ display: 'flex', gap: 8 }}>
                <button className="btn btn-soft" style={{ width: 'auto', fontSize: 13, padding: '6px 12px' }} disabled={idx === 0} onClick={() => setIdx((i) => Math.max(0, i - 1))}>
                  Prev
                </button>
                <button className="btn btn-soft" style={{ width: 'auto', fontSize: 13, padding: '6px 12px' }} disabled={idx >= questions.length - 1} onClick={() => setIdx((i) => Math.min(questions.length - 1, i + 1))}>
                  Next
                </button>
              </div>
            </div>
          </div>
        )}

        {/* Question palette. */}
        <div className="panel" style={{ padding: '12px 14px', marginTop: 12 }}>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(38px, 1fr))', gap: 6 }}>
            {questions.map((qq, i) => {
              const answered = answers[qq.id] !== undefined
              const flagged = flags.has(qq.id)
              const current = i === idx
              return (
                <button
                  key={qq.id}
                  type="button"
                  onClick={() => setIdx(i)}
                  title={flagged ? 'Flagged' : answered ? 'Answered' : 'Not answered'}
                  style={{
                    height: 34,
                    borderRadius: 8,
                    fontWeight: 700,
                    fontSize: 13,
                    cursor: 'pointer',
                    border: current ? '2px solid #003078' : '1.4px solid #ECE4D8',
                    background: flagged ? '#FBEEE9' : answered ? '#EAF0FB' : '#fff',
                    color: '#1C2230',
                  }}
                >
                  {i + 1}
                </button>
              )
            })}
          </div>
        </div>

        {/* Submit. */}
        <div style={{ marginTop: 14 }}>
          {confirmSubmit ? (
            <div className="panel" style={{ padding: '14px 16px' }}>
              <p style={{ margin: '0 0 10px', fontSize: 14, color: '#1C2230' }}>
                {unanswered > 0
                  ? `You have ${unanswered} unanswered ${unanswered === 1 ? 'question' : 'questions'}. Submit anyway?`
                  : 'Submit your answers?'}
              </p>
              <div style={{ display: 'flex', gap: 8 }}>
                <button className="btn btn-primary" style={{ width: 'auto' }} disabled={frozen} onClick={() => void finalize(false)}>
                  Submit
                </button>
                <button className="btn btn-soft" style={{ width: 'auto' }} onClick={() => setConfirmSubmit(false)}>
                  Keep working
                </button>
              </div>
            </div>
          ) : (
            <button className="btn btn-primary" disabled={frozen} onClick={() => setConfirmSubmit(true)}>
              Submit section
            </button>
          )}
        </div>
      </div>

      {/* Leave warning, a warning, not a block. */}
      {leaving && (
        <div style={overlayStyle}>
          <div className="panel" style={{ padding: 20, maxWidth: 380, textAlign: 'center' }}>
            <h3 style={{ margin: '0 0 6px' }}>Leave the timed section?</h3>
            <p className="muted" style={{ fontSize: 13.5, margin: '0 0 14px' }}>
              Your timer keeps running while you’re away. You can come back and pick up where you left off, as
              long as there’s time left.
            </p>
            <div style={{ display: 'flex', gap: 8, justifyContent: 'center' }}>
              <button className="btn btn-soft" style={{ width: 'auto' }} onClick={() => setLeaving(false)}>
                Stay
              </button>
              <button className="btn btn-primary" style={{ width: 'auto' }} onClick={() => navigate(`/students/${id}/prep/${moduleId}?tab=test`)}>
                Leave
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}

const overlayStyle: React.CSSProperties = {
  position: 'fixed',
  inset: 0,
  background: 'rgba(28,34,48,.45)',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
  padding: 20,
  zIndex: 50,
}
