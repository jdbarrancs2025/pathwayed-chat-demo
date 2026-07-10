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
  // Deepening set — more familiar K words (clean single-consonant onsets).
  'house', 'cap', 'bus', 'door', 'jet', 'net', 'web', 'yoyo', 'sock', 'mug', 'pot', 'kite', 'tent',
  // 2-D shapes (K.G) — 'star' above doubles as a shape.
  'circle', 'square', 'triangle', 'rectangle', 'oval', 'diamond', 'hexagon', 'heart',
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
  /**
   * How distractors relate to the answer. Default (counting) = distinct quantities
   * off-by 1..3. 'match' = the choices are distinct by IDENTITY (a shape, or a
   * clearly-different number/quantity in a more/fewer comparison) with no
   * closeness rule — a comparison is meant to be an easy, clear difference.
   */
  variant?: 'match'
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

// Choice helpers (label + tile + correctness) for the deepening skills.
const numChoice = (v: number, correct = false): PreReaderChoice => ({ text: String(v), is_correct: correct, tile: num(v) })
const ltrChoice = (v: string, correct = false): PreReaderChoice => ({ text: v, is_correct: correct, tile: ltr(v) })
const shapeChoice = (name: KidImage, correct = false): PreReaderChoice => ({ text: name, is_correct: correct, tile: grp(name, 1) })
const grpChoice = (image: KidImage, count: number, correct = false): PreReaderChoice => ({ text: String(count), is_correct: correct, tile: grp(image, count) })

