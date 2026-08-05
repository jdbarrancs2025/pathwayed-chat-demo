import { useEffect, useState } from 'react'
import { clearParentPin, hasParentPin, setParentPin } from '@/lib/profile'

interface ParentPinControlProps {
  parentId: string
}

const linkBtn: React.CSSProperties = {
  background: 'none',
  border: 'none',
  color: '#003078',
  fontWeight: 700,
  fontSize: 14.5,
  textDecoration: 'underline',
  textUnderlineOffset: 3,
  cursor: 'pointer',
  padding: 0,
}

/**
 * Set / change / remove the account-level parent PIN. When set, it gates the
 * Parent dashboard, Settings, and Sign out while a child is signed in on a
 * shared device. When unset, those stay open (the requested fallback).
 */
export function ParentPinControl({ parentId }: ParentPinControlProps) {
  const [hasPin, setHasPin] = useState<boolean | null>(null)
  const [editing, setEditing] = useState(false)
  const [pin, setPin] = useState('')
  const [busy, setBusy] = useState(false)
  const [err, setErr] = useState('')

  useEffect(() => {
    let active = true
    hasParentPin(parentId).then((v) => {
      if (active) setHasPin(v)
    })
    return () => {
      active = false
    }
  }, [parentId])

  const save = async () => {
    if (pin.length !== 4) {
      setErr('Enter 4 digits.')
      return
    }
    setBusy(true)
    const { error } = await setParentPin(pin)
    setBusy(false)
    if (error) {
      setErr('Could not save, try again.')
      return
    }
    setEditing(false)
    setPin('')
    setErr('')
    setHasPin(true)
  }

  const remove = async () => {
    setBusy(true)
    const { error } = await clearParentPin()
    setBusy(false)
    if (error) {
      setErr('Could not remove, try again.')
      return
    }
    setHasPin(false)
  }

  return (
    <div style={{ marginTop: 4 }}>
      <div className="stat-row">
        <span className="muted">Parent PIN</span>
        <b>{hasPin === null ? '-' : hasPin ? '🔒 On' : 'Off'}</b>
      </div>
      <p style={{ fontSize: 13, color: '#5A6172', margin: '8px 0 0' }}>
        A 4-digit parent PIN locks the Parent dashboard, Settings, and Sign out while a child is signed in on
        this device. Leave it off for open access.
      </p>

      {editing ? (
        <div style={{ display: 'flex', alignItems: 'center', gap: 10, flexWrap: 'wrap', marginTop: 10 }}>
          <input
            type="text"
            inputMode="numeric"
            autoComplete="off"
            autoFocus
            value={pin}
            onChange={(e) => {
              setPin(e.target.value.replace(/\D/g, '').slice(0, 4))
              if (err) setErr('')
            }}
            onKeyDown={(e) => {
              if (e.key === 'Enter') void save()
            }}
            placeholder="0000"
            aria-label="4-digit parent PIN"
            style={{
              width: 110,
              padding: '11px 12px',
              border: err ? '1.6px solid #C0492F' : '1.6px solid #ECE4D8',
              borderRadius: 12,
              background: '#fff',
              fontSize: 18,
              letterSpacing: '0.28em',
              textAlign: 'center',
              color: '#1C2230',
              outline: 'none',
            }}
          />
          <button type="button" onClick={() => void save()} disabled={busy} style={{ ...linkBtn, color: '#CC543C' }}>
            {busy ? 'Saving…' : 'Save PIN'}
          </button>
          <button
            type="button"
            onClick={() => {
              setEditing(false)
              setPin('')
              setErr('')
            }}
            disabled={busy}
            style={{ ...linkBtn, color: '#5A6172' }}
          >
            Cancel
          </button>
          {err && <span style={{ color: '#C0492F', fontSize: 13, fontWeight: 500 }}>{err}</span>}
        </div>
      ) : (
        hasPin !== null && (
          <div style={{ display: 'flex', gap: 16, marginTop: 10 }}>
            <button type="button" style={linkBtn} onClick={() => setEditing(true)}>
              {hasPin ? 'Change PIN' : 'Set a parent PIN'}
            </button>
            {hasPin && (
              <button type="button" style={{ ...linkBtn, color: '#C0492F' }} onClick={() => void remove()} disabled={busy}>
                {busy ? 'Removing…' : 'Remove'}
              </button>
            )}
          </div>
        )
      )}
    </div>
  )
}
