import type { MathDistractorSpec, MathGenerationSpec } from '@/lib/questionGen'
import type { Difficulty } from '@/lib/difficultyRamp'

/**
 * PHASE 3, STEP 1 — real within-skill difficulty for four legacy math skills.
 *
 * WHY THESE FOUR. multiplication, fractions, percentages, and data-analysis are
 * four of the fifteen skills whose whole 20-item pool carries a single difficulty,
 * because their tag records where the skill sits on the grade staircase rather than
 * how hard the item is. Between them they hold 32 of the 52 real graded attempts in
 * production, so they are where a student actually feels the ramp.
 *
 * THE RULE THAT SHAPED EVERY TIER: harder means a HARDER TASK AT THE SAME GRADE,
 * never a bigger number borrowed from a later grade. A hard grade-3 multiplication
 * item is still grade 3. Concretely, the hard tiers move from recall to reasoning by
 * embedding the unknown, which is itself a grade-level standard:
 *
 *   multiplication  3.OA.A.4  determine the unknown in a multiplication equation
 *   fractions       3.NF      given a part, recover the whole
 *   percentages     6.RP.A.3.C  given a percent and a part, find the whole
 *   data-analysis   6.SP.B.5  work backwards from a mean to a missing value
 *
 * What we did NOT do: widen grade-3 multiplication to two-digit factors (that is
 * 4.NBT.B.5), or push percentages into compound interest. Operand ranges widen only
 * WITHIN what the grade's own standard allows.
 *
 * ADDITIVE ONLY. Every template code here ends -v3 and is new, so the deterministic
 * ids (sha1 of "code:slot") cannot collide with the v1 pool OR with the v2 pool that
 * is already published for multiplication. No existing row is updated, re-tagged, or
 * deleted, and every question_attempts row stays joinable. Seeded as DRAFT: nothing
 * is served until it is reviewed and published.
 *
 * WHY v3 RATHER THAN REGENERATING v2. Ids are sha1("code:slot"), so keeping the v2
 * codes while changing generation would rewrite live published rows in place. That
 * would silently re-label attempts as having been served content the student was
 * never actually given. A new code namespace is the only additive way to change what
 * a tier contains.
 */

export interface TieredMathTemplate {
  /** Stable idempotency key. The -v3 suffix keeps the id namespace distinct. */
  code: string
  skillSlug: string
  satAlignment: string
  difficulty: Difficulty
  /** How many cached questions to emit for this tier. */
  count: number
  /** The grade standard this tier sits on, quoted in the seed for review. */
  standard: string
  /**
   * Slot names that are INTERCHANGEABLE, so two draws whose values for them are the
   * same multiset are the same item wearing different clothes.
   *
   * Multiplication is commutative, so the pool held both "box x 3 = 27" and
   * "box x 9 = 27". Same two numbers, same product, no new thinking. With only 12
   * hard items that made the pool feel roughly half its size. Naming the slots here
   * lets the build script collapse those pairs.
   *
   * Deliberately NOT a generation-spec constraint: a constraint like a <= b would
   * force the hidden factor to always be the smaller one, which is a pattern a
   * student can exploit. This dedupes across items without biasing any item.
   */
  commutativeSlots?: string[]
  generationSpec: MathGenerationSpec
  distractorSpec: MathDistractorSpec
}

/** 48 per skill: 16 easy / 20 medium / 12 hard. */
export const TIER_COUNTS: Record<Difficulty, number> = { easy: 16, medium: 20, hard: 12 }

// ===========================================================================
// MULTIPLICATION — grade 3 (3.OA). Products stay within 100 at every tier.
// ===========================================================================

