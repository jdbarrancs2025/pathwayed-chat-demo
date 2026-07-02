/**
 * Grammar question engine — a NEW template kind: a CURATED SENTENCE POOL.
 *
 * Math questions are generated from formulas; grammar can't be, so each grammar
 * item is an ORIGINAL, hand-authored short passage in digital-SAT Reading &
 * Writing "Standard English Conventions" style — a 1-2 sentence context with ONE
 * conventions choice to make (a blank filled by four options), NOT an isolated
 * fill-in-the-blank. Every sentence and option is written from scratch to the
 * public SAT format/skill spec: no real SAT or prep-company item is copied,
 * reworded, or paraphrased.
 *
 * Each item carries: one correct option, three distractors each tagged with a
 * DISTINCT misconception token (with matching misconceptions.ts entries so the
 * Stage-4 explanations work exactly like math), and a difficulty level. The pool
 * is served through the SAME generated_questions path as math (build-grammar-
 * seeds.ts emits rows), so grammar skills appear in "Show what you know" and
 * score/mastery identically.
 */

export type Difficulty = 'easy' | 'medium' | 'hard'

export interface GrammarChoice {
  text: string
  is_correct: boolean
  misconception_token?: string // present on wrong choices; kebab-case, ^[a-z][a-z0-9-]*$
}

export interface GrammarItem {
  slot: number // stable id key within a skill (1..N) — deterministic + idempotent
  difficulty: Difficulty
  stem: string // the SAT-style passage with the conventions choice point (a blank)
  choices: GrammarChoice[] // exactly one correct + 3 distinct-token distractors
  solution: string // brief, kid-appropriate rule explanation for the correct answer
}

export interface GrammarTemplate {
  code: string // stable idempotency key, e.g. 'grammar-subject-verb-agreement'
  skillSlug: string
  satAlignment: string
  kind: 'curated_pool'
  items: GrammarItem[]
}

