import { gradeNum } from '@/lib/gradeLadder'
import type { SkillEvidence } from '@/lib/pickNextSkill'

/**
 * GRADE-LEVEL POSITION - which grade's skills a child has actually cleared.
 *
 * THIS IS NOT A GRADE-EQUIVALENT SCORE, and it must never become one. There is no
 * decimal, no extrapolation, no "reading at a 5.2 level". Grade-equivalent scores
 * are routinely misread as "my child can do fifth-grade work", which they do not
 * mean even when a test publishes them honestly.
 *
 * What this reports is a counted fact: at grade N, this child has cleared X of the
 * Y skills we publish. Cleared means the evidence engine says advanced or
 * mastered, which is at least 70% over at least 5 graded attempts. Nothing is
 * inferred about a grade whose skills the child has not cleared.
 */

/**
 * Cleared skills needed at a grade before we name it.
 *
 * One skill is a single topic and proves nothing about a grade. Two can both come
 * from the same strand in one sitting. Three forces breadth: published grades carry
 * roughly 6 to 9 math skills, so three is about a third of the grade's content and
 * cannot be collected in one afternoon on one topic. It is also reachable, since
 * the advance bar is 5 graded attempts, so three cleared skills is on the order of
 * 15 questions answered well.
 */
export const CLEARED_FOR_GRADE = 3

export interface GradeSkill {
  skill_id: string
  subject: string
  ccss_grade_num: number | null
}

export interface GradeTally {
  grade: number
  cleared: number
  published: number
}

export interface SubjectPosition {
  subject: string
  enrolledGrade: number
  /** Highest grade with CLEARED_FOR_GRADE or more cleared skills, else null. */
  workingGrade: number | null
  /** Counts at the working grade. Null when no grade qualifies. */
  atWorkingGrade: GradeTally | null
  /** Counts at the next grade up. `published: 0` means we publish nothing there. */
  nextGrade: GradeTally | null
  /** Best progress so far when no grade qualifies, for the honest empty state.
   *  Prefers a grade where the rule CAN be satisfied (see buildSubjectPosition). */
  bestSoFar: GradeTally | null
  /** Cleared skills across every grade in this subject. */
  totalCleared: number
  /**
   * Any grade in this subject publishes at least CLEARED_FOR_GRADE skills.
   *
   * False means the rule cannot be satisfied ANYWHERE in the subject, which is a
   * fact about our content and must never be phrased as a fact about the child.
   */
  anyNameableGrade: boolean
}

function isCleared(ev: SkillEvidence | undefined): boolean {
  return ev?.status === 'advanced' || ev?.status === 'mastered'
}

/** Per-grade cleared/published counts for one subject, lowest grade first. */
function tallyByGrade(
  skills: GradeSkill[],
  evidence: Map<string, SkillEvidence>,
  subject: string,
): GradeTally[] {
  const byGrade = new Map<number, GradeTally>()
  for (const s of skills) {
    if (s.subject !== subject || s.ccss_grade_num == null) continue
    const t = byGrade.get(s.ccss_grade_num) ?? { grade: s.ccss_grade_num, cleared: 0, published: 0 }
    t.published += 1
    if (isCleared(evidence.get(s.skill_id))) t.cleared += 1
    byGrade.set(s.ccss_grade_num, t)
  }
  return [...byGrade.values()].sort((a, b) => a.grade - b.grade)
}

