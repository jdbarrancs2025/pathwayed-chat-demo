import type { VercelRequest, VercelResponse } from "@vercel/node"
import { deanPost, TtlCache, type EntitlementResponse } from "./school-bridge.js"

// Entitlement changes ~once a year → cache 24h per school+product. During a Dean
// outage we serve the last-known value (any age) so covered schools keep working.
const DAY_MS = 24 * 60 * 60 * 1000
const cache = new TtlCache<EntitlementResponse>(DAY_MS)

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

/**
 * POST { school_id: uuid, product?: "tutoring" | "discipline" }
 *   200 -> { entitled, seat_cap }
 *   400 -> { error: "invalid_input" }
 *   502 -> { error: "bridge_unauthorized" }  (our secret is wrong/missing)
 *   503 -> { error: "entitlement_unavailable" } (Dean down and no cache)
 */
export default async function handler(req: VercelRequest, res: VercelResponse) {
  if (req.method !== "POST") return res.status(405).json({ error: "method_not_allowed" })
  try {
    const { school_id, product = "tutoring" } = (req.body ?? {}) as {
      school_id?: string
      product?: string
    }
    if (typeof school_id !== "string" || !UUID_RE.test(school_id)) {
      return res.status(400).json({ error: "invalid_input" })
    }
    if (product !== "tutoring" && product !== "discipline") {
      return res.status(400).json({ error: "invalid_input" })
    }

    const key = `${school_id}:${product}`
    const fresh = cache.getFresh(key)
    if (fresh) return res.status(200).json(fresh)

    const r = await deanPost<EntitlementResponse>("check-entitlement", { school_id, product })
    if (r.ok) {
      cache.set(key, r.data)
      return res.status(200).json(r.data)
    }

    // Dean errored/unreachable — ride it out on the last-known entitlement (24h).
    const stale = cache.getStale(key)
    if (stale) {
      res.setHeader("x-entitlement-cache", "stale")
      return res.status(200).json(stale)
    }
    if (r.status === 401) return res.status(502).json({ error: "bridge_unauthorized" })
    if (r.status === 400) return res.status(400).json({ error: "invalid_input" })
    return res.status(503).json({ error: "entitlement_unavailable" })
  } catch (error) {
    console.error("school-entitlement error:", error)
    return res.status(500).json({ error: "server_error" })
  }
}
