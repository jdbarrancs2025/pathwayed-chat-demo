/**
 * Grade 7 & 11 math — a CURATED POOL of grade-accurate Common Core items,
 * extending the question bank so placement AND the lesson path have ≥6 math
 * skills at each of these grades (the diagnostic serves 1 item/skill, so breadth
 * = skill count). Same shape and served path as gapMathTemplates.ts.
 *
 * Each item is ORIGINAL and written to ONE exact CCSS standard, grade-appropriate,
 * with 4 choices (exactly one correct), a DISTINCT misconception token per
 * distractor, and a worked solution. build-grade7-11-math-seeds.ts emits the rows
 * (creates the fresh CCSS domains + skills, then the questions).
 *
 * SLICE A (this file, first commit): the five GRADE 7 skills. The five GRADE 11
 * skills are appended in the next slice; GRADE_7_11_MATH_SKILLS grows with them.
 */
import type { GapMathSkill } from '@/lib/gapMathTemplates'

// ============================================================================
// GRADE 7
// ============================================================================

// 7.NS.A.1–3 — add/subtract/multiply/divide signed integers, fractions, decimals.
const RATIONAL_NUMBER_OPERATIONS_7: GapMathSkill = {
  slug: 'rational-number-operations',
  name: 'Operations with Rational Numbers',
  subject: 'math',
  ccssGrade: '7',
  ccssGradeNum: 7,
  ccssCode: 'CCSS.MATH.CONTENT.7.NS.A',
  satAlignment: 'algebra',
  gradeBand: '6-8',
  items: [
    { slot: 1, difficulty: 'easy', stem: 'What is $-3 + 8$?', choices: [
      { text: '5', is_correct: true },
      { text: '-5', is_correct: false, misconception_token: 'kept-larger-sign' },
      { text: '-11', is_correct: false, misconception_token: 'subtracted-magnitudes-wrong-sign' },
      { text: '11', is_correct: false, misconception_token: 'ignored-negative' },
    ], solution: 'Start at -3 and move up 8: -3 + 8 = 5.' },
    { slot: 2, difficulty: 'easy', stem: 'What is $-7 + (-5)$?', choices: [
      { text: '-12', is_correct: true },
      { text: '-2', is_correct: false, misconception_token: 'subtracted-instead-of-added' },
      { text: '2', is_correct: false, misconception_token: 'subtracted-wrong-sign' },
      { text: '12', is_correct: false, misconception_token: 'dropped-negatives' },
    ], solution: 'Two negatives add in size and stay negative: -(7 + 5) = -12.' },
    { slot: 3, difficulty: 'easy', stem: 'What is $6 - 10$?', choices: [
      { text: '-4', is_correct: true },
      { text: '4', is_correct: false, misconception_token: 'dropped-negative' },
      { text: '16', is_correct: false, misconception_token: 'added-instead' },
      { text: '-16', is_correct: false, misconception_token: 'added-wrong-sign' },
    ], solution: '6 - 10 crosses zero: you owe 4 more than you have, so -4.' },
    { slot: 4, difficulty: 'easy', stem: 'What is $-4 - 6$?', choices: [
      { text: '-10', is_correct: true },
      { text: '-2', is_correct: false, misconception_token: 'subtracted-magnitudes' },
      { text: '2', is_correct: false, misconception_token: 'subtracted-wrong-sign' },
      { text: '10', is_correct: false, misconception_token: 'dropped-negatives' },
    ], solution: 'Subtracting 6 moves further left: -4 - 6 = -10.' },
    { slot: 5, difficulty: 'easy', stem: 'What is $-3 \\times 4$?', choices: [
      { text: '-12', is_correct: true },
      { text: '12', is_correct: false, misconception_token: 'ignored-negative' },
      { text: '-7', is_correct: false, misconception_token: 'added-instead-of-multiplied' },
      { text: '1', is_correct: false, misconception_token: 'added-wrong-sign' },
    ], solution: 'A negative times a positive is negative: -3 × 4 = -12.' },
    { slot: 6, difficulty: 'easy', stem: 'What is $(-5)(-6)$?', choices: [
      { text: '30', is_correct: true },
      { text: '-30', is_correct: false, misconception_token: 'negative-times-negative-negative' },
      { text: '-11', is_correct: false, misconception_token: 'added-instead-of-multiplied' },
      { text: '11', is_correct: false, misconception_token: 'added-dropped-sign' },
    ], solution: 'A negative times a negative is positive: 5 × 6 = 30.' },
    { slot: 7, difficulty: 'easy', stem: 'What is $-20 \\div 5$?', choices: [
      { text: '-4', is_correct: true },
      { text: '4', is_correct: false, misconception_token: 'ignored-negative' },
      { text: '-100', is_correct: false, misconception_token: 'multiplied-instead' },
      { text: '-15', is_correct: false, misconception_token: 'subtracted-instead' },
    ], solution: 'A negative divided by a positive is negative: -20 ÷ 5 = -4.' },
    { slot: 8, difficulty: 'easy', stem: 'What is $-18 \\div (-3)$?', choices: [
      { text: '6', is_correct: true },
      { text: '-6', is_correct: false, misconception_token: 'negative-over-negative-negative' },
      { text: '-21', is_correct: false, misconception_token: 'subtracted-instead' },
      { text: '-15', is_correct: false, misconception_token: 'subtracted-wrong' },
    ], solution: 'A negative divided by a negative is positive: 18 ÷ 3 = 6.' },
    { slot: 9, difficulty: 'medium', stem: 'What is $-2.5 + 4.1$?', choices: [
      { text: '1.6', is_correct: true },
      { text: '-1.6', is_correct: false, misconception_token: 'kept-negative-sign' },
      { text: '6.6', is_correct: false, misconception_token: 'added-magnitudes' },
      { text: '-6.6', is_correct: false, misconception_token: 'added-magnitudes-negative' },
    ], solution: '4.1 is larger, so the sum is positive: 4.1 - 2.5 = 1.6.' },
    { slot: 10, difficulty: 'medium', stem: 'What is $3.2 - 5.7$?', choices: [
      { text: '-2.5', is_correct: true },
      { text: '2.5', is_correct: false, misconception_token: 'dropped-negative' },
      { text: '8.9', is_correct: false, misconception_token: 'added-instead' },
      { text: '-8.9', is_correct: false, misconception_token: 'added-wrong-sign' },
    ], solution: '3.2 - 5.7 goes below zero: 5.7 - 3.2 = 2.5, so -2.5.' },
    { slot: 11, difficulty: 'medium', stem: 'What is $-\\frac{1}{2} + \\frac{3}{4}$?', choices: [
      { text: '$\\frac{1}{4}$', is_correct: true },
      { text: '$-\\frac{1}{4}$', is_correct: false, misconception_token: 'kept-negative-sign' },
      { text: '$\\frac{5}{4}$', is_correct: false, misconception_token: 'added-magnitudes' },
      { text: '$\\frac{1}{2}$', is_correct: false, misconception_token: 'ignored-first-term' },
    ], solution: 'Common denominator 4: -2/4 + 3/4 = 1/4.' },
    { slot: 12, difficulty: 'medium', stem: 'What is $\\frac{2}{3} - \\frac{5}{6}$?', choices: [
      { text: '$-\\frac{1}{6}$', is_correct: true },
      { text: '$\\frac{1}{6}$', is_correct: false, misconception_token: 'dropped-negative' },
      { text: '$-\\frac{3}{6}$', is_correct: false, misconception_token: 'subtracted-numerators-and-denominators' },
      { text: '$-\\frac{7}{6}$', is_correct: false, misconception_token: 'added-instead' },
    ], solution: 'Common denominator 6: 4/6 - 5/6 = -1/6.' },
    { slot: 13, difficulty: 'medium', stem: 'What is $-\\frac{3}{5} \\times 10$?', choices: [
      { text: '-6', is_correct: true },
      { text: '6', is_correct: false, misconception_token: 'ignored-negative' },
      { text: '-30', is_correct: false, misconception_token: 'multiplied-denominator-too' },
      { text: '-2', is_correct: false, misconception_token: 'divided-instead' },
    ], solution: '-3/5 × 10 = -30/5 = -6.' },
    { slot: 14, difficulty: 'medium', stem: 'What is $-\\frac{2}{3} \\times (-9)$?', choices: [
      { text: '6', is_correct: true },
      { text: '-6', is_correct: false, misconception_token: 'negative-times-negative-negative' },
      { text: '18', is_correct: false, misconception_token: 'ignored-denominator' },
      { text: '-18', is_correct: false, misconception_token: 'ignored-denominator-and-sign' },
    ], solution: 'Negative × negative is positive: 2/3 × 9 = 18/3 = 6.' },
    { slot: 15, difficulty: 'medium', stem: 'What is $-0.4 \\times 0.5$?', choices: [
      { text: '-0.2', is_correct: true },
      { text: '0.2', is_correct: false, misconception_token: 'ignored-negative' },
      { text: '-2', is_correct: false, misconception_token: 'misplaced-decimal' },
      { text: '-0.9', is_correct: false, misconception_token: 'added-instead' },
    ], solution: '0.4 × 0.5 = 0.2, and negative × positive is negative: -0.2.' },
    { slot: 16, difficulty: 'medium', stem: 'What is $-\\frac{3}{4} \\div \\frac{1}{2}$?', choices: [
      { text: '$-\\frac{3}{2}$', is_correct: true },
      { text: '$\\frac{3}{2}$', is_correct: false, misconception_token: 'ignored-negative' },
      { text: '$-\\frac{3}{8}$', is_correct: false, misconception_token: 'multiplied-instead-of-flipping' },
      { text: '$-\\frac{3}{4}$', is_correct: false, misconception_token: 'divided-by-one' },
    ], solution: 'Divide = multiply by the reciprocal: -3/4 × 2/1 = -6/4 = -3/2.' },
    { slot: 17, difficulty: 'medium', stem: 'A diver is 30 feet below the surface (at -30 ft) and descends 15 more feet. What is the diver’s position?', choices: [
      { text: '-45 ft', is_correct: true },
      { text: '-15 ft', is_correct: false, misconception_token: 'subtracted-instead' },
      { text: '45 ft', is_correct: false, misconception_token: 'dropped-negative' },
      { text: '-2 ft', is_correct: false, misconception_token: 'divided-instead' },
    ], solution: 'Descending adds to the depth: -30 + (-15) = -45 ft.' },
    { slot: 18, difficulty: 'medium', stem: 'The temperature is $-4^\\circ$F. It rises 9 degrees, then falls 3 degrees. What is the final temperature?', choices: [
      { text: '$2^\\circ$F', is_correct: true },
      { text: '$-16^\\circ$F', is_correct: false, misconception_token: 'subtracted-both' },
      { text: '$10^\\circ$F', is_correct: false, misconception_token: 'ignored-start-negative' },
      { text: '$8^\\circ$F', is_correct: false, misconception_token: 'added-the-fall' },
    ], solution: '-4 + 9 = 5, then 5 - 3 = 2°F.' },
    { slot: 19, difficulty: 'hard', stem: 'What is $-5 + 3 \\times (-2)$?', choices: [
      { text: '-11', is_correct: true },
      { text: '4', is_correct: false, misconception_token: 'added-before-multiplying' },
      { text: '16', is_correct: false, misconception_token: 'added-before-multiplying-wrong-sign' },
      { text: '-2', is_correct: false, misconception_token: 'multiply-only' },
    ], solution: 'Multiply first: 3 × (-2) = -6. Then -5 + (-6) = -11.' },
    { slot: 20, difficulty: 'hard', stem: 'Over three days a stock changes by $-2.5$, $+1.75$, and $-0.5$. What is the net change?', choices: [
      { text: '-1.25', is_correct: true },
      { text: '1.25', is_correct: false, misconception_token: 'dropped-final-sign' },
      { text: '-4.75', is_correct: false, misconception_token: 'made-all-negative' },
      { text: '-0.75', is_correct: false, misconception_token: 'dropped-a-term' },
    ], solution: '-2.5 + 1.75 = -0.75, then -0.75 + (-0.5) = -1.25.' },
  ],
}