export function buildSubjectPosition(
  subject: string,
  enrolledGrade: number,
  skills: GradeSkill[],
  evidence: Map<string, SkillEvidence>,
): SubjectPosition {
  const tallies = tallyByGrade(skills, evidence, subject)
  const qualifying = tallies.filter((t) => t.cleared >= CLEARED_FOR_GRADE)
  const atWorkingGrade = qualifying.length ? qualifying[qualifying.length - 1] : null
  const workingGrade = atWorkingGrade?.grade ?? null

  // The next grade up. A grade we publish nothing for still appears, with
  // published: 0, so the UI can say so rather than implying a failure to clear.
  const nextGrade =
    workingGrade == null
      ? null
      : (tallies.find((t) => t.grade === workingGrade + 1) ?? {
          grade: workingGrade + 1,
          cleared: 0,
          published: 0,
        })

  // Where they have got furthest, for the not-enough-yet state.
  //
  // A grade that publishes fewer than CLEARED_FOR_GRADE skills can NEVER qualify,
  // so pointing a parent at it produces an instruction nobody can follow ("cleared
  // 1 of the 1 grade 9 reading skills, 2 more and we will name it"). Prefer a
  // grade where the rule can actually be satisfied; fall back to the best of the
  // rest only so we can explain why it is stuck.
  const best = (list: GradeTally[]) =>
    list.reduce((a, b) =>
      b.cleared > a.cleared || (b.cleared === a.cleared && b.grade > a.grade) ? b : a,
    )
  const withProgress = tallies.filter((t) => t.cleared > 0)
  const nameableProgress = withProgress.filter((t) => t.published >= CLEARED_FOR_GRADE)
  const bestSoFar = nameableProgress.length
    ? best(nameableProgress)
    : withProgress.length
      ? best(withProgress)
      : null

  return {
    subject,
    enrolledGrade,
    workingGrade,
    atWorkingGrade,
    nextGrade,
    bestSoFar,
    totalCleared: tallies.reduce((n, t) => n + t.cleared, 0),
    anyNameableGrade: tallies.some((t) => t.published >= CLEARED_FOR_GRADE),
  }
}

export interface GradePositionInput {
  grade: string
  subjects: string[]
  skills: GradeSkill[]
  evidence: Map<string, SkillEvidence>
}

/** One position per subject that publishes any graded skill. */
export function buildGradePosition(input: GradePositionInput): SubjectPosition[] {
  const enrolled = gradeNum(input.grade)
  return input.subjects
    .filter((subject) => input.skills.some((s) => s.subject === subject && s.ccss_grade_num != null))
    .map((subject) => buildSubjectPosition(subject, enrolled, input.skills, input.evidence))
}

// ---------------------------------------------------------------------------
// COPY. Kept here, next to the rule, so the words and the maths cannot drift.
// ---------------------------------------------------------------------------

function gradeWord(n: number): string {
  return n === 0 ? 'kindergarten' : `grade ${n}`
}

/** "grade 7 math" reads better than "math grade 7". */
function gradeSubject(n: number, subjectLabel: string): string {
  return n === 0 ? `kindergarten ${subjectLabel}` : `grade ${n} ${subjectLabel}`
}

export interface PositionCopy {
  /** The counted fact. Always present. */
  headline: string
  /** How that sits against the grade the child is enrolled in. */
  context: string | null
  /** What is happening at the next grade up, and what we will do about it. */
  next: string | null
}

/**
 * What we will DO next, in the voice the retired placement panel used.
 *
 * Placement said "We'll close a few small math gaps, then keep moving forward"
 * and that sentence was the one thing it offered that a count does not: a plan.
 * The band it came from is gone (it read one diagnostic answer and then softened
 * itself against consent, which contradicted the counts above it), but the plan
 * survives, now chosen by the same counted evidence as everything else here.
 *
 * These are commitments about US, not claims about the child, so they promise
 * nothing we cannot show.
 */
function nextStep(p: SubjectPosition, subj: string): string {
  // A hole in our ladder. Never promise skills we do not publish.
  if (p.nextGrade && p.nextGrade.published === 0) {
    return `We'll keep practicing the ${subj} skills we publish while we add more.`
  }
  if (p.workingGrade == null || p.atWorkingGrade == null) {
    // Nothing to close when the grade is thin on OUR side: the plan is ours.
    if (!p.anyNameableGrade || (p.bestSoFar && p.bestSoFar.published < CLEARED_FOR_GRADE)) {
      return `We'll keep practicing the ${subj} skills we publish while we add more.`
    }
    return p.bestSoFar
      ? `We'll close a few small ${subj} gaps, then keep moving forward.`
      : `We'll start with the core ${subj} skills and build up from there.`
  }
  if (p.atWorkingGrade.grade > p.enrolledGrade) {
    return `We'll keep the ${subj} challenges coming.`
  }
  if (p.atWorkingGrade.grade < p.enrolledGrade) {
    return `We'll close a few small ${subj} gaps, then keep moving forward.`
  }
  // At the enrolled grade. Already reaching into the next one, or holding steady.
  return p.nextGrade && p.nextGrade.cleared > 0
    ? `We'll stretch into the next ${subj} skills.`
    : `We'll keep ${subj} moving right on track.`
}

