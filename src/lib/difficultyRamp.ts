import type { MasteryStatus } from '@/lib/mastery'

/**
 * WITHIN-SKILL DIFFICULTY RAMP — serve harder items as a student gets better at a
 * skill, easier ones when they are struggling.
 *
 * This is difficulty INSIDE one skill, which is a different axis from where the
 * skill sits on the grade staircase (see gradeLadder.ts for that one). The two
 * currently share the generated_questions.difficulty column, which is why 15 legacy
 * math skills carry a single difficulty across their whole pool: their tag encodes
 * staircase position, not item hardness. Those degrade to plain shuffled serving
 * rather than erroring or returning a short set.
 */

export type Difficulty = 'easy' | 'medium' | 'hard'

export type RampBand = 'easy-weighted' | 'balanced' | 'hard-weighted' | 'hard-only'

/** Rolling window of graded, non-diagnostic attempts the band is computed from. */
export const RAMP_WINDOW = 10
/**
 * Below this many attempts there is no trustworthy signal, so we serve balanced
 * rather than reacting to one or two answers. A single unlucky miss must not drop a
 * capable student to easy items, and one lucky guess must not jump them to hard.
 */
export const RAMP_MIN_ATTEMPTS = 3

export const EASY_MAX = 60
export const HARD_MIN = 80

/**
 * Relative preference per difficulty. These are WEIGHTS, not filters: a weighted
 * band still serves the other levels, just less often, so a session is never short
 * and a student never sees only one kind of item.
 *
 * 'hard-only' is the single exception, and even it falls back to the rest of the
 * pool once the hard items run out (see selectRamped) rather than serving fewer.
 */
const WEIGHTS: Record<RampBand, Record<Difficulty, number>> = {
  'easy-weighted': { easy: 3, medium: 2, hard: 1 },
  balanced: { easy: 1, medium: 1, hard: 1 },
  'hard-weighted': { easy: 1, medium: 2, hard: 3 },
  'hard-only': { easy: 0, medium: 0, hard: 1 },
}

export interface BandInput {
  /** is_correct for the last RAMP_WINDOW graded, non-diagnostic attempts. */
  recent: boolean[]
  /** Evidence status for this skill, if any. */
  status?: MasteryStatus | null
}

/**
 * Which band to serve.
 *
 * A student who has already cleared the ADVANCE bar gets hard only, until the
 * learning path moves them to another skill. That is deliberate: re-serving easy
 * items to someone at 'advanced' is the loop this whole workstream exists to fix.
 */
export function bandFor({ recent, status }: BandInput): RampBand {
  if (status === 'advanced' || status === 'mastered') return 'hard-only'
  const window = recent.slice(0, RAMP_WINDOW)
  if (window.length < RAMP_MIN_ATTEMPTS) return 'balanced'
  const accuracy = (100 * window.filter(Boolean).length) / window.length
  if (accuracy < EASY_MAX) return 'easy-weighted'
  if (accuracy < HARD_MIN) return 'balanced'
  return 'hard-weighted'
}

/** Anything with a difficulty we do not recognize is treated as unlabelled. */
export function parseDifficulty(raw: unknown): Difficulty | null {
  return raw === 'easy' || raw === 'medium' || raw === 'hard' ? raw : null
}

export interface RampableQuestion {
  id: string
  difficulty: Difficulty | null
}

/**
 * Does this pool carry a REAL internal spread? One distinct difficulty means the
 * tag is describing the skill, not the item, so weighting it would be meaningless.
 */
export function hasDifficultySpread(questions: RampableQuestion[]): boolean {
  const seen = new Set<Difficulty>()
  for (const q of questions) if (q.difficulty) seen.add(q.difficulty)
  return seen.size > 1
}