// 7.RP.A.3 — multistep percent: tax, tip, discount, markup, % change, interest.
const PERCENT_APPLICATIONS_7: GapMathSkill = {
  slug: 'percent-applications',
  name: 'Percent Applications',
  subject: 'math',
  ccssGrade: '7',
  ccssGradeNum: 7,
  ccssCode: 'CCSS.MATH.CONTENT.7.RP.A.3',
  satAlignment: 'problem-solving-data-analysis',
  gradeBand: '6-8',
  items: [
    { slot: 1, difficulty: 'easy', stem: 'What is 10% of 50?', choices: [
      { text: '5', is_correct: true },
      { text: '0.5', is_correct: false, misconception_token: 'shifted-decimal-twice' },
      { text: '15', is_correct: false, misconception_token: 'added-instead' },
      { text: '45', is_correct: false, misconception_token: 'subtracted-instead' },
    ], solution: '10% = 0.10, and 0.10 × 50 = 5.' },
    { slot: 2, difficulty: 'easy', stem: 'What is 25% of 80?', choices: [
      { text: '20', is_correct: true },
      { text: '2', is_correct: false, misconception_token: 'shifted-decimal-wrong' },
      { text: '55', is_correct: false, misconception_token: 'subtracted-instead' },
      { text: '105', is_correct: false, misconception_token: 'added-instead' },
    ], solution: '25% = 1/4, and 80 ÷ 4 = 20.' },
    { slot: 3, difficulty: 'easy', stem: 'What is 50% of 30?', choices: [
      { text: '15', is_correct: true },
      { text: '60', is_correct: false, misconception_token: 'doubled-instead' },
      { text: '1.5', is_correct: false, misconception_token: 'shifted-decimal-wrong' },
      { text: '20', is_correct: false, misconception_token: 'wrong-fraction' },
    ], solution: '50% = half, and half of 30 is 15.' },
    { slot: 4, difficulty: 'easy', stem: 'What is 20% of 200?', choices: [
      { text: '40', is_correct: true },
      { text: '4', is_correct: false, misconception_token: 'shifted-decimal-wrong' },
      { text: '20', is_correct: false, misconception_token: 'used-percent-as-answer' },
      { text: '180', is_correct: false, misconception_token: 'subtracted-instead' },
    ], solution: '0.20 × 200 = 40.' },
    { slot: 5, difficulty: 'easy', stem: 'A $40 shirt is marked 10% off. How much is the discount?', choices: [
      { text: '$4', is_correct: true },
      { text: '$36', is_correct: false, misconception_token: 'found-sale-price-not-discount' },
      { text: '$0.40', is_correct: false, misconception_token: 'shifted-decimal-twice' },
      { text: '$14', is_correct: false, misconception_token: 'added-ten' },
    ], solution: 'The discount is 10% of $40: 0.10 × 40 = $4.' },
    { slot: 6, difficulty: 'easy', stem: 'What is 15% of 60?', choices: [
      { text: '9', is_correct: true },
      { text: '0.9', is_correct: false, misconception_token: 'shifted-decimal-twice' },
      { text: '45', is_correct: false, misconception_token: 'subtracted-instead' },
      { text: '75', is_correct: false, misconception_token: 'added-instead' },
    ], solution: '0.15 × 60 = 9.' },
    { slot: 7, difficulty: 'easy', stem: 'A $20 meal has 5% sales tax. How much is the tax?', choices: [
      { text: '$1', is_correct: true },
      { text: '$21', is_correct: false, misconception_token: 'found-total-not-tax' },
      { text: '$0.05', is_correct: false, misconception_token: 'shifted-decimal-twice' },
      { text: '$25', is_correct: false, misconception_token: 'added-five' },
    ], solution: '5% of $20 = 0.05 × 20 = $1.' },
    { slot: 8, difficulty: 'easy', stem: 'What is 100% of 45?', choices: [
      { text: '45', is_correct: true },
      { text: '90', is_correct: false, misconception_token: 'doubled-instead' },
      { text: '4.5', is_correct: false, misconception_token: 'shifted-decimal-wrong' },
      { text: '0', is_correct: false, misconception_token: 'confused-with-zero-percent' },
    ], solution: '100% means the whole amount, so 100% of 45 is 45.' },
    { slot: 9, difficulty: 'medium', stem: 'A $50 jacket is 20% off. What is the sale price?', choices: [
      { text: '$40', is_correct: true },
      { text: '$30', is_correct: false, misconception_token: 'took-double-the-discount' },
      { text: '$10', is_correct: false, misconception_token: 'found-discount-not-price' },
      { text: '$60', is_correct: false, misconception_token: 'added-instead-of-subtracting' },
    ], solution: '20% of $50 is $10 off, so $50 - $10 = $40.' },
    { slot: 10, difficulty: 'medium', stem: 'An $80 dinner gets a 15% tip. What is the total?', choices: [
      { text: '$92', is_correct: true },
      { text: '$12', is_correct: false, misconception_token: 'found-tip-not-total' },
      { text: '$95', is_correct: false, misconception_token: 'used-wrong-percent' },
      { text: '$68', is_correct: false, misconception_token: 'subtracted-tip' },
    ], solution: 'Tip = 15% of 80 = $12; total = 80 + 12 = $92.' },
    { slot: 11, difficulty: 'medium', stem: 'A price rises from 40 dollars to 50 dollars. What is the percent increase?', choices: [
      { text: '25%', is_correct: true },
      { text: '20%', is_correct: false, misconception_token: 'divided-by-new-not-original' },
      { text: '10%', is_correct: false, misconception_token: 'used-difference-as-percent' },
      { text: '125%', is_correct: false, misconception_token: 'used-ratio-of-prices' },
    ], solution: 'Increase = 10; percent = 10 ÷ 40 (the original) = 0.25 = 25%.' },
    { slot: 12, difficulty: 'medium', stem: '8 is what percent of 40?', choices: [
      { text: '20%', is_correct: true },
      { text: '5%', is_correct: false, misconception_token: 'divided-in-wrong-order' },
      { text: '32%', is_correct: false, misconception_token: 'used-difference' },
      { text: '320%', is_correct: false, misconception_token: 'shifted-decimal-wrong' },
    ], solution: '8 ÷ 40 = 0.2 = 20%.' },
    { slot: 13, difficulty: 'medium', stem: 'A $120 item is marked up 25%. What is the new price?', choices: [
      { text: '$150', is_correct: true },
      { text: '$145', is_correct: false, misconception_token: 'added-flat-25' },
      { text: '$95', is_correct: false, misconception_token: 'subtracted-markup' },
      { text: '$30', is_correct: false, misconception_token: 'found-markup-not-price' },
    ], solution: 'Markup = 25% of 120 = $30; new price = 120 + 30 = $150.' },
    { slot: 14, difficulty: 'medium', stem: '30% of what number is 12?', choices: [
      { text: '40', is_correct: true },
      { text: '3.6', is_correct: false, misconception_token: 'multiplied-instead-of-divided' },
      { text: '360', is_correct: false, misconception_token: 'shifted-decimal-wrong' },
      { text: '4', is_correct: false, misconception_token: 'divided-by-three' },
    ], solution: 'Number = 12 ÷ 0.30 = 40.' },
    { slot: 15, difficulty: 'medium', stem: 'A shirt is 40% off and now costs $18. What was the original price?', choices: [
      { text: '$30', is_correct: true },
      { text: '$45', is_correct: false, misconception_token: 'added-40-percent-to-sale' },
      { text: '$25.20', is_correct: false, misconception_token: 'took-40-off-the-sale' },
      { text: '$12.60', is_correct: false, misconception_token: 'took-more-off' },
    ], solution: '$18 is 60% of the original, so original = 18 ÷ 0.60 = $30.' },
    { slot: 16, difficulty: 'medium', stem: 'How much simple interest does $200 earn at 5% per year for 2 years?', choices: [
      { text: '$20', is_correct: true },
      { text: '$10', is_correct: false, misconception_token: 'forgot-the-two-years' },
      { text: '$210', is_correct: false, misconception_token: 'found-balance-not-interest' },
      { text: '$220', is_correct: false, misconception_token: 'found-balance-two-years' },
    ], solution: 'Interest = 200 × 0.05 × 2 = $20.' },
    { slot: 17, difficulty: 'medium', stem: 'A town of 500 people grows by 12%. What is the new population?', choices: [
      { text: '560', is_correct: true },
      { text: '512', is_correct: false, misconception_token: 'added-flat-12' },
      { text: '60', is_correct: false, misconception_token: 'found-increase-not-total' },
      { text: '440', is_correct: false, misconception_token: 'subtracted-instead' },
    ], solution: 'Increase = 12% of 500 = 60; new = 500 + 60 = 560.' },
    { slot: 18, difficulty: 'medium', stem: '45 is what percent of 60?', choices: [
      { text: '75%', is_correct: true },
      { text: '25%', is_correct: false, misconception_token: 'used-the-leftover' },
      { text: '15%', is_correct: false, misconception_token: 'used-difference' },
      { text: '133%', is_correct: false, misconception_token: 'divided-in-wrong-order' },
    ], solution: '45 ÷ 60 = 0.75 = 75%.' },
    { slot: 19, difficulty: 'hard', stem: 'A $60 game is 25% off, and then 8% tax is added to the sale price. What is the total paid?', choices: [
      { text: '$48.60', is_correct: true },
      { text: '$48.00', is_correct: false, misconception_token: 'forgot-the-tax' },
      { text: '$50.40', is_correct: false, misconception_token: 'taxed-original-price' },
      { text: '$49.20', is_correct: false, misconception_token: 'used-wrong-tax-base' },
    ], solution: 'Sale price = 60 × 0.75 = $45; with 8% tax: 45 × 1.08 = $48.60.' },
    { slot: 20, difficulty: 'hard', stem: 'A $100 stock rises 10% one day and then falls 10% the next. What is its final value?', choices: [
      { text: '$99', is_correct: true },
      { text: '$100', is_correct: false, misconception_token: 'assumed-percents-cancel' },
      { text: '$90', is_correct: false, misconception_token: 'subtracted-twenty-percent' },
      { text: '$101', is_correct: false, misconception_token: 'added-net-one-percent' },
    ], solution: 'Up 10%: 100 → 110. Down 10% of 110 is 11: 110 - 11 = $99.' },
  ],
}

// 7.EE.B.4 — solve two-step equations and inequalities.
const TWO_STEP_EQUATIONS_7: GapMathSkill = {
  slug: 'two-step-equations',
  name: 'Two-Step Equations & Inequalities',
  subject: 'math',
  ccssGrade: '7',
  ccssGradeNum: 7,
  ccssCode: 'CCSS.MATH.CONTENT.7.EE.B.4',
  satAlignment: 'algebra',
  gradeBand: '6-8',
  items: [
    { slot: 1, difficulty: 'easy', stem: 'Solve for $x$: $2x + 3 = 11$.', choices: [
      { text: '$x = 4$', is_correct: true },
      { text: '$x = 7$', is_correct: false, misconception_token: 'skipped-divide' },
      { text: '$x = 8$', is_correct: false, misconception_token: 'subtracted-only' },
      { text: '$x = 3$', is_correct: false, misconception_token: 'divided-before-subtracting' },
    ], solution: 'Subtract 3: 2x = 8. Divide by 2: x = 4.' },
    { slot: 2, difficulty: 'easy', stem: 'Solve for $x$: $3x - 5 = 10$.', choices: [
      { text: '$x = 5$', is_correct: true },
      { text: '$x = 15$', is_correct: false, misconception_token: 'skipped-divide' },
      { text: '$x = \\frac{5}{3}$', is_correct: false, misconception_token: 'subtracted-instead-of-added' },
      { text: '$x = 45$', is_correct: false, misconception_token: 'multiplied-both' },
    ], solution: 'Add 5: 3x = 15. Divide by 3: x = 5.' },
    { slot: 3, difficulty: 'easy', stem: 'Solve for $x$: $5x + 2 = 22$.', choices: [
      { text: '$x = 4$', is_correct: true },
      { text: '$x = 20$', is_correct: false, misconception_token: 'skipped-divide' },
      { text: '$x = \\frac{24}{5}$', is_correct: false, misconception_token: 'added-instead-of-subtracting' },
      { text: '$x = 5$', is_correct: false, misconception_token: 'ignored-the-two' },
    ], solution: 'Subtract 2: 5x = 20. Divide by 5: x = 4.' },
    { slot: 4, difficulty: 'easy', stem: 'Solve for $x$: $\\frac{x}{2} + 1 = 5$.', choices: [
      { text: '$x = 8$', is_correct: true },
      { text: '$x = 3$', is_correct: false, misconception_token: 'forgot-to-multiply' },
      { text: '$x = 12$', is_correct: false, misconception_token: 'added-before-multiplying' },
      { text: '$x = 2$', is_correct: false, misconception_token: 'divided-instead' },
    ], solution: 'Subtract 1: x/2 = 4. Multiply by 2: x = 8.' },
    { slot: 5, difficulty: 'easy', stem: 'Solve for $x$: $4x - 3 = 13$.', choices: [
      { text: '$x = 4$', is_correct: true },
      { text: '$x = 16$', is_correct: false, misconception_token: 'skipped-divide' },
      { text: '$x = 2.5$', is_correct: false, misconception_token: 'subtracted-instead-of-added' },
      { text: '$x = 64$', is_correct: false, misconception_token: 'multiplied-both' },
    ], solution: 'Add 3: 4x = 16. Divide by 4: x = 4.' },
    { slot: 6, difficulty: 'easy', stem: 'Solve for $x$: $2x + 7 = 1$.', choices: [
      { text: '$x = -3$', is_correct: true },
      { text: '$x = 3$', is_correct: false, misconception_token: 'dropped-negative' },
      { text: '$x = 4$', is_correct: false, misconception_token: 'added-instead-of-subtracting' },
      { text: '$x = -4$', is_correct: false, misconception_token: 'skipped-divide' },
    ], solution: 'Subtract 7: 2x = -6. Divide by 2: x = -3.' },
    { slot: 7, difficulty: 'easy', stem: 'Solve for $x$: $6x + 10 = 4$.', choices: [
      { text: '$x = -1$', is_correct: true },
      { text: '$x = 1$', is_correct: false, misconception_token: 'dropped-negative' },
      { text: '$x = -6$', is_correct: false, misconception_token: 'skipped-divide' },
      { text: '$x = \\frac{7}{3}$', is_correct: false, misconception_token: 'added-instead' },
    ], solution: 'Subtract 10: 6x = -6. Divide by 6: x = -1.' },
    { slot: 8, difficulty: 'easy', stem: 'Solve for $x$: $\\frac{x}{3} - 2 = 1$.', choices: [
      { text: '$x = 9$', is_correct: true },
      { text: '$x = 3$', is_correct: false, misconception_token: 'forgot-to-multiply' },
      { text: '$x = -3$', is_correct: false, misconception_token: 'subtracted-instead-of-adding' },
      { text: '$x = 1$', is_correct: false, misconception_token: 'divided-instead' },
    ], solution: 'Add 2: x/3 = 3. Multiply by 3: x = 9.' },
    { slot: 9, difficulty: 'medium', stem: 'Solve for $x$: $3(x + 2) = 18$.', choices: [
      { text: '$x = 4$', is_correct: true },
      { text: '$x = 6$', is_correct: false, misconception_token: 'forgot-to-subtract-two' },
      { text: '$x = 16$', is_correct: false, misconception_token: 'distributed-wrong' },
      { text: '$x = 8$', is_correct: false, misconception_token: 'added-instead' },
    ], solution: 'Divide by 3: x + 2 = 6. Subtract 2: x = 4.' },
    { slot: 10, difficulty: 'medium', stem: 'Solve for $x$: $2x - 5 = x + 3$.', choices: [
      { text: '$x = 8$', is_correct: true },
      { text: '$x = -2$', is_correct: false, misconception_token: 'moved-terms-wrong-sign' },
      { text: '$x = -8$', is_correct: false, misconception_token: 'sign-error' },
      { text: '$x = \\frac{8}{3}$', is_correct: false, misconception_token: 'combined-x-terms-wrong' },
    ], solution: 'Subtract x: x - 5 = 3. Add 5: x = 8.' },
    { slot: 11, difficulty: 'medium', stem: 'Solve for $x$: $5x + 4 = 3x + 12$.', choices: [
      { text: '$x = 4$', is_correct: true },
      { text: '$x = 2$', is_correct: false, misconception_token: 'combined-constants-wrong' },
      { text: '$x = 8$', is_correct: false, misconception_token: 'skipped-divide' },
      { text: '$x = -4$', is_correct: false, misconception_token: 'sign-error' },
    ], solution: 'Subtract 3x: 2x + 4 = 12. Subtract 4: 2x = 8. Divide: x = 4.' },
    { slot: 12, difficulty: 'medium', stem: 'Solve for $x$: $-2x + 7 = 1$.', choices: [
      { text: '$x = 3$', is_correct: true },
      { text: '$x = -3$', is_correct: false, misconception_token: 'sign-error-on-divide' },
      { text: '$x = 4$', is_correct: false, misconception_token: 'added-instead-of-subtracting' },
      { text: '$x = -4$', is_correct: false, misconception_token: 'skipped-divide' },
    ], solution: 'Subtract 7: -2x = -6. Divide by -2: x = 3.' },
    { slot: 13, difficulty: 'medium', stem: 'Solve for $x$: $\\frac{x - 4}{2} = 5$.', choices: [
      { text: '$x = 14$', is_correct: true },
      { text: '$x = 6$', is_correct: false, misconception_token: 'divided-then-added-wrong' },
      { text: '$x = 7$', is_correct: false, misconception_token: 'forgot-to-multiply' },
      { text: '$x = 9$', is_correct: false, misconception_token: 'multiplied-only-one-side' },
    ], solution: 'Multiply by 2: x - 4 = 10. Add 4: x = 14.' },
    { slot: 14, difficulty: 'medium', stem: 'Solve for $x$: $7 = 2x - 3$.', choices: [
      { text: '$x = 5$', is_correct: true },
      { text: '$x = 2$', is_correct: false, misconception_token: 'subtracted-instead-of-adding' },
      { text: '$x = -5$', is_correct: false, misconception_token: 'sign-error' },
      { text: '$x = 4$', is_correct: false, misconception_token: 'skipped-divide' },
    ], solution: 'Add 3: 10 = 2x. Divide by 2: x = 5.' },
    { slot: 15, difficulty: 'medium', stem: 'Solve the inequality: $x + 5 > 12$.', choices: [
      { text: '$x > 7$', is_correct: true },
      { text: '$x > 17$', is_correct: false, misconception_token: 'added-instead-of-subtracting' },
      { text: '$x < 7$', is_correct: false, misconception_token: 'flipped-sign-needlessly' },
      { text: '$x > 60$', is_correct: false, misconception_token: 'multiplied-instead' },
    ], solution: 'Subtract 5 from both sides: x > 7.' },
    { slot: 16, difficulty: 'medium', stem: 'Solve the inequality: $2x < 10$.', choices: [
      { text: '$x < 5$', is_correct: true },
      { text: '$x < 20$', is_correct: false, misconception_token: 'multiplied-instead' },
      { text: '$x > 5$', is_correct: false, misconception_token: 'flipped-sign-needlessly' },
      { text: '$x < 8$', is_correct: false, misconception_token: 'subtracted-instead' },
    ], solution: 'Divide both sides by 2 (positive, no flip): x < 5.' },
    { slot: 17, difficulty: 'medium', stem: 'Solve the inequality: $3x - 2 \\geq 7$.', choices: [
      { text: '$x \\geq 3$', is_correct: true },
      { text: '$x \\geq 5$', is_correct: false, misconception_token: 'skipped-divide' },
      { text: '$x \\leq 3$', is_correct: false, misconception_token: 'flipped-sign-needlessly' },
      { text: '$x \\geq \\frac{5}{3}$', is_correct: false, misconception_token: 'subtracted-instead-of-adding' },
    ], solution: 'Add 2: 3x ≥ 9. Divide by 3: x ≥ 3.' },
    { slot: 18, difficulty: 'medium', stem: 'A number tripled, plus 4, equals 19. What is the number?', choices: [
      { text: '5', is_correct: true },
      { text: '15', is_correct: false, misconception_token: 'skipped-divide' },
      { text: '$\\frac{23}{3}$', is_correct: false, misconception_token: 'added-instead-of-subtracting' },
      { text: '45', is_correct: false, misconception_token: 'multiplied-both' },
    ], solution: '3n + 4 = 19 → 3n = 15 → n = 5.' },
    { slot: 19, difficulty: 'hard', stem: 'Solve for $x$: $-3x + 5 = -7$.', choices: [
      { text: '$x = 4$', is_correct: true },
      { text: '$x = -4$', is_correct: false, misconception_token: 'sign-error-on-divide' },
      { text: '$x = \\frac{2}{3}$', is_correct: false, misconception_token: 'added-instead-of-subtracting' },
      { text: '$x = -\\frac{2}{3}$', is_correct: false, misconception_token: 'combined-sign-errors' },
    ], solution: 'Subtract 5: -3x = -12. Divide by -3: x = 4.' },
    { slot: 20, difficulty: 'hard', stem: 'Solve the inequality: $-2x + 3 < 9$.', choices: [
      { text: '$x > -3$', is_correct: true },
      { text: '$x < -3$', is_correct: false, misconception_token: 'forgot-to-flip-sign' },
      { text: '$x > -6$', is_correct: false, misconception_token: 'skipped-divide' },
      { text: '$x < 3$', is_correct: false, misconception_token: 'sign-and-flip-errors' },
    ], solution: 'Subtract 3: -2x < 6. Divide by -2 and FLIP the sign: x > -3.' },
  ],
}