// ============================================================================
// Kindergarten — Counting (CCSS K.CC.B.5): count to answer "how many?", and
// match a number to a group. Audio-first, tap a tile. 28 items, both directions.
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
    // --- More count -> number (fresh pictures for variety) ---
    { slot: 19, difficulty: 'easy', stem: 'How many cats do you see? Tap the number.', prompt: { kind: 'object_group', image: 'cat', count: 4 }, choices: [
      { text: '4', is_correct: true, tile: num(4) },
      { text: '3', is_correct: false, tile: num(3) },
      { text: '5', is_correct: false, tile: num(5) },
    ], solution: "Let's count the cats: one, two, three, four. There are 4 cats!" },
    { slot: 20, difficulty: 'medium', stem: 'How many hats do you see? Tap the number.', prompt: { kind: 'object_group', image: 'hat', count: 6 }, choices: [
      { text: '6', is_correct: true, tile: num(6) },
      { text: '5', is_correct: false, tile: num(5) },
      { text: '7', is_correct: false, tile: num(7) },
      { text: '4', is_correct: false, tile: num(4) },
    ], solution: "Let's count the hats: one, two, three, four, five, six. There are 6 hats!" },
    { slot: 21, difficulty: 'easy', stem: 'How many keys do you see? Tap the number.', prompt: { kind: 'object_group', image: 'key', count: 3 }, choices: [
      { text: '3', is_correct: true, tile: num(3) },
      { text: '2', is_correct: false, tile: num(2) },
      { text: '4', is_correct: false, tile: num(4) },
    ], solution: "Let's count the keys: one, two, three. There are 3 keys!" },
    { slot: 22, difficulty: 'medium', stem: 'How many leaves do you see? Tap the number.', prompt: { kind: 'object_group', image: 'leaf', count: 8 }, choices: [
      { text: '8', is_correct: true, tile: num(8) },
      { text: '7', is_correct: false, tile: num(7) },
      { text: '9', is_correct: false, tile: num(9) },
      { text: '6', is_correct: false, tile: num(6) },
    ], solution: "Let's touch each leaf and count all the way to eight. There are 8 leaves!" },
    { slot: 23, difficulty: 'medium', stem: 'How many pigs do you see? Tap the number.', prompt: { kind: 'object_group', image: 'pig', count: 5 }, choices: [
      { text: '5', is_correct: true, tile: num(5) },
      { text: '4', is_correct: false, tile: num(4) },
      { text: '6', is_correct: false, tile: num(6) },
      { text: '7', is_correct: false, tile: num(7) },
    ], solution: "Let's count the pigs: one, two, three, four, five. There are 5 pigs!" },
    // --- More number -> group (fresh pictures for variety) ---
    { slot: 24, difficulty: 'easy', stem: 'Tap the group that shows 5.', prompt: null, choices: [
      { text: '5', is_correct: true, tile: grp('cat', 5) },
      { text: '4', is_correct: false, tile: grp('cat', 4) },
      { text: '6', is_correct: false, tile: grp('cat', 6) },
    ], solution: "Let's count each group. The group with five cats shows 5!" },
    { slot: 25, difficulty: 'hard', stem: 'Tap the group that shows 9.', prompt: null, choices: [
      { text: '9', is_correct: true, tile: grp('ring', 9) },
      { text: '8', is_correct: false, tile: grp('ring', 8) },
      { text: '10', is_correct: false, tile: grp('ring', 10) },
      { text: '7', is_correct: false, tile: grp('ring', 7) },
    ], solution: "Let's count carefully. The group with nine rings shows 9!" },
    { slot: 26, difficulty: 'easy', stem: 'Tap the group that shows 2.', prompt: null, choices: [
      { text: '2', is_correct: true, tile: grp('sun', 2) },
      { text: '1', is_correct: false, tile: grp('sun', 1) },
      { text: '3', is_correct: false, tile: grp('sun', 3) },
    ], solution: "Let's count. The group with two suns shows 2!" },
    { slot: 27, difficulty: 'medium', stem: 'Tap the group that shows 6.', prompt: null, choices: [
      { text: '6', is_correct: true, tile: grp('tree', 6) },
      { text: '5', is_correct: false, tile: grp('tree', 5) },
      { text: '7', is_correct: false, tile: grp('tree', 7) },
      { text: '4', is_correct: false, tile: grp('tree', 4) },
    ], solution: "Let's count each group. The group with six trees shows 6!" },
    { slot: 28, difficulty: 'hard', stem: 'Tap the group that shows 10.', prompt: null, choices: [
      { text: '10', is_correct: true, tile: grp('van', 10) },
      { text: '9', is_correct: false, tile: grp('van', 9) },
      { text: '11', is_correct: false, tile: grp('van', 11) },
      { text: '8', is_correct: false, tile: grp('van', 8) },
    ], solution: "Let's count all the way to ten. The group with ten vans shows 10!" },
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
// pairs. Feedback is warm: "Ball starts with buh… B! Nice listening!" 28 items.
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
    // --- Deepening: more familiar words (2nd word per letter + new letters J/N/W/Y) ---
    { slot: 16, difficulty: 'medium', stem: 'Listen: house. Which letter does house start with?', prompt: word('house'), choices: [
      { text: 'H', is_correct: true, tile: ltr('H') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'T', is_correct: false, tile: ltr('T') },
    ], solution: 'House starts with hhh… H! Nice listening!' },
    { slot: 17, difficulty: 'medium', stem: 'Listen: cap. Which letter does cap start with?', prompt: word('cap'), choices: [
      { text: 'C', is_correct: true, tile: ltr('C') }, { text: 'T', is_correct: false, tile: ltr('T') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'S', is_correct: false, tile: ltr('S') },
    ], solution: 'Cap starts with kuh… C! Nice listening!' },
    { slot: 18, difficulty: 'easy', stem: 'Listen: bus. Which letter does bus start with?', prompt: word('bus'), choices: [
      { text: 'B', is_correct: true, tile: ltr('B') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'T', is_correct: false, tile: ltr('T') }, { text: 'M', is_correct: false, tile: ltr('M') },
    ], solution: 'Bus starts with buh… B! Nice listening!' },
    { slot: 19, difficulty: 'medium', stem: 'Listen: door. Which letter does door start with?', prompt: word('door'), choices: [
      { text: 'D', is_correct: true, tile: ltr('D') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'F', is_correct: false, tile: ltr('F') },
    ], solution: 'Door starts with duh… D! Nice listening!' },
    { slot: 20, difficulty: 'medium', stem: 'Listen: jet. Which letter does jet start with?', prompt: word('jet'), choices: [
      { text: 'J', is_correct: true, tile: ltr('J') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'T', is_correct: false, tile: ltr('T') },
    ], solution: 'Jet starts with juh… J! Nice listening!' },
    { slot: 21, difficulty: 'medium', stem: 'Listen: net. Which letter does net start with?', prompt: word('net'), choices: [
      { text: 'N', is_correct: true, tile: ltr('N') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'T', is_correct: false, tile: ltr('T') },
    ], solution: 'Net starts with nnn… N! Nice listening!' },
    { slot: 22, difficulty: 'hard', stem: 'Listen: web. Which letter does web start with?', prompt: word('web'), choices: [
      { text: 'W', is_correct: true, tile: ltr('W') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'T', is_correct: false, tile: ltr('T') },
    ], solution: 'Web starts with wuh… W! Nice listening!' },
    { slot: 23, difficulty: 'hard', stem: 'Listen: yo-yo. Which letter does yo-yo start with?', prompt: word('yoyo'), choices: [
      { text: 'Y', is_correct: true, tile: ltr('Y') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'T', is_correct: false, tile: ltr('T') },
    ], solution: 'Yo-yo starts with yuh… Y! Nice listening!' },
    { slot: 24, difficulty: 'easy', stem: 'Listen: sock. Which letter does sock start with?', prompt: word('sock'), choices: [
      { text: 'S', is_correct: true, tile: ltr('S') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'T', is_correct: false, tile: ltr('T') }, { text: 'B', is_correct: false, tile: ltr('B') },
    ], solution: 'Sock starts with sss… S! Nice listening!' },
    { slot: 25, difficulty: 'easy', stem: 'Listen: mug. Which letter does mug start with?', prompt: word('mug'), choices: [
      { text: 'M', is_correct: true, tile: ltr('M') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'T', is_correct: false, tile: ltr('T') }, { text: 'B', is_correct: false, tile: ltr('B') },
    ], solution: 'Mug starts with mmm… M! Nice listening!' },
    { slot: 26, difficulty: 'medium', stem: 'Listen: pot. Which letter does pot start with?', prompt: word('pot'), choices: [
      { text: 'P', is_correct: true, tile: ltr('P') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'T', is_correct: false, tile: ltr('T') },
    ], solution: 'Pot starts with puh… P! Nice listening!' },
    { slot: 27, difficulty: 'medium', stem: 'Listen: kite. Which letter does kite start with?', prompt: word('kite'), choices: [
      { text: 'K', is_correct: true, tile: ltr('K') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'T', is_correct: false, tile: ltr('T') },
    ], solution: 'Kite starts with kuh… K! Nice listening!' },
    { slot: 28, difficulty: 'medium', stem: 'Listen: tent. Which letter does tent start with?', prompt: word('tent'), choices: [
      { text: 'T', is_correct: true, tile: ltr('T') }, { text: 'S', is_correct: false, tile: ltr('S') }, { text: 'M', is_correct: false, tile: ltr('M') }, { text: 'B', is_correct: false, tile: ltr('B') },
    ], solution: 'Tent starts with tuh… T! Nice listening!' },
  ],
}

