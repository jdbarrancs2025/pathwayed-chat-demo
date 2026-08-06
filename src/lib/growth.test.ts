import { describe, it, expect } from 'vitest'
import {
  buildGrowth,
  buildMilestones,
  buildWeeks,
  directionOver,
  growthCopy,
  milestoneLabel,
  shortDate,
  undatedNote,
  weekLabel,
  weekStart,
  localKey,
  GROWTH_MIN_WEEKS,
  GROWTH_MIN_ATTEMPTS,
  GROWTH_WINDOW_WEEKS,
  type GrowthAttempt,
  type MilestoneSkill,
} from './growth'

/** A local date, so the tests read in the same timezone the buckets use. */
const at = (y: number, m: number, d: number, h = 12) => new Date(y, m - 1, d, h).toISOString()

const att = (skillId: string, isCorrect: boolean, createdAt: string): GrowthAttempt => ({
  skillId,
  isCorrect,
  createdAt,
})

/** n attempts on one day, `correct` of them right. */
const day = (skillId: string, iso: string, n: number, correct: number): GrowthAttempt[] =>
  Array.from({ length: n }, (_, i) => att(skillId, i < correct, iso))

describe('week arithmetic', () => {
  it('buckets to the local Monday', () => {
    // 2026-07-02 is a Thursday; its week starts Monday 2026-06-29.
    expect(localKey(weekStart(new Date(2026, 6, 2)))).toBe('2026-06-29')
    // Sunday belongs to the week that just ended, not the one starting tomorrow.
    expect(localKey(weekStart(new Date(2026, 6, 5)))).toBe('2026-06-29')
    expect(localKey(weekStart(new Date(2026, 6, 6)))).toBe('2026-07-06')
  })

  it('a Monday is its own week start', () => {
    expect(localKey(weekStart(new Date(2026, 5, 29)))).toBe('2026-06-29')
  })
})

describe('buildWeeks', () => {
  const now = new Date(2026, 6, 22) // Wednesday, week of 2026-07-20

  it('keeps EMPTY weeks inside the window so a stop is visible', () => {
    const attempts = [...day('a', at(2026, 6, 29), 4, 3), ...day('a', at(2026, 7, 20), 4, 4)]
    const weeks = buildWeeks(attempts, now)
    expect(weeks.map((w) => w.start)).toEqual([
      '2026-06-29',
      '2026-07-06',
      '2026-07-13',
      '2026-07-20',
    ])
    expect(weeks[1].attempts).toBe(0)
    expect(weeks[3].attempts).toBe(4)
  })

  it('an empty week has a NULL percent, never zero', () => {
    // Zero would read as "got everything wrong" for a week nobody practiced.
    const weeks = buildWeeks(day('a', at(2026, 6, 29), 4, 3), now)
    expect(weeks[0].percent).toBe(75)
    expect(weeks[1].percent).toBeNull()
    expect(weeks[1].correct).toBe(0)
  })

  it('trims weeks before the child ever practiced', () => {
    const weeks = buildWeeks(day('a', at(2026, 7, 20), 3, 2), now)
    expect(weeks).toHaveLength(1)
    expect(weeks[0].start).toBe('2026-07-20')
  })

  it('shows at most the window, ending at the current week', () => {
    const attempts = Array.from({ length: 20 }, (_, i) =>
      att('a', true, new Date(2026, 2, 2 + i * 7, 12).toISOString()),
    )
    const weeks = buildWeeks(attempts, now)
    expect(weeks).toHaveLength(GROWTH_WINDOW_WEEKS)
    expect(weeks[weeks.length - 1].start).toBe('2026-07-20')
  })

  it('counts distinct skills per week', () => {
    const attempts = [
      ...day('a', at(2026, 6, 29), 2, 2),
      ...day('b', at(2026, 6, 30), 2, 1),
      ...day('a', at(2026, 7, 1), 2, 2),
    ]
    expect(buildWeeks(attempts, now)[0].skills).toBe(2)
  })

  it('no attempts means no series at all', () => {
    expect(buildWeeks([], now)).toEqual([])
  })
})

