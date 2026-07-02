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
  // Distractors cluster NEAR the answer so it can't be picked by size (the old
  // set was a magnitude ladder — a fixed 10x and 2x that made the answer always
  // the smallest). Because p is a multiple of 5 and n a multiple of 20, n/20 is
  // an integer 1-10, so (p±5)% of n lands exactly one 5-point step above/below
  // the answer (answer ± n/20) and is ALWAYS a distinct integer. The complement
  // ("% off" vs "% of") is the one conceptual trap; its size varies with p and it
  // only collides with the answer at p=50, where the backups fill in. Every token
  // stays a real, explainable misconception (used by the Stage-4 explanations).
  distractorSpec: [
    { formula: '(p + 5) * n / 100', misconception_token: 'overstated-the-percent' }, // answer + n/20 (a step high)
    { formula: '(p - 5) * n / 100', misconception_token: 'understated-the-percent' }, // answer - n/20 (a step low)
    { formula: 'n - p * n / 100', misconception_token: 'complement-instead-of-percent' }, // took p% OFF, not OF
    { formula: '(p + 10) * n / 100', misconception_token: 'overstated-the-percent' }, // backup for the p=50 collision
    { formula: 'p', misconception_token: 'answered-the-percent' }, // backup: gave the percent itself
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

// Grades 3-5: basic division facts. The quotient q and divisor b are drawn and
// the dividend a = b·q is derived, so a ÷ b is always a clean integer. Bridged to
// PSDA (seed 0002). Distractors stay near the answer (q±1) with one operation-
// confusion trap (subtracting instead of dividing); no magnitude ladder.
export const DIVISION_BASIC: MathTemplate = {
  code: 'division-basic-easy-v1',
  skillSlug: 'division',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'easy',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate: 'What is ${a} \\div {b}$?',
    slots: [
      { name: 'b', min: 2, max: 12 },
      { name: 'q', min: 2, max: 12 },
    ],
    derived: [{ name: 'a', formula: 'b * q' }],
    answerFormula: 'q',
    answerFormat: 'integer',
    solutionTemplate: '${a} \\div {b} = {answer}$, because ${b} \\times {answer} = {a}$.',
  },
  distractorSpec: [
    { formula: 'q + 1', misconception_token: 'quotient-too-high' }, // one too many (near)
    { formula: 'q - 1', misconception_token: 'quotient-too-low' }, // one too few (near)
    { formula: 'a - b', misconception_token: 'subtracted-instead-of-divided' }, // wrong operation
    { formula: 'q + 2', misconception_token: 'quotient-too-high' }, // backup
    { formula: 'b', misconception_token: 'answered-the-divisor' }, // backup
  ],
}

// Grades 3-5: a fraction OF a whole number. a/b is proper (a<b) and in LOWEST
// TERMS (gcd(a,b)=1), and n = b·k so a/b of n = a·k is always an integer. Bridged
// to PSDA. Every distractor carries a DISTINCT misconception token (so a question
// never ships two options with the same tag) and every distractor is nonzero (the
// low miss is a·(k-1) ≥ 1, never 0). The engine picks the first three that come out
// distinct-valued; the last two cover collisions (e.g. unit fractions, a=k).
export const FRACTION_OF_NUMBER: MathTemplate = {
  code: 'fraction-of-number-easy-v1',
  skillSlug: 'fractions',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'easy',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate: 'What is $\\frac{{a}}{{b}}$ of ${n}$?',
    slots: [
      { name: 'a', min: 1, max: 5 },
      { name: 'b', min: 2, max: 6 },
      { name: 'k', min: 2, max: 12 },
    ],
    derived: [{ name: 'n', formula: 'b * k' }],
    answerFormula: 'a * k',
    answerFormat: 'integer',
    constraints: ['a < b', 'gcd(a, b) == 1'],
    solutionTemplate:
      'One part is ${n} \\div {b} = {k}$, so $\\frac{{a}}{{b}}$ of ${n}$ is ${a} \\times {k} = {answer}$.',
  },
  distractorSpec: [
    { formula: '(a + 1) * k', misconception_token: 'numerator-too-high' }, // answer + k (near, high)
    { formula: 'a * (k - 1)', misconception_token: 'part-size-too-small' }, // answer - a (near, low, >=1)
    { formula: '(b - a) * k', misconception_token: 'used-the-other-part' }, // the complement fraction
    { formula: 'a * (k + 1)', misconception_token: 'part-size-too-big' }, // answer + a (near, high)
    { formula: 'n', misconception_token: 'answered-the-whole' }, // gave the whole amount
  ],
}

// Grades 3-5: area of a rectangle (L·W). Bridged to geometry-trigonometry. The
// headline distractor is the classic area/perimeter confusion (2(L+W)); the other
// two are one row/column off (near the answer). No magnitude ladder.
export const RECTANGLE_AREA: MathTemplate = {
  code: 'rectangle-area-easy-v1',
  skillSlug: 'geometry',
  satAlignment: 'geometry-trigonometry',
  difficulty: 'easy',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate: 'A rectangle is ${L}$ units long and ${W}$ units wide. What is its area, in square units?',
    slots: [
      { name: 'L', min: 2, max: 12 },
      { name: 'W', min: 2, max: 12 },
    ],
    answerFormula: 'L * W',
    answerFormat: 'integer',
    solutionTemplate: 'Area is length times width: ${L} \\times {W} = {answer}$ square units.',
  },
  distractorSpec: [
    { formula: 'L * W + L', misconception_token: 'miscounted-a-row' }, // one row too many (near)
    { formula: 'L * W - W', misconception_token: 'miscounted-a-column' }, // one column short (near)
    { formula: '2 * (L + W)', misconception_token: 'confused-area-perimeter' }, // gave the perimeter
    { formula: 'L + W', misconception_token: 'added-instead-of-multiplied' }, // backup
    { formula: 'L * W + W', misconception_token: 'miscounted-a-row' }, // backup
  ],
}