// 7.G.B.4–6 — circles (area/circumference), angle relationships, area/volume/surface area.
const ANGLES_AREA_VOLUME_7: GapMathSkill = {
  slug: 'angles-area-volume',
  name: 'Angles, Area & Volume',
  subject: 'math',
  ccssGrade: '7',
  ccssGradeNum: 7,
  ccssCode: 'CCSS.MATH.CONTENT.7.G.B',
  satAlignment: 'geometry-trigonometry',
  gradeBand: '6-8',
  items: [
    { slot: 1, difficulty: 'easy', stem: 'A circle has radius 5. What is its circumference? (Use $\\pi \\approx 3.14$.)', choices: [
      { text: '31.4', is_correct: true },
      { text: '15.7', is_correct: false, misconception_token: 'used-radius-not-diameter' },
      { text: '78.5', is_correct: false, misconception_token: 'used-area-formula' },
      { text: '10', is_correct: false, misconception_token: 'forgot-pi' },
    ], solution: 'C = 2πr = 2 × 3.14 × 5 = 31.4.' },
    { slot: 2, difficulty: 'easy', stem: 'A circle has radius 3. What is its area? (Use $\\pi \\approx 3.14$.)', choices: [
      { text: '28.26', is_correct: true },
      { text: '18.84', is_correct: false, misconception_token: 'used-circumference-formula' },
      { text: '9.42', is_correct: false, misconception_token: 'forgot-to-square' },
      { text: '9', is_correct: false, misconception_token: 'forgot-pi' },
    ], solution: 'A = πr² = 3.14 × 3² = 3.14 × 9 = 28.26.' },
    { slot: 3, difficulty: 'easy', stem: 'Two angles are complementary. One is $30^\\circ$. What is the other?', choices: [
      { text: '$60^\\circ$', is_correct: true },
      { text: '$150^\\circ$', is_correct: false, misconception_token: 'used-supplementary' },
      { text: '$70^\\circ$', is_correct: false, misconception_token: 'used-wrong-total' },
      { text: '$330^\\circ$', is_correct: false, misconception_token: 'used-full-circle' },
    ], solution: 'Complementary angles add to 90°: 90 - 30 = 60°.' },
    { slot: 4, difficulty: 'easy', stem: 'Two angles are supplementary. One is $110^\\circ$. What is the other?', choices: [
      { text: '$70^\\circ$', is_correct: true },
      { text: '$20^\\circ$', is_correct: false, misconception_token: 'used-complementary' },
      { text: '$250^\\circ$', is_correct: false, misconception_token: 'used-full-circle' },
      { text: '$90^\\circ$', is_correct: false, misconception_token: 'guessed-right-angle' },
    ], solution: 'Supplementary angles add to 180°: 180 - 110 = 70°.' },
    { slot: 5, difficulty: 'easy', stem: 'A rectangle is 8 units long and 5 units wide. What is its area?', choices: [
      { text: '40', is_correct: true },
      { text: '26', is_correct: false, misconception_token: 'found-perimeter' },
      { text: '13', is_correct: false, misconception_token: 'added-sides' },
      { text: '80', is_correct: false, misconception_token: 'doubled-area' },
    ], solution: 'Area = length × width = 8 × 5 = 40.' },
    { slot: 6, difficulty: 'easy', stem: 'A triangle has base 10 and height 6. What is its area?', choices: [
      { text: '30', is_correct: true },
      { text: '60', is_correct: false, misconception_token: 'forgot-one-half' },
      { text: '16', is_correct: false, misconception_token: 'added-base-and-height' },
      { text: '32', is_correct: false, misconception_token: 'found-perimeter-ish' },
    ], solution: 'Area = ½ × base × height = ½ × 10 × 6 = 30.' },
    { slot: 7, difficulty: 'easy', stem: 'Two lines cross. One angle is $65^\\circ$. What is the angle vertical (opposite) to it?', choices: [
      { text: '$65^\\circ$', is_correct: true },
      { text: '$115^\\circ$', is_correct: false, misconception_token: 'used-supplementary' },
      { text: '$25^\\circ$', is_correct: false, misconception_token: 'used-complementary' },
      { text: '$295^\\circ$', is_correct: false, misconception_token: 'used-reflex' },
    ], solution: 'Vertical (opposite) angles are equal, so it is also 65°.' },
    { slot: 8, difficulty: 'easy', stem: 'A cube has side length 3. What is its volume?', choices: [
      { text: '27', is_correct: true },
      { text: '9', is_correct: false, misconception_token: 'squared-instead-of-cubed' },
      { text: '54', is_correct: false, misconception_token: 'found-surface-area' },
      { text: '18', is_correct: false, misconception_token: 'multiplied-by-sides-count' },
    ], solution: 'Volume of a cube = side³ = 3 × 3 × 3 = 27.' },
    { slot: 9, difficulty: 'medium', stem: 'A circle has diameter 10. What is its area? (Use $\\pi \\approx 3.14$.)', choices: [
      { text: '78.5', is_correct: true },
      { text: '314', is_correct: false, misconception_token: 'used-diameter-as-radius' },
      { text: '31.4', is_correct: false, misconception_token: 'found-circumference' },
      { text: '157', is_correct: false, misconception_token: 'forgot-to-square-took-double' },
    ], solution: 'Radius = 5, so A = πr² = 3.14 × 25 = 78.5.' },
    { slot: 10, difficulty: 'medium', stem: 'A circle has radius 7. What is its circumference? (Use $\\pi \\approx 3.14$.)', choices: [
      { text: '43.96', is_correct: true },
      { text: '21.98', is_correct: false, misconception_token: 'used-radius-not-diameter' },
      { text: '153.86', is_correct: false, misconception_token: 'used-area-formula' },
      { text: '14', is_correct: false, misconception_token: 'forgot-pi' },
    ], solution: 'C = 2πr = 2 × 3.14 × 7 = 43.96.' },
    { slot: 11, difficulty: 'medium', stem: 'A rectangular prism is 4 by 3 by 2. What is its volume?', choices: [
      { text: '24', is_correct: true },
      { text: '26', is_correct: false, misconception_token: 'added-some-edges' },
      { text: '9', is_correct: false, misconception_token: 'added-dimensions' },
      { text: '52', is_correct: false, misconception_token: 'found-surface-area' },
    ], solution: 'Volume = l × w × h = 4 × 3 × 2 = 24.' },
    { slot: 12, difficulty: 'medium', stem: 'Three angles lie on a straight line: $40^\\circ$, $x$, and $90^\\circ$. Find $x$.', choices: [
      { text: '$50^\\circ$', is_correct: true },
      { text: '$130^\\circ$', is_correct: false, misconception_token: 'used-90-total' },
      { text: '$230^\\circ$', is_correct: false, misconception_token: 'added-instead-of-subtracting' },
      { text: '$40^\\circ$', is_correct: false, misconception_token: 'guessed-equal' },
    ], solution: 'Angles on a line add to 180°: 180 - 40 - 90 = 50°.' },
    { slot: 13, difficulty: 'medium', stem: 'A triangle has two angles of $50^\\circ$ and $60^\\circ$. What is the third angle?', choices: [
      { text: '$70^\\circ$', is_correct: true },
      { text: '$110^\\circ$', is_correct: false, misconception_token: 'forgot-to-subtract-from-180' },
      { text: '$80^\\circ$', is_correct: false, misconception_token: 'used-90-total' },
      { text: '$250^\\circ$', is_correct: false, misconception_token: 'added-instead' },
    ], solution: 'Angles of a triangle add to 180°: 180 - 50 - 60 = 70°.' },
    { slot: 14, difficulty: 'medium', stem: 'A circle has radius 6. What is its area? (Use $\\pi \\approx 3.14$.)', choices: [
      { text: '113.04', is_correct: true },
      { text: '37.68', is_correct: false, misconception_token: 'found-circumference' },
      { text: '18.84', is_correct: false, misconception_token: 'forgot-to-square' },
      { text: '226.08', is_correct: false, misconception_token: 'used-diameter-as-radius' },
    ], solution: 'A = πr² = 3.14 × 36 = 113.04.' },
    { slot: 15, difficulty: 'medium', stem: 'A cube has side length 4. What is its total surface area?', choices: [
      { text: '96', is_correct: true },
      { text: '64', is_correct: false, misconception_token: 'found-volume' },
      { text: '16', is_correct: false, misconception_token: 'found-one-face' },
      { text: '24', is_correct: false, misconception_token: 'multiplied-side-by-faces' },
    ], solution: 'Surface area = 6 × side² = 6 × 16 = 96.' },
    { slot: 16, difficulty: 'medium', stem: 'A rectangular prism is 5 by 5 by 2. What is its volume?', choices: [
      { text: '50', is_correct: true },
      { text: '12', is_correct: false, misconception_token: 'added-dimensions' },
      { text: '25', is_correct: false, misconception_token: 'forgot-height' },
      { text: '90', is_correct: false, misconception_token: 'found-surface-area' },
    ], solution: 'Volume = 5 × 5 × 2 = 50.' },
    { slot: 17, difficulty: 'medium', stem: 'An angle and its supplement are equal. What is the measure of each angle?', choices: [
      { text: '$90^\\circ$', is_correct: true },
      { text: '$45^\\circ$', is_correct: false, misconception_token: 'used-90-total' },
      { text: '$180^\\circ$', is_correct: false, misconception_token: 'used-total-as-answer' },
      { text: '$60^\\circ$', is_correct: false, misconception_token: 'guessed' },
    ], solution: 'If x + x = 180, then 2x = 180, so x = 90°.' },
    { slot: 18, difficulty: 'medium', stem: 'A semicircle has radius 4. What is its area? (Use $\\pi \\approx 3.14$.)', choices: [
      { text: '25.12', is_correct: true },
      { text: '50.24', is_correct: false, misconception_token: 'forgot-to-halve' },
      { text: '12.56', is_correct: false, misconception_token: 'found-half-circumference' },
      { text: '100.48', is_correct: false, misconception_token: 'used-diameter-as-radius' },
    ], solution: 'Full circle = 3.14 × 16 = 50.24; a semicircle is half: 25.12.' },
    { slot: 19, difficulty: 'hard', stem: 'A circle has circumference 31.4. What is its radius? (Use $\\pi \\approx 3.14$.)', choices: [
      { text: '5', is_correct: true },
      { text: '10', is_correct: false, misconception_token: 'found-diameter' },
      { text: '15.7', is_correct: false, misconception_token: 'divided-by-pi-only' },
      { text: '9.87', is_correct: false, misconception_token: 'used-area-relationship' },
    ], solution: 'C = 2πr, so r = 31.4 ÷ (2 × 3.14) = 31.4 ÷ 6.28 = 5.' },
    { slot: 20, difficulty: 'hard', stem: 'A box is 6 by 4 by 5. What is its total surface area?', choices: [
      { text: '148', is_correct: true },
      { text: '120', is_correct: false, misconception_token: 'found-volume' },
      { text: '74', is_correct: false, misconception_token: 'forgot-to-double' },
      { text: '296', is_correct: false, misconception_token: 'doubled-twice' },
    ], solution: 'SA = 2(lw + lh + wh) = 2(24 + 30 + 20) = 2(74) = 148.' },
  ],
}

