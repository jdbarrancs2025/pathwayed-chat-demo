import type { MathDistractorSpec, MathGenerationSpec } from '@/lib/questionGen'

/**
 * The starter MATH templates (Stage 2). Single source of truth: the SQL seeds
 * (seeds/0003_question_templates_math.sql, seeds/0004_generated_questions_math.sql)
 * are GENERATED from these constants by scripts/build-math-seeds.ts, so the
 * stored content can't drift from the generator's view of the spec.
 *
 * Both are ORIGINAL items from the public digital-SAT blueprint (solve a linear
 * equation; find a percent of a number) — no real/copyrighted SAT text.
 */

export type Difficulty = 'easy' | 'medium' | 'hard'

export interface MathTemplate {
  code: string // stable idempotency key (question_templates.code)
  skillSlug: string // resolved to skills.id in the seed
  satAlignment: string
  difficulty: Difficulty
  generationSpec: MathGenerationSpec
  distractorSpec: MathDistractorSpec
}

// Algebra: solve a·x + b = c for x. x (the answer) is drawn first and c is
// derived (c = a·x + b), so the answer is always a clean integer.
export const LINEAR_EQUATION_SOLVE: MathTemplate = {
  code: 'linear-equation-solve',
  skillSlug: 'linear-thinking',
  satAlignment: 'algebra',
  difficulty: 'easy',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate: 'If $\\,{a}x{±b} = {c}$, what is the value of $x$?',
    slots: [
      { name: 'a', min: 2, max: 9 },
      { name: 'x', min: -9, max: 9, exclude: [0] },
      { name: 'b', min: -9, max: 9, exclude: [0] },
    ],
    derived: [
      { name: 'c', formula: 'a*x + b' },
      { name: 'cMinusB', formula: 'c - b' },
    ],
    answerFormula: 'x',
    answerFormat: 'integer',
    constraints: ['a != 0'],
    solutionTemplate:
      'Start with $\\,{a}x{±b} = {c}$. Subtract the constant from both sides: $\\,{a}x = {cMinusB}$. Divide by ${a}$: $x = {answer}$.',
  },
  distractorSpec: [
    { formula: 'c - b', misconception_token: 'forgot-to-divide' }, // = a·x; never divided by the coefficient
    { formula: '-x', misconception_token: 'sign-error' },
    { formula: 'x + b', misconception_token: 'mishandled-constant' },
  ],
}

// Problem-Solving & Data Analysis: p% of n. p is a multiple of 5 and n a
// multiple of 20, so p·n/100 is always an integer.
export const PERCENT_OF: MathTemplate = {
  code: 'percent-of',
  skillSlug: 'percentages',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'easy',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate: 'What is ${p}\\%$ of ${n}$?',
    slots: [
      { name: 'p', min: 5, max: 90, step: 5 },
      { name: 'n', min: 20, max: 200, step: 20 },
    ],
    answerFormula: 'p * n / 100',
    answerFormat: 'integer',
    solutionTemplate: '${p}\\%$ of ${n}$ is $\\frac{{p}}{100} \\times {n} = {answer}$.',
  },
  // KNOWN STAGE-2 LIMITATION (magnitude guessability): these distractors are
  // fixed multiples of the answer — decimal-place-error is always exactly 10x
  // (so always the largest option) and halved-the-base always 2x. A student can
  // eliminate by magnitude without doing the math; real distractors cluster
  // nearer the answer. Leave functional for now; improve when we build smarter,
  // answer-relative distractor strategies (e.g. ±10–20%, near-miss arithmetic).
  distractorSpec: [
    { formula: 'p * n / 10', misconception_token: 'decimal-place-error' }, // 10x too big
    { formula: 'n - p * n / 100', misconception_token: 'complement-instead-of-percent' }, // "% off" vs "% of"
    { formula: 'p * n / 50', misconception_token: 'halved-the-base' }, // /50 instead of /100
    { formula: 'p', misconception_token: 'answered-the-percent' }, // backup pattern
  ],
}

// Grades 3-5: basic multiplication facts. The 'multiplication' skill is bridged
// to PSDA (seed 0002), so practicing this elementary skill feeds SAT readiness —
// useful for testing the full serve->score->mastery->readiness loop with a skill
// students practice early. Distractors are kept NEAR the answer (±a, ±b) so it
// isn't solvable by magnitude; a+b (added-instead-of-multiplied) is the one
// intentional operation-confusion trap, not a magnitude ladder.
export const MULTIPLICATION_BASIC: MathTemplate = {
  code: 'multiplication-basic-easy-v1',
  skillSlug: 'multiplication',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'easy',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate: 'What is ${a} \\times {b}$?',
    slots: [
      { name: 'a', min: 2, max: 12 },
      { name: 'b', min: 2, max: 12 },
    ],
    answerFormula: 'a * b',
    answerFormat: 'integer',
    solutionTemplate: '${a} \\times {b} = {answer}$.',
  },
  // Primary 3 (near the answer): one short group, one extra factor-group, and the
  // add-vs-multiply confusion. Backups cover the rare collision (e.g. a=b=2).
  distractorSpec: [
    { formula: 'a * b - a', misconception_token: 'skip-count-error' }, // = a*(b-1), one group short
    { formula: 'a * b + b', misconception_token: 'off-by-one-factor' }, // = (a+1)*b, one extra group
    { formula: 'a + b', misconception_token: 'added-instead-of-multiplied' },
    { formula: 'a * b + a', misconception_token: 'skip-count-error' }, // backup
    { formula: 'a * b - b', misconception_token: 'off-by-one-factor' }, // backup
  ],
}

export const MATH_TEMPLATES: MathTemplate[] = [LINEAR_EQUATION_SOLVE, PERCENT_OF, MULTIPLICATION_BASIC]

// Questions cached per template (deterministic seeds 1..N).
export const QUESTIONS_PER_TEMPLATE = 20
