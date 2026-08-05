import { supabase } from '@/lib/supabase'
import { resolveSkillIdsBySlug } from '@/lib/skills'
import { pickNextSkill, type SkillEvidence } from '@/lib/pickNextSkill'
import type { Json } from '@/lib/database.types'

/**
 * Question Engine, Stage 3 — serve + score. Read-only access to PUBLISHED
 * generated_questions (RLS allows authenticated SELECT on status='published')
 * plus an append-only question_attempts writer (RLS owns_student). The pure
 * scoring/aggregation helpers are unit-tested; the DB calls are best-effort.
 */

/** A K–2 pre-reader answer tile: a big numeral, or a group of N picture icons
 *  (rendered by the picture UI instead of a text label). */
export interface PictureTile {
  kind: 'number' | 'letter' | 'object_group'
  value?: string // number & letter tiles
  image?: string // object_group tiles (a curated KidIcon key)
  count?: number // object_group tiles
}

/** The optional visual prompt for an audio-picture item (the group to count). */
export interface PicturePrompt {
  kind: 'object_group'
  image: string
  count: number
}

export interface PracticeChoice {
  text: string
  is_correct: boolean
  misconception_token?: string
  /** Present only on audio-picture (K–2) items; the child taps this tile. */
  tile?: PictureTile
}

export interface PracticeQuestion {
  id: string
  skill_id: string
  sat_alignment: string | null
  stem: string
  // The reading passage this question is asked about, or null for standalone
  // (math/writing) stems. Rendered above the stem by the practice/diagnostic UI.
  passage: string | null
  choices: PracticeChoice[]
  correct_answer: string
  solution: string | null
  // 'text' (default) or 'audio_picture' (K–2 pre-reader: spoken prompt + tiles).
  render_mode: string
  // Visual prompt for audio-picture items (e.g. a group of objects to count).
  prompt: PicturePrompt | null
}

// --- Pure scoring / aggregation (unit-tested) --------------------------------

/** Score a tapped choice: is it correct, and (if wrong) which misconception. */
export function scoreChoice(
  choices: PracticeChoice[],
  index: number,
): { isCorrect: boolean; misconceptionToken: string | null } {
  const c = choices[index]
  if (!c) return { isCorrect: false, misconceptionToken: null }
  return { isCorrect: c.is_correct === true, misconceptionToken: c.misconception_token ?? null }
}

/** Aggregate a session's answers into total / correct / accuracy (0-100). */
export function summarizeAttempts(results: { isCorrect: boolean }[]): {
  total: number
  correct: number
  accuracy: number
} {
  const total = results.length
  const correct = results.filter((r) => r.isCorrect).length
  const accuracy = total === 0 ? 0 : Math.round((100 * correct) / total)
  return { total, correct, accuracy }
}

// --- Read path: fetch published questions for a skill ------------------------

function parseTile(raw: unknown): PictureTile | undefined {
  if (!raw || typeof raw !== 'object' || Array.isArray(raw)) return undefined
  const t = raw as Record<string, unknown>
  if ((t.kind === 'number' || t.kind === 'letter') && typeof t.value === 'string') {
    return { kind: t.kind, value: t.value }
  }
  if (t.kind === 'object_group' && typeof t.image === 'string' && typeof t.count === 'number') {
    return { kind: 'object_group', image: t.image, count: t.count }
  }
  return undefined
}

function parsePrompt(raw: Json): PicturePrompt | null {
  if (!raw || typeof raw !== 'object' || Array.isArray(raw)) return null
  const p = raw as Record<string, unknown>
  if (p.kind === 'object_group' && typeof p.image === 'string' && typeof p.count === 'number') {
    return { kind: 'object_group', image: p.image, count: p.count }
  }
  return null
}

function parseChoices(raw: Json): PracticeChoice[] {
  if (!Array.isArray(raw)) return []
  const out: PracticeChoice[] = []
  for (const c of raw) {
    if (!c || typeof c !== 'object' || Array.isArray(c)) continue
    const obj = c as Record<string, unknown>
    if (typeof obj.text !== 'string' || typeof obj.is_correct !== 'boolean') continue
    const tile = parseTile(obj.tile)
    out.push({
      text: obj.text,
      is_correct: obj.is_correct,
      ...(typeof obj.misconception_token === 'string' ? { misconception_token: obj.misconception_token } : {}),
      ...(tile ? { tile } : {}),
    })
  }
  return out
}

function shuffle<T>(arr: T[]): T[] {
  const a = [...arr]
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[a[i], a[j]] = [a[j], a[i]]
  }
  return a
}

