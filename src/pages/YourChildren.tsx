import { useCallback, useEffect, useState } from 'react'
import { useNavigate } from 'react-router'
import { useAuth } from '@/context/AuthContext'
import '@/styles/app-screens.css'
import {
  avColor,
  deleteStudent,
  gradeLabel,
  initials,
  levelLabel,
  listStudents,
  type Student,
} from '@/lib/students'

const card: React.CSSProperties = {
  background: '#FFFFFF',
  border: '1px solid #ECE4D8',
  borderRadius: 20,
  boxShadow: '0 1px 2px rgba(28,34,48,.04),0 10px 30px rgba(28,34,48,.07)',
  width: '100%',
  maxWidth: 480,
  padding: 34,
}

export function YourChildren() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [students, setStudents] = useState<Student[]>([])
  const [loading, setLoading] = useState(true)

  const refresh = useCallback(async () => {
    if (!user) return
    setLoading(true)
    setStudents(await listStudents(user.id))
    setLoading(false)
  }, [user])

  useEffect(() => {
    void refresh()
  }, [refresh])

  const handleRemove = async (id: string) => {
    await deleteStudent(id)
    setStudents((prev) => prev.filter((s) => s.id !== id))
  }

  const have = students.length > 0

  return (
    <div className="auth-screen" style={{ color: '#1C2230' }}>
      <div className="auth-card" style={card}>
        <p
          style={{
            color: '#CC543C',
            fontWeight: 700,
            fontSize: 12,
            letterSpacing: '.1em',
            textTransform: 'uppercase',
          }}
        >
          Your children
        </p>
        <h1
          style={{
            fontFamily: '"Baloo 2", "Trebuchet MS", system-ui, sans-serif',
            color: '#003078',
            fontSize: 23,
            fontWeight: 700,
            margin: '5px 0 4px',
          }}
        >
          {have ? 'Add another, or continue' : 'Add your first child'}
        </h1>
        <p style={{ color: '#5A6172', fontSize: 14.5, margin: '0 0 16px' }}>
          Add as many as you like, at any grade from Kindergarten to 12.
        </p>

        {loading ? (
          <p style={{ color: '#5A6172', fontSize: 14.5 }}>Loading…</p>
        ) : (
          students.map((student, i) => (
            <div
              key={student.id}
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: 14,
                width: '100%',
                background: '#fff',
                border: '1.6px solid #ECE4D8',
                borderRadius: 20,
                padding: 16,
                marginBottom: 12,
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
              <div style={{ flex: 1 }}>
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
                  {gradeLabel(student.grade)} · {levelLabel(student.level)}
                </div>
              </div>
              <button
                type="button"
                onClick={() => navigate(`/children/${student.id}/edit`)}
                style={linkStyle}
              >
                Edit
              </button>
              <button
                type="button"
                onClick={() => handleRemove(student.id)}
                style={{ ...linkStyle, color: '#C0492F', marginLeft: 12 }}
              >
                Remove
              </button>
            </div>
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

        {have && (
          <button
            type="button"
            onClick={() => navigate('/students')}
            style={{
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              width: '100%',
              padding: '15px 22px',
              borderRadius: 999,
              fontWeight: 700,
              fontSize: 15.5,
              marginTop: 12,
              background: '#CC543C',
              color: '#fff',
              cursor: 'pointer',
            }}
          >
            Continue
          </button>
        )}
      </div>
    </div>
  )
}

const linkStyle: React.CSSProperties = {
  background: 'none',
  color: '#003078',
  fontWeight: 700,
  fontSize: 14.5,
  textDecoration: 'underline',
  textUnderlineOffset: 3,
  cursor: 'pointer',
}