// ============================================================================
// Kindergarten — Letter Naming (CCSS RF.K.1.D): recognize & name upper- AND
// lowercase letters. Nikki says a letter's name; the child taps that letter tile.
// Uppercase first, then lowercase. Distractors are clearly-different letters
// (never b/d/p/q look-alikes; those are avoided as answers). 26 items.
// ============================================================================

const LETTER_NAMING_K: PreReaderSkill = {
  slug: 'letter-naming', name: 'Letter Naming', subject: 'reading',
  ccssGrade: 'K', ccssGradeNum: 0, ccssCode: 'CCSS.ELA-LITERACY.RF.K.1.D',
  satAlignment: 'information-and-ideas', gradeBand: 'k-2',
  domainKey: 'dom-reading-foundational', domainName: 'Reading Foundational Skills', parentSubjectKey: 'subj-reading',
  renderMode: 'audio_picture',
  items: [
    // --- Uppercase: hear a letter name, tap the capital letter ---
    { slot: 1, difficulty: 'easy', stem: 'Can you find the letter A? Tap it.', prompt: null, choices: [ltrChoice('A', true), ltrChoice('S'), ltrChoice('M')], solution: "That's A! Great finding!" },
    { slot: 2, difficulty: 'easy', stem: 'Can you find the letter B? Tap it.', prompt: null, choices: [ltrChoice('B', true), ltrChoice('S'), ltrChoice('T')], solution: "That's B! Nice work!" },
    { slot: 3, difficulty: 'easy', stem: 'Can you find the letter C? Tap it.', prompt: null, choices: [ltrChoice('C', true), ltrChoice('M'), ltrChoice('S')], solution: "That's C! Well done!" },
    { slot: 4, difficulty: 'easy', stem: 'Can you find the letter E? Tap it.', prompt: null, choices: [ltrChoice('E', true), ltrChoice('S'), ltrChoice('M')], solution: "That's E! Great!" },
    { slot: 5, difficulty: 'medium', stem: 'Can you find the letter F? Tap it.', prompt: null, choices: [ltrChoice('F', true), ltrChoice('S'), ltrChoice('T'), ltrChoice('M')], solution: "That's F! Nice finding!" },
    { slot: 6, difficulty: 'medium', stem: 'Can you find the letter H? Tap it.', prompt: null, choices: [ltrChoice('H', true), ltrChoice('S'), ltrChoice('M'), ltrChoice('T')], solution: "That's H! Well done!" },
    { slot: 7, difficulty: 'medium', stem: 'Can you find the letter K? Tap it.', prompt: null, choices: [ltrChoice('K', true), ltrChoice('S'), ltrChoice('M'), ltrChoice('T')], solution: "That's K! Great!" },
    { slot: 8, difficulty: 'medium', stem: 'Can you find the letter L? Tap it.', prompt: null, choices: [ltrChoice('L', true), ltrChoice('S'), ltrChoice('M'), ltrChoice('T')], solution: "That's L! Nice!" },
    { slot: 9, difficulty: 'easy', stem: 'Can you find the letter O? Tap it.', prompt: null, choices: [ltrChoice('O', true), ltrChoice('S'), ltrChoice('M')], solution: "That's O — the round one! Great!" },
    { slot: 10, difficulty: 'medium', stem: 'Can you find the letter R? Tap it.', prompt: null, choices: [ltrChoice('R', true), ltrChoice('S'), ltrChoice('M'), ltrChoice('T')], solution: "That's R! Well done!" },
    { slot: 11, difficulty: 'easy', stem: 'Can you find the letter S? Tap it.', prompt: null, choices: [ltrChoice('S', true), ltrChoice('M'), ltrChoice('T'), ltrChoice('B')], solution: "That's S! Nice finding!" },
    { slot: 12, difficulty: 'easy', stem: 'Can you find the letter T? Tap it.', prompt: null, choices: [ltrChoice('T', true), ltrChoice('S'), ltrChoice('M'), ltrChoice('B')], solution: "That's T! Great!" },
    { slot: 13, difficulty: 'medium', stem: 'Can you find the letter W? Tap it.', prompt: null, choices: [ltrChoice('W', true), ltrChoice('S'), ltrChoice('M'), ltrChoice('T')], solution: "That's W! Well done!" },
    { slot: 14, difficulty: 'hard', stem: 'Can you find the letter Z? Tap it.', prompt: null, choices: [ltrChoice('Z', true), ltrChoice('S'), ltrChoice('M'), ltrChoice('T')], solution: "That's Z — the very last letter! Great!" },
    // --- Lowercase: hear a letter name, tap the little letter ---
    { slot: 15, difficulty: 'medium', stem: 'Tap the little letter a.', prompt: null, choices: [ltrChoice('a', true), ltrChoice('s'), ltrChoice('m')], solution: "Yes — that's little a! Nice!" },
    { slot: 16, difficulty: 'medium', stem: 'Tap the little letter c.', prompt: null, choices: [ltrChoice('c', true), ltrChoice('s'), ltrChoice('m')], solution: "Yes — little c! Great!" },
    { slot: 17, difficulty: 'medium', stem: 'Tap the little letter e.', prompt: null, choices: [ltrChoice('e', true), ltrChoice('s'), ltrChoice('m'), ltrChoice('t')], solution: "That's little e! Well done!" },
    { slot: 18, difficulty: 'medium', stem: 'Tap the little letter f.', prompt: null, choices: [ltrChoice('f', true), ltrChoice('s'), ltrChoice('m'), ltrChoice('t')], solution: "That's little f! Nice!" },
    { slot: 19, difficulty: 'medium', stem: 'Tap the little letter h.', prompt: null, choices: [ltrChoice('h', true), ltrChoice('s'), ltrChoice('m'), ltrChoice('t')], solution: "That's little h! Great!" },
    { slot: 20, difficulty: 'hard', stem: 'Tap the little letter k.', prompt: null, choices: [ltrChoice('k', true), ltrChoice('s'), ltrChoice('m'), ltrChoice('t')], solution: "That's little k! Well done!" },
    { slot: 21, difficulty: 'medium', stem: 'Tap the little letter l.', prompt: null, choices: [ltrChoice('l', true), ltrChoice('s'), ltrChoice('m'), ltrChoice('a')], solution: "That's little l! Nice!" },
    { slot: 22, difficulty: 'medium', stem: 'Tap the little letter m.', prompt: null, choices: [ltrChoice('m', true), ltrChoice('s'), ltrChoice('t'), ltrChoice('a')], solution: "That's little m! Great!" },
    { slot: 23, difficulty: 'easy', stem: 'Tap the little letter o.', prompt: null, choices: [ltrChoice('o', true), ltrChoice('s'), ltrChoice('m'), ltrChoice('t')], solution: "That's little o — nice and round! Nice!" },
    { slot: 24, difficulty: 'medium', stem: 'Tap the little letter r.', prompt: null, choices: [ltrChoice('r', true), ltrChoice('s'), ltrChoice('m'), ltrChoice('t')], solution: "That's little r! Well done!" },
    { slot: 25, difficulty: 'easy', stem: 'Tap the little letter s.', prompt: null, choices: [ltrChoice('s', true), ltrChoice('m'), ltrChoice('t'), ltrChoice('a')], solution: "That's little s! Great!" },
    { slot: 26, difficulty: 'medium', stem: 'Tap the little letter t.', prompt: null, choices: [ltrChoice('t', true), ltrChoice('s'), ltrChoice('m'), ltrChoice('a')], solution: "That's little t! Nice!" },
  ],
}

