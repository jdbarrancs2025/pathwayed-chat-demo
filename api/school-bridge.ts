// Server-only bridge to the Dean project's Edge Functions (school entitlement +
// student resolution). The shared secret is read from process.env here and NEVER
// leaves the server — this module is imported only by other api/* serverless
// handlers, never by client (src/) code, and nothing here is VITE_-prefixed.
// ALL calls to the Dean side funnel through deanPost().
//
// Strict rule: a student PIN may pass THROUGH this module (in the request body to
// Dean) but is never cached, logged, or returned. deanPost never logs bodies.

const DEAN_BASE =
  process.env.DEAN_FUNCTIONS_URL ?? "https://ckgyctshyrjcxlxzkabe.supabase.co/functions/v1"

export interface ResolveCovered {
  covered: true
  student_id: string
  first_name: string
  grade: string // authoritative content grade — a STRING, e.g. "10"
}
export type ResolveResponse = ResolveCovered | { covered: false }

export type DeanResult<T> =
  | { ok: true; status: number; data: T }
  // status 0 == network/timeout (Dean unreachable); otherwise Dean's HTTP status.
  | { ok: false; status: number; error: string }

/**
 * POST to a Dean Edge Function with the server-only bridge secret. Returns a
 * discriminated result — never throws for HTTP/network errors so callers can
 * fall back to cache. Never logs the body (which may contain a PIN) or the secret.
 */
export async function deanPost<T>(
  fn: "resolve-student",
  body: unknown,
): Promise<DeanResult<T>> {
  const secret = process.env.TUTORING_BRIDGE_SECRET
  if (!secret) return { ok: false, status: 500, error: "bridge_not_configured" }

  let res: Response
  try {
    res = await fetch(`${DEAN_BASE}/${fn}`, {
      method: "POST",
      headers: { "Content-Type": "application/json", "x-bridge-secret": secret },
      body: JSON.stringify(body),
    })
  } catch {
    return { ok: false, status: 0, error: "dean_unreachable" }
  }

  let json: unknown = null
  try {
    json = await res.json()
  } catch {
    /* non-JSON response */
  }
  if (res.ok) return { ok: true, status: res.status, data: json as T }
  const error = (json as { error?: string } | null)?.error ?? "dean_error"
  return { ok: false, status: res.status, error }
}
