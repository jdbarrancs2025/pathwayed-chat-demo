// Client wrappers for the school-license bridge. These call our OWN api/* routes
// (server functions that hold the Dean shared secret) — the secret is NEVER in
// client code, and there is no VITE_-prefixed bridge var anywhere. A K-8 PIN is
// passed straight through to the server route to build one request and is never
// stored, cached, or logged on the client.

export interface Entitlement {
  entitled: boolean
  seat_cap: number | null
}

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

export type ResolvedStudent =
  | { covered: true; student_id: string; first_name: string; grade: string }
  | { covered: false }

/** Is this school licensed for tutoring? (per-school, server-cached 24h). */
export async function checkEntitlement(
  schoolId: string,
  product: "tutoring" | "discipline" = "tutoring",
): Promise<Entitlement> {
  const res = await fetch("/api/school-entitlement", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ school_id: schoolId, product }),
  })
  if (!res.ok) throw new Error(`entitlement_failed_${res.status}`)
  return (await res.json()) as Entitlement
}

/** 9-12 SSO: resolve a covered student by their verified email. */
export async function resolveStudentSSO(schoolId: string, email: string): Promise<ResolvedStudent> {
  const res = await fetch("/api/school-resolve-student", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ school_id: schoolId, email }),
  })
  if (!res.ok) throw new Error(`resolve_failed_${res.status}`)
  return (await res.json()) as ResolvedStudent
}

/**
 * K-8 PIN: resolve a covered student, only ever inside an authenticated staff
 * session (staffSessionToken is a Dean-project access token). The `pin` argument
 * is used solely to build this request body — it is never stored or logged here.
 */
export async function resolveStudentPin(
  schoolId: string,
  pin: string,
  staffSessionToken: string,
): Promise<ResolvedStudent> {
  const res = await fetch("/api/school-resolve-student", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ school_id: schoolId, pin, staff_session_token: staffSessionToken }),
  })
  if (!res.ok) throw new Error(`resolve_failed_${res.status}`)
  return (await res.json()) as ResolvedStudent
}