// Grades 6-8: scale a ratio. The ratio p:q is drawn coprime (gcd=1, lowest terms)
// and p!=q, and the given quantity red = p·m so the answer blue = q·m is an
// integer. The headline distractor is the classic inverted ratio; the rest are
// near (one scale-step off) plus the additive-thinking trap. Distinct tokens.
export const RATIO_SCALE: MathTemplate = {
  code: 'ratio-scale-medium-v1',
  skillSlug: 'ratios',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'medium',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate:
      'A bag has red and blue marbles in the ratio ${p} : {q}$. If there are ${red}$ red marbles, how many blue marbles are there?',
    slots: [
      { name: 'p', min: 1, max: 6 },
      { name: 'q', min: 1, max: 6 },
      { name: 'm', min: 2, max: 10 },
    ],
    derived: [{ name: 'red', formula: 'p * m' }],
    answerFormula: 'q * m',
    answerFormat: 'integer',
    constraints: ['gcd(p, q) == 1', 'p != q'],
    solutionTemplate:
      'There are ${red} \\div {p} = {m}$ equal groups, so the blue marbles are ${q} \\times {m} = {answer}$.',
  },
  distractorSpec: [
    { formula: 'p * m', misconception_token: 'inverted-the-ratio' }, // used red's part (p!=q -> != answer)
    { formula: 'q * (m + 1)', misconception_token: 'ratio-scaled-too-far' }, // answer + q (near, high)
    { formula: 'q * (m - 1)', misconception_token: 'ratio-scaled-too-short' }, // answer - q (near, low, >=1)
    { formula: 'p * m + (q - p)', misconception_token: 'added-instead-of-scaled' }, // additive thinking
    { formula: 'q', misconception_token: 'answered-the-ratio-part' }, // the bare ratio number
  ],
}

// Grades 6-8: a proportion / unit-rate problem. a boxes hold total = u·a books, so
// b boxes hold u·b. a!=b so it is a real scaling. Distractors: one step off the
// scale (near), the additive trap, the original total, and the bare unit rate.
export const PROPORTION_SCALE: MathTemplate = {
  code: 'proportion-scale-medium-v1',
  skillSlug: 'proportional-reasoning',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'medium',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate: '${a}$ identical boxes hold ${total}$ books in all. How many books do ${b}$ boxes hold?',
    slots: [
      { name: 'u', min: 2, max: 9 },
      { name: 'a', min: 2, max: 8 },
      { name: 'b', min: 2, max: 12 },
    ],
    derived: [{ name: 'total', formula: 'u * a' }],
    answerFormula: 'u * b',
    answerFormat: 'integer',
    constraints: ['a != b'],
    solutionTemplate:
      'Each box holds ${total} \\div {a} = {u}$ books, so ${b}$ boxes hold ${u} \\times {b} = {answer}$ books.',
  },
  distractorSpec: [
    { formula: 'u * (b + 1)', misconception_token: 'rate-scaled-too-far' }, // answer + u (near, high)
    { formula: 'u * (b - 1)', misconception_token: 'rate-scaled-too-short' }, // answer - u (near, low, >=2)
    { formula: 'total', misconception_token: 'answered-the-total' }, // gave the starting total (a!=b -> != answer)
    { formula: 'total + (b - a)', misconception_token: 'added-instead-of-scaled' }, // additive thinking
    { formula: 'u', misconception_token: 'answered-the-unit-rate' }, // gave books-per-box
  ],
}

// Grades 6-8: the mean of a dataset, given as total over count. total = n·q so the
// mean q is an integer. Distractors: mean +-1 (near) and the undivided total (far);
// backups cover the wrong-operation and count-as-answer slips. Distinct tokens.
export const MEAN_FROM_TOTAL: MathTemplate = {
  code: 'mean-from-total-medium-v1',
  skillSlug: 'data-analysis',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'medium',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate: 'A team scored ${total}$ points in ${n}$ games. What was the mean (average) number of points per game?',
    slots: [
      { name: 'n', min: 3, max: 8 },
      { name: 'q', min: 5, max: 30 },
    ],
    derived: [{ name: 'total', formula: 'n * q' }],
    answerFormula: 'q',
    answerFormat: 'integer',
    solutionTemplate: 'The mean is the total shared equally: ${total} \\div {n} = {answer}$ points per game.',
  },
  distractorSpec: [
    { formula: 'q + 1', misconception_token: 'mean-too-high' }, // near, high
    { formula: 'q - 1', misconception_token: 'mean-too-low' }, // near, low (q>=5, >0)
    { formula: 'total', misconception_token: 'forgot-to-divide-total' }, // gave the total, not the mean
    { formula: 'total - n', misconception_token: 'subtracted-instead-of-divided' }, // backup: wrong operation
    { formula: 'n', misconception_token: 'answered-the-count' }, // backup: gave the number of games
  ],
}

export const MATH_TEMPLATES: MathTemplate[] = [
  LINEAR_EQUATION_SOLVE,
  PERCENT_OF,
  MULTIPLICATION_BASIC,
  DIVISION_BASIC,
  FRACTION_OF_NUMBER,
  RECTANGLE_AREA,
  RATIO_SCALE,
  PROPORTION_SCALE,
  MEAN_FROM_TOTAL,
]

// Questions cached per template (deterministic seeds 1..N).
export const QUESTIONS_PER_TEMPLATE = 20