/**
 * Fetch up to `limit` PUBLISHED questions for a skill (by slug), shuffled. The
 * full cache is tiny (~20/skill), so we fetch and pick client-side. Returns []
 * if the skill or questions can't be read (RLS/empty), never throws.
 */
export async function fetchPracticeQuestions(skillSlug: string, limit: number): Promise<PracticeQuestion[]> {
  const idBySlug = await resolveSkillIdsBySlug([skillSlug])
  const skillId = idBySlug.get(skillSlug)
  if (!skillId) return []

  const { data, error } = await supabase
    .from('generated_questions')
    .select('id, skill_id, sat_alignment, stem, choices, correct_answer, solution, passage_id, render_mode, prompt')
    .eq('skill_id', skillId)
    .eq('status', 'published')
  if (error) {
    console.error('fetchPracticeQuestions failed', error)
    return []
  }
  const rows = data ?? []

  // Resolve passages in one follow-up query (a reading set shares one passage
  // across several questions, so we fetch each distinct passage once). Best-effort:
  // a passage read failure just leaves the passage null — the question still serves.
  const passageIds = [...new Set(rows.map((r) => r.passage_id).filter((v): v is string => !!v))]
  const passageById = new Map<string, string>()
  if (passageIds.length) {
    const { data: pRows, error: pError } = await supabase
      .from('passages')
      .select('id, body')
      .in('id', passageIds)
      .eq('status', 'published')
    if (pError) console.error('fetchPracticeQuestions: passages read failed', pError)
    for (const p of pRows ?? []) passageById.set(p.id, p.body)
  }

  const parsed: PracticeQuestion[] = []
  for (const row of rows) {
    const choices = parseChoices(row.choices)
    if (choices.length < 2) continue // skip anything malformed
    parsed.push({
      id: row.id,
      skill_id: row.skill_id,
      sat_alignment: row.sat_alignment,
      stem: row.stem,
      passage: row.passage_id ? passageById.get(row.passage_id) ?? null : null,
      choices,
      correct_answer: row.correct_answer,
      solution: row.solution,
      render_mode: typeof row.render_mode === 'string' ? row.render_mode : 'text',
      prompt: parsePrompt(row.prompt),
    })
  }
  return shuffle(parsed).slice(0, limit)
}

/**
 * Fetch specific PUBLISHED questions by id, returned in the order of `ids`. Used to
 * load the frozen question set of a timed attempt so resume shows the same
 * questions in the same order. Returns [] on read failure; skips malformed rows.
 */
export async function fetchQuestionsByIds(ids: string[]): Promise<PracticeQuestion[]> {
  if (ids.length === 0) return []
  const { data, error } = await supabase
    .from('generated_questions')
    .select('id, skill_id, sat_alignment, stem, choices, correct_answer, solution, passage_id, render_mode, prompt')
    .in('id', ids)
    .eq('status', 'published')
  if (error) {
    console.error('fetchQuestionsByIds failed', error)
    return []
  }
  const rows = data ?? []

  const passageIds = [...new Set(rows.map((r) => r.passage_id).filter((v): v is string => !!v))]
  const passageById = new Map<string, string>()
  if (passageIds.length) {
    const { data: pRows, error: pError } = await supabase
      .from('passages')
      .select('id, body')
      .in('id', passageIds)
      .eq('status', 'published')
    if (pError) console.error('fetchQuestionsByIds: passages read failed', pError)
    for (const p of pRows ?? []) passageById.set(p.id, p.body)
  }

  const byId = new Map<string, PracticeQuestion>()
  for (const row of rows) {
    const choices = parseChoices(row.choices)
    if (choices.length < 2) continue
    byId.set(row.id, {
      id: row.id,
      skill_id: row.skill_id,
      sat_alignment: row.sat_alignment,
      stem: row.stem,
      passage: row.passage_id ? passageById.get(row.passage_id) ?? null : null,
      choices,
      correct_answer: row.correct_answer,
      solution: row.solution,
      render_mode: typeof row.render_mode === 'string' ? row.render_mode : 'text',
      prompt: parsePrompt(row.prompt),
    })
  }
  // Preserve the requested order (the frozen attempt order).
  return ids.map((id) => byId.get(id)).filter((q): q is PracticeQuestion => !!q)
}

// --- Read path: which skills are practiceable (have published questions) -----

export interface PracticeableSkill {
  skill_id: string
  slug: string
  name: string
  subject: string
  grade_band: string | null
  // True Common Core grade (re-level). Kept alongside grade_band; ccss_grade_num
  // ('K'=0 .. 12) is the orderable key used to sequence skills grade-appropriately.
  ccss_grade: string | null
  ccss_grade_num: number | null
}

