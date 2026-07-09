/**
 * K–2 PRE-READER item format — a curated pool of AUDIO-FIRST, TAP-A-PICTURE items
 * for children who cannot yet read. The prompt is SPOKEN by Nikki (auto-read via
 * the existing ElevenLabs path); the answers are large TILES that are numbers or
 * groups of simple pictures — never a text stem the child must read.
 *
 * This rides the SAME generated_questions row as text items, marked with
 * render_mode = 'audio_picture', plus an optional visual `prompt`; each choice
 * carries a `tile`. Text items are untouched (render_mode defaults to 'text').
 *
 * FEEDBACK FOR THIS AGE IS WARM, NOT DIAGNOSTIC: unlike the older bank, K–2 items
 * carry NO misconception tokens. A wrong tap gets a gentle "let's count together"
 * (the item's spoken `solution`), never an error label. Distractors are KIND —
 * off-by-one or a clearly-different, easily-countable quantity, never tricky.
 *
 * PHASE 1 ships ONE proof skill: Kindergarten Counting (CCSS K.CC), both
 * directions (count -> number, number -> group). Images come from a small,
 * curated, safe inline-SVG set (see KID_IMAGES / the KidIcon component).
 */

export type Difficulty = 'easy' | 'medium' | 'hard'

/** The curated, controlled illustration set. Each key maps to one hand-drawn
 *  inline SVG in the KidIcon component — safe, offline, CSP-friendly, scalable. */
export const KID_IMAGES = [
  'apple', 'star', 'ball', 'flower', 'duck', 'fish',
  // Phonics word pictures (beginning-sound proof).
  'cat', 'gift', 'hat', 'key', 'leaf', 'moon', 'pig', 'ring', 'sun', 'tree', 'van',
] as const
export type KidImage = (typeof KID_IMAGES)[number]

/** A tappable answer tile: a big numeral, a big LETTER, or a group of N icons. */
export type Tile =
  | { kind: 'number'; value: string }
  | { kind: 'letter'; value: string }
  | { kind: 'object_group'; image: KidImage; count: number }

/** The optional VISUAL prompt shown above the tiles (e.g. the group to count).
 *  null when the prompt is audio-only (e.g. "Tap the group that shows four"). */
export type Prompt = { kind: 'object_group'; image: KidImage; count: number } | null

export interface PreReaderChoice {
  /** Accessible label / scoring value (e.g. "3"). The child sees the tile, not this. */
  text: string
  is_correct: boolean
  tile: Tile
}

export interface PreReaderItem {
  slot: number
  difficulty: Difficulty
  /** The SPOKEN prompt — Nikki reads it aloud; the child does not read it. */
  stem: string
  prompt: Prompt
  choices: PreReaderChoice[] // 2–4 tiles, exactly one correct, kind distractors
  /** A short, warm, count-it-together message — spoken on a wrong tap and to explain. */
  solution: string
}

export interface PreReaderSkill {
  slug: string
  name: string
  subject: 'math' | 'reading'
  ccssGrade: string // 'K'
  ccssGradeNum: number // 0
  ccssCode: string
  satAlignment: string
  gradeBand: string // 'k-2'
  /** Taxonomy placement for the self-contained seed (domain + its parent subject). */
  domainKey: string
  domainName: string
  parentSubjectKey: string // 'subj-math' | 'subj-reading'
  renderMode: 'audio_picture'
  items: PreReaderItem[]
}

const num = (v: number): Tile => ({ kind: 'number', value: String(v) })
const grp = (image: KidImage, count: number): Tile => ({ kind: 'object_group', image, count })
const ltr = (v: string): Tile => ({ kind: 'letter', value: v })

// ============================================================================
// Kindergarten — Counting (CCSS K.CC.B.5): count to answer "how many?", and
// match a number to a group. Audio-first, tap a tile. 18 items, both directions.
// ============================================================================