// Subject-verb agreement: number agreement across intervening phrases, collective
// nouns, indefinite pronouns, and compound subjects. Distractors: matched the
// nearby noun, wrong number, a non-finite (-ing) form, or an infinitive.
const SUBJECT_VERB_AGREEMENT: GrammarTemplate = {
  code: 'grammar-subject-verb-agreement',
  skillSlug: 'subject-verb-agreement',
  satAlignment: 'standard-english-conventions',
  kind: 'curated_pool',
  items: [
    {
      slot: 1,
      difficulty: 'medium',
      stem: 'Dr. Elena Ruiz, along with her team of graduate students, ______ the coral reefs off the coast every summer.',
      choices: [
        { text: 'surveys', is_correct: true },
        { text: 'survey', is_correct: false, misconception_token: 'agreed-with-nearby-noun' },
        { text: 'surveying', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'have surveyed', is_correct: false, misconception_token: 'plural-verb-for-singular' },
      ],
      solution:
        'The subject is the singular "Dr. Elena Ruiz." The phrase "along with her team of graduate students" does not change the subject, so the verb stays singular: "surveys."',
    },
    {
      slot: 2,
      difficulty: 'easy',
      stem: 'The committee ______ its final recommendations to the school board on Friday.',
      choices: [
        { text: 'presents', is_correct: true },
        { text: 'present', is_correct: false, misconception_token: 'treated-collective-as-plural' },
        { text: 'presenting', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'to present', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution:
        'A collective noun like "committee" acting as one unit takes a singular verb — and "its" confirms it — so "presents" is correct.',
    },
    {
      slot: 3,
      difficulty: 'medium',
      stem: 'Each of the volunteers ______ responsible for setting up one section of the exhibit.',
      choices: [
        { text: 'is', is_correct: true },
        { text: 'are', is_correct: false, misconception_token: 'agreed-with-nearby-noun' },
        { text: 'were', is_correct: false, misconception_token: 'plural-verb-for-singular' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution:
        'The subject is "Each," which is always singular, so it takes "is." The plural "volunteers" is just part of the phrase after it.',
    },
    {
      slot: 4,
      difficulty: 'hard',
      stem: 'Both the lead actor and the director ______ scheduled to attend the premiere on Saturday.',
      choices: [
        { text: 'are', is_correct: true },
        { text: 'is', is_correct: false, misconception_token: 'singular-for-compound-subject' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'to be', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution:
        'Two subjects joined by "both … and" form a compound (plural) subject, so the verb is the plural "are."',
    },
    {
      slot: 5,
      difficulty: 'easy',
      stem: "The stack of documents on the professor's desk ______ taller every week as new submissions arrive.",
      choices: [
        { text: 'grows', is_correct: true },
        { text: 'grow', is_correct: false, misconception_token: 'agreed-with-nearby-noun' },
        { text: 'growing', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'have grown', is_correct: false, misconception_token: 'plural-verb-for-singular' },
      ],
      solution:
        'The subject is the singular "stack," not "documents," so the verb is singular: "grows."',
    },
  ],
}

// Punctuation basics: commas (intro elements, series, before phrases), joining or
// separating clauses (period vs. comma splice vs. run-on vs. misused semicolon),
// unnecessary commas in a compound predicate, and correct end punctuation.
const PUNCTUATION_BASICS: GrammarTemplate = {
  code: 'grammar-punctuation-basics',
  skillSlug: 'punctuation-basics',
  satAlignment: 'standard-english-conventions',
  kind: 'curated_pool',
  items: [
    {
      slot: 1,
      difficulty: 'easy',
      stem: 'After the storm finally ______ volunteers began clearing fallen branches from the trail.',
      choices: [
        { text: 'passed, the', is_correct: true },
        { text: 'passed the', is_correct: false, misconception_token: 'missing-comma' },
        { text: 'passed; the', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'passed. The', is_correct: false, misconception_token: 'period-creates-fragment' },
      ],
      solution:
        'An introductory clause ("After the storm finally passed") is followed by a comma before the main clause.',
    },
    {
      slot: 2,
      difficulty: 'medium',
      stem: "The museum's new wing opened last ______ has already welcomed thousands of visitors.",
      choices: [
        { text: 'month. It', is_correct: true },
        { text: 'month, it', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'month it', is_correct: false, misconception_token: 'run-on' },
        { text: 'month; and it', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution:
        'These are two complete sentences, so a period separates them. A comma alone (comma splice) or no punctuation (run-on) would be incorrect.',
    },
    {
      slot: 3,
      difficulty: 'easy',
      stem: 'For the field trip, students should bring a ______ a water bottle, and comfortable walking shoes.',
      choices: [
        { text: 'notebook,', is_correct: true },
        { text: 'notebook', is_correct: false, misconception_token: 'missing-comma' },
        { text: 'notebook;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'notebook.', is_correct: false, misconception_token: 'period-creates-fragment' },
      ],
      solution:
        'Items in a simple list are separated by commas, so a comma follows "notebook."',
    },
    {
      slot: 4,
      difficulty: 'medium',
      stem: 'The marine biologist carefully recorded each ______ entered the data into her laptop that evening.',
      choices: [
        { text: 'measurement and', is_correct: true },
        { text: 'measurement, and', is_correct: false, misconception_token: 'unnecessary-comma' },
        { text: 'measurement; and', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'measurement. And', is_correct: false, misconception_token: 'period-creates-fragment' },
      ],
      solution:
        '"Recorded … and entered" is a compound predicate (two verbs, one subject), so no punctuation goes before "and."',
    },
    {
      slot: 5,
      difficulty: 'hard',
      stem: 'The students wondered whether the experiment would produce the same results a second ______',
      choices: [
        { text: 'time.', is_correct: true },
        { text: 'time?', is_correct: false, misconception_token: 'question-mark-for-indirect-question' },
        { text: 'time!', is_correct: false, misconception_token: 'exclamation-misuse' },
        { text: 'time', is_correct: false, misconception_token: 'missing-end-punctuation' },
      ],
      solution:
        'This sentence reports a question indirectly ("wondered whether …"); it is a statement, so it ends with a period, not a question mark.',
    },
  ],
}

export const GRAMMAR_TEMPLATES: GrammarTemplate[] = [SUBJECT_VERB_AGREEMENT, PUNCTUATION_BASICS]

// --- Deterministic build of a served question from a curated item ------------

function mulberry32(a: number): () => number {
  return function () {
    a |= 0
    a = (a + 0x6d2b79f5) | 0
    let t = Math.imul(a ^ (a >>> 15), 1 | a)
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296
  }
}

/** Stable per-slot seed so the choice order is fixed (idempotent re-seed). */
export function seedForSlot(slot: number): number {
  return Math.imul(slot, 0x9e3779b1) >>> 0
}

export interface BuiltGrammarQuestion {
  stem: string
  choices: GrammarChoice[]
  correct_answer: string
  solution: string
  difficulty: Difficulty
}

/**
 * Build the served question for one curated item: deterministically shuffle the
 * choices (so the correct answer isn't always in the same position) and pull the
 * correct option's text as correct_answer. Pure — same (item, seed) -> identical.
 */
export function buildGrammarQuestion(item: GrammarItem, seed: number): BuiltGrammarQuestion {
  const rng = mulberry32(seed >>> 0)
  const choices = [...item.choices]
  for (let i = choices.length - 1; i > 0; i--) {
    const j = Math.floor(rng() * (i + 1))
    ;[choices[i], choices[j]] = [choices[j], choices[i]]
  }
  const correct = choices.find((c) => c.is_correct)
  return {
    stem: item.stem,
    choices,
    correct_answer: correct ? correct.text : '',
    solution: item.solution,
    difficulty: item.difficulty,
  }
}
