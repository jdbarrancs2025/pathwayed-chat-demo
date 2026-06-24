import { useState } from 'react'
import { useNavigate } from 'react-router'
import { useAuth } from '@/context/AuthContext'
import { getConsentStatus } from '@/lib/consent'
import logoImg from '@/assets/logo.png'

const inputStyle: React.CSSProperties = {
  width: '100%',
  padding: '13px 15px',
  border: '1.6px solid #ECE4D8',
  borderRadius: 14,
  background: '#fff',
  fontSize: 16,
  color: '#1C2230',
}

function friendlyResetError(raw: string): string {
  const m = raw.toLowerCase()
  if (m.includes('at least') || m.includes('should be at least'))
    return 'Please use a password with at least 6 characters.'
  if (m.includes('session') || m.includes('expired') || m.includes('token'))
    return 'Your reset link has expired. Please request a new one from the sign-in screen.'
  return "We couldn't update your password. Please try again."
}

/**
 * Lands here from the password-reset email; Supabase has activated a recovery
 * session. Set a new password, then continue through the normal consent check.
 */
export function ResetPassword() {
  const { updatePassword } = useAuth()
  const navigate = useNavigate()
  const [password, setPassword] = useState('')
  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState('')

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (submitting) return
    if (password.length < 6) {
      setError('Please use a password with at least 6 characters.')
      return
    }
    setSubmitting(true)
    setError('')
    const { error: updateError, userId } = await updatePassword(password)
    if (updateError) {
      setError(friendlyResetError(updateError))
      setSubmitting(false)
      return
    }
    if (userId) {
      const hasConsent = await getConsentStatus(userId)
      navigate(hasConsent ? '/students' : '/consent', { replace: true })
    } else {
      navigate('/', { replace: true })
    }
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
      <div
        style={{
          background: '#FFFFFF',
          border: '1px solid #ECE4D8',
          borderRadius: 20,
          boxShadow: '0 1px 2px rgba(28,34,48,.04),0 10px 30px rgba(28,34,48,.07)',
          width: '100%',
          maxWidth: 480,
          padding: 34,
          textAlign: 'center',
        }}
      >
        <img
          src={logoImg}
          alt="PathwayEd"
          style={{ width: 'min(420px,86%)', height: 'auto', display: 'block', margin: '2px auto 0' }}
        />
        <p
          style={{
            color: '#CC543C',
            fontWeight: 700,
            fontSize: 12,
            letterSpacing: '.1em',
            textTransform: 'uppercase',
            marginTop: 18,
          }}
        >
          Reset password
        </p>
        <h1
          style={{
            fontFamily: '"Baloo 2", "Trebuchet MS", system-ui, sans-serif',
            color: '#003078',
            fontSize: 25,
            fontWeight: 700,
            letterSpacing: '-.01em',
            margin: '5px 0 8px',
          }}
        >
          Choose a new password
        </h1>
        <p style={{ color: '#5A6172', fontSize: 14.5, margin: '0 0 22px' }}>
          Enter a new password for your account.
        </p>

        <form onSubmit={handleSubmit} style={{ textAlign: 'left' }}>
          <input
            type="password"
            autoComplete="new-password"
            aria-label="New password"
            placeholder="New password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            style={inputStyle}
          />
          {error && (
            <p style={{ color: '#C0492F', fontSize: 14, fontWeight: 500, margin: '10px 0 0' }}>{error}</p>
          )}
          <button
            type="submit"
            disabled={submitting}
            style={{
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              width: '100%',
              padding: '14px 18px',
              borderRadius: 999,
              fontWeight: 700,
              fontSize: 15.5,
              marginTop: 12,
              background: '#CC543C',
              color: '#fff',
              cursor: submitting ? 'not-allowed' : 'pointer',
              opacity: submitting ? 0.5 : 1,
            }}
          >
            {submitting ? 'Saving…' : 'Confirm'}
          </button>
        </form>
      </div>
    </div>
  )
}
