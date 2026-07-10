/* eslint-disable react-refresh/only-export-components */
import {
  createContext,
  useContext,
  useEffect,
  useState,
  useCallback,
  type ReactNode,
} from 'react'
import type { Session, User } from '@supabase/supabase-js'
import { supabase } from '@/lib/supabase'

/** OAuth providers offered on the welcome screen ('azure' = Microsoft). */
export type OAuthProvider = 'google' | 'azure' | 'apple'

interface AuthContextValue {
  user: User | null
  session: Session | null
  loading: boolean
  signInWith: (provider: OAuthProvider) => Promise<void>
  signInWithPassword: (email: string, password: string) => Promise<{ error: string | null }>
  signUpWithEmail: (
    email: string,
    password: string,
  ) => Promise<{ error: string | null; needsConfirmation: boolean }>
  resetPasswordForEmail: (email: string) => Promise<{ error: string | null }>
  updatePassword: (password: string) => Promise<{ error: string | null; userId: string | null }>
  signOut: () => Promise<void>
}

const AuthContext = createContext<AuthContextValue | null>(null)

/**
 * Explicitly consume an OAuth session left in the URL fragment
 * (`#access_token=…&refresh_token=…`) and clear it from the address bar.
 *
 * This backs up the client's own `detectSessionInUrl`: if a redirect races or
 * the auto-parse fails, we still establish the session here. Both tokens are
 * required by `setSession`; if the fragment is incomplete we skip (only the
 * provider/config can fix a partial return) but still scrub the URL.
 */
async function captureSessionFromUrlHash(): Promise<void> {
  if (typeof window === 'undefined') return
  const hash = window.location.hash
  if (!hash || !hash.includes('access_token')) return

  const params = new URLSearchParams(hash.replace(/^#/, ''))
  const accessToken = params.get('access_token')
  const refreshToken = params.get('refresh_token')
  const errorDescription = params.get('error_description')

  if (errorDescription) {
    console.error('[auth] OAuth returned an error in the URL', errorDescription)
  } else if (accessToken && refreshToken) {
    const { error } = await supabase.auth.setSession({
      access_token: accessToken,
      refresh_token: refreshToken,
    })
    if (error) console.error('[auth] setSession from URL fragment failed', error.message)
  }

  // Scrub the tokens/error from the URL without a navigation (keeps path intact).
  const url = new URL(window.location.href)
  url.hash = ''
  window.history.replaceState(window.history.state, '', url.toString())
}

export function AuthProvider({ children }: { children: ReactNode }) {
  const [session, setSession] = useState<Session | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    let active = true

    async function bootstrap() {
      // Belt-and-suspenders for the OAuth return: if tokens are still sitting in
      // the URL hash (e.g. a redirect raced the client's auto-detection, or it
      // failed to consume them), establish the session explicitly. On success
      // the client clears the hash itself; we also scrub it here regardless so
      // the tokens don't linger in the address bar / history.
      await captureSessionFromUrlHash()

      // Hydrate the current session (getSession() awaits the client's URL parse,
      // so this reflects the session established above or by detectSessionInUrl).
      const { data } = await supabase.auth.getSession()
      if (!active) return
      setSession(data.session)
      setLoading(false)
    }

    void bootstrap()

    // Keep in sync with auth changes (including the redirect back from OAuth).
    const { data: sub } = supabase.auth.onAuthStateChange((_event, nextSession) => {
      setSession(nextSession)
      setLoading(false)
    })

    return () => {
      active = false
      sub.subscription.unsubscribe()
    }
  }, [])

  // Passwords are handled entirely by Supabase Auth — we never collect or store them.
  const signInWith = useCallback(async (provider: OAuthProvider) => {
    await supabase.auth.signInWithOAuth({
      provider,
      options: { redirectTo: window.location.origin },
    })
  }, [])

  const signInWithPassword = useCallback(async (email: string, password: string) => {
    const { error } = await supabase.auth.signInWithPassword({ email, password })
    if (error) {
      // Surface the real cause for diagnosis instead of swallowing it.
      console.error('[auth] signInWithPassword failed', {
        code: error.code,
        status: error.status,
        message: error.message,
      })
    }
    return { error: error?.message ?? null }
  }, [])

  const signUpWithEmail = useCallback(async (email: string, password: string) => {
    const { data, error } = await supabase.auth.signUp({ email, password })
    if (error) {
      console.error('[auth] signUp failed', {
        code: error.code,
        status: error.status,
        message: error.message,
      })
      return { error: error.message, needsConfirmation: false }
    }
    // With email-enumeration protection on, signing up an existing address
    // returns no error but an empty identities array.
    if (data.user && Array.isArray(data.user.identities) && data.user.identities.length === 0) {
      return { error: 'already registered', needsConfirmation: false }
    }
    return { error: null, needsConfirmation: !data.session }
  }, [])

  const resetPasswordForEmail = useCallback(async (email: string) => {
    const { error } = await supabase.auth.resetPasswordForEmail(email, {
      redirectTo: `${window.location.origin}/reset-password`,
    })
    return { error: error?.message ?? null }
  }, [])

  const updatePassword = useCallback(async (password: string) => {
    const { data, error } = await supabase.auth.updateUser({ password })
    return { error: error?.message ?? null, userId: data.user?.id ?? null }
  }, [])

  const signOut = useCallback(async () => {
    await supabase.auth.signOut()
  }, [])

  return (
    <AuthContext.Provider
      value={{
        user: session?.user ?? null,
        session,
        loading,
        signInWith,
        signInWithPassword,
        signUpWithEmail,
        resetPasswordForEmail,
        updatePassword,
        signOut,
      }}
    >
      {children}
    </AuthContext.Provider>
  )
}

export function useAuth(): AuthContextValue {
  const ctx = useContext(AuthContext)
  if (!ctx) {
    throw new Error('useAuth must be used within an AuthProvider')
  }
  return ctx
}