// ============================================================================
// Kindergarten — Shapes (CCSS K.G.A.2): name & identify 2-D shapes. Nikki names a
// shape; the child taps the matching shape picture. Distractors are clearly-
// different shapes (kind). 26 items. Uses `variant: 'match'` — the answers differ
// by SHAPE, not by quantity, so there is no off-by-one closeness rule.
// ============================================================================

const SHAPES_K: PreReaderSkill = {
  slug: 'shapes', name: 'Shapes', subject: 'math',
  ccssGrade: 'K', ccssGradeNum: 0, ccssCode: 'CCSS.MATH.CONTENT.K.G.A.2',
  satAlignment: 'problem-solving-data-analysis', gradeBand: 'k-2',
  domainKey: 'dom-math-geo', domainName: 'Geometry', parentSubjectKey: 'subj-math',
  renderMode: 'audio_picture',
  items: [
    { slot: 1, difficulty: 'easy', variant: 'match', stem: 'Can you find the circle? Tap it.', prompt: null, choices: [shapeChoice('circle', true), shapeChoice('square'), shapeChoice('triangle')], solution: 'Yes! That round shape is a circle. Great!' },
    { slot: 2, difficulty: 'easy', variant: 'match', stem: 'Can you find the square? Tap it.', prompt: null, choices: [shapeChoice('square', true), shapeChoice('circle'), shapeChoice('triangle')], solution: 'Yes! A square has four equal sides. Nice!' },
    { slot: 3, difficulty: 'easy', variant: 'match', stem: 'Can you find the triangle? Tap it.', prompt: null, choices: [shapeChoice('triangle', true), shapeChoice('circle'), shapeChoice('square')], solution: 'Yes! A triangle has three sides. Well done!' },
    { slot: 4, difficulty: 'medium', variant: 'match', stem: 'Can you find the rectangle? Tap it.', prompt: null, choices: [shapeChoice('rectangle', true), shapeChoice('circle'), shapeChoice('triangle')], solution: 'Yes! A rectangle is like a long box. Great!' },
    { slot: 5, difficulty: 'medium', variant: 'match', stem: 'Can you find the oval? Tap it.', prompt: null, choices: [shapeChoice('oval', true), shapeChoice('square'), shapeChoice('triangle')], solution: 'Yes! An oval is like a stretched circle. Nice!' },
    { slot: 6, difficulty: 'medium', variant: 'match', stem: 'Can you find the diamond? Tap it.', prompt: null, choices: [shapeChoice('diamond', true), shapeChoice('circle'), shapeChoice('triangle')], solution: "Yes! That's a diamond. Well done!" },
    { slot: 7, difficulty: 'hard', variant: 'match', stem: 'Can you find the hexagon? Tap it.', prompt: null, choices: [shapeChoice('hexagon', true), shapeChoice('circle'), shapeChoice('square')], solution: 'Yes! A hexagon has six sides. Great!' },
    { slot: 8, difficulty: 'easy', variant: 'match', stem: 'Can you find the star? Tap it.', prompt: null, choices: [shapeChoice('star', true), shapeChoice('circle'), shapeChoice('square')], solution: "Yes! That's a star. Nice!" },
    { slot: 9, difficulty: 'easy', variant: 'match', stem: 'Can you find the heart? Tap it.', prompt: null, choices: [shapeChoice('heart', true), shapeChoice('square'), shapeChoice('triangle')], solution: "Yes! That's a heart. Great!" },
    { slot: 10, difficulty: 'medium', variant: 'match', stem: 'Can you find the circle? Tap it.', prompt: null, choices: [shapeChoice('circle', true), shapeChoice('triangle'), shapeChoice('star'), shapeChoice('heart')], solution: 'That round shape is the circle! Well done!' },
    { slot: 11, difficulty: 'medium', variant: 'match', stem: 'Can you find the square? Tap it.', prompt: null, choices: [shapeChoice('square', true), shapeChoice('triangle'), shapeChoice('star'), shapeChoice('heart')], solution: 'The square has four equal sides! Nice!' },
    { slot: 12, difficulty: 'medium', variant: 'match', stem: 'Can you find the triangle? Tap it.', prompt: null, choices: [shapeChoice('triangle', true), shapeChoice('circle'), shapeChoice('star'), shapeChoice('heart')], solution: 'The triangle has three corners! Great!' },
    { slot: 13, difficulty: 'medium', variant: 'match', stem: 'Can you find the rectangle? Tap it.', prompt: null, choices: [shapeChoice('rectangle', true), shapeChoice('triangle'), shapeChoice('star'), shapeChoice('circle')], solution: "That's the rectangle! Well done!" },
    { slot: 14, difficulty: 'medium', variant: 'match', stem: 'Can you find the oval? Tap it.', prompt: null, choices: [shapeChoice('oval', true), shapeChoice('triangle'), shapeChoice('star'), shapeChoice('square')], solution: "That's the oval! Nice!" },
    { slot: 15, difficulty: 'medium', variant: 'match', stem: 'Can you find the diamond? Tap it.', prompt: null, choices: [shapeChoice('diamond', true), shapeChoice('circle'), shapeChoice('star'), shapeChoice('heart')], solution: "That's the diamond! Great!" },
    { slot: 16, difficulty: 'hard', variant: 'match', stem: 'Can you find the hexagon? Tap it.', prompt: null, choices: [shapeChoice('hexagon', true), shapeChoice('circle'), shapeChoice('triangle'), shapeChoice('heart')], solution: 'The hexagon has six sides! Well done!' },
    { slot: 17, difficulty: 'easy', variant: 'match', stem: 'Can you find the star? Tap it.', prompt: null, choices: [shapeChoice('star', true), shapeChoice('heart'), shapeChoice('circle'), shapeChoice('square')], solution: "That's the star! Nice!" },
    { slot: 18, difficulty: 'easy', variant: 'match', stem: 'Can you find the heart? Tap it.', prompt: null, choices: [shapeChoice('heart', true), shapeChoice('star'), shapeChoice('circle'), shapeChoice('triangle')], solution: "That's the heart! Great!" },
    { slot: 19, difficulty: 'medium', variant: 'match', stem: 'Can you find the triangle? Tap it.', prompt: null, choices: [shapeChoice('triangle', true), shapeChoice('rectangle'), shapeChoice('circle'), shapeChoice('star')], solution: 'The triangle has three sides! Well done!' },
    { slot: 20, difficulty: 'easy', variant: 'match', stem: 'Can you find the square? Tap it.', prompt: null, choices: [shapeChoice('square', true), shapeChoice('circle'), shapeChoice('heart'), shapeChoice('star')], solution: "That's the square! Nice!" },
    // Descriptive prompts (still tap the matching shape).
    { slot: 21, difficulty: 'easy', variant: 'match', stem: 'Tap the round shape.', prompt: null, choices: [shapeChoice('circle', true), shapeChoice('square'), shapeChoice('triangle')], solution: 'A circle is perfectly round! Great!' },
    { slot: 22, difficulty: 'medium', variant: 'match', stem: 'Tap the shape with three corners.', prompt: null, choices: [shapeChoice('triangle', true), shapeChoice('circle'), shapeChoice('square')], solution: 'A triangle has three corners! Well done!' },
    { slot: 23, difficulty: 'hard', variant: 'match', stem: 'Tap the shape with six sides.', prompt: null, choices: [shapeChoice('hexagon', true), shapeChoice('circle'), shapeChoice('square')], solution: 'A hexagon has six sides! Nice counting!' },
    { slot: 24, difficulty: 'medium', variant: 'match', stem: 'Tap the shape that looks like a long box.', prompt: null, choices: [shapeChoice('rectangle', true), shapeChoice('circle'), shapeChoice('triangle')], solution: 'A rectangle is like a long box! Great!' },
    { slot: 25, difficulty: 'medium', variant: 'match', stem: 'Tap the shape that is stretched like an egg.', prompt: null, choices: [shapeChoice('oval', true), shapeChoice('square'), shapeChoice('triangle')], solution: 'An oval is like a stretched circle! Nice!' },
    { slot: 26, difficulty: 'easy', variant: 'match', stem: 'Can you find the heart? Tap it.', prompt: null, choices: [shapeChoice('heart', true), shapeChoice('star'), shapeChoice('circle')], solution: "That's the heart! Well done!" },
  ],
}

