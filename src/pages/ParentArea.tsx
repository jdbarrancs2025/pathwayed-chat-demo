import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router'
import { useAuth } from '@/context/AuthContext'
import { avColor, gradeLabel, initials, levelLabel, listStudents, type Student } from '@/lib/students'
import { getLastActivity } from '@/lib/sessions'
import { getReadiness, pathwayBandLabel, type ReadinessView } from '@/lib/readiness'
import { getStudentMastery, type StudentMasteryView } from '@/lib/skills'
import { getDisplayName } from '@/lib/profile'
import { subjectDisplayName } from '@/lib/subjects'
import { formatRelativeDay } from '@/lib/format'
import { TopMenu } from '@/components/TopMenu'
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
          const [readiness, mastery, lastActivity] = await Promise.all([
            getReadiness(student.id),
            getStudentMastery(student.id, student.grade),
            getLastActivity(student.id),
          ])
          return { student, readiness, mastery, lastActivity }
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
  const { student, readiness, mastery, lastActivity } = data
  const pathway = readiness.pathway
  const hasActivity = readiness.hasAny || mastery.hasAny || !!lastActivity

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
              {mastery.bySubject.map((group) => (
                <div key={group.subject} className="subj-group">
                  <div className="subj-head">
                    <span className="dot" style={{ background: accentFor(group.subject) }} />
                    {subjectDisplayName(group.subject)}
                  </div>
                  {group.skills.map((sk) => (
                    <div key={sk.skill_id} className="skill-row">
                      <div className="skill-top">
                        <span className="skill-name">{sk.name}</span>
                        <span className="skill-pct">{sk.mastery_percentage}%</span>
                      </div>
                      <div className="bar">
                        <i
                          style={{
                            width: `${sk.mastery_percentage}%`,
                            background: accentFor(group.subject),
                          }}
                        />
                      </div>
                    </div>
                  ))}
                </div>
              ))}
            </div>
          )}

          <div className="stat-row">
            <span className="muted">Last activity</span>
            <b>{formatRelativeDay(lastActivity, now)}</b>
          </div>
        </>
      )}
    </div>
  )
}
