import type { VercelRequest, VercelResponse } from "@vercel/node"
import { deanPost, TtlCache, type ResolveResponse, type ResolveCovered } from "./school-bridge.js"

// Positive per-student vouch cache for SSO returning-login during a brief Dean
// outage. Keyed by school + verified email (email is not a secret). Stores the
// RESULT only (covered + grade). We deliberately cache only covered:true, so a
// newly-provisioned student is never wrongly denied for a day.
//
// PIN mode is NOT cached at all: the only pre-resolve identifier is the PIN, and
// the PIN must never be persisted/derived-from — so a returning K-8 PIN student
// cannot be served from cache during an outage (a Dean outage blocks only brand-
// new/uncached logins, which is the intended failure envelope).
const DAY_MS = 24 * 60 * 60 * 1000
const ssoVouchCache = new TtlCache<ResolveCovered>(DAY_MS)

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

/**
 * POST — two modes, discriminated by presence of `pin`:
 *   SSO (9-12): { school_id, product?, email }
 *   PIN (K-8):  { school_id, product?, pin, staff_session_token }
 *
 *   200 -> { covered: true, student_id, first_name, grade } | { covered: false }
 *   400 -> { error: "invalid_input" }
 *   401 -> { error: "staff_session_required" | "staff_session_invalid" | "unauthorized" }
 *   429 -> { error: "rate_limited" }
 *   503 -> { error: "resolve_unavailable" } (Dean down, no cache)
 *
 * The PIN is forwarded to Dean and is NEVER cached, logged, or returned. The
 * catch handler logs only the error, never req.body (which may contain the PIN).
 */
export default async function handler(req: VercelRequest, res: VercelResponse) {
  if (req.method !== "POST") return res.status(405).json({ error: "method_not_allowed" })
  try {
    const body = (req.body ?? {}) as {
      school_id?: string
      product?: string
      email?: string
      pin?: string
      staff_session_token?: string
    }
    const product = body.product === "discipline" ? "discipline" : "tutoring"
    if (typeof body.school_id !== "string" || !UUID_RE.test(body.school_id)) {
      return res.status(400).json({ error: "invalid_input" })
    }

    // PIN mode (K-8) — staff must have authenticated FIRST. Enforce it here too:
    // never call Dean for a PIN without a staff session token.
    if (typeof body.pin === "string" && body.pin.length > 0) {
      if (!body.staff_session_token || typeof body.staff_session_token !== "string") {
        return res.status(401).json({ error: "staff_session_required" })
      }
      const r = await deanPost<ResolveResponse>("resolve-student", {
        school_id: body.school_id,
        product,
        pin: body.pin,
        staff_session_token: body.staff_session_token,
      })
      if (!r.ok) {
        // No PIN-derived caching, ever — pass Dean's signal through.
        return res
          .status(r.status === 0 ? 503 : r.status)
          .json({ error: r.status === 0 ? "resolve_unavailable" : r.error })
      }
      return res.status(200).json(r.data)
    }

    // SSO mode (9-12) — resolve by the student's verified email.
    const email = typeof body.email === "string" ? body.email.trim().toLowerCase() : ""
    if (!email) return res.status(400).json({ error: "invalid_input" })
    const key = `${body.school_id}:${email}`

    const r = await deanPost<ResolveResponse>("resolve-student", {
      school_id: body.school_id,
      product,
      email,
    })
    if (r.ok) {
      if (r.data.covered) ssoVouchCache.set(key, r.data) // cache positive vouch only
      return res.status(200).json(r.data)
    }

    // Dean unreachable — let a returning covered student in from the vouch cache.
    const stale = ssoVouchCache.getStale(key)
    if (stale) {
      res.setHeader("x-resolve-cache", "stale")
      return res.status(200).json(stale)
    }
    return res
      .status(r.status === 0 ? 503 : r.status)
      .json({ error: r.status === 0 ? "resolve_unavailable" : r.error })
  } catch (error) {
    // Never log req.body here — it may contain the PIN.
    console.error("school-resolve-student error:", error)
    return res.status(500).json({ error: "server_error" })
  }
}