// 7.SP.C.5–8 — probability of simple and compound events.
const PROBABILITY_MODELS_7: GapMathSkill = {
  slug: 'probability-models',
  name: 'Probability',
  subject: 'math',
  ccssGrade: '7',
  ccssGradeNum: 7,
  ccssCode: 'CCSS.MATH.CONTENT.7.SP.C',
  satAlignment: 'problem-solving-data-analysis',
  gradeBand: '6-8',
  items: [
    { slot: 1, difficulty: 'easy', stem: 'A fair coin is flipped. What is the probability of heads?', choices: [
      { text: '$\\frac{1}{2}$', is_correct: true },
      { text: '1', is_correct: false, misconception_token: 'certain-event-confusion' },
      { text: '$\\frac{1}{4}$', is_correct: false, misconception_token: 'used-two-flips' },
      { text: '2', is_correct: false, misconception_token: 'used-count-not-probability' },
    ], solution: 'One of two equally likely outcomes: P = 1/2.' },
    { slot: 2, difficulty: 'easy', stem: 'A standard number cube (die) is rolled. What is the probability of rolling a 3?', choices: [
      { text: '$\\frac{1}{6}$', is_correct: true },
      { text: '$\\frac{1}{3}$', is_correct: false, misconception_token: 'used-the-face-value' },
      { text: '$\\frac{3}{6}$', is_correct: false, misconception_token: 'used-face-in-numerator' },
      { text: '$\\frac{1}{2}$', is_correct: false, misconception_token: 'guessed-half' },
    ], solution: 'One favorable outcome out of six: P = 1/6.' },
    { slot: 3, difficulty: 'easy', stem: 'A bag has 3 red and 2 blue marbles. What is the probability of drawing red?', choices: [
      { text: '$\\frac{3}{5}$', is_correct: true },
      { text: '$\\frac{3}{2}$', is_correct: false, misconception_token: 'used-red-over-blue' },
      { text: '$\\frac{2}{5}$', is_correct: false, misconception_token: 'used-the-other-color' },
      { text: '$\\frac{1}{3}$', is_correct: false, misconception_token: 'guessed' },
    ], solution: '3 red out of 5 total: P = 3/5.' },
    { slot: 4, difficulty: 'easy', stem: 'A spinner has 4 equal-sized colored sections. What is the probability of landing on one particular color?', choices: [
      { text: '$\\frac{1}{4}$', is_correct: true },
      { text: '$\\frac{1}{2}$', is_correct: false, misconception_token: 'guessed-half' },
      { text: '4', is_correct: false, misconception_token: 'used-count-not-probability' },
      { text: '$\\frac{3}{4}$', is_correct: false, misconception_token: 'used-complement' },
    ], solution: 'One of four equally likely sections: P = 1/4.' },
    { slot: 5, difficulty: 'easy', stem: 'A die is rolled. What is the probability of an even number?', choices: [
      { text: '$\\frac{1}{2}$', is_correct: true },
      { text: '$\\frac{1}{6}$', is_correct: false, misconception_token: 'counted-one-even' },
      { text: '$\\frac{1}{3}$', is_correct: false, misconception_token: 'miscounted-evens' },
      { text: '$\\frac{2}{3}$', is_correct: false, misconception_token: 'overcounted' },
    ], solution: 'Even faces are 2, 4, 6, 3 of 6, so P = 3/6 = 1/2.' },
    { slot: 6, difficulty: 'easy', stem: 'What is the probability of an impossible event?', choices: [
      { text: '0', is_correct: true },
      { text: '1', is_correct: false, misconception_token: 'confused-with-certain' },
      { text: '$\\frac{1}{2}$', is_correct: false, misconception_token: 'guessed-half' },
      { text: '-1', is_correct: false, misconception_token: 'used-negative' },
    ], solution: 'An impossible event never happens, so its probability is 0.' },
    { slot: 7, difficulty: 'easy', stem: 'What is the probability of a certain event?', choices: [
      { text: '1', is_correct: true },
      { text: '0', is_correct: false, misconception_token: 'confused-with-impossible' },
      { text: '$\\frac{1}{2}$', is_correct: false, misconception_token: 'guessed-half' },
      { text: '100', is_correct: false, misconception_token: 'used-percent-as-number' },
    ], solution: 'A certain event always happens, so its probability is 1.' },
    { slot: 8, difficulty: 'easy', stem: 'A bag has 5 marbles; 1 is green. What is the probability of drawing green?', choices: [
      { text: '$\\frac{1}{5}$', is_correct: true },
      { text: '$\\frac{4}{5}$', is_correct: false, misconception_token: 'used-complement' },
      { text: '5', is_correct: false, misconception_token: 'used-count-not-probability' },
      { text: '$\\frac{1}{4}$', is_correct: false, misconception_token: 'used-non-green-total' },
    ], solution: '1 green out of 5 total: P = 1/5.' },
    { slot: 9, difficulty: 'medium', stem: 'A bag has 4 red and 6 blue marbles. What is the probability of drawing blue?', choices: [
      { text: '$\\frac{3}{5}$', is_correct: true },
      { text: '$\\frac{2}{5}$', is_correct: false, misconception_token: 'used-the-other-color' },
      { text: '$\\frac{6}{4}$', is_correct: false, misconception_token: 'used-blue-over-red' },
      { text: '$\\frac{4}{6}$', is_correct: false, misconception_token: 'inverted-ratio' },
    ], solution: '6 blue of 10 total: 6/10 = 3/5.' },
    { slot: 10, difficulty: 'medium', stem: 'A die is rolled. What is the probability of a number greater than 4?', choices: [
      { text: '$\\frac{1}{3}$', is_correct: true },
      { text: '$\\frac{1}{6}$', is_correct: false, misconception_token: 'counted-one-face' },
      { text: '$\\frac{1}{2}$', is_correct: false, misconception_token: 'included-four' },
      { text: '$\\frac{2}{3}$', is_correct: false, misconception_token: 'used-complement' },
    ], solution: 'Greater than 4 means 5 or 6, 2 of 6, so 2/6 = 1/3.' },
    { slot: 11, difficulty: 'medium', stem: 'On a spinner, $P(A) = 0.3$ and $P(B) = 0.5$. What is $P(C)$ if C is the only other outcome?', choices: [
      { text: '0.2', is_correct: true },
      { text: '0.8', is_correct: false, misconception_token: 'added-instead-of-subtracting' },
      { text: '0.5', is_correct: false, misconception_token: 'guessed' },
      { text: '0.15', is_correct: false, misconception_token: 'multiplied' },
    ], solution: 'All probabilities sum to 1: 1 - 0.3 - 0.5 = 0.2.' },
    { slot: 12, difficulty: 'medium', stem: 'If $P(\\text{rain}) = 0.7$, what is $P(\\text{no rain})$?', choices: [
      { text: '0.3', is_correct: true },
      { text: '0.7', is_correct: false, misconception_token: 'repeated-given' },
      { text: '1.7', is_correct: false, misconception_token: 'added-to-one' },
      { text: '-0.7', is_correct: false, misconception_token: 'negated' },
    ], solution: 'The complement: 1 - 0.7 = 0.3.' },
    { slot: 13, difficulty: 'medium', stem: 'Two fair coins are flipped. What is the probability of two heads?', choices: [
      { text: '$\\frac{1}{4}$', is_correct: true },
      { text: '$\\frac{1}{2}$', is_correct: false, misconception_token: 'used-one-coin' },
      { text: '$\\frac{3}{4}$', is_correct: false, misconception_token: 'used-complement' },
      { text: '$\\frac{1}{3}$', is_correct: false, misconception_token: 'miscounted-outcomes' },
    ], solution: 'P(HH) = 1/2 × 1/2 = 1/4.' },
    { slot: 14, difficulty: 'medium', stem: 'A die is rolled 60 times. About how many times would you expect to roll a 2?', choices: [
      { text: '10', is_correct: true },
      { text: '60', is_correct: false, misconception_token: 'used-total-rolls' },
      { text: '2', is_correct: false, misconception_token: 'used-face-value' },
      { text: '30', is_correct: false, misconception_token: 'used-half' },
    ], solution: 'Expected = 60 × 1/6 = 10.' },
    { slot: 15, difficulty: 'medium', stem: 'A bag has 2 red, 3 blue, and 3 green marbles. What is the probability of NOT drawing red?', choices: [
      { text: '$\\frac{3}{4}$', is_correct: true },
      { text: '$\\frac{1}{4}$', is_correct: false, misconception_token: 'found-probability-of-red' },
      { text: '$\\frac{3}{8}$', is_correct: false, misconception_token: 'used-one-other-color' },
      { text: '$\\frac{5}{8}$', is_correct: false, misconception_token: 'miscounted-non-red' },
    ], solution: 'Not red = 6 of 8 = 6/8 = 3/4 (or 1 - 2/8).' },
    { slot: 16, difficulty: 'medium', stem: 'Cards numbered 1 to 10 are shuffled; one is drawn. What is the probability of a multiple of 3?', choices: [
      { text: '$\\frac{3}{10}$', is_correct: true },
      { text: '$\\frac{1}{10}$', is_correct: false, misconception_token: 'counted-one' },
      { text: '$\\frac{1}{3}$', is_correct: false, misconception_token: 'used-3-in-denominator' },
      { text: '$\\frac{4}{10}$', is_correct: false, misconception_token: 'included-ten' },
    ], solution: 'Multiples of 3 in 1-10 are 3, 6, 9, three of ten: 3/10.' },
    { slot: 17, difficulty: 'medium', stem: 'A spinner is spun 20 times and lands on red 8 times. What is the experimental probability of red?', choices: [
      { text: '$\\frac{2}{5}$', is_correct: true },
      { text: '$\\frac{3}{5}$', is_correct: false, misconception_token: 'used-non-red' },
      { text: '$\\frac{20}{8}$', is_correct: false, misconception_token: 'inverted-ratio' },
      { text: '8', is_correct: false, misconception_token: 'used-count-not-probability' },
    ], solution: 'Experimental probability = 8/20 = 2/5.' },
    { slot: 18, difficulty: 'medium', stem: 'A spinner has theoretical $P(\\text{red}) = \\frac{1}{4}$. In 40 spins, how many reds are expected?', choices: [
      { text: '10', is_correct: true },
      { text: '4', is_correct: false, misconception_token: 'used-denominator' },
      { text: '40', is_correct: false, misconception_token: 'used-total-spins' },
      { text: '25', is_correct: false, misconception_token: 'used-percent-of-100' },
    ], solution: 'Expected = 40 × 1/4 = 10.' },
    { slot: 19, difficulty: 'hard', stem: 'Two dice are rolled. What is the probability the sum is 7?', choices: [
      { text: '$\\frac{1}{6}$', is_correct: true },
      { text: '$\\frac{1}{12}$', is_correct: false, misconception_token: 'undercounted-combinations' },
      { text: '$\\frac{7}{36}$', is_correct: false, misconception_token: 'used-sum-as-count' },
      { text: '$\\frac{1}{2}$', is_correct: false, misconception_token: 'guessed' },
    ], solution: 'Six ways make 7: (1,6)(2,5)(3,4)(4,3)(5,2)(6,1). 6/36 = 1/6.' },
    { slot: 20, difficulty: 'hard', stem: 'A bag has 3 red and 2 blue marbles. Two are drawn WITHOUT replacement. What is the probability both are red?', choices: [
      { text: '$\\frac{3}{10}$', is_correct: true },
      { text: '$\\frac{9}{25}$', is_correct: false, misconception_token: 'used-with-replacement' },
      { text: '$\\frac{3}{5}$', is_correct: false, misconception_token: 'used-one-draw' },
      { text: '$\\frac{1}{2}$', is_correct: false, misconception_token: 'guessed' },
    ], solution: 'First red 3/5, then 2 red of 4 left: 3/5 × 2/4 = 6/20 = 3/10.' },
  ],
}

// ============================================================================
// GRADE 11 (Algebra 2 / precalculus band)
// ============================================================================