/** EASY: the friendly tables (2, 3, 4, 5, 10) taught first. Recall. */
const MULT_EASY: TieredMathTemplate = {
  code: 'multiplication-g3-easy-v3',
  skillSlug: 'multiplication',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'easy',
  count: TIER_COUNTS.easy,
  standard: '3.OA.C.7 - multiply within 100 (friendly factors)',
  commutativeSlots: ['a', 'b'],
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate: 'What is ${a} \\times {b}$?',
    slots: [
      // Tiers are split by PRODUCT SIZE, not by which factor is which, so easy and
      // medium are disjoint even after commuted pairs are collapsed. Splitting by
      // factor would have put 2 x 6 in easy and 6 x 2 in medium, which are the same
      // fact. Factors stay SINGLE DIGIT (10 included as the place-value friendly
      // one): 3.OA.C.7 is products of two one-digit numbers, within 100.
      { name: 'a', min: 2, max: 10 },
      { name: 'b', min: 2, max: 10 },
    ],
    answerFormula: 'a * b',
    answerFormat: 'integer',
    constraints: ['a * b <= 28'],
    solutionTemplate: '${a} \\times {b} = {answer}$.',
  },
  // Every entry carries a DISTINCT token, including the backups. The v1 template
  // reused a token on its backups, so a collision (a=b=2, or a=3 b=3, where
  // a+b equals a*b-a) could ship two options tagged the same way.
  distractorSpec: [
    { formula: 'a * b - a', misconception_token: 'skip-count-error' },
    { formula: 'a * b + b', misconception_token: 'off-by-one-factor' },
    { formula: 'a + b', misconception_token: 'added-instead-of-multiplied' },
    { formula: 'a * b + a', misconception_token: 'counted-an-extra-group' },
    { formula: 'a * b - b', misconception_token: 'missed-a-group' },
  ],
}

/** MEDIUM: the hard facts (6-9 times tables). Same standard, less friendly. */
const MULT_MEDIUM: TieredMathTemplate = {
  code: 'multiplication-g3-medium-v3',
  skillSlug: 'multiplication',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'medium',
  count: TIER_COUNTS.medium,
  standard: '3.OA.C.7 - multiply within 100 (the harder facts)',
  commutativeSlots: ['a', 'b'],
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate: 'What is ${a} \\times {b}$?',
    slots: [
      { name: 'a', min: 2, max: 10 },
      { name: 'b', min: 2, max: 10 },
    ],
    answerFormula: 'a * b',
    answerFormat: 'integer',
    // Strictly above the easy tier's ceiling and still within 100, so the two tiers
    // share no fact and neither leaves grade 3.
    constraints: ['a * b > 28', 'a * b <= 100'],
    solutionTemplate: '${a} \\times {b} = {answer}$.',
  },
  // Every entry carries a DISTINCT token, including the backups. The v1 template
  // reused a token on its backups, so a collision (a=b=2, or a=3 b=3, where
  // a+b equals a*b-a) could ship two options tagged the same way.
  distractorSpec: [
    { formula: 'a * b - a', misconception_token: 'skip-count-error' },
    { formula: 'a * b + b', misconception_token: 'off-by-one-factor' },
    { formula: 'a + b', misconception_token: 'added-instead-of-multiplied' },
    { formula: 'a * b + a', misconception_token: 'counted-an-extra-group' },
    { formula: 'a * b - b', misconception_token: 'missed-a-group' },
  ],
}

/**
 * HARD: the unknown is a FACTOR, not the product. Still single-digit factors and a
 * product within 100, so the arithmetic is grade 3; what is harder is that the
 * child must reason backwards instead of recalling forwards. This is 3.OA.A.4, a
 * grade-3 standard in its own right, NOT grade-4 work in disguise.
 */
