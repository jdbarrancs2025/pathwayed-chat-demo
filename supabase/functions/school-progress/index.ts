// school-progress — REVERSE bridge: the Dean console asks tutoring "what have my
// students done?" Deployed on the TUTORING project (papiowjjoyhnbyhgtbxq).
//
// This is the mirror of the Dean-side check-entitlement/resolve-student: a
// server-to-server call authed by a shared secret. It uses a SEPARATE secret
// (DEAN_BRIDGE_SECRET) from the tutoring->Dean direction (TUTORING_BRIDGE_SECRET).
//
// PRIVACY — the hard line:
//   * Returns data ONLY for students with school_covered = true AND a
//     dean_student_id in the supplied list. A B2C family's child NEVER has a
//     dean_student_id (only school-login/mint-session set it, alongside
//     school_covered = true), so they are structurally excluded.
//   * A dean_student_id with no covered row is silently omitted — no error, no
//     signal that it exists.
//   * Returns PROGRESS only. Never parent identity/email, billing, PINs, or chat
//     transcripts/message content (sessions.messages is never selected).
//
// deno-lint-ignore-file no-explicit-any
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
const DAY_MS = 24 * 60 * 60 * 1000
const RECHECK_DELAY_DAYS = 3
// Coarse per-subject engagement span, capped so a subject resumed across days
// can't inflate the number. True per-sitting timing is a follow-up.
const SESSION_MINUTES_CAP = 120

function json(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { "content-type": "application/json" },
  })
}