// HSA-APR.A.1 / B.2–3 — add/subtract/multiply polynomials, factor, zeros.
const POLYNOMIAL_OPERATIONS_11: GapMathSkill = {
  slug: 'polynomial-operations',
  name: 'Polynomial Operations',
  subject: 'math',
  ccssGrade: '11',
  ccssGradeNum: 11,
  ccssCode: 'CCSS.MATH.CONTENT.HSA.APR.A.1',
  satAlignment: 'advanced-math',
  gradeBand: '9-12',
  items: [
    { slot: 1, difficulty: 'easy', stem: 'Add: $(3x^2 + 2x) + (x^2 + 5x)$.', choices: [
      { text: '$4x^2 + 7x$', is_correct: true },
      { text: '$4x^2 + 10x$', is_correct: false, misconception_token: 'added-unlike-terms' },
      { text: '$4x^4 + 7x^2$', is_correct: false, misconception_token: 'added-exponents' },
      { text: '$3x^2 + 7x$', is_correct: false, misconception_token: 'dropped-a-term' },
    ], solution: 'Combine like terms: 3x² + x² = 4x²; 2x + 5x = 7x.' },
    { slot: 2, difficulty: 'easy', stem: 'Subtract: $(5x^2 - 3x) - (2x^2 + x)$.', choices: [
      { text: '$3x^2 - 4x$', is_correct: true },
      { text: '$3x^2 - 2x$', is_correct: false, misconception_token: 'did-not-distribute-minus' },
      { text: '$7x^2 - 4x$', is_correct: false, misconception_token: 'added-first-terms' },
      { text: '$3x^2 + 4x$', is_correct: false, misconception_token: 'sign-error' },
    ], solution: 'Distribute the minus: 5x² - 3x - 2x² - x = 3x² - 4x.' },
    { slot: 3, difficulty: 'easy', stem: 'Multiply: $2x(3x + 4)$.', choices: [
      { text: '$6x^2 + 8x$', is_correct: true },
      { text: '$6x^2 + 4x$', is_correct: false, misconception_token: 'partial-distribution' },
      { text: '$6x + 8$', is_correct: false, misconception_token: 'dropped-a-variable' },
      { text: '$8x^2$', is_correct: false, misconception_token: 'combined-unlike-terms' },
    ], solution: 'Distribute: 2x·3x = 6x²; 2x·4 = 8x.' },
    { slot: 4, difficulty: 'easy', stem: 'Multiply: $(x + 3)(x + 2)$.', choices: [
      { text: '$x^2 + 5x + 6$', is_correct: true },
      { text: '$x^2 + 6$', is_correct: false, misconception_token: 'only-first-and-last' },
      { text: '$x^2 + 5x + 5$', is_correct: false, misconception_token: 'added-instead-of-multiplying-constants' },
      { text: '$x^2 + 6x + 6$', is_correct: false, misconception_token: 'added-inner-outer-wrong' },
    ], solution: 'FOIL: x² + 2x + 3x + 6 = x² + 5x + 6.' },
    { slot: 5, difficulty: 'easy', stem: 'What is the degree of $4x^3 + 2x^2 - 7$?', choices: [
      { text: '3', is_correct: true },
      { text: '4', is_correct: false, misconception_token: 'used-leading-coefficient' },
      { text: '2', is_correct: false, misconception_token: 'used-second-term' },
      { text: '9', is_correct: false, misconception_token: 'summed-exponents' },
    ], solution: 'The degree is the highest exponent, which is 3.' },
    { slot: 6, difficulty: 'easy', stem: 'Simplify: $(x^2)(x^3)$.', choices: [
      { text: '$x^5$', is_correct: true },
      { text: '$x^6$', is_correct: false, misconception_token: 'multiplied-exponents' },
      { text: '$2x^5$', is_correct: false, misconception_token: 'added-a-coefficient' },
      { text: '$x^{-1}$', is_correct: false, misconception_token: 'subtracted-exponents' },
    ], solution: 'Multiplying powers adds exponents: x^(2+3) = x⁵.' },
    { slot: 7, difficulty: 'easy', stem: 'Factor: $x^2 + 5x$.', choices: [
      { text: '$x(x + 5)$', is_correct: true },
      { text: '$(x + 5)$', is_correct: false, misconception_token: 'dropped-the-factor' },
      { text: '$x(x - 5)$', is_correct: false, misconception_token: 'sign-error' },
      { text: '$x^2 + 5$', is_correct: false, misconception_token: 'did-not-factor' },
    ], solution: 'Factor out the common x: x(x + 5).' },
    { slot: 8, difficulty: 'easy', stem: 'Simplify: $-(2x - 3)$.', choices: [
      { text: '$-2x + 3$', is_correct: true },
      { text: '$-2x - 3$', is_correct: false, misconception_token: 'did-not-distribute-to-second' },
      { text: '$2x - 3$', is_correct: false, misconception_token: 'ignored-negative' },
      { text: '$2x + 3$', is_correct: false, misconception_token: 'flipped-only-second' },
    ], solution: 'Distribute the negative to both terms: -2x + 3.' },
    { slot: 9, difficulty: 'medium', stem: 'Add: $(2x^2 + 3x - 1) + (x^2 - 4x + 5)$.', choices: [
      { text: '$3x^2 - x + 4$', is_correct: true },
      { text: '$3x^2 + 7x + 4$', is_correct: false, misconception_token: 'added-middle-signs-wrong' },
      { text: '$3x^2 - x - 4$', is_correct: false, misconception_token: 'constant-sign-error' },
      { text: '$3x^4 - x + 4$', is_correct: false, misconception_token: 'added-exponents' },
    ], solution: '3x²; 3x - 4x = -x; -1 + 5 = 4.' },
    { slot: 10, difficulty: 'medium', stem: 'Multiply: $(3x - 2)(x + 4)$.', choices: [
      { text: '$3x^2 + 10x - 8$', is_correct: true },
      { text: '$3x^2 + 10x + 8$', is_correct: false, misconception_token: 'last-term-sign-error' },
      { text: '$3x^2 + 14x - 8$', is_correct: false, misconception_token: 'added-inner-outer-wrong' },
      { text: '$3x^2 - 8$', is_correct: false, misconception_token: 'only-first-and-last' },
    ], solution: 'FOIL: 3x² + 12x - 2x - 8 = 3x² + 10x - 8.' },
    { slot: 11, difficulty: 'medium', stem: 'Multiply: $(x - 5)(x + 5)$.', choices: [
      { text: '$x^2 - 25$', is_correct: true },
      { text: '$x^2 + 25$', is_correct: false, misconception_token: 'sign-error' },
      { text: '$x^2 - 10x + 25$', is_correct: false, misconception_token: 'treated-as-square' },
      { text: '$x^2 - 10$', is_correct: false, misconception_token: 'added-instead-of-multiplying' },
    ], solution: 'Difference of squares: x² - 25.' },
    { slot: 12, difficulty: 'medium', stem: 'Expand: $(x + 4)^2$.', choices: [
      { text: '$x^2 + 8x + 16$', is_correct: true },
      { text: '$x^2 + 16$', is_correct: false, misconception_token: 'forgot-middle-term' },
      { text: '$x^2 + 8x + 8$', is_correct: false, misconception_token: 'wrong-constant' },
      { text: '$x^2 + 16x + 16$', is_correct: false, misconception_token: 'doubled-wrong-term' },
    ], solution: '(x+4)² = x² + 2·4·x + 16 = x² + 8x + 16.' },
    { slot: 13, difficulty: 'medium', stem: 'Factor: $x^2 - 9$.', choices: [
      { text: '$(x - 3)(x + 3)$', is_correct: true },
      { text: '$(x - 3)^2$', is_correct: false, misconception_token: 'treated-as-perfect-square' },
      { text: '$(x + 3)^2$', is_correct: false, misconception_token: 'sign-error' },
      { text: '$(x - 9)(x + 1)$', is_correct: false, misconception_token: 'wrong-factor-pair' },
    ], solution: 'Difference of squares: x² - 9 = (x - 3)(x + 3).' },
    { slot: 14, difficulty: 'medium', stem: 'Factor: $x^2 + 7x + 12$.', choices: [
      { text: '$(x + 3)(x + 4)$', is_correct: true },
      { text: '$(x + 2)(x + 6)$', is_correct: false, misconception_token: 'wrong-factor-pair-right-product' },
      { text: '$(x + 1)(x + 12)$', is_correct: false, misconception_token: 'used-product-not-sum' },
      { text: '$(x - 3)(x - 4)$', is_correct: false, misconception_token: 'sign-error' },
    ], solution: 'Two numbers multiply to 12 and add to 7: 3 and 4.' },
    { slot: 15, difficulty: 'medium', stem: 'Factor: $x^2 - 5x + 6$.', choices: [
      { text: '$(x - 2)(x - 3)$', is_correct: true },
      { text: '$(x + 2)(x + 3)$', is_correct: false, misconception_token: 'sign-error' },
      { text: '$(x - 1)(x - 6)$', is_correct: false, misconception_token: 'used-product-not-sum' },
      { text: '$(x - 2)(x + 3)$', is_correct: false, misconception_token: 'mixed-signs' },
    ], solution: 'Two numbers multiply to 6 and add to -5: -2 and -3.' },
    { slot: 16, difficulty: 'medium', stem: 'Divide: $\\dfrac{6x^3 + 4x^2}{2x}$.', choices: [
      { text: '$3x^2 + 2x$', is_correct: true },
      { text: '$3x^3 + 2x^2$', is_correct: false, misconception_token: 'did-not-reduce-exponents' },
      { text: '$3x + 2$', is_correct: false, misconception_token: 'over-reduced-exponents' },
      { text: '$3x^2 + 2$', is_correct: false, misconception_token: 'dropped-a-variable' },
    ], solution: 'Divide each term by 2x: 6x³/2x = 3x²; 4x²/2x = 2x.' },
    { slot: 17, difficulty: 'medium', stem: 'What are the zeros of $(x - 2)(x + 5)$?', choices: [
      { text: '$x = 2,\\ x = -5$', is_correct: true },
      { text: '$x = -2,\\ x = 5$', is_correct: false, misconception_token: 'sign-flip' },
      { text: '$x = 2,\\ x = 5$', is_correct: false, misconception_token: 'ignored-negative' },
      { text: '$x = -2,\\ x = -5$', is_correct: false, misconception_token: 'both-signs-wrong' },
    ], solution: 'Set each factor to 0: x - 2 = 0 → x = 2; x + 5 = 0 → x = -5.' },
    { slot: 18, difficulty: 'medium', stem: 'By the Remainder Theorem, what is the remainder when $P(x) = x^2 - 4$ is divided by $(x - 3)$?', choices: [
      { text: '5', is_correct: true },
      { text: '13', is_correct: false, misconception_token: 'added-instead-of-subtracting' },
      { text: '6', is_correct: false, misconception_token: 'used-3x-not-x-squared' },
      { text: '1', is_correct: false, misconception_token: 'arithmetic-slip' },
    ], solution: 'Remainder = P(3) = 3² - 4 = 9 - 4 = 5.' },
    { slot: 19, difficulty: 'hard', stem: 'Multiply: $(x + 2)(x^2 - 3x + 1)$.', choices: [
      { text: '$x^3 - x^2 - 5x + 2$', is_correct: true },
      { text: '$x^3 - 5x^2 - 5x + 2$', is_correct: false, misconception_token: 'combined-x2-terms-wrong' },
      { text: '$x^3 - x^2 + 5x + 2$', is_correct: false, misconception_token: 'x-term-sign-error' },
      { text: '$x^3 - x^2 - 5x - 2$', is_correct: false, misconception_token: 'constant-sign-error' },
    ], solution: 'x³ - 3x² + x + 2x² - 6x + 2 = x³ - x² - 5x + 2.' },
    { slot: 20, difficulty: 'hard', stem: 'Factor completely: $2x^2 + 10x + 12$.', choices: [
      { text: '$2(x + 2)(x + 3)$', is_correct: true },
      { text: '$(2x + 4)(x + 3)$', is_correct: false, misconception_token: 'not-fully-factored' },
      { text: '$2(x + 1)(x + 6)$', is_correct: false, misconception_token: 'wrong-factor-pair' },
      { text: '$(x + 2)(x + 3)$', is_correct: false, misconception_token: 'dropped-the-gcf' },
    ], solution: 'GCF 2: 2(x² + 5x + 6) = 2(x + 2)(x + 3).' },
  ],
}

