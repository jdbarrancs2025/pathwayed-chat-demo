import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router'
import { useAuth } from '@/context/AuthContext'
import { avColor, gradeLabel, initials, levelLabel, listStudents, type Student } from '@/lib/students'
import { getLastActivity } from '@/lib/sessions'
import { ensureFreshReadiness, pathwayBandLabel, type ReadinessView } from '@/lib/readiness'
import { getStudentMastery, type StudentMasteryView } from '@/lib/skills'
import { masteryDisplay, subjectSummary } from '@/lib/masteryDisplay'
import { getSubjectPlacements, placementCopy, type SubjectPlacement } from '@/lib/subjectPlacement'
import { workingGradeNotice } from '@/lib/workingGradeCopy'
import { getDisplayName } from '@/lib/profile'
import { subjectDisplayName } from '@/lib/subjects'
import { formatRelativeDay } from '@/lib/format'
import { TopMenu } from '@/components/TopMenu'
import { TestReadinessCard } from '@/components/TestReadinessCard'
import '@/styles/app-screens.css'

const SUBJECT_ACCENT: Record<string, string> = {
  math: 'var(--math)',
  reading: 'var(--reading)',
  writing: 'var(--writing)',
  science: 'var(--science)',
}
const accentFor = (s: string) => SUBJECT_ACCENT[s] ?? 'var(--grow)'
const READINESS_SUBJECTS = ['math', 'reading', 'writing']

interface ChildData {
  student: Student
  readiness: ReadinessView
  mastery: StudentMasteryView
  lastActivity: string | null
  placements: SubjectPlacement[]
}

/**
 * The real parent dashboard (/parent). For every child of the logged-in parent
 * (students.parent_id = auth.uid()) it READS the engine outputs — readiness_scores
 * (Pathway score, per-subject readiness, strengths, gaps) and student_skill_mastery
 * (mastery by subject) — plus last activity. No recompute, no LLM, no mock data.
 */
export function ParentArea() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [name, setName] = useState('')
  const [children, setChildren] = useState<ChildData[]>([])
  const [loading, setLoading] = useState(true)
  // Captured at load time (not during render — keeps render pure) for the
  // relative "last activity" labels.
  const [now, setNow] = useState(0)

  useEffect(() => {
    if (!user) return
    let active = true
    void (async () => {
      const [kids, displayName] = await Promise.all([listStudents(user.id), getDisplayName(user.id)])
      const data = await Promise.all(
        kids.map(async (student) => {
          const [readiness, mastery, lastActivity, placements] = await Promise.all([
            ensureFreshReadiness(student.id),
            getStudentMastery(student.id, student.grade),
            getLastActivity(student.id),
            getSubjectPlacements(student.id, student.grade),
          ])
          // The 'sat' row that ensureFreshReadiness just wrote is read by
          // TestReadinessCard, which owns the SAT row on this surface now.
          return { student, readiness, mastery, lastActivity, placements }
        }),
      )
      if (!active) return
      setName(displayName)
      setChildren(data)
      setNow(Date.now())
      setLoading(false)
    })()
    return () => {
      active = false
    }
  }, [user])

  return (
    <div className="kid-screen">
      <div className="shell">
        <TopMenu />
        <h1 className="greet" style={{ marginTop: 18 }}>
          Parent dashboard
        </h1>
        <p className="muted">{name ? `Signed in as ${name}.` : "Your children's progress."}</p>

        <div style={{ marginTop: 20 }}>
          {loading ? (
            <div className="panel">
              <p className="muted">Loading…</p>
            </div>
          ) : children.length === 0 ? (
            <div className="panel">
              <p className="muted">No children yet. Add one to get started.</p>
            </div>
          ) : (
            children.map((c, i) => <ChildPanel key={c.student.id} data={c} index={i} now={now} />)
          )}
        </div>

        {/* Real data we don't have yet — labeled, never faked. */}
        {children.length > 0 && (
          <section className="panel placeholder">
            <h3>
              More insights <span className="soon">Coming soon</span>
            </h3>
            <p className="muted">
              Weekly progress and growth over time (needs practice history we don't store yet),
              homework activity, learning habits, and attendance will appear here in a later update.
            </p>
          </section>
        )}

        <button className="btn btn-soft" onClick={() => navigate('/children/new')}>
          + Add a child
        </button>
        <button className="btn btn-navy" style={{ marginTop: 12 }} onClick={() => navigate('/settings')}>
          Settings
        </button>
      </div>
    </div>
  )
}

