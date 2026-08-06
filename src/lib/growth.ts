import { ADVANCE_MIN_ATTEMPTS, ADVANCE_MIN_ACCURACY, type MasteryStatus } from '@/lib/mastery'

/**
 * GROWTH OVER TIME - what has actually changed, week by week.
 *
 * EVIDENCE ONLY. Every number on this panel comes from question_attempts: graded,
 * non-diagnostic answers with a date on them. It does not read mastery_percentage
 * (the legacy self-rating ramp) and it does not read mastery_snapshots. Those are
 * the two sources that made the old dashboard claim progress nobody had earned,
 * and neither is imported here.
 *
 * THE DATES ARE REPLAYED, NOT READ. student_skill_mastery carries first_bar_met_at
 * and recheck_passed_at, and they look like milestone dates but are not: they are
 * stamped at now() by whichever recompute happened to notice, so a backfill or a
 * maintenance recompute restamps them. Measured against the live database, Peyton
 * carries first_bar_met_at of July 14 on a skill whose last graded attempt was
 * July 2, and five stamps across four children share a single minute. They also
 * only mark the MASTERED bar, so 18 of 27 cleared skills carry no stamp at all.
 * Showing a parent "cleared on July 14" when the child cleared it on July 2 is a
 * fabricated date, so instead we replay the attempt stream and date the milestone
 * by the attempt that met the bar. That date is a fact about the child.
 */

/** Distinct weeks with at least one graded attempt before we show a trend. Two
 *  points can be one good day and one bad day; three is the least that can show a
 *  shape rather than a swing. */
export const GROWTH_MIN_WEEKS = 3

/** Total graded attempts before we show a trend. Three weeks of two questions
 *  each is not a trend, it is noise with a date range. */
export const GROWTH_MIN_ATTEMPTS = 20

/** How many weeks the series shows, ending at the current week. */
export const GROWTH_WINDOW_WEEKS = 8

/** Each half of the window needs this many attempts before we name a direction.
 *  Otherwise one thin week decides the story. */
export const GROWTH_HALF_MIN_ATTEMPTS = 8

/** Accuracy changes smaller than this are week-to-week noise, not movement.
 *  Wider than the prep trajectory's 3 points because everyday practice mixes
 *  skills and difficulties, so its accuracy swings more than a fixed test does. */
export const GROWTH_FLAT_BAND_POINTS = 5

/** Milestones listed before we summarise the rest as a count. */
export const GROWTH_MAX_MILESTONES = 6

const DAY_MS = 86_400_000

export interface GrowthAttempt {
  skillId: string
  isCorrect: boolean
  /** ISO timestamp of the attempt. */
  createdAt: string
}

export interface GrowthWeek {
  /** Local Monday that starts the week, as YYYY-MM-DD. */
  start: string
  attempts: number
  correct: number
  /** Percent correct, or null for a week with no practice (NOT zero: a week
   *  nobody practiced is not a week they got everything wrong). */
  percent: number | null
  /** Distinct skills touched that week. */
  skills: number
}

export type GrowthDirection = 'up' | 'down' | 'flat'

export interface GrowthMilestone {
  skillId: string
  skillName: string
  subject: string
  /** ISO timestamp of the attempt that met the advance bar. */
  date: string
}

export interface GrowthSummary {
  /** Weeks in the window, oldest first, gaps filled so time is not compressed. */
  weeks: GrowthWeek[]
  /** Weeks with at least one graded attempt, across all history. */
  activeWeeks: number
  /** Graded attempts across all history. */
  totalAttempts: number
  /** Both gates met, so a trend can be shown. */
  gateMet: boolean
  /** Pooled percent correct for the earlier and later half of the window. */
  earlyPercent: number | null
  latePercent: number | null
  /** null when either half is too thin to compare. */
  direction: GrowthDirection | null
  changePoints: number | null
  /** Attempts inside the displayed window. */
  windowAttempts: number
  milestones: GrowthMilestone[]
  /** Cleared skills whose clear date could not be replayed (see datingNote). */
  undatedCleared: number
}