const MULT_HARD: TieredMathTemplate = {
  code: 'multiplication-g3-hard-v3',
  skillSlug: 'multiplication',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'hard',
  count: TIER_COUNTS.hard,
  standard: '3.OA.A.4 - determine the unknown factor',
  commutativeSlots: ['a', 'b'],
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate: 'What number goes in the box? $\\square \\times {b} = {product}$',
    slots: [
      { name: 'a', min: 3, max: 10 },
      { name: 'b', min: 3, max: 10 },
    ],
    derived: [{ name: 'product', formula: 'a * b' }],
    answerFormula: 'a',
    answerFormat: 'integer',
    constraints: ['a * b <= 100'],
    solutionTemplate:
      'Ask how many ${b}$s make ${product}$: ${product} \\div {b} = {answer}$, and ${answer} \\times {b} = {product}$.',
  },
  distractorSpec: [
    { formula: 'product - b', misconception_token: 'subtracted-instead-of-divided' },
    { formula: 'a + 1', misconception_token: 'quotient-too-high' },
    { formula: 'a - 1', misconception_token: 'quotient-too-low' },
    { formula: 'product', misconception_token: 'answered-the-product' },
    { formula: 'b', misconception_token: 'answered-the-known-factor' },
  ],
}

// ===========================================================================
// FRACTIONS — grade 3 (3.NF). "A fraction of a whole number."
// ===========================================================================

/** EASY: UNIT fractions only (one part of b), small friendly wholes. */
const FRAC_EASY: TieredMathTemplate = {
  code: 'fraction-of-number-g3-easy-v3',
  skillSlug: 'fractions',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'easy',
  count: TIER_COUNTS.easy,
  standard: '3.NF.A.1 - one part of b equal parts',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate: 'What is $\\frac{1}{{b}}$ of ${n}$?',
    slots: [
      { name: 'b', min: 2, max: 4 },
      { name: 'k', min: 2, max: 8 },
    ],
    derived: [{ name: 'n', formula: 'b * k' }],
    answerFormula: 'k',
    answerFormat: 'integer',
    solutionTemplate: 'Split ${n}$ into ${b}$ equal parts: ${n} \\div {b} = {answer}$.',
  },
  distractorSpec: [
    { formula: 'k + 1', misconception_token: 'part-size-too-big' },
    { formula: 'k - 1', misconception_token: 'part-size-too-small' },
    { formula: 'n - b', misconception_token: 'subtracted-instead-of-divided' },
    { formula: 'n', misconception_token: 'answered-the-whole' },
    { formula: 'b', misconception_token: 'answered-the-denominator' },
  ],
}

/** MEDIUM: non-unit proper fractions in lowest terms, larger friendly wholes. */
const FRAC_MEDIUM: TieredMathTemplate = {
  code: 'fraction-of-number-g3-medium-v3',
  skillSlug: 'fractions',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'medium',
  count: TIER_COUNTS.medium,
  standard: '3.NF.A.1 - a parts of b equal parts',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate: 'What is $\\frac{{a}}{{b}}$ of ${n}$?',
    slots: [
      { name: 'a', min: 2, max: 5 },
      { name: 'b', min: 3, max: 6 },
      { name: 'k', min: 2, max: 10 },
    ],
    derived: [{ name: 'n', formula: 'b * k' }],
    answerFormula: 'a * k',
    answerFormat: 'integer',
    constraints: ['a < b', 'gcd(a, b) == 1'],
    solutionTemplate:
      'One part is ${n} \\div {b} = {k}$, so $\\frac{{a}}{{b}}$ of ${n}$ is ${a} \\times {k} = {answer}$.',
  },
  distractorSpec: [
    { formula: '(a + 1) * k', misconception_token: 'numerator-too-high' },
    { formula: 'a * (k - 1)', misconception_token: 'part-size-too-small' },
    { formula: '(b - a) * k', misconception_token: 'used-the-other-part' },
    { formula: 'a * (k + 1)', misconception_token: 'part-size-too-big' },
    { formula: 'n', misconception_token: 'answered-the-whole' },
  ],
}

/**
 * HARD: the WHOLE is unknown. The child is given a part and must recover the whole.
 * Same fractions, same size of numbers as the medium tier: what is harder is the
 * direction of the reasoning, not the arithmetic.
 */
