// Mastery-snapshot recorder (manually/weekly triggered — NO cron schedule here).
//
// Captures a per-child point-in-time copy of the engine's OWN outputs — readiness
// (readiness_scores: overall pathway score + per-subject readiness) and per-skill
// mastery (student_skill_mastery) — into mastery_snapshots (migration 0020), so
// growth-over-time can be charted later against REAL history. It writes NO new
// scoring logic: it reads what the engine already computed/persisted (the same rows
// the parent dashboard reads) and stores a copy.
//
// Idempotent per day via the (student_id, captured_date) unique index: a re-run
// skips children already snapshotted today. Graceful: a per-child failure is logged
// and skipped, never failing the whole run.
//
// Guarded by CRON_SECRET exactly like api/admissions-season-email.ts. There is
// deliberately NO cron entry in vercel.json — the weekly schedule is added by hand
// after verification. GET and POST both work.

import { createClient, type SupabaseClient } from "@supabase/supabase-js"
import type { VercelRequest, VercelResponse } from "@vercel/node"
import { requireCronSecret } from "./require-auth.js"

const SUPABASE_URL = process.env.SUPABASE_URL ?? process.env.VITE_SUPABASE_URL
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY

// Supabase caps an un-ranged select at 1000 rows, so every read paginates — a
// bigger population must never be silently truncated (that would drop children from
// the history we can never recover).
const PAGE = 1000

interface ReadinessRow {
  student_id: string
  readiness_type: string
  score: number | string
  strengths: unknown
  gaps: unknown
  next_skill_slug: string | null
  recommendations: unknown
  updated_at: string
}

interface MasteryRow {
  student_id: string
  skill_id: string
  mastery_percentage: number | string
  accuracy: number | string
  status: string | null
  evidence_accuracy: number | string | null
  attempts: number
  attempts_counted: number | null
  last_practiced: string | null
  updated_at: string
}

/** Page through an entire table (service role) via .range(), returning all rows. */
async function fetchAll<T>(
  supabase: SupabaseClient,
  table: string,
  columns: string,
): Promise<{ rows: T[]; error?: string }> {
  const out: T[] = []
  for (let from = 0; ; from += PAGE) {
    const { data, error } = await supabase
      .from(table)
      .select(columns)
      .range(from, from + PAGE - 1)
    if (error) return { rows: out, error: error.message }
    const batch = (data ?? []) as unknown as T[]
    out.push(...batch)
    if (batch.length < PAGE) break
  }
  return { rows: out }
}

/** Group rows by student_id (drops the redundant key from each stored row). */
function groupByStudent<T extends { student_id: string }>(rows: T[]): Map<string, Omit<T, "student_id">[]> {
  const map = new Map<string, Omit<T, "student_id">[]>()
  for (const r of rows) {
    const { student_id, ...rest } = r
    const list = map.get(student_id)
    if (list) list.push(rest)
    else map.set(student_id, [rest])
  }
  return map
}

export default async function handler(req: VercelRequest, res: VercelResponse) {
  if (req.method !== "GET" && req.method !== "POST") {
    return res.status(405).json({ error: "Method not allowed" })
  }
  // Requires CRON_SECRET as a bearer token. Fails CLOSED: an unset secret returns
  // 503 rather than running this unauthenticated (see requireCronSecret).
  if (!requireCronSecret(req, res)) return
  if (!SUPABASE_URL || !SERVICE_ROLE_KEY) {
    return res.status(500).json({ error: "Server is missing Supabase configuration." })
  }

  // Dry run: ?dryRun=1 (or {"dryRun":true}) reports how many children WOULD be
  // snapshotted and writes nothing.
  const dryRun =
    req.query?.dryRun === "1" ||
    req.query?.dryRun === "true" ||
    (typeof req.body === "object" && req.body !== null && (req.body as { dryRun?: unknown }).dryRun === true)

  const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY)
  const now = new Date()
  const nowIso = now.toISOString()
  const capturedDate = nowIso.slice(0, 10) // run's UTC date — the per-day idempotency key

  // Read the engine's existing outputs (no recompute): readiness + per-skill mastery.
  const readinessRes = await fetchAll<ReadinessRow>(
    supabase,
    "readiness_scores",
    "student_id, readiness_type, score, strengths, gaps, next_skill_slug, recommendations, updated_at",
  )
  const masteryRes = await fetchAll<MasteryRow>(
    supabase,
    "student_skill_mastery",
    "student_id, skill_id, mastery_percentage, accuracy, status, evidence_accuracy, attempts, attempts_counted, last_practiced, updated_at",
  )
  if (readinessRes.error || masteryRes.error) {
    const message = readinessRes.error ?? masteryRes.error ?? "read failed"
    console.error("[snapshot-mastery] engine read failed:", message)
    return res.status(502).json({ error: "Could not read engine outputs", message })
  }

  const readinessByStudent = groupByStudent(readinessRes.rows)
  const masteryByStudent = groupByStudent(masteryRes.rows)

  // The population to snapshot: every student across all accounts that has ANY
  // engine signal (a readiness row or a mastery row). Students with no signal have
  // no history to record yet, so they are skipped rather than writing empty rows.
  const candidateIds = new Set<string>([...readinessByStudent.keys(), ...masteryByStudent.keys()])

  // Skip children already snapshotted today (the unique index is the hard backstop;
  // this makes the skip clean and lets dry-run report an accurate remaining count).
  // Filter by today's captured_date so we don't page the whole history table.
  const { data: todaysRows, error: todaysErr } = await supabase
    .from("mastery_snapshots")
    .select("student_id")
    .eq("captured_date", capturedDate)
  if (todaysErr) {
    console.error("[snapshot-mastery] could not read today's snapshots:", todaysErr.message)
    return res.status(502).json({ error: "Could not read existing snapshots", message: todaysErr.message })
  }
  const snapshottedToday = new Set((todaysRows ?? []).map((r) => r.student_id as string))

  const toSnapshot = [...candidateIds].filter((id) => !snapshottedToday.has(id))

  if (dryRun) {
    return res.status(200).json({
      dry_run: true,
      captured_date: capturedDate,
      candidates: candidateIds.size,
      already_snapshotted_today: snapshottedToday.size,
      would_snapshot: toSnapshot.length,
      message: `Dry run — ${toSnapshot.length} child(ren) would be snapshotted for ${capturedDate}. Nothing written.`,
    })
  }

  let inserted = 0
  let skipped = 0
  let failed = 0
  for (const studentId of toSnapshot) {
    try {
      const payload = {
        captured_date: capturedDate,
        // A copy of the engine's own outputs — no new scoring. Shapes match the
        // readiness_scores / student_skill_mastery tables the dashboard reads.
        readiness: readinessByStudent.get(studentId) ?? [],
        mastery: masteryByStudent.get(studentId) ?? [],
      }
      const { error } = await supabase.from("mastery_snapshots").insert({
        student_id: studentId,
        captured_at: nowIso,
        captured_date: capturedDate,
        payload,
      })
      if (error) {
        // A duplicate (race with an overlapping run) is a benign skip, not a failure.
        if (error.code === "23505") {
          skipped++
        } else {
          failed++
          console.error(`[snapshot-mastery] insert failed for ${studentId}:`, error.message)
        }
        continue
      }
      inserted++
    } catch (err) {
      failed++
      console.error(`[snapshot-mastery] snapshot failed for ${studentId}:`, err instanceof Error ? err.message : err)
    }
  }

  return res.status(200).json({
    captured_date: capturedDate,
    candidates: candidateIds.size,
    already_snapshotted_today: snapshottedToday.size,
    inserted,
    skipped,
    failed,
  })
}