describe('directionOver', () => {
  const week = (start: string, attempts: number, correct: number) => ({
    start,
    attempts,
    correct,
    percent: attempts ? Math.round((100 * correct) / attempts) : null,
    skills: 1,
  })

  it('pools each half rather than comparing single weeks', () => {
    // Early half 10/20 = 50%, late half 17/20 = 85%.
    const d = directionOver([
      week('2026-06-01', 10, 5),
      week('2026-06-08', 10, 5),
      week('2026-06-15', 10, 8),
      week('2026-06-22', 10, 9),
    ])
    expect(d.earlyPercent).toBe(50)
    expect(d.latePercent).toBe(85)
    expect(d.direction).toBe('up')
    expect(d.changePoints).toBe(35)
  })

  it('a change inside the flat band is not movement', () => {
    // 16/24 = 67% then 17/24 = 71%: four points, which is week-to-week noise.
    const d = directionOver([
      week('2026-06-01', 12, 8),
      week('2026-06-08', 12, 8),
      week('2026-06-15', 12, 8),
      week('2026-06-22', 12, 9),
    ])
    expect(d.direction).toBe('flat')
    expect(d.changePoints).toBe(4)
  })

  it('reports a real decline rather than softening it', () => {
    const d = directionOver([
      week('2026-06-01', 10, 9),
      week('2026-06-08', 10, 9),
      week('2026-06-15', 10, 5),
      week('2026-06-22', 10, 5),
    ])
    expect(d.direction).toBe('down')
    expect(d.changePoints).toBe(-40)
  })

  it('refuses a direction when a half is too thin', () => {
    const d = directionOver([
      week('2026-06-01', 2, 0),
      week('2026-06-08', 2, 0),
      week('2026-06-15', 20, 20),
      week('2026-06-22', 20, 20),
    ])
    expect(d.direction).toBeNull()
    expect(d.changePoints).toBeNull()
    // The measured halves are still reported; only the CLAIM is withheld.
    expect(d.earlyPercent).toBe(0)
    expect(d.latePercent).toBe(100)
  })

  it('gives the middle week to the LATER half on an odd count', () => {
    // 3 weeks: early = week 1 only, late = weeks 2 and 3.
    const d = directionOver([
      week('2026-06-01', 10, 5),
      week('2026-06-08', 10, 9),
      week('2026-06-15', 10, 9),
    ])
    expect(d.earlyPercent).toBe(50)
    expect(d.latePercent).toBe(90)
  })

  it('one week cannot produce a direction', () => {
    expect(directionOver([week('2026-06-01', 30, 30)]).direction).toBeNull()
  })
})

describe('buildMilestones', () => {
  const skills: MilestoneSkill[] = [
    { skillId: 'a', name: 'Multiplication', subject: 'math', status: 'advanced' },
    { skillId: 'b', name: 'Main Idea', subject: 'reading', status: 'practicing' },
  ]

  it('dates the clear by the ATTEMPT that met the bar', () => {
    // 5 attempts, all correct: the bar is met on the 5th, which was Jul 2.
    const attempts = [
      att('a', true, at(2026, 6, 30)),
      att('a', true, at(2026, 6, 30)),
      att('a', true, at(2026, 7, 1)),
      att('a', true, at(2026, 7, 1)),
      att('a', true, at(2026, 7, 2)),
      att('a', false, at(2026, 7, 10)),
    ]
    const { milestones } = buildMilestones(attempts, skills)
    expect(milestones).toHaveLength(1)
    expect(shortDate(milestones[0].date)).toBe('Jul 2')
  })

  it('does not clear before the attempt floor, however perfect the start', () => {
    const attempts = [
      att('a', true, at(2026, 7, 1)),
      att('a', true, at(2026, 7, 1)),
      att('a', true, at(2026, 7, 1)),
      att('a', true, at(2026, 7, 1)),
    ]
    const { milestones, undatedCleared } = buildMilestones(attempts, skills)
    expect(milestones).toEqual([])
    expect(undatedCleared).toBe(1)
  })

  it('waits for accuracy to reach the bar, not just the count', () => {
    // 5 attempts at 40%, then enough right answers to cross 70%.
    const attempts = [
      att('a', true, at(2026, 7, 1)),
      att('a', true, at(2026, 7, 1)),
      att('a', false, at(2026, 7, 1)),
      att('a', false, at(2026, 7, 1)),
      att('a', false, at(2026, 7, 1)), // 5 attempts, 40%: not cleared
      att('a', true, at(2026, 7, 5)),
      att('a', true, at(2026, 7, 5)),
      att('a', true, at(2026, 7, 8)),
      att('a', true, at(2026, 7, 8)),
      att('a', true, at(2026, 7, 9)), // 10 attempts, 70%: cleared
    ]
    const { milestones } = buildMilestones(attempts, skills)
    expect(shortDate(milestones[0].date)).toBe('Jul 9')
  })

  it('ignores skills the engine does NOT currently call cleared', () => {
    // 'b' has a perfect run but is still 'practicing', so it is not a milestone.
    const attempts = day('b', at(2026, 7, 1), 8, 8)
    expect(buildMilestones(attempts, skills).milestones).toEqual([])
  })

  it('counts a cleared skill it cannot date instead of guessing one', () => {
    const { milestones, undatedCleared } = buildMilestones([], skills)
    expect(milestones).toEqual([])
    expect(undatedCleared).toBe(1)
  })

  it('orders newest first', () => {
    const many: MilestoneSkill[] = [
      { skillId: 'a', name: 'A', subject: 'math', status: 'advanced' },
      { skillId: 'c', name: 'C', subject: 'math', status: 'mastered' },
    ]
    const attempts = [...day('a', at(2026, 7, 1), 5, 5), ...day('c', at(2026, 7, 15), 5, 5)]
    const { milestones } = buildMilestones(attempts, many)
    expect(milestones.map((m) => m.skillName)).toEqual(['C', 'A'])
  })

  it('a mastered skill is a milestone too', () => {
    const mastered: MilestoneSkill[] = [
      { skillId: 'a', name: 'A', subject: 'math', status: 'mastered' },
    ]
    expect(buildMilestones(day('a', at(2026, 7, 1), 5, 5), mastered).milestones).toHaveLength(1)
  })
})

