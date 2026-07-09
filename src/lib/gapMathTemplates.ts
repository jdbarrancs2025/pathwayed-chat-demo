/**
 * Elementary math gap-fill — a CURATED POOL of grade-accurate Common Core items
 * (the math analogue of grammarTemplates.ts / readingTemplates.ts), filling the
 * 3–5 rungs the skill tree was missing (place value, rounding, measurement,
 * early geometry, …).
 *
 * Each item is ORIGINAL and written to ONE exact CCSS grade standard, in
 * grade-appropriate language and difficulty — a 3rd-grade item reads like 3rd
 * grade, not SAT-flavored. Common Core is the baseline; the SAT thread is kept
 * only via sat_alignment, never by inflating the item. Every item has 4 choices,
 * exactly one correct, a DISTINCT misconception token per distractor (mapped to a
 * Stage-4 explanation in misconceptions.ts), and a worked solution. Served through
 * the SAME generated_questions path as the rest of the bank (build-gap-math-
 * seeds.ts emits the rows).
 *
 * PHASE 1 ships ONE proof skill: grade-3 place-value.
 */

export type Difficulty = 'easy' | 'medium' | 'hard'

export interface GapChoice {
  text: string
  is_correct: boolean
  misconception_token?: string // on wrong choices; kebab-case, ^[a-z][a-z0-9-]*$
}

export interface GapItem {
  slot: number // stable id within the skill (1..N) — deterministic + idempotent
  difficulty: Difficulty
  stem: string
  choices: GapChoice[]
  solution: string
}

export interface GapMathSkill {
  slug: string
  name: string
  subject: 'math'
  ccssGrade: string // 'K'..'12'
  ccssGradeNum: number
  ccssCode: string
  satAlignment: string
  gradeBand: string // back-compat band
  items: GapItem[]
}

// ============================================================================
// Grade 3 — Place Value (CCSS 3.NBT.A): value of a digit, expanded/standard form,
// comparing & ordering to 1,000, place-value patterns (10/100 more), and
// multiplying by multiples of ten (3.NBT.A.3). 20 items, 8 easy / 8 medium / 4 hard.
// ============================================================================