// --- week arithmetic --------------------------------------------------------

/** Local midnight on the Monday of this date's week. Local, not UTC: a child
 *  practicing on Sunday evening should land in the week they experienced. */
export function weekStart(d: Date): Date {
  const out = new Date(d.getFullYear(), d.getMonth(), d.getDate())
  const dow = (out.getDay() + 6) % 7 // 0 = Monday
  out.setDate(out.getDate() - dow)
  return out
}

/** YYYY-MM-DD for a local date, without going through UTC. */
export function localKey(d: Date): string {
  const m = String(d.getMonth() + 1).padStart(2, '0')
  const day = String(d.getDate()).padStart(2, '0')
  return `${d.getFullYear()}-${m}-${day}`
}

function parse(iso: string): Date | null {
  const t = Date.parse(iso)
  return Number.isNaN(t) ? null : new Date(t)
}

// --- the series -------------------------------------------------------------

interface WeekBucket {
  attempts: number
  correct: number
  skills: Set<string>
}

function bucketByWeek(attempts: GrowthAttempt[]): Map<string, WeekBucket> {
  const byWeek = new Map<string, WeekBucket>()
  for (const a of attempts) {
    const d = parse(a.createdAt)
    if (!d) continue
    const key = localKey(weekStart(d))
    const b = byWeek.get(key) ?? { attempts: 0, correct: 0, skills: new Set<string>() }
    b.attempts += 1
    if (a.isCorrect) b.correct += 1
    b.skills.add(a.skillId)
    byWeek.set(key, b)
  }
  return byWeek
}

/**
 * The window, oldest first: GROWTH_WINDOW_WEEKS ending at the week containing
 * `now`, with weeks before the child's first attempt trimmed off the front.
 *
 * Empty weeks INSIDE the window are kept. A child who practiced hard and then
 * stopped should show the stop; collapsing to active weeks only would draw those
 * two bursts side by side and read as continuous practice.
 */
export function buildWeeks(attempts: GrowthAttempt[], now: Date): GrowthWeek[] {
  const byWeek = bucketByWeek(attempts)
  if (!byWeek.size) return []

  const firstKey = [...byWeek.keys()].sort()[0]
  const current = weekStart(now)
  const weeks: GrowthWeek[] = []
  for (let i = GROWTH_WINDOW_WEEKS - 1; i >= 0; i--) {
    const start = new Date(current.getTime() - i * 7 * DAY_MS)
    const key = localKey(weekStart(start))
    if (key < firstKey) continue // before this child ever practiced
    const b = byWeek.get(key)
    weeks.push({
      start: key,
      attempts: b?.attempts ?? 0,
      correct: b?.correct ?? 0,
      percent: b && b.attempts > 0 ? Math.round((100 * b.correct) / b.attempts) : null,
      skills: b?.skills.size ?? 0,
    })
  }
  return weeks
}

/**
 * Direction across the window, pooled over its earlier and later half.
 *
 * Pooled rather than first-week-versus-last-week: a single quiet week at either
 * end should not decide whether a parent is told their child is improving. Both
 * halves must carry GROWTH_HALF_MIN_ATTEMPTS before we name a direction at all.
 */
