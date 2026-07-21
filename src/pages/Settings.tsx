import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router'
import { useAuth } from '@/context/AuthContext'
import {
  activeStudents,
  avColor,
  deleteStudent,
  gradeLabel,
  hasPin,
  initials,
  levelLabel,
  listStudents,
  type Student,
} from '@/lib/students'
import { getDisplayName, getSubscription, updateDisplayName, type Subscription } from '@/lib/profile'
import { seatCap } from '@/lib/accessGate'
import { BillingPanel } from '@/components/BillingPanel'
import { SeatPicker } from '@/components/SeatPicker'
import { TopMenu } from '@/components/TopMenu'
import { ChildPinControl } from '@/components/pin/ChildPinControl'
import { ParentPinControl } from '@/components/pin/ParentPinControl'
import '@/styles/app-screens.css'

const dispFont = '"Baloo 2", "Trebuchet MS", system-ui, sans-serif'

export function Settings() {
  const { user, signOut } = useAuth()
  const navigate = useNavigate()
  const [children, setChildren] = useState<Student[]>([])
  const [sub, setSub] = useState<Subscription | null>(null)
  const [name, setName] = useState('')
  const [renaming, setRenaming] = useState(false)
  const [renameValue, setRenameValue] = useState('')
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (!user) return
    let active = true
    void (async () => {
      const [kids, displayName, subscription] = await Promise.all([
        listStudents(user.id),
        getDisplayName(user.id),
        getSubscription(user.id),
      ])
      if (!active) return
      setChildren(kids)
      setSub(subscription)
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

  // Reflect a per-child PIN set/clear locally so the row updates without a refetch.
  const onChildPinChanged = (id: string, has: boolean) => {
    setChildren((prev) => prev.map((c) => (c.id === id ? { ...c, pin_hash: has ? 'set' : null } : c)))
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
        <TopMenu mark="horizontal" />
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
                  {/* Per-child sign-in PIN — lets this child open their own space on a
                      shared device. Optional; no PIN means direct entry as before. */}
                  <div style={{ marginTop: 14, paddingTop: 14, borderTop: '1px solid #F3ECE0' }}>
                    <div style={{ fontSize: 13, color: '#5A6172', marginBottom: 8 }}>
                      Sign-in PIN — lets {child.first_name} open their own space on a shared device.
                    </div>
                    <ChildPinControl
                      studentId={child.id}
                      hasPin={hasPin(child)}
                      onChanged={(has) => onChildPinChanged(child.id, has)}
                    />
                  </div>
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

        {/* Active-profile seat picker — shown when the account has more active
            children than its seat cap, or has any paused child to reactivate.
            Lets the parent choose which children stay active (never deletes). */}
        {!loading &&
          sub &&
          (() => {
            const cap = seatCap(sub)
            const show = children.some((c) => !c.active) || activeStudents(children).length > cap
            return show ? (
              <SeatPicker students={children} cap={cap} onChange={setChildren} />
            ) : null
          })()}

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

          {/* Account-level parent PIN — gates the parent area / Sign out from a
              kid session on a shared device. Optional (open access when unset). */}
          {user && (
            <div style={{ marginTop: 18, paddingTop: 16, borderTop: '1px solid #F3ECE0' }}>
              <ParentPinControl parentId={user.id} />
            </div>
          )}
        </div>

        <button className="btn btn-soft" onClick={() => signOut()}>
          Sign out
        </button>
      </div>
    </div>
  )
}
