/**
 * Prep verbal question bank — Synonyms & Antonyms (HSPT/ISEE verbal), grades 6-8.
 *
 * The math analogue of gapMathTemplates.ts, held to the SAME bar: every item has 4
 * choices, exactly one correct, and THREE distractors that are each a specific
 * wrong path a real 7th grader takes — never a random word. Each distractor is one
 * of a small set of verbal misconception archetypes, and every token has an
 * explanation in misconceptions.ts (a test asserts coverage).
 *
 * ONE curated word entry generates BOTH directions: a synonym item and an antonym
 * item. Served through the same generated_questions path as the rest of the bank
 * (scripts/build-prep-verbal-seeds.ts emits the rows for the prep-synonyms and
 * prep-antonyms skills).
 */

export type Difficulty = 'easy' | 'medium' | 'hard'

export interface PrepChoice {
  text: string
  is_correct: boolean
  misconception_token?: string
}

export interface PrepItem {
  slot: number
  difficulty: Difficulty
  stem: string
  choices: PrepChoice[]
  solution: string
}

export interface PrepSkill {
  slug: string
  name: string
  subject: string // taxonomy subject value (isolated: 'prep-verbal')
  gradeBand: string
  items: PrepItem[]
}

// --- Misconception tokens (the wrong-path archetypes) -----------------------
// Synonym distractors:
const SYN_SAME_TOPIC = 'verbal-same-topic-not-meaning' // same subject, different meaning
const SYN_NEAR_MISS = 'verbal-near-miss-shade' // right neighborhood, wrong shade/strength
const SYN_OTHER_SENSE = 'verbal-other-sense' // matches a DIFFERENT sense of the stem
const SYN_OPPOSITE = 'verbal-opposite-not-synonym' // picked the opposite by mistake
const SYN_SOUNDALIKE = 'verbal-soundalike' // a look/sound-alike word, different meaning
// Antonym distractors:
const ANT_SYNONYM = 'verbal-opposite-picked-synonym' // gave a synonym, not the opposite
const ANT_SAME_TOPIC = 'verbal-opposite-same-topic' // related to the topic, not the opposite
const ANT_NEAR_MISS = 'verbal-opposite-near-miss' // opposite-ish, not the exact reverse

/** Token -> explanation. Merged into misconceptions.ts EXPLANATIONS so
 *  explainMisconception() and the review screen pick these up. */
export const VERBAL_MISCONCEPTIONS: Record<string, string> = {
  [SYN_SAME_TOPIC]:
    'That word is about the same topic, but it does not mean the same thing. A synonym has to match the MEANING, not just the subject.',
  [SYN_NEAR_MISS]:
    'Close! That word is in the same neighborhood of meaning, but the shade or strength is a little off. Pick the one that matches most exactly.',
  [SYN_OTHER_SENSE]:
    'That word matches a DIFFERENT meaning of the word in the question. Decide which sense is being used here, then match that one.',
  [SYN_OPPOSITE]:
    'Careful — that word means the OPPOSITE. A synonym has to mean the same thing, not the reverse.',
  [SYN_SOUNDALIKE]:
    'That word looks or sounds like the word in the question, but it means something different. Match the meaning, not the spelling.',
  [ANT_SYNONYM]:
    'That word means about the SAME thing, not the opposite. An antonym has to flip the meaning.',
  [ANT_SAME_TOPIC]:
    'That word is related to the topic, but it is not the opposite. The antonym has to reverse the meaning.',
  [ANT_NEAR_MISS]:
    'Close! That is in the opposite direction, but not quite the true opposite. Pick the word that most exactly reverses the meaning.',
}

// --- The curated word bank --------------------------------------------------
interface D {
  text: string
  token: string
}
interface WordEntry {
  word: string
  tier: Difficulty
  gloss: string
  syn: { answer: string; d: [D, D, D] }
  ant: { answer: string; d: [D, D, D] }
}

const d = (text: string, token: string): D => ({ text, token })