// HSA-APR.D.6 / HSN-RN.A.2 — rational expressions; radicals & rational exponents.
const RATIONAL_RADICAL_EXPRESSIONS_11: GapMathSkill = {
  slug: 'rational-radical-expressions',
  name: 'Rational & Radical Expressions',
  subject: 'math',
  ccssGrade: '11',
  ccssGradeNum: 11,
  ccssCode: 'CCSS.MATH.CONTENT.HSA.APR.D.6',
  satAlignment: 'advanced-math',
  gradeBand: '9-12',
  items: [
    { slot: 1, difficulty: 'easy', stem: 'Simplify: $\\sqrt{36}$.', choices: [
      { text: '6', is_correct: true },
      { text: '18', is_correct: false, misconception_token: 'halved-instead-of-rooting' },
      { text: '72', is_correct: false, misconception_token: 'doubled' },
      { text: '1296', is_correct: false, misconception_token: 'squared-instead' },
    ], solution: '6 × 6 = 36, so √36 = 6.' },
    { slot: 2, difficulty: 'easy', stem: 'Simplify: $\\sqrt{50}$.', choices: [
      { text: '$5\\sqrt{2}$', is_correct: true },
      { text: '$25\\sqrt{2}$', is_correct: false, misconception_token: 'did-not-root-the-square' },
      { text: '$2\\sqrt{5}$', is_correct: false, misconception_token: 'swapped-factors' },
      { text: '$5\\sqrt{10}$', is_correct: false, misconception_token: 'wrong-factor-pair' },
    ], solution: '√50 = √(25·2) = 5√2.' },
    { slot: 3, difficulty: 'easy', stem: 'Evaluate: $8^{1/3}$.', choices: [
      { text: '2', is_correct: true },
      { text: '4', is_correct: false, misconception_token: 'divided-by-power' },
      { text: '24', is_correct: false, misconception_token: 'multiplied-by-power' },
      { text: '512', is_correct: false, misconception_token: 'cubed-instead' },
    ], solution: '8^(1/3) is the cube root of 8, which is 2.' },
    { slot: 4, difficulty: 'easy', stem: 'Simplify (for $x \\neq 0$): $\\dfrac{x^2}{x}$.', choices: [
      { text: '$x$', is_correct: true },
      { text: '$x^2$', is_correct: false, misconception_token: 'did-not-reduce' },
      { text: '$x^3$', is_correct: false, misconception_token: 'added-exponents' },
      { text: '$1$', is_correct: false, misconception_token: 'cancelled-everything' },
    ], solution: 'x²/x = x^(2-1) = x.' },
    { slot: 5, difficulty: 'easy', stem: 'Simplify (for $x \\neq 0$): $\\dfrac{xy}{x}$.', choices: [
      { text: '$y$', is_correct: true },
      { text: '$xy$', is_correct: false, misconception_token: 'did-not-cancel' },
      { text: '$x$', is_correct: false, misconception_token: 'cancelled-wrong-variable' },
      { text: '$1$', is_correct: false, misconception_token: 'cancelled-everything' },
    ], solution: 'The x cancels, leaving y.' },
    { slot: 6, difficulty: 'easy', stem: 'Evaluate: $16^{1/2}$.', choices: [
      { text: '4', is_correct: true },
      { text: '8', is_correct: false, misconception_token: 'halved-instead-of-rooting' },
      { text: '32', is_correct: false, misconception_token: 'multiplied' },
      { text: '256', is_correct: false, misconception_token: 'squared-instead' },
    ], solution: '16^(1/2) = √16 = 4.' },
    { slot: 7, difficulty: 'easy', stem: 'Evaluate: $\\sqrt{9} + \\sqrt{16}$.', choices: [
      { text: '7', is_correct: true },
      { text: '5', is_correct: false, misconception_token: 'rooted-the-sum' },
      { text: '25', is_correct: false, misconception_token: 'added-under-root-no-root' },
      { text: '12', is_correct: false, misconception_token: 'arithmetic-slip' },
    ], solution: '√9 = 3 and √16 = 4, so 3 + 4 = 7.' },
    { slot: 8, difficulty: 'easy', stem: 'Simplify (for $x \\neq 0$): $\\dfrac{6x^2}{2x}$.', choices: [
      { text: '$3x$', is_correct: true },
      { text: '$3x^2$', is_correct: false, misconception_token: 'did-not-reduce-exponent' },
      { text: '$3$', is_correct: false, misconception_token: 'cancelled-all-x' },
      { text: '$4x$', is_correct: false, misconception_token: 'subtracted-coefficients' },
    ], solution: '6/2 = 3 and x²/x = x, so 3x.' },
    { slot: 9, difficulty: 'medium', stem: 'Simplify (for $x \\neq 3$): $\\dfrac{x^2 - 9}{x - 3}$.', choices: [
      { text: '$x + 3$', is_correct: true },
      { text: '$x - 3$', is_correct: false, misconception_token: 'sign-error' },
      { text: '$x + 9$', is_correct: false, misconception_token: 'kept-constant' },
      { text: '$3$', is_correct: false, misconception_token: 'cancelled-terms-not-factors' },
    ], solution: 'x² - 9 = (x - 3)(x + 3); cancel (x - 3) to get x + 3.' },
    { slot: 10, difficulty: 'medium', stem: 'Simplify (for $x \\neq -2$): $\\dfrac{x^2 + 5x + 6}{x + 2}$.', choices: [
      { text: '$x + 3$', is_correct: true },
      { text: '$x + 2$', is_correct: false, misconception_token: 'cancelled-wrong-factor' },
      { text: '$x + 6$', is_correct: false, misconception_token: 'kept-constant' },
      { text: '$x - 3$', is_correct: false, misconception_token: 'sign-error' },
    ], solution: 'Factor: (x + 2)(x + 3)/(x + 2) = x + 3.' },
    { slot: 11, difficulty: 'medium', stem: 'Multiply: $\\dfrac{2}{x} \\cdot \\dfrac{3}{x^2}$.', choices: [
      { text: '$\\dfrac{6}{x^3}$', is_correct: true },
      { text: '$\\dfrac{6}{x^2}$', is_correct: false, misconception_token: 'did-not-add-exponents' },
      { text: '$\\dfrac{5}{x^3}$', is_correct: false, misconception_token: 'added-numerators' },
      { text: '$\\dfrac{6}{x}$', is_correct: false, misconception_token: 'subtracted-exponents' },
    ], solution: 'Multiply across: (2·3)/(x·x²) = 6/x³.' },
    { slot: 12, difficulty: 'medium', stem: 'Add (for $x \\neq 0$): $\\dfrac{1}{x} + \\dfrac{2}{x}$.', choices: [
      { text: '$\\dfrac{3}{x}$', is_correct: true },
      { text: '$\\dfrac{3}{2x}$', is_correct: false, misconception_token: 'added-denominators' },
      { text: '$\\dfrac{3}{x^2}$', is_correct: false, misconception_token: 'multiplied-denominators' },
      { text: '$\\dfrac{2}{x^2}$', is_correct: false, misconception_token: 'multiplied-instead-of-adding' },
    ], solution: 'Same denominator: (1 + 2)/x = 3/x.' },
    { slot: 13, difficulty: 'medium', stem: 'Simplify (for $x \\geq 0$): $\\sqrt{x^2}$.', choices: [
      { text: '$x$', is_correct: true },
      { text: '$x^2$', is_correct: false, misconception_token: 'did-not-root' },
      { text: '$2x$', is_correct: false, misconception_token: 'multiplied-by-index' },
      { text: '$\\sqrt{x}$', is_correct: false, misconception_token: 'half-rooted' },
    ], solution: 'For x ≥ 0, √(x²) = x.' },
    { slot: 14, difficulty: 'medium', stem: 'Simplify: $\\sqrt{8} \\cdot \\sqrt{2}$.', choices: [
      { text: '4', is_correct: true },
      { text: '$\\sqrt{10}$', is_correct: false, misconception_token: 'added-under-root' },
      { text: '16', is_correct: false, misconception_token: 'did-not-take-root' },
      { text: '$2\\sqrt{2}$', is_correct: false, misconception_token: 'stopped-early' },
    ], solution: '√8·√2 = √16 = 4.' },
    { slot: 15, difficulty: 'medium', stem: 'Simplify (for $x, y \\neq 0$): $\\dfrac{x^3 y^2}{xy}$.', choices: [
      { text: '$x^2 y$', is_correct: true },
      { text: '$x^2 y^2$', is_correct: false, misconception_token: 'did-not-reduce-y' },
      { text: '$x^4 y^3$', is_correct: false, misconception_token: 'added-exponents' },
      { text: '$x^3 y$', is_correct: false, misconception_token: 'did-not-reduce-x' },
    ], solution: 'x³/x = x²; y²/y = y, so x²y.' },
    { slot: 16, difficulty: 'medium', stem: 'Evaluate: $27^{2/3}$.', choices: [
      { text: '9', is_correct: true },
      { text: '18', is_correct: false, misconception_token: 'multiplied-by-fraction' },
      { text: '3', is_correct: false, misconception_token: 'ignored-the-power-2' },
      { text: '729', is_correct: false, misconception_token: 'used-exponent-2-3' },
    ], solution: '27^(2/3) = (27^(1/3))² = 3² = 9.' },
    { slot: 17, difficulty: 'medium', stem: 'Divide: $\\dfrac{x/3}{2/x}$ (for $x \\neq 0$).', choices: [
      { text: '$\\dfrac{x^2}{6}$', is_correct: true },
      { text: '$\\dfrac{2}{3}$', is_correct: false, misconception_token: 'cancelled-x-wrong' },
      { text: '$\\dfrac{6}{x^2}$', is_correct: false, misconception_token: 'did-not-flip' },
      { text: '$\\dfrac{x}{6}$', is_correct: false, misconception_token: 'dropped-a-variable' },
    ], solution: 'Multiply by the reciprocal: (x/3)·(x/2) = x²/6.' },
    { slot: 18, difficulty: 'medium', stem: 'Simplify (for $x \\geq 0$): $\\sqrt{4x^2}$.', choices: [
      { text: '$2x$', is_correct: true },
      { text: '$4x$', is_correct: false, misconception_token: 'did-not-root-the-4' },
      { text: '$2x^2$', is_correct: false, misconception_token: 'did-not-root-the-x' },
      { text: '$\\sqrt{2}x$', is_correct: false, misconception_token: 'wrong-root-of-4' },
    ], solution: '√4 = 2 and √(x²) = x, so 2x.' },
    { slot: 19, difficulty: 'hard', stem: 'Simplify (for $x \\neq -2$): $\\dfrac{x^2 - 4}{x^2 + 4x + 4}$.', choices: [
      { text: '$\\dfrac{x - 2}{x + 2}$', is_correct: true },
      { text: '$\\dfrac{x + 2}{x - 2}$', is_correct: false, misconception_token: 'inverted-result' },
      { text: '$1$', is_correct: false, misconception_token: 'cancelled-everything' },
      { text: '$\\dfrac{1}{x + 2}$', is_correct: false, misconception_token: 'dropped-a-factor' },
    ], solution: '(x-2)(x+2) / (x+2)² = (x - 2)/(x + 2).' },
    { slot: 20, difficulty: 'hard', stem: 'Simplify: $\\sqrt{18} + \\sqrt{8}$.', choices: [
      { text: '$5\\sqrt{2}$', is_correct: true },
      { text: '$\\sqrt{26}$', is_correct: false, misconception_token: 'added-under-root' },
      { text: '$6\\sqrt{2}$', is_correct: false, misconception_token: 'arithmetic-slip' },
      { text: '$5\\sqrt{10}$', is_correct: false, misconception_token: 'wrong-radicand' },
    ], solution: '√18 = 3√2, √8 = 2√2; 3√2 + 2√2 = 5√2.' },
  ],
}