Deno.serve(async (req) => {
  if (req.method !== "POST") return json({ error: "method_not_allowed" }, 405)

  const secret = Deno.env.get("DEAN_BRIDGE_SECRET")
  if (!secret) return json({ error: "not_configured" }, 500)
  const provided = req.headers.get("x-bridge-secret")
  if (!provided || provided !== secret) return json({ error: "unauthorized" }, 401)

  let body: any
  try {
    body = await req.json()
  } catch {
    return json({ error: "invalid_json" }, 400)
  }

  const schoolId = body?.school_id
  const deanIds: unknown = body?.dean_student_ids
  if (typeof schoolId !== "string" || !UUID_RE.test(schoolId) || !Array.isArray(deanIds)) {
    return json({ error: "invalid_input" }, 400)
  }
  const requestedIds = [...new Set(deanIds.filter((x): x is string => typeof x === "string"))]

  // Optional reporting window for activity counts (last_active is always absolute).
  const fromMs = typeof body?.from === "string" ? Date.parse(body.from) : NaN
  const toMs = typeof body?.to === "string" ? Date.parse(body.to) : NaN
  const inWindow = (ts: string | null): boolean => {
    if (!ts) return false
    const t = Date.parse(ts)
    if (Number.isNaN(t)) return false
    if (!Number.isNaN(fromMs) && t < fromMs) return false
    if (!Number.isNaN(toMs) && t > toMs) return false
    return true
  }

  const supabase = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
  )

  // 1) HARD scope: covered students whose dean_student_id is in the list. Nothing
  //    about parents, billing, or PINs is even selected.
  const { data: studentRows, error: studentErr } = await supabase
    .from("students")
    .select("id, dean_student_id, first_name, grade")
    .eq("school_covered", true)
    .in("dean_student_id", requestedIds.length ? requestedIds : ["__none__"])
  if (studentErr) return json({ error: "query_failed" }, 500)

  const students = (studentRows ?? []).filter((s) => s.dean_student_id)
  const localIds = students.map((s) => s.id)
  const byLocalId = new Map(students.map((s) => [s.id, s]))

  // Nothing covered — honest empty result (still 200, no leak).
  if (localIds.length === 0) {
    return json({
      students: {},
      rollup: {
        students_active: 0,
        students_never_logged_in: requestedIds.length,
        total_minutes: 0,
        top_stuck_skills: [],
      },
    })
  }

  // 2) Pull the progress signals for those students (only non-sensitive columns).
  const [sessRes, attRes, masteryRes, focusRes] = await Promise.all([
    supabase.from("sessions").select("student_id, started_at, ended_at, updated_at").in("student_id", localIds),
    supabase
      .from("question_attempts")
      .select("student_id, is_correct, created_at")
      .in("student_id", localIds)
      .eq("is_diagnostic", false),
    supabase
      .from("student_skill_mastery")
      .select("student_id, skill_id, status, first_bar_met_at, recheck_passed_at")
      .in("student_id", localIds),
    supabase
      .from("student_focus_skills")
      .select("student_id, skill_id, created_at")
      .in("student_id", localIds)
      .is("resolved_at", null),
  ])

  // Resolve skill names for stuck / recheck skills.
  const skillIds = new Set<string>()
  for (const m of masteryRes.data ?? []) if (m.skill_id) skillIds.add(m.skill_id)
  for (const f of focusRes.data ?? []) if (f.skill_id) skillIds.add(f.skill_id)
  const skillName = new Map<string, string>()
  if (skillIds.size) {
    const { data: skillRows } = await supabase
      .from("skills")
      .select("id, name")
      .in("id", [...skillIds])
    for (const s of skillRows ?? []) skillName.set(s.id, s.name)
  }

  const now = Date.now()
  const nowIso = new Date(now).toISOString()

  // Per-student accumulators.
  type Acc = {
    last_active: string | null
    sessions_count: number
    total_minutes: number
    questions_attempted: number
    questions_correct: number
    mastery: { not_started: number; practicing: number; advanced: number; mastered: number }
    stuck_skills: { skill_id: string; name: string; unresolved_days: number }[]
    recheck_due: { skill_id: string; name: string }[]
  }
  const acc = new Map<string, Acc>()
  for (const id of localIds) {
    acc.set(id, {
      last_active: null,
      sessions_count: 0,
      total_minutes: 0,
      questions_attempted: 0,
      questions_correct: 0,
      mastery: { not_started: 0, practicing: 0, advanced: 0, mastered: 0 },
      stuck_skills: [],
      recheck_due: [],
    })
  }

  for (const s of sessRes.data ?? []) {
    const a = acc.get(s.student_id)
    if (!a) continue
    const endedAt = s.ended_at ?? s.updated_at
    if (endedAt && (!a.last_active || Date.parse(endedAt) > Date.parse(a.last_active))) {
      a.last_active = endedAt
    }
    if (inWindow(endedAt ?? s.updated_at)) {
      a.sessions_count += 1
      if (s.started_at && endedAt) {
        const span = (Date.parse(endedAt) - Date.parse(s.started_at)) / 60000
        if (span > 0) a.total_minutes += Math.min(span, SESSION_MINUTES_CAP)
      }
    }
  }

  for (const q of attRes.data ?? []) {
    const a = acc.get(q.student_id)
    if (!a) continue
    if (!inWindow(q.created_at)) continue
    a.questions_attempted += 1
    if (q.is_correct) a.questions_correct += 1
  }

  for (const m of masteryRes.data ?? []) {
    const a = acc.get(m.student_id)
    if (!a) continue
    const st = (m.status as keyof Acc["mastery"]) ?? "not_started"
    if (st in a.mastery) a.mastery[st] += 1
    // Re-check due: mastered bar met, re-check not passed, spacing window elapsed.
    if (m.first_bar_met_at && !m.recheck_passed_at) {
      const dueAt = Date.parse(m.first_bar_met_at) + RECHECK_DELAY_DAYS * DAY_MS
      if (!Number.isNaN(dueAt) && now >= dueAt) {
        a.recheck_due.push({ skill_id: m.skill_id, name: skillName.get(m.skill_id) ?? m.skill_id })
      }
    }
  }

  for (const f of focusRes.data ?? []) {
    const a = acc.get(f.student_id)
    if (!a) continue
    const days = f.created_at ? Math.floor((now - Date.parse(f.created_at)) / DAY_MS) : 0
    a.stuck_skills.push({
      skill_id: f.skill_id,
      name: skillName.get(f.skill_id) ?? f.skill_id,
      unresolved_days: Math.max(0, days),
    })
  }

  // 3) Assemble output keyed by dean_student_id, plus the school rollup.
  const perStudent: Record<string, unknown> = {}
  let studentsActive = 0
  let rollupMinutes = 0
  const stuckTally = new Map<string, { name: string; students_stuck: number }>()

  for (const id of localIds) {
    const s = byLocalId.get(id)!
    const a = acc.get(id)!
    const active = a.sessions_count > 0 || a.questions_attempted > 0 || a.last_active !== null
    if (active) studentsActive += 1
    rollupMinutes += a.total_minutes

    // One student per dean_student_id counts once per stuck skill.
    for (const st of a.stuck_skills) {
      const cur = stuckTally.get(st.skill_id) ?? { name: st.name, students_stuck: 0 }
      cur.students_stuck += 1
      stuckTally.set(st.skill_id, cur)
    }

    perStudent[s.dean_student_id as string] = {
      first_name: s.first_name,
      grade: s.grade,
      last_active: a.last_active,
      sessions_count: a.sessions_count,
      total_minutes: Math.round(a.total_minutes),
      questions_attempted: a.questions_attempted,
      questions_correct: a.questions_correct,
      mastery: a.mastery,
      stuck_skills: a.stuck_skills,
      recheck_due: a.recheck_due,
    }
  }

  const topStuck = [...stuckTally.entries()]
    .map(([skill_id, v]) => ({ skill_id, name: v.name, students_stuck: v.students_stuck }))
    .sort((x, y) => y.students_stuck - x.students_stuck)

  return json({
    generated_at: nowIso,
    students: perStudent,
    rollup: {
      students_active: studentsActive,
      // Requested ids we have NO covered progress row for = never started tutoring.
      students_never_logged_in: requestedIds.length - localIds.length,
      total_minutes: Math.round(rollupMinutes),
      top_stuck_skills: topStuck,
    },
  })
})