const FRAC_HARD: TieredMathTemplate = {
  code: 'fraction-of-number-g3-hard-v3',
  skillSlug: 'fractions',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'hard',
  count: TIER_COUNTS.hard,
  standard: '3.NF.A.1 - recover the whole from a part',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate: '$\\frac{{a}}{{b}}$ of a number is ${part}$. What is the number?',
    slots: [
      { name: 'a', min: 2, max: 5 },
      { name: 'b', min: 3, max: 6 },
      { name: 'k', min: 2, max: 10 },
    ],
    derived: [
      { name: 'n', formula: 'b * k' },
      { name: 'part', formula: 'a * k' },
    ],
    answerFormula: 'n',
    answerFormat: 'integer',
    constraints: ['a < b', 'gcd(a, b) == 1'],
    solutionTemplate:
      'If ${a}$ parts are ${part}$, one part is ${part} \\div {a} = {k}$. The whole is ${b}$ parts: ${b} \\times {k} = {answer}$.',
  },
  // `part` is claimed EARLY and with its own token. It is the number printed in
  // the stem, so it must never be picked up later by a formula that happens to
  // equal it (n - k equals part whenever a = b - 1, which is most pairs) and be
  // mislabelled as a size error.
  distractorSpec: [
    { formula: 'part * b', misconception_token: 'scaled-the-part-not-the-unit' },
    { formula: 'k', misconception_token: 'answered-one-part' },
    { formula: 'part', misconception_token: 'answered-the-part' },
    { formula: 'part + b', misconception_token: 'added-instead-of-scaled' },
    { formula: 'n + k', misconception_token: 'part-size-too-big' },
  ],
}

// ===========================================================================
// PERCENTAGES — grade 6 (6.RP.A.3.C).
// ===========================================================================

/** EASY: benchmark percents only (10, 25, 50, 75) of friendly wholes. */
const PCT_EASY: TieredMathTemplate = {
  code: 'percent-of-g6-easy-v3',
  skillSlug: 'percentages',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'easy',
  count: TIER_COUNTS.easy,
  standard: '6.RP.A.3.C - a benchmark percent of a quantity',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    // p is drawn as a quarter-step (25, 50, 75) or the 10% benchmark via pSel.
    stemTemplate: 'What is ${p}\\%$ of ${n}$?',
    slots: [
      { name: 'p', min: 25, max: 75, step: 25 },
      { name: 'n', min: 20, max: 200, step: 20 },
    ],
    answerFormula: 'p * n / 100',
    answerFormat: 'integer',
    solutionTemplate: '${p}\\%$ of ${n}$ is $\\frac{{p}}{100} \\times {n} = {answer}$.',
  },
  // Steps of 10 rather than 25: a 25-point step below p=25 would produce a
  // distractor of ZERO, which is both a giveaway and not a real mistake. n is a
  // multiple of 20, so (p +/- 10)% of n is always a clean integer.
  distractorSpec: [
    { formula: '(p + 10) * n / 100', misconception_token: 'overstated-the-percent' },
    { formula: '(p - 10) * n / 100', misconception_token: 'understated-the-percent' },
    { formula: 'n - p * n / 100', misconception_token: 'complement-instead-of-percent' },
    { formula: 'p', misconception_token: 'answered-the-percent' },
    { formula: 'n', misconception_token: 'answered-the-whole' },
  ],
}

