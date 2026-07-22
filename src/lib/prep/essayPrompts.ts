/**
 * ISEE-style practice-essay prompt bank.
 *
 * The ISEE essay is UNSCORED and sent to the schools the student applies to, so it
 * is a personal/expository writing sample, never a persuasive-argumentative one.
 * These prompts are all personal-reflective or expository — the kind ISEE actually
 * uses ("describe a time…", "write about someone you admire…") — and deliberately
 * avoid persuasive or controversial topics inappropriate for a 6-8 grader.
 *
 * Selection is deterministic per student and avoids repeats (pickEssayPrompt),
 * so a child cycles through the whole bank before seeing one again, and the same
 * student always gets the same next prompt for the same history.
 */

export interface EssayPrompt {
  /** Stable id stored on prep_essay_attempts.prompt_id. Never renumber. */
  id: string
  text: string
}

export const ESSAY_PROMPTS: EssayPrompt[] = [
  { id: 'accomplishment-proud', text: 'Describe an accomplishment you are proud of. What did you do, and why does it matter to you?' },
  { id: 'admire-person', text: 'Write about a person you admire. What qualities do they have that you would like to develop in yourself?' },
  { id: 'favorite-place', text: 'Describe a place where you feel completely comfortable. What makes it special to you?' },
  { id: 'learned-mistake', text: 'Think of a time you made a mistake and learned something from it. What happened, and what did you learn?' },
  { id: 'perfect-day', text: 'Describe your idea of a perfect day from start to finish. Explain why each part matters to you.' },
  { id: 'helped-someone', text: 'Write about a time you helped someone. What did you do, and how did it make you feel?' },
  { id: 'new-skill', text: 'Describe a skill or hobby you would like to learn. Why does it interest you, and how would you begin?' },
  { id: 'family-tradition', text: 'Write about a tradition your family or community shares. Describe it and explain why it is important to you.' },
  { id: 'changed-mind', text: 'Describe a time you changed your mind about something. What made you see it differently?' },
  { id: 'challenge-overcame', text: 'Write about a challenge you faced and how you worked through it.' },
  { id: 'mentor-influence', text: 'Describe a teacher, coach, or mentor who made a difference for you. What did they teach you?' },
  { id: 'story-stayed', text: 'Write about a book, story, or movie that stayed with you. What was it about, and why did it matter to you?' },
  { id: 'time-to-visit', text: 'If you could visit any time period, past or future, which would you choose and why? Describe what you would want to see.' },
  { id: 'helpful-invention', text: 'If you could invent something to make everyday life better, what would it be? Describe how it would work and who it would help.' },
  { id: 'kindness-received', text: 'Describe a time someone was kind to you. What did they do, and how did it affect you?' },
  { id: 'appreciate-community', text: 'Write about something you appreciate in your neighborhood, town, or school community.' },
  { id: 'goal-this-year', text: 'Describe one goal you have for this year. Why did you choose it, and what steps will you take to reach it?' },
  { id: 'memorable-day', text: 'Write about a day you will always remember. Describe what happened and why it stayed with you.' },
  { id: 'teach-a-class', text: 'If you could teach a class on any topic, what would it be? Describe what you would want your students to learn.' },
  { id: 'outdoors-experience', text: 'Describe an experience you had outdoors or in nature. What did you notice, and how did you feel?' },
  { id: 'quality-matters', text: 'Which personal quality — such as honesty, kindness, or determination — matters most to you, and why? Use an example from your own life.' },
  { id: 'tried-something-new', text: 'Write about a time you tried something new. What was it like, and what did you discover?' },
  { id: 'someone-dependable', text: 'Describe a person in your life you can always count on. What makes them so dependable?' },
  { id: 'future-self', text: 'Imagine yourself ten years from now. Describe the kind of person you hope to be and how you might get there.' },
]

const PROMPT_BY_ID = new Map(ESSAY_PROMPTS.map((p) => [p.id, p]))

/** Look up a prompt by id; falls back to the first prompt if the id is unknown
 *  (e.g. a retired id on an old attempt) so a review screen never renders blank. */
export function essayPromptById(id: string | null | undefined): EssayPrompt {
  return (id && PROMPT_BY_ID.get(id)) || ESSAY_PROMPTS[0]
}

// Stable string hash (djb2) — same seed always yields the same order.
function hash(seed: string): number {
  let h = 5381
  for (let i = 0; i < seed.length; i++) h = ((h << 5) + h + seed.charCodeAt(i)) >>> 0
  return h
}

/**
 * Deterministic per-student prompt order: the bank permuted by hash(studentId:id).
 * Same student -> same order every time, but different students get different
 * rotations (no shared "everyone starts with prompt 1").
 */
function studentOrder(studentId: string): EssayPrompt[] {
  return [...ESSAY_PROMPTS].sort((a, b) => hash(`${studentId}:${a.id}`) - hash(`${studentId}:${b.id}`))
}

/**
 * Pick the next essay prompt for a student, avoiding repeats. Walks the student's
 * stable rotation and returns the first prompt they have not used yet; once the
 * whole bank has been used, it cycles deterministically (never repeating the most
 * recent) rather than getting stuck.
 */
export function pickEssayPrompt(studentId: string, usedPromptIds: string[]): EssayPrompt {
  const order = studentOrder(studentId)
  const used = new Set(usedPromptIds)
  const fresh = order.find((p) => !used.has(p.id))
  if (fresh) return fresh
  // All used at least once: continue the rotation by count so it keeps moving.
  return order[usedPromptIds.length % order.length]
}