const COUNTING_K: PreReaderSkill = {
  slug: 'counting', name: 'Counting', subject: 'math',
  ccssGrade: 'K', ccssGradeNum: 0, ccssCode: 'CCSS.MATH.CONTENT.K.CC.B.5',
  satAlignment: 'problem-solving-data-analysis', gradeBand: 'k-2',
  domainKey: 'dom-math-cc', domainName: 'Counting & Cardinality', parentSubjectKey: 'subj-math',
  renderMode: 'audio_picture',
  items: [
    // --- Direction A: count the pictures, tap the number ---
    { slot: 1, difficulty: 'easy', stem: 'How many apples do you see? Tap the number.', prompt: { kind: 'object_group', image: 'apple', count: 3 }, choices: [
      { text: '3', is_correct: true, tile: num(3) },
      { text: '2', is_correct: false, tile: num(2) },
      { text: '4', is_correct: false, tile: num(4) },
    ], solution: "Let's count the apples together: one, two, three. There are 3 apples!" },
    { slot: 2, difficulty: 'easy', stem: 'How many stars do you see? Tap the number.', prompt: { kind: 'object_group', image: 'star', count: 5 }, choices: [
      { text: '5', is_correct: true, tile: num(5) },
      { text: '4', is_correct: false, tile: num(4) },
      { text: '6', is_correct: false, tile: num(6) },
    ], solution: "Let's count the stars: one, two, three, four, five. There are 5 stars!" },
    { slot: 3, difficulty: 'easy', stem: 'How many balls do you see? Tap the number.', prompt: { kind: 'object_group', image: 'ball', count: 2 }, choices: [
      { text: '2', is_correct: true, tile: num(2) },
      { text: '1', is_correct: false, tile: num(1) },
      { text: '3', is_correct: false, tile: num(3) },
    ], solution: "Let's count the balls: one, two. There are 2 balls!" },
    { slot: 4, difficulty: 'medium', stem: 'How many flowers do you see? Tap the number.', prompt: { kind: 'object_group', image: 'flower', count: 7 }, choices: [
      { text: '7', is_correct: true, tile: num(7) },
      { text: '6', is_correct: false, tile: num(6) },
      { text: '8', is_correct: false, tile: num(8) },
      { text: '5', is_correct: false, tile: num(5) },
    ], solution: "Let's touch each flower and count: one, two, three, four, five, six, seven. There are 7 flowers!" },
    { slot: 5, difficulty: 'medium', stem: 'How many ducks do you see? Tap the number.', prompt: { kind: 'object_group', image: 'duck', count: 4 }, choices: [
      { text: '4', is_correct: true, tile: num(4) },
      { text: '3', is_correct: false, tile: num(3) },
      { text: '5', is_correct: false, tile: num(5) },
      { text: '6', is_correct: false, tile: num(6) },
    ], solution: "Let's count the ducks: one, two, three, four. There are 4 ducks!" },
    { slot: 6, difficulty: 'medium', stem: 'How many fish do you see? Tap the number.', prompt: { kind: 'object_group', image: 'fish', count: 6 }, choices: [
      { text: '6', is_correct: true, tile: num(6) },
      { text: '5', is_correct: false, tile: num(5) },
      { text: '7', is_correct: false, tile: num(7) },
      { text: '8', is_correct: false, tile: num(8) },
    ], solution: "Let's count the fish: one, two, three, four, five, six. There are 6 fish!" },
    { slot: 7, difficulty: 'hard', stem: 'How many apples do you see? Tap the number.', prompt: { kind: 'object_group', image: 'apple', count: 9 }, choices: [
      { text: '9', is_correct: true, tile: num(9) },
      { text: '8', is_correct: false, tile: num(8) },
      { text: '10', is_correct: false, tile: num(10) },
      { text: '7', is_correct: false, tile: num(7) },
    ], solution: "Let's touch each apple and count all the way to nine. There are 9 apples!" },
    { slot: 8, difficulty: 'easy', stem: 'How many stars do you see? Tap the number.', prompt: { kind: 'object_group', image: 'star', count: 1 }, choices: [
      { text: '1', is_correct: true, tile: num(1) },
      { text: '2', is_correct: false, tile: num(2) },
      { text: '3', is_correct: false, tile: num(3) },
    ], solution: "There is just one star. The answer is 1!" },
    { slot: 9, difficulty: 'medium', stem: 'How many balls do you see? Tap the number.', prompt: { kind: 'object_group', image: 'ball', count: 8 }, choices: [
      { text: '8', is_correct: true, tile: num(8) },
      { text: '7', is_correct: false, tile: num(7) },
      { text: '9', is_correct: false, tile: num(9) },
      { text: '6', is_correct: false, tile: num(6) },
    ], solution: "Let's count the balls all the way to eight. There are 8 balls!" },
    // --- Direction B: hear a number, tap the matching group ---
    { slot: 10, difficulty: 'easy', stem: 'Tap the group that shows 3.', prompt: null, choices: [
      { text: '3', is_correct: true, tile: grp('star', 3) },
      { text: '2', is_correct: false, tile: grp('star', 2) },
      { text: '4', is_correct: false, tile: grp('star', 4) },
    ], solution: "Let's count each group. One, two, three — this group shows 3!" },
    { slot: 11, difficulty: 'easy', stem: 'Tap the group that shows 4.', prompt: null, choices: [
      { text: '4', is_correct: true, tile: grp('apple', 4) },
      { text: '3', is_correct: false, tile: grp('apple', 3) },
      { text: '5', is_correct: false, tile: grp('apple', 5) },
    ], solution: "Let's count each group. The group with four apples is the one that shows 4!" },
    { slot: 12, difficulty: 'easy', stem: 'Tap the group that shows 2.', prompt: null, choices: [
      { text: '2', is_correct: true, tile: grp('duck', 2) },
      { text: '1', is_correct: false, tile: grp('duck', 1) },
      { text: '3', is_correct: false, tile: grp('duck', 3) },
    ], solution: "Let's count. The group with two ducks shows 2!" },
    { slot: 13, difficulty: 'medium', stem: 'Tap the group that shows 6.', prompt: null, choices: [
      { text: '6', is_correct: true, tile: grp('ball', 6) },
      { text: '5', is_correct: false, tile: grp('ball', 5) },
      { text: '7', is_correct: false, tile: grp('ball', 7) },
      { text: '4', is_correct: false, tile: grp('ball', 4) },
    ], solution: "Let's count each group carefully. The group with six balls shows 6!" },
    { slot: 14, difficulty: 'medium', stem: 'Tap the group that shows 5.', prompt: null, choices: [
      { text: '5', is_correct: true, tile: grp('flower', 5) },
      { text: '4', is_correct: false, tile: grp('flower', 4) },
      { text: '6', is_correct: false, tile: grp('flower', 6) },
      { text: '7', is_correct: false, tile: grp('flower', 7) },
    ], solution: "Let's count. The group with five flowers shows 5!" },
    { slot: 15, difficulty: 'medium', stem: 'Tap the group that shows 8.', prompt: null, choices: [
      { text: '8', is_correct: true, tile: grp('fish', 8) },
      { text: '7', is_correct: false, tile: grp('fish', 7) },
      { text: '9', is_correct: false, tile: grp('fish', 9) },
      { text: '6', is_correct: false, tile: grp('fish', 6) },
    ], solution: "Let's count each group all the way. The group with eight fish shows 8!" },
    { slot: 16, difficulty: 'hard', stem: 'Tap the group that shows 10.', prompt: null, choices: [
      { text: '10', is_correct: true, tile: grp('star', 10) },
      { text: '9', is_correct: false, tile: grp('star', 9) },
      { text: '11', is_correct: false, tile: grp('star', 11) },
      { text: '8', is_correct: false, tile: grp('star', 8) },
    ], solution: "Let's count each group of stars all the way to ten. The group of 10 is the answer!" },
    { slot: 17, difficulty: 'easy', stem: 'Tap the group that shows 1.', prompt: null, choices: [
      { text: '1', is_correct: true, tile: grp('apple', 1) },
      { text: '2', is_correct: false, tile: grp('apple', 2) },
      { text: '3', is_correct: false, tile: grp('apple', 3) },
    ], solution: "The group with just one apple shows 1!" },
    { slot: 18, difficulty: 'medium', stem: 'Tap the group that shows 7.', prompt: null, choices: [
      { text: '7', is_correct: true, tile: grp('duck', 7) },
      { text: '6', is_correct: false, tile: grp('duck', 6) },
      { text: '8', is_correct: false, tile: grp('duck', 8) },
      { text: '5', is_correct: false, tile: grp('duck', 5) },
    ], solution: "Let's count each group. The group with seven ducks shows 7!" },
  ],
}