const WORD_BANK: WordEntry[] = [
  // ---- Easy ----
  { word: 'abundant', tier: 'easy', gloss: 'existing in large amounts; plentiful',
    syn: { answer: 'plentiful', d: [d('expensive', SYN_SAME_TOPIC), d('generous', SYN_NEAR_MISS), d('scarce', SYN_OPPOSITE)] },
    ant: { answer: 'scarce', d: [d('ample', ANT_SYNONYM), d('costly', ANT_SAME_TOPIC), d('modest', ANT_NEAR_MISS)] } },
  { word: 'brave', tier: 'easy', gloss: 'showing courage in the face of danger',
    syn: { answer: 'courageous', d: [d('strong', SYN_SAME_TOPIC), d('confident', SYN_NEAR_MISS), d('cowardly', SYN_OPPOSITE)] },
    ant: { answer: 'cowardly', d: [d('fearless', ANT_SYNONYM), d('reckless', ANT_SAME_TOPIC), d('timid', ANT_NEAR_MISS)] } },
  { word: 'calm', tier: 'easy', gloss: 'free from excitement or disturbance; peaceful',
    syn: { answer: 'peaceful', d: [d('lazy', SYN_SAME_TOPIC), d('quiet', SYN_NEAR_MISS), d('frantic', SYN_OPPOSITE)] },
    ant: { answer: 'frantic', d: [d('serene', ANT_SYNONYM), d('bored', ANT_SAME_TOPIC), d('restless', ANT_NEAR_MISS)] } },
  { word: 'begin', tier: 'easy', gloss: 'to start doing something',
    syn: { answer: 'commence', d: [d('attend', SYN_SAME_TOPIC), d('prepare', SYN_NEAR_MISS), d('finish', SYN_OPPOSITE)] },
    ant: { answer: 'conclude', d: [d('start', ANT_SYNONYM), d('continue', ANT_SAME_TOPIC), d('pause', ANT_NEAR_MISS)] } },
  { word: 'huge', tier: 'easy', gloss: 'extremely large in size',
    syn: { answer: 'enormous', d: [d('heavy', SYN_SAME_TOPIC), d('tall', SYN_NEAR_MISS), d('tiny', SYN_OPPOSITE)] },
    ant: { answer: 'tiny', d: [d('massive', ANT_SYNONYM), d('wide', ANT_SAME_TOPIC), d('small', ANT_NEAR_MISS)] } },
  { word: 'happy', tier: 'easy', gloss: 'feeling or showing pleasure',
    syn: { answer: 'cheerful', d: [d('friendly', SYN_SAME_TOPIC), d('excited', SYN_NEAR_MISS), d('miserable', SYN_OPPOSITE)] },
    ant: { answer: 'miserable', d: [d('joyful', ANT_SYNONYM), d('calm', ANT_SAME_TOPIC), d('gloomy', ANT_NEAR_MISS)] } },
  { word: 'quick', tier: 'easy', gloss: 'moving or happening fast',
    syn: { answer: 'rapid', d: [d('busy', SYN_SAME_TOPIC), d('sudden', SYN_NEAR_MISS), d('sluggish', SYN_OPPOSITE)] },
    ant: { answer: 'sluggish', d: [d('swift', ANT_SYNONYM), d('early', ANT_SAME_TOPIC), d('slow', ANT_NEAR_MISS)] } },
  { word: 'honest', tier: 'easy', gloss: 'truthful and sincere',
    syn: { answer: 'truthful', d: [d('polite', SYN_SAME_TOPIC), d('loyal', SYN_NEAR_MISS), d('deceitful', SYN_OPPOSITE)] },
    ant: { answer: 'deceitful', d: [d('sincere', ANT_SYNONYM), d('rude', ANT_SAME_TOPIC), d('secretive', ANT_NEAR_MISS)] } },
  { word: 'ancient', tier: 'easy', gloss: 'belonging to the very distant past; very old',
    syn: { answer: 'aged', d: [d('famous', SYN_SAME_TOPIC), d('historic', SYN_NEAR_MISS), d('modern', SYN_OPPOSITE)] },
    ant: { answer: 'modern', d: [d('antique', ANT_SYNONYM), d('ruined', ANT_SAME_TOPIC), d('recent', ANT_NEAR_MISS)] } },
  { word: 'bold', tier: 'easy', gloss: 'willing to take risks; confident and daring',
    syn: { answer: 'daring', d: [d('proud', SYN_SAME_TOPIC), d('bright', SYN_OTHER_SENSE), d('timid', SYN_OPPOSITE)] },
    ant: { answer: 'timid', d: [d('fearless', ANT_SYNONYM), d('rude', ANT_SAME_TOPIC), d('quiet', ANT_NEAR_MISS)] } },
  { word: 'gather', tier: 'easy', gloss: 'to bring or come together in one place',
    syn: { answer: 'collect', d: [d('clean', SYN_SAME_TOPIC), d('organize', SYN_NEAR_MISS), d('scatter', SYN_OPPOSITE)] },
    ant: { answer: 'scatter', d: [d('assemble', ANT_SYNONYM), d('store', ANT_SAME_TOPIC), d('spread', ANT_NEAR_MISS)] } },
  { word: 'wealthy', tier: 'easy', gloss: 'having a great deal of money; rich',
    syn: { answer: 'affluent', d: [d('famous', SYN_SAME_TOPIC), d('generous', SYN_NEAR_MISS), d('destitute', SYN_OPPOSITE)] },
    ant: { answer: 'destitute', d: [d('rich', ANT_SYNONYM), d('greedy', ANT_SAME_TOPIC), d('needy', ANT_NEAR_MISS)] } },
  { word: 'simple', tier: 'easy', gloss: 'easily understood; not complicated',
    syn: { answer: 'plain', d: [d('cheap', SYN_SAME_TOPIC), d('small', SYN_NEAR_MISS), d('complicated', SYN_OPPOSITE)] },
    ant: { answer: 'complicated', d: [d('easy', ANT_SYNONYM), d('boring', ANT_SAME_TOPIC), d('confusing', ANT_NEAR_MISS)] } },
  { word: 'reveal', tier: 'easy', gloss: 'to make something known; to show',
    syn: { answer: 'disclose', d: [d('announce', SYN_SAME_TOPIC), d('discover', SYN_NEAR_MISS), d('conceal', SYN_OPPOSITE)] },
    ant: { answer: 'conceal', d: [d('expose', ANT_SYNONYM), d('display', ANT_SAME_TOPIC), d('guard', ANT_NEAR_MISS)] } },
  { word: 'sturdy', tier: 'easy', gloss: 'strongly built; not easily broken',
    syn: { answer: 'robust', d: [d('heavy', SYN_SAME_TOPIC), d('stiff', SYN_NEAR_MISS), d('flimsy', SYN_OPPOSITE)] },
    ant: { answer: 'flimsy', d: [d('solid', ANT_SYNONYM), d('bulky', ANT_SAME_TOPIC), d('weak', ANT_NEAR_MISS)] } },
  { word: 'praise', tier: 'easy', gloss: 'to express approval or admiration',
    syn: { answer: 'commend', d: [d('reward', SYN_SAME_TOPIC), d('thank', SYN_NEAR_MISS), d('criticize', SYN_OPPOSITE)] },
    ant: { answer: 'criticize', d: [d('applaud', ANT_SYNONYM), d('notice', ANT_SAME_TOPIC), d('blame', ANT_NEAR_MISS)] } },

  // ---- Medium ----
  { word: 'reluctant', tier: 'medium', gloss: 'unwilling and hesitant',
    syn: { answer: 'hesitant', d: [d('quiet', SYN_SAME_TOPIC), d('nervous', SYN_NEAR_MISS), d('eager', SYN_OPPOSITE)] },
    ant: { answer: 'eager', d: [d('unwilling', ANT_SYNONYM), d('careful', ANT_SAME_TOPIC), d('willing', ANT_NEAR_MISS)] } },
  { word: 'diligent', tier: 'medium', gloss: 'showing careful, steady effort; hardworking',
    syn: { answer: 'industrious', d: [d('punctual', SYN_SAME_TOPIC), d('intelligent', SYN_NEAR_MISS), d('lazy', SYN_OPPOSITE)] },
    ant: { answer: 'lazy', d: [d('hardworking', ANT_SYNONYM), d('busy', ANT_SAME_TOPIC), d('careless', ANT_NEAR_MISS)] } },
  { word: 'hostile', tier: 'medium', gloss: 'unfriendly and aggressive',
    syn: { answer: 'antagonistic', d: [d('competitive', SYN_SAME_TOPIC), d('angry', SYN_NEAR_MISS), d('friendly', SYN_OPPOSITE)] },
    ant: { answer: 'friendly', d: [d('aggressive', ANT_SYNONYM), d('rude', ANT_SAME_TOPIC), d('neutral', ANT_NEAR_MISS)] } },
  { word: 'vivid', tier: 'medium', gloss: 'producing bright, clear images in the mind',
    syn: { answer: 'vibrant', d: [d('loud', SYN_SAME_TOPIC), d('colorful', SYN_NEAR_MISS), d('dull', SYN_OPPOSITE)] },
    ant: { answer: 'dull', d: [d('bright', ANT_SYNONYM), d('shiny', ANT_SAME_TOPIC), d('faint', ANT_NEAR_MISS)] } },
  { word: 'scarce', tier: 'medium', gloss: 'in short supply; hard to find',
    syn: { answer: 'sparse', d: [d('expensive', SYN_SAME_TOPIC), d('small', SYN_NEAR_MISS), d('plentiful', SYN_OPPOSITE)] },
    ant: { answer: 'plentiful', d: [d('rare', ANT_SYNONYM), d('cheap', ANT_SAME_TOPIC), d('common', ANT_NEAR_MISS)] } },
  { word: 'tranquil', tier: 'medium', gloss: 'calm and peaceful',
    syn: { answer: 'serene', d: [d('sleepy', SYN_SAME_TOPIC), d('silent', SYN_NEAR_MISS), d('turbulent', SYN_OPPOSITE)] },
    ant: { answer: 'turbulent', d: [d('peaceful', ANT_SYNONYM), d('boring', ANT_SAME_TOPIC), d('chaotic', ANT_NEAR_MISS)] } },
  { word: 'concise', tier: 'medium', gloss: 'giving a lot of information in few words',
    syn: { answer: 'succinct', d: [d('polite', SYN_SAME_TOPIC), d('clear', SYN_NEAR_MISS), d('rambling', SYN_OPPOSITE)] },
    ant: { answer: 'rambling', d: [d('brief', ANT_SYNONYM), d('simple', ANT_SAME_TOPIC), d('lengthy', ANT_NEAR_MISS)] } },
  { word: 'arrogant', tier: 'medium', gloss: 'having an exaggerated sense of one’s own importance',
    syn: { answer: 'haughty', d: [d('famous', SYN_SAME_TOPIC), d('confident', SYN_NEAR_MISS), d('humble', SYN_OPPOSITE)] },
    ant: { answer: 'humble', d: [d('conceited', ANT_SYNONYM), d('rude', ANT_SAME_TOPIC), d('modest', ANT_NEAR_MISS)] } },
  { word: 'genuine', tier: 'medium', gloss: 'truly what it is said to be; authentic',
    syn: { answer: 'authentic', d: [d('valuable', SYN_SAME_TOPIC), d('honest', SYN_NEAR_MISS), d('fake', SYN_OPPOSITE)] },
    ant: { answer: 'fake', d: [d('real', ANT_SYNONYM), d('cheap', ANT_SAME_TOPIC), d('artificial', ANT_NEAR_MISS)] } },
  { word: 'fragile', tier: 'medium', gloss: 'easily broken or damaged',
    syn: { answer: 'delicate', d: [d('valuable', SYN_SAME_TOPIC), d('thin', SYN_NEAR_MISS), d('durable', SYN_OPPOSITE)] },
    ant: { answer: 'durable', d: [d('brittle', ANT_SYNONYM), d('light', ANT_SAME_TOPIC), d('sturdy', ANT_NEAR_MISS)] } },
  { word: 'obscure', tier: 'medium', gloss: 'not clearly understood or widely known',
    syn: { answer: 'unclear', d: [d('distant', SYN_SAME_TOPIC), d('secret', SYN_NEAR_MISS), d('obvious', SYN_OPPOSITE)] },
    ant: { answer: 'obvious', d: [d('vague', ANT_SYNONYM), d('hidden', ANT_SAME_TOPIC), d('clear', ANT_NEAR_MISS)] } },
  { word: 'lenient', tier: 'medium', gloss: 'more merciful or tolerant than expected; not strict',
    syn: { answer: 'permissive', d: [d('fair', SYN_SAME_TOPIC), d('kind', SYN_NEAR_MISS), d('strict', SYN_OPPOSITE)] },
    ant: { answer: 'strict', d: [d('easygoing', ANT_SYNONYM), d('generous', ANT_SAME_TOPIC), d('firm', ANT_NEAR_MISS)] } },
  { word: 'novel', tier: 'medium', gloss: 'new and original; not seen before',
    syn: { answer: 'original', d: [d('famous', SYN_SAME_TOPIC), d('book', SYN_OTHER_SENSE), d('familiar', SYN_OPPOSITE)] },
    ant: { answer: 'familiar', d: [d('new', ANT_SYNONYM), d('modern', ANT_SAME_TOPIC), d('ordinary', ANT_NEAR_MISS)] } },
  { word: 'meager', tier: 'medium', gloss: 'lacking in quantity; scanty',
    syn: { answer: 'scanty', d: [d('cheap', SYN_SAME_TOPIC), d('thin', SYN_NEAR_MISS), d('ample', SYN_OPPOSITE)] },
    ant: { answer: 'ample', d: [d('scant', ANT_SYNONYM), d('poor', ANT_SAME_TOPIC), d('sufficient', ANT_NEAR_MISS)] } },
  { word: 'candid', tier: 'medium', gloss: 'honest and straightforward in speech',
    syn: { answer: 'frank', d: [d('polite', SYN_SAME_TOPIC), d('confident', SYN_NEAR_MISS), d('evasive', SYN_OPPOSITE)] },
    ant: { answer: 'evasive', d: [d('honest', ANT_SYNONYM), d('rude', ANT_SAME_TOPIC), d('secretive', ANT_NEAR_MISS)] } },
  { word: 'vigorous', tier: 'medium', gloss: 'strong, healthy, and full of energy',
    syn: { answer: 'energetic', d: [d('muscular', SYN_SAME_TOPIC), d('healthy', SYN_NEAR_MISS), d('feeble', SYN_OPPOSITE)] },
    ant: { answer: 'feeble', d: [d('lively', ANT_SYNONYM), d('athletic', ANT_SAME_TOPIC), d('weak', ANT_NEAR_MISS)] } },

  // ---- Hard ----
  { word: 'austere', tier: 'hard', gloss: 'severe or strict; plain and without comfort',
    syn: { answer: 'severe', d: [d('ancient', SYN_SAME_TOPIC), d('serious', SYN_NEAR_MISS), d('lavish', SYN_OPPOSITE)] },
    ant: { answer: 'lavish', d: [d('strict', ANT_SYNONYM), d('gloomy', ANT_SAME_TOPIC), d('fancy', ANT_NEAR_MISS)] } },
  { word: 'benevolent', tier: 'hard', gloss: 'kind and wishing to do good for others',
    syn: { answer: 'kindhearted', d: [d('wealthy', SYN_SAME_TOPIC), d('gentle', SYN_NEAR_MISS), d('malicious', SYN_OPPOSITE)] },
    ant: { answer: 'malicious', d: [d('generous', ANT_SYNONYM), d('polite', ANT_SAME_TOPIC), d('cruel', ANT_NEAR_MISS)] } },
  { word: 'cryptic', tier: 'hard', gloss: 'having a hidden meaning; mysterious',
    syn: { answer: 'mysterious', d: [d('ancient', SYN_SAME_TOPIC), d('secret', SYN_NEAR_MISS), d('plain', SYN_OPPOSITE)] },
    ant: { answer: 'plain', d: [d('puzzling', ANT_SYNONYM), d('hidden', ANT_SAME_TOPIC), d('clear', ANT_NEAR_MISS)] } },
  { word: 'deft', tier: 'hard', gloss: 'quick and skillful in movement',
    syn: { answer: 'skillful', d: [d('strong', SYN_SAME_TOPIC), d('fast', SYN_NEAR_MISS), d('clumsy', SYN_OPPOSITE)] },
    ant: { answer: 'clumsy', d: [d('nimble', ANT_SYNONYM), d('careful', ANT_SAME_TOPIC), d('awkward', ANT_NEAR_MISS)] } },
  { word: 'elated', tier: 'hard', gloss: 'extremely happy and excited',
    syn: { answer: 'overjoyed', d: [d('surprised', SYN_SAME_TOPIC), d('proud', SYN_NEAR_MISS), d('dejected', SYN_OPPOSITE)] },
    ant: { answer: 'dejected', d: [d('thrilled', ANT_SYNONYM), d('calm', ANT_SAME_TOPIC), d('gloomy', ANT_NEAR_MISS)] } },
  { word: 'frugal', tier: 'hard', gloss: 'careful and sparing with money',
    syn: { answer: 'thrifty', d: [d('cheap', SYN_SAME_TOPIC), d('poor', SYN_NEAR_MISS), d('wasteful', SYN_OPPOSITE)] },
    ant: { answer: 'wasteful', d: [d('economical', ANT_SYNONYM), d('greedy', ANT_SAME_TOPIC), d('extravagant', ANT_NEAR_MISS)] } },
  { word: 'gregarious', tier: 'hard', gloss: 'fond of company; sociable',
    syn: { answer: 'sociable', d: [d('talkative', SYN_SAME_TOPIC), d('popular', SYN_NEAR_MISS), d('reclusive', SYN_OPPOSITE)] },
    ant: { answer: 'reclusive', d: [d('outgoing', ANT_SYNONYM), d('friendly', ANT_SAME_TOPIC), d('shy', ANT_NEAR_MISS)] } },
  { word: 'impartial', tier: 'hard', gloss: 'treating all sides equally; unbiased',
    syn: { answer: 'unbiased', d: [d('calm', SYN_SAME_TOPIC), d('honest', SYN_NEAR_MISS), d('prejudiced', SYN_OPPOSITE)] },
    ant: { answer: 'prejudiced', d: [d('neutral', ANT_SYNONYM), d('strict', ANT_SAME_TOPIC), d('unfair', ANT_NEAR_MISS)] } },
  { word: 'laconic', tier: 'hard', gloss: 'using very few words',
    syn: { answer: 'terse', d: [d('rude', SYN_SAME_TOPIC), d('quiet', SYN_NEAR_MISS), d('verbose', SYN_OPPOSITE)] },
    ant: { answer: 'verbose', d: [d('brief', ANT_SYNONYM), d('shy', ANT_SAME_TOPIC), d('wordy', ANT_NEAR_MISS)] } },
  { word: 'mundane', tier: 'hard', gloss: 'lacking interest or excitement; ordinary',
    syn: { answer: 'ordinary', d: [d('worldly', SYN_OTHER_SENSE), d('boring', SYN_NEAR_MISS), d('extraordinary', SYN_OPPOSITE)] },
    ant: { answer: 'extraordinary', d: [d('commonplace', ANT_SYNONYM), d('simple', ANT_SAME_TOPIC), d('remarkable', ANT_NEAR_MISS)] } },
  { word: 'obstinate', tier: 'hard', gloss: 'stubbornly refusing to change one’s mind',
    syn: { answer: 'stubborn', d: [d('strong', SYN_SAME_TOPIC), d('confident', SYN_NEAR_MISS), d('compliant', SYN_OPPOSITE)] },
    ant: { answer: 'compliant', d: [d('headstrong', ANT_SYNONYM), d('rude', ANT_SAME_TOPIC), d('obedient', ANT_NEAR_MISS)] } },
  { word: 'placate', tier: 'hard', gloss: 'to make someone less angry; to soothe',
    syn: { answer: 'appease', d: [d('ignore', SYN_SAME_TOPIC), d('praise', SYN_NEAR_MISS), d('provoke', SYN_OPPOSITE)] },
    ant: { answer: 'provoke', d: [d('calm', ANT_SYNONYM), d('please', ANT_SAME_TOPIC), d('annoy', ANT_NEAR_MISS)] } },
  { word: 'prudent', tier: 'hard', gloss: 'acting with care and thought for the future',
    syn: { answer: 'cautious', d: [d('quiet', SYN_SAME_TOPIC), d('intelligent', SYN_NEAR_MISS), d('reckless', SYN_OPPOSITE)] },
    ant: { answer: 'reckless', d: [d('careful', ANT_SYNONYM), d('strict', ANT_SAME_TOPIC), d('careless', ANT_NEAR_MISS)] } },
  { word: 'resilient', tier: 'hard', gloss: 'able to recover quickly from difficulty; tough',
    syn: { answer: 'hardy', d: [d('strong', SYN_SAME_TOPIC), d('flexible', SYN_NEAR_MISS), d('fragile', SYN_OPPOSITE)] },
    ant: { answer: 'fragile', d: [d('tough', ANT_SYNONYM), d('healthy', ANT_SAME_TOPIC), d('delicate', ANT_NEAR_MISS)] } },
  { word: 'squander', tier: 'hard', gloss: 'to waste something valuable carelessly',
    syn: { answer: 'waste', d: [d('misplace', SYN_SAME_TOPIC), d('spend', SYN_NEAR_MISS), d('conserve', SYN_OPPOSITE)] },
    ant: { answer: 'conserve', d: [d('exhaust', ANT_SYNONYM), d('donate', ANT_SAME_TOPIC), d('hoard', ANT_NEAR_MISS)] } },
  { word: 'wary', tier: 'hard', gloss: 'feeling caution about possible danger',
    syn: { answer: 'cautious', d: [d('weary', SYN_SOUNDALIKE), d('nervous', SYN_NEAR_MISS), d('trusting', SYN_OPPOSITE)] },
    ant: { answer: 'trusting', d: [d('careful', ANT_SYNONYM), d('quiet', ANT_SAME_TOPIC), d('confident', ANT_NEAR_MISS)] } },
]