export function directionOver(weeks: GrowthWeek[]): {
  earlyPercent: number | null
  latePercent: number | null
  direction: GrowthDirection | null
  changePoints: number | null
} {
  const half = Math.floor(weeks.length / 2)
  const pool = (list: GrowthWeek[]) => {
    const attempts = list.reduce((n, w) => n + w.attempts, 0)
    const correct = list.reduce((n, w) => n + w.correct, 0)
    return { attempts, percent: attempts > 0 ? Math.round((100 * correct) / attempts) : null }
  }
  // An odd number of weeks gives the middle week to the later half, so the most
  // recent evidence is never the thinner side.
  const early = pool(weeks.slice(0, half))
  const late = pool(weeks.slice(half))

  const comparable =
    half > 0 &&
    early.attempts >= GROWTH_HALF_MIN_ATTEMPTS &&
    late.attempts >= GROWTH_HALF_MIN_ATTEMPTS &&
    early.percent != null &&
    late.percent != null
  if (!comparable) {
    return { earlyPercent: early.percent, latePercent: late.percent, direction: null, changePoints: null }
  }
  const delta = (late.percent as number) - (early.percent as number)
  const direction: GrowthDirection =
    Math.abs(delta) < GROWTH_FLAT_BAND_POINTS ? 'flat' : delta > 0 ? 'up' : 'down'
  return {
    earlyPercent: early.percent,
    latePercent: late.percent,
    direction,
    changePoints: delta,
  }
}

// --- milestones -------------------------------------------------------------

export interface MilestoneSkill {
  skillId: string
  name: string
  subject: string
  status: MasteryStatus
}

/**
 * Dated "cleared" milestones, newest first.
 *
 * For every skill the engine CURRENTLY calls advanced or mastered, we replay that
 * skill's graded attempts in order and take the date of the attempt at which the
 * advance bar first held: at least ADVANCE_MIN_ATTEMPTS attempts at
 * ADVANCE_MIN_ACCURACY or better. That mirrors recompute_skill_mastery, which
 * computes the advance bar over all graded non-diagnostic attempts.
 *
 * Gating on the CURRENT status matters. A skill that met the bar once and has
 * since fallen back is not something to congratulate a parent on, and the rest of
 * the dashboard would be calling it a gap on the same screen.
 *
 * A cleared skill we cannot date (its history predates what we can read, or it
 * reached mastered on the quality-filtered count while its all-attempts accuracy
 * sits below the advance bar) is COUNTED, never dated with a guess.
 */
export function buildMilestones(
  attempts: GrowthAttempt[],
  skills: MilestoneSkill[],
): { milestones: GrowthMilestone[]; undatedCleared: number } {
  const cleared = skills.filter((s) => s.status === 'advanced' || s.status === 'mastered')
  if (!cleared.length) return { milestones: [], undatedCleared: 0 }

  const bySkill = new Map<string, GrowthAttempt[]>()
  for (const a of attempts) {
    bySkill.set(a.skillId, [...(bySkill.get(a.skillId) ?? []), a])
  }

  const milestones: GrowthMilestone[] = []
  let undated = 0
  for (const s of cleared) {
    const stream = (bySkill.get(s.skillId) ?? [])
      .filter((a) => parse(a.createdAt) !== null)
      .sort((x, y) => Date.parse(x.createdAt) - Date.parse(y.createdAt))
    let n = 0
    let correct = 0
    let clearedAt: string | null = null
    for (const a of stream) {
      n += 1
      if (a.isCorrect) correct += 1
      if (n >= ADVANCE_MIN_ATTEMPTS && (100 * correct) / n >= ADVANCE_MIN_ACCURACY) {
        clearedAt = a.createdAt
        break
      }
    }
    if (clearedAt) {
      milestones.push({ skillId: s.skillId, skillName: s.name, subject: s.subject, date: clearedAt })
    } else {
      undated += 1
    }
  }

  milestones.sort((a, b) => Date.parse(b.date) - Date.parse(a.date))
  return { milestones, undatedCleared: undated }
}

// --- the whole panel --------------------------------------------------------

export function buildGrowth(
  attempts: GrowthAttempt[],
  skills: MilestoneSkill[],
  now: Date,
): GrowthSummary {
  const weeks = buildWeeks(attempts, now)
  const byWeek = bucketByWeek(attempts)
  const activeWeeks = [...byWeek.values()].filter((b) => b.attempts > 0).length
  const totalAttempts = attempts.length
  const { milestones, undatedCleared } = buildMilestones(attempts, skills)

  return {
    weeks,
    activeWeeks,
    totalAttempts,
    gateMet: activeWeeks >= GROWTH_MIN_WEEKS && totalAttempts >= GROWTH_MIN_ATTEMPTS,
    windowAttempts: weeks.reduce((n, w) => n + w.attempts, 0),
    ...directionOver(weeks),
    milestones,
    undatedCleared,
  }
}

