import type { VercelRequest, VercelResponse } from "@vercel/node"
import { createClient, type SupabaseClient } from "@supabase/supabase-js"

/**
 * Server-side authentication for api/ endpoints.
 *
 * ONE MECHANISM COVERS ALL THREE IDENTITY PATHS, because they all converge on a
 * normal Supabase session:
 *
 *   B2C parent      — ordinary email/password sign-in.
 *   School SSO 9-12 — ordinary SSO sign-in; api/school-login.ts only ADDS coverage
 *                     to an already-authenticated user, it does not replace the auth.
 *   K-8 minted PIN  — api/mint-session.ts hand-signs an HS256 token with the project
 *                     SUPABASE_JWT_SECRET, carrying sub/role/aud/iss exactly as GoTrue
 *                     does, for a real auth user created via admin.createUser. The
 *                     client adopts it with supabase.auth.setSession (SchoolStation),
 *                     so it IS the session from then on.
 *
 * So getUser() validates all three. There is no separate code path to maintain and
 * no way for one of them to silently stop working: if a minted token stopped
 * validating, PIN login would already be broken everywhere else too.
 *
 * OWNERSHIP. students.parent_id is the auth uid in every path, including minted K-8
 * identities (mint-session sets parent_id to the minted uid), so a single
 * parent_id = uid check authorizes all three.
 */

export interface AuthedCaller {
  userId: string
  /** Service-role client, already constructed. Reuse it rather than making another. */
  svc: SupabaseClient
}

/** Pull a bearer token from the Authorization header, or "" when absent. */
export function bearerToken(req: VercelRequest): string {
  const h = req.headers.authorization
  if (typeof h !== "string") return ""
  return h.toLowerCase().startsWith("bearer ") ? h.slice(7).trim() : ""
}

/**
 * Require an authenticated caller. On failure this SENDS the response (401/500)
 * and returns null, so a handler can simply `if (!auth) return`.
 *
 * Error codes are distinct on purpose so a production failure is diagnosable from
 * the client without leaking anything: missing_token (no header) vs invalid_token
 * (rejected by GoTrue) vs not_configured (server env missing).
 */
export async function requireUser(
  req: VercelRequest,
  res: VercelResponse,
): Promise<AuthedCaller | null> {
  const supabaseUrl = process.env.SUPABASE_URL ?? process.env.VITE_SUPABASE_URL
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!supabaseUrl || !serviceKey) {
    res.status(500).json({ error: "not_configured" })
    return null
  }

  const token = bearerToken(req)
  if (!token) {
    res.status(401).json({ error: "missing_token" })
    return null
  }

  const svc = createClient(supabaseUrl, serviceKey)
  const { data, error } = await svc.auth.getUser(token)
  const userId = data?.user?.id
  if (error || !userId) {
    res.status(401).json({ error: "invalid_token" })
    return null
  }
  return { userId, svc }
}

/**
 * Does this authenticated user own this student? Uses the service-role client
 * deliberately: RLS would also answer this, but reading it explicitly means the
 * check is visible in the handler rather than implied by a policy, and it returns
 * the same answer for a covered K-8 student as for a B2C child.
 *
 * Fails CLOSED: a read error returns false.
 */
export async function ownsStudent(
  svc: SupabaseClient,
  userId: string,
  studentId: string,
): Promise<boolean> {
  if (!studentId) return false
  const { data, error } = await svc
    .from("students")
    .select("id")
    .eq("id", studentId)
    .eq("parent_id", userId)
    .maybeSingle()
  if (error) {
    console.error("ownsStudent check failed", { error, userId, studentId })
    return false
  }
  return !!data
}

/**
 * Require that the caller owns the student named in the request. Sends 400/403 and
 * returns false when it does not hold.
 */
export async function requireOwnedStudent(
  res: VercelResponse,
  auth: AuthedCaller,
  studentId: unknown,
): Promise<boolean> {
  if (typeof studentId !== "string" || !studentId) {
    res.status(400).json({ error: "student_id_required" })
    return false
  }
  if (!(await ownsStudent(auth.svc, auth.userId, studentId))) {
    // Deliberately not 404: the caller is authenticated, they simply may not act
    // on this child. Never reveal whether the id exists.
    res.status(403).json({ error: "not_your_student" })
    return false
  }
  return true
}
