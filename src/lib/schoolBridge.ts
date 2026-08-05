// Client wrappers for the school-license bridge. These call our OWN api/* routes
// (server functions that hold the Dean shared secret) — the secret is NEVER in
// client code, and there is no VITE_-prefixed bridge var anywhere. A K-8 PIN is
// passed straight through to the server route to build one request and is never
// stored, cached, or logged on the client.

export interface SchoolLoginResult {
  covered: boolean
  student_id?: string // LOCAL students.id for a covered student
  first_name?: string
  grade?: string
  school_id?: string
}

/**
 * Post-SSO school check. Sends only the caller's own Supabase access token; the
 * server derives the verified email, maps the domain -> school_id, resolves via
 * Dean, and lookup-or-creates the local students row. Returns covered:false for
 * B2C / unknown-domain logins (the app then continues the normal consumer path).
 */
export async function schoolLogin(accessToken: string): Promise<SchoolLoginResult> {
  try {
    const res = await fetch("/api/school-login", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ access_token: accessToken }),
    })
    if (!res.ok) return { covered: false }
    return (await res.json()) as SchoolLoginResult
  } catch {
    return { covered: false } // never block login on the school check
  }
}

export interface PinLoginResult {
  covered: boolean
  student_id?: string // LOCAL students.id
  first_name?: string
  grade?: string
  /** Short-lived minted session for the covered student to adopt (no refresh token). */
  session?: { access_token: string; expires_at: number }
  error?: string // e.g. "staff_session_required" | "staff_session_invalid" | "rate_limited"
}

/**
 * K-8 staff-supervised PIN login. Runs inside an authenticated Dean staff session
 * (staffSessionToken). On success the server mints/reuses the student's tutoring
 * identity and returns a short-lived session to adopt. The `pin` is used only to
 * build this request and is never stored or logged on the client.
 */
export async function schoolPinLogin(
  schoolId: string,
  pin: string,
  staffSessionToken: string,
): Promise<PinLoginResult> {
  try {
    const res = await fetch("/api/school-pin-login", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ school_id: schoolId, pin, staff_session_token: staffSessionToken }),
    })
    const data = (await res.json().catch(() => ({}))) as PinLoginResult
    if (!res.ok) return { covered: false, error: data.error ?? `error_${res.status}` }
    return data
  } catch {
    return { covered: false, error: "network_error" }
  }
}