// Display order for grouping the practice picker by subject (mirrors the
// dashboard's SUBJECT_DISPLAY_ORDER); unknown subjects sort last, then by name.
const PRACTICE_SUBJECT_ORDER = ['math', 'reading', 'writing', 'science']

/**
 * List the skills a student can actually practice right now: every skill with at
 * least one PUBLISHED question, joined to its skill metadata and sorted by
 * subject then name. Drives the dashboard practice picker — skills without
 * questions never appear. Best-effort: returns [] on any read error, never throws.
 */
export async function listPracticeableSkills(): Promise<PracticeableSkill[]> {
  // RLS already limits the client to status='published'; the filter is explicit
  // so the intent is clear and it still holds if policies change.
  const { data: qRows, error: qError } = await supabase
    .from('generated_questions')
    .select('skill_id')
    .eq('status', 'published')
  if (qError) {
    console.error('listPracticeableSkills: questions read failed', qError)
    return []
  }
  const skillIds = [...new Set((qRows ?? []).map((r) => r.skill_id).filter(Boolean))]
  if (!skillIds.length) return []

  const { data: skillRows, error: sError } = await supabase
    .from('skills')
    .select('id, slug, name, subject, grade_band, ccss_grade, ccss_grade_num')
    .in('id', skillIds)
  if (sError) {
    console.error('listPracticeableSkills: skills read failed', sError)
    return []
  }

  const skills: PracticeableSkill[] = []
  for (const s of skillRows ?? []) {
    if (!s.slug || !s.name) continue // need a slug to route practice to
    // Prep-only skills (subject 'prep-*') are isolated from the K-12 practice
    // picker + diagnostic; the prep engine reaches them by slug directly.
    if (typeof s.subject === 'string' && s.subject.startsWith('prep-')) continue
    skills.push({
      skill_id: s.id,
      slug: s.slug,
      name: s.name,
      subject: s.subject,
      grade_band: s.grade_band,
      ccss_grade: s.ccss_grade,
      ccss_grade_num: s.ccss_grade_num,
    })
  }

  const orderOf = (subject: string) => {
    const i = PRACTICE_SUBJECT_ORDER.indexOf(subject)
    return i === -1 ? PRACTICE_SUBJECT_ORDER.length : i
  }
  // Order by subject, then TRUE Common Core grade (ccss_grade_num), then name.
  // Skills without a ccss grade sort last within a subject, so anything untagged
  // falls back to the prior name ordering rather than jumping to the front.
  const gradeKey = (n: number | null) => (n == null ? Number.POSITIVE_INFINITY : n)
  return skills.sort(
    (a, b) =>
      orderOf(a.subject) - orderOf(b.subject) ||
      gradeKey(a.ccss_grade_num) - gradeKey(b.ccss_grade_num) ||
      a.name.localeCompare(b.name),
  )
}

/**
 * Read this student's evidence-driven mastery, keyed by skill. These are the
 * signals the DB computes from real graded attempts (migration 0010), NOT the
 * legacy self-rating ramp. Best-effort: an empty map on read failure just means
 * every skill looks untouched.
 */
export async function fetchSkillEvidence(studentId: string): Promise<Map<string, SkillEvidence>> {
  const { data, error } = await supabase
    .from('student_skill_mastery')
    .select('skill_id, status, evidence_accuracy, attempts_counted')
    .eq('student_id', studentId)
  if (error) console.error('fetchSkillEvidence read failed', error)
  const byId = new Map<string, SkillEvidence>()
  for (const m of data ?? []) {
    byId.set(m.skill_id, {
      status: (m.status as SkillEvidence['status']) ?? 'not_started',
      evidence_accuracy: m.evidence_accuracy == null ? null : Number(m.evidence_accuracy),
      attempts_counted: m.attempts_counted ?? 0,
    })
  }
  return byId
}

/**
 * The next skill to "keep going" on: the student's weakest PRACTICEABLE skill
 * that they have NOT already cleared the ADVANCE bar on. Ranking lives in
 * pickNextSkill.ts (pure, unit-tested) and reads evidence — status,
 * evidence_accuracy, attempts_counted — not mastery_percentage.
 *
 * Returns null when every practiceable skill is already 'advanced' or 'mastered'.
 * That is deliberate: re-serving a cleared skill is the exact loop this replaces.
 * Best-effort.
 */
export async function nextPracticeSkill(studentId: string): Promise<PracticeableSkill | null> {
  const practiceable = await listPracticeableSkills()
  if (!practiceable.length) return null
  const evidence = await fetchSkillEvidence(studentId)
  return pickNextSkill(practiceable, evidence)
}

// --- Read path: placement diagnostic set -------------------------------------