/**
 * The exact words shown to a parent.
 *
 * Every sentence is a count or a comparison of counts. Nothing here claims the
 * child "can do" a grade's work, only that they have cleared a stated number of
 * that grade's skills.
 */
export function positionCopy(
  p: SubjectPosition,
  firstName: string,
  subjectLabel: string,
): PositionCopy {
  const subj = subjectLabel.toLowerCase()

  // NOT ENOUGH YET. We never name a grade here, and we never imply failure: the
  // honest reading of "fewer than 3 cleared" is that we have not seen enough.
  if (p.workingGrade == null || p.atWorkingGrade == null) {
    const b = p.bestSoFar
    // OUR GAP, NOT THEIRS. The only progress is at a grade too thin to ever
    // qualify, so asking for more there is asking for skills that do not exist.
    // Same voice as a hole in the ladder, and it still credits what was cleared.
    if (b && b.published < CLEARED_FOR_GRADE) {
      const all =
        b.cleared >= b.published
          ? b.published === 1
            ? `the only ${gradeSubject(b.grade, subj)} skill we publish`
            : `all ${b.published} of the ${gradeSubject(b.grade, subj)} skills we publish`
          : `${b.cleared} of the ${b.published} ${gradeSubject(b.grade, subj)} skills we publish`
      return {
        headline: `Not enough published yet in ${subj}.`,
        context: `${firstName} has cleared ${all}. We publish fewer than ${CLEARED_FOR_GRADE} skills at that grade, so we cannot name it however well ${firstName} does there. That is our gap to close.`,
        next: nextStep(p, subj),
      }
    }
    // Nothing cleared anywhere, and nowhere the rule could be satisfied even if
    // they cleared everything. Never phrase our content gap as their shortfall.
    if (!p.anyNameableGrade) {
      return {
        headline: `Not enough published yet in ${subj}.`,
        context: `We publish fewer than ${CLEARED_FOR_GRADE} skills at every ${subj} grade we cover, so there is no grade we can name yet. That is our gap to close, not ${firstName}'s.`,
        next: nextStep(p, subj),
      }
    }
    if (!b) {
      return {
        headline: `Not enough yet in ${subj}.`,
        context: `Once ${firstName} has cleared ${CLEARED_FOR_GRADE} skills at the same grade, we will show which grade those skills come from.`,
        next: nextStep(p, subj),
      }
    }
    const remaining = CLEARED_FOR_GRADE - b.cleared
    return {
      headline: `Not enough yet in ${subj}.`,
      context: `${firstName} has cleared ${b.cleared} of the ${b.published} ${gradeSubject(b.grade, subj)} skills. ${remaining} more at one grade and we will name it.`,
      next: nextStep(p, subj),
    }
  }

  const at = p.atWorkingGrade
  const headline = `${firstName} has cleared ${at.cleared} of the ${at.published} ${gradeSubject(at.grade, subj)} skills.`

  let context: string
  if (at.grade > p.enrolledGrade) {
    const ahead = at.grade - p.enrolledGrade
    context =
      ahead === 1
        ? `That is a grade above ${gradeWord(p.enrolledGrade)}, where ${firstName} is enrolled.`
        : `That is ${ahead} grades above ${gradeWord(p.enrolledGrade)}, where ${firstName} is enrolled.`
  } else if (at.grade === p.enrolledGrade) {
    context = `That is the grade ${firstName} is enrolled in.`
  } else {
    // Never framed as behind. It is the highest grade with enough evidence, which
    // is a statement about what we have measured, not about the child.
    context = `${firstName} is enrolled in ${gradeWord(p.enrolledGrade)}. This is the highest grade where we have enough evidence so far.`
  }

  // The counted fact about the next grade, then what we will do about it.
  let next: string | null = nextStep(p, subj)
  if (p.nextGrade) {
    const n = p.nextGrade
    let fact: string
    if (n.published === 0) {
      // The hole in the ladder. Say it about US, not about the child.
      fact = `We do not publish ${gradeSubject(n.grade, subj)} skills yet, so there is nothing to clear there.`
    } else if (n.cleared === 0) {
      fact = `Next up is ${gradeSubject(n.grade, subj)}, with ${n.published} skills to work through.`
    } else {
      fact = `${firstName} has also cleared ${n.cleared} of the ${n.published} ${gradeSubject(n.grade, subj)} skills.`
    }
    next = `${fact} ${next}`
  }

  return { headline, context, next }
}
