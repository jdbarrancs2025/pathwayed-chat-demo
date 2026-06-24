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
    <div
      style={{
        minHeight: '100dvh',
        background: '#FBF8F3',
        color: '#1C2230',
        display: 'flex',
        flexDirection: 'column',
      }}
    >
      <div style={{ flex: 1, width: '100%', maxWidth: 720, margin: '0 auto', padding: '24px 22px 40px' }}>
        <TopMenu />
        <h1
          style={{
            fontFamily: '"Baloo 2", "Trebuchet MS", system-ui, sans-serif',
            color: '#003078',
            fontSize: 32,
            fontWeight: 700,
            lineHeight: 1.12,
            margin: '16px 0 2px',
          }}
        >
          Who's learning today?
        </h1>
        <p style={{ color: '#5A6172', fontSize: 14.5, margin: 0 }}>Tap your name to begin.</p>

        <div style={{ marginTop: 22, maxWidth: 460 }}>
          {loading ? (
            <p style={{ color: '#5A6172', fontSize: 14.5 }}>Loading…</p>
          ) : (
            students.map((student, i) => (
              <button
                key={student.id}
                type="button"
                onClick={() => navigate(`/students/${student.id}`)}
                style={{
                  display: 'flex',
                  alignItems: 'center',
                  gap: 14,
                  width: '100%',
                  textAlign: 'left',
                  background: '#fff',
                  border: '1.6px solid #ECE4D8',
                  borderRadius: 20,
                  padding: 16,
                  marginBottom: 12,
                  cursor: 'pointer',
                }}
              >
                <div
                  style={{
                    width: 54,
                    height: 54,
                    borderRadius: 16,
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    fontFamily: '"Baloo 2", "Trebuchet MS", system-ui, sans-serif',
                    fontWeight: 800,
                    fontSize: 22,
                    color: '#fff',
                    flexShrink: 0,
                    background: avColor(i),
                  }}
                >
                  {initials(student.first_name)}
                </div>
                <div>
                  <div
                    style={{
                      fontFamily: '"Baloo 2", "Trebuchet MS", system-ui, sans-serif',
                      fontWeight: 700,
                      fontSize: 18,
                      lineHeight: 1.1,
                      color: '#003078',
                    }}
                  >
                    {student.first_name}
                  </div>
                  <div style={{ fontSize: 13, color: '#5A6172', marginTop: 2 }}>
                    {gradeLabel(student.grade)}
                  </div>
                </div>
              </button>
            ))
          )}

          <button
            type="button"
            onClick={() => navigate('/children/new')}
            style={{
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              width: '100%',
              padding: '15px 22px',
              borderRadius: 999,
              fontWeight: 700,
              fontSize: 15.5,
              background: '#F4EEE4',
              color: '#003078',
              cursor: 'pointer',
            }}
          >
            + Add a child
          </button>

          <button
            type="button"
            onClick={() => signOut()}
            style={{
              display: 'block',
              margin: '18px auto 0',
              background: 'none',
              color: '#5A6172',
              fontWeight: 600,
              fontSize: 13,
              cursor: 'pointer',
            }}
          >
            Sign out
          </button>
        </div>
      </div>
    </div>
  )
}
