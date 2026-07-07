import { fetchPracticeQuestions, type PracticeQuestion } from '@/lib/questions'
import { gradeBand } from '@/lib/gradeBand'
import type { Student } from '@/lib/students'

/**
 * Practice SAT — Phase 1 (HIGH SCHOOL ONLY, Math-only).
 *
 * A shortened, deferred-scored practice Math section assembled entirely from our
 * own authored bank (published `generated_questions`) via the SAME serve path
 * normal practice uses — never real-SAT text. Read-only: no mastery or
 * question_attempts writes (that's Phase 2). The Reading & Writing section is
 * intentionally NOT built yet: the bank has zero reading-comprehension items, so
 * shipping an "R&W" section would misrepresent the test (that's Phase 3).
 */

// The three HS math skills the Math section draws from (all SAT-aligned, ~20
// published items each).
export const SAT_MATH_SKILLS = ['algebra-2', 'advanced-functions', 'hs-geometry'] as const

/** Target length of the practice Math section (bank supports ~60). */
export const PRACTICE_SAT_MATH_LENGTH = 12

/**
 * Gate: only grades 9–12 AND families who've consented to SAT / above-grade
 * framing (`above_grade_ok`) may see or take the Practice SAT. Anyone failing
 * either check is hidden from the entry and redirected away from the route.
 */
export function canTakePracticeSat(student: Pick<Student, 'grade' | 'above_grade_ok'>): boolean {
  return gradeBand(student.grade) === '9-12' && student.above_grade_ok === true
}

function shuffle<T>(arr: T[]): T[] {
  const a = [...arr]
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[a[i], a[j]] = [a[j], a[i]]
  }
  return a
}

/** Interleave per-skill groups round-robin so the section is balanced across skills. */
function roundRobin<T>(groups: T[][]): T[] {
  const out: T[] = []
  const max = Math.max(0, ...groups.map((g) => g.length))
  for (let i = 0; i < max; i++) {
    for (const g of groups) if (i < g.length) out.push(g[i])
  }
  return out
}

/**
 * Assemble the practice Math section: pull published items from each HS math
 * skill (each already shuffled by the serve path), balance across skills, then
 * shuffle the final order and trim to `length`. Best-effort — returns whatever
 * the bank can supply (possibly fewer than `length`, or [] if nothing is ready).
 */
export async function assembleMathSection(length = PRACTICE_SAT_MATH_LENGTH): Promise<PracticeQuestion[]> {
  const perSkill = await Promise.all(SAT_MATH_SKILLS.map((slug) => fetchPracticeQuestions(slug, length)))
  const balanced = roundRobin(perSkill).slice(0, length)
  return shuffle(balanced)
}