// --- Skill construction (one word -> a synonym item AND an antonym item) ----
const cap = (s: string) => s.charAt(0).toUpperCase() + s.slice(1)

function synItem(w: WordEntry, slot: number): PrepItem {
  return {
    slot,
    difficulty: w.tier,
    stem: `Which word means most nearly the SAME as ${w.word.toUpperCase()}?`,
    choices: [
      { text: w.syn.answer, is_correct: true },
      ...w.syn.d.map((x) => ({ text: x.text, is_correct: false, misconception_token: x.token })),
    ],
    solution: `${cap(w.word)} means "${w.gloss}", so the closest word in meaning is ${w.syn.answer}.`,
  }
}

function antItem(w: WordEntry, slot: number): PrepItem {
  return {
    slot,
    difficulty: w.tier,
    stem: `Which word means most nearly the OPPOSITE of ${w.word.toUpperCase()}?`,
    choices: [
      { text: w.ant.answer, is_correct: true },
      ...w.ant.d.map((x) => ({ text: x.text, is_correct: false, misconception_token: x.token })),
    ],
    solution: `${cap(w.word)} means "${w.gloss}", so the word that means the opposite is ${w.ant.answer}.`,
  }
}

export const PREP_VERBAL_SUBJECT = { key: 'subj-prep-verbal', subject: 'prep-verbal', name: 'Test Prep — Verbal' }
export const PREP_VERBAL_DOMAIN = { key: 'dom-prep-verbal', name: 'Verbal Reasoning' }

