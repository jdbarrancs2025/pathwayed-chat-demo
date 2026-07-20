import { useEffect, useRef, useState } from 'react'
import { useNavigate } from 'react-router'
import { useAuth } from '@/context/AuthContext'
import { exitKidSession, useKidSession } from '@/lib/kidSession'
import { hasParentPin, verifyParentPin } from '@/lib/profile'
import { PinPrompt } from '@/components/pin/PinPrompt'
import '@/styles/app-screens.css'

/**
 * The app-wide navigation menu: a three-line (hamburger) button that opens a
 * dropdown linking to Home/Dashboard, Settings, and Sign out. Self-contained so
 * it can drop into any header (TopMenu, PageLayout, …) and behave identically.
 *
 * When a child is signed in on this device (a "kid session"), the parent-facing
 * exits — Parent dashboard, Settings, and Sign out — are gated behind the
 * account's parent PIN. If no parent PIN is set they pass straight through
 * (open-access fallback). Home (the child picker) is never gated.
 *
 * `size` overrides the default 44px button for a specific screen (e.g. the larger
 * welcome header). Omitted everywhere else, so other screens are unaffected.
 */
export function HeaderMenu({ size }: { size?: number } = {}) {
  const navigate = useNavigate()
  const { user, signOut } = useAuth()
  const isKid = useKidSession()
  const [open, setOpen] = useState(false)
  // Parent PIN gate: the action to run once the parent PIN is verified.
  const [prompting, setPrompting] = useState(false)
  const pendingAction = useRef<null | (() => void | Promise<void>)>(null)
  const iconSize = size ? Math.round(size * 0.5) : 22

  useEffect(() => {
    if (!open) return
    const close = () => setOpen(false)
    // Defer so the opening click doesn't immediately close it.
    const t = window.setTimeout(() => window.addEventListener('click', close), 0)
    return () => {
      window.clearTimeout(t)
      window.removeEventListener('click', close)
    }
  }, [open])

  const go = (path: string) => {
    setOpen(false)
    navigate(path)
  }

  const handleSignOut = async () => {
    setOpen(false)
    await signOut()
    navigate('/', { replace: true })
  }

  // Run a parent-facing action, gating behind the parent PIN when a child is
  // signed in. No kid session, or no parent PIN set → run immediately.
  const gate = async (action: () => void | Promise<void>) => {
    setOpen(false)
    if (!isKid) {
      await action()
      return
    }
    const needsPin = user ? await hasParentPin(user.id) : false
    if (needsPin) {
      pendingAction.current = action
      setPrompting(true)
    } else {
      // Open-access fallback: leaving a kid session for the parent area.
      exitKidSession()
      await action()
    }
  }

  return (
    <div className="menuwrap" onClick={(e) => e.stopPropagation()}>
      <button
        className="menubtn"
        aria-label="Menu"
        aria-expanded={open}
        onClick={() => setOpen((o) => !o)}
        style={size ? { width: size, height: size, borderRadius: Math.round(size * 0.27) } : undefined}
      >
        <svg width={iconSize} height={iconSize} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round">
          <path d="M3 6h18M3 12h18M3 18h18" />
        </svg>
      </button>
      <div className={`menu ${open ? 'open' : ''}`}>
        <button onClick={() => go('/students')}>
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M3 12l9-9 9 9M5 10v10a1 1 0 0 0 1 1h4v-6h4v6h4a1 1 0 0 0 1-1V10" />
          </svg>
          Home
        </button>
        <button onClick={() => void gate(() => navigate('/parent'))}>
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <rect x="3" y="3" width="7" height="9" rx="1" />
            <rect x="14" y="3" width="7" height="5" rx="1" />
            <rect x="14" y="12" width="7" height="9" rx="1" />
            <rect x="3" y="16" width="7" height="5" rx="1" />
          </svg>
          Parent dashboard
        </button>
        <button onClick={() => void gate(() => navigate('/settings'))}>
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <circle cx="12" cy="12" r="3" />
            <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 1 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09a1.65 1.65 0 0 0-1-1.51 1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 1 1-2.83-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09a1.65 1.65 0 0 0 1.51-1 1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 1 1 2.83-2.83l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 1 1 2.83 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1z" />
          </svg>
          Settings
        </button>
        <button onClick={() => void gate(handleSignOut)}>
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4M16 17l5-5-5-5M21 12H9" />
          </svg>
          Sign out
        </button>
      </div>

      {prompting && (
        <PinPrompt
          title="Parent check"
          subtitle="Enter your parent PIN to continue."
          submitLabel="Unlock"
          onCancel={() => {
            pendingAction.current = null
            setPrompting(false)
          }}
          onSubmit={async (pin) => {
            const ok = await verifyParentPin(pin)
            if (!ok) return false
            setPrompting(false)
            exitKidSession()
            const action = pendingAction.current
            pendingAction.current = null
            await action?.()
            return true
          }}
        />
      )}
    </div>
  )
}
