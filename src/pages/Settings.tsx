import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router'
import { useAuth } from '@/context/AuthContext'
import {
  avColor,
  avatarModeOf,
  deleteStudent,
  gradeLabel,
  initials,
  levelLabel,
  listStudents,
  updateAvatarMode,
  type AvatarMode,
  type Student,
} from '@/lib/students'
import { getDisplayName, updateDisplayName } from '@/lib/profile'
import { BillingPanel } from '@/components/BillingPanel'
import { AvatarModePicker } from '@/components/AvatarModePicker'
import { TopMenu } from '@/components/TopMenu'
import '@/styles/app-screens.css'

const dispFont = '"Baloo 2", "Trebuchet MS", system-ui, sans-serif'

export function Settings() {
  const { user, signOut } = useAuth()
  const navigate = useNavigate()
  const [children, setChildren] = useState<Student[]>([])
  const [name, setName] = useState('')
  const [renaming, setRenaming] = useState(false)
  const [renameValue, setRenameValue] = useState('')
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (!user) return
    let active = true
    void (async () => {
      const [kids, displayName] = await Promise.all([listStudents(user.id), getDisplayName(user.id)])
      if (!active) return
      setChildren(kids)
      setName(displayName)
      setRenameValue(displayName)
      setLoading(false)
    })()
    return () => {
      active = false
    }
  }, [user])

  const removeChild = async (id: string) => {
    await deleteStudent(id)
    setChildren((prev) => prev.filter((c) => c.id !== id))
  }

  // Writes the same students.avatar_mode field the edit form uses. Optimistic:
  // reflect the choice locally, then persist. No grade touch → no reassessment.
  const setChildAvatar = async (id: string, mode: AvatarMode) => {
    setChildren((prev) => prev.map((c) => (c.id === id ? { ...c, avatar_mode: mode } : c)))
    await updateAvatarMode(id, mode)
  }

  const saveName = async () => {
    if (!user) return
    const value = renameValue.trim()
    if (value.length < 2) return
    await updateDisplayName(user.id, value)
    setName(value)
    setRenaming(false)
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

  return (
    <div className="kid-screen">
      <div className="shell">
        <TopMenu />
        <h1 className="greet" style={{ marginTop: 18 }}>
          Settings
        </h1>
        <p className="muted">Manage your children, your Nikki, and your account.</p>

        {/* Children */}
        <div className="panel" style={{ marginTop: 20 }}>
          <h3>Children</h3>
          <div style={{ marginTop: 10 }}>
            {loading ? (
              <p className="muted" style={{ fontSize: 14 }}>
                Loading…
              </p>
            ) : children.length === 0 ? (
              <p className="muted" style={{ fontSize: 14 }}>
                No children yet.
              </p>
            ) : (
              children.map((child, i) => (
                <div
                  key={child.id}
                  style={{
                    width: '100%',
                    background: '#fff',
                    border: '1.6px solid #ECE4D8',
                    borderRadius: 20,
                    padding: 16,
                    marginBottom: 12,
                  }}
                >
                  <div style={{ display: 'flex', alignItems: 'center', gap: 14 }}>
                  <div
                    style={{
                      width: 54,
                      height: 54,
                      borderRadius: 16,
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      fontFamily: dispFont,
                      fontWeight: 800,
                      fontSize: 22,
                      color: '#fff',
                      flexShrink: 0,
                      background: avColor(i),
                    }}
                  >
                    {initials(child.first_name)}
                  </div>
                  <div style={{ flex: 1 }}>
                    <div style={{ fontFamily: dispFont, fontWeight: 700, fontSize: 18, lineHeight: 1.1, color: '#003078' }}>
                      {child.first_name}
                    </div>
                    <div style={{ fontSize: 13, color: '#5A6172', marginTop: 2 }}>
                      {gradeLabel(child.grade)} · {levelLabel(child.level)}
                    </div>
                  </div>
                  <button
                    type="button"
                    style={linkStyle}
                    onClick={() => navigate(`/children/${child.id}/edit`, { state: { returnTo: '/settings' } })}
                  >
                    Edit
                  </button>
                  <button type="button" style={{ ...linkStyle, color: '#C0492F', marginLeft: 12 }} onClick={() => removeChild(child.id)}>
                    Remove
                  </button>
                  </div>
                  <AvatarModePicker
                    value={avatarModeOf(child)}
                    onChange={(m) => void setChildAvatar(child.id, m)}
                  />
                </div>
              ))
            )}
          </div>
          <button
            className="btn btn-soft"
            style={{ marginTop: 6 }}
            onClick={() => navigate('/children/new', { state: { returnTo: '/settings' } })}
          >
            + Add a child
          </button>
        </div>

        {/* Billing */}
        {user && <BillingPanel students={children} userId={user.id} email={user.email ?? ''} />}

        {/* Account */}
        <div className="panel">
          <h3>Account</h3>
          <div className="stat-row">
            <span className="muted">Name</span>
            <b>{name || '—'}</b>
          </div>
          {renaming ? (
            <div className="field" style={{ marginBottom: 0 }}>
              <input
                className="input"
                value={renameValue}
                onChange={(e) => setRenameValue(e.target.value)}
                placeholder="Your name"
              />
              <button className="btn btn-primary" style={{ marginTop: 10 }} onClick={saveName}>
                Save
              </button>
            </div>
          ) : (
            <button type="button" style={{ ...linkStyle, marginTop: 10 }} onClick={() => setRenaming(true)}>
              Change name
            </button>
          )}
        </div>

        <button className="btn btn-soft" onClick={() => signOut()}>
          Sign out
        </button>
      </div>
    </div>
  )
}
