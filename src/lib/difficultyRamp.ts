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

export type RampBand = 'easy-weighted' | 'balanced' | 'hard-weighted' | 'advanced'

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
 * The target MIX per band, expressed as items per 10-question session. Scaled
 * proportionally for other session lengths.
 *
 * NO BAND EXCLUDES A DIFFICULTY. An earlier version gave the advanced band
 * hard-only weights, and in production a student at the advance bar was served six
 * identical unknown-factor items in a row. A session that is one form repeated is a
 * worse experience than a slightly easier one, and it teaches nothing extra. Every
 * band now leans; none filters.
 *
 *   easy-weighted   7 easy   2 medium  1 hard   struggling, but still stretched
 *   balanced        3 easy   4 medium  3 hard   the honest middle
 *   hard-weighted   1 easy   2 medium  7 hard   strong, still varied
 *   advanced        1 easy   1 medium  8 hard   cleared the bar, hardest lean we serve
 *
 * The single easy item in the hard bands is deliberate: it is a breather and a
 * confidence check, not a waste of a slot.
 */
export const BAND_MIX: Record<RampBand, Record<Difficulty, number>> = {
  'easy-weighted': { easy: 7, medium: 2, hard: 1 },
  balanced: { easy: 3, medium: 4, hard: 3 },
  'hard-weighted': { easy: 1, medium: 2, hard: 7 },
  advanced: { easy: 1, medium: 1, hard: 8 },
}

/** Order to break ties and to prefer when reallocating an exhausted level. */
const BAND_ORDER: Record<RampBand, Difficulty[]> = {
  'easy-weighted': ['easy', 'medium', 'hard'],
  balanced: ['medium', 'easy', 'hard'],
  'hard-weighted': ['hard', 'medium', 'easy'],
  advanced: ['hard', 'medium', 'easy'],
}

/**
 * Sessions at least this long must contain at least two difficulties when the pool
 * has them. Below it, rounding can legitimately land on a single level and forcing
 * variety would distort a very short set.
 */
export const VARIETY_FLOOR_MIN_SESSION = 4

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
  if (status === 'advanced' || status === 'mastered') return 'advanced'
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

function partition<T extends RampableQuestion>(qs: T[]): Record<Difficulty | 'none', T[]> {
  const out: Record<Difficulty | 'none', T[]> = { easy: [], medium: [], hard: [], none: [] }
  for (const q of qs) out[q.difficulty ?? 'none'].push(q)
  return out
}

const LEVELS: Difficulty[] = ['easy', 'medium', 'hard']

/**
 * How many of each difficulty a session of `limit` should aim for.
 *
 * Only levels the pool actually HAS are considered, and the mix is renormalized
 * over them, so a pool missing a level does not silently lose slots. Fractional
 * targets are settled by largest remainder so the counts always sum to `limit`.
 *
 * THE VARIETY FLOOR. If the plan lands everything on one level while the pool holds
 * more than one, a slot is moved to the next-preferred level. That is what stops a
 * ten-item session from being ten of the same form.
 */
export function planCounts(
  band: RampBand,
  limit: number,
  availableLevels: Difficulty[],
): Record<Difficulty, number> {
  const plan: Record<Difficulty, number> = { easy: 0, medium: 0, hard: 0 }
  const avail = LEVELS.filter((l) => availableLevels.includes(l))
  if (!avail.length || limit <= 0) return plan

  const mix = BAND_MIX[band]
  const totalWeight = avail.reduce((a, l) => a + mix[l], 0)
  if (totalWeight <= 0) {
    plan[avail[0]] = limit
    return plan
  }

  const exact = avail.map((l) => ({ level: l, want: (limit * mix[l]) / totalWeight }))
  for (const e of exact) plan[e.level] = Math.floor(e.want)
  let assigned = avail.reduce((a, l) => a + plan[l], 0)
  const order = BAND_ORDER[band]
  const byRemainder = [...exact].sort(
    (x, y) =>
      y.want - Math.floor(y.want) - (x.want - Math.floor(x.want)) ||
      order.indexOf(x.level) - order.indexOf(y.level),
  )
  let i = 0
  while (assigned < limit) {
    plan[byRemainder[i % byRemainder.length].level]++
    assigned++
    i++
  }

  // Variety floor.
  if (avail.length >= 2 && limit >= VARIETY_FLOOR_MIN_SESSION) {
    const nonZero = avail.filter((l) => plan[l] > 0)
    if (nonZero.length === 1) {
      const from = nonZero[0]
      const to = order.find((l) => l !== from && avail.includes(l))
      if (to && plan[from] > 1) {
        plan[from]--
        plan[to]++
      }
    }
  }
  return plan
}