// ============================================================================
// Kindergarten — Letter Sounds (CCSS RF.K.3.A / RF.K.2.C): WORD + PICTURE
// beginning-sound recognition. Nikki says a familiar word clearly (TTS handles
// whole words well) and its picture is shown; the child taps the letter the word
// STARTS with. This is the reliable path (no fragile isolated phonemes) and how
// phonics is actually taught ("b is for ball"). Tiles are LETTERS. 15 items.
//
// Distractors are clearly-different letters — never b/d/p look-alikes or minimal
// pairs. Feedback is warm: "Ball starts with buh… B! Nice listening!"
// ============================================================================

const word = (image: KidImage): Prompt => ({ kind: 'object_group', image, count: 1 })

const LETTER_SOUNDS_K: PreReaderSkill = {
  slug: 'letter-sounds', name: 'Letter Sounds', subject: 'reading',
  ccssGrade: 'K', ccssGradeNum: 0, ccssCode: 'CCSS.ELA-LITERACY.RF.K.3.A',
  satAlignment: 'information-and-ideas', gradeBand: 'k-2',
  domainKey: 'dom-reading-foundational', domainName: 'Reading Foundational Skills', parentSubjectKey: 'subj-reading',
  renderMode: 'audio_picture',
  items: [
    { slot: 1, difficulty: 'easy', stem: 'Listen: ball. Which letter does ball start with?', prompt: word('ball'), choices: [
      { text: 'B', is_correct: true, tile: ltr('B') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'T', is_correct: false, tile: ltr('T') },
    ], solution: 'Ball starts with buh… B! Nice listening!' },
    { slot: 2, difficulty: 'easy', stem: 'Listen: cat. Which letter does cat start with?', prompt: word('cat'), choices: [
      { text: 'C', is_correct: true, tile: ltr('C') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'S', is_correct: false, tile: ltr('S') },
    ], solution: 'Cat starts with kuh… C! Nice listening!' },
    { slot: 3, difficulty: 'easy', stem: 'Listen: duck. Which letter does duck start with?', prompt: word('duck'), choices: [
      { text: 'D', is_correct: true, tile: ltr('D') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'S', is_correct: false, tile: ltr('S') },
    ], solution: 'Duck starts with duh… D! Nice listening!' },
    { slot: 4, difficulty: 'easy', stem: 'Listen: fish. Which letter does fish start with?', prompt: word('fish'), choices: [
      { text: 'F', is_correct: true, tile: ltr('F') }, { text: 'L', is_correct: false, tile: ltr('L') }, { text: 'T', is_correct: false, tile: ltr('T') },
    ], solution: 'Fish starts with fff… F! Nice listening!' },
    { slot: 5, difficulty: 'easy', stem: 'Listen: moon. Which letter does moon start with?', prompt: word('moon'), choices: [
      { text: 'M', is_correct: true, tile: ltr('M') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'T', is_correct: false, tile: ltr('T') },
    ], solution: 'Moon starts with mmm… M! Nice listening!' },
    { slot: 6, difficulty: 'easy', stem: 'Listen: sun. Which letter does sun start with?', prompt: word('sun'), choices: [
      { text: 'S', is_correct: true, tile: ltr('S') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'B', is_correct: false, tile: ltr('B') },
    ], solution: 'Sun starts with sss… S! Nice listening!' },
    { slot: 7, difficulty: 'easy', stem: 'Listen: tree. Which letter does tree start with?', prompt: word('tree'), choices: [
      { text: 'T', is_correct: true, tile: ltr('T') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'S', is_correct: false, tile: ltr('S') },
    ], solution: 'Tree starts with tuh… T! Nice listening!' },
    { slot: 8, difficulty: 'medium', stem: 'Listen: leaf. Which letter does leaf start with?', prompt: word('leaf'), choices: [
      { text: 'L', is_correct: true, tile: ltr('L') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'F', is_correct: false, tile: ltr('F') }, { text: 'S', is_correct: false, tile: ltr('S') },
    ], solution: 'Leaf starts with lll… L! Nice listening!' },
    { slot: 9, difficulty: 'medium', stem: 'Listen: pig. Which letter does pig start with?', prompt: word('pig'), choices: [
      { text: 'P', is_correct: true, tile: ltr('P') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'T', is_correct: false, tile: ltr('T') },
    ], solution: 'Pig starts with puh… P! Nice listening!' },
    { slot: 10, difficulty: 'medium', stem: 'Listen: ring. Which letter does ring start with?', prompt: word('ring'), choices: [
      { text: 'R', is_correct: true, tile: ltr('R') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'T', is_correct: false, tile: ltr('T') },
    ], solution: 'Ring starts with rrr… R! Nice listening!' },
    { slot: 11, difficulty: 'medium', stem: 'Listen: hat. Which letter does hat start with?', prompt: word('hat'), choices: [
      { text: 'H', is_correct: true, tile: ltr('H') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'T', is_correct: false, tile: ltr('T') },
    ], solution: 'Hat starts with hhh… H! Nice listening!' },
    { slot: 12, difficulty: 'medium', stem: 'Listen: key. Which letter does key start with?', prompt: word('key'), choices: [
      { text: 'K', is_correct: true, tile: ltr('K') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'T', is_correct: false, tile: ltr('T') }, { text: 'M', is_correct: false, tile: ltr('M') },
    ], solution: 'Key starts with kuh… K! Nice listening!' },
    { slot: 13, difficulty: 'medium', stem: 'Listen: gift. Which letter does gift start with?', prompt: word('gift'), choices: [
      { text: 'G', is_correct: true, tile: ltr('G') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'T', is_correct: false, tile: ltr('T') }, { text: 'M', is_correct: false, tile: ltr('M') },
    ], solution: 'Gift starts with guh… G! Nice listening!' },
    { slot: 14, difficulty: 'hard', stem: 'Listen: van. Which letter does van start with?', prompt: word('van'), choices: [
      { text: 'V', is_correct: true, tile: ltr('V') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'T', is_correct: false, tile: ltr('T') },
    ], solution: 'Van starts with vvv… V! Nice listening!' },
    { slot: 15, difficulty: 'hard', stem: 'Listen: apple. Which letter does apple start with?', prompt: word('apple'), choices: [
      { text: 'A', is_correct: true, tile: ltr('A') }, { text: 'E', is_correct: false, tile: ltr('E') }, { text: 'O', is_correct: false, tile: ltr('O') }, { text: 'S', is_correct: false, tile: ltr('S') },
    ], solution: 'Apple starts with A… aaa, apple! Nice listening!' },
  ],
}

