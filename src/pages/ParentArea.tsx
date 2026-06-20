import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router'
import { useAuth } from '@/context/AuthContext'
import { avColor, gradeLabel, initials, levelLabel, listStudents, type Student } from '@/lib/students'
import { getFeedbackSummary, listSavedSubjects, type FeedbackSummary } from '@/lib/sessions'
import { getDisplayName } from '@/lib/profile'
import { SUBJECTS, subjectDisplayName } from '@/lib/subjects'
import { TopMenu } from '@/components/TopMenu'
import '@/styles/app-screens.css'

const SUBJECT_IDS: string[] = SUBJECTS.map((s) => s.id)
const dispFont = '"Baloo 2", "Trebuchet MS", system-ui, sans-serif'

interface ChildStat {
  student: Student
  subjectsStarted: number
  feedback: FeedbackSummary
}

function ratingLabel(rating: string): string {
  if (rating === 'great') return 'Great'
  if (rating === 'ok') return 'Okay'
  if (rating === 'confusing') return 'Confusing'
  return rating
}

export function ParentArea() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [name, setName] = useState('')
  const [stats, setStats] = useState<ChildStat[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (!user) return
    let active = true
    void (async () => {
      const [children, displayName] = await Promise.all([listStudents(user.id), getDisplayName(user.id)])
      const withStats = await Promise.all(
        children.map(async (student) => {
          const [subjects, feedback] = await Promise.all([
            listSavedSubjects(student.id),
            getFeedbackSummary(student.id),
          ])
          const subjectsStarted = subjects.filter((s) => SUBJECT_IDS.includes(s)).length
          return { student, subjectsStarted, feedback }
        }),
      )
      if (!active) return
      setName(displayName)
      setStats(withStats)
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
          Parent area
        </h1>
        <p className="muted">{name ? `Signed in as ${name}.` : "Your children's progress."}</p>

        <div style={{ marginTop: 20 }}>
          {loading ? (
            <div className="panel">
              <p className="muted">Loading…</p>
            </div>
          ) : stats.length === 0 ? (
            <div className="panel">
              <p className="muted">No children yet.</p>
            </div>
          ) : (
            stats.map((st, i) => (
              <div className="panel" key={st.student.id}>
                <div style={{ display: 'flex', alignItems: 'center', gap: 12, marginBottom: 6 }}>
                  <div
                    style={{
                      width: 42,
                      height: 42,
                      borderRadius: 12,
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      fontFamily: dispFont,
                      fontWeight: 800,
                      fontSize: 17,
                      color: '#fff',
                      flexShrink: 0,
                      background: avColor(i),
                    }}
                  >
                    {initials(st.student.first_name)}
                  </div>
                  <div>
                    <div style={{ fontFamily: dispFont, fontWeight: 700, color: '#003078', fontSize: 17 }}>
                      {st.student.first_name}
                    </div>
                    <div style={{ fontSize: 13, color: '#5A6172' }}>
                      {gradeLabel(st.student.grade)} · {levelLabel(st.student.level)}
                    </div>
                  </div>
                </div>
                <div className="stat-row">
                  <span className="muted">Subjects started</span>
                  <b>{st.subjectsStarted} of 4</b>
                </div>
                <div className="stat-row">
                  <span className="muted">Sessions rated</span>
                  <b>{st.feedback.count}</b>
                </div>
                <div className="stat-row">
                  <span className="muted">Most recent</span>
                  <b>
                    {st.feedback.recent
                      ? `${ratingLabel(st.feedback.recent.rating)} · ${subjectDisplayName(st.feedback.recent.subject)}`
                      : 'No sessions yet'}
                  </b>
                </div>
              </div>
            ))
          )}
        </div>

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
