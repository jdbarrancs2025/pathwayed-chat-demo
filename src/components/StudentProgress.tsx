import { useEffect, useState } from 'react'
import { getStudentMastery, type StudentMasteryView } from '@/lib/skills'
import {
  buildCoachMessage,
  buildTodaysPlan,
  getReadiness,
  type ReadinessView,
} from '@/lib/readiness'
import { subjectDisplayName } from '@/lib/subjects'

/**
 * Academic OS Phase 1 — read-only student dashboard sections. Shows skill mastery
 * (grade-band-scoped, grouped by subject) and the student's current subjects,
 * with Today's Plan / Readiness / SAT as clearly-labeled Phase 2-3 placeholders.
 * No writes happen here. Encouraging tone — this is a kid's progress, not a
 * gradebook.
 */

const SUBJECT_ACCENT: Record<string, string> = {
  math: 'var(--math)',
  reading: 'var(--reading)',
  writing: 'var(--writing)',
  science: 'var(--science)',
}

function accentFor(subject: string): string {
  return SUBJECT_ACCENT[subject] ?? 'var(--grow)'
}

/** Warm, non-numeric framing alongside the percentage. */
function masteryLabel(pct: number): string {
  if (pct >= 80) return 'Strong'
  if (pct >= 50) return 'Growing'
  if (pct >= 20) return 'Getting started'
  return 'Just beginning'
}

export function StudentProgress({
  studentId,
  grade,
  onOpenSubject,
}: {
  studentId: string
  grade: string
  /** Deep-link into a subject session from a Today's Plan item. */
  onOpenSubject: (subject: string) => void
}) {
  const [view, setView] = useState<StudentMasteryView | null>(null)
  const [readiness, setReadiness] = useState<ReadinessView | null>(null)

  useEffect(() => {
    let active = true
    getStudentMastery(studentId, grade).then((v) => {
      if (active) setView(v)
    })
    return () => {
      active = false
    }
  }, [studentId, grade])

  useEffect(() => {
    let active = true
    getReadiness(studentId).then((r) => {
      if (active) setReadiness(r)
    })
    return () => {
      active = false
    }
  }, [studentId])

  // KidHome already shows a top-level loader; render nothing until both reads are
  // ready rather than flashing partial cards.
  if (!view || !readiness) return null

  const plan = buildTodaysPlan(readiness)

  return (
    <div className="progress">
      {/* AI Coach — near the top: the "what should I do next" anchor */}
      <section className="panel coach">
        <h3>Your Coach</h3>
        <p className="coach-msg">{buildCoachMessage(readiness)}</p>
      </section>

      {/* Skill Mastery Progress */}
      <section className="panel">
        <h3>Skill Mastery Progress</h3>
        {view.hasAny ? (
          view.bySubject.map((group) => (
            <div key={group.subject} className="subj-group">
              <div className="subj-head">
                <span className="dot" style={{ background: accentFor(group.subject) }} />
                {subjectDisplayName(group.subject)}
              </div>
              {group.skills.map((s) => (
                <div key={s.skill_id} className="skill-row">
                  <div className="skill-top">
                    <span className="skill-name">{s.name}</span>
                    <span className="skill-pct">{s.mastery_percentage}%</span>
                  </div>
                  <div className="bar">
                    <i style={{ width: `${s.mastery_percentage}%`, background: accentFor(group.subject) }} />
                  </div>
                  <div className="skill-meta">
                    {masteryLabel(s.mastery_percentage)} · practiced {s.attempts}
                    {s.attempts === 1 ? ' time' : ' times'}
                  </div>
                </div>
              ))}
            </div>
          ))
        ) : (
          <p className="empty-progress">
            No progress yet — start a session and your skills will grow here. 🌱
          </p>
        )}
      </section>

      {/* Current Subjects */}
      <section className="panel">
        <h3>Current Subjects</h3>
        {view.currentSubjects.length ? (
          <div className="subject-chips">
            {view.currentSubjects.map((s) => (
              <span key={s} className="chip" style={{ color: accentFor(s), borderColor: accentFor(s) }}>
                {subjectDisplayName(s)}
              </span>
            ))}
          </div>
        ) : (
          <p className="empty-progress">Pick a subject above to get started.</p>
        )}
      </section>

      {/* Today's Plan — derived from readiness, deep-links into sessions. */}
      <section className="panel">
        <h3>Today’s Plan</h3>
        {plan.length ? (
          <ol className="plan-list">
            {plan.map((item, i) => (
              <li key={item.label}>
                <button type="button" className="plan-item" onClick={() => onOpenSubject(item.subject)}>
                  <span className="plan-num">{i + 1}</span>
                  <span className="plan-label">{item.label}</span>
                  <span className="plan-go" aria-hidden="true">
                    ›
                  </span>
                </button>
              </li>
            ))}
          </ol>
        ) : (
          <p className="empty-progress">Your plan will appear here after your first session.</p>
        )}
      </section>

      {/* Remaining placeholders — labeled, no logic behind them yet. */}
      <section className="panel placeholder">
        <h3>
          Readiness Score <span className="soon">Phase 2</span>
        </h3>
        <p className="muted">A grade-level readiness score is coming in a later phase.</p>
      </section>
      <section className="panel placeholder">
        <h3>
          SAT Readiness <span className="soon">Phase 3</span>
        </h3>
        <p className="muted">SAT alignment and readiness will arrive in Phase 3.</p>
      </section>
    </div>
  )
}