// HSF-IF.C.7a / HSA-SSE.B.3 — quadratic functions: forms, graphs, key features.
const QUADRATIC_FUNCTIONS_11: GapMathSkill = {
  slug: 'quadratic-functions',
  name: 'Quadratic Functions',
  subject: 'math',
  ccssGrade: '11',
  ccssGradeNum: 11,
  ccssCode: 'CCSS.MATH.CONTENT.HSF.IF.C.7',
  satAlignment: 'advanced-math',
  gradeBand: '9-12',
  items: [
    { slot: 1, difficulty: 'easy', stem: 'What is the vertex of $y = x^2 + 3$?', choices: [
      { text: '$(0, 3)$', is_correct: true },
      { text: '$(3, 0)$', is_correct: false, misconception_token: 'swapped-coordinates' },
      { text: '$(0, -3)$', is_correct: false, misconception_token: 'sign-error' },
      { text: '$(-3, 0)$', is_correct: false, misconception_token: 'swapped-and-sign' },
    ], solution: 'y = x² + 3 has vertex at (0, 3), shifted up 3.' },
    { slot: 2, difficulty: 'easy', stem: 'The parabola $y = -2x^2$ opens:', choices: [
      { text: 'downward', is_correct: true },
      { text: 'upward', is_correct: false, misconception_token: 'ignored-negative-leading' },
      { text: 'sideways', is_correct: false, misconception_token: 'confused-with-x-equals' },
      { text: 'it is a straight line', is_correct: false, misconception_token: 'not-recognized-as-quadratic' },
    ], solution: 'A negative leading coefficient opens the parabola downward.' },
    { slot: 3, difficulty: 'easy', stem: 'What is the axis of symmetry of $y = x^2$?', choices: [
      { text: '$x = 0$', is_correct: true },
      { text: '$y = 0$', is_correct: false, misconception_token: 'used-wrong-variable' },
      { text: '$x = 1$', is_correct: false, misconception_token: 'guessed-nonzero' },
      { text: '$x = 2$', is_correct: false, misconception_token: 'guessed-value' },
    ], solution: 'The axis of symmetry passes through the vertex (0,0): x = 0.' },
    { slot: 4, difficulty: 'easy', stem: 'What are the x-intercepts of $y = (x - 4)(x + 2)$?', choices: [
      { text: '$x = 4,\\ x = -2$', is_correct: true },
      { text: '$x = -4,\\ x = 2$', is_correct: false, misconception_token: 'sign-flip' },
      { text: '$x = 4,\\ x = 2$', is_correct: false, misconception_token: 'ignored-negative' },
      { text: '$x = -4,\\ x = -2$', is_correct: false, misconception_token: 'both-signs-wrong' },
    ], solution: 'Set each factor to 0: x = 4 and x = -2.' },
    { slot: 5, difficulty: 'easy', stem: 'What are the x-intercepts of $y = x^2 - 9$?', choices: [
      { text: '$x = 3,\\ x = -3$', is_correct: true },
      { text: '$x = 9,\\ x = -9$', is_correct: false, misconception_token: 'did-not-take-root' },
      { text: '$x = 3$ only', is_correct: false, misconception_token: 'missed-negative-root' },
      { text: '$x = 81$', is_correct: false, misconception_token: 'squared-instead' },
    ], solution: 'x² = 9, so x = ±3.' },
    { slot: 6, difficulty: 'easy', stem: 'What is the vertex of $y = (x - 2)^2 + 5$?', choices: [
      { text: '$(2, 5)$', is_correct: true },
      { text: '$(-2, 5)$', is_correct: false, misconception_token: 'sign-of-h-error' },
      { text: '$(2, -5)$', is_correct: false, misconception_token: 'sign-of-k-error' },
      { text: '$(5, 2)$', is_correct: false, misconception_token: 'swapped-coordinates' },
    ], solution: 'Vertex form y = (x - h)² + k gives vertex (2, 5).' },
    { slot: 7, difficulty: 'easy', stem: 'What is the vertex of $y = (x + 3)^2 - 1$?', choices: [
      { text: '$(-3, -1)$', is_correct: true },
      { text: '$(3, -1)$', is_correct: false, misconception_token: 'sign-of-h-error' },
      { text: '$(-3, 1)$', is_correct: false, misconception_token: 'sign-of-k-error' },
      { text: '$(3, 1)$', is_correct: false, misconception_token: 'both-signs-wrong' },
    ], solution: '(x + 3)² = (x - (-3))², so h = -3, k = -1: vertex (-3, -1).' },
    { slot: 8, difficulty: 'easy', stem: 'The graph of $y = x^2$ is called a:', choices: [
      { text: 'parabola', is_correct: true },
      { text: 'line', is_correct: false, misconception_token: 'confused-with-linear' },
      { text: 'circle', is_correct: false, misconception_token: 'confused-with-conic' },
      { text: 'V-shape', is_correct: false, misconception_token: 'confused-with-absolute-value' },
    ], solution: 'A quadratic graphs as a parabola.' },
    { slot: 9, difficulty: 'medium', stem: 'What is the axis of symmetry of $y = x^2 - 6x + 5$?', choices: [
      { text: '$x = 3$', is_correct: true },
      { text: '$x = -3$', is_correct: false, misconception_token: 'forgot-negative-in-formula' },
      { text: '$x = 6$', is_correct: false, misconception_token: 'used-b-not-b-over-2a' },
      { text: '$x = 5$', is_correct: false, misconception_token: 'used-constant' },
    ], solution: 'x = -b/(2a) = -(-6)/2 = 3.' },
    { slot: 10, difficulty: 'medium', stem: 'What is the vertex of $y = x^2 - 6x + 5$?', choices: [
      { text: '$(3, -4)$', is_correct: true },
      { text: '$(3, 4)$', is_correct: false, misconception_token: 'y-sign-error' },
      { text: '$(-3, -4)$', is_correct: false, misconception_token: 'x-sign-error' },
      { text: '$(3, 5)$', is_correct: false, misconception_token: 'used-constant-as-y' },
    ], solution: 'x = 3; y = 3² - 6·3 + 5 = 9 - 18 + 5 = -4.' },
    { slot: 11, difficulty: 'medium', stem: 'What are the x-intercepts of $y = x^2 - 4x + 3$?', choices: [
      { text: '$x = 1,\\ x = 3$', is_correct: true },
      { text: '$x = -1,\\ x = -3$', is_correct: false, misconception_token: 'sign-error' },
      { text: '$x = 1,\\ x = -3$', is_correct: false, misconception_token: 'mixed-signs' },
      { text: '$x = 4,\\ x = 3$', is_correct: false, misconception_token: 'used-coefficients' },
    ], solution: 'Factor: (x - 1)(x - 3) = 0, so x = 1 and x = 3.' },
    { slot: 12, difficulty: 'medium', stem: 'How many real x-intercepts does $y = x^2 + 1$ have?', choices: [
      { text: '0', is_correct: true },
      { text: '1', is_correct: false, misconception_token: 'assumed-vertex-touches' },
      { text: '2', is_correct: false, misconception_token: 'assumed-two-roots' },
      { text: 'infinitely many', is_correct: false, misconception_token: 'misunderstood-graph' },
    ], solution: 'x² + 1 = 0 has no real solution (x² = -1), so 0 x-intercepts.' },
    { slot: 13, difficulty: 'medium', stem: 'Compared with $y = x^2$, the graph of $y = 2x^2$ is:', choices: [
      { text: 'narrower', is_correct: true },
      { text: 'wider', is_correct: false, misconception_token: 'reversed-effect' },
      { text: 'the same width', is_correct: false, misconception_token: 'ignored-coefficient' },
      { text: 'opens downward', is_correct: false, misconception_token: 'confused-sign-with-size' },
    ], solution: 'A larger leading coefficient makes the parabola narrower (steeper).' },
    { slot: 14, difficulty: 'medium', stem: 'What is the minimum value of $y = x^2 - 4$?', choices: [
      { text: '-4', is_correct: true },
      { text: '0', is_correct: false, misconception_token: 'used-vertex-x' },
      { text: '4', is_correct: false, misconception_token: 'sign-error' },
      { text: '-2', is_correct: false, misconception_token: 'guessed' },
    ], solution: 'The vertex is (0, -4), so the minimum y-value is -4.' },
    { slot: 15, difficulty: 'medium', stem: 'The function $y = -(x - 1)^2 + 4$ has a:', choices: [
      { text: 'maximum of 4', is_correct: true },
      { text: 'minimum of 4', is_correct: false, misconception_token: 'ignored-negative-leading' },
      { text: 'maximum of 1', is_correct: false, misconception_token: 'used-h-not-k' },
      { text: 'minimum of -4', is_correct: false, misconception_token: 'sign-and-type-error' },
    ], solution: 'Negative leading coefficient opens down, so vertex k = 4 is a maximum.' },
    { slot: 16, difficulty: 'medium', stem: 'Write $y = (x - 3)^2$ in standard form.', choices: [
      { text: '$y = x^2 - 6x + 9$', is_correct: true },
      { text: '$y = x^2 + 9$', is_correct: false, misconception_token: 'forgot-middle-term' },
      { text: '$y = x^2 - 9$', is_correct: false, misconception_token: 'sign-and-middle-error' },
      { text: '$y = x^2 - 6x - 9$', is_correct: false, misconception_token: 'constant-sign-error' },
    ], solution: '(x - 3)² = x² - 6x + 9.' },
    { slot: 17, difficulty: 'medium', stem: 'Factor $y = x^2 + 2x + 1$ into a perfect square.', choices: [
      { text: '$y = (x + 1)^2$', is_correct: true },
      { text: '$y = (x - 1)^2$', is_correct: false, misconception_token: 'sign-error' },
      { text: '$y = (x + 1)(x - 1)$', is_correct: false, misconception_token: 'difference-of-squares-confusion' },
      { text: '$y = (x + 2)(x + 1)$', is_correct: false, misconception_token: 'wrong-factor-pair' },
    ], solution: 'x² + 2x + 1 = (x + 1)².' },
    { slot: 18, difficulty: 'medium', stem: 'What is the y-intercept of $y = x^2 - 5x + 6$?', choices: [
      { text: '$(0, 6)$', is_correct: true },
      { text: '$(6, 0)$', is_correct: false, misconception_token: 'swapped-with-x-intercept' },
      { text: '$(0, -6)$', is_correct: false, misconception_token: 'sign-error' },
      { text: '$(0, 5)$', is_correct: false, misconception_token: 'used-b-not-c' },
    ], solution: 'Set x = 0: y = 6, so the y-intercept is (0, 6).' },
    { slot: 19, difficulty: 'hard', stem: 'Find the vertex of $y = x^2 + 4x + 1$ by completing the square.', choices: [
      { text: '$(-2, -3)$', is_correct: true },
      { text: '$(2, -3)$', is_correct: false, misconception_token: 'x-sign-error' },
      { text: '$(-2, 3)$', is_correct: false, misconception_token: 'y-sign-error' },
      { text: '$(-4, 1)$', is_correct: false, misconception_token: 'used-b-and-c' },
    ], solution: 'x² + 4x + 1 = (x + 2)² - 3, so the vertex is (-2, -3).' },
    { slot: 20, difficulty: 'hard', stem: 'Write $y = x^2 - 2x - 8$ in factored form.', choices: [
      { text: '$y = (x - 4)(x + 2)$', is_correct: true },
      { text: '$y = (x + 4)(x - 2)$', is_correct: false, misconception_token: 'sign-flip' },
      { text: '$y = (x - 4)(x - 2)$', is_correct: false, misconception_token: 'both-negative' },
      { text: '$y = (x - 8)(x + 1)$', is_correct: false, misconception_token: 'used-product-not-sum' },
    ], solution: 'Two numbers multiply to -8 and add to -2: -4 and 2.' },
  ],
}

// HSF-LE.A.4 / HSF-IF.C.8 — exponential & logarithmic functions and equations.
const EXPONENTIAL_LOGARITHMIC_11: GapMathSkill = {
  slug: 'exponential-logarithmic',
  name: 'Exponential & Logarithmic',
  subject: 'math',
  ccssGrade: '11',
  ccssGradeNum: 11,
  ccssCode: 'CCSS.MATH.CONTENT.HSF.LE.A.4',
  satAlignment: 'advanced-math',
  gradeBand: '9-12',
  items: [
    { slot: 1, difficulty: 'easy', stem: 'Evaluate: $2^3$.', choices: [
      { text: '8', is_correct: true },
      { text: '6', is_correct: false, misconception_token: 'multiplied-base-times-exponent' },
      { text: '9', is_correct: false, misconception_token: 'wrong-power' },
      { text: '5', is_correct: false, misconception_token: 'added-base-and-exponent' },
    ], solution: '2³ = 2·2·2 = 8.' },
    { slot: 2, difficulty: 'easy', stem: 'Evaluate: $5^0$.', choices: [
      { text: '1', is_correct: true },
      { text: '0', is_correct: false, misconception_token: 'zero-exponent-equals-zero' },
      { text: '5', is_correct: false, misconception_token: 'ignored-exponent' },
      { text: 'undefined', is_correct: false, misconception_token: 'confused-with-zero-base' },
    ], solution: 'Any nonzero number to the 0 power is 1.' },
    { slot: 3, difficulty: 'easy', stem: 'Evaluate: $\\log_2(8)$.', choices: [
      { text: '3', is_correct: true },
      { text: '4', is_correct: false, misconception_token: 'off-by-one' },
      { text: '16', is_correct: false, misconception_token: 'multiplied-base-and-argument' },
      { text: '2', is_correct: false, misconception_token: 'used-base-as-answer' },
    ], solution: 'log₂(8) asks 2 to what power is 8? 2³ = 8, so 3.' },
    { slot: 4, difficulty: 'easy', stem: 'Evaluate: $10^2$.', choices: [
      { text: '100', is_correct: true },
      { text: '20', is_correct: false, misconception_token: 'multiplied-base-times-exponent' },
      { text: '1000', is_correct: false, misconception_token: 'wrong-power' },
      { text: '12', is_correct: false, misconception_token: 'added' },
    ], solution: '10² = 100.' },
    { slot: 5, difficulty: 'easy', stem: 'Evaluate: $\\log_{10}(100)$.', choices: [
      { text: '2', is_correct: true },
      { text: '10', is_correct: false, misconception_token: 'used-base' },
      { text: '100', is_correct: false, misconception_token: 'used-argument' },
      { text: '1', is_correct: false, misconception_token: 'off-by-one' },
    ], solution: '10² = 100, so log₁₀(100) = 2.' },
    { slot: 6, difficulty: 'easy', stem: 'Evaluate: $3^{-1}$.', choices: [
      { text: '$\\dfrac{1}{3}$', is_correct: true },
      { text: '$-3$', is_correct: false, misconception_token: 'made-base-negative' },
      { text: '$3$', is_correct: false, misconception_token: 'ignored-negative-exponent' },
      { text: '$-\\dfrac{1}{3}$', is_correct: false, misconception_token: 'kept-negative-sign' },
    ], solution: 'A negative exponent takes the reciprocal: 3⁻¹ = 1/3.' },
    { slot: 7, difficulty: 'easy', stem: 'If $y = 2^x$, what is $y$ when $x = 4$?', choices: [
      { text: '16', is_correct: true },
      { text: '8', is_correct: false, misconception_token: 'off-by-one-power' },
      { text: '6', is_correct: false, misconception_token: 'multiplied-base-times-exponent' },
      { text: '32', is_correct: false, misconception_token: 'used-wrong-power' },
    ], solution: '2⁴ = 16.' },
    { slot: 8, difficulty: 'easy', stem: 'Evaluate: $\\log_3(1)$.', choices: [
      { text: '0', is_correct: true },
      { text: '1', is_correct: false, misconception_token: 'confused-log-of-one' },
      { text: '3', is_correct: false, misconception_token: 'used-base' },
      { text: 'undefined', is_correct: false, misconception_token: 'thought-undefined' },
    ], solution: '3⁰ = 1, so log₃(1) = 0.' },
    { slot: 9, difficulty: 'medium', stem: 'Solve for $x$: $2^x = 16$.', choices: [
      { text: '$x = 4$', is_correct: true },
      { text: '$x = 8$', is_correct: false, misconception_token: 'divided-by-base' },
      { text: '$x = 2$', is_correct: false, misconception_token: 'off-by-power' },
      { text: '$x = 32$', is_correct: false, misconception_token: 'multiplied' },
    ], solution: '2⁴ = 16, so x = 4.' },
    { slot: 10, difficulty: 'medium', stem: 'Solve for $x$: $3^x = 27$.', choices: [
      { text: '$x = 3$', is_correct: true },
      { text: '$x = 9$', is_correct: false, misconception_token: 'divided-by-base' },
      { text: '$x = 24$', is_correct: false, misconception_token: 'subtracted' },
      { text: '$x = 2$', is_correct: false, misconception_token: 'off-by-power' },
    ], solution: '3³ = 27, so x = 3.' },
    { slot: 11, difficulty: 'medium', stem: 'Evaluate: $\\log_5(25)$.', choices: [
      { text: '2', is_correct: true },
      { text: '5', is_correct: false, misconception_token: 'used-base' },
      { text: '20', is_correct: false, misconception_token: 'subtracted' },
      { text: '3', is_correct: false, misconception_token: 'off-by-one' },
    ], solution: '5² = 25, so log₅(25) = 2.' },
    { slot: 12, difficulty: 'medium', stem: 'Evaluate: $4^{3/2}$.', choices: [
      { text: '8', is_correct: true },
      { text: '6', is_correct: false, misconception_token: 'multiplied-base-by-fraction' },
      { text: '64', is_correct: false, misconception_token: 'used-exponent-3' },
      { text: '16', is_correct: false, misconception_token: 'squared-only' },
    ], solution: '4^(3/2) = (√4)³ = 2³ = 8.' },
    { slot: 13, difficulty: 'medium', stem: 'A colony of 100 bacteria doubles every hour. How many are there after 3 hours?', choices: [
      { text: '800', is_correct: true },
      { text: '600', is_correct: false, misconception_token: 'multiplied-by-6' },
      { text: '300', is_correct: false, misconception_token: 'multiplied-by-3' },
      { text: '1600', is_correct: false, misconception_token: 'doubled-too-many-times' },
    ], solution: '100 × 2³ = 100 × 8 = 800.' },
    { slot: 14, difficulty: 'medium', stem: 'Rewrite $\\log_2(8) = 3$ in exponential form.', choices: [
      { text: '$2^3 = 8$', is_correct: true },
      { text: '$3^2 = 9$', is_correct: false, misconception_token: 'swapped-base-and-exponent' },
      { text: '$8^3 = 512$', is_correct: false, misconception_token: 'used-argument-as-base' },
      { text: '$2^8 = 256$', is_correct: false, misconception_token: 'swapped-exponent-and-argument' },
    ], solution: 'log_b(y) = x means bˣ = y, so 2³ = 8.' },
    { slot: 15, difficulty: 'medium', stem: 'Solve for $x$: $10^x = 1000$.', choices: [
      { text: '$x = 3$', is_correct: true },
      { text: '$x = 100$', is_correct: false, misconception_token: 'divided-by-ten' },
      { text: '$x = 2$', is_correct: false, misconception_token: 'off-by-power' },
      { text: '$x = 30$', is_correct: false, misconception_token: 'multiplied' },
    ], solution: '10³ = 1000, so x = 3.' },
    { slot: 16, difficulty: 'medium', stem: '$500 is invested and doubles each year. What is its value after 2 years?', choices: [
      { text: '$2000', is_correct: true },
      { text: '$1000', is_correct: false, misconception_token: 'doubled-once' },
      { text: '$1500', is_correct: false, misconception_token: 'added-linearly' },
      { text: '$4000', is_correct: false, misconception_token: 'doubled-too-many-times' },
    ], solution: '500 × 2² = 500 × 4 = $2000.' },
    { slot: 17, difficulty: 'medium', stem: 'Simplify: $2^x \\cdot 2^3$.', choices: [
      { text: '$2^{x+3}$', is_correct: true },
      { text: '$2^{3x}$', is_correct: false, misconception_token: 'multiplied-exponents' },
      { text: '$4^{x+3}$', is_correct: false, misconception_token: 'added-bases' },
      { text: '$2^{x \\cdot 3}$', is_correct: false, misconception_token: 'multiplied-exponents-form' },
    ], solution: 'Same base multiplies by adding exponents: 2^(x+3).' },
    { slot: 18, difficulty: 'medium', stem: 'Evaluate $\\log(1000)$ (base 10).', choices: [
      { text: '3', is_correct: true },
      { text: '100', is_correct: false, misconception_token: 'used-argument' },
      { text: '10', is_correct: false, misconception_token: 'used-base' },
      { text: '30', is_correct: false, misconception_token: 'multiplied' },
    ], solution: '10³ = 1000, so log(1000) = 3.' },
    { slot: 19, difficulty: 'hard', stem: 'Solve for $x$: $2^{x+1} = 32$.', choices: [
      { text: '$x = 4$', is_correct: true },
      { text: '$x = 5$', is_correct: false, misconception_token: 'forgot-to-subtract-one' },
      { text: '$x = 15$', is_correct: false, misconception_token: 'divided-by-base' },
      { text: '$x = 3$', is_correct: false, misconception_token: 'off-by-one' },
    ], solution: '32 = 2⁵, so x + 1 = 5, giving x = 4.' },
    { slot: 20, difficulty: 'hard', stem: 'A $20,000 car loses 10% of its value each year. What is it worth after 2 years?', choices: [
      { text: '$16,200', is_correct: true },
      { text: '$16,000', is_correct: false, misconception_token: 'subtracted-linearly' },
      { text: '$18,000', is_correct: false, misconception_token: 'depreciated-once' },
      { text: '$12,000', is_correct: false, misconception_token: 'subtracted-40-percent' },
    ], solution: '20000 × 0.9² = 20000 × 0.81 = $16,200.' },
  ],
}