/**
 * Draw the planned counts, interleaved rather than blocked, so the session reads as
 * a mix instead of a run of hard items followed by a run of easy ones. At each step
 * we take from whichever level is furthest behind its own target.
 *
 * Unseen questions come first within each level. A level whose buckets run dry
 * forfeits its remaining slots to the others, so the session is never short.
 */
function drawPlanned<T extends RampableQuestion>(
  unseen: Record<Difficulty | 'none', T[]>,
  seen: Record<Difficulty | 'none', T[]>,
  plan: Record<Difficulty, number>,
  band: RampBand,
  limit: number,
): T[] {
  const target = { ...plan }
  const remaining = { ...plan }
  const order = BAND_ORDER[band]
  const out: T[] = []

  const take = (level: Difficulty | 'none'): T | null =>
    unseen[level].shift() ?? seen[level].shift() ?? null

  let guard = 0
  while (out.length < limit && guard++ < 10_000) {
    const candidates = LEVELS.filter((l) => remaining[l] > 0 && (unseen[l].length || seen[l].length))
    if (!candidates.length) break
    candidates.sort(
      (x, y) =>
        remaining[y] / (target[y] || 1) - remaining[x] / (target[x] || 1) ||
        order.indexOf(x) - order.indexOf(y),
    )
    const level = candidates[0]
    const q = take(level)
    if (!q) {
      remaining[level] = 0
      continue
    }
    out.push(q)
    remaining[level]--
  }

  // Top up from anything left, including untagged items, rather than return short.
  if (out.length < limit) {
    for (const level of [...order, 'none'] as (Difficulty | 'none')[]) {
      while (out.length < limit) {
        const q = take(level)
        if (!q) break
        out.push(q)
      }
    }
  }
  return out
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
 * NO-SPREAD FALLBACK. When the pool has a single difficulty (the remaining legacy
 * math skills), weighting is skipped entirely and this behaves exactly like the
 * plain serve path, shuffle and slice, with the unseen preference still applied
 * since that is orthogonal to difficulty and helps those skills too. This wins over
 * every band including advanced: a student on a single-difficulty pool gets the
 * normal pool, never an empty or short set.
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

  // TWO PHASES, AND THE ORDER MATTERS. The unseen pool is exhausted FIRST, planned
  // and interleaved within itself; only then do we repeat. Mixing the two phases
  // would let the plan reach for a seen easy item while an unseen hard one was
  // still available, which trades a fresh question for a difficulty match. A fresh
  // question is worth more.
  const empty = (): Record<Difficulty | 'none', T[]> => ({ easy: [], medium: [], hard: [], none: [] })

  const unseenLevels = LEVELS.filter((l) => unseen.some((q) => q.difficulty === l))
  const first = drawPlanned(partition(unseen), empty(), planCounts(band, limit, unseenLevels), band, limit)
  if (first.length >= limit) return first

  // Unseen pool exhausted. Repeat, planned the same way over what is left.
  const need = limit - first.length
  const seenLevels = LEVELS.filter((l) => seen.some((q) => q.difficulty === l))
  return [...first, ...drawPlanned(partition(seen), empty(), planCounts(band, need, seenLevels), band, need)]
}
