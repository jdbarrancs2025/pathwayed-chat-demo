import { bandFor, type ReadinessBand, type HistoryAttemptInput } from '@/lib/prep/testReadiness'
import type { PrepModule } from '@/lib/prep/types'

/**
 * TEST TRAJECTORY - direction per section over repeated attempts.
 *
 * The assessment history is a flat, reverse-chronological list, which hides the
 * only thing a parent actually wants to know: is this getting better? A child who
 * went 38% to 45% on HSPT Mathematics has improved, and the list makes you work
 * that out yourself by scanning two rows and subtracting.
 *
 * SAME HONESTY RULES AS THE READINESS CARD. Every number here is MEASURED percent
 * correct on a timed section the child actually sat, paired with the existing
 * qualitative band. There is no projected scaled score, no percentile, no
 * extrapolation, and no trend line through a single point.
 */

export type TrendDirection = 'up' | 'down' | 'flat'

export interface TrajectoryPoint {
  /** Measured percent correct, 0..100. */
  percent: number
  /** When the attempt was taken (submitted, else started). */
  date: string | null
  mode: string
}

export interface SectionTrajectory {
  sectionId: string
  sectionName: string
  points: TrajectoryPoint[]
  /** First and latest measured percent. Equal when there is only one attempt. */
  first: number
  latest: number
  /** Best measured percent across attempts, for "personal best" framing. */
  best: number
  /** null until there are 2+ attempts: one attempt is a score, not a direction. */
  direction: TrendDirection | null
  /** latest minus first, in percentage points. null with one attempt. */
  changePoints: number | null
  band: ReadinessBand
  attempts: number
}

export interface ModuleTrajectory {
  moduleId: string
  moduleName: string
  sections: SectionTrajectory[]
  /** True when at least one section has 2+ attempts, so direction is showable. */
  hasDirection: boolean
}

/**
 * A section needs this many FINISHED attempts before we claim a direction.
 * Two is the honest minimum: with one attempt there is nothing to compare, and
 * showing an arrow off a single data point invents a trend.
 */
export const TRAJECTORY_MIN_ATTEMPTS = 2

/** Ignore changes smaller than this: test-to-test noise, not movement. */
export const FLAT_BAND_POINTS = 3

function timeOf(iso: string | null): number {
  if (!iso) return 0
  const t = Date.parse(iso)
  return Number.isNaN(t) ? 0 : t
}

/** Scores are stored 0..1; the UI speaks percent. */
function toPercent(score: number): number {
  return Math.round(score * 100)
}

export function directionFor(first: number, latest: number): TrendDirection {
  const delta = latest - first
  if (Math.abs(delta) < FLAT_BAND_POINTS) return 'flat'
  return delta > 0 ? 'up' : 'down'
}

/**
 * Build per-section trajectories for ONE module.
 *
 * Only finished, scored attempts count. An expired run has no percent, so it is
 * not a point on a trajectory even though the history list still shows it. Points
 * are ordered oldest first, which is the direction a parent reads.
 */
export function buildModuleTrajectory(
  module: PrepModule,
  attempts: HistoryAttemptInput[],
): ModuleTrajectory {
  const sectionName = (id: string) => module.sections.find((s) => s.id === id)?.name ?? id

  const bySection = new Map<string, HistoryAttemptInput[]>()
  for (const a of attempts) {
    if (a.moduleId !== module.id) continue
    // Scored and finished only. 'expired' with no score is a non-result.
    if (a.status !== 'submitted' || a.score == null) continue
    bySection.set(a.sectionId, [...(bySection.get(a.sectionId) ?? []), a])
  }

  const sections: SectionTrajectory[] = []
  for (const [sectionId, list] of bySection) {
    const ordered = [...list].sort((x, y) => timeOf(x.startedAt) - timeOf(y.startedAt))
    const points: TrajectoryPoint[] = ordered.map((a) => ({
      percent: toPercent(a.score as number),
      date: a.submittedAt ?? a.startedAt,
      mode: a.mode,
    }))
    const first = points[0].percent
    const latest = points[points.length - 1].percent
    const enough = points.length >= TRAJECTORY_MIN_ATTEMPTS
    sections.push({
      sectionId,
      sectionName: sectionName(sectionId),
      points,
      first,
      latest,
      best: Math.max(...points.map((p) => p.percent)),
      direction: enough ? directionFor(first, latest) : null,
      changePoints: enough ? latest - first : null,
      band: bandFor(latest),
      attempts: points.length,
    })
  }

  // Sections with a direction lead: that is the story. Then most-attempted, then
  // by name so the order is stable between renders.
  sections.sort(
    (a, b) =>
      Number(b.direction !== null) - Number(a.direction !== null) ||
      b.attempts - a.attempts ||
      a.sectionName.localeCompare(b.sectionName),
  )

  return {
    moduleId: module.id,
    moduleName: module.name,
    sections,
    hasDirection: sections.some((s) => s.direction !== null),
  }
}

/**
 * Trajectories for every module the child is ENTITLED to, in the given module
 * order. A test with no entitlement produces nothing at all: no card, no locked
 * placeholder, no teaser. A parent should not see an HSPT row for a child who is
 * not doing the HSPT.
 */
export function buildTrajectories(
  modules: PrepModule[],
  entitledModuleIds: Set<string>,
  attempts: HistoryAttemptInput[],
): ModuleTrajectory[] {
  return modules
    .filter((m) => entitledModuleIds.has(m.id))
    .map((m) => buildModuleTrajectory(m, attempts))
    .filter((t) => t.sections.length > 0)
}

/** Plain-language summary of one section, used verbatim by the UI. */
export function trajectorySummary(s: SectionTrajectory, firstName: string): string {
  if (s.direction === null) {
    return `One attempt so far, at ${s.latest}%. Take another to see which way it is going.`
  }
  const points = Math.abs(s.changePoints ?? 0)
  if (s.direction === 'up') {
    return `Up ${points} points, from ${s.first}% to ${s.latest}%.`
  }
  if (s.direction === 'down') {
    return `Down ${points} points, from ${s.first}% to ${s.latest}%. Worth a look together.`
  }
  return `Holding steady around ${s.latest}%. ${firstName} has taken ${s.attempts} attempts.`
}