const PLACE_VALUE_3: GapMathSkill = {
  slug: 'place-value',
  name: 'Place Value',
  subject: 'math',
  ccssGrade: '3',
  ccssGradeNum: 3,
  ccssCode: 'CCSS.MATH.CONTENT.3.NBT.A',
  satAlignment: 'problem-solving-data-analysis',
  gradeBand: '3-5',
  items: [
    {
      slot: 1,
      difficulty: 'easy',
      stem: 'In the number 372, what is the value of the digit 7?',
      choices: [
        { text: '70', is_correct: true },
        { text: '7', is_correct: false, misconception_token: 'used-digit-not-value' },
        { text: '700', is_correct: false, misconception_token: 'place-value-off-by-one' },
        { text: '2', is_correct: false, misconception_token: 'read-wrong-digit' },
      ],
      solution:
        'The 7 is in the tens place, so its value is 7 tens, which is 70. The digit by itself is 7, 700 would be the hundreds place, and 2 is the ones digit.',
    },
    {
      slot: 2,
      difficulty: 'easy',
      stem: 'In the number 845, which digit is in the hundreds place?',
      choices: [
        { text: '8', is_correct: true },
        { text: '4', is_correct: false, misconception_token: 'wrong-place-named' },
        { text: '5', is_correct: false, misconception_token: 'miscounted-place' },
        { text: '800', is_correct: false, misconception_token: 'used-value-not-digit' },
      ],
      solution:
        'Reading from the left, 8 is in the hundreds place, 4 in the tens, 5 in the ones. The question asks for the digit, which is 8 (800 is its value, not the digit).',
    },
    {
      slot: 3,
      difficulty: 'easy',
      stem: 'What is 3 times 40?',
      choices: [
        { text: '120', is_correct: true },
        { text: '12', is_correct: false, misconception_token: 'forgot-the-zero' },
        { text: '43', is_correct: false, misconception_token: 'added-instead-of-multiplied' },
        { text: '1,200', is_correct: false, misconception_token: 'extra-zero' },
      ],
      solution:
        '3 times 40 is 3 times 4 tens, which is 12 tens, or 120. 12 forgets the ten, 43 adds instead of multiplying, and 1,200 has an extra zero.',
    },
    {
      slot: 4,
      difficulty: 'easy',
      stem: 'What is 100 more than 623?',
      choices: [
        { text: '723', is_correct: true },
        { text: '633', is_correct: false, misconception_token: 'added-to-wrong-place' },
        { text: '624', is_correct: false, misconception_token: 'wrong-amount-changed' },
        { text: '523', is_correct: false, misconception_token: 'subtracted-instead' },
      ],
      solution:
        '100 more changes the hundreds digit: 6 hundreds plus 1 hundred is 7 hundreds, so 723. 633 adds to the tens, 624 adds only one, and 523 is 100 less.',
    },
    {
      slot: 5,
      difficulty: 'easy',
      stem: 'What number is 400 + 30 + 8?',
      choices: [
        { text: '438', is_correct: true },
        { text: '4,308', is_correct: false, misconception_token: 'kept-the-zeros' },
        { text: '483', is_correct: false, misconception_token: 'digits-reversed' },
        { text: '15', is_correct: false, misconception_token: 'added-the-parts' },
      ],
      solution:
        '400 + 30 + 8 combines to 438 — 4 hundreds, 3 tens, 8 ones. 4,308 keeps the zeros, 483 swaps the tens and ones, and 15 just adds the digits.',
    },
    {
      slot: 6,
      difficulty: 'easy',
      stem: 'Which number is greater, 528 or 582?',
      choices: [
        { text: '582', is_correct: true },
        { text: '528', is_correct: false, misconception_token: 'compared-wrong-place' },
        { text: 'They are equal', is_correct: false, misconception_token: 'thought-equal' },
        { text: '285', is_correct: false, misconception_token: 'digits-reversed' },
      ],
      solution:
        'Both have 5 hundreds, so compare the tens: 8 tens (582) beats 2 tens (528), so 582 is greater. They are not equal, and reversing the digits makes a different number.',
    },
    {
      slot: 7,
      difficulty: 'easy',
      stem: 'How many tens are in the number 60?',
      choices: [
        { text: '6', is_correct: true },
        { text: '60', is_correct: false, misconception_token: 'no-change' },
        { text: '0', is_correct: false, misconception_token: 'read-wrong-digit' },
        { text: '600', is_correct: false, misconception_token: 'extra-zero' },
      ],
      solution:
        '60 is 6 tens. The number itself is 60, 0 is just the ones digit, and 600 is ten times too big.',
    },
    {
      slot: 8,
      difficulty: 'easy',
      stem: 'In the number 405, what is the value of the digit 0?',
      choices: [
        { text: '0', is_correct: true },
        { text: '10', is_correct: false, misconception_token: 'zero-place-misread' },
        { text: '45', is_correct: false, misconception_token: 'ignored-zero-placeholder' },
        { text: '5', is_correct: false, misconception_token: 'read-wrong-digit' },
      ],
      solution:
        'The 0 is in the tens place, so its value is 0 — it holds the spot so the 4 stays in the hundreds and 5 in the ones. It is not 10, you cannot skip it (that would make 45), and 5 is the ones digit.',
    },
    {
      slot: 9,
      difficulty: 'medium',
      stem: 'In the number 7,214, what is the value of the digit 2?',
      choices: [
        { text: '200', is_correct: true },
        { text: '2', is_correct: false, misconception_token: 'used-digit-not-value' },
        { text: '20', is_correct: false, misconception_token: 'place-value-off-by-one' },
        { text: '2,000', is_correct: false, misconception_token: 'wrong-place-named' },
      ],
      solution:
        'In 7,214 the 2 is in the hundreds place, so its value is 200. Alone it is 2, the tens place would be 20, and the thousands place would be 2,000.',
    },
    {
      slot: 10,
      difficulty: 'medium',
      stem: 'What is 8 times 50?',
      choices: [
        { text: '400', is_correct: true },
        { text: '40', is_correct: false, misconception_token: 'forgot-the-zero' },
        { text: '58', is_correct: false, misconception_token: 'added-instead-of-multiplied' },
        { text: '4,000', is_correct: false, misconception_token: 'extra-zero' },
      ],
      solution:
        '8 times 50 is 8 times 5 tens, which is 40 tens, or 400. 40 drops the ten, 58 adds instead of multiplying, and 4,000 has an extra zero.',
    },
    {
      slot: 11,
      difficulty: 'medium',
      stem: 'What is 10 more than 495?',
      choices: [
        { text: '505', is_correct: true },
        { text: '496', is_correct: false, misconception_token: 'wrong-amount-changed' },
        { text: '595', is_correct: false, misconception_token: 'added-to-wrong-place' },
        { text: '485', is_correct: false, misconception_token: 'subtracted-instead' },
      ],
      solution:
        '495 + 10 = 505 — the 9 tens and the new ten make a whole new hundred. 496 adds only one, 595 adds a hundred, and 485 is ten less.',
    },
    {
      slot: 12,
      difficulty: 'medium',
      stem: 'Which shows 306 in expanded form?',
      choices: [
        { text: '300 + 6', is_correct: true },
        { text: '300 + 60', is_correct: false, misconception_token: 'place-value-off-by-one' },
        { text: '3 + 0 + 6', is_correct: false, misconception_token: 'used-digit-not-value' },
        { text: '30 + 6', is_correct: false, misconception_token: 'wrong-place-named' },
      ],
      solution:
        '306 is 3 hundreds, 0 tens, 6 ones, so 300 + 6. Putting the 6 in the tens gives 300 + 60, using the digits gives 3 + 0 + 6, and 30 + 6 treats the 3 as tens.',
    },
    {
      slot: 13,
      difficulty: 'medium',
      stem: 'Which of these numbers is the greatest: 519, 591, or 195?',
      choices: [
        { text: '591', is_correct: true },
        { text: '519', is_correct: false, misconception_token: 'compared-wrong-place' },
        { text: '195', is_correct: false, misconception_token: 'picked-smallest' },
        { text: 'They are all equal', is_correct: false, misconception_token: 'thought-equal' },
      ],
      solution:
        '591 has 5 hundreds and 9 tens — the most. 519 has only 1 ten, 195 has just 1 hundred (the smallest), and the same digits in different places are not equal.',
    },
    {
      slot: 14,
      difficulty: 'medium',
      stem: 'How many tens are in the number 240?',
      choices: [
        { text: '24', is_correct: true },
        { text: '4', is_correct: false, misconception_token: 'read-wrong-digit' },
        { text: '2', is_correct: false, misconception_token: 'miscounted-place' },
        { text: '240', is_correct: false, misconception_token: 'no-change' },
      ],
      solution:
        '240 is 24 tens (240 ÷ 10 = 24). The 4 is only the tens digit, 2 is the hundreds digit, and 240 is the whole number.',
    },
    {
      slot: 15,
      difficulty: 'medium',
      stem: 'Maria has 3 boxes of 100 crayons, 5 boxes of 10 crayons, and 7 single crayons. How many crayons does she have in all?',
      choices: [
        { text: '357', is_correct: true },
        { text: '3,057', is_correct: false, misconception_token: 'kept-the-zeros' },
        { text: '375', is_correct: false, misconception_token: 'digits-reversed' },
        { text: '15', is_correct: false, misconception_token: 'added-the-parts' },
      ],
      solution:
        '3 hundreds + 5 tens + 7 ones = 357. 3,057 keeps the zeros, 375 swaps the tens and ones, and 15 just adds the group counts (3 + 5 + 7).',
    },
    {
      slot: 16,
      difficulty: 'medium',
      stem: 'The pattern counts by hundreds: 218, 318, ___, 518. Which number goes in the blank?',
      choices: [
        { text: '418', is_correct: true },
        { text: '328', is_correct: false, misconception_token: 'counted-by-tens' },
        { text: '419', is_correct: false, misconception_token: 'wrong-amount-changed' },
        { text: '428', is_correct: false, misconception_token: 'miscounted-place' },
      ],
      solution:
        'Counting by hundreds, the hundreds digit goes up by 1 each time: 218, 318, 418, 518. 328 counts by tens, 419 adds one, and 428 jumps too far.',
    },
    {
      slot: 17,
      difficulty: 'hard',
      stem: 'In the number 52,608, what is the value of the digit 2?',
      choices: [
        { text: '2,000', is_correct: true },
        { text: '2', is_correct: false, misconception_token: 'used-digit-not-value' },
        { text: '200', is_correct: false, misconception_token: 'place-value-off-by-one' },
        { text: '20,000', is_correct: false, misconception_token: 'wrong-place-named' },
      ],
      solution:
        'In 52,608 the 2 is in the thousands place, so its value is 2,000. Alone it is 2, the hundreds place would be 200, and the ten-thousands place would be 20,000.',
    },
    {
      slot: 18,
      difficulty: 'hard',
      stem: 'I am a 3-digit number. I have 4 hundreds, 0 tens, and my ones digit is 4 plus 3. What number am I?',
      choices: [
        { text: '407', is_correct: true },
        { text: '470', is_correct: false, misconception_token: 'ignored-zero-placeholder' },
        { text: '47', is_correct: false, misconception_token: 'miscounted-place' },
        { text: '704', is_correct: false, misconception_token: 'digits-reversed' },
      ],
      solution:
        '4 hundreds, 0 tens, and ones = 4 + 3 = 7, so the number is 407. 470 puts the zero in the wrong place, 47 drops the hundreds, and 704 reverses the digits.',
    },
    {
      slot: 19,
      difficulty: 'hard',
      stem: 'How many hundreds are in the number 1,500?',
      choices: [
        { text: '15', is_correct: true },
        { text: '5', is_correct: false, misconception_token: 'read-wrong-digit' },
        { text: '150', is_correct: false, misconception_token: 'place-value-off-by-one' },
        { text: '1', is_correct: false, misconception_token: 'miscounted-place' },
      ],
      solution:
        '1,500 is 15 hundreds (1,500 ÷ 100 = 15). The 5 is only the hundreds digit, 150 counts tens (one place too small), and 1 is the thousands digit.',
    },
    {
      slot: 20,
      difficulty: 'hard',
      stem: 'Ben says that 4 hundreds and 12 tens is the same as 520. Is he right, and what is the number?',
      choices: [
        { text: 'Yes, it is 520', is_correct: true },
        { text: 'No, it is 412', is_correct: false, misconception_token: 'treated-extra-tens-as-digits' },
        { text: 'No, it is 52', is_correct: false, misconception_token: 'place-value-off-by-one' },
        { text: 'Yes, it is 4,120', is_correct: false, misconception_token: 'kept-the-zeros' },
      ],
      solution:
        '12 tens is 120, and 400 + 120 = 520, so Ben is right. Writing 412 treats the 12 like two separate digits, 52 is ten times too small, and 4,120 just strings the numbers together.',
    },
  ],
}

