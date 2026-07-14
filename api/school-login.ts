import type { VercelRequest, VercelResponse } from "@vercel/node"
import { createClient } from "@supabase/supabase-js"
import { deanPost, type ResolveResponse } from "./school-bridge.js"

// Post-SSO school check for a 9-12 covered student. The client sends only its
// OWN Supabase access token; the server derives the trusted email + uid from it,
// maps the email domain -> Dean school_id (server env — the client never supplies
// school_id), asks Dean whether the email is a covered tutoring student, and on
// success lookup-or-creates ONE real students row keyed to the Dean student id.
//
// school_covered is set HERE, only after a verified Dean resolve — never by the
// client — because it drives the Stripe bypass. The row is owned by the student's
// own auth uid so it flows through the normal owns_student() RLS unchanged.

/** Maps a verified SSO email domain -> Dean school_id. JSON in SCHOOL_DOMAIN_MAP. */
function schoolIdForDomain(domain: string): string | null {
  const raw = process.env.SCHOOL_DOMAIN_MAP
  if (!raw) return null
  try {
    const map = JSON.parse(raw) as Record<string, string>
    return map[domain.toLowerCase()] ?? null
  } catch {
    return null
  }
}

export default async function handler(req: VercelRequest, res: VercelResponse) {
  if (req.method !== "POST") return res.status(405).json({ error: "method_not_allowed" })

  const supabaseUrl = process.env.SUPABASE_URL ?? process.env.VITE_SUPABASE_URL
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!supabaseUrl || !serviceKey) return res.status(500).json({ error: "not_configured" })

  try {
    // The student's OWN access token may arrive in the JSON body (how the app
    // sends it) OR as an Authorization: Bearer header (how a manual/other caller
    // may send it). Accept either so a header-style caller isn't rejected before
    // anything runs. Distinct error codes make the failure mode observable:
    // missing_token = no token supplied; invalid_token = getUser rejected it.
    const bodyToken = (req.body ?? {}) as { access_token?: unknown }
    const authHeader = req.headers.authorization
    const headerToken =
      typeof authHeader === "string" && authHeader.toLowerCase().startsWith("bearer ")
        ? authHeader.slice(7).trim()
        : ""
    const access_token =
      (typeof bodyToken.access_token === "string" && bodyToken.access_token) || headerToken
    if (!access_token) {
      return res.status(401).json({ error: "missing_token" })
    }

    const svc = createClient(supabaseUrl, serviceKey)

    // Trust only what the student's own verified session says.
    const { data: userData, error: userErr } = await svc.auth.getUser(access_token)
    const email = userData?.user?.email?.trim().toLowerCase()
    const uid = userData?.user?.id
    if (userErr || !email || !uid) return res.status(401).json({ error: "invalid_token" })

    const domain = email.split("@")[1] ?? ""
    const schoolId = schoolIdForDomain(domain)
    // Unknown domain -> not a school student; client falls through to consumer path.
    if (!schoolId) return res.status(200).json({ covered: false })

    const r = await deanPost<ResolveResponse>("resolve-student", {
      school_id: schoolId,
      product: "tutoring",
      email,
    })
    if (!r.ok || !r.data.covered) return res.status(200).json({ covered: false })
    const dean = r.data

    // Lookup-or-create the local row keyed by the stable Dean student id.
    const existing = await svc
      .from("students")
      .select("id")
      .eq("dean_student_id", dean.student_id)
      .maybeSingle()

    let localId = existing.data?.id ?? null
    if (localId) {
      // Keep it owned by the current session and refresh authoritative fields.
      await svc
        .from("students")
        .update({
          parent_id: uid,
          first_name: dean.first_name,
          grade: dean.grade,
          school_covered: true,
        })
        .eq("id", localId)
    } else {
      const ins = await svc
        .from("students")
        .insert({
          parent_id: uid,
          first_name: dean.first_name,
          grade: dean.grade,
          level: "on",
          dean_student_id: dean.student_id,
          school_covered: true,
          above_grade_ok: false, // a school does not consent on a parent's behalf
        })
        .select("id")
        .single()
      if (ins.error) {
        console.error("school-login insert error:", ins.error.message)
        return res.status(500).json({ error: "server_error" })
      }
      localId = ins.data.id
    }

    return res.status(200).json({
      covered: true,
      student_id: localId,
      first_name: dean.first_name,
      grade: dean.grade,
      school_id: schoolId,
    })
  } catch (error) {
    console.error("school-login error:", error)
    return res.status(500).json({ error: "server_error" })
  }
}