/** MEDIUM: any 5-point percent, the full friendly-whole range. */
const PCT_MEDIUM: TieredMathTemplate = {
  code: 'percent-of-g6-medium-v3',
  skillSlug: 'percentages',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'medium',
  count: TIER_COUNTS.medium,
  standard: '6.RP.A.3.C - any percent of a quantity',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate: 'What is ${p}\\%$ of ${n}$?',
    slots: [
      // Starts at 10, not 5: a 5-point step below p=5 would make the low
      // distractor exactly zero, which is a giveaway and not a real mistake.
      { name: 'p', min: 10, max: 95, step: 5 },
      { name: 'n', min: 20, max: 200, step: 20 },
    ],
    answerFormula: 'p * n / 100',
    answerFormat: 'integer',
    constraints: ['p != 50'],
    solutionTemplate: '${p}\\%$ of ${n}$ is $\\frac{{p}}{100} \\times {n} = {answer}$.',
  },
  distractorSpec: [
    { formula: '(p + 5) * n / 100', misconception_token: 'overstated-the-percent' },
    { formula: '(p - 5) * n / 100', misconception_token: 'understated-the-percent' },
    { formula: 'n - p * n / 100', misconception_token: 'complement-instead-of-percent' },
    { formula: '(p + 10) * n / 100', misconception_token: 'overstated-the-percent' },
    { formula: 'p', misconception_token: 'answered-the-percent' },
  ],
}

/**
 * HARD: given the PART and the percent, find the whole. Grade 6's own standard
 * names this case ("solve problems involving finding the whole, given a part and
 * the percent"), so it is harder reasoning at the same grade, not grade-7 work.
 */
const PCT_HARD: TieredMathTemplate = {
  code: 'percent-of-g6-hard-v3',
  skillSlug: 'percentages',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'hard',
  count: TIER_COUNTS.hard,
  standard: '6.RP.A.3.C - find the whole given a part and the percent',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate: '${part}$ is ${p}\\%$ of what number?',
    slots: [
      { name: 'p', min: 10, max: 80, step: 10 },
      { name: 'n', min: 20, max: 200, step: 20 },
    ],
    derived: [{ name: 'part', formula: 'p * n / 100' }],
    answerFormula: 'n',
    answerFormat: 'integer',
    constraints: ['p != 100'],
    solutionTemplate:
      '${p}\\%$ is $\\frac{{p}}{100}$ of the number, so the number is ${part} \\div \\frac{{p}}{100} = {answer}$.',
  },
  distractorSpec: [
    { formula: 'part * p / 100', misconception_token: 'took-the-percent-again' },
    { formula: 'part + p', misconception_token: 'added-instead-of-scaled' },
    { formula: 'part', misconception_token: 'answered-the-part' },
    { formula: 'n - part', misconception_token: 'complement-instead-of-percent' },
    { formula: 'n + part', misconception_token: 'overstated-the-percent' },
  ],
}

// ===========================================================================
// DATA ANALYSIS — grade 6 (6.SP).
// ===========================================================================

/** EASY: small datasets, friendly means. */
const MEAN_EASY: TieredMathTemplate = {
  code: 'mean-from-total-g6-easy-v3',
  skillSlug: 'data-analysis',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'easy',
  count: TIER_COUNTS.easy,
  standard: '6.SP.B.5.C - the mean of a small dataset',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate:
      'A team scored ${total}$ points in ${n}$ games. What was the mean (average) number of points per game?',
    slots: [
      { name: 'n', min: 3, max: 7 },
      // Starts at 10 so the "one step low" distractor (q - 5) is never zero.
      { name: 'q', min: 10, max: 30, step: 5 },
    ],
    derived: [{ name: 'total', formula: 'n * q' }],
    answerFormula: 'q',
    answerFormat: 'integer',
    solutionTemplate: 'The mean is the total shared equally: ${total} \\div {n} = {answer}$ points per game.',
  },
  distractorSpec: [
    { formula: 'q + 5', misconception_token: 'mean-too-high' },
    { formula: 'q - 5', misconception_token: 'mean-too-low' },
    { formula: 'total', misconception_token: 'forgot-to-divide-total' },
    { formula: 'total - n', misconception_token: 'subtracted-instead-of-divided' },
    { formula: 'n', misconception_token: 'answered-the-count' },
  ],
}