describe('buildGrowth gate', () => {
  const now = new Date(2026, 6, 22)
  const skills: MilestoneSkill[] = []

  it('holds the gate below the week floor however many questions', () => {
    const g = buildGrowth(day('a', at(2026, 7, 20), 60, 50), skills, now)
    expect(g.totalAttempts).toBe(60)
    expect(g.activeWeeks).toBe(1)
    expect(g.gateMet).toBe(false)
  })

  it('holds the gate below the attempt floor however many weeks', () => {
    const attempts = [
      ...day('a', at(2026, 6, 29), 2, 2),
      ...day('a', at(2026, 7, 6), 2, 2),
      ...day('a', at(2026, 7, 13), 2, 2),
      ...day('a', at(2026, 7, 20), 2, 2),
    ]
    const g = buildGrowth(attempts, skills, now)
    expect(g.activeWeeks).toBe(4)
    expect(g.totalAttempts).toBe(8)
    expect(g.gateMet).toBe(false)
  })

  it('opens when BOTH floors are met', () => {
    const attempts = [
      ...day('a', at(2026, 6, 29), 8, 4),
      ...day('a', at(2026, 7, 6), 8, 5),
      ...day('a', at(2026, 7, 13), 8, 7),
    ]
    const g = buildGrowth(attempts, skills, now)
    expect(g.activeWeeks).toBe(GROWTH_MIN_WEEKS)
    expect(g.totalAttempts).toBeGreaterThanOrEqual(GROWTH_MIN_ATTEMPTS)
    expect(g.gateMet).toBe(true)
  })

  it('counts active weeks across ALL history, not just the window', () => {
    // Two weeks long ago plus one recent: three real weeks of practice.
    const attempts = [
      ...day('a', new Date(2026, 0, 5, 12).toISOString(), 8, 6),
      ...day('a', new Date(2026, 0, 12, 12).toISOString(), 8, 6),
      ...day('a', at(2026, 7, 20), 8, 6),
    ]
    const g = buildGrowth(attempts, skills, now)
    expect(g.activeWeeks).toBe(3)
    expect(g.gateMet).toBe(true)
    // ...but the SERIES only shows the window.
    expect(g.weeks.length).toBeLessThanOrEqual(GROWTH_WINDOW_WEEKS)
  })
})