/** A diagnostic item carries its skill's grade_band (used today for band scoring)
 *  and its true Common Core grade (available for grade-accurate placement). */
export interface DiagnosticQuestion extends PracticeQuestion {
  grade_band: string | null
  ccss_grade: string | null
  ccss_grade_num: number | null
}

/**
 * Placement diagnostic set (Phase 2): one PUBLISHED question from each of the
 * given skills, each tagged with its grade_band, shuffled into a mixed order.
 * Reuses the normal per-skill serve path, so diagnostic items are exactly the
 * questions a student would practice. Returns [] for an empty skill list.
 */
export async function fetchDiagnosticQuestions(skills: PracticeableSkill[]): Promise<DiagnosticQuestion[]> {
  if (!skills.length) return []
  const sets = await Promise.all(
    skills.map(async (s) => {
      const qs = await fetchPracticeQuestions(s.slug, 1)
      return qs.map((q) => ({
        ...q,
        grade_band: s.grade_band,
        ccss_grade: s.ccss_grade,
        ccss_grade_num: s.ccss_grade_num,
      }))
    }),
  )
  return shuffle(sets.flat())
}

/**
 * K-2 initial-placement set: a SHORT (~`target`) audio-picture set drawn ONLY
 * from the given early-grade skills (counting, letter-sounds) — several questions
 * per skill, shuffled and capped. Reuses the normal per-skill serve path, so items
 * carry render_mode='audio_picture' + prompt exactly like a lesson. Returns [] if
 * no early-grade skills are published. Used to keep the youngest placement short,
 * grade-appropriate, and never pulling higher-grade text.
 */
export async function fetchEarlyGradeDiagnostic(
  skills: PracticeableSkill[],
  target: number,
): Promise<DiagnosticQuestion[]> {
  if (!skills.length) return []
  // A few questions from EVERY early skill so placement always reads BOTH early
  // math (counting) AND early literacy (phonics) — balanced and bounded short
  // (2-4 per skill), never relying on a cap that could drop a whole skill.
  const perSkill = Math.min(4, Math.max(2, Math.floor(target / skills.length)))
  const sets = await Promise.all(
    skills.map(async (s) => {
      const qs = await fetchPracticeQuestions(s.slug, perSkill)
      return qs.map((q) => ({
        ...q,
        grade_band: s.grade_band,
        ccss_grade: s.ccss_grade,
        ccss_grade_num: s.ccss_grade_num,
      }))
    }),
  )
  // Round-robin across skills so counting and phonics alternate (gentle variety),
  // and BOTH are always represented — no skill is dropped by a length cap.
  const maxLen = Math.max(...sets.map((s) => s.length))
  const out: DiagnosticQuestion[] = []
  for (let i = 0; i < maxLen; i++) {
    for (const set of sets) if (set[i]) out.push(set[i])
  }
  return out
}

// --- Write path: append-only question_attempts -------------------------------

export interface QuestionAttemptInput {
  studentId: string
  generatedQuestionId: string
  skillId: string
  satAlignment: string | null
  isCorrect: boolean
  chosenChoiceIndex: number | null
  chosenMisconceptionToken: string | null
  /** Epoch ms when the question was shown; time_ms is computed here (null skips). */
  shownAtMs: number | null
  /** True when recorded by the placement diagnostic (kept out of practice history). */
  isDiagnostic?: boolean
}

/**
 * Record one answered question (append-only). Best-effort and fire-and-forget:
 * callers `void` this so a mid-session quit still persists what was answered, and
 * a failure never blocks the kid's flow. RLS (owns_student) scopes the insert to
 * the signed-in parent's own child.
 */
export async function recordQuestionAttempt(a: QuestionAttemptInput): Promise<void> {
  const timeMs = a.shownAtMs == null ? null : Math.max(0, Date.now() - a.shownAtMs)
  const payload = {
    student_id: a.studentId,
    generated_question_id: a.generatedQuestionId,
    skill_id: a.skillId,
    sat_alignment: a.satAlignment,
    is_correct: a.isCorrect,
    chosen_choice_index: a.chosenChoiceIndex,
    chosen_misconception_token: a.chosenMisconceptionToken,
    time_ms: timeMs,
    is_diagnostic: a.isDiagnostic ?? false,
  }
  // Surface BOTH a returned error (e.g. RLS) and a thrown rejection — the
  // fire-and-forget caller would otherwise swallow either silently.
  try {
    const { error } = await supabase.from('question_attempts').insert(payload)
    if (error) console.error('question_attempt insert failed', { error, payload })
  } catch (err) {
    console.error('question_attempt insert threw', { err, payload })
  }
}