// ---------------------------------------------------------------------------
// COPY. Next to the rule, so the words and the maths cannot drift.
// ---------------------------------------------------------------------------

const MONTHS = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

/** "Jun 30" from a YYYY-MM-DD local key or an ISO timestamp. */
export function shortDate(value: string): string {
  const [y, m, d] = value.slice(0, 10).split('-').map(Number)
  if (!y || !m || !d) return value
  return `${MONTHS[m - 1]} ${d}`
}

export function weekLabel(week: GrowthWeek): string {
  return `Week of ${shortDate(week.start)}`
}

export function milestoneLabel(m: GrowthMilestone): string {
  return `Cleared ${m.skillName}`
}

export interface GrowthCopy {
  headline: string
  detail: string | null
}

/**
 * What the parent reads. Two shapes only: the gate is not met and we say exactly
 * what is missing, or it is met and we report measured percentages.
 *
 * There is no projection here and no encouragement dressed as a finding. "Up 7
 * points" is arithmetic on two measured numbers; nothing claims where the child
 * will be next month.
 */
export function growthCopy(g: GrowthSummary, firstName: string): GrowthCopy {
  if (!g.gateMet) {
    const weeksWord = g.activeWeeks === 1 ? '1 week' : `${g.activeWeeks} weeks`
    const questions = g.totalAttempts === 1 ? '1 question' : `${g.totalAttempts} questions`
    if (g.totalAttempts === 0) {
      return {
        headline: 'Not enough practice yet to show growth.',
        detail: `Growth needs ${GROWTH_MIN_WEEKS} different weeks of practice and ${GROWTH_MIN_ATTEMPTS} questions answered. ${firstName} has not answered any yet.`,
      }
    }
    return {
      headline: 'Not enough practice yet to show growth.',
      detail: `${firstName} has practiced in ${weeksWord} and answered ${questions}. We show growth once that reaches ${GROWTH_MIN_WEEKS} different weeks and ${GROWTH_MIN_ATTEMPTS} questions, so a trend is not read off one good day.`,
    }
  }

  const answered = `${firstName} answered ${g.windowAttempts} questions across ${g.weeks.length} weeks.`

  if (g.direction === null) {
    const latest = g.latePercent
    return {
      headline: latest == null ? answered : `${answered} Most recently ${latest}% correct.`,
      detail: `Not enough in each half of that stretch to compare fairly, so we are not calling a direction yet.`,
    }
  }

  const points = Math.abs(g.changePoints ?? 0)
  if (g.direction === 'up') {
    return {
      headline: `Improving, up ${points} points, from ${g.earlyPercent}% to ${g.latePercent}% correct.`,
      detail: answered,
    }
  }
  if (g.direction === 'down') {
    return {
      headline: `Down ${points} points, from ${g.earlyPercent}% to ${g.latePercent}% correct.`,
      detail: `${answered} A dip often means the work got harder rather than that ${firstName} got worse. Worth a look together.`,
    }
  }
  return {
    headline: `Holding steady around ${g.latePercent}% correct.`,
    detail: answered,
  }
}

/** The one-line caveat under the milestone list, when there is something to caveat. */
export function undatedNote(g: GrowthSummary, firstName: string): string | null {
  const n = g.undatedCleared
  if (n === 0) return null
  // "more" only makes sense when something precedes it in the list.
  const more = g.milestones.length > 0 ? 'more ' : ''
  return `${firstName} has cleared ${n} ${more}${n === 1 ? 'skill' : 'skills'} that we cannot put a date on.`
}