// HSA-REI.C.6/7 — systems of equations, including linear-quadratic.
const SYSTEMS_OF_EQUATIONS_11: GapMathSkill = {
  slug: 'systems-of-equations',
  name: 'Systems of Equations',
  subject: 'math',
  ccssGrade: '11',
  ccssGradeNum: 11,
  ccssCode: 'CCSS.MATH.CONTENT.HSA.REI.C.7',
  satAlignment: 'algebra',
  gradeBand: '9-12',
  items: [
    { slot: 1, difficulty: 'easy', stem: 'Solve the system: $y = x$ and $y = 4$.', choices: [
      { text: '$(4, 4)$', is_correct: true },
      { text: '$(0, 4)$', is_correct: false, misconception_token: 'used-wrong-x' },
      { text: '$(4, 0)$', is_correct: false, misconception_token: 'swapped-coordinates' },
      { text: '$(2, 2)$', is_correct: false, misconception_token: 'guessed' },
    ], solution: 'Since y = 4 and y = x, x = 4: (4, 4).' },
    { slot: 2, difficulty: 'easy', stem: 'Solve: $x + y = 10$ and $x - y = 2$.', choices: [
      { text: '$(6, 4)$', is_correct: true },
      { text: '$(4, 6)$', is_correct: false, misconception_token: 'swapped-values' },
      { text: '$(8, 2)$', is_correct: false, misconception_token: 'used-difference-as-y' },
      { text: '$(5, 5)$', is_correct: false, misconception_token: 'split-evenly' },
    ], solution: 'Add the equations: 2x = 12 → x = 6; then y = 4.' },
    { slot: 3, difficulty: 'easy', stem: 'Solve: $y = 2x$ and $y = x + 3$.', choices: [
      { text: '$(3, 6)$', is_correct: true },
      { text: '$(6, 3)$', is_correct: false, misconception_token: 'swapped-coordinates' },
      { text: '$(1, 2)$', is_correct: false, misconception_token: 'guessed' },
      { text: '$(3, 3)$', is_correct: false, misconception_token: 'used-wrong-y' },
    ], solution: '2x = x + 3 → x = 3; y = 2·3 = 6.' },
    { slot: 4, difficulty: 'easy', stem: 'Solve: $x = 5$ and $x + y = 8$.', choices: [
      { text: '$(5, 3)$', is_correct: true },
      { text: '$(5, 8)$', is_correct: false, misconception_token: 'forgot-to-subtract' },
      { text: '$(3, 5)$', is_correct: false, misconception_token: 'swapped-coordinates' },
      { text: '$(5, 13)$', is_correct: false, misconception_token: 'added-instead' },
    ], solution: 'Substitute x = 5: 5 + y = 8 → y = 3.' },
    { slot: 5, difficulty: 'easy', stem: 'Solve: $y = 3x$ and $y = 12$.', choices: [
      { text: '$(4, 12)$', is_correct: true },
      { text: '$(12, 4)$', is_correct: false, misconception_token: 'swapped-coordinates' },
      { text: '$(4, 4)$', is_correct: false, misconception_token: 'used-wrong-y' },
      { text: '$(36, 12)$', is_correct: false, misconception_token: 'multiplied-instead-of-dividing' },
    ], solution: '12 = 3x → x = 4: (4, 12).' },
    { slot: 6, difficulty: 'easy', stem: 'On a graph, the solution to a system of two equations is where the graphs:', choices: [
      { text: 'intersect', is_correct: true },
      { text: 'are parallel', is_correct: false, misconception_token: 'parallel-means-solution' },
      { text: 'cross the y-axis', is_correct: false, misconception_token: 'confused-with-intercept' },
      { text: 'have the same slope', is_correct: false, misconception_token: 'confused-slope-with-solution' },
    ], solution: 'The solution is the point(s) where the graphs intersect.' },
    { slot: 7, difficulty: 'easy', stem: 'Solve: $y = x + 1$ and $y = -x + 5$.', choices: [
      { text: '$(2, 3)$', is_correct: true },
      { text: '$(3, 2)$', is_correct: false, misconception_token: 'swapped-coordinates' },
      { text: '$(2, 5)$', is_correct: false, misconception_token: 'used-wrong-equation-for-y' },
      { text: '$(4, 3)$', is_correct: false, misconception_token: 'arithmetic-slip' },
    ], solution: 'x + 1 = -x + 5 → 2x = 4 → x = 2; y = 3.' },
    { slot: 8, difficulty: 'easy', stem: 'How many solutions do two parallel lines have?', choices: [
      { text: '0', is_correct: true },
      { text: '1', is_correct: false, misconception_token: 'assumed-they-cross' },
      { text: '2', is_correct: false, misconception_token: 'guessed' },
      { text: 'infinitely many', is_correct: false, misconception_token: 'confused-with-same-line' },
    ], solution: 'Parallel lines never intersect, so there is no solution.' },
    { slot: 9, difficulty: 'medium', stem: 'Solve by substitution: $y = 2x + 1$ and $3x + y = 11$.', choices: [
      { text: '$(2, 5)$', is_correct: true },
      { text: '$(5, 2)$', is_correct: false, misconception_token: 'swapped-coordinates' },
      { text: '$(2, 11)$', is_correct: false, misconception_token: 'used-wrong-y' },
      { text: '$(1, 3)$', is_correct: false, misconception_token: 'arithmetic-slip' },
    ], solution: '3x + (2x + 1) = 11 → 5x = 10 → x = 2; y = 5.' },
    { slot: 10, difficulty: 'medium', stem: 'Solve by elimination: $2x + y = 7$ and $x - y = 2$.', choices: [
      { text: '$(3, 1)$', is_correct: true },
      { text: '$(1, 3)$', is_correct: false, misconception_token: 'swapped-coordinates' },
      { text: '$(3, 7)$', is_correct: false, misconception_token: 'used-wrong-y' },
      { text: '$(5, 2)$', is_correct: false, misconception_token: 'arithmetic-slip' },
    ], solution: 'Add: 3x = 9 → x = 3; then 3 - y = 2 → y = 1.' },
    { slot: 11, difficulty: 'medium', stem: 'Solve: $3x + 2y = 12$ and $x = 2$.', choices: [
      { text: '$(2, 3)$', is_correct: true },
      { text: '$(2, 6)$', is_correct: false, misconception_token: 'forgot-coefficient' },
      { text: '$(3, 2)$', is_correct: false, misconception_token: 'swapped-coordinates' },
      { text: '$(2, 0)$', is_correct: false, misconception_token: 'arithmetic-slip' },
    ], solution: '3·2 + 2y = 12 → 2y = 6 → y = 3.' },
    { slot: 12, difficulty: 'medium', stem: 'Solve: $y = x^2$ and $y = 9$.', choices: [
      { text: '$x = 3$ and $x = -3$', is_correct: true },
      { text: '$x = 3$ only', is_correct: false, misconception_token: 'missed-negative-root' },
      { text: '$x = 81$', is_correct: false, misconception_token: 'squared-instead' },
      { text: '$x = \\pm 9$', is_correct: false, misconception_token: 'did-not-take-root' },
    ], solution: 'x² = 9 → x = ±3.' },
    { slot: 13, difficulty: 'medium', stem: 'Solve: $y = x^2$ and $y = x$.', choices: [
      { text: '$x = 0$ and $x = 1$', is_correct: true },
      { text: '$x = 1$ only', is_correct: false, misconception_token: 'divided-out-x' },
      { text: '$x = 0$ only', is_correct: false, misconception_token: 'missed-second-root' },
      { text: '$x = -1$ and $x = 1$', is_correct: false, misconception_token: 'sign-error' },
    ], solution: 'x² = x → x² - x = 0 → x(x - 1) = 0 → x = 0 or x = 1.' },
    { slot: 14, difficulty: 'medium', stem: 'Two lines have the same slope but different y-intercepts. How many solutions?', choices: [
      { text: 'no solution', is_correct: true },
      { text: 'one solution', is_correct: false, misconception_token: 'assumed-they-cross' },
      { text: 'infinitely many', is_correct: false, misconception_token: 'confused-with-same-line' },
      { text: 'exactly two', is_correct: false, misconception_token: 'guessed' },
    ], solution: 'Same slope, different intercepts → parallel → no solution.' },
    { slot: 15, difficulty: 'medium', stem: 'Solve: $x + y = 5$ and $2x + 2y = 10$.', choices: [
      { text: 'infinitely many solutions', is_correct: true },
      { text: 'no solution', is_correct: false, misconception_token: 'assumed-parallel' },
      { text: 'one solution', is_correct: false, misconception_token: 'assumed-single-point' },
      { text: '$(5, 0)$', is_correct: false, misconception_token: 'picked-one-point' },
    ], solution: 'The second equation is twice the first, the same line, so infinitely many solutions.' },
    { slot: 16, difficulty: 'medium', stem: 'Solve: $y = -x + 4$ and $y = x - 2$.', choices: [
      { text: '$(3, 1)$', is_correct: true },
      { text: '$(1, 3)$', is_correct: false, misconception_token: 'swapped-coordinates' },
      { text: '$(3, 4)$', is_correct: false, misconception_token: 'used-wrong-equation-for-y' },
      { text: '$(0, 4)$', is_correct: false, misconception_token: 'used-intercept' },
    ], solution: '-x + 4 = x - 2 → 6 = 2x → x = 3; y = 1.' },
    { slot: 17, difficulty: 'medium', stem: 'Solve: $y = x^2 - 1$ and $y = 3$.', choices: [
      { text: '$x = 2$ and $x = -2$', is_correct: true },
      { text: '$x = 2$ only', is_correct: false, misconception_token: 'missed-negative-root' },
      { text: '$x = \\pm 4$', is_correct: false, misconception_token: 'did-not-take-root' },
      { text: '$x = \\pm \\sqrt{3}$', is_correct: false, misconception_token: 'forgot-the-minus-one' },
    ], solution: 'x² - 1 = 3 → x² = 4 → x = ±2.' },
    { slot: 18, difficulty: 'medium', stem: 'Solve: $4x - y = 5$ and $y = 3$.', choices: [
      { text: '$(2, 3)$', is_correct: true },
      { text: '$(3, 2)$', is_correct: false, misconception_token: 'swapped-coordinates' },
      { text: '$(2, 5)$', is_correct: false, misconception_token: 'used-wrong-y' },
      { text: '$(2, 0)$', is_correct: false, misconception_token: 'arithmetic-slip' },
    ], solution: '4x - 3 = 5 → 4x = 8 → x = 2: (2, 3).' },
    { slot: 19, difficulty: 'hard', stem: 'Solve the linear-quadratic system: $y = x^2$ and $y = 2x + 3$.', choices: [
      { text: '$x = 3$ and $x = -1$', is_correct: true },
      { text: '$x = 3$ only', is_correct: false, misconception_token: 'missed-a-root' },
      { text: '$x = 1$ and $x = -3$', is_correct: false, misconception_token: 'sign-error-in-factoring' },
      { text: '$x = \\pm 3$', is_correct: false, misconception_token: 'ignored-linear-term' },
    ], solution: 'x² = 2x + 3 → x² - 2x - 3 = 0 → (x - 3)(x + 1) = 0 → x = 3 or x = -1.' },
    { slot: 20, difficulty: 'hard', stem: 'Solve the linear-quadratic system: $y = x^2 - 2x$ and $y = x$.', choices: [
      { text: '$x = 0$ and $x = 3$', is_correct: true },
      { text: '$x = 3$ only', is_correct: false, misconception_token: 'divided-out-x' },
      { text: '$x = 0$ and $x = -3$', is_correct: false, misconception_token: 'sign-error' },
      { text: '$x = \\pm 3$', is_correct: false, misconception_token: 'ignored-a-root' },
    ], solution: 'x² - 2x = x → x² - 3x = 0 → x(x - 3) = 0 → x = 0 or x = 3.' },
  ],
}

export const GRADE_7_11_MATH_SKILLS: GapMathSkill[] = [
  RATIONAL_NUMBER_OPERATIONS_7,
  PERCENT_APPLICATIONS_7,
  TWO_STEP_EQUATIONS_7,
  ANGLES_AREA_VOLUME_7,
  PROBABILITY_MODELS_7,
  POLYNOMIAL_OPERATIONS_11,
  RATIONAL_RADICAL_EXPRESSIONS_11,
  QUADRATIC_FUNCTIONS_11,
  EXPONENTIAL_LOGARITHMIC_11,
  SYSTEMS_OF_EQUATIONS_11,
]