export const PREP_VERBAL_SKILLS: PrepSkill[] = [
  {
    slug: 'prep-synonyms',
    name: 'Synonyms',
    subject: 'prep-verbal',
    gradeBand: '6-8',
    items: WORD_BANK.map((w, i) => synItem(w, i + 1)),
  },
  {
    slug: 'prep-antonyms',
    name: 'Antonyms',
    subject: 'prep-verbal',
    gradeBand: '6-8',
    items: WORD_BANK.map((w, i) => antItem(w, i + 1)),
  },
]

/** Deterministic answer position from the slot: balanced across the 4 positions as
 *  slot increments (so no position bias a test-taker could exploit), and stable so
 *  the emitted seed is idempotent. */
export function seedForSlot(slot: number): number {
  return slot
}

export interface BuiltQuestion {
  difficulty: Difficulty
  stem: string
  choices: PrepChoice[]
  correct_answer: string
  solution: string
}

export function buildPrepQuestion(item: PrepItem, seed: number): BuiltQuestion {
  const correct = item.choices.find((c) => c.is_correct)
  if (!correct) throw new Error(`item slot ${item.slot} has no correct choice`)
  const distractors = item.choices.filter((c) => !c.is_correct)
  const pos = seed % 4
  const ordered: PrepChoice[] = []
  let di = 0
  for (let i = 0; i < 4; i++) ordered.push(i === pos ? correct : distractors[di++])
  return {
    difficulty: item.difficulty,
    stem: item.stem,
    choices: ordered,
    correct_answer: correct.text,
    solution: item.solution,
  }
}
