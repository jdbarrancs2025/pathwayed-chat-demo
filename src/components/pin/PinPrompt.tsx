import { useEffect, useRef, useState } from 'react'

interface PinPromptProps {
  /** Big friendly heading, e.g. "Enter Maya's PIN". */
  title: string
  /** Optional line under the title. */
  subtitle?: string
  /**
   * Verify the entered 4-digit PIN. Resolve `true` to accept (the prompt closes;
   * the caller navigates), or `false` for a wrong PIN (friendly retry, no lockout).
   */
  onSubmit: (pin: string) => Promise<boolean>
  onCancel: () => void
  submitLabel?: string
}

/**
 * A centered, kid-friendly 4-digit PIN entry overlay. Used both for a child
 * signing into their own space at the picker and for the parent unlocking the
 * parent area from a kid session. Palette matches the kid home / welcome screens
 * (literal hex, since this overlay renders outside the `.shell` token scope).
 */
export function PinPrompt({ title, subtitle, onSubmit, onCancel, submitLabel = 'Enter' }: PinPromptProps) {
  const [pin, setPin] = useState('')
  const [error, setError] = useState(false)
  const [busy, setBusy] = useState(false)
  const inputRef = useRef<HTMLInputElement>(null)

  useEffect(() => {
    inputRef.current?.focus()
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onCancel()
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [onCancel])

  const ready = pin.length === 4 && !busy

  const submit = async () => {
    if (!ready) return
    setBusy(true)
    const ok = await onSubmit(pin)
    if (!ok) {
      setError(true)
      setPin('')
      setBusy(false)
      inputRef.current?.focus()
    }
    // On success the parent unmounts this prompt, so no state reset needed.
  }

  return (
    <div
      role="dialog"
      aria-modal="true"
      aria-label={title}
      onMouseDown={(e) => {
        if (e.target === e.currentTarget) onCancel()
      }}
      style={{
        position: 'fixed',
        inset: 0,
        zIndex: 200,
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        padding: 22,
        background: 'rgba(28,34,48,.5)',
        backdropFilter: 'blur(6px)',
      }}
    >
      <div
        style={{
          width: '100%',
          maxWidth: 380,
          background: '#fff',
          border: '1px solid #ECE4D8',
          borderRadius: 24,
          boxShadow: '0 16px 50px rgba(28,34,48,.28)',
          padding: 30,
          textAlign: 'center',
        }}
      >
        <h2
          style={{
            fontFamily: '"Baloo 2", "Trebuchet MS", system-ui, sans-serif',
            color: '#003078',
            fontSize: 24,
            fontWeight: 700,
            margin: 0,
          }}
        >
          {title}
        </h2>
        {subtitle && <p style={{ color: '#5A6172', fontSize: 14.5, margin: '8px 0 0' }}>{subtitle}</p>}

        <input
          ref={inputRef}
          type="password"
          inputMode="numeric"
          autoComplete="off"
          value={pin}
          onChange={(e) => {
            setPin(e.target.value.replace(/\D/g, '').slice(0, 4))
            if (error) setError(false)
          }}
          onKeyDown={(e) => {
            if (e.key === 'Enter') void submit()
          }}
          aria-label="4-digit PIN"
          placeholder="••••"
          style={{
            width: 200,
            margin: '22px auto 0',
            display: 'block',
            padding: '16px 10px',
            border: error ? '1.6px solid #C0492F' : '1.6px solid #ECE4D8',
            borderRadius: 16,
            background: '#fff',
            fontSize: 34,
            letterSpacing: '0.5em',
            textAlign: 'center',
            color: '#1C2230',
            boxShadow: error ? '0 0 0 4px rgba(192,73,47,.12)' : undefined,
            outline: 'none',
          }}
        />

        <div style={{ color: '#C0492F', fontSize: 14, fontWeight: 500, minHeight: 20, marginTop: 10 }}>
          {error ? "That PIN didn't match. Try again." : ''}
        </div>

        <button
          type="button"
          onClick={() => void submit()}
          disabled={!ready}
          style={{
            width: '100%',
            marginTop: 6,
            padding: '15px 22px',
            borderRadius: 999,
            fontWeight: 700,
            fontSize: 15.5,
            border: 'none',
            background: '#CC543C',
            color: '#fff',
            cursor: ready ? 'pointer' : 'not-allowed',
            opacity: ready ? 1 : 0.45,
          }}
        >
          {busy ? 'Checking…' : submitLabel}
        </button>
        <button
          type="button"
          onClick={onCancel}
          disabled={busy}
          style={{
            display: 'block',
            margin: '12px auto 0',
            background: 'none',
            border: 'none',
            color: '#003078',
            fontWeight: 700,
            fontSize: 14.5,
            textDecoration: 'underline',
            textUnderlineOffset: 3,
            cursor: busy ? 'not-allowed' : 'pointer',
          }}
        >
          Cancel
        </button>
      </div>
    </div>
  )
}
