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
