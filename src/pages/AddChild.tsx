import { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router'
import { useAuth } from '@/context/AuthContext'
import {
  GRADES,
  LEVELS,
  createStudent,
  getStudent,
  gradeLabel,
  updateStudent,
  type StudentLevel,
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

const inputBase: React.CSSProperties = {
  width: '100%',
  padding: '14px 16px',
  border: '1.6px solid #ECE4D8',
  borderRadius: 14,
  background: '#fff',
  fontSize: 16,
  color: '#1C2230',
}

const inputErr: React.CSSProperties = {
  borderColor: '#C0492F',
  boxShadow: '0 0 0 4px rgba(192,73,47,.12)',
}

export function AddChild() {
  const { id } = useParams<{ id: string }>()
  const editing = !!id
  const { user } = useAuth()
  const navigate = useNavigate()

  const [name, setName] = useState('')
  const [grade, setGrade] = useState('')
  const [level, setLevel] = useState<StudentLevel>('on')
  const [nameError, setNameError] = useState(false)
  const [gradeError, setGradeError] = useState(false)
  const [errMsg, setErrMsg] = useState('')
  const [loading, setLoading] = useState(editing)
  const [saving, setSaving] = useState(false)

  useEffect(() => {
    if (!editing || !id) return
    let active = true
    getStudent(id).then((student) => {
      if (!active) return
      if (!student) {
        navigate('/children', { replace: true })
        return
      }
      setName(student.first_name)
      setGrade(student.grade)
      setLevel((student.level as StudentLevel) ?? 'on')
      setLoading(false)
    })
    return () => {
      active = false
    }
  }, [editing, id, navigate])

  const handleSave = async () => {
    if (saving || !user) return
    const trimmed = name.trim()
    const missingName = trimmed.length === 0
    const missingGrade = grade.length === 0
    setNameError(missingName)
    setGradeError(missingGrade)
    if (missingName || missingGrade) {
      setErrMsg('Please fill in the highlighted fields to continue.')
      return
    }
    setErrMsg('')
    setSaving(true)

    const input = { first_name: trimmed, grade, level }
    const { error } = editing && id
      ? await updateStudent(id, input)
      : await createStudent(user.id, input)

    if (error) {
      setErrMsg('Sorry — something went wrong saving. Please try again.')
      setSaving(false)
      return
    }
    navigate('/children', { replace: true })
  }

  return (
    <div
      style={{
        minHeight: '100dvh',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        padding: '26px 22px',
        background: '#FBF8F3',
        color: '#1C2230',
      }}
    >
      <div style={card}>
        <p
          style={{
            color: '#CC543C',
            fontWeight: 700,
            fontSize: 12,
            letterSpacing: '.1em',
            textTransform: 'uppercase',
          }}
        >
          {editing ? 'Edit child' : 'Add a child'}
        </p>
        <h1
          style={{
            fontFamily: '"Baloo 2", "Trebuchet MS", system-ui, sans-serif',
            color: '#003078',
            fontSize: 23,
            fontWeight: 700,
            margin: '5px 0 14px',
          }}
        >
          {editing ? 'Update their details' : 'Tell us about them'}
        </h1>

        {loading ? (
          <p style={{ color: '#5A6172', fontSize: 14.5 }}>Loading…</p>
        ) : (
          <>
            <div style={{ margin: '16px 0', textAlign: 'left' }}>
              <label
                htmlFor="child-name"
                style={{ display: 'block', fontWeight: 600, fontSize: 14, marginBottom: 7 }}
              >
                First name
              </label>
              <input
                id="child-name"
                value={name}
                maxLength={20}
                placeholder="Their first name"
                onChange={(e) => {
                  setName(e.target.value)
                  if (nameError) setNameError(false)
                }}
                style={nameError ? { ...inputBase, ...inputErr } : inputBase}
              />
            </div>

            <div style={{ margin: '16px 0', textAlign: 'left' }}>
              <label
                htmlFor="child-grade"
                style={{ display: 'block', fontWeight: 600, fontSize: 14, marginBottom: 7 }}
              >
                Current grade
              </label>
              <select
                id="child-grade"
                value={grade}
                onChange={(e) => {
                  setGrade(e.target.value)
                  if (gradeError) setGradeError(false)
                }}
                style={gradeError ? { ...inputBase, ...inputErr } : inputBase}
              >
                <option value="">Choose a grade</option>
                {GRADES.map((g) => (
                  <option key={g} value={g}>
                    {gradeLabel(g)}
                  </option>
                ))}
              </select>
            </div>

            <div style={{ margin: '16px 0', textAlign: 'left' }}>
              <label style={{ display: 'block', fontWeight: 600, fontSize: 14, marginBottom: 7 }}>
                How should Nikki challenge them?
              </label>
              {LEVELS.map((opt) => {
                const on = level === opt.id
                return (
                  <button
                    key={opt.id}
                    type="button"
                    onClick={() => setLevel(opt.id)}
                    style={{
                      display: 'block',
                      width: '100%',
                      textAlign: 'left',
                      border: on ? '1.6px solid #CC543C' : '1.6px solid #ECE4D8',
                      borderRadius: 14,
                      padding: '14px 16px',
                      marginBottom: 10,
                      background: on ? '#FBEEE9' : '#fff',
                      cursor: 'pointer',
                    }}
                  >
                    <div style={{ fontWeight: 700, fontSize: 15, color: '#1C2230' }}>{opt.label}</div>
                    <div style={{ fontSize: 13, color: '#5A6172', marginTop: 2 }}>{opt.desc}</div>
                  </button>
                )
              })}
            </div>

            <div
              style={{
                color: '#C0492F',
                fontSize: 14,
                fontWeight: 500,
                minHeight: 18,
                marginTop: 8,
              }}
            >
              {errMsg}
            </div>

            <button
              type="button"
              onClick={handleSave}
              disabled={saving}
              style={{
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                width: '100%',
                padding: '15px 22px',
                borderRadius: 999,
                fontWeight: 700,
                fontSize: 15.5,
                background: '#CC543C',
                color: '#fff',
                cursor: saving ? 'not-allowed' : 'pointer',
                opacity: saving ? 0.45 : 1,
              }}
            >
              {editing ? 'Save changes' : 'Save child'}
            </button>
            <button
              type="button"
              onClick={() => navigate('/children')}
              style={{
                display: 'block',
                margin: '12px auto 0',
                background: 'none',
                color: '#003078',
                fontWeight: 700,
                fontSize: 14.5,
                textDecoration: 'underline',
                textUnderlineOffset: 3,
                cursor: 'pointer',
              }}
            >
              Cancel
            </button>
          </>
        )}
      </div>
    </div>
  )
}
