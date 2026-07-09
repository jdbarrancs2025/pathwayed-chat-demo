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
    {
      slot: 6,
      difficulty: 'easy',
      stem: 'Everyone on the two debate teams ______ expected to research both sides of the topic before the tournament.',
      choices: [
        { text: 'is', is_correct: true },
        { text: 'are', is_correct: false, misconception_token: 'agreed-with-nearby-noun' },
        { text: 'were', is_correct: false, misconception_token: 'plural-verb-for-singular' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution:
        'The subject "Everyone" is always singular, so it takes "is." The nearby "teams" sits inside the phrase and does not change the subject.',
    },
    {
      slot: 7,
      difficulty: 'easy',
      stem: 'Beyond the long rows of tall bookshelves ______ a quiet reading nook with two comfortable armchairs.',
      choices: [
        { text: 'sits', is_correct: true },
        { text: 'sit', is_correct: false, misconception_token: 'agreed-with-nearby-noun' },
        { text: 'sitting', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'have sat', is_correct: false, misconception_token: 'plural-verb-for-singular' },
      ],
      solution:
        'The subject is the singular "nook," which comes after the verb. "Bookshelves" is part of the opening phrase, so the verb stays singular: "sits."',
    },
    {
      slot: 8,
      difficulty: 'easy',
      stem: "The news about the damaged coastal highways ______ posted on the city's website every hour.",
      choices: [
        { text: 'is', is_correct: true },
        { text: 'are', is_correct: false, misconception_token: 'plural-verb-for-singular' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'to be', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution:
        'Even though it ends in -s, "news" is a singular noun, so it takes "is."',
    },
    {
      slot: 9,
      difficulty: 'easy',
      stem: "One of the museum's oldest paintings ______ on loan to a gallery in another city this month.",
      choices: [
        { text: 'is', is_correct: true },
        { text: 'are', is_correct: false, misconception_token: 'agreed-with-nearby-noun' },
        { text: 'were', is_correct: false, misconception_token: 'plural-verb-for-singular' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution:
        'The subject is "One" (singular), so the verb is "is." "Paintings" is just part of the "of" phrase that follows.',
    },
    {
      slot: 10,
      difficulty: 'easy',
      stem: 'Collecting rare stamps from distant countries ______ her favorite way to unwind after a long week.',
      choices: [
        { text: 'is', is_correct: true },
        { text: 'are', is_correct: false, misconception_token: 'agreed-with-nearby-noun' },
        { text: 'were', is_correct: false, misconception_token: 'plural-verb-for-singular' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution:
        'The subject is the gerund phrase "Collecting rare stamps …," which names one activity and is singular, so the verb is "is."',
    },
    {
      slot: 11,
      difficulty: 'easy',
      stem: 'Macaroni and cheese ______ the dish that sells out fastest at the school fundraiser every year.',
      choices: [
        { text: 'is', is_correct: true },
        { text: 'are', is_correct: false, misconception_token: 'treated-unit-as-plural' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'to be', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution:
        '"Macaroni and cheese" names a single dish, so it takes the singular "is" even though it is joined by "and."',
    },
    {
      slot: 12,
      difficulty: 'medium',
      stem: "Neither the coach nor the players ______ satisfied with the referee's final call.",
      choices: [
        { text: 'were', is_correct: true },
        { text: 'was', is_correct: false, misconception_token: 'matched-farther-subject' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'to be', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution:
        'With "neither … nor," the verb agrees with the nearer subject, "players," which is plural, so "were."',
    },
    {
      slot: 13,
      difficulty: 'medium',
      stem: 'Either the students or their teacher ______ going to introduce the guest speaker at the assembly.',
      choices: [
        { text: 'is', is_correct: true },
        { text: 'are', is_correct: false, misconception_token: 'matched-farther-subject' },
        { text: 'have been', is_correct: false, misconception_token: 'plural-verb-for-singular' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution:
        'With "either … or," the verb agrees with the nearer subject, "teacher," which is singular, so "is."',
    },
    {
      slot: 14,
      difficulty: 'medium',
      stem: 'The number of applicants for the summer scholarship ______ higher this year than ever before.',
      choices: [
        { text: 'is', is_correct: true },
        { text: 'are', is_correct: false, misconception_token: 'agreed-with-nearby-noun' },
        { text: 'were', is_correct: false, misconception_token: 'plural-verb-for-singular' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution:
        '"The number of" refers to one total, so it takes the singular "is." (By contrast, "a number of" means "several" and would be plural.)',
    },
    {
      slot: 15,
      difficulty: 'medium',
      stem: 'Here ______ the results that the research team has been waiting weeks to see.',
      choices: [
        { text: 'are', is_correct: true },
        { text: 'is', is_correct: false, misconception_token: 'singular-verb-for-plural' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'to be', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution:
        'In "Here ___ the results," the real subject is the plural "results," which follows the verb, so "are."',
    },
    {
      slot: 16,
      difficulty: 'medium',
      stem: 'Fifteen dollars ______ a fair price for a ticket to the student-run play on Friday night.',
      choices: [
        { text: 'is', is_correct: true },
        { text: 'are', is_correct: false, misconception_token: 'treated-unit-as-plural' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'to be', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution:
        'A sum of money like "fifteen dollars" is treated as one amount, so it takes the singular "is."',
    },
    {
      slot: 17,
      difficulty: 'medium',
      stem: 'The starting quarterback and the head coach ______ reviewing game footage late into the night.',
      choices: [
        { text: 'are', is_correct: true },
        { text: 'is', is_correct: false, misconception_token: 'singular-for-compound-subject' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'to be', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution:
        'Two subjects joined by "and" form a plural compound subject, so the verb is "are."',
    },
    {
      slot: 18,
      difficulty: 'hard',
      stem: 'Neither the senators nor the governor ______ willing to compromise on the proposed budget.',
      choices: [
        { text: 'is', is_correct: true },
        { text: 'are', is_correct: false, misconception_token: 'matched-farther-subject' },
        { text: 'have been', is_correct: false, misconception_token: 'plural-verb-for-singular' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution:
        'With "neither … nor," the verb matches the nearer subject; here that is the singular "governor," so "is." (If "senators" came second, it would be "are.")',
    },
    {
      slot: 19,
      difficulty: 'hard',
      stem: 'The lead editor is one of those reviewers who ______ willing to read a manuscript twice before deciding.',
      choices: [
        { text: 'are', is_correct: true },
        { text: 'is', is_correct: false, misconception_token: 'singular-verb-for-plural' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'to be', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution:
        'In "one of those reviewers who …," the "who" refers to the plural "reviewers," so the verb is "are."',
    },
    {
      slot: 20,
      difficulty: 'hard',
      stem: 'Among the artifacts in the new exhibit ______ a collection of ancient coins that draws large crowds.',
      choices: [
        { text: 'is', is_correct: true },
        { text: 'are', is_correct: false, misconception_token: 'agreed-with-nearby-noun' },
        { text: 'were', is_correct: false, misconception_token: 'plural-verb-for-singular' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution:
        'The subject is the singular "collection," which follows the verb. "Artifacts" and "coins" sit inside phrases, so the verb is "is."',
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
    {
      slot: 6,
      difficulty: 'easy',
      stem: 'The renovated library features a ______ reading room that overlooks the courtyard.',
      choices: [
        { text: 'bright, airy', is_correct: true },
        { text: 'bright airy', is_correct: false, misconception_token: 'missing-comma' },
        { text: 'bright; airy', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'bright. Airy', is_correct: false, misconception_token: 'period-creates-fragment' },
      ],
      solution:
        'Two adjectives that each describe the noun equally are separated by a comma: "a bright, airy reading room."',
    },
    {
      slot: 7,
      difficulty: 'easy',
      stem: 'Built entirely from salvaged ______ the community center opened to the public last spring.',
      choices: [
        { text: 'materials, the', is_correct: true },
        { text: 'materials the', is_correct: false, misconception_token: 'missing-comma' },
        { text: 'materials; the', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'materials. The', is_correct: false, misconception_token: 'period-creates-fragment' },
      ],
      solution:
        'The opening phrase "Built entirely from salvaged materials" is not a complete sentence, so a comma follows it before the main clause.',
    },
    {
      slot: 8,
      difficulty: 'easy',
      stem: 'The experiment produced unexpected ______ so the team repeated it the following week.',
      choices: [
        { text: 'results,', is_correct: true },
        { text: 'results', is_correct: false, misconception_token: 'missing-comma' },
        { text: 'results;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'results:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution:
        'When a coordinating conjunction like "so" joins two complete sentences, a comma comes before it: "results, so the team…"',
    },
    {
      slot: 9,
      difficulty: 'easy',
      stem: '______ the results were promising enough to justify a larger follow-up study.',
      choices: [
        { text: 'Overall,', is_correct: true },
        { text: 'Overall', is_correct: false, misconception_token: 'missing-comma' },
        { text: 'Overall;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'Overall:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution:
        'An introductory transition word like "Overall" is followed by a comma before the main clause.',
    },
    {
      slot: 10,
      difficulty: 'easy',
      stem: 'How many students actually finished the summer reading list before classes ______',
      choices: [
        { text: 'began?', is_correct: true },
        { text: 'began.', is_correct: false, misconception_token: 'missing-question-mark' },
        { text: 'began!', is_correct: false, misconception_token: 'exclamation-misuse' },
        { text: 'began', is_correct: false, misconception_token: 'missing-end-punctuation' },
      ],
      solution:
        'This sentence asks a direct question, so it ends with a question mark.',
    },
    {
      slot: 11,
      difficulty: 'easy',
      stem: "Ms. ______ our school's new principal, previously taught chemistry for fifteen years.",
      choices: [
        { text: 'Alvarez,', is_correct: true },
        { text: 'Alvarez', is_correct: false, misconception_token: 'missing-comma' },
        { text: 'Alvarez;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'Alvarez:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution:
        'The appositive "our school\'s new principal" renames Ms. Alvarez and is set off with commas, so a comma follows her name.',
    },
    {
      slot: 12,
      difficulty: 'medium',
      stem: 'The trail was much steeper than we ______ we reached the summit just before noon.',
      choices: [
        { text: 'expected. We', is_correct: true },
        { text: 'expected, we', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'expected we', is_correct: false, misconception_token: 'run-on' },
        { text: 'expected; and we', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution:
        'These are two complete sentences, so a period separates them. A comma alone is a splice, no mark is a run-on, and a semicolon does not precede "and."',
    },
    {
      slot: 13,
      difficulty: 'medium',
      stem: 'The novel that our book club chose this ______ turned out to be a surprising favorite.',
      choices: [
        { text: 'month', is_correct: true },
        { text: 'month,', is_correct: false, misconception_token: 'comma-splits-subject-verb' },
        { text: 'month;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'month:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution:
        'Nothing should separate the subject ("The novel that our book club chose this month") from its verb ("turned out"), so no punctuation belongs in the blank.',
    },
    {
      slot: 14,
      difficulty: 'medium',
      stem: 'The old ______ which has guided ships for over a century, will finally be restored this year.',
      choices: [
        { text: 'lighthouse,', is_correct: true },
        { text: 'lighthouse', is_correct: false, misconception_token: 'missing-comma' },
        { text: 'lighthouse;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'lighthouse:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution:
        'The "which" clause adds nonessential information, so it is set off with commas — a comma opens it after "lighthouse."',
    },
    {
      slot: 15,
      difficulty: 'medium',
      stem: 'The one ______ who auditioned last will find out the results tomorrow afternoon.',
      choices: [
        { text: 'violinist', is_correct: true },
        { text: 'violinist,', is_correct: false, misconception_token: 'unneeded-restrictive-comma' },
        { text: 'violinist;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'violinist:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution:
        'The clause "who auditioned last" identifies which violinist and is essential, so it is not set off with a comma.',
    },
    {
      slot: 16,
      difficulty: 'medium',
      stem: "The museum extended its evening ______ visitors could now stay until nine o'clock.",
      choices: [
        { text: 'hours. Visitors', is_correct: true },
        { text: 'hours, visitors', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'hours visitors', is_correct: false, misconception_token: 'run-on' },
        { text: 'hours; and visitors', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution:
        'Two complete sentences need a period between them. A comma alone is a splice, no mark is a run-on, and a semicolon does not precede "and."',
    },
    {
      slot: 17,
      difficulty: 'medium',
      stem: 'The city council reviewed the proposal for several weeks ______ approved it unanimously at the spring meeting.',
      choices: [
        { text: 'and', is_correct: true },
        { text: ', and', is_correct: false, misconception_token: 'unnecessary-comma' },
        { text: '; and', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: '. And', is_correct: false, misconception_token: 'period-creates-fragment' },
      ],
      solution:
        '"Reviewed … and approved" is a compound predicate (two verbs, one subject), so no comma comes before "and."',
    },
    {
      slot: 18,
      difficulty: 'hard',
      stem: 'The first prototype failed three safety ______ the second passed every test on the first try.',
      choices: [
        { text: 'checks; the', is_correct: true },
        { text: 'checks, the', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'checks the', is_correct: false, misconception_token: 'run-on' },
        { text: 'checks: the', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution:
        'Two closely related complete sentences can be joined by a semicolon. A comma is a splice, no mark is a run-on, and a colon would wrongly signal that the second part explains the first.',
    },
    {
      slot: 19,
      difficulty: 'hard',
      stem: 'The keynote ______ a leading expert on ocean currents, spoke for nearly an hour without notes.',
      choices: [
        { text: 'speaker,', is_correct: true },
        { text: 'speaker', is_correct: false, misconception_token: 'missing-comma' },
        { text: 'speaker—', is_correct: false, misconception_token: 'unpaired-dash' },
        { text: 'speaker;', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution:
        'The appositive "a leading expert on ocean currents" is set off by a pair of commas, so a comma follows "speaker." A lone dash would need a matching dash later.',
    },
    {
      slot: 20,
      difficulty: 'hard',
      stem: 'The data looked ______ however, the team wanted an independent lab to confirm the findings.',
      choices: [
        { text: 'conclusive;', is_correct: true },
        { text: 'conclusive,', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'conclusive', is_correct: false, misconception_token: 'run-on' },
        { text: 'conclusive:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution:
        'When "however" joins two complete sentences, a semicolon precedes it. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.',
    },
  ],
}

// Sentence structure: complete sentences vs. fragments, and joining clauses with
// the right connector/punctuation (comma+conjunction, semicolon, subordination).
const SENTENCE_STRUCTURE: GrammarTemplate = {
  code: 'grammar-sentence-structure',
  skillSlug: 'sentence-structure',
  satAlignment: 'standard-english-conventions',
  kind: 'curated_pool',
  items: [
    {
      slot: 1,
      difficulty: 'easy',
      stem: 'The bakery on the corner, famous for its cinnamon ______ every morning at sunrise.',
      choices: [
        { text: 'rolls, opens', is_correct: true },
        { text: 'rolls, opening', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'rolls, which opens', is_correct: false, misconception_token: 'creates-a-fragment' },
        { text: 'rolls, to open', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution: 'The sentence needs a main verb for its subject "The bakery," so "opens" completes it. The other options leave a fragment.',
    },
    {
      slot: 2,
      difficulty: 'easy',
      stem: 'Although the early results looked promising, the research team ______ several more rounds of testing before publishing.',
      choices: [
        { text: 'conducted', is_correct: true },
        { text: 'conducting', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'to conduct', is_correct: false, misconception_token: 'used-infinitive' },
        { text: 'which conducted', is_correct: false, misconception_token: 'creates-a-fragment' },
      ],
      solution: 'The main clause needs a complete verb ("conducted"). The "-ing," "to," and "which" versions leave the sentence unfinished.',
    },
    {
      slot: 3,
      difficulty: 'medium',
      stem: 'The storm knocked out power across the ______ crews worked through the night to restore it.',
      choices: [
        { text: 'county; the', is_correct: true },
        { text: 'county, the', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'county the', is_correct: false, misconception_token: 'run-on' },
        { text: 'county and the', is_correct: false, misconception_token: 'missing-comma' },
      ],
      solution: 'Two complete sentences can be joined by a semicolon. A comma alone is a splice, no punctuation is a run-on, and joining with "and" would need a comma before it.',
    },
    {
      slot: 4,
      difficulty: 'medium',
      stem: 'The recipe called for fresh ______ we substituted dried ones, and the dish still turned out well.',
      choices: [
        { text: 'herbs, but', is_correct: true },
        { text: 'herbs, we', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'herbs we', is_correct: false, misconception_token: 'run-on' },
        { text: 'herbs; but', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution: 'A comma plus a joining word like "but" links two complete sentences. A comma alone splices them, no punctuation runs them together, and a semicolon does not go before "but."',
    },
    {
      slot: 5,
      difficulty: 'hard',
      stem: 'The prototype passed every safety ______ however, the engineers wanted one more round of tests.',
      choices: [
        { text: 'test;', is_correct: true },
        { text: 'test,', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'test', is_correct: false, misconception_token: 'run-on' },
        { text: 'test:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'When "however" joins two complete sentences, a semicolon comes before it. A comma there is a splice, no mark is a run-on, and a colon does not fit between two complete clauses like this.',
    },
    {
      slot: 6,
      difficulty: 'easy',
      stem: 'The ferry was delayed by dense ______ passengers waited patiently on the dock for over an hour.',
      choices: [
        { text: 'fog, so', is_correct: true },
        { text: 'fog,', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'fog', is_correct: false, misconception_token: 'run-on' },
        { text: 'fog; and', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution: 'A comma plus a coordinating conjunction ("so") joins two complete sentences. A comma alone is a splice, no punctuation is a run-on, and a semicolon does not precede "and."',
    },
    {
      slot: 7,
      difficulty: 'easy',
      stem: 'The old lantern hanging above the workshop bench ______ a warm glow over the cluttered table.',
      choices: [
        { text: 'casts', is_correct: true },
        { text: 'casting', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'to cast', is_correct: false, misconception_token: 'used-infinitive' },
        { text: 'which casts', is_correct: false, misconception_token: 'creates-a-fragment' },
      ],
      solution: 'The subject "lantern" needs a complete main verb, "casts." The "-ing," "to," and "which" forms leave the sentence a fragment.',
    },
    {
      slot: 8,
      difficulty: 'easy',
      stem: 'The first act of the play was slow and ______ the second act won the audience over completely.',
      choices: [
        { text: 'quiet; the', is_correct: true },
        { text: 'quiet, the', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'quiet the', is_correct: false, misconception_token: 'run-on' },
        { text: 'quiet: the', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'Two complete sentences can be joined by a semicolon. A comma alone splices them, no mark runs them together, and a colon does not join two independent clauses like this.',
    },
    {
      slot: 9,
      difficulty: 'easy',
      stem: 'The community garden, a plot that neighbors started five years ______ dozens of families every summer.',
      choices: [
        { text: 'ago, feeds', is_correct: true },
        { text: 'ago, feeding', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'ago, to feed', is_correct: false, misconception_token: 'used-infinitive' },
        { text: 'ago, which feeds', is_correct: false, misconception_token: 'creates-a-fragment' },
      ],
      solution: 'The subject "garden" needs a main verb ("feeds"). The "-ing," "to," and "which" versions leave the sentence unfinished.',
    },
    {
      slot: 10,
      difficulty: 'easy',
      stem: 'After weeks of intense rehearsal, ______ the entire symphony from memory at the winter concert.',
      choices: [
        { text: 'the orchestra performed', is_correct: true },
        { text: 'performing', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'the orchestra performing', is_correct: false, misconception_token: 'creates-a-fragment' },
        { text: 'to perform', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution: 'The main clause needs a subject and a complete verb: "the orchestra performed." The "-ing" and "to" forms leave only a fragment.',
    },
    {
      slot: 11,
      difficulty: 'easy',
      stem: 'The scholarship, established by a former ______ covers tuition for two students each year.',
      choices: [
        { text: 'graduate, covers', is_correct: true },
        { text: 'graduate, covering', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'graduate, which covers', is_correct: false, misconception_token: 'creates-a-fragment' },
        { text: 'graduate, to cover', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution: 'The subject "scholarship" needs a main verb ("covers"). The "-ing," "which," and "to" forms leave the sentence a fragment.',
    },
    {
      slot: 12,
      difficulty: 'medium',
      stem: "The bridge's original design proved too ______ engineers spent another year revising the plans.",
      choices: [
        { text: 'costly. Engineers', is_correct: true },
        { text: 'costly, engineers', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'costly engineers', is_correct: false, misconception_token: 'run-on' },
        { text: 'costly; and engineers', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution: 'These are two complete sentences, so a period separates them. A comma alone is a splice, no mark is a run-on, and a semicolon does not precede "and."',
    },
    {
      slot: 13,
      difficulty: 'medium',
      stem: 'The new filing system saved the office countless ______ moreover, it eliminated most billing errors.',
      choices: [
        { text: 'hours;', is_correct: true },
        { text: 'hours,', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'hours', is_correct: false, misconception_token: 'run-on' },
        { text: 'hours:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'When "moreover" joins two complete sentences, a semicolon comes before it. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.',
    },
    {
      slot: 14,
      difficulty: 'medium',
      stem: 'The proposal to convert the old rail line into a public ______ under review by three separate committees.',
      choices: [
        { text: 'trail remains', is_correct: true },
        { text: 'trail, remaining', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'trail, which remains', is_correct: false, misconception_token: 'creates-a-fragment' },
        { text: 'trail to remain', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution: 'The subject "proposal" needs a complete verb: "remains." "Remaining," "which remains," and "to remain" each leave a fragment.',
    },
    {
      slot: 15,
      difficulty: 'medium',
      stem: 'The volunteers had underestimated the size of the ______ they returned the next morning with more supplies.',
      choices: [
        { text: 'cleanup. They', is_correct: true },
        { text: 'cleanup, they', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'cleanup they', is_correct: false, misconception_token: 'run-on' },
        { text: 'cleanup; and they', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution: 'Two complete sentences take a period. A comma alone is a splice, no mark is a run-on, and a semicolon does not precede "and."',
    },
    {
      slot: 16,
      difficulty: 'medium',
      stem: 'The design team missed the first ______ but they delivered a far stronger concept a week later.',
      choices: [
        { text: 'deadline,', is_correct: true },
        { text: 'deadline', is_correct: false, misconception_token: 'missing-comma' },
        { text: 'deadline;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'deadline:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'Two complete sentences joined by "but" take a comma before the conjunction. No comma runs them together, and a semicolon or colon does not precede a coordinating conjunction like "but."',
    },
    {
      slot: 17,
      difficulty: 'medium',
      stem: 'Although the prototype worked in the ______ it failed repeatedly under real-world conditions.',
      choices: [
        { text: 'lab,', is_correct: true },
        { text: 'lab', is_correct: false, misconception_token: 'missing-comma' },
        { text: 'lab;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'lab. It', is_correct: false, misconception_token: 'period-creates-fragment' },
      ],
      solution: 'An introductory subordinate clause ("Although the prototype worked in the lab") is followed by a comma. A period leaves that clause a fragment, and a semicolon does not follow a dependent clause here.',
    },
    {
      slot: 18,
      difficulty: 'hard',
      stem: "The committee's decision to delay the vote until the following ______ many residents who had planned to speak.",
      choices: [
        { text: 'week frustrated', is_correct: true },
        { text: 'week, frustrating', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'week, which frustrated', is_correct: false, misconception_token: 'creates-a-fragment' },
        { text: 'week, to frustrate', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution: 'The subject "decision" needs a main verb: "frustrated." The "-ing," "which," and "to" forms leave the long sentence a fragment.',
    },
    {
      slot: 19,
      difficulty: 'hard',
      stem: "The novel's plot was intricate and its characters richly ______ still, some readers found the ending abrupt.",
      choices: [
        { text: 'drawn;', is_correct: true },
        { text: 'drawn,', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'drawn', is_correct: false, misconception_token: 'run-on' },
        { text: 'drawn:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'When the transition "still" joins two complete sentences, a semicolon comes before it. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.',
    },
    {
      slot: 20,
      difficulty: 'hard',
      stem: 'The research grant covered the equipment and travel ______ it did not include funding for a full-time assistant.',
      choices: [
        { text: 'costs, but', is_correct: true },
        { text: 'costs but', is_correct: false, misconception_token: 'missing-comma' },
        { text: 'costs, it', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'costs; but', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution: 'Two complete sentences joined by "but" take a comma before the conjunction: "costs, but it did not…" Dropping the comma runs them together, a comma without the conjunction splices them, and a semicolon does not precede "but."',
    },
  ],
}

// Pronoun-antecedent agreement (number) and pronoun case (subject/object, who/whom).
const PRONOUN_AGREEMENT: GrammarTemplate = {
  code: 'grammar-pronoun-agreement',
  skillSlug: 'pronoun-agreement',
  satAlignment: 'standard-english-conventions',
  kind: 'curated_pool',
  items: [
    {
      slot: 1,
      difficulty: 'medium',
      stem: 'The flock of geese circled the pond twice before ______ settled onto the water for the night.',
      choices: [
        { text: 'it', is_correct: true },
        { text: 'they', is_correct: false, misconception_token: 'pronoun-matches-nearby-noun' },
        { text: 'them', is_correct: false, misconception_token: 'wrong-pronoun-case' },
        { text: 'those', is_correct: false, misconception_token: 'wrong-pronoun-type' },
      ],
      solution: 'The pronoun replaces the singular "flock," so it is "it." "They" wrongly matches the nearby "geese"; "them" is an object pronoun; "those" is a demonstrative.',
    },
    {
      slot: 2,
      difficulty: 'medium',
      stem: 'The prize for the science fair was shared between Maria and ______ after the two of us finished the project together.',
      choices: [
        { text: 'me', is_correct: true },
        { text: 'I', is_correct: false, misconception_token: 'wrong-pronoun-case' },
        { text: 'myself', is_correct: false, misconception_token: 'reflexive-misuse' },
        { text: 'mine', is_correct: false, misconception_token: 'wrong-pronoun-type' },
      ],
      solution: 'After the preposition "between," use the object pronoun "me." "I" is a subject pronoun, "myself" is reflexive, and "mine" is possessive.',
    },
    {
      slot: 3,
      difficulty: 'hard',
      stem: 'The scientist ______ the committee selected for the grant had studied glaciers for over a decade.',
      choices: [
        { text: 'whom', is_correct: true },
        { text: 'who', is_correct: false, misconception_token: 'wrong-pronoun-case' },
        { text: 'which', is_correct: false, misconception_token: 'which-for-person' },
        { text: 'what', is_correct: false, misconception_token: 'wrong-pronoun-type' },
      ],
      solution: '"The committee selected [whom]" — the pronoun is the object of "selected," so "whom" is correct. "Who" is a subject pronoun, and "which"/"what" don\'t refer to a person.',
    },
    {
      slot: 4,
      difficulty: 'easy',
      stem: 'The novelist Jane Ellery revised ______ manuscript three times before finally submitting it.',
      choices: [
        { text: 'her', is_correct: true },
        { text: 'their', is_correct: false, misconception_token: 'pronoun-number-mismatch' },
        { text: "they're", is_correct: false, misconception_token: 'contraction-for-possessive' },
        { text: 'there', is_correct: false, misconception_token: 'wrong-word-homophone' },
      ],
      solution: 'The antecedent "Jane Ellery" is singular, so the possessive is "her." "Their" is plural, "they\'re" means "they are," and "there" is a place word.',
    },
    {
      slot: 5,
      difficulty: 'easy',
      stem: 'The research assistants submitted ______ findings to the lead scientist at the end of each week.',
      choices: [
        { text: 'their', is_correct: true },
        { text: 'its', is_correct: false, misconception_token: 'pronoun-number-mismatch' },
        { text: "they're", is_correct: false, misconception_token: 'contraction-for-possessive' },
        { text: 'there', is_correct: false, misconception_token: 'wrong-word-homophone' },
      ],
      solution: 'The antecedent "assistants" is plural, so the possessive is "their." "Its" is singular, "they\'re" means "they are," and "there" is a place word.',
    },
    {
      slot: 6,
      difficulty: 'easy',
      stem: 'The startup celebrated ______ first profitable quarter with a small party for the whole staff.',
      choices: [
        { text: 'its', is_correct: true },
        { text: 'their', is_correct: false, misconception_token: 'pronoun-number-mismatch' },
        { text: "it's", is_correct: false, misconception_token: 'contraction-for-possessive' },
        { text: 'there', is_correct: false, misconception_token: 'wrong-word-homophone' },
      ],
      solution: 'The antecedent "startup" is singular, so the possessive is "its." "Their" is plural, "it\'s" means "it is," and "there" is a place word.',
    },
    {
      slot: 7,
      difficulty: 'easy',
      stem: '______ and the other interns organized the entire fundraiser in under a week.',
      choices: [
        { text: 'She', is_correct: true },
        { text: 'Her', is_correct: false, misconception_token: 'wrong-pronoun-case' },
        { text: 'Herself', is_correct: false, misconception_token: 'reflexive-misuse' },
        { text: 'Hers', is_correct: false, misconception_token: 'wrong-pronoun-type' },
      ],
      solution: 'As part of the subject ("She and the other interns"), use the subject pronoun "She," not "Her," "Herself," or "Hers."',
    },
    {
      slot: 8,
      difficulty: 'easy',
      stem: 'The teachers submitted ______ grade reports before leaving for winter break.',
      choices: [
        { text: 'their', is_correct: true },
        { text: 'there', is_correct: false, misconception_token: 'wrong-word-homophone' },
        { text: "they're", is_correct: false, misconception_token: 'contraction-for-possessive' },
        { text: 'its', is_correct: false, misconception_token: 'pronoun-number-mismatch' },
      ],
      solution: 'The antecedent "teachers" is plural, so the possessive is "their." "There" is a place, "they\'re" means "they are," and "its" is singular.',
    },
    {
      slot: 9,
      difficulty: 'easy',
      stem: 'After finishing the marathon, the runners treated ______ to a well-earned meal.',
      choices: [
        { text: 'themselves', is_correct: true },
        { text: 'theirselves', is_correct: false, misconception_token: 'wrong-pronoun-type' },
        { text: 'them', is_correct: false, misconception_token: 'wrong-pronoun-case' },
        { text: 'themself', is_correct: false, misconception_token: 'pronoun-number-mismatch' },
      ],
      solution: 'The subject "runners" acts on itself, so use the reflexive "themselves." "Theirselves" is nonstandard, "them" is an object pronoun, and "themself" is singular.',
    },
    {
      slot: 10,
      difficulty: 'easy',
      stem: 'The scientist ______ discovered the new enzyme will present the findings at the conference.',
      choices: [
        { text: 'who', is_correct: true },
        { text: 'whom', is_correct: false, misconception_token: 'wrong-pronoun-case' },
        { text: 'which', is_correct: false, misconception_token: 'which-for-person' },
        { text: 'whose', is_correct: false, misconception_token: 'wrong-pronoun-type' },
      ],
      solution: '"Who" is the subject of "discovered," so it is correct. "Whom" is an object form, "whose" shows possession, and "which" is for things, not people.',
    },
    {
      slot: 11,
      difficulty: 'easy',
      stem: 'The audience rose to ______ feet as the final notes of the symphony faded.',
      choices: [
        { text: 'its', is_correct: true },
        { text: 'their', is_correct: false, misconception_token: 'pronoun-number-mismatch' },
        { text: "it's", is_correct: false, misconception_token: 'contraction-for-possessive' },
        { text: 'there', is_correct: false, misconception_token: 'wrong-word-homophone' },
      ],
      solution: '"Audience" acting as one unit is singular, so "its." "Their" is plural, "it\'s" means "it is," and "there" is a place word.',
    },
    {
      slot: 12,
      difficulty: 'medium',
      stem: 'The mentor ______ the students admired most had once been a struggling student herself.',
      choices: [
        { text: 'whom', is_correct: true },
        { text: 'who', is_correct: false, misconception_token: 'wrong-pronoun-case' },
        { text: 'which', is_correct: false, misconception_token: 'which-for-person' },
        { text: 'whose', is_correct: false, misconception_token: 'wrong-pronoun-type' },
      ],
      solution: '"The students admired [whom]" — the pronoun is the object of "admired," so "whom." "Who" is a subject form, "which" is for things, and "whose" shows possession.',
    },
    {
      slot: 13,
      difficulty: 'medium',
      stem: 'When Priya set her phone on the glass table, ______ cracked right down the middle.',
      choices: [
        { text: 'the table', is_correct: true },
        { text: 'it', is_correct: false, misconception_token: 'vague-pronoun-reference' },
        { text: 'they', is_correct: false, misconception_token: 'pronoun-number-mismatch' },
        { text: 'them', is_correct: false, misconception_token: 'wrong-pronoun-case' },
      ],
      solution: '"It" could mean the phone or the table, so naming "the table" keeps the reference clear. "They" and "them" are plural and match neither singular noun.',
    },
    {
      slot: 14,
      difficulty: 'medium',
      stem: 'The nonprofit that runs the shelter recently expanded ______ services to two neighboring towns.',
      choices: [
        { text: 'its', is_correct: true },
        { text: 'their', is_correct: false, misconception_token: 'pronoun-number-mismatch' },
        { text: "it's", is_correct: false, misconception_token: 'contraction-for-possessive' },
        { text: 'whose', is_correct: false, misconception_token: 'wrong-pronoun-type' },
      ],
      solution: 'The antecedent "nonprofit" is singular, so "its." "Their" is plural, "it\'s" means "it is," and "whose" is a relative pronoun, not the possessive needed here.',
    },
    {
      slot: 15,
      difficulty: 'medium',
      stem: 'My younger brother finished the puzzle much faster than ______ did.',
      choices: [
        { text: 'I', is_correct: true },
        { text: 'me', is_correct: false, misconception_token: 'wrong-pronoun-case' },
        { text: 'myself', is_correct: false, misconception_token: 'reflexive-misuse' },
        { text: 'mine', is_correct: false, misconception_token: 'wrong-pronoun-type' },
      ],
      solution: 'The comparison completes as "faster than I did," so the subject pronoun "I" is correct. "Me" is an object form, "myself" is reflexive, and "mine" is possessive.',
    },
    {
      slot: 16,
      difficulty: 'medium',
      stem: 'The award for best design went to ______ students who had stayed late every night.',
      choices: [
        { text: 'us', is_correct: true },
        { text: 'we', is_correct: false, misconception_token: 'wrong-pronoun-case' },
        { text: 'ourselves', is_correct: false, misconception_token: 'reflexive-misuse' },
        { text: 'our', is_correct: false, misconception_token: 'wrong-pronoun-type' },
      ],
      solution: '"To us students" — after the preposition "to," use the object pronoun "us." "We" is a subject form, "ourselves" is reflexive, and "our" is possessive.',
    },
    {
      slot: 17,
      difficulty: 'medium',
      stem: 'The library lends tablets to students who forget ______ own devices at home.',
      choices: [
        { text: 'their', is_correct: true },
        { text: 'there', is_correct: false, misconception_token: 'wrong-word-homophone' },
        { text: "they're", is_correct: false, misconception_token: 'contraction-for-possessive' },
        { text: 'his', is_correct: false, misconception_token: 'pronoun-number-mismatch' },
      ],
      solution: 'The antecedent "students" is plural, so "their." "There" is a place, "they\'re" means "they are," and "his" is singular.',
    },
    {
      slot: 18,
      difficulty: 'hard',
      stem: 'The novelist ______ the critics had once dismissed became the most celebrated writer of her generation.',
      choices: [
        { text: 'whom', is_correct: true },
        { text: 'who', is_correct: false, misconception_token: 'wrong-pronoun-case' },
        { text: 'which', is_correct: false, misconception_token: 'which-for-person' },
        { text: 'what', is_correct: false, misconception_token: 'wrong-pronoun-type' },
      ],
      solution: '"The critics had once dismissed [whom]" — object of "dismissed," so "whom." "Who" is a subject form, "which" is for things, and "what" does not refer to a person.',
    },
    {
      slot: 19,
      difficulty: 'hard',
      stem: 'It was ______ who first noticed that the two data sets did not match.',
      choices: [
        { text: 'we', is_correct: true },
        { text: 'us', is_correct: false, misconception_token: 'wrong-pronoun-case' },
        { text: 'ourselves', is_correct: false, misconception_token: 'reflexive-misuse' },
        { text: 'our', is_correct: false, misconception_token: 'wrong-pronoun-type' },
      ],
      solution: 'After the linking verb "was," a predicate pronoun takes the subject form: "It was we who noticed." "Us" is an object form, "ourselves" is reflexive, and "our" is possessive.',
    },
    {
      slot: 20,
      difficulty: 'hard',
      stem: 'The manager told the analyst that ______ needed to revise the forecast before noon.',
      choices: [
        { text: 'the analyst', is_correct: true },
        { text: 'she', is_correct: false, misconception_token: 'vague-pronoun-reference' },
        { text: 'they', is_correct: false, misconception_token: 'pronoun-number-mismatch' },
        { text: 'her', is_correct: false, misconception_token: 'wrong-pronoun-case' },
      ],
      solution: '"She" could mean the manager or the analyst, so naming "the analyst" makes the reference clear. "They" is plural, and "her" is an object pronoun that cannot be the subject.',
    },
  ],
}

// Verb tense consistency + correct verb forms (irregular past participles).
const VERB_TENSE_AND_FORM: GrammarTemplate = {
  code: 'grammar-verb-tense-and-form',
  skillSlug: 'verb-tense-and-form',
  satAlignment: 'standard-english-conventions',
  kind: 'curated_pool',
  items: [
    {
      slot: 1,
      difficulty: 'easy',
      stem: 'Last summer, the interns organized the archive and ______ hundreds of fragile documents.',
      choices: [
        { text: 'scanned', is_correct: true },
        { text: 'scan', is_correct: false, misconception_token: 'wrong-tense-for-context' },
        { text: 'will scan', is_correct: false, misconception_token: 'verb-tense-shift' },
        { text: 'scanning', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: '"Last summer … organized" sets the past tense, so the paired verb is "scanned." Present or future would shift the tense, and "-ing" is not a complete verb.',
    },
    {
      slot: 2,
      difficulty: 'medium',
      stem: 'By the time the fire alarm sounded, the technicians had already ______ the building.',
      choices: [
        { text: 'left', is_correct: true },
        { text: 'leaved', is_correct: false, misconception_token: 'wrong-past-participle' },
        { text: 'leave', is_correct: false, misconception_token: 'wrong-tense-for-context' },
        { text: 'leaving', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: 'After "had," use the past participle "left." "Leaved" is not a real form, "leave" is present, and "leaving" is not a complete verb.',
    },
    {
      slot: 3,
      difficulty: 'medium',
      stem: "The hikers had ______ nearly ten miles before they realized they'd taken a wrong turn.",
      choices: [
        { text: 'gone', is_correct: true },
        { text: 'went', is_correct: false, misconception_token: 'wrong-past-participle' },
        { text: 'go', is_correct: false, misconception_token: 'wrong-tense-for-context' },
        { text: 'going', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: 'After "had," the past participle is "gone," not "went." "Go" is present, and "going" is not a complete verb.',
    },
    {
      slot: 4,
      difficulty: 'easy',
      stem: 'The museum opens at nine each morning and ______ its doors at five in the evening.',
      choices: [
        { text: 'closes', is_correct: true },
        { text: 'closed', is_correct: false, misconception_token: 'verb-tense-shift' },
        { text: 'closing', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'to close', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution: 'The verb should match the present-tense "opens," so it is "closes." "Closed" shifts to the past, and the other forms are not complete verbs.',
    },
    {
      slot: 5,
      difficulty: 'hard',
      stem: 'The company ______ its profits every year since it launched its new product line.',
      choices: [
        { text: 'has increased', is_correct: true },
        { text: 'increased', is_correct: false, misconception_token: 'wrong-tense-for-context' },
        { text: 'will increase', is_correct: false, misconception_token: 'verb-tense-shift' },
        { text: 'increasing', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: '"Since it launched …" describes an action continuing into the present, so the present perfect "has increased" fits. Simple past or future does not, and "-ing" is not a complete verb.',
    },
    {
      slot: 6,
      difficulty: 'easy',
      stem: 'Yesterday the crew loaded the truck and ______ the equipment to the new site.',
      choices: [
        { text: 'drove', is_correct: true },
        { text: 'drives', is_correct: false, misconception_token: 'wrong-tense-for-context' },
        { text: 'will drive', is_correct: false, misconception_token: 'verb-tense-shift' },
        { text: 'driving', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: '"Yesterday … loaded" sets the past tense, so the paired verb is "drove." Present or future would shift the tense, and "-ing" is not a complete verb.',
    },
    {
      slot: 7,
      difficulty: 'easy',
      stem: 'The children have ______ the same song at every rehearsal this month.',
      choices: [
        { text: 'sung', is_correct: true },
        { text: 'sang', is_correct: false, misconception_token: 'wrong-past-participle' },
        { text: 'sing', is_correct: false, misconception_token: 'wrong-tense-for-context' },
        { text: 'singing', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: 'After "have," use the past participle "sung," not the simple past "sang." "Sing" is present, and "singing" is not a complete verb.',
    },
    {
      slot: 8,
      difficulty: 'easy',
      stem: 'The café roasts its beans every morning and ______ them fresh throughout the day.',
      choices: [
        { text: 'sells', is_correct: true },
        { text: 'sold', is_correct: false, misconception_token: 'verb-tense-shift' },
        { text: 'selling', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'to sell', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution: 'The verb should match the present-tense "roasts," so "sells." "Sold" shifts to the past, and the other forms are not complete verbs.',
    },
    {
      slot: 9,
      difficulty: 'easy',
      stem: 'During the storm last night, a large branch ______ onto the roof of the shed.',
      choices: [
        { text: 'fell', is_correct: true },
        { text: 'falled', is_correct: false, misconception_token: 'nonstandard-past-tense' },
        { text: 'falls', is_correct: false, misconception_token: 'wrong-tense-for-context' },
        { text: 'falling', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: 'The standard past tense of "fall" is "fell," not "falled." "Falls" is present, and "falling" is not a complete verb.',
    },
    {
      slot: 10,
      difficulty: 'easy',
      stem: 'The volunteers will sort the donations tomorrow and ______ them to the shelter by evening.',
      choices: [
        { text: 'deliver', is_correct: true },
        { text: 'delivered', is_correct: false, misconception_token: 'verb-tense-shift' },
        { text: 'delivering', is_correct: false, misconception_token: 'nonfinite-verb' },
        { text: 'to deliver', is_correct: false, misconception_token: 'used-infinitive' },
      ],
      solution: 'Paired with "will sort," the second verb stays in the future: "will … deliver." The past and non-finite forms do not fit.',
    },
    {
      slot: 11,
      difficulty: 'easy',
      stem: 'By the time we arrived, the lake had completely ______ over.',
      choices: [
        { text: 'frozen', is_correct: true },
        { text: 'froze', is_correct: false, misconception_token: 'wrong-past-participle' },
        { text: 'freezed', is_correct: false, misconception_token: 'nonstandard-past-tense' },
        { text: 'freezing', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: 'After "had," use the past participle "frozen." "Froze" is the simple past, "freezed" is not a real form, and "freezing" is not a complete verb.',
    },
    {
      slot: 12,
      difficulty: 'medium',
      stem: 'Scientists ______ this species only twice since the survey began a decade ago.',
      choices: [
        { text: 'have observed', is_correct: true },
        { text: 'observed', is_correct: false, misconception_token: 'wrong-tense-for-context' },
        { text: 'will observe', is_correct: false, misconception_token: 'verb-tense-shift' },
        { text: 'observing', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: '"Since … began" points to a span reaching the present, so the present perfect "have observed" fits. Simple past or future does not, and "-ing" is not a complete verb.',
    },
    {
      slot: 13,
      difficulty: 'medium',
      stem: 'By the time the guests arrived, the caterers had already ______ every table in the hall.',
      choices: [
        { text: 'set', is_correct: true },
        { text: 'sat', is_correct: false, misconception_token: 'wrong-past-participle' },
        { text: 'setted', is_correct: false, misconception_token: 'nonstandard-past-tense' },
        { text: 'setting', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: 'After "had already," use the past participle "set" (its form does not change). "Sat" is the wrong verb, "setted" is not a word, and "setting" is not a complete verb.',
    },
    {
      slot: 14,
      difficulty: 'medium',
      stem: 'The documentary explains how the glacier formed and how it slowly ______ over thousands of years.',
      choices: [
        { text: 'retreated', is_correct: true },
        { text: 'retreats', is_correct: false, misconception_token: 'verb-tense-shift' },
        { text: 'will retreat', is_correct: false, misconception_token: 'wrong-tense-for-context' },
        { text: 'retreating', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: 'Parallel with "formed," the second verb is the past "retreated." Shifting to present or future breaks the sequence, and "-ing" is not a complete verb.',
    },
    {
      slot: 15,
      difficulty: 'medium',
      stem: 'The engineers promised that they ______ the bridge before the rainy season arrived.',
      choices: [
        { text: 'would finish', is_correct: true },
        { text: 'will finish', is_correct: false, misconception_token: 'wrong-tense-for-context' },
        { text: 'finished', is_correct: false, misconception_token: 'verb-tense-shift' },
        { text: 'finishing', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: 'After the past "promised," the future-in-the-past "would finish" matches. "Will finish" clashes with the past frame, "finished" misstates the sequence, and "-ing" is not complete.',
    },
    {
      slot: 16,
      difficulty: 'medium',
      stem: 'The old ledgers had ______ untouched in the archive for nearly fifty years.',
      choices: [
        { text: 'lain', is_correct: true },
        { text: 'laid', is_correct: false, misconception_token: 'wrong-past-participle' },
        { text: 'lay', is_correct: false, misconception_token: 'wrong-tense-for-context' },
        { text: 'laying', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: '"Lie" (to rest) has the participle "lain," so "had lain." "Laid" is from "lay" (to place), "lay" is the simple past, and "laying" is not a complete verb.',
    },
    {
      slot: 17,
      difficulty: 'medium',
      stem: 'The two companies ______ on the project since the previous spring.',
      choices: [
        { text: 'have collaborated', is_correct: true },
        { text: 'collaborated', is_correct: false, misconception_token: 'wrong-tense-for-context' },
        { text: 'collaborate', is_correct: false, misconception_token: 'verb-tense-shift' },
        { text: 'collaborating', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: '"Since the previous spring" signals an action continuing to now, so the present perfect "have collaborated." Simple past or present does not fit, and "-ing" is not complete.',
    },
    {
      slot: 18,
      difficulty: 'hard',
      stem: 'If the museum ______ open on Mondays, far more school groups could visit during the week.',
      choices: [
        { text: 'were', is_correct: true },
        { text: 'was', is_correct: false, misconception_token: 'subjunctive-error' },
        { text: 'is', is_correct: false, misconception_token: 'wrong-tense-for-context' },
        { text: 'being', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: 'A hypothetical "if" clause uses the subjunctive "were," not "was." "Is" is the wrong tense for a hypothetical, and "being" is not a complete verb.',
    },
    {
      slot: 19,
      difficulty: 'hard',
      stem: 'By the end of the ceremony, the old bell had ______ twelve times across the valley.',
      choices: [
        { text: 'rung', is_correct: true },
        { text: 'rang', is_correct: false, misconception_token: 'wrong-past-participle' },
        { text: 'ringed', is_correct: false, misconception_token: 'nonstandard-past-tense' },
        { text: 'ringing', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: 'After "had," use the participle "rung," not the simple past "rang." "Ringed" is not the right form, and "ringing" is not a complete verb.',
    },
    {
      slot: 20,
      difficulty: 'hard',
      stem: 'The report noted that enrollment had risen sharply in the fall and ______ steady ever since.',
      choices: [
        { text: 'had remained', is_correct: true },
        { text: 'remained', is_correct: false, misconception_token: 'wrong-tense-for-context' },
        { text: 'remains', is_correct: false, misconception_token: 'verb-tense-shift' },
        { text: 'remaining', is_correct: false, misconception_token: 'nonfinite-verb' },
      ],
      solution: 'Parallel with "had risen," the verb is "had remained." Dropping to simple past or shifting to present breaks the sequence, and "-ing" is not complete.',
    },
  ],
}

// Advanced punctuation: semicolons, colons, and dashes.
const ADVANCED_PUNCTUATION: GrammarTemplate = {
  code: 'grammar-advanced-punctuation',
  skillSlug: 'advanced-punctuation',
  satAlignment: 'standard-english-conventions',
  kind: 'curated_pool',
  items: [
    {
      slot: 1,
      difficulty: 'medium',
      stem: 'The kit contains everything a beginning painter ______ a set of brushes, three colors of paint, and a small canvas.',
      choices: [
        { text: 'needs:', is_correct: true },
        { text: 'needs,', is_correct: false, misconception_token: 'comma-where-colon-needed' },
        { text: 'needs;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'needs', is_correct: false, misconception_token: 'missing-colon' },
      ],
      solution: 'A colon introduces a list after a complete clause ("everything a beginning painter needs"). A comma or semicolon can\'t introduce the list, and it can\'t run in with no mark.',
    },
    {
      slot: 2,
      difficulty: 'medium',
      stem: "The lead ______ a marine biologist with two decades of experience, presented the team's findings to the board.",
      choices: [
        { text: 'researcher,', is_correct: true },
        { text: 'researcher—', is_correct: false, misconception_token: 'unpaired-dash' },
        { text: 'researcher;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'researcher:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'The aside closes with a comma, so it must open with a comma to match. A lone dash would need a second dash, and a semicolon/colon does not belong here.',
    },
    {
      slot: 3,
      difficulty: 'medium',
      stem: 'The conference featured speakers from Paris, ______ London, England; and Tokyo, Japan.',
      choices: [
        { text: 'France;', is_correct: true },
        { text: 'France,', is_correct: false, misconception_token: 'comma-in-complex-list' },
        { text: 'France.', is_correct: false, misconception_token: 'period-creates-fragment' },
        { text: 'France:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'When list items already contain commas ("Paris, France"), semicolons separate the items so the list stays clear. A comma would blur them, a period breaks the sentence, and a colon does not fit mid-list.',
    },
    {
      slot: 4,
      difficulty: 'hard',
      stem: 'There is only one task left to ______ decide who will present the findings.',
      choices: [
        { text: 'do:', is_correct: true },
        { text: 'do,', is_correct: false, misconception_token: 'comma-where-colon-needed' },
        { text: 'do;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'do', is_correct: false, misconception_token: 'missing-colon' },
      ],
      solution: 'A colon can follow a complete clause ("only one task left to do") to introduce what it is. A comma or semicolon does not do that job here, and no mark runs the ideas together.',
    },
    {
      slot: 5,
      difficulty: 'easy',
      stem: 'The assembly instructions were ______ measure twice, cut once, and sand the edges before gluing.',
      choices: [
        { text: 'simple:', is_correct: true },
        { text: 'simple,', is_correct: false, misconception_token: 'comma-where-colon-needed' },
        { text: 'simple;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'simple', is_correct: false, misconception_token: 'missing-colon' },
      ],
      solution: 'A colon after the complete clause "The assembly instructions were simple" introduces the steps that follow. A comma or semicolon can\'t introduce them, and no mark runs them together.',
    },
    {
      slot: 6,
      difficulty: 'easy',
      stem: 'The camping checklist included three ______ a tent, a sleeping bag, and a headlamp.',
      choices: [
        { text: 'essentials:', is_correct: true },
        { text: 'essentials,', is_correct: false, misconception_token: 'comma-where-colon-needed' },
        { text: 'essentials;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'essentials', is_correct: false, misconception_token: 'missing-colon' },
      ],
      solution: 'A complete clause ("The camping checklist included three essentials") can take a colon to introduce the list. A comma or semicolon can\'t, and it can\'t run in with no mark.',
    },
    {
      slot: 7,
      difficulty: 'easy',
      stem: 'The reason for the delay was ______ the shipment had been routed to the wrong warehouse.',
      choices: [
        { text: 'simple:', is_correct: true },
        { text: 'simple,', is_correct: false, misconception_token: 'comma-where-colon-needed' },
        { text: 'simple;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'simple', is_correct: false, misconception_token: 'missing-colon' },
      ],
      solution: 'The colon follows the complete clause to introduce the explanation. A comma or semicolon does not do that job, and no mark runs the ideas together.',
    },
    {
      slot: 8,
      difficulty: 'easy',
      stem: 'The final exhibit ______ by far the most popular—featured artifacts recovered from a shipwreck.',
      choices: [
        { text: 'hall—', is_correct: true },
        { text: 'hall', is_correct: false, misconception_token: 'unpaired-dash' },
        { text: 'hall;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'hall:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'An aside set off by a dash needs a matching dash on both sides, so open with a dash to pair with the one before "featured."',
    },
    {
      slot: 9,
      difficulty: 'easy',
      stem: 'The recipe requires only two uncommon ______ saffron and smoked paprika.',
      choices: [
        { text: 'spices:', is_correct: true },
        { text: 'spices,', is_correct: false, misconception_token: 'comma-where-colon-needed' },
        { text: 'spices;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'spices', is_correct: false, misconception_token: 'missing-colon' },
      ],
      solution: 'A complete clause introduces the list with a colon. A comma or semicolon can\'t, and no mark leaves it run-on.',
    },
    {
      slot: 10,
      difficulty: 'easy',
      stem: 'The lecture ran far over ______ several students had to leave before the question period.',
      choices: [
        { text: 'time;', is_correct: true },
        { text: 'time,', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'time', is_correct: false, misconception_token: 'run-on' },
        { text: 'time:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'Two complete sentences can be joined by a semicolon. A comma is a splice, no mark is a run-on, and a colon would wrongly signal an explanation.',
    },
    {
      slot: 11,
      difficulty: 'easy',
      stem: 'The budget was approved without ______ however, the timeline still needed revision.',
      choices: [
        { text: 'changes;', is_correct: true },
        { text: 'changes,', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'changes', is_correct: false, misconception_token: 'run-on' },
        { text: 'changes:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: '"However" joining two complete sentences takes a semicolon before it. A comma is a splice, no mark is a run-on, and a colon does not join clauses this way.',
    },
    {
      slot: 12,
      difficulty: 'easy',
      stem: 'The kit includes basic tools such ______ a screwdriver, pliers, and a small wrench.',
      choices: [
        { text: 'as', is_correct: true },
        { text: 'as:', is_correct: false, misconception_token: 'colon-after-incomplete-clause' },
        { text: 'as;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'as,', is_correct: false, misconception_token: 'unnecessary-comma' },
      ],
      solution: '"Such as" already introduces the examples, and it is not a complete clause, so no colon (or other mark) follows it. A colon needs a complete sentence before it.',
    },
    {
      slot: 13,
      difficulty: 'medium',
      stem: 'The finalists came from Austin, ______ Denver, Colorado; and Portland, Oregon.',
      choices: [
        { text: 'Texas;', is_correct: true },
        { text: 'Texas,', is_correct: false, misconception_token: 'comma-in-complex-list' },
        { text: 'Texas.', is_correct: false, misconception_token: 'period-creates-fragment' },
        { text: 'Texas:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'When list items contain internal commas ("Austin, Texas"), semicolons separate the items. A comma blurs them, a period breaks the sentence, and a colon does not belong mid-list.',
    },
    {
      slot: 14,
      difficulty: 'medium',
      stem: 'The three lead ______ a biologist, a chemist, and a physicist—shared the prize equally.',
      choices: [
        { text: 'researchers—', is_correct: true },
        { text: 'researchers,', is_correct: false, misconception_token: 'comma-in-complex-list' },
        { text: 'researchers:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
        { text: 'researchers;', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution: 'Because the aside already contains commas, a pair of dashes sets it off clearly, so open with a dash to match the one before "shared." A comma would blur the boundaries.',
    },
    {
      slot: 15,
      difficulty: 'medium',
      stem: 'The instructions left no room for ______ measure precisely, cut once, and check twice.',
      choices: [
        { text: 'error:', is_correct: true },
        { text: 'error;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'error,', is_correct: false, misconception_token: 'comma-where-colon-needed' },
        { text: 'error', is_correct: false, misconception_token: 'missing-colon' },
      ],
      solution: 'The complete clause introduces the steps with a colon. A semicolon joins independent clauses (not a list), a comma can\'t introduce it, and no mark runs it together.',
    },
    {
      slot: 16,
      difficulty: 'medium',
      stem: 'For the experiment, each group will ______ a beaker, a thermometer, and a stopwatch.',
      choices: [
        { text: 'need', is_correct: true },
        { text: 'need:', is_correct: false, misconception_token: 'colon-after-incomplete-clause' },
        { text: 'need;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'need,', is_correct: false, misconception_token: 'unnecessary-comma' },
      ],
      solution: 'A colon can\'t follow a verb like "need" — the words before a colon must form a complete sentence. Here the list is the verb\'s object, so no mark is needed.',
    },
    {
      slot: 17,
      difficulty: 'medium',
      stem: 'Every member of the crew—from the captain to the youngest ______ received a commendation for the rescue.',
      choices: [
        { text: 'deckhand—', is_correct: true },
        { text: 'deckhand,', is_correct: false, misconception_token: 'unpaired-dash' },
        { text: 'deckhand;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'deckhand:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'The aside opened with a dash after "crew," so it must close with a matching dash. A comma would leave the first dash unpaired.',
    },
    {
      slot: 18,
      difficulty: 'hard',
      stem: 'The delegates represented three major ______ Lagos, Nigeria; São Paulo, Brazil; and Jakarta, Indonesia.',
      choices: [
        { text: 'cities:', is_correct: true },
        { text: 'cities;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'cities,', is_correct: false, misconception_token: 'comma-where-colon-needed' },
        { text: 'cities', is_correct: false, misconception_token: 'missing-colon' },
      ],
      solution: 'A complete clause introduces the list with a colon, even though the items themselves are separated by semicolons. A semicolon or comma can\'t introduce it.',
    },
    {
      slot: 19,
      difficulty: 'hard',
      stem: 'The award recognized her many ______ teaching, mentoring, and community outreach—over a thirty-year career.',
      choices: [
        { text: 'contributions—', is_correct: true },
        { text: 'contributions,', is_correct: false, misconception_token: 'comma-in-complex-list' },
        { text: 'contributions:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
        { text: 'contributions;', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution: 'The aside lists items with internal commas, so a pair of dashes sets it off clearly; open with a dash to match the one before "over."',
    },
    {
      slot: 20,
      difficulty: 'hard',
      stem: "The recipe's success comes down to one ______ the quality of the olive oil.",
      choices: [
        { text: 'thing:', is_correct: true },
        { text: 'thing,', is_correct: false, misconception_token: 'comma-where-colon-needed' },
        { text: 'thing;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'thing', is_correct: false, misconception_token: 'missing-colon' },
      ],
      solution: 'A colon follows the complete clause to point to the single thing. A comma can\'t introduce it, a semicolon needs two complete clauses, and no mark leaves it run-on.',
    },
  ],
}

// Possessives & apostrophes: its/it's, singular vs. plural possessives, plural
// (no apostrophe), and whose/who's.
const POSSESSIVES_AND_APOSTROPHES: GrammarTemplate = {
  code: 'grammar-possessives-and-apostrophes',
  skillSlug: 'possessives-and-apostrophes',
  satAlignment: 'standard-english-conventions',
  kind: 'curated_pool',
  items: [
    {
      slot: 1,
      difficulty: 'easy',
      stem: "The committee published ______ final report, along with a summary of the year's work.",
      choices: [
        { text: 'its', is_correct: true },
        { text: "it's", is_correct: false, misconception_token: 'contraction-for-possessive' },
        { text: "its'", is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: 'their', is_correct: false, misconception_token: 'pronoun-number-mismatch' },
      ],
      solution: 'Possessive "its" has no apostrophe. "It\'s" means "it is," "its\'" is not a word, and "their" is plural (the singular "committee" needs "its").',
    },
    {
      slot: 2,
      difficulty: 'easy',
      stem: 'The ______ locker rooms were completely renovated over the summer break.',
      choices: [
        { text: "players'", is_correct: true },
        { text: 'players', is_correct: false, misconception_token: 'possessive-missing-apostrophe' },
        { text: "player's", is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: "player's's", is_correct: false, misconception_token: 'extra-apostrophe' },
      ],
      solution: 'The locker rooms belong to more than one player, so the plural possessive "players\'" (apostrophe after the s) is correct.',
    },
    {
      slot: 3,
      difficulty: 'medium',
      stem: 'The scientist ______ research reshaped the field never sought public recognition.',
      choices: [
        { text: 'whose', is_correct: true },
        { text: "who's", is_correct: false, misconception_token: 'whos-whose-confusion' },
        { text: 'which', is_correct: false, misconception_token: 'which-for-person' },
        { text: "whos'", is_correct: false, misconception_token: 'wrong-possessive-form' },
      ],
      solution: 'Possessive "whose" shows the research belongs to the scientist. "Who\'s" means "who is," "which" doesn\'t refer to a person, and "whos\'" is not a word.',
    },
    {
      slot: 4,
      difficulty: 'medium',
      stem: "The ______ decision to extend the deadline relieved the entire class.",
      choices: [
        { text: "professor's", is_correct: true },
        { text: 'professors', is_correct: false, misconception_token: 'possessive-missing-apostrophe' },
        { text: "professors'", is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: "professor's's", is_correct: false, misconception_token: 'extra-apostrophe' },
      ],
      solution: 'The decision belongs to one professor, so the singular possessive "professor\'s" is correct.',
    },
    {
      slot: 5,
      difficulty: 'hard',
      stem: 'The ______ have hosted the neighborhood barbecue every Fourth of July for a decade.',
      choices: [
        { text: 'Hendersons', is_correct: true },
        { text: "Henderson's", is_correct: false, misconception_token: 'apostrophe-in-plural' },
        { text: "Hendersons'", is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: 'Henderson', is_correct: false, misconception_token: 'wrong-number-noun' },
      ],
      solution: 'To make a family name plural, just add -s with no apostrophe: "the Hendersons." Apostrophes here would wrongly signal possession.',
    },
    {
      slot: 6,
      difficulty: 'easy',
      stem: 'The robot returned to ______ charging station as soon as the battery ran low.',
      choices: [
        { text: 'its', is_correct: true },
        { text: "it's", is_correct: false, misconception_token: 'contraction-for-possessive' },
        { text: "its'", is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: 'their', is_correct: false, misconception_token: 'pronoun-number-mismatch' },
      ],
      solution: 'Possessive "its" has no apostrophe. "It\'s" means "it is," "its\'" is not a word, and "their" is plural.',
    },
    {
      slot: 7,
      difficulty: 'easy',
      stem: 'The ______ speech inspired the entire graduating class to volunteer over the summer.',
      choices: [
        { text: "principal's", is_correct: true },
        { text: 'principals', is_correct: false, misconception_token: 'possessive-missing-apostrophe' },
        { text: "principals'", is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: "principal's's", is_correct: false, misconception_token: 'extra-apostrophe' },
      ],
      solution: 'One principal gives the speech, so the singular possessive "principal\'s" is correct.',
    },
    {
      slot: 8,
      difficulty: 'easy',
      stem: 'The ______ uniforms were redesigned with brighter colors this season.',
      choices: [
        { text: "athletes'", is_correct: true },
        { text: 'athletes', is_correct: false, misconception_token: 'possessive-missing-apostrophe' },
        { text: "athlete's", is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: "athletes's", is_correct: false, misconception_token: 'extra-apostrophe' },
      ],
      solution: 'The uniforms belong to many athletes, so the plural possessive "athletes\'" (apostrophe after the s) is correct.',
    },
    {
      slot: 9,
      difficulty: 'easy',
      stem: 'Please make sure ______ project is uploaded before the midnight deadline.',
      choices: [
        { text: 'your', is_correct: true },
        { text: "you're", is_correct: false, misconception_token: 'contraction-for-possessive' },
        { text: 'yours', is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: 'youre', is_correct: false, misconception_token: 'wrong-word-homophone' },
      ],
      solution: 'Possessive "your" fits before "project." "You\'re" means "you are," "yours" stands alone without a noun, and "youre" is not a word.',
    },
    {
      slot: 10,
      difficulty: 'easy',
      stem: 'The ______ in the parking lot were all decorated for the homecoming parade.',
      choices: [
        { text: 'trucks', is_correct: true },
        { text: "truck's", is_correct: false, misconception_token: 'apostrophe-in-plural' },
        { text: "trucks'", is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: "trucks's", is_correct: false, misconception_token: 'extra-apostrophe' },
      ],
      solution: 'Here "trucks" is just a plural (more than one), so it takes no apostrophe.',
    },
    {
      slot: 11,
      difficulty: 'easy',
      stem: 'The volunteer ______ car we borrowed refused to accept any money for gas.',
      choices: [
        { text: 'whose', is_correct: true },
        { text: "who's", is_correct: false, misconception_token: 'whos-whose-confusion' },
        { text: "whos'", is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: 'which', is_correct: false, misconception_token: 'which-for-person' },
      ],
      solution: 'Possessive "whose" shows the car belongs to the volunteer. "Who\'s" means "who is," "whos\'" is not a word, and "which" is for things, not people.',
    },
    {
      slot: 12,
      difficulty: 'medium',
      stem: 'The ______ office overlooked the harbor and was always full of visitors.',
      choices: [
        { text: "boss's", is_correct: true },
        { text: "boss'", is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: 'bosses', is_correct: false, misconception_token: 'possessive-missing-apostrophe' },
        { text: "boss's's", is_correct: false, misconception_token: 'extra-apostrophe' },
      ],
      solution: 'A singular noun, even one ending in s, takes \'s: "boss\'s office."',
    },
    {
      slot: 13,
      difficulty: 'medium',
      stem: 'The ______ section of the library was moved to the sunny room on the first floor.',
      choices: [
        { text: "children's", is_correct: true },
        { text: 'childrens', is_correct: false, misconception_token: 'possessive-missing-apostrophe' },
        { text: "childrens'", is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: 'children', is_correct: false, misconception_token: 'wrong-number-noun' },
      ],
      solution: '"Children" is already plural, so the possessive adds \'s: "children\'s." "Childrens" and "childrens\'" treat it as if it were a regular plural.',
    },
    {
      slot: 14,
      difficulty: 'medium',
      stem: 'The committee postponed the vote because ______ still gathering feedback from residents.',
      choices: [
        { text: "it's", is_correct: true },
        { text: 'its', is_correct: false, misconception_token: 'possessive-for-contraction' },
        { text: "its'", is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: 'their', is_correct: false, misconception_token: 'pronoun-number-mismatch' },
      ],
      solution: 'Here "it\'s" means "it is" ("it is still gathering feedback"), so the apostrophe is correct. "Its" is possessive, "its\'" is not a word, and "their" is plural.',
    },
    {
      slot: 15,
      difficulty: 'medium',
      stem: 'We spent the holidays at the ______ cabin near the lake.',
      choices: [
        { text: "Garcias'", is_correct: true },
        { text: "Garcia's", is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: 'Garcias', is_correct: false, misconception_token: 'possessive-missing-apostrophe' },
        { text: "Garcias's", is_correct: false, misconception_token: 'extra-apostrophe' },
      ],
      solution: 'The cabin belongs to the whole Garcia family (plural "Garcias"), so the possessive is "Garcias\'."',
    },
    {
      slot: 16,
      difficulty: 'medium',
      stem: 'The blue tent is ours, and the green one is ______',
      choices: [
        { text: 'theirs.', is_correct: true },
        { text: "their's.", is_correct: false, misconception_token: 'extra-apostrophe' },
        { text: "there's.", is_correct: false, misconception_token: 'contraction-for-possessive' },
        { text: "theirs'.", is_correct: false, misconception_token: 'wrong-possessive-form' },
      ],
      solution: 'The possessive pronoun "theirs" never takes an apostrophe. "Their\'s" and "theirs\'" add wrong apostrophes, and "there\'s" means "there is."',
    },
    {
      slot: 17,
      difficulty: 'medium',
      stem: 'The ______ decision to close early surprised the regular customers.',
      choices: [
        { text: "store manager's", is_correct: true },
        { text: 'store manager', is_correct: false, misconception_token: 'possessive-missing-apostrophe' },
        { text: "store's manager", is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: "store managers'", is_correct: false, misconception_token: 'wrong-number-noun' },
      ],
      solution: 'For a compound like "store manager," the apostrophe goes on the last word: "store manager\'s decision."',
    },
    {
      slot: 18,
      difficulty: 'hard',
      stem: 'We finally tried ______ new bakery, the shop that the two friends opened together.',
      choices: [
        { text: "Mia and Carlos's", is_correct: true },
        { text: "Mia's and Carlos's", is_correct: false, misconception_token: 'wrong-joint-possession' },
        { text: "Mia and Carlos'", is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: 'Mia and Carlos', is_correct: false, misconception_token: 'possessive-missing-apostrophe' },
      ],
      solution: 'Because Mia and Carlos own the one bakery together, only the last name takes the apostrophe: "Mia and Carlos\'s." Marking both would show separate ownership.',
    },
    {
      slot: 19,
      difficulty: 'hard',
      stem: 'The exhibit displayed ______ paintings side by side, though the two artists never met.',
      choices: [
        { text: "Monet's and Turner's", is_correct: true },
        { text: "Monet and Turner's", is_correct: false, misconception_token: 'wrong-joint-possession' },
        { text: 'Monets and Turners', is_correct: false, misconception_token: 'possessive-missing-apostrophe' },
        { text: "Monet's and Turners", is_correct: false, misconception_token: 'wrong-possessive-form' },
      ],
      solution: 'The two artists own their paintings separately, so each name takes \'s: "Monet\'s and Turner\'s."',
    },
    {
      slot: 20,
      difficulty: 'hard',
      stem: 'The ______ locker room was renovated to include a larger training area this year.',
      choices: [
        { text: "women's", is_correct: true },
        { text: 'womens', is_correct: false, misconception_token: 'possessive-missing-apostrophe' },
        { text: "womens'", is_correct: false, misconception_token: 'wrong-possessive-form' },
        { text: 'women', is_correct: false, misconception_token: 'wrong-number-noun' },
      ],
      solution: '"Women" is already plural, so the possessive adds \'s: "women\'s." "Womens" and "womens\'" wrongly treat it as a regular plural.',
    },
  ],
}

// Modifier placement: dangling and misplaced introductory modifiers. The correct
// choice starts the main clause with the noun the opening phrase describes.
const MODIFIER_PLACEMENT: GrammarTemplate = {
  code: 'grammar-modifier-placement',
  skillSlug: 'modifier-placement',
  satAlignment: 'standard-english-conventions',
  kind: 'curated_pool',
  items: [
    {
      slot: 1,
      difficulty: 'medium',
      stem: 'Racing to catch the last train, ______',
      choices: [
        { text: 'Daniel grabbed his coat and dashed out the door.', is_correct: true },
        { text: 'the platform was already crowded with commuters.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'it was impossible to find an empty seat.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'grabbing his coat took only a second.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The opening phrase describes who is racing, so the main clause must start with that person: "Daniel." The others make the platform, "it," or "grabbing" do the racing.',
    },
    {
      slot: 2,
      difficulty: 'medium',
      stem: 'After simmering for several hours, ______',
      choices: [
        { text: 'the stew developed a rich, complex flavor.', is_correct: true },
        { text: 'the chef ladled the stew into bowls.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'it was finally time to add the salt.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'adding more broth improved the texture.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The stew is what simmered, so the main clause must start with "the stew." The others make the chef, "it," or "adding" do the simmering.',
    },
    {
      slot: 3,
      difficulty: 'hard',
      stem: 'Buried for centuries beneath the ash, ______',
      choices: [
        { text: 'the ancient city remained remarkably intact.', is_correct: true },
        { text: 'archaeologists uncovered the ancient city.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'it took years to excavate the site fully.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'excavating the site required enormous care.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The city was buried, so the main clause must start with "the ancient city." The others make the archaeologists, "it," or "excavating" the buried thing.',
    },
    {
      slot: 4,
      difficulty: 'easy',
      stem: 'While reviewing the manuscript, ______',
      choices: [
        { text: 'the editor noticed several small inconsistencies.', is_correct: true },
        { text: 'several small inconsistencies were noticed.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'there were several inconsistencies to fix.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'noticing the inconsistencies took a while.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The editor is the one reviewing, so the main clause must start with "the editor." The others make the inconsistencies, "there," or "noticing" do the reviewing.',
    },
    {
      slot: 5,
      difficulty: 'easy',
      stem: 'Painted in vivid blues and greens, ______',
      choices: [
        { text: 'the mural transformed the dull hallway.', is_correct: true },
        { text: 'students admired the mural every morning.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'it brightened the entire school entrance.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'admiring the mural became a daily ritual.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The mural is what was painted, so the main clause must start with "the mural." The others make the students, "it," or "admiring" the painted thing.',
    },
    {
      slot: 6,
      difficulty: 'easy',
      stem: 'Startled by the sudden clap of thunder, ______',
      choices: [
        { text: 'the young horses bolted across the open field.', is_correct: true },
        { text: 'the barn doors rattled loudly on their hinges.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'it was impossible to calm them for an hour.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'calming the animals took the whole evening.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The horses are what were startled, so the main clause must start with "the young horses." The others make the barn doors, "it," or "calming" do the being-startled.',
    },
    {
      slot: 7,
      difficulty: 'easy',
      stem: 'Written in a single afternoon, ______',
      choices: [
        { text: 'the letter still captured exactly what she wanted to say.', is_correct: true },
        { text: 'the writer surprised even herself.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'there was little time to revise it.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'revising it later felt unnecessary.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The letter is what was written, so the main clause must start with "the letter." The others make the writer, "there," or "revising" the written thing.',
    },
    {
      slot: 8,
      difficulty: 'easy',
      stem: 'Hidden behind a false wall for decades, ______',
      choices: [
        { text: 'the small safe held documents no one expected.', is_correct: true },
        { text: 'the new owners discovered a small safe.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'it took hours to force the safe open.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'opening the safe required a locksmith.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The safe is what was hidden, so the main clause must start with "the small safe." The others make the owners, "it," or "opening" the hidden thing.',
    },
    {
      slot: 9,
      difficulty: 'easy',
      stem: 'Eager to impress the visiting judges, ______',
      choices: [
        { text: 'the young chef plated every dish with care.', is_correct: true },
        { text: 'the dishes arrived at the table steaming.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'it was clear the pressure was intense.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'plating each dish took great patience.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The chef is the one eager to impress, so the main clause must start with "the young chef." The others make the dishes, "it," or "plating" eager.',
    },
    {
      slot: 10,
      difficulty: 'easy',
      stem: 'Covered in a thick layer of fresh snow, ______',
      choices: [
        { text: 'the mountain looked completely untouched at dawn.', is_correct: true },
        { text: 'the skiers admired the slopes below.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'there was no trail visible anywhere.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'climbing it would be dangerous that day.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The mountain is what was covered in snow, so the main clause must start with "the mountain." The others make the skiers, "there," or "climbing" the snow-covered thing.',
    },
    {
      slot: 11,
      difficulty: 'easy',
      stem: 'Translated into more than a dozen languages, ______',
      choices: [
        { text: 'the novel reached readers on every continent.', is_correct: true },
        { text: 'the author gained fans around the world.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'it was a remarkable achievement.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'translating it took a team of experts.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The novel is what was translated, so the main clause must start with "the novel." The others make the author, "it," or "translating" the translated thing.',
    },
    {
      slot: 12,
      difficulty: 'medium',
      stem: 'Having trained together for months, ______',
      choices: [
        { text: 'the swimmers felt ready for the national meet.', is_correct: true },
        { text: 'the coach finally announced the lineup.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'it was time to test their limits.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'training every morning had paid off.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The swimmers are the ones who trained, so the main clause must start with "the swimmers." The others make the coach, "it," or "training" do the training.',
    },
    {
      slot: 13,
      difficulty: 'medium',
      stem: 'Left unattended on the hot stove, ______',
      choices: [
        { text: 'the pot of soup slowly boiled over.', is_correct: true },
        { text: 'the cook rushed back to the kitchen.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'there was a mess to clean up.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'watching the soup was clearly necessary.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The soup is what was left unattended, so the main clause must start with "the pot of soup." The others make the cook, "there," or "watching" the unattended thing.',
    },
    {
      slot: 14,
      difficulty: 'medium',
      stem: 'To qualify for the national finals, ______',
      choices: [
        { text: 'each contestant had to win two regional rounds.', is_correct: true },
        { text: 'the rules required two regional wins.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'it was necessary to place first twice.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'qualifying demanded months of practice.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The contestant is the one who must qualify, so the main clause must start with "each contestant." The others make the rules, "it," or "qualifying" do the qualifying.',
    },
    {
      slot: 15,
      difficulty: 'medium',
      stem: 'Rushing to finish before the final bell, ______',
      choices: [
        { text: 'the students barely proofread their essays.', is_correct: true },
        { text: 'the essays were full of small errors.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'there was no time left to check anything.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'proofreading felt like a luxury they lacked.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The students are the ones rushing, so the main clause must start with "the students." The others make the essays, "there," or "proofreading" do the rushing.',
    },
    {
      slot: 16,
      difficulty: 'medium',
      stem: 'Delighted by the surprise retirement party, ______',
      choices: [
        { text: 'the veteran teacher could hardly find words.', is_correct: true },
        { text: 'the whole room erupted in applause.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'it was a moment no one would forget.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'planning the party had taken weeks.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The teacher is the one delighted, so the main clause must start with "the veteran teacher." The others make the room, "it," or "planning" delighted.',
    },
    {
      slot: 17,
      difficulty: 'medium',
      stem: 'Assembled entirely from mismatched spare parts, ______',
      choices: [
        { text: 'the little robot still worked on the first try.', is_correct: true },
        { text: 'the students cheered at the result.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'it was surprising that anything worked.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'assembling it had taken all weekend.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The robot is what was assembled, so the main clause must start with "the little robot." The others make the students, "it," or "assembling" the assembled thing.',
    },
    {
      slot: 18,
      difficulty: 'hard',
      stem: 'Having been warned about the approaching storm, ______',
      choices: [
        { text: 'the campers packed up their tents before dark.', is_correct: true },
        { text: 'the forecast proved accurate that night.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'it was wise to leave the ridge early.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: "warning the group had been the ranger's idea.", is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The campers are the ones warned, so the main clause must start with "the campers." The others make the forecast, "it," or "warning" the ones warned.',
    },
    {
      slot: 19,
      difficulty: 'hard',
      stem: 'Once considered impossible to climb, ______',
      choices: [
        { text: 'the sheer granite cliff now draws experts worldwide.', is_correct: true },
        { text: 'climbers travel great distances to attempt it.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'it remains a serious test of skill.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'reaching the summit still takes days.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The cliff is what was considered impossible to climb, so the main clause must start with "the sheer granite cliff." The others make the climbers, "it," or "reaching" the thing once thought impossible.',
    },
    {
      slot: 20,
      difficulty: 'hard',
      stem: 'Determined to prove the established theory wrong, ______',
      choices: [
        { text: 'the graduate student spent years gathering data.', is_correct: true },
        { text: 'the experiments produced surprising results.', is_correct: false, misconception_token: 'dangling-modifier' },
        { text: 'it would take enormous persistence.', is_correct: false, misconception_token: 'illogical-modifier-subject' },
        { text: 'disproving it became a lifelong project.', is_correct: false, misconception_token: 'wrong-subject-for-modifier' },
      ],
      solution: 'The student is the one determined, so the main clause must start with "the graduate student." The others make the experiments, "it," or "disproving" determined.',
    },
  ],
}

// Sentence boundaries: punctuating the boundary between two independent clauses
// (period/semicolon vs. comma splice / run-on), including with transition words.
const SENTENCE_BOUNDARIES: GrammarTemplate = {
  code: 'grammar-sentence-boundaries',
  skillSlug: 'sentence-boundaries',
  satAlignment: 'standard-english-conventions',
  kind: 'curated_pool',
  items: [
    {
      slot: 1,
      difficulty: 'easy',
      stem: 'The library renovated its reading ______ it added dozens of new study desks along the windows.',
      choices: [
        { text: 'room. It', is_correct: true },
        { text: 'room, it', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'room it', is_correct: false, misconception_token: 'run-on' },
        { text: 'room; and it', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution: 'These are two complete sentences, so a period ends the first. A comma alone is a splice, no mark is a run-on, and a semicolon does not go before "and."',
    },
    {
      slot: 2,
      difficulty: 'medium',
      stem: 'The first set of data was ______ therefore, the team scheduled a follow-up study for the spring.',
      choices: [
        { text: 'inconclusive;', is_correct: true },
        { text: 'inconclusive,', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'inconclusive', is_correct: false, misconception_token: 'run-on' },
        { text: 'inconclusive:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'When "therefore" joins two complete sentences, a semicolon comes before it. A comma is a splice, no mark is a run-on, and a colon does not join two complete clauses this way.',
    },
    {
      slot: 3,
      difficulty: 'medium',
      stem: 'Some visitors preferred the guided ______ others chose to explore the exhibits on their own.',
      choices: [
        { text: 'tour; others', is_correct: true },
        { text: 'tour, others', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'tour others', is_correct: false, misconception_token: 'run-on' },
        { text: 'tour and others', is_correct: false, misconception_token: 'missing-comma' },
      ],
      solution: 'Two complete sentences can be joined by a semicolon. A comma alone splices them, no mark runs them together, and joining with "and" would need a comma before it.',
    },
    {
      slot: 4,
      difficulty: 'easy',
      stem: 'The bridge was closed for emergency ______ drivers were forced to take a lengthy detour.',
      choices: [
        { text: 'repairs. Drivers', is_correct: true },
        { text: 'repairs, drivers', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'repairs drivers', is_correct: false, misconception_token: 'run-on' },
        { text: 'repairs; and drivers', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution: 'Two complete sentences are separated by a period. A comma alone is a splice, no mark is a run-on, and a semicolon does not go before "and."',
    },
    {
      slot: 5,
      difficulty: 'hard',
      stem: 'The new scheduling policy reduced patient wait ______ moreover, it lowered costs for the entire clinic.',
      choices: [
        { text: 'times;', is_correct: true },
        { text: 'times,', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'times', is_correct: false, misconception_token: 'run-on' },
        { text: 'times:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'When "moreover" joins two complete sentences, a semicolon comes before it. A comma is a splice, no mark is a run-on, and a colon does not join two complete clauses this way.',
    },
    {
      slot: 6,
      difficulty: 'easy',
      stem: 'The bakery sells out of croissants by ______ the regulars arrive before dawn to claim their favorites.',
      choices: [
        { text: 'noon. The', is_correct: true },
        { text: 'noon, the', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'noon the', is_correct: false, misconception_token: 'run-on' },
        { text: 'noon; and the', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution: 'Two complete sentences take a period. A comma alone is a splice, no mark is a run-on, and a semicolon does not go before "and."',
    },
    {
      slot: 7,
      difficulty: 'easy',
      stem: 'The first draft of the essay was ______ the revision sharpened nearly every paragraph.',
      choices: [
        { text: 'rough; the', is_correct: true },
        { text: 'rough, the', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'rough the', is_correct: false, misconception_token: 'run-on' },
        { text: 'rough: the', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'Two complete, closely related sentences can be joined by a semicolon. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.',
    },
    {
      slot: 8,
      difficulty: 'easy',
      stem: 'The museum lowered its ticket ______ attendance rose almost immediately.',
      choices: [
        { text: 'prices, and', is_correct: true },
        { text: 'prices and', is_correct: false, misconception_token: 'missing-comma' },
        { text: 'prices, attendance', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'prices; and', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution: 'Two independent clauses joined by "and" take a comma before the conjunction: "prices, and attendance rose." Without it the sentence runs on, a comma without the conjunction splices them, and a semicolon does not precede "and."',
    },
    {
      slot: 9,
      difficulty: 'easy',
      stem: 'The experiment produced clear ______ the team published its findings within a month.',
      choices: [
        { text: 'results. The', is_correct: true },
        { text: 'results, the', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'results the', is_correct: false, misconception_token: 'run-on' },
        { text: 'results; and the', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution: 'Two complete sentences are separated by a period. A comma alone is a splice, no mark is a run-on, and a semicolon does not go before "and."',
    },
    {
      slot: 10,
      difficulty: 'easy',
      stem: 'Some visitors prefer the morning ______ others would rather come after sunset.',
      choices: [
        { text: 'tours; others', is_correct: true },
        { text: 'tours, others', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'tours others', is_correct: false, misconception_token: 'run-on' },
        { text: 'tours and others', is_correct: false, misconception_token: 'missing-comma' },
      ],
      solution: 'Two complete sentences can be joined by a semicolon. A comma alone splices them, no mark runs them together, and joining with "and" would need a comma before it.',
    },
    {
      slot: 11,
      difficulty: 'easy',
      stem: 'The main road was completely ______ traffic backed up for nearly a mile.',
      choices: [
        { text: 'blocked. Traffic', is_correct: true },
        { text: 'blocked, traffic', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'blocked traffic', is_correct: false, misconception_token: 'run-on' },
        { text: 'blocked; and traffic', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution: 'Two complete sentences take a period. A comma alone is a splice, no mark is a run-on, and a semicolon does not go before "and."',
    },
    {
      slot: 12,
      difficulty: 'medium',
      stem: 'The plan looked promising on ______ however, it proved expensive to carry out.',
      choices: [
        { text: 'paper;', is_correct: true },
        { text: 'paper,', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'paper', is_correct: false, misconception_token: 'run-on' },
        { text: 'paper:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'When "however" joins two complete sentences, a semicolon comes before it. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.',
    },
    {
      slot: 13,
      difficulty: 'medium',
      stem: 'The water samples were ______ therefore, the lab repeated the entire test the next day.',
      choices: [
        { text: 'contaminated;', is_correct: true },
        { text: 'contaminated,', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'contaminated', is_correct: false, misconception_token: 'run-on' },
        { text: 'contaminated:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'When "therefore" joins two complete sentences, a semicolon precedes it. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.',
    },
    {
      slot: 14,
      difficulty: 'medium',
      stem: 'The committee reviewed every ______ yet it still could not reach a decision that night.',
      choices: [
        { text: 'proposal,', is_correct: true },
        { text: 'proposal', is_correct: false, misconception_token: 'missing-comma' },
        { text: 'proposal;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'proposal:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'Two complete sentences joined by "yet" take a comma before the conjunction. No comma runs them together, and a semicolon or colon does not precede a coordinating conjunction like "yet."',
    },
    {
      slot: 15,
      difficulty: 'medium',
      stem: 'The lecture ran long and grew increasingly ______ several attendees quietly slipped out the back.',
      choices: [
        { text: 'technical. Several', is_correct: true },
        { text: 'technical, several', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'technical several', is_correct: false, misconception_token: 'run-on' },
        { text: 'technical; and several', is_correct: false, misconception_token: 'semicolon-misused' },
      ],
      solution: 'Two complete sentences take a period. A comma alone is a splice, no mark is a run-on, and a semicolon does not go before "and."',
    },
    {
      slot: 16,
      difficulty: 'medium',
      stem: 'The old bridge failed its annual safety ______ consequently, the city closed it to traffic overnight.',
      choices: [
        { text: 'inspection;', is_correct: true },
        { text: 'inspection,', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'inspection', is_correct: false, misconception_token: 'run-on' },
        { text: 'inspection:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'When "consequently" joins two complete sentences, a semicolon comes before it. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.',
    },
    {
      slot: 17,
      difficulty: 'medium',
      stem: 'The forecast called for steady ______ so the organizers moved the concert indoors.',
      choices: [
        { text: 'rain,', is_correct: true },
        { text: 'rain', is_correct: false, misconception_token: 'missing-comma' },
        { text: 'rain;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'rain:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'Two complete sentences joined by "so" take a comma before the conjunction. No comma runs them together, and a semicolon or colon does not precede a coordinating conjunction like "so."',
    },
    {
      slot: 18,
      difficulty: 'hard',
      stem: 'The odds of success were ______ nevertheless, the small crew pressed on with the launch.',
      choices: [
        { text: 'daunting;', is_correct: true },
        { text: 'daunting,', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'daunting', is_correct: false, misconception_token: 'run-on' },
        { text: 'daunting:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'When "nevertheless" joins two complete sentences, a semicolon precedes it. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.',
    },
    {
      slot: 19,
      difficulty: 'hard',
      stem: 'The negotiations stalled for ______ but a compromise finally emerged just before midnight.',
      choices: [
        { text: 'weeks,', is_correct: true },
        { text: 'weeks', is_correct: false, misconception_token: 'missing-comma' },
        { text: 'weeks;', is_correct: false, misconception_token: 'semicolon-misused' },
        { text: 'weeks:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: 'Two complete sentences joined by "but" take a comma before the conjunction. No comma runs them together, and a semicolon or colon does not precede a coordinating conjunction like "but."',
    },
    {
      slot: 20,
      difficulty: 'hard',
      stem: 'The renovation uncovered several ______ for example, one wall concealed a mural from the 1800s.',
      choices: [
        { text: 'surprises;', is_correct: true },
        { text: 'surprises,', is_correct: false, misconception_token: 'comma-splice' },
        { text: 'surprises', is_correct: false, misconception_token: 'run-on' },
        { text: 'surprises:', is_correct: false, misconception_token: 'colon-needs-complete-clause' },
      ],
      solution: '"For example" introducing a second complete sentence follows a semicolon. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.',
    },
  ],
}

export const GRAMMAR_TEMPLATES: GrammarTemplate[] = [
  SUBJECT_VERB_AGREEMENT,
  PUNCTUATION_BASICS,
  SENTENCE_STRUCTURE,
  PRONOUN_AGREEMENT,
  VERB_TENSE_AND_FORM,
  ADVANCED_PUNCTUATION,
  POSSESSIVES_AND_APOSTROPHES,
  MODIFIER_PLACEMENT,
  SENTENCE_BOUNDARIES,
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