/** Difficulty draw order for a band: each level repeated by its weight. */
function preferenceSequence(band: RampBand): Difficulty[] {
  const w = WEIGHTS[band]
  const seq: Difficulty[] = []
  const levels: Difficulty[] = ['hard', 'medium', 'easy']
  const max = Math.max(...levels.map((l) => w[l]))
  // Interleave rather than block, so a 3/2/1 weighting produces a mixed session
  // instead of three hard items followed by two medium.
  for (let tier = 0; tier < max; tier++) {
    for (const level of levels) if (w[level] > tier) seq.push(level)
  }
  return seq
}

function partition<T extends RampableQuestion>(qs: T[]): Record<Difficulty | 'none', T[]> {
  const out: Record<Difficulty | 'none', T[]> = { easy: [], medium: [], hard: [], none: [] }
  for (const q of qs) out[q.difficulty ?? 'none'].push(q)
  return out
}

/** Draw up to `need` items from the buckets, following the band's preference. */
function drawFrom<T extends RampableQuestion>(
  buckets: Record<Difficulty | 'none', T[]>,
  band: RampBand,
  need: number,
): T[] {
  const taken: T[] = []
  const seq = preferenceSequence(band)
  let guard = 0
  while (taken.length < need && guard++ < 10_000) {
    let tookAny = false
    for (const level of seq) {
      if (taken.length >= need) break
      const bucket = buckets[level]
      if (bucket.length) {
        taken.push(bucket.shift() as T)
        tookAny = true
      }
    }
    if (!tookAny) break // every preferred bucket is empty
  }
  // Whatever the band preferred, never return short while items remain: untagged
  // items and zero-weight levels are used to fill the rest.
  if (taken.length < need) {
    for (const level of ['none', 'hard', 'medium', 'easy'] as const) {
      while (taken.length < need && buckets[level].length) taken.push(buckets[level].shift() as T)
    }
  }
  return taken
}

export interface SelectInput<T extends RampableQuestion> {
  questions: T[]
  band: RampBand
  /** generated_question_ids the student has already answered on this skill. */
  seenIds: Set<string>
  limit: number
  /** Injectable shuffle so tests are deterministic. */
  shuffle?: <U>(arr: U[]) => U[]
}

function defaultShuffle<U>(arr: U[]): U[] {
  const a = [...arr]
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[a[i], a[j]] = [a[j], a[i]]
  }
  return a
}

/**
 * Pick the session's questions: unseen first, weighted by band within that.
 *
 * NO-SPREAD FALLBACK. When the pool has a single difficulty (the 15 legacy math
 * skills), weighting is skipped entirely and this behaves exactly like the plain
 * serve path — shuffle and slice — with the unseen preference still applied, since
 * that is orthogonal to difficulty and helps those skills too. This wins over the
 * hard-only rule: an advanced student on a single-difficulty pool gets the normal
 * pool, never an empty or short set.
 *
 * REPEAT FALLBACK. Unseen questions are drawn first. Only once the unseen pool is
 * exhausted do we draw from questions the student has already answered, which is
 * the deliberate "the bank is too thin to avoid a repeat" case rather than an
 * accident. With 20 items and a 10-question session, a student reaches this on
 * their third sitting of a skill.
 */
export function selectRamped<T extends RampableQuestion>({
  questions,
  band,
  seenIds,
  limit,
  shuffle = defaultShuffle,
}: SelectInput<T>): T[] {
  if (limit <= 0 || !questions.length) return []

  const unseen = shuffle(questions.filter((q) => !seenIds.has(q.id)))
  const seen = shuffle(questions.filter((q) => seenIds.has(q.id)))

  if (!hasDifficultySpread(questions)) {
    // Single-difficulty pool: current behaviour, unseen first.
    return [...unseen, ...seen].slice(0, limit)
  }

  const picked = drawFrom(partition(unseen), band, limit)
  if (picked.length >= limit) return picked
  // Unseen pool exhausted — repeat, weighted the same way.
  return [...picked, ...drawFrom(partition(seen), band, limit - picked.length)]
}
