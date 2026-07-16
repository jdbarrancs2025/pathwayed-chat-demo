import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router'
import { useAuth } from '@/context/AuthContext'
import { avColor, gradeLabel, initials, listStudents, type Student } from '@/lib/students'
import { TopMenu } from '@/components/TopMenu'

/**
 * "Who's learning today?" picker. Lists the parent's children; tapping one
 * starts their learning session. The full per-child session wiring is a later
 * step, so a tap currently routes to the existing student home.
 */
export function StudentPicker() {
  const { user, signOut } = useAuth()
  const navigate = useNavigate()
  const [students, setStudents] = useState<Student[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (!user) return
    let active = true
    listStudents(user.id).then((rows) => {
      if (!active) return
      setStudents(rows)
      setLoading(false)
    })
    return () => {
      active = false
    }
  }, [user])

  return (
    <div className="kid-screen">
      <div className="shell">
        {/* 3x the default 52px mark — this /students header only. */}
        <TopMenu logoHeight={156} mark="badge" />
        <h1 className="greet">Who's learning today?</h1>
        <p className="muted">Tap your name to begin.</p>

        {loading ? (
          <p className="muted" style={{ marginTop: 22 }}>Loading…</p>
        ) : (
          <>
            <div className="pickgrid">
              {students.map((student, i) => (
                <button
                  key={student.id}
                  type="button"
                  className="pickcard"
                  onClick={() => navigate(`/students/${student.id}`)}
                >
                  <div className="av" style={{ background: avColor(i) }}>
                    {initials(student.first_name)}
                  </div>
                  <div>
                    <div className="nm">{student.first_name}</div>
                    <div className="gr">{gradeLabel(student.grade)}</div>
                  </div>
                </button>
              ))}
            </div>

            <div className="pick-actions">
              <button type="button" className="btn btn-soft" onClick={() => navigate('/children/new')}>
                + Add a child
              </button>
              <button
                type="button"
                className="link"
                style={{ display: 'block', margin: '16px auto 0' }}
                onClick={() => signOut()}
              >
                Sign out
              </button>
            </div>
          </>
        )}
      </div>
    </div>
  )
}
