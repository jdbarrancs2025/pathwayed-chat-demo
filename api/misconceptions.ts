// Structured misconception library for high-frequency early-learning errors.
// Each entry names the error's signature (how it shows up), the diagnostic
// question that confirms it, and the targeted re-teach move. The teaching engine
// surfaces the relevant subset (by subject + grade band) so Nikki can recognize
// and respond to the actual cause rather than re-explaining from scratch.
//
// Dependency-free so it can be unit-tested and reused by the eval harness.

import type { GradeBand } from "./teaching-cycle.js"

export type MisconceptionSubject = "reading" | "math"

export interface Misconception {
  id: string
  subject: MisconceptionSubject
  band: GradeBand
  /** Short human title. */
  title: string
  /** How the error shows up in a student's work or answer. */
  signature: string
  /** A question (or quick task) that confirms this is the cause. */
  diagnostic: string
  /** The targeted re-teach move once confirmed. */
  reteach: string
}

export const MISCONCEPTIONS: Misconception[] = [
  // --- K-2 Reading (decoding / structured literacy) -------------------------
  {
    id: "reading-bd-reversal",
    subject: "reading",
    band: "k-2",
    title: "b/d (or p/q) letter reversal",
    signature:
      'Reads or writes "b" for "d" (or vice versa) — e.g. reads "dog" as "bog", or writes "bad" as "dad".',
    diagnostic:
      'Point to the single letter in isolation and ask "what sound does this letter make?" — confirm the mix-up is the letter, not the whole word.',
    reteach:
      'Anchor the letter shape to its sound with a consistent cue (e.g. "b" starts with the bat/stick then the ball; lowercase "b" and "d" face each other). Have the child say the sound while tracing the letter, then re-read the word sound by sound. Multisensory and repeated, not a one-time tip.',
  },
  {
    id: "reading-short-vowel-confusion",
    subject: "reading",
    band: "k-2",
    title: "Short-vowel confusion",
    signature:
      'Swaps short vowel sounds — e.g. reads "pin" for "pen", or "bag" for "bug". The consonants are right; the vowel is off.',
    diagnostic:
      'Isolate the vowel: "what sound does the middle letter make?" Then say two words that differ only by the vowel (pen/pin) and ask which one matches.',
    reteach:
      "Re-teach the one vowel sound with a keyword anchor (e/echo, i/itch). Use minimal pairs (pen/pin, bag/bug) so the child hears the contrast, then blend the whole word again. Keep returning to the same keyword each time.",
  },
  {
    id: "reading-first-letter-guess",
    subject: "reading",
    band: "k-2",
    title: "Guessing from the first letter or picture (three-cueing)",
    signature:
      'Says a word that starts with the right letter or matches the picture but isn\'t decoded — e.g. sees "h" and a horse picture and says "horse" when the word is "house".',
    diagnostic:
      'Cover the picture and ask the child to read the word by its letters: "what are ALL the sounds, left to right?" If they can decode it once the picture is gone, the cause is guessing.',
    reteach:
      'Explicitly redirect: pictures and context are for meaning AFTER reading, never for figuring out the word. Have the child sound out every letter left to right and blend. Praise decoding the whole word over a fast guess. Never tell them to "look at the picture" or "what would make sense" to read a word.',
  },
  {
    id: "reading-letter-name-vs-sound",
    subject: "reading",
    band: "k-2",
    title: "Letter name vs letter sound",
    signature:
      'Uses the letter NAME instead of its SOUND when decoding — e.g. for "map" says "em-ay-pee" or thinks the first sound is "em".',
    diagnostic:
      'Ask "what SOUND does this letter make?" (not its name). If they give the name, that\'s the confusion.',
    reteach:
      'Separate name from sound explicitly: "Its name is em, and its sound is /m/. When we read, we use the sound." Practice the sound orally, then blend. Reinforce with repetition across words that share the sound.',
  },
  {
    id: "reading-no-blend",
    subject: "reading",
    band: "k-2",
    title: "Sounds in isolation but can't blend",
    signature:
      'Produces each sound correctly but can\'t push them together — says "/s/ /u/ /n/" then stops, or guesses a different word.',
    diagnostic:
      'Ask the child to say the sounds again and then "say them faster, all connected." If they can read it when connected, the gap is blending, not the sounds.',
    reteach:
      "Model continuous blending: hold each sound and slide into the next (sssuuunnn → sun), or use successive blending (/s/+/u/ = su, then su+/n/). Tap or sweep a finger under the sounds while connecting them. Lots of short, repeated practice.",
  },
  {
    id: "reading-drops-sounds",
    subject: "reading",
    band: "k-2",
    title: "Dropping or adding sounds in blends",
    signature:
      'Skips a sound in a consonant blend — reads "back" for "black", or "top" for "stop". Often the second consonant in a blend.',
    diagnostic:
      'Stretch the word slowly and ask the child to count or tap the sounds: "how many sounds do you hear?" Compare to what they read.',
    reteach:
      "Slow the word down and tap each sound, giving the dropped consonant its own tap (b-l-a-ck). Re-blend with every sound present. Practice the specific blend (bl, st) in a few words for repetition.",
  },

  // --- Early Math (number sense / place value) ------------------------------
  {
    id: "math-subtract-smaller-from-larger",
    subject: "math",
    band: "k-2",
    title: "Subtracting the smaller digit from the larger, per column",
    signature:
      'In column subtraction, always takes the smaller from the larger regardless of position — e.g. 32 − 17: does 7 − 2 = 5 in the ones place, getting 25 instead of 15.',
    diagnostic:
      'Ask "in the ones place, are we taking 7 away from 2, or 2 away from 7?" and "can we take 7 from 2?" to surface that the order matters and a regroup is needed.',
    reteach:
      "Use bundles/base-ten blocks or a place-value drawing to show you can't remove 7 from 2 ones, so you regroup one ten into ten ones first. Have the child do the regrouping with objects, then connect to the written method. Re-do the same problem together.",
  },
  {
    id: "math-count-all-not-on",
    subject: "math",
    band: "k-2",
    title: "Counting all from 1 instead of counting on",
    signature:
      "For 6 + 3, starts at 1 and counts every object/finger, often losing track or landing off by one.",
    diagnostic:
      'Ask "do we have to start at 1? Could we start at 6 and count up?" to check whether they can hold the first number and count on.',
    reteach:
      'Teach counting on from the larger number: "hold 6 in your head, then count 3 more — 7, 8, 9." Use fingers or a number line to track the 3 jumps. Practice a few so starting from the larger number becomes the habit.',
  },
  {
    id: "math-teen-reversal",
    subject: "math",
    band: "k-2",
    title: "Reversing teen numbers (place-value/digit order)",
    signature:
      'Writes or reads teen numbers reversed — writes 41 for "fourteen", or reads 14 as "forty-one".',
    diagnostic:
      'Ask "which digit is the tens and which is the ones?" and "fourteen is 1 ten and how many ones?" to check place-value understanding versus digit order.',
    reteach:
      'Build the number with a ten-rod and ones (14 = one ten + four ones), say it while writing tens-then-ones. Contrast 14 and 41 side by side with blocks so the place value, not just the digits, is clear.',
  },
  {
    id: "math-miscount-one-to-one",
    subject: "math",
    band: "k-2",
    title: "Miscounting (one-to-one correspondence)",
    signature:
      "When counting a set, skips an item, counts one twice, or says number words faster than touching items — gets a different total each time.",
    diagnostic:
      'Ask the child to count the set again slowly, touching each item once. If the total changes, the issue is one-to-one tracking, not the number words.',
    reteach:
      "Model touch-and-count: move or tap each item exactly once into a line, one number word per item. Have the child slide each counted object aside so counted and uncounted are separate. Repeat with small sets first.",
  },
]

/**
 * The misconceptions relevant to a subject + grade band (e.g. reading at k-2).
 */
export function misconceptionsFor(
  subject: MisconceptionSubject,
  band: GradeBand,
): Misconception[] {
  return MISCONCEPTIONS.filter((m) => m.subject === subject && m.band === band)
}

/**
 * Render a compact prompt section listing the relevant misconceptions for Nikki
 * to watch for, with the confirming diagnostic and the targeted re-teach move.
 * Returns null when there are none for this subject + band (so nothing is added).
 */
export function getMisconceptionGuidance(subject: string, band: GradeBand): string | null {
  if (subject !== "reading" && subject !== "math") return null
  const items = misconceptionsFor(subject, band)
  if (items.length === 0) return null

  const lines = items.map(
    (m) =>
      `- ${m.title}\n  • Signature: ${m.signature}\n  • Confirm with: ${m.diagnostic}\n  • Re-teach: ${m.reteach}`,
  )

  return `COMMON MISCONCEPTIONS TO WATCH FOR (high-frequency for this subject and age):
When the student's error matches one of these, don't just re-explain — first
confirm the cause with the diagnostic, then use the targeted re-teach move. Still
never give the final answer; guide them to fix the underlying idea themselves.

${lines.join("\n")}`
}