// ============================================================================
// Grade 3 — Rounding (CCSS 3.NBT.A.1): round whole numbers to the nearest 10 or 100.
// ============================================================================
const ROUNDING_3: GapMathSkill = {
  slug: 'rounding', name: 'Rounding', subject: 'math',
  ccssGrade: '3', ccssGradeNum: 3, ccssCode: 'CCSS.MATH.CONTENT.3.NBT.A.1',
  satAlignment: 'problem-solving-data-analysis', gradeBand: '3-5',
  items: [
    { slot: 1, difficulty: 'easy', stem: 'Round 47 to the nearest ten.', choices: [
      { text: '50', is_correct: true },
      { text: '40', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '47', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '400', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The ones digit is 7, which is 5 or more, so round up to 50. 40 rounds down, 47 is the original number, and 400 rounds to the wrong place.' },
    { slot: 2, difficulty: 'easy', stem: 'Round 62 to the nearest ten.', choices: [
      { text: '60', is_correct: true },
      { text: '70', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '62', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '600', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The ones digit is 2, which is less than 5, so round down to 60.' },
    { slot: 3, difficulty: 'easy', stem: 'Round 85 to the nearest ten.', choices: [
      { text: '90', is_correct: true },
      { text: '80', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '85', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '100', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The ones digit is 5, so round up: 85 becomes 90. 100 would be rounding to the nearest hundred instead.' },
    { slot: 4, difficulty: 'easy', stem: 'Round 31 to the nearest ten.', choices: [
      { text: '30', is_correct: true },
      { text: '40', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '31', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '300', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The ones digit is 1, less than 5, so round down to 30.' },
    { slot: 5, difficulty: 'easy', stem: 'Round 78 to the nearest ten.', choices: [
      { text: '80', is_correct: true },
      { text: '70', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '78', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '800', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The ones digit is 8, which is 5 or more, so round up to 80.' },
    { slot: 6, difficulty: 'easy', stem: 'Round 24 to the nearest ten.', choices: [
      { text: '20', is_correct: true },
      { text: '30', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '24', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '200', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The ones digit is 4, less than 5, so round down to 20.' },
    { slot: 7, difficulty: 'easy', stem: 'Round 56 to the nearest ten.', choices: [
      { text: '60', is_correct: true },
      { text: '50', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '56', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '500', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The ones digit is 6, which is 5 or more, so round up to 60.' },
    { slot: 8, difficulty: 'easy', stem: 'Round 93 to the nearest ten.', choices: [
      { text: '90', is_correct: true },
      { text: '100', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '93', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '900', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The ones digit is 3, less than 5, so round down to 90.' },
    { slot: 9, difficulty: 'medium', stem: 'Round 340 to the nearest hundred.', choices: [
      { text: '300', is_correct: true },
      { text: '400', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '340', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '350', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'To round to the nearest hundred, look at the tens digit: 4 is less than 5, so round down to 300. 350 is rounded to the nearest ten instead.' },
    { slot: 10, difficulty: 'medium', stem: 'Round 472 to the nearest hundred.', choices: [
      { text: '500', is_correct: true },
      { text: '400', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '472', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '470', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The tens digit is 7, which is 5 or more, so round up to 500. 470 is rounded to the nearest ten, not hundred.' },
    { slot: 11, difficulty: 'medium', stem: 'Round 618 to the nearest hundred.', choices: [
      { text: '600', is_correct: true },
      { text: '700', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '618', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '620', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The tens digit is 1, less than 5, so round down to 600.' },
    { slot: 12, difficulty: 'medium', stem: 'Round 750 to the nearest hundred.', choices: [
      { text: '800', is_correct: true },
      { text: '700', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '750', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '760', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The tens digit is 5, so round up: 750 becomes 800.' },
    { slot: 13, difficulty: 'medium', stem: 'Round 349 to the nearest ten.', choices: [
      { text: '350', is_correct: true },
      { text: '340', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '349', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '300', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The ones digit is 9, so round up: 349 becomes 350. 300 rounds to the nearest hundred instead.' },
    { slot: 14, difficulty: 'medium', stem: 'Round 812 to the nearest ten.', choices: [
      { text: '810', is_correct: true },
      { text: '820', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '812', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '800', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The ones digit is 2, less than 5, so round down to 810.' },
    { slot: 15, difficulty: 'medium', stem: 'Round 265 to the nearest hundred.', choices: [
      { text: '300', is_correct: true },
      { text: '200', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '265', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '270', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The tens digit is 6, which is 5 or more, so round up to 300.' },
    { slot: 16, difficulty: 'medium', stem: 'A stadium holds 483 people. Rounded to the nearest hundred, about how many is that?', choices: [
      { text: '500', is_correct: true },
      { text: '400', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '483', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '480', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The tens digit is 8, so round up to 500. 480 is rounded to the nearest ten.' },
    { slot: 17, difficulty: 'hard', stem: 'Round 950 to the nearest hundred.', choices: [
      { text: '1,000', is_correct: true },
      { text: '900', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '950', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '960', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The tens digit is 5, so round up: 9 hundreds plus 1 more is 10 hundreds, which is 1,000.' },
    { slot: 18, difficulty: 'hard', stem: 'Round 4,650 to the nearest hundred.', choices: [
      { text: '4,700', is_correct: true },
      { text: '4,600', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '4,650', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '5,000', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The tens digit is 5, so round up: 46 hundreds becomes 47 hundreds, which is 4,700. 5,000 rounds to the nearest thousand.' },
    { slot: 19, difficulty: 'hard', stem: 'Round 2,970 to the nearest hundred.', choices: [
      { text: '3,000', is_correct: true },
      { text: '2,900', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '2,970', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '2,980', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The tens digit is 7, so round up: 29 hundreds plus 1 is 30 hundreds, which is 3,000.' },
    { slot: 20, difficulty: 'hard', stem: 'A school has 6,148 books. Rounded to the nearest hundred, about how many books is that?', choices: [
      { text: '6,100', is_correct: true },
      { text: '6,200', is_correct: false, misconception_token: 'rounded-wrong-way' },
      { text: '6,148', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '6,000', is_correct: false, misconception_token: 'rounded-to-wrong-place' },
    ], solution: 'The tens digit is 4, less than 5, so round down to 6,100. 6,000 rounds to the nearest thousand.' },
  ],
}

// ============================================================================
// Grade 3 — Multi-Digit Addition & Subtraction (CCSS 3.NBT.A.2): add and subtract
// within 1,000 using place value and regrouping.
// ============================================================================
const ADD_SUBTRACT_3: GapMathSkill = {
  slug: 'multi-digit-add-subtract', name: 'Adding & Subtracting Within 1,000', subject: 'math',
  ccssGrade: '3', ccssGradeNum: 3, ccssCode: 'CCSS.MATH.CONTENT.3.NBT.A.2',
  satAlignment: 'problem-solving-data-analysis', gradeBand: '3-5',
  items: [
    { slot: 1, difficulty: 'easy', stem: 'What is 341 + 236?', choices: [
      { text: '577', is_correct: true },
      { text: '105', is_correct: false, misconception_token: 'subtracted-instead-of-added' },
      { text: '587', is_correct: false, misconception_token: 'regrouped-wrong' },
      { text: '677', is_correct: false, misconception_token: 'place-value-off-by-one' },
    ], solution: 'Add each place: 1 + 6 = 7 ones, 4 + 3 = 7 tens, 3 + 2 = 5 hundreds, so 577. 105 subtracts, and the others mis-add a column.' },
    { slot: 2, difficulty: 'easy', stem: 'What is 452 - 236?', choices: [
      { text: '216', is_correct: true },
      { text: '688', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '226', is_correct: false, misconception_token: 'regrouped-wrong' },
      { text: '116', is_correct: false, misconception_token: 'place-value-off-by-one' },
    ], solution: '452 - 236 = 216. Adding gives 688; the others mis-handle a column.' },
    { slot: 3, difficulty: 'easy', stem: 'What is 517 + 271?', choices: [
      { text: '788', is_correct: true },
      { text: '246', is_correct: false, misconception_token: 'subtracted-instead-of-added' },
      { text: '798', is_correct: false, misconception_token: 'regrouped-wrong' },
      { text: '888', is_correct: false, misconception_token: 'place-value-off-by-one' },
    ], solution: '7 + 1 = 8 ones, 1 + 7 = 8 tens, 5 + 2 = 7 hundreds, so 788.' },
    { slot: 4, difficulty: 'easy', stem: 'What is 628 - 405?', choices: [
      { text: '223', is_correct: true },
      { text: '1,033', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '233', is_correct: false, misconception_token: 'regrouped-wrong' },
      { text: '123', is_correct: false, misconception_token: 'place-value-off-by-one' },
    ], solution: '628 - 405 = 223. Adding gives 1,033.' },
    { slot: 5, difficulty: 'easy', stem: 'What is 759 - 321?', choices: [
      { text: '438', is_correct: true },
      { text: '1,080', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '448', is_correct: false, misconception_token: 'regrouped-wrong' },
      { text: '338', is_correct: false, misconception_token: 'place-value-off-by-one' },
    ], solution: '759 - 321 = 438. Adding gives 1,080.' },
    { slot: 6, difficulty: 'easy', stem: 'What is 486 - 263?', choices: [
      { text: '223', is_correct: true },
      { text: '749', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '233', is_correct: false, misconception_token: 'regrouped-wrong' },
      { text: '123', is_correct: false, misconception_token: 'place-value-off-by-one' },
    ], solution: '486 - 263 = 223. Adding gives 749.' },
    { slot: 7, difficulty: 'easy', stem: 'What is 235 + 143?', choices: [
      { text: '378', is_correct: true },
      { text: '92', is_correct: false, misconception_token: 'subtracted-instead-of-added' },
      { text: '388', is_correct: false, misconception_token: 'regrouped-wrong' },
      { text: '478', is_correct: false, misconception_token: 'place-value-off-by-one' },
    ], solution: '5 + 3 = 8 ones, 3 + 4 = 7 tens, 2 + 1 = 3 hundreds, so 378.' },
    { slot: 8, difficulty: 'easy', stem: 'What is 674 - 152?', choices: [
      { text: '522', is_correct: true },
      { text: '826', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '532', is_correct: false, misconception_token: 'regrouped-wrong' },
      { text: '422', is_correct: false, misconception_token: 'place-value-off-by-one' },
    ], solution: '674 - 152 = 522. Adding gives 826.' },
    { slot: 9, difficulty: 'medium', stem: 'What is 356 + 128?', choices: [
      { text: '484', is_correct: true },
      { text: '228', is_correct: false, misconception_token: 'subtracted-instead-of-added' },
      { text: '474', is_correct: false, misconception_token: 'forgot-to-regroup' },
      { text: '494', is_correct: false, misconception_token: 'regrouped-wrong' },
    ], solution: '6 + 8 = 14, so write 4 and carry 1 ten. Tens: 5 + 2 + 1 = 8. Hundreds: 3 + 1 = 4. Answer 484. 474 forgets the carry.' },
    { slot: 10, difficulty: 'medium', stem: 'What is 267 + 185?', choices: [
      { text: '452', is_correct: true },
      { text: '82', is_correct: false, misconception_token: 'subtracted-instead-of-added' },
      { text: '352', is_correct: false, misconception_token: 'forgot-to-regroup' },
      { text: '462', is_correct: false, misconception_token: 'regrouped-wrong' },
    ], solution: '7 + 5 = 12 (carry 1). Tens: 6 + 8 + 1 = 15 (carry 1). Hundreds: 2 + 1 + 1 = 4. Answer 452. 352 drops a carry.' },
    { slot: 11, difficulty: 'medium', stem: 'What is 403 - 176?', choices: [
      { text: '227', is_correct: true },
      { text: '579', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '373', is_correct: false, misconception_token: 'subtracted-smaller-from-larger' },
      { text: '237', is_correct: false, misconception_token: 'regrouped-wrong' },
    ], solution: 'Borrow to subtract: 403 - 176 = 227. 373 wrongly takes the smaller digit from the larger in each column.' },
    { slot: 12, difficulty: 'medium', stem: 'What is 500 - 247?', choices: [
      { text: '253', is_correct: true },
      { text: '747', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '347', is_correct: false, misconception_token: 'subtracted-smaller-from-larger' },
      { text: '263', is_correct: false, misconception_token: 'regrouped-wrong' },
    ], solution: 'Borrow across the zeros: 500 - 247 = 253. 347 subtracts each smaller digit from the larger.' },
    { slot: 13, difficulty: 'medium', stem: 'What is 318 + 254?', choices: [
      { text: '572', is_correct: true },
      { text: '64', is_correct: false, misconception_token: 'subtracted-instead-of-added' },
      { text: '562', is_correct: false, misconception_token: 'forgot-to-regroup' },
      { text: '582', is_correct: false, misconception_token: 'regrouped-wrong' },
    ], solution: '8 + 4 = 12 (carry 1). Tens: 1 + 5 + 1 = 7. Hundreds: 3 + 2 = 5. Answer 572. 562 forgets the carry.' },
    { slot: 14, difficulty: 'medium', stem: 'What is 645 - 278?', choices: [
      { text: '367', is_correct: true },
      { text: '923', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '433', is_correct: false, misconception_token: 'subtracted-smaller-from-larger' },
      { text: '357', is_correct: false, misconception_token: 'regrouped-wrong' },
    ], solution: 'Borrow twice: 645 - 278 = 367. 433 takes the smaller digit from the larger each time.' },
    { slot: 15, difficulty: 'medium', stem: 'A library had 428 books and received 176 more. How many books are there now?', choices: [
      { text: '604', is_correct: true },
      { text: '252', is_correct: false, misconception_token: 'subtracted-instead-of-added' },
      { text: '594', is_correct: false, misconception_token: 'forgot-to-regroup' },
      { text: '614', is_correct: false, misconception_token: 'regrouped-wrong' },
    ], solution: '428 + 176 = 604. "Received more" means add. 594 forgets a carry.' },
    { slot: 16, difficulty: 'medium', stem: 'A theater has 750 seats. 384 are filled. How many are empty?', choices: [
      { text: '366', is_correct: true },
      { text: '1,134', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '434', is_correct: false, misconception_token: 'subtracted-smaller-from-larger' },
      { text: '376', is_correct: false, misconception_token: 'regrouped-wrong' },
    ], solution: '750 - 384 = 366 empty seats. 434 subtracts each smaller digit from the larger.' },
    { slot: 17, difficulty: 'hard', stem: 'What is 802 - 457?', choices: [
      { text: '345', is_correct: true },
      { text: '1,259', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '455', is_correct: false, misconception_token: 'subtracted-smaller-from-larger' },
      { text: '355', is_correct: false, misconception_token: 'regrouped-wrong' },
    ], solution: 'Borrow across the zero: 802 - 457 = 345. 455 subtracts each smaller digit from the larger.' },
    { slot: 18, difficulty: 'hard', stem: 'What is 567 + 368?', choices: [
      { text: '935', is_correct: true },
      { text: '199', is_correct: false, misconception_token: 'subtracted-instead-of-added' },
      { text: '835', is_correct: false, misconception_token: 'forgot-to-regroup' },
      { text: '925', is_correct: false, misconception_token: 'regrouped-wrong' },
    ], solution: '7 + 8 = 15 (carry 1). Tens: 6 + 6 + 1 = 13 (carry 1). Hundreds: 5 + 3 + 1 = 9. Answer 935. 835 drops a carry.' },
    { slot: 19, difficulty: 'hard', stem: 'Maya had 615 stickers. She gave away 148 and then earned 90 more. How many does she have now?', choices: [
      { text: '557', is_correct: true },
      { text: '853', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '377', is_correct: false, misconception_token: 'subtracted-instead-of-added' },
      { text: '467', is_correct: false, misconception_token: 'kept-original-number' },
    ], solution: 'Two steps: 615 - 148 = 467, then 467 + 90 = 557. 467 stops after the first step, and the others use the wrong operation.' },
    { slot: 20, difficulty: 'hard', stem: 'What is 906 - 429?', choices: [
      { text: '477', is_correct: true },
      { text: '1,335', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '523', is_correct: false, misconception_token: 'subtracted-smaller-from-larger' },
      { text: '487', is_correct: false, misconception_token: 'regrouped-wrong' },
    ], solution: 'Borrow across the zero: 906 - 429 = 477. 523 subtracts each smaller digit from the larger.' },
  ],
}

// ============================================================================
// Grade 3 — Measurement & Data (CCSS 3.MD): time & elapsed time, measurement,
// and reading picture/bar graphs and scaled graphs.
// ============================================================================
const MEASUREMENT_DATA_3: GapMathSkill = {
  slug: 'measurement-and-data', name: 'Measurement & Data', subject: 'math',
  ccssGrade: '3', ccssGradeNum: 3, ccssCode: 'CCSS.MATH.CONTENT.3.MD.A',
  satAlignment: 'problem-solving-data-analysis', gradeBand: '3-5',
  items: [
    { slot: 1, difficulty: 'easy', stem: 'Recess starts at 10:15 and lasts 30 minutes. What time does it end?', choices: [
      { text: '10:45', is_correct: true },
      { text: '10:30', is_correct: false, misconception_token: 'elapsed-time-miscount' },
      { text: '9:45', is_correct: false, misconception_token: 'subtracted-instead' },
      { text: '10:15', is_correct: false, misconception_token: 'kept-original-number' },
    ], solution: '10:15 plus 30 minutes is 10:45. 10:30 only adds 15, 9:45 subtracts, and 10:15 is the start time.' },
    { slot: 2, difficulty: 'easy', stem: 'A movie starts at 4:00 and lasts 2 hours. When does it end?', choices: [
      { text: '6:00', is_correct: true },
      { text: '4:02', is_correct: false, misconception_token: 'wrong-measure-unit' },
      { text: '2:00', is_correct: false, misconception_token: 'subtracted-instead' },
      { text: '4:00', is_correct: false, misconception_token: 'kept-original-number' },
    ], solution: '4:00 plus 2 hours is 6:00. 4:02 added 2 minutes instead of 2 hours.' },
    { slot: 3, difficulty: 'easy', stem: 'A picture graph shows books read: Ana 5, Ben 3, Cara 6. How many books did Ana and Ben read together?', choices: [
      { text: '8', is_correct: true },
      { text: '2', is_correct: false, misconception_token: 'subtracted-instead' },
      { text: '5', is_correct: false, misconception_token: 'misread-the-graph' },
      { text: '14', is_correct: false, misconception_token: 'added-the-parts' },
    ], solution: 'Ana 5 + Ben 3 = 8. 2 subtracts, 5 uses only Ana, and 14 adds in Cara too.' },
    { slot: 4, difficulty: 'easy', stem: 'A graph shows stars earned: Monday 4, Tuesday 7, Wednesday 5. How many MORE stars were earned on Tuesday than Monday?', choices: [
      { text: '3', is_correct: true },
      { text: '11', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '7', is_correct: false, misconception_token: 'misread-the-graph' },
      { text: '16', is_correct: false, misconception_token: 'added-the-parts' },
    ], solution: '"How many more" means subtract: 7 - 4 = 3. 11 adds, 7 reads only Tuesday, 16 adds all three days.' },
    { slot: 5, difficulty: 'easy', stem: 'It is 2:00 now. What time was it 1 hour ago?', choices: [
      { text: '1:00', is_correct: true },
      { text: '3:00', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '2:01', is_correct: false, misconception_token: 'wrong-measure-unit' },
      { text: '2:00', is_correct: false, misconception_token: 'kept-original-number' },
    ], solution: '"Ago" means go back: 2:00 minus 1 hour is 1:00. 3:00 goes forward, 2:01 uses minutes.' },
    { slot: 6, difficulty: 'easy', stem: 'On a graph, each star stands for 2 books. A row has 4 stars. How many books is that?', choices: [
      { text: '8', is_correct: true },
      { text: '4', is_correct: false, misconception_token: 'wrong-scale' },
      { text: '6', is_correct: false, misconception_token: 'added-the-parts' },
      { text: '2', is_correct: false, misconception_token: 'misread-the-graph' },
    ], solution: 'Each star is 2 books, so 4 stars is 4 times 2 = 8. 4 counts stars, 6 adds 2 + 4, and 2 reads only one star.' },
    { slot: 7, difficulty: 'easy', stem: 'A ribbon is 24 cm long. You cut off 9 cm. How long is the ribbon now?', choices: [
      { text: '15 cm', is_correct: true },
      { text: '33 cm', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '24 cm', is_correct: false, misconception_token: 'kept-original-number' },
      { text: '16 cm', is_correct: false, misconception_token: 'regrouped-wrong' },
    ], solution: 'Cutting off means subtract: 24 - 9 = 15 cm. 33 adds, 24 is the original length.' },
    { slot: 8, difficulty: 'easy', stem: 'A bar graph shows votes: red 10, blue 20, green 15. How many votes were there in all?', choices: [
      { text: '45', is_correct: true },
      { text: '35', is_correct: false, misconception_token: 'misread-the-graph' },
      { text: '450', is_correct: false, misconception_token: 'wrong-scale' },
      { text: '5', is_correct: false, misconception_token: 'subtracted-instead' },
    ], solution: '10 + 20 + 15 = 45. 35 drops one bar, 450 misreads the scale, and 5 subtracts.' },
    { slot: 9, difficulty: 'medium', stem: 'Soccer practice runs from 3:30 to 5:00. How long is practice?', choices: [
      { text: '1 hour 30 minutes', is_correct: true },
      { text: '2 hours', is_correct: false, misconception_token: 'elapsed-time-miscount' },
      { text: '8 hours 30 minutes', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '3 hours 30 minutes', is_correct: false, misconception_token: 'read-clock-wrong' },
    ], solution: 'From 3:30 to 5:00 is 1 hour 30 minutes. 8:30 adds the two times together.' },
    { slot: 10, difficulty: 'medium', stem: 'A line plot shows shoe lengths: 3 shoes are 8 in, 2 shoes are 9 in, 4 shoes are 10 in. How many shoes are shown in all?', choices: [
      { text: '9', is_correct: true },
      { text: '27', is_correct: false, misconception_token: 'added-the-parts' },
      { text: '3', is_correct: false, misconception_token: 'misread-the-graph' },
      { text: '5', is_correct: false, misconception_token: 'subtracted-instead' },
    ], solution: 'Count the shoes: 3 + 2 + 4 = 9. 27 adds the lengths (8 + 9 + 10), and 3 reads only one group.' },
    { slot: 11, difficulty: 'medium', stem: 'A movie starts at 1:45 and lasts 1 hour and 30 minutes. When does it end?', choices: [
      { text: '3:15', is_correct: true },
      { text: '2:15', is_correct: false, misconception_token: 'elapsed-time-miscount' },
      { text: '3:75', is_correct: false, misconception_token: 'wrong-measure-unit' },
      { text: '1:15', is_correct: false, misconception_token: 'subtracted-instead' },
    ], solution: '1:45 plus 1 hour is 2:45, plus 30 minutes is 3:15. 3:75 forgets that 60 minutes makes a new hour.' },
    { slot: 12, difficulty: 'medium', stem: 'Each square on a graph stands for 5 minutes of reading. Sam\'s row has 6 squares. How many minutes did Sam read?', choices: [
      { text: '30', is_correct: true },
      { text: '6', is_correct: false, misconception_token: 'wrong-scale' },
      { text: '11', is_correct: false, misconception_token: 'added-the-parts' },
      { text: '5', is_correct: false, misconception_token: 'misread-the-graph' },
    ], solution: 'Each square is 5 minutes, so 6 squares is 6 times 5 = 30 minutes. 6 counts squares, 11 adds 5 + 6.' },
    { slot: 13, difficulty: 'medium', stem: 'A bottle holds 2 liters of water. How many milliliters is that? (1 liter = 1,000 milliliters)', choices: [
      { text: '2,000', is_correct: true },
      { text: '200', is_correct: false, misconception_token: 'place-value-off-by-one' },
      { text: '2', is_correct: false, misconception_token: 'wrong-measure-unit' },
      { text: '4,000', is_correct: false, misconception_token: 'wrong-scale' },
    ], solution: '2 liters times 1,000 = 2,000 milliliters. 200 is ten times too small, and 2 forgets to convert.' },
    { slot: 14, difficulty: 'medium', stem: 'A graph shows pets: dogs 8, cats 5, fish 3, birds 2. How many more dogs are there than fish?', choices: [
      { text: '5', is_correct: true },
      { text: '11', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '8', is_correct: false, misconception_token: 'misread-the-graph' },
      { text: '18', is_correct: false, misconception_token: 'added-the-parts' },
    ], solution: '8 dogs minus 3 fish = 5. 11 adds, 8 reads only dogs, 18 adds all the pets.' },
    { slot: 15, difficulty: 'medium', stem: 'It is 11:40. What time will it be in 45 minutes?', choices: [
      { text: '12:25', is_correct: true },
      { text: '11:85', is_correct: false, misconception_token: 'wrong-measure-unit' },
      { text: '12:85', is_correct: false, misconception_token: 'elapsed-time-miscount' },
      { text: '11:25', is_correct: false, misconception_token: 'subtracted-instead' },
    ], solution: '11:40 plus 20 minutes is 12:00, plus 25 more is 12:25. 11:85 forgets that 60 minutes makes an hour.' },
    { slot: 16, difficulty: 'medium', stem: 'On a bar graph, each grid line is worth 10. A bar reaches the third line. How many does the bar show?', choices: [
      { text: '30', is_correct: true },
      { text: '3', is_correct: false, misconception_token: 'wrong-scale' },
      { text: '13', is_correct: false, misconception_token: 'added-the-parts' },
      { text: '300', is_correct: false, misconception_token: 'place-value-off-by-one' },
    ], solution: 'Three lines, 10 each: 3 times 10 = 30. 3 counts lines, and 13 adds 10 + 3.' },
    { slot: 17, difficulty: 'hard', stem: 'A field trip bus leaves at 9:20 in the morning and returns at 2:05 in the afternoon. How long was the trip?', choices: [
      { text: '4 hours 45 minutes', is_correct: true },
      { text: '4 hours 15 minutes', is_correct: false, misconception_token: 'elapsed-time-miscount' },
      { text: '7 hours 25 minutes', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
      { text: '5 hours 45 minutes', is_correct: false, misconception_token: 'read-clock-wrong' },
    ], solution: 'From 9:20 to 2:20 is 5 hours, but the return is 2:05, which is 15 minutes less: 4 hours 45 minutes.' },
    { slot: 18, difficulty: 'hard', stem: 'A line plot shows: 4 pencils at 6 cm, 3 pencils at 7 cm, and 5 pencils at 8 cm. What is the total length of just the 7-cm pencils?', choices: [
      { text: '21 cm', is_correct: true },
      { text: '7 cm', is_correct: false, misconception_token: 'misread-the-graph' },
      { text: '3 cm', is_correct: false, misconception_token: 'wrong-scale' },
      { text: '10 cm', is_correct: false, misconception_token: 'added-the-parts' },
    ], solution: 'There are 3 pencils that are 7 cm each: 3 times 7 = 21 cm. 3 gives just the count, and 10 adds 7 + 3.' },
    { slot: 19, difficulty: 'hard', stem: 'A store opens at 8:15 in the morning and closes at 6:45 in the evening. How long is it open?', choices: [
      { text: '10 hours 30 minutes', is_correct: true },
      { text: '10 hours', is_correct: false, misconception_token: 'elapsed-time-miscount' },
      { text: '2 hours 30 minutes', is_correct: false, misconception_token: 'subtracted-instead' },
      { text: '14 hours 60 minutes', is_correct: false, misconception_token: 'added-instead-of-subtracted' },
    ], solution: 'From 8:15 to 6:15 in the evening is 10 hours, plus 30 more minutes to 6:45 is 10 hours 30 minutes.' },
    { slot: 20, difficulty: 'hard', stem: 'On a graph, each book symbol stands for 4 books. Maria\'s row shows 5 and a half symbols. How many books did Maria read?', choices: [
      { text: '22', is_correct: true },
      { text: '20', is_correct: false, misconception_token: 'wrong-scale' },
      { text: '9', is_correct: false, misconception_token: 'added-the-parts' },
      { text: '5', is_correct: false, misconception_token: 'misread-the-graph' },
    ], solution: '5 and a half symbols, 4 books each: 5.5 times 4 = 22. 20 ignores the half symbol, and 9 adds 4 + 5.' },
  ],
}

// ============================================================================
// Grade 3 — Early Geometry (CCSS 3.G): shapes and their attributes, categories of
// quadrilaterals, and partitioning shapes into equal parts (unit fractions).
// ============================================================================
const EARLY_GEOMETRY_3: GapMathSkill = {
  slug: 'early-geometry', name: 'Shapes & Their Attributes', subject: 'math',
  ccssGrade: '3', ccssGradeNum: 3, ccssCode: 'CCSS.MATH.CONTENT.3.G.A',
  satAlignment: 'geometry-trigonometry', gradeBand: '3-5',
  items: [
    { slot: 1, difficulty: 'easy', stem: 'How many sides does a hexagon have?', choices: [
      { text: '6', is_correct: true },
      { text: '5', is_correct: false, misconception_token: 'miscounted-sides' },
      { text: '4', is_correct: false, misconception_token: 'wrong-shape-name' },
      { text: '12', is_correct: false, misconception_token: 'wrong-attribute' },
    ], solution: 'A hexagon has 6 sides. 4 sides would be a quadrilateral, and 12 counts sides and corners together.' },
    { slot: 2, difficulty: 'easy', stem: 'Which shape is a quadrilateral (a shape with exactly 4 sides)?', choices: [
      { text: 'A rectangle', is_correct: true },
      { text: 'A triangle', is_correct: false, misconception_token: 'wrong-shape-name' },
      { text: 'A pentagon', is_correct: false, misconception_token: 'miscounted-sides' },
      { text: 'A circle', is_correct: false, misconception_token: 'wrong-attribute' },
    ], solution: 'A rectangle has 4 sides. A triangle has 3, a pentagon has 5, and a circle has no straight sides.' },
    { slot: 3, difficulty: 'easy', stem: 'A shape has 4 equal sides and 4 square corners. What is it?', choices: [
      { text: 'A square', is_correct: true },
      { text: 'A rectangle', is_correct: false, misconception_token: 'wrong-attribute' },
      { text: 'A triangle', is_correct: false, misconception_token: 'miscounted-sides' },
      { text: 'A rhombus', is_correct: false, misconception_token: 'not-a-right-angle' },
    ], solution: 'A square has 4 equal sides AND square corners. A rectangle\'s sides are not all equal, and a rhombus has equal sides but not square corners.' },
    { slot: 4, difficulty: 'easy', stem: 'How many sides does a triangle have?', choices: [
      { text: '3', is_correct: true },
      { text: '4', is_correct: false, misconception_token: 'wrong-shape-name' },
      { text: '2', is_correct: false, misconception_token: 'miscounted-sides' },
      { text: '6', is_correct: false, misconception_token: 'wrong-attribute' },
    ], solution: 'A triangle has 3 sides. 4 would be a quadrilateral.' },
    { slot: 5, difficulty: 'easy', stem: 'A rectangle is divided into 4 equal parts. What fraction is 1 part?', choices: [
      { text: '1/4', is_correct: true },
      { text: '1/3', is_correct: false, misconception_token: 'miscounted-sides' },
      { text: '3/4', is_correct: false, misconception_token: 'used-the-other-part' },
      { text: '4/4', is_correct: false, misconception_token: 'numerator-too-high' },
    ], solution: '1 of 4 equal parts is 1/4. 3/4 is the other three parts, and 4/4 is the whole thing.' },
    { slot: 6, difficulty: 'easy', stem: 'Which shape has MORE than 4 sides?', choices: [
      { text: 'A hexagon', is_correct: true },
      { text: 'A square', is_correct: false, misconception_token: 'wrong-shape-name' },
      { text: 'A rhombus', is_correct: false, misconception_token: 'wrong-attribute' },
      { text: 'A triangle', is_correct: false, misconception_token: 'miscounted-sides' },
    ], solution: 'A hexagon has 6 sides. A square and rhombus have 4, and a triangle has 3.' },
    { slot: 7, difficulty: 'easy', stem: 'A stop sign has 8 sides. What is that shape called?', choices: [
      { text: 'An octagon', is_correct: true },
      { text: 'A hexagon', is_correct: false, misconception_token: 'wrong-shape-name' },
      { text: 'A pentagon', is_correct: false, misconception_token: 'miscounted-sides' },
      { text: 'A quadrilateral', is_correct: false, misconception_token: 'wrong-attribute' },
    ], solution: 'An 8-sided shape is an octagon. A hexagon has 6 and a pentagon has 5.' },
    { slot: 8, difficulty: 'easy', stem: 'How many corners (vertices) does a square have?', choices: [
      { text: '4', is_correct: true },
      { text: '8', is_correct: false, misconception_token: 'wrong-attribute' },
      { text: '3', is_correct: false, misconception_token: 'miscounted-sides' },
      { text: '5', is_correct: false, misconception_token: 'wrong-shape-name' },
    ], solution: 'A square has 4 corners. 8 counts sides and corners together.' },
    { slot: 9, difficulty: 'medium', stem: 'Which statement is TRUE about every rectangle?', choices: [
      { text: 'It has 4 right angles', is_correct: true },
      { text: 'All 4 sides are equal', is_correct: false, misconception_token: 'wrong-attribute' },
      { text: 'It has 3 sides', is_correct: false, misconception_token: 'miscounted-sides' },
      { text: 'It has no right angles', is_correct: false, misconception_token: 'not-a-right-angle' },
    ], solution: 'Every rectangle has 4 right angles. Only a square has all 4 sides equal.' },
    { slot: 10, difficulty: 'medium', stem: 'A square and a rhombus are both quadrilaterals. What makes a square special?', choices: [
      { text: 'All of its angles are right angles', is_correct: true },
      { text: 'It has 4 sides', is_correct: false, misconception_token: 'wrong-attribute' },
      { text: 'It has 3 sides', is_correct: false, misconception_token: 'miscounted-sides' },
      { text: 'It has curved sides', is_correct: false, misconception_token: 'wrong-shape-name' },
    ], solution: 'A square has right angles; a rhombus has equal sides but its angles are usually not right angles. Both have 4 sides, so that is not what makes a square special.' },
    { slot: 11, difficulty: 'medium', stem: 'A circle is cut into 6 equal slices. You eat 2 of them. What fraction of the circle did you eat?', choices: [
      { text: '2/6', is_correct: true },
      { text: '4/6', is_correct: false, misconception_token: 'used-the-other-part' },
      { text: '6/2', is_correct: false, misconception_token: 'digits-reversed' },
      { text: '2/8', is_correct: false, misconception_token: 'miscounted-sides' },
    ], solution: '2 of 6 equal slices is 2/6. 4/6 is what is left, and 2/8 uses the wrong number of total slices.' },
    { slot: 12, difficulty: 'medium', stem: 'Which shape is NOT a quadrilateral?', choices: [
      { text: 'A triangle', is_correct: true },
      { text: 'A square', is_correct: false, misconception_token: 'wrong-shape-name' },
      { text: 'A rectangle', is_correct: false, misconception_token: 'wrong-attribute' },
      { text: 'A rhombus', is_correct: false, misconception_token: 'miscounted-sides' },
    ], solution: 'A triangle has 3 sides, so it is not a quadrilateral. Squares, rectangles, and rhombuses all have 4 sides.' },
    { slot: 13, difficulty: 'medium', stem: 'A shape has 4 sides and exactly one pair of parallel sides. What is it?', choices: [
      { text: 'A trapezoid', is_correct: true },
      { text: 'A square', is_correct: false, misconception_token: 'wrong-attribute' },
      { text: 'A triangle', is_correct: false, misconception_token: 'miscounted-sides' },
      { text: 'A pentagon', is_correct: false, misconception_token: 'wrong-shape-name' },
    ], solution: 'A trapezoid has exactly one pair of parallel sides. A square has two pairs.' },
    { slot: 14, difficulty: 'medium', stem: 'A rectangle is split into 4 parts that are NOT the same size. Can one part be called 1/4?', choices: [
      { text: 'No — the parts must be equal to be fourths', is_correct: true },
      { text: 'Yes — any 4 parts make fourths', is_correct: false, misconception_token: 'wrong-attribute' },
      { text: 'No — it must be split into halves', is_correct: false, misconception_token: 'miscounted-sides' },
      { text: 'Yes — each part is 1/2', is_correct: false, misconception_token: 'part-size-too-big' },
    ], solution: 'A fraction like 1/4 means one of 4 EQUAL parts. Unequal parts cannot be called fourths.' },
    { slot: 15, difficulty: 'medium', stem: 'How many vertices (corners) does a hexagon have?', choices: [
      { text: '6', is_correct: true },
      { text: '12', is_correct: false, misconception_token: 'wrong-attribute' },
      { text: '5', is_correct: false, misconception_token: 'miscounted-sides' },
      { text: '8', is_correct: false, misconception_token: 'wrong-shape-name' },
    ], solution: 'A hexagon has 6 corners (one at each of its 6 sides). 12 counts sides and corners together.' },
    { slot: 16, difficulty: 'medium', stem: 'Which pair are BOTH quadrilaterals?', choices: [
      { text: 'A square and a trapezoid', is_correct: true },
      { text: 'A square and a triangle', is_correct: false, misconception_token: 'miscounted-sides' },
      { text: 'A triangle and a pentagon', is_correct: false, misconception_token: 'wrong-shape-name' },
      { text: 'A circle and a square', is_correct: false, misconception_token: 'wrong-attribute' },
    ], solution: 'A square and a trapezoid both have 4 sides. Triangles (3), pentagons (5), and circles (no straight sides) are not quadrilaterals.' },
    { slot: 17, difficulty: 'hard', stem: 'All squares are rectangles, but not all rectangles are squares. Why?', choices: [
      { text: 'A square needs all 4 sides equal, but a rectangle does not', is_correct: true },
      { text: 'A rectangle has more sides than a square', is_correct: false, misconception_token: 'miscounted-sides' },
      { text: 'A square has no right angles', is_correct: false, misconception_token: 'not-a-right-angle' },
      { text: 'They are completely different shapes', is_correct: false, misconception_token: 'wrong-attribute' },
    ], solution: 'A square is a special rectangle with all sides equal. Both have 4 sides and 4 right angles, so a square fits the rectangle rule, but a rectangle need not have equal sides.' },
    { slot: 18, difficulty: 'hard', stem: 'A pizza is cut into 8 equal slices. Three friends each eat 2 slices. What fraction of the pizza is LEFT?', choices: [
      { text: '2/8', is_correct: true },
      { text: '6/8', is_correct: false, misconception_token: 'used-the-other-part' },
      { text: '2/6', is_correct: false, misconception_token: 'miscounted-sides' },
      { text: '8/2', is_correct: false, misconception_token: 'digits-reversed' },
    ], solution: '3 friends times 2 slices = 6 eaten, so 8 - 6 = 2 left, which is 2/8. 6/8 is what was eaten.' },
    { slot: 19, difficulty: 'hard', stem: 'A shape has 4 right angles and 4 sides, but its sides are NOT all equal. What is the best name for it?', choices: [
      { text: 'A rectangle', is_correct: true },
      { text: 'A square', is_correct: false, misconception_token: 'wrong-attribute' },
      { text: 'A rhombus', is_correct: false, misconception_token: 'not-a-right-angle' },
      { text: 'A trapezoid', is_correct: false, misconception_token: 'wrong-shape-name' },
    ], solution: 'A rectangle has 4 right angles with opposite sides equal (but not all four). A square needs all sides equal.' },
    { slot: 20, difficulty: 'hard', stem: 'A hexagon is divided into 6 equal triangles. What fraction of the hexagon is 4 of the triangles?', choices: [
      { text: '4/6', is_correct: true },
      { text: '2/6', is_correct: false, misconception_token: 'used-the-other-part' },
      { text: '6/4', is_correct: false, misconception_token: 'digits-reversed' },
      { text: '4/8', is_correct: false, misconception_token: 'miscounted-sides' },
    ], solution: '4 of 6 equal triangles is 4/6. 2/6 is the leftover part, and 4/8 uses the wrong total.' },
  ],
}

// ============================================================================
// Grade 5 — Volume (CCSS 5.MD.C): understand volume and find it for right
// rectangular prisms as length times width times height (unit cubes).
// ============================================================================
const VOLUME_5: GapMathSkill = {
  slug: 'volume', name: 'Volume', subject: 'math',
  ccssGrade: '5', ccssGradeNum: 5, ccssCode: 'CCSS.MATH.CONTENT.5.MD.C.5',
  satAlignment: 'geometry-trigonometry', gradeBand: '3-5',
  items: [
    { slot: 1, difficulty: 'easy', stem: 'A box is 2 units long, 3 units wide, and 4 units tall. What is its volume in cubic units?', choices: [
      { text: '24', is_correct: true },
      { text: '9', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '6', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: '20', is_correct: false, misconception_token: 'off-by-one-factor' },
    ], solution: 'Volume is length times width times height: 2 times 3 times 4 = 24. 9 adds the sides, and 6 is only the base (2 times 3).' },
    { slot: 2, difficulty: 'easy', stem: 'A box is 3 units long, 3 units wide, and 2 units tall. What is its volume?', choices: [
      { text: '18', is_correct: true },
      { text: '8', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '9', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: '6', is_correct: false, misconception_token: 'used-only-two-dimensions' },
    ], solution: '3 times 3 times 2 = 18. 9 is only the base (3 times 3), and 8 adds the sides.' },
    { slot: 3, difficulty: 'easy', stem: 'How many unit cubes fill a box that is 5 long, 2 wide, and 2 tall?', choices: [
      { text: '20', is_correct: true },
      { text: '9', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '10', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: '4', is_correct: false, misconception_token: 'used-only-two-dimensions' },
    ], solution: '5 times 2 times 2 = 20 cubes. 10 is only the base (5 times 2), and 4 uses just two of the dimensions.' },
    { slot: 4, difficulty: 'easy', stem: 'A cube has edges that are all 4 units long. What is its volume?', choices: [
      { text: '64', is_correct: true },
      { text: '12', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '16', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: '48', is_correct: false, misconception_token: 'off-by-one-factor' },
    ], solution: '4 times 4 times 4 = 64. 16 is only one face (4 times 4), and 12 adds the three edges.' },
    { slot: 5, difficulty: 'easy', stem: 'A box is 6 units long, 1 unit wide, and 2 units tall. What is its volume?', choices: [
      { text: '12', is_correct: true },
      { text: '9', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '6', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: '2', is_correct: false, misconception_token: 'used-only-two-dimensions' },
    ], solution: '6 times 1 times 2 = 12. 6 is only the base (6 times 1), and 2 uses just two dimensions.' },
    { slot: 6, difficulty: 'easy', stem: 'A box is 2 units long, 2 units wide, and 5 units tall. What is its volume?', choices: [
      { text: '20', is_correct: true },
      { text: '9', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '4', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: '10', is_correct: false, misconception_token: 'used-only-two-dimensions' },
    ], solution: '2 times 2 times 5 = 20. 4 is only the base (2 times 2), and 10 uses only two dimensions (2 times 5).' },
    { slot: 7, difficulty: 'easy', stem: 'A box is 4 units long, 2 units wide, and 3 units tall. What is its volume?', choices: [
      { text: '24', is_correct: true },
      { text: '9', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '8', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: '6', is_correct: false, misconception_token: 'used-only-two-dimensions' },
    ], solution: '4 times 2 times 3 = 24. 8 is only the base (4 times 2), and 6 uses two dimensions (2 times 3).' },
    { slot: 8, difficulty: 'easy', stem: 'A rectangular prism is 5 units long, 3 units wide, and 2 units tall. What is its volume?', choices: [
      { text: '30', is_correct: true },
      { text: '10', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '15', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: '6', is_correct: false, misconception_token: 'used-only-two-dimensions' },
    ], solution: '5 times 3 times 2 = 30. 15 is only the base (5 times 3), and 6 uses two dimensions (3 times 2).' },
    { slot: 9, difficulty: 'medium', stem: 'A box holds 2 layers of unit cubes. Each layer has 12 cubes. What is the volume?', choices: [
      { text: '24', is_correct: true },
      { text: '14', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '12', is_correct: false, misconception_token: 'used-only-two-dimensions' },
      { text: '10', is_correct: false, misconception_token: 'off-by-one-factor' },
    ], solution: '2 layers of 12 cubes: 12 times 2 = 24. 12 counts only one layer, and 14 adds 12 + 2.' },
    { slot: 10, difficulty: 'medium', stem: 'A box is 4 units long, 3 units wide, and 5 units tall. What is its volume?', choices: [
      { text: '60', is_correct: true },
      { text: '12', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '20', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: '48', is_correct: false, misconception_token: 'off-by-one-factor' },
    ], solution: '4 times 3 times 5 = 60. 20 is only two dimensions (4 times 5), and 12 adds the sides.' },
    { slot: 11, difficulty: 'medium', stem: 'A fish tank is 10 inches long, 4 inches wide, and 6 inches tall. What is its volume in cubic inches?', choices: [
      { text: '240', is_correct: true },
      { text: '20', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '40', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: '60', is_correct: false, misconception_token: 'used-only-two-dimensions' },
    ], solution: '10 times 4 times 6 = 240. 40 is only the base (10 times 4), and 60 uses two dimensions (10 times 6).' },
    { slot: 12, difficulty: 'medium', stem: 'A box has a base of 12 square units and a height of 3 units. What is its volume?', choices: [
      { text: '36', is_correct: true },
      { text: '15', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '12', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: '39', is_correct: false, misconception_token: 'off-by-one-factor' },
    ], solution: 'Volume is base area times height: 12 times 3 = 36. 12 is only the base area, and 15 adds instead of multiplying.' },
    { slot: 13, difficulty: 'medium', stem: 'A box is 5 units long, 5 units wide, and 2 units tall. What is its volume?', choices: [
      { text: '50', is_correct: true },
      { text: '12', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '25', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: '10', is_correct: false, misconception_token: 'used-only-two-dimensions' },
    ], solution: '5 times 5 times 2 = 50. 25 is only the base (5 times 5), and 10 uses two dimensions (5 times 2).' },
    { slot: 14, difficulty: 'medium', stem: 'Box A is 3 by 3 by 3. Box B is 2 by 2 by 6. Which box has the greater volume?', choices: [
      { text: 'Box A (27) is greater than Box B (24)', is_correct: true },
      { text: 'Box B, because it is taller', is_correct: false, misconception_token: 'used-only-two-dimensions' },
      { text: 'They are equal', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: 'Box B (26) is greater than Box A (25)', is_correct: false, misconception_token: 'off-by-one-factor' },
    ], solution: 'Box A: 3 times 3 times 3 = 27. Box B: 2 times 2 times 6 = 24. Box A is greater. Being taller does not make the volume bigger by itself.' },
    { slot: 15, difficulty: 'medium', stem: 'A box is 8 units long, 2 units wide, and 3 units tall. What is its volume?', choices: [
      { text: '48', is_correct: true },
      { text: '13', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '16', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: '6', is_correct: false, misconception_token: 'used-only-two-dimensions' },
    ], solution: '8 times 2 times 3 = 48. 16 is only the base (8 times 2), and 6 uses two dimensions (2 times 3).' },
    { slot: 16, difficulty: 'medium', stem: 'A cube has edges of 5 units. What is its volume?', choices: [
      { text: '125', is_correct: true },
      { text: '15', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '25', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: '100', is_correct: false, misconception_token: 'off-by-one-factor' },
    ], solution: '5 times 5 times 5 = 125. 25 is only one face, and 15 adds the three edges.' },
    { slot: 17, difficulty: 'hard', stem: 'A box is 6 units long, 4 units wide, and 5 units tall. What is its volume?', choices: [
      { text: '120', is_correct: true },
      { text: '15', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '24', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: '96', is_correct: false, misconception_token: 'off-by-one-factor' },
    ], solution: '6 times 4 times 5 = 120. 24 is only the base (6 times 4), and 15 adds the sides.' },
    { slot: 18, difficulty: 'hard', stem: 'A solid is made of two blocks joined together: a 4 by 2 by 2 block and a 2 by 2 by 2 block. What is the total volume?', choices: [
      { text: '24', is_correct: true },
      { text: '16', is_correct: false, misconception_token: 'used-only-two-dimensions' },
      { text: '12', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '32', is_correct: false, misconception_token: 'off-by-one-factor' },
    ], solution: 'First block: 4 times 2 times 2 = 16. Second block: 2 times 2 times 2 = 8. Total 16 + 8 = 24. 16 counts only the first block.' },
    { slot: 19, difficulty: 'hard', stem: 'A box has a volume of 48 cubic units and a base area of 8 square units. How tall is it?', choices: [
      { text: '6', is_correct: true },
      { text: '40', is_correct: false, misconception_token: 'subtracted-instead' },
      { text: '384', is_correct: false, misconception_token: 'multiplied-instead-of-divided' },
      { text: '8', is_correct: false, misconception_token: 'confused-volume-with-area' },
    ], solution: 'Volume is base times height, so height is volume divided by base: 48 divided by 8 = 6. 384 multiplies, and 40 subtracts.' },
    { slot: 20, difficulty: 'hard', stem: 'How many 1-inch cubes fit in a box that is 10 inches long, 10 inches wide, and 10 inches tall?', choices: [
      { text: '1,000', is_correct: true },
      { text: '30', is_correct: false, misconception_token: 'added-the-dimensions' },
      { text: '100', is_correct: false, misconception_token: 'confused-volume-with-area' },
      { text: '300', is_correct: false, misconception_token: 'off-by-one-factor' },
    ], solution: '10 times 10 times 10 = 1,000 cubes. 100 is only one face (10 times 10), and 30 adds the three edges.' },
  ],
}

export const GAP_MATH_SKILLS: GapMathSkill[] = [
  PLACE_VALUE_3,
  ROUNDING_3,
  ADD_SUBTRACT_3,
  MEASUREMENT_DATA_3,
  EARLY_GEOMETRY_3,
  VOLUME_5,
]

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

export interface BuiltGapQuestion {
  stem: string
  choices: GapChoice[]
  correct_answer: string
  solution: string
  difficulty: Difficulty
}

/** Build the served question for one curated item: deterministically shuffle the
 *  choices and pull the correct option's text as correct_answer. Pure. */
export function buildGapQuestion(item: GapItem, seed: number): BuiltGapQuestion {
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