export const PRE_READER_SKILLS: PreReaderSkill[] = [COUNTING_K, LETTER_SOUNDS_K]

// --- Deterministic build of a served item (shuffle the tiles) ----------------

function mulberry32(a: number): () => number {
  return function () {
    a |= 0
    a = (a + 0x6d2b79f5) | 0
    let t = Math.imul(a ^ (a >>> 15), 1 | a)
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296
  }
}

export function seedForSlot(slot: number): number {
  return Math.imul(slot, 0x9e3779b1) >>> 0
}

export interface BuiltPreReaderItem {
  stem: string
  prompt: Prompt
  choices: PreReaderChoice[]
  correct_answer: string
  solution: string
  difficulty: Difficulty
}

/** Shuffle the answer tiles deterministically; correct_answer is the correct
 *  tile's label. Pure — same (item, seed) -> identical. */
export function buildPreReaderItem(item: PreReaderItem, seed: number): BuiltPreReaderItem {
  const rng = mulberry32(seed >>> 0)
  const choices = [...item.choices]
  for (let i = choices.length - 1; i > 0; i--) {
    const j = Math.floor(rng() * (i + 1))
    ;[choices[i], choices[j]] = [choices[j], choices[i]]
  }
  const correct = choices.find((c) => c.is_correct)
  return {
    stem: item.stem,
    prompt: item.prompt,
    choices,
    correct_answer: correct ? correct.text : '',
    solution: item.solution,
    difficulty: item.difficulty,
  }
}
