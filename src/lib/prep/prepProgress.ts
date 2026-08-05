import type { PrepModule } from '@/lib/prep/types'
import { prepSkillFor, questionTypeLabel } from '@/lib/prep/prepSkills'

/**
 * Pure progress engine shared by the kid Progress tab and the parent prep card.
 *
 * Two evidence signals, deliberately kept separate:
 *   1. TIMED-SECTION SCORES — prep_attempts rows (submitted/expired) carry a
 *      server-graded score (0..1) per section. These are test-condition results.
 *   2. PER-TYPE PRACTICE MASTERY — each question type maps (prepSkills) to a skill
 *      slug whose accuracy comes from the graded mastery engine (untimed practice).
 *      Timed attempts do NOT feed skill mastery (the finalize RPC scores into
 *      prep_attempts only), so this is a distinct, practice-driven signal.
 *
 * computePrepProgress is PURE (no I/O, `now` passed in) so both surfaces render the
 * same numbers and it is unit-testable. The kid surface shows scores + encouragement
 * and NEVER a readiness number; the parent surface adds the readiness blend below.
 */

/** The subset of a PrepAttempt this engine needs (finalized timed attempts only). */
export interface PrepAttemptLite {
  sectionId: string
  status: 'submitted' | 'expired'
  /** Server-graded fraction 0..1, or null if ungraded. */
  score: number | null
  startedAt: string | null
}

export interface SectionProgress {
  sectionId: string
  name: string
  attempts: number
  /** Most-recent attempt score, 0..100. */
  latestScore: number
  latestDate: string | null
  /** Immediately-prior attempt score (0..100), or null when only one attempt. */
  priorScore: number | null
  /** Best score across all attempts, 0..100. */
  bestScore: number
  /** Latest attempt is a personal best AND there is something to beat (>=2 attempts). */
  isBest: boolean
  trend: 'up' | 'down' | 'flat' | null
}

export interface TypeProgress {
  type: string
  label: string
  slug: string
  /** Practice-mastery accuracy for the type's skill, 0..100. */
  accuracy: number
}

export interface PrepProgress {
  hasAttempts: boolean
  /** Sections with >=1 finalized timed attempt, most recent activity first. */
  sections: SectionProgress[]
  /** Lowest-accuracy types with practice evidence, deduped by skill, up to 3. */
  weakestTypes: TypeProgress[]
  /** 0..100 module readiness for the PARENT surface; null when data is too thin.
   *  NEVER shown on a kid surface. */
  readiness: number | null
  /** The MASTERY TERM ALONE (0..100), null when no type has graded evidence. This
   *  is what the free readiness teaser shows for a not-yet-entitled child (they have
   *  no timed attempts, so the blended readiness would equal this anyway — exposed
   *  explicitly so the teaser never depends on that coincidence). */
  masteryReadiness: number | null
  /** How many of the module's question types (deduped by skill) have graded practice
   *  evidence. The teaser's coverage gate keys on this. */
  coveredSkillCount: number
  /** Distinct display subjects the covered skills span (e.g. ['math','reading',
   *  'language']) — for the teaser's "based on his work in …" note. */
  coveredSubjects: string[]
}

// sessionSubject (math|reading|writing) -> the label families use on prep surfaces.
const SUBJECT_DISPLAY: Record<string, string> = { math: 'math', reading: 'reading', writing: 'language' }
const SUBJECT_ORDER = ['math', 'reading', 'writing']

// Readiness blend weights (parent surface only). Per-type practice mastery is
// weighted a bit higher than recent section accuracy because it reflects durable
// per-skill depth across the whole module, while a single timed section is a
// narrower, noisier snapshot. Both are on a 0..100 scale; when only one signal
// exists the present weight is renormalized to 1 (so readiness is still defined
// from either signal alone). Formula:
//   readiness = round( (mastery% * 0.6 + section% * 0.4) / (0.6 + 0.4) )
// with a term dropped (and its weight removed from the denominator) when its
// signal is absent. null when NEITHER signal has evidence.
export const READINESS_W_MASTERY = 0.6
export const READINESS_W_SECTION = 0.4
// How many "work on next" types the surfaces show.
const WEAKEST_LIMIT = 3
// Free-teaser coverage gate: a not-yet-entitled child needs graded evidence on at
// least this many of the module's distinct skills before we show a readiness NUMBER.
// Below it, the teaser shows the "building a picture" state instead — never a number
// derived from almost nothing. Three distinct skills is enough to be directional
// without being noise from a single lucky (or unlucky) skill.
export const TEASER_MIN_COVERED_SKILLS = 3

const pct = (fraction: number) => Math.round(fraction * 100)
const mean = (xs: number[]) => xs.reduce((a, b) => a + b, 0) / xs.length

/**
 * Compute a module's progress from finalized timed attempts + per-slug practice
 * accuracy. `slugAccuracy` maps a skill slug to its practice accuracy (0..100) or
 * null when there is no graded evidence yet.
 */
