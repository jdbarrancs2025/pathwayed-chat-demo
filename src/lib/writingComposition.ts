/**
 * Writing-composition track (client side) — the LLM-coached writing studio,
 * distinct from the multiple-choice question bank. Owns the ORIGINAL writing
 * prompts shown to the student and the helpers the session uses to decide when a
 * skill is a composition lesson.
 *
 * PHASE 1 ships ONE skill: paragraph-writing. Keep COMPOSITION_SKILLS in sync
 * with api/writing-composition.ts (the server selects the coaching module by the
 * same slug). Prompts are original, written to the public SAT writing blueprint
 * (Expression of Ideas — topic sentence, support, organization), grade-appropriate,
 * and never lifted from College Board or any prep company.
 */

export const COMPOSITION_SKILLS = ['paragraph-writing'] as const

export function isCompositionSkill(slug: string | null | undefined): boolean {
  return !!slug && (COMPOSITION_SKILLS as readonly string[]).includes(slug)
}

/** Original paragraph-writing prompts (grade 3–5 seed of SAT Expression of Ideas:
 *  a topic sentence, two or three supports, and a sensible order). */
const PARAGRAPH_WRITING_PROMPTS: string[] = [
  'Think about a place you really enjoy — maybe a park, your own room, a relative’s house, or somewhere you’ve visited. Write a paragraph about it. Start with a sentence that tells what the place is, then give two or three reasons you like it.',
  'If you could add one new rule at your school, what would it be? Write a paragraph that tells your rule in the first sentence, then gives two or three reasons it would be a good idea.',
  'Think of something you know how to do well — a game, a recipe, a trick, or a chore. Write a paragraph that names it in the first sentence, then explains two or three things someone would need to know to do it too.',
]

const PROMPTS_BY_SKILL: Record<string, string[]> = {
  'paragraph-writing': PARAGRAPH_WRITING_PROMPTS,
}

/** Small stable hash (no Math.random) so the same student+skill always gets the
 *  same prompt across resumes, while different students vary. */
function stableIndex(key: string, mod: number): number {
  let h = 0
  for (let i = 0; i < key.length; i++) h = (h * 31 + key.charCodeAt(i)) >>> 0
  return mod > 0 ? h % mod : 0
}

/**
 * The writing prompt for a composition lesson, chosen deterministically from the
 * skill's pool by a stable key (e.g. the student id) so it's consistent between
 * the writing space and what Nikki coaches against. Returns '' for a non-
 * composition skill or one with no prompts.
 */
export function pickWritingPrompt(slug: string | null | undefined, seedKey: string): string {
  if (!slug) return ''
  const pool = PROMPTS_BY_SKILL[slug]
  if (!pool || pool.length === 0) return ''
  return pool[stableIndex(`${seedKey}:${slug}`, pool.length)]
}