/** MEDIUM: the full range, means that are not multiples of 5. */
const MEAN_MEDIUM: TieredMathTemplate = {
  code: 'mean-from-total-g6-medium-v3',
  skillSlug: 'data-analysis',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'medium',
  count: TIER_COUNTS.medium,
  standard: '6.SP.B.5.C - the mean of a larger dataset',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate:
      'A team scored ${total}$ points in ${n}$ games. What was the mean (average) number of points per game?',
    slots: [
      { name: 'n', min: 4, max: 9 },
      { name: 'q', min: 7, max: 34 },
    ],
    derived: [{ name: 'total', formula: 'n * q' }],
    answerFormula: 'q',
    answerFormat: 'integer',
    solutionTemplate: 'The mean is the total shared equally: ${total} \\div {n} = {answer}$ points per game.',
  },
  distractorSpec: [
    { formula: 'q + 1', misconception_token: 'mean-too-high' },
    { formula: 'q - 1', misconception_token: 'mean-too-low' },
    { formula: 'total', misconception_token: 'forgot-to-divide-total' },
    { formula: 'total - n', misconception_token: 'subtracted-instead-of-divided' },
    { formula: 'n', misconception_token: 'answered-the-count' },
  ],
}

/**
 * HARD: work backwards from the mean to a missing value. Multi-step (recover the
 * total, then subtract what is known) and still squarely 6.SP.
 */
const MEAN_HARD: TieredMathTemplate = {
  code: 'mean-from-total-g6-hard-v3',
  skillSlug: 'data-analysis',
  satAlignment: 'problem-solving-data-analysis',
  difficulty: 'hard',
  count: TIER_COUNTS.hard,
  standard: '6.SP.B.5 - recover a missing value from the mean',
  generationSpec: {
    kind: 'template_math',
    schemaVersion: 1,
    responseType: 'multiple_choice',
    stemTemplate:
      'Over ${n}$ games a team averaged ${q}$ points per game. In the first ${nMinus1}$ games they scored ${soFar}$ points in total. How many points did they score in the last game?',
    slots: [
      { name: 'n', min: 4, max: 8 },
      { name: 'q', min: 8, max: 30 },
      { name: 'last', min: 2, max: 40 },
    ],
    derived: [
      { name: 'total', formula: 'n * q' },
      { name: 'nMinus1', formula: 'n - 1' },
      { name: 'soFar', formula: 'n * q - last' },
    ],
    answerFormula: 'last',
    answerFormat: 'integer',
    // The first games must hold a sensible positive total, and the last game must
    // not be the whole story.
    constraints: ['soFar > 0', 'last != q', 'soFar > last'],
    solutionTemplate:
      'The whole season is ${n} \\times {q} = {total}$ points. Take away the first ${nMinus1}$ games: ${total} - {soFar} = {answer}$.',
  },
  distractorSpec: [
    { formula: 'q', misconception_token: 'answered-the-mean' },
    { formula: 'total', misconception_token: 'forgot-to-divide-total' },
    { formula: 'soFar - q', misconception_token: 'subtracted-the-mean-instead' },
    { formula: 'last + q', misconception_token: 'mean-too-high' },
    { formula: 'total - q', misconception_token: 'dropped-one-game' },
  ],
}

/** Every tiered template, in seed order. */
export const TIERED_MATH_TEMPLATES: TieredMathTemplate[] = [
  MULT_EASY,
  MULT_MEDIUM,
  MULT_HARD,
  FRAC_EASY,
  FRAC_MEDIUM,
  FRAC_HARD,
  PCT_EASY,
  PCT_MEDIUM,
  PCT_HARD,
  MEAN_EASY,
  MEAN_MEDIUM,
  MEAN_HARD,
]

/** The four skills this step covers. */
export const TIERED_SKILL_SLUGS = ['multiplication', 'fractions', 'percentages', 'data-analysis']