function ChildPanel({ data, index, now }: { data: ChildData; index: number; now: number }) {
  const navigate = useNavigate()
  const { student, readiness, mastery, lastActivity, placements } = data
  const pathway = readiness.pathway
  const hasActivity = readiness.hasAny || mastery.hasAny || !!lastActivity || placements.length > 0
  // Shown only once the child's earned working grade has overtaken their real
  // grade. Consent (above_grade_ok) decides the FRAMING, never the serving.
  const promotion = workingGradeNotice(student)

  // Mastery-by-subject collapse. Collapsed by default so the panel opens clean;
  // the header still shows a "N of M mastered" summary without expanding.
  const [openSubjects, setOpenSubjects] = useState<Set<string>>(new Set())
  const toggleSubject = (subject: string) =>
    setOpenSubjects((prev) => {
      const next = new Set(prev)
      if (next.has(subject)) next.delete(subject)
      else next.add(subject)
      return next
    })

  return (
    <div className="panel">
      <div className="pd-head">
        <div className="pd-av" style={{ background: avColor(index) }}>
          {initials(student.first_name)}
        </div>
        <div className="pd-id">
          <div className="pd-name">{student.first_name}</div>
          <div className="pd-sub">
            {gradeLabel(student.grade)} · {levelLabel(student.level)}
          </div>
        </div>
        {pathway && (
          <div className="pd-score">
            <span className="pd-score-num">{pathway.score}</span>
            <span className="pd-score-cap">Pathway · {pathwayBandLabel(pathway.score)}</span>
          </div>
        )}
      </div>

      {!hasActivity ? (
        <p className="empty-progress">
          No activity yet — when {student.first_name} starts practicing, their progress will show
          here.
        </p>
      ) : (
        <>
          {promotion && (
            <div className="pd-section">
              <div className="pd-label">Moving up</div>
              <p style={{ margin: 0, fontSize: 14, lineHeight: 1.5 }}>{promotion.headline}</p>
              {promotion.detail && (
                <p className="muted" style={{ margin: '4px 0 0', fontSize: 13, lineHeight: 1.5 }}>
                  {promotion.detail}
                </p>
              )}
            </div>
          )}
          {placements.length > 0 && (
            <div className="pd-section">
              <div className="pd-label">Placement by subject</div>
              {placements.map((p) => {
                const copy = placementCopy(p.level, subjectDisplayName(p.subject), !!student.above_grade_ok)
                return (
                  <div key={p.subject} className="subj-group">
                    <div className="subj-head">
                      <span className="dot" style={{ background: accentFor(p.subject) }} />
                      {subjectDisplayName(p.subject)}
                      <span
                        className="chip"
                        style={{
                          marginLeft: 8,
                          color: accentFor(p.subject),
                          borderColor: accentFor(p.subject),
                        }}
                      >
                        {copy.band}
                      </span>
                    </div>
                    <p className="muted" style={{ margin: '4px 0 0', fontSize: 13, lineHeight: 1.5 }}>
                      {copy.nextStep}
                    </p>
                  </div>
                )
              })}
            </div>
          )}

          {readiness.hasAny && (
            <div className="pd-section">
              <div className="pd-label">Readiness by subject</div>
              {READINESS_SUBJECTS.filter((s) => readiness.bySubject[s]).map((s) => {
                const score = readiness.bySubject[s].score
                return (
                  <div key={s} className="skill-row">
                    <div className="skill-top">
                      <span className="skill-name">{subjectDisplayName(s)}</span>
                      <span className="skill-pct">{score}%</span>
                    </div>
                    <div className="bar">
                      <i style={{ width: `${score}%`, background: accentFor(s) }} />
                    </div>
                  </div>
                )
              })}
            </div>
          )}

          {pathway && (
            <div className="pd-section">
              <div className="pd-label">Strengths</div>
              {pathway.strengths.length > 0 ? (
                <div className="subject-chips">
                  {pathway.strengths.map((sk) => (
                    <span
                      key={sk.slug}
                      className="chip"
                      style={{ color: accentFor(sk.subject), borderColor: accentFor(sk.subject) }}
                    >
                      {sk.name}
                    </span>
                  ))}
                </div>
              ) : (
                <p className="empty-progress">
                  Building toward strengths — keep practicing to unlock them.
                </p>
              )}
            </div>
          )}

          {pathway && (
            <div className="pd-section">
              <div className="pd-label">Areas needing support</div>
              {pathway.gaps.length > 0 ? (
                <div className="subject-chips">
                  {pathway.gaps.map((sk) => (
                    <span
                      key={sk.slug}
                      className="chip"
                      style={{ color: 'var(--orange)', borderColor: 'var(--orange)' }}
                    >
                      {sk.name}
                    </span>
                  ))}
                </div>
              ) : (
                <p className="empty-progress">
                  Nothing flagged — {student.first_name} is doing well across the board.
                </p>
              )}
            </div>
          )}

          {mastery.hasAny && (
            <div className="pd-section">
              <div className="pd-label">Mastery by subject</div>
              <p className="mastery-key">
                These come from the questions {student.first_name} has actually answered.{' '}
                <strong>Advanced</strong> means 70% or better over at least 5 questions, so we move on.{' '}
                <strong>Mastered</strong> means 85% or better over at least 8 questions, checked again a few
                days later to be sure it stuck. Where we have not asked enough questions yet, we say so
                instead of showing a score.
              </p>
              {mastery.bySubject.map((group) => {
                const open = openSubjects.has(group.subject)
                return (
                  <div key={group.subject} className="subj-group">
                    <button
                      type="button"
                      className="subj-head subj-toggle"
                      aria-expanded={open}
                      onClick={() => toggleSubject(group.subject)}
                    >
                      <span className="dot" style={{ background: accentFor(group.subject) }} />
                      <span className="subj-name">{subjectDisplayName(group.subject)}</span>
                      <span className="subj-summary">{subjectSummary(group.skills)}</span>
                      <svg
                        className={`chev ${open ? 'open' : ''}`}
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        strokeWidth="2.4"
                        strokeLinecap="round"
                        strokeLinejoin="round"
                        aria-hidden="true"
                      >
                        <path d="m6 9 6 6 6-6" />
                      </svg>
                    </button>
                    {open &&
                      group.skills.map((sk) => {
                        const d = masteryDisplay(sk)
                        return (
                          <div key={sk.skill_id} className="skill-row">
                            <div className="skill-top">
                              <span className="skill-name">{sk.name}</span>
                              <span className="skill-right">
                                <span className={`skill-state ${d.state}`}>{d.label}</span>
                                {/* No percentage without evidence: a number here would
                                    imply a claim we have not earned. */}
                                {d.percent != null && <span className="skill-pct">{d.percent}%</span>}
                              </span>
                            </div>
                            {d.percent != null && (
                              <div className="bar">
                                <i
                                  style={{
                                    width: `${d.percent}%`,
                                    background: accentFor(group.subject),
                                  }}
                                />
                              </div>
                            )}
                          </div>
                        )
                      })}
                  </div>
                )
              })}
            </div>
          )}

          {/* HSPT, ISEE and SAT in one read-only card. It owns the SAT row and
              the above-grade consent gate that used to sit here, so SatReadiness
              is no longer mounted standalone and SAT renders exactly once. */}
          <TestReadinessCard studentId={student.id} audience="parent" />

          <div className="stat-row">
            <span className="muted">Last activity</span>
            <b>{formatRelativeDay(lastActivity, now)}</b>
          </div>
        </>
      )}

      {/* Reassessment layers on top of existing mastery (earned mastery is kept;
          new/higher-band skills get re-placed), then the path picks up from there. */}
      <button
        type="button"
        className="btn btn-soft"
        style={{ marginTop: 14 }}
        onClick={() => navigate(`/students/${student.id}/diagnostic?fresh=1&return=/parent`)}
      >
        Reassess {student.first_name}’s level
      </button>
    </div>
  )
}