// ============================================================================
// Kindergarten — Comparing Numbers (CCSS K.CC.C.6/7): compare groups (more/fewer)
// and written numerals (bigger/smaller). Nikki reads it aloud; the child taps the
// group or number. `variant: 'match'` — differences are meant to be CLEAR (not
// off-by-one), so there is no closeness rule. 26 items.
// ============================================================================

const COMPARING_NUMBERS_K: PreReaderSkill = {
  slug: 'comparing-numbers', name: 'Comparing Numbers', subject: 'math',
  ccssGrade: 'K', ccssGradeNum: 0, ccssCode: 'CCSS.MATH.CONTENT.K.CC.C.6',
  satAlignment: 'problem-solving-data-analysis', gradeBand: 'k-2',
  domainKey: 'dom-math-cc', domainName: 'Counting & Cardinality', parentSubjectKey: 'subj-math',
  renderMode: 'audio_picture',
  items: [
    // --- Compare groups: more / fewer (K.CC.C.6) ---
    { slot: 1, difficulty: 'easy', variant: 'match', stem: 'Which group has more? Tap the group with more.', prompt: null, choices: [grpChoice('apple', 5, true), grpChoice('apple', 2)], solution: 'This group has 5 and this one has 2. Five is more! Great looking!' },
    { slot: 2, difficulty: 'easy', variant: 'match', stem: 'Which group has more? Tap the group with more.', prompt: null, choices: [grpChoice('star', 6, true), grpChoice('star', 3)], solution: 'Six is more than three! Nice!' },
    { slot: 3, difficulty: 'easy', variant: 'match', stem: 'Which group has fewer? Tap the group with fewer.', prompt: null, choices: [grpChoice('ball', 2, true), grpChoice('ball', 7)], solution: 'Two is fewer than seven! Well done!' },
    { slot: 4, difficulty: 'easy', variant: 'match', stem: 'Which group has more? Tap the group with more.', prompt: null, choices: [grpChoice('duck', 4, true), grpChoice('duck', 1)], solution: 'Four is more than one! Great!' },
    { slot: 5, difficulty: 'medium', variant: 'match', stem: 'Which group has fewer? Tap the group with fewer.', prompt: null, choices: [grpChoice('fish', 3, true), grpChoice('fish', 8)], solution: 'Three is fewer than eight! Nice!' },
    { slot: 6, difficulty: 'medium', variant: 'match', stem: 'Which group has more? Tap the group with more.', prompt: null, choices: [grpChoice('cat', 8, true), grpChoice('cat', 5)], solution: 'Eight is more than five! Well done!' },
    { slot: 7, difficulty: 'medium', variant: 'match', stem: 'Which group has fewer? Tap the group with fewer.', prompt: null, choices: [grpChoice('hat', 2, true), grpChoice('hat', 6)], solution: 'Two is fewer than six! Great!' },
    { slot: 8, difficulty: 'medium', variant: 'match', stem: 'Which group has more? Tap the group with more.', prompt: null, choices: [grpChoice('flower', 7, true), grpChoice('flower', 4)], solution: 'Seven is more than four! Nice!' },
    { slot: 9, difficulty: 'medium', variant: 'match', stem: 'Which group has more? Tap the group with more.', prompt: null, choices: [grpChoice('sun', 6, true), grpChoice('sun', 3)], solution: 'Six is more than three! Well done!' },
    { slot: 10, difficulty: 'easy', variant: 'match', stem: 'Which group has fewer? Tap the group with fewer.', prompt: null, choices: [grpChoice('tree', 1, true), grpChoice('tree', 5)], solution: 'One is the fewest! Great!' },
    { slot: 11, difficulty: 'medium', variant: 'match', stem: 'Which group has more? Tap the group with more.', prompt: null, choices: [grpChoice('pig', 9, true), grpChoice('pig', 6)], solution: 'Nine is more than six! Nice!' },
    { slot: 12, difficulty: 'medium', variant: 'match', stem: 'Which group has fewer? Tap the group with fewer.', prompt: null, choices: [grpChoice('ring', 4, true), grpChoice('ring', 9)], solution: 'Four is fewer than nine! Well done!' },
    { slot: 13, difficulty: 'hard', variant: 'match', stem: 'Which group has the most? Tap it.', prompt: null, choices: [grpChoice('apple', 8, true), grpChoice('apple', 5), grpChoice('apple', 2)], solution: 'Eight is the most! Great counting!' },
    // --- Compare numerals: bigger / smaller (K.CC.C.7) ---
    { slot: 14, difficulty: 'easy', variant: 'match', stem: 'Which number is bigger? Tap it.', prompt: null, choices: [numChoice(7, true), numChoice(3)], solution: '7 is bigger than 3! Nice!' },
    { slot: 15, difficulty: 'easy', variant: 'match', stem: 'Which number is bigger? Tap it.', prompt: null, choices: [numChoice(9, true), numChoice(5)], solution: '9 is bigger than 5! Great!' },
    { slot: 16, difficulty: 'easy', variant: 'match', stem: 'Which number is smaller? Tap it.', prompt: null, choices: [numChoice(2, true), numChoice(8)], solution: '2 is smaller than 8! Well done!' },
    { slot: 17, difficulty: 'medium', variant: 'match', stem: 'Which number is bigger? Tap it.', prompt: null, choices: [numChoice(6, true), numChoice(4)], solution: '6 is bigger than 4! Nice!' },
    { slot: 18, difficulty: 'medium', variant: 'match', stem: 'Which number is smaller? Tap it.', prompt: null, choices: [numChoice(3, true), numChoice(7)], solution: '3 is smaller than 7! Great!' },
    { slot: 19, difficulty: 'medium', variant: 'match', stem: 'Which number is bigger? Tap it.', prompt: null, choices: [numChoice(10, true), numChoice(6)], solution: '10 is bigger than 6! Well done!' },
    { slot: 20, difficulty: 'easy', variant: 'match', stem: 'Which number is smaller? Tap it.', prompt: null, choices: [numChoice(1, true), numChoice(5)], solution: '1 is the smallest! Nice!' },
    { slot: 21, difficulty: 'medium', variant: 'match', stem: 'Which number is bigger? Tap it.', prompt: null, choices: [numChoice(8, true), numChoice(5)], solution: '8 is bigger than 5! Great!' },
    { slot: 22, difficulty: 'medium', variant: 'match', stem: 'Which number is smaller? Tap it.', prompt: null, choices: [numChoice(4, true), numChoice(9)], solution: '4 is smaller than 9! Well done!' },
    { slot: 23, difficulty: 'easy', variant: 'match', stem: 'Which number is bigger? Tap it.', prompt: null, choices: [numChoice(9, true), numChoice(2)], solution: '9 is bigger than 2! Nice!' },
    { slot: 24, difficulty: 'hard', variant: 'match', stem: 'Which number is the biggest? Tap it.', prompt: null, choices: [numChoice(9, true), numChoice(6), numChoice(3)], solution: '9 is the biggest! Great!' },
    { slot: 25, difficulty: 'medium', variant: 'match', stem: 'Which number is smaller? Tap it.', prompt: null, choices: [numChoice(6, true), numChoice(10)], solution: '6 is smaller than 10! Well done!' },
    { slot: 26, difficulty: 'medium', variant: 'match', stem: 'Which number is bigger? Tap it.', prompt: null, choices: [numChoice(7, true), numChoice(5)], solution: '7 is bigger than 5! Nice!' },
  ],
}

export const PRE_READER_SKILLS: PreReaderSkill[] = [
  COUNTING_K,
  LETTER_SOUNDS_K,
  LETTER_NAMING_K,
  SHAPES_K,
  COMPARING_NUMBERS_K,
]

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
