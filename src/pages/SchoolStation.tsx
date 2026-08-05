import { useEffect, useMemo, useState } from "react"
import { useNavigate } from "react-router"
import { supabase } from "@/lib/supabase"
import { deanSupabase } from "@/lib/deanSupabase"
import type { Session } from "@supabase/supabase-js"
import { schoolPinLogin } from "@/lib/schoolBridge"
import { setSchoolSession } from "@/lib/schoolSession"

// K-8 school station. A Dean staff member signs in FIRST (Google SSO against the
// Dean project); only inside that authenticated staff session can a student PIN be
// entered. On a covered resolve the server mints the student's tutoring identity
// and returns a short-lived session, which we adopt so the student flows through
// the normal app. The PIN is never stored — it lives only in the input until submit.

const wrap: React.CSSProperties = {
  maxWidth: 460,
  margin: "48px auto",
  padding: 24,
  background: "#fff",
  border: "1px solid #ECE4D8",
  borderRadius: 16,
}
const btn: React.CSSProperties = {
  padding: "10px 16px",
  borderRadius: 10,
  border: "none",
  background: "#1e3a6e",
  color: "#fff",
  fontWeight: 600,
  cursor: "pointer",
}

export function SchoolStation() {
  const navigate = useNavigate()
  const [staffEmail, setStaffEmail] = useState<string | null>(null)
  const [staffToken, setStaffToken] = useState<string | null>(null)
  const [schoolId, setSchoolId] = useState<string | null>(null)
  const [pin, setPin] = useState("")
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const configured = useMemo(() => deanSupabase !== null, [])

  // If an OAuth return lands on /school with an error (e.g. the Dean project's
  // redirect allow-list is missing this exact URL, so Supabase bounced the return
  // to its Site URL), show it instead of silently re-rendering the sign-in button,
  // and strip the params so a refresh doesn't replay a stale/errored return. A
  // successful return carries ?code= (not ?error=) and is left for the Dean client
  // to exchange via detectSessionInUrl.
  useEffect(() => {
    const raw = window.location.search.slice(1) || window.location.hash.slice(1)
    if (!raw) return
    const params = new URLSearchParams(raw)
    const err = params.get("error_description") ?? params.get("error")
    if (err) {
      setError(`Staff sign-in didn't complete: ${err}. Please try again.`)
      window.history.replaceState({}, "", "/school")
    }
  }, [])

  // Track the Dean staff session (also completes the PKCE OAuth return on load).
  useEffect(() => {
    // Captured into a local so the narrowing survives into the async closure
    // below. deanSupabase is null when the Dean env vars are not configured, and
    // TypeScript will not carry a narrowing on an imported binding across a
    // function boundary.
    const dean = deanSupabase
    if (!dean) return
    let active = true

    const apply = async (session: Session | null) => {
      if (!active) return
      if (!session?.user) {
        setStaffEmail(null)
        setStaffToken(null)
        setSchoolId(null)
        return
      }
      setStaffEmail(session.user.email ?? null)
      setStaffToken(session.access_token)
      // The staff member's own school. Server + Dean both re-validate the match.
      const { data } = await dean
        .from("profiles")
        .select("school_id")
        .eq("id", session.user.id)
        .maybeSingle()
      if (active) setSchoolId((data?.school_id as string | null) ?? null)
    }

    void dean.auth.getSession().then(({ data }) => apply(data.session))
    const { data: sub } = dean.auth.onAuthStateChange((_e, s) => void apply(s))
    return () => {
      active = false
      sub.subscription.unsubscribe()
    }
  }, [])

  async function staffSignIn() {
    if (!deanSupabase) return
    await deanSupabase.auth.signInWithOAuth({
      provider: "google",
      options: { redirectTo: `${window.location.origin}/school` },
    })
  }

  async function staffSignOut() {
    await deanSupabase?.auth.signOut()
  }

  async function startSession() {
    setError(null)
    if (!staffToken || !schoolId) {
      setError("Sign in as staff first.")
      return
    }
    if (!/^\d{4,6}$/.test(pin.trim())) {
      setError("Enter the student's 4-6 digit PIN.")
      return
    }
    setBusy(true)
    const r = await schoolPinLogin(schoolId, pin.trim(), staffToken)
    setPin("") // never keep the PIN around
    setBusy(false)

    if (!r.covered || !r.student_id || !r.session) {
      setError(
        r.error === "staff_session_required" || r.error === "staff_session_invalid"
          ? "Staff session expired, sign in again."
          : r.error === "rate_limited"
            ? "Too many attempts. Wait a moment and retry."
            : "No covered student found for that PIN.",
      )
      return
    }

    // Set the covered session BEFORE adopting the identity so the post-login gate
    // doesn't re-run. Adopt the short-lived minted access token (a dud refresh
    // token means the session simply ends when the class-length token expires).
    setSchoolSession({
      school_id: schoolId,
      student_id: r.student_id,
      first_name: r.first_name ?? "",
      grade: r.grade ?? "",
      covered: true,
    })
    await supabase.auth.setSession({
      access_token: r.session.access_token,
      refresh_token: "school-minted-no-refresh",
    })
    navigate(`/students/${r.student_id}`, { replace: true })
  }

  if (!configured) {
    return (
      <div style={wrap}>
        <h2 style={{ marginTop: 0 }}>School station</h2>
        <p style={{ color: "#6b7280" }}>
          Not configured. Set VITE_DEAN_SUPABASE_URL and VITE_DEAN_SUPABASE_ANON_KEY.
        </p>
      </div>
    )
  }

  return (
    <div style={wrap}>
      <h2 style={{ marginTop: 0 }}>School station</h2>

      {!staffToken ? (
        <>
          <p style={{ color: "#6b7280" }}>
            Staff sign-in required. A student PIN can only be entered inside an
            authenticated staff session.
          </p>
          <button style={btn} onClick={() => void staffSignIn()}>
            Sign in as staff (Google)
          </button>
        </>
      ) : (
        <>
          <p style={{ fontSize: 13, color: "#374151" }}>
            Signed in as <strong>{staffEmail}</strong>
            {schoolId ? null : ", no school on this account"}
            {"  "}
            <button
              onClick={() => void staffSignOut()}
              style={{ ...btn, background: "transparent", color: "#1e3a6e", padding: 0 }}
            >
              Sign out
            </button>
          </p>
          <label style={{ display: "block", fontSize: 13, marginBottom: 6 }}>
            Student PIN
          </label>
          <input
            value={pin}
            onChange={(e) => setPin(e.target.value.replace(/\D/g, "").slice(0, 6))}
            inputMode="numeric"
            autoComplete="off"
            placeholder="••••"
            style={{
              width: "100%",
              padding: "10px 12px",
              borderRadius: 10,
              border: "1px solid #d1d5db",
              letterSpacing: 6,
              marginBottom: 12,
            }}
          />
          <button style={btn} disabled={busy || !schoolId} onClick={() => void startSession()}>
            {busy ? "Starting…" : "Start session"}
          </button>
        </>
      )}

      {error && <p style={{ color: "#b91c1c", fontSize: 13, marginTop: 12 }}>{error}</p>}
    </div>
  )
}
