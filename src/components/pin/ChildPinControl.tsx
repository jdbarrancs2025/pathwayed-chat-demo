import { useState } from 'react'
import { clearStudentPin, setStudentPin } from '@/lib/students'

interface ChildPinControlProps {
  studentId: string
  /** Whether a PIN is currently set (drives Set vs Change/Remove). */
  hasPin: boolean
  /** Called after a successful set (true) or clear (false) so parents can refresh state. */
  onChanged?: (hasPin: boolean) => void
}

const linkBtn: React.CSSProperties = {
  background: 'none',
  border: 'none',
  color: '#003078',
  fontWeight: 700,
  fontSize: 14,
  textDecoration: 'underline',
  textUnderlineOffset: 3,
  cursor: 'pointer',
  padding: 0,
}

/**
 * Set / change / remove a single child's 4-digit sign-in PIN. Writes immediately
 * through the owner-checked RPCs. Dropped into the child Edit form and each child
 * row in Settings, so both entry points manage the same PIN.
 */
export function ChildPinControl({ studentId, hasPin, onChanged }: ChildPinControlProps) {
  const [editing, setEditing] = useState(false)
  const [pin, setPin] = useState('')
  const [busy, setBusy] = useState(false)
  const [err, setErr] = useState('')

  const save = async () => {
    if (pin.length !== 4) {
      setErr('Enter 4 digits.')
      return
    }
    setBusy(true)
    const { error } = await setStudentPin(studentId, pin)
    setBusy(false)
    if (error) {
      setErr('Could not save, try again.')
      return
    }
    setEditing(false)
    setPin('')
    setErr('')
    onChanged?.(true)
  }

  const remove = async () => {
    setBusy(true)
    const { error } = await clearStudentPin(studentId)
    setBusy(false)
    if (error) {
      setErr('Could not remove, try again.')
      return
    }
    onChanged?.(false)
  }

  if (editing) {
    return (
      <div style={{ display: 'flex', alignItems: 'center', gap: 10, flexWrap: 'wrap' }}>
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
          aria-label="4-digit PIN"
          style={{
            width: 96,
            padding: '10px 12px',
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
        <button
          type="button"
          onClick={() => void save()}
          disabled={busy}
          style={{ ...linkBtn, color: '#CC543C' }}
        >
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
    )
  }

  return (
    <div style={{ display: 'flex', alignItems: 'center', gap: 12, flexWrap: 'wrap' }}>
      <span style={{ fontSize: 13.5, color: hasPin ? '#1F9E6F' : '#5A6172', fontWeight: 600 }}>
        {hasPin ? '🔒 PIN set' : 'No PIN'}
      </span>
      <button type="button" onClick={() => setEditing(true)} style={linkBtn}>
        {hasPin ? 'Change' : 'Set a PIN'}
      </button>
      {hasPin && (
        <button
          type="button"
          onClick={() => void remove()}
          disabled={busy}
          style={{ ...linkBtn, color: '#C0492F' }}
        >
          {busy ? 'Removing…' : 'Remove'}
        </button>
      )}
      {err && <span style={{ color: '#C0492F', fontSize: 13, fontWeight: 500 }}>{err}</span>}
    </div>
  )
}