describe('copy', () => {
  const now = new Date(2026, 6, 22)

  it('the pre-gate line says exactly what is missing', () => {
    const g = buildGrowth(day('a', at(2026, 7, 20), 52, 21), [], now)
    const c = growthCopy(g, 'Peyton')
    expect(c.headline).toBe('Not enough practice yet to show growth.')
    expect(c.detail).toContain('practiced in 1 week')
    expect(c.detail).toContain('answered 52 questions')
    expect(c.detail).toContain(`${GROWTH_MIN_WEEKS} different weeks`)
    expect(c.detail).toContain(`${GROWTH_MIN_ATTEMPTS} questions`)
  })

  it('a child who has answered nothing is not told they practiced 0 weeks', () => {
    const c = growthCopy(buildGrowth([], [], now), 'Sam')
    expect(c.detail).toContain('has not answered any yet')
  })

  it('improvement is stated as arithmetic on two measured numbers', () => {
    const attempts = [
      ...day('a', at(2026, 6, 29), 10, 4),
      ...day('a', at(2026, 7, 6), 10, 4),
      ...day('a', at(2026, 7, 13), 10, 8),
      ...day('a', at(2026, 7, 20), 10, 8),
    ]
    const c = growthCopy(buildGrowth(attempts, [], now), 'Peyton')
    expect(c.headline).toBe('Improving, up 40 points, from 40% to 80% correct.')
    expect(c.detail).toBe('Peyton answered 40 questions across 4 weeks.')
  })

  it('a decline is reported, with the likely reason and no blame', () => {
    const attempts = [
      ...day('a', at(2026, 6, 29), 10, 9),
      ...day('a', at(2026, 7, 6), 10, 9),
      ...day('a', at(2026, 7, 13), 10, 5),
      ...day('a', at(2026, 7, 20), 10, 5),
    ]
    const c = growthCopy(buildGrowth(attempts, [], now), 'Peyton')
    expect(c.headline).toBe('Down 40 points, from 90% to 50% correct.')
    expect(c.detail).toContain('the work got harder')
  })

  it('never promises where the child will be next', () => {
    const attempts = [
      ...day('a', at(2026, 6, 29), 10, 4),
      ...day('a', at(2026, 7, 13), 10, 8),
      ...day('a', at(2026, 7, 20), 10, 8),
    ]
    const c = growthCopy(buildGrowth(attempts, [], now), 'Peyton')
    const text = `${c.headline} ${c.detail}`.toLowerCase()
    for (const word of ['will ', 'projected', 'on track', 'expect', 'by september', 'predict']) {
      expect(text).not.toContain(word)
    }
  })

  it('labels weeks and milestones in plain language', () => {
    const weeks = buildWeeks(day('a', at(2026, 6, 30), 3, 3), now)
    expect(weekLabel(weeks[0])).toBe('Week of Jun 29')
    expect(
      milestoneLabel({ skillId: 'a', skillName: 'Multiplication', subject: 'math', date: at(2026, 7, 2) }),
    ).toBe('Cleared Multiplication')
  })

  it('the undated note is absent when there is nothing to caveat', () => {
    const g = buildGrowth([], [], now)
    expect(undatedNote(g, 'Sam')).toBeNull()
  })

  it('the undated note counts, and does not date, what it cannot date', () => {
    const skills: MilestoneSkill[] = [
      { skillId: 'a', name: 'A', subject: 'math', status: 'advanced' },
      { skillId: 'b', name: 'B', subject: 'math', status: 'mastered' },
    ]
    const g = buildGrowth([], skills, now)
    // No dated milestone precedes it, so it does not say "more".
    expect(undatedNote(g, 'Sam')).toBe('Sam has cleared 2 skills that we cannot put a date on.')
  })

  it('says "more" only when dated milestones precede the note', () => {
    const skills: MilestoneSkill[] = [
      { skillId: 'a', name: 'A', subject: 'math', status: 'advanced' },
      { skillId: 'b', name: 'B', subject: 'math', status: 'advanced' },
    ]
    const g = buildGrowth(day('a', at(2026, 7, 1), 5, 5), skills, now)
    expect(g.milestones).toHaveLength(1)
    expect(undatedNote(g, 'Sam')).toBe('Sam has cleared 1 more skill that we cannot put a date on.')
  })
})

describe('the sources this panel must never read', () => {
  it('does not import mastery_percentage or mastery_snapshots', async () => {
    const { readFileSync } = await import('node:fs')
    const { join } = await import('node:path')
    const source = readFileSync(join(process.cwd(), 'src', 'lib', 'growth.ts'), 'utf8')
    // Comments stripped: the file EXPLAINS why it avoids these, and saying so is
    // not using them. Only real code is scanned.
    const code = source.replace(/\/\*[\s\S]*?\*\//g, '').replace(/\/\/.*$/gm, '')
    // The legacy self-rating ramp and the snapshot table are the two sources that
    // let the old dashboard claim progress nobody earned. Neither may appear here.
    expect(code).not.toContain('mastery_percentage')
    expect(code).not.toContain('mastery_snapshots')
    // Nor may the stamped columns, which are recompute times and not event dates.
    expect(code).not.toContain('first_bar_met_at')
    expect(code).not.toContain('recheck_passed_at')
  })
})