export function computePrepProgress(
  module: PrepModule,
  attempts: PrepAttemptLite[],
  slugAccuracy: Map<string, number | null>,
  /**
   * Slugs the student has already cleared the ADVANCE bar on (status 'advanced' or
   * 'mastered'). Used ONLY to keep them out of "what to work on next" — every other
   * number here, including the readiness blend and coverage count, is unchanged, so
   * the prep engine's scoring is untouched.
   */
  clearedSlugs: Set<string> = new Set(),
): PrepProgress {
  // ---- Per-section timed-score trend --------------------------------------
  const sectionName = (id: string) => module.sections.find((s) => s.id === id)?.name ?? id
  const byId = new Map<string, PrepAttemptLite[]>()
  for (const a of attempts) {
    if (a.status !== 'submitted' && a.status !== 'expired') continue
    if (a.score == null) continue
    if (!byId.has(a.sectionId)) byId.set(a.sectionId, [])
    byId.get(a.sectionId)!.push(a)
  }

  const sections: SectionProgress[] = []
  for (const [sectionId, list] of byId) {
    // Oldest -> newest by start time (nulls sort oldest).
    const ordered = [...list].sort((x, y) => timeOf(x.startedAt) - timeOf(y.startedAt))
    const scores = ordered.map((a) => pct(a.score as number))
    const latest = ordered[ordered.length - 1]
    const latestScore = scores[scores.length - 1]
    const priorScore = scores.length >= 2 ? scores[scores.length - 2] : null
    const bestScore = Math.max(...scores)
    sections.push({
      sectionId,
      name: sectionName(sectionId),
      attempts: ordered.length,
      latestScore,
      latestDate: latest.startedAt,
      priorScore,
      bestScore,
      isBest: ordered.length >= 2 && latestScore >= bestScore,
      trend:
        priorScore == null
          ? null
          : latestScore > priorScore
            ? 'up'
            : latestScore < priorScore
              ? 'down'
              : 'flat',
    })
  }
  // Most recent activity first.
  sections.sort((a, b) => timeOf(b.latestDate) - timeOf(a.latestDate))

  // ---- Weakest question types (practice mastery), deduped by skill --------
  const seenSlug = new Set<string>()
  const typeRows: TypeProgress[] = []
  const subjectsSeen = new Set<string>()
  for (const sec of module.sections) {
    for (const type of sec.questionTypes) {
      const ref = prepSkillFor(type)
      const slug = ref?.slug
      if (!slug || seenSlug.has(slug)) continue
      const acc = slugAccuracy.get(slug)
      if (acc == null) continue // only types with graded practice evidence
      seenSlug.add(slug)
      typeRows.push({ type, label: questionTypeLabel(type), slug, accuracy: Math.round(acc) })
      if (ref?.sessionSubject) subjectsSeen.add(ref.sessionSubject)
    }
  }
  // A student sitting at 'advanced' or 'mastered' is not sent back to the skill,
  // however low its legacy practice accuracy reads. This is what parked a grade 9
  // student on grade 3 Multiplication for 16 attempts at 88%: the prep tile kept
  // offering it because nothing here knew they had already cleared it.
  const weakestTypes = typeRows
    .filter((t) => !clearedSlugs.has(t.slug))
    .sort((a, b) => a.accuracy - b.accuracy || a.label.localeCompare(b.label))
    .slice(0, WEAKEST_LIMIT)
  const coveredSubjects = SUBJECT_ORDER.filter((s) => subjectsSeen.has(s)).map((s) => SUBJECT_DISPLAY[s] ?? s)

  // ---- Parent readiness blend (0..100), null when both signals absent -----
  const masteryComponent = typeRows.length ? mean(typeRows.map((t) => t.accuracy)) : null
  const sectionComponent = sections.length ? mean(sections.map((s) => s.latestScore)) : null
  let readiness: number | null = null
  {
    const parts: { v: number; w: number }[] = []
    if (masteryComponent != null) parts.push({ v: masteryComponent, w: READINESS_W_MASTERY })
    if (sectionComponent != null) parts.push({ v: sectionComponent, w: READINESS_W_SECTION })
    if (parts.length) {
      const wsum = parts.reduce((a, p) => a + p.w, 0)
      readiness = Math.round(parts.reduce((a, p) => a + p.v * p.w, 0) / wsum)
    }
  }

  return {
    hasAttempts: sections.length > 0,
    sections,
    weakestTypes,
    readiness,
    masteryReadiness: masteryComponent != null ? Math.round(masteryComponent) : null,
    coveredSkillCount: typeRows.length,
    coveredSubjects,
  }
}

function timeOf(iso: string | null): number {
  if (!iso) return 0
  const t = Date.parse(iso)
  return Number.isNaN(t) ? 0 : t
}
