/**
 * Build a short context-biasing prompt for the transcription endpoint. Passed as
 * the model's `prompt`, it nudges recognition toward this lesson's vocabulary and
 * spells the child's name right, which matters most for the short, soft, disfluent
 * speech young kids produce. Kept to a few sentences: the model only reads roughly
 * the last 224 tokens, and a long prompt crowds out the actual audio context.
 */

/** A compact word list per subject. Plain, high-frequency lesson terms, not an
 *  exhaustive glossary — just enough to tip homophones the right way. */
const SUBJECT_VOCAB: Record<string, string> = {
  math: 'number, count, add, subtract, plus, minus, times, divide, equals, sum, difference, product, fraction, numerator, denominator, decimal, place value, factor, multiple, equation, angle, area, perimeter',
  reading: 'story, character, sentence, paragraph, letter, sound, vowel, syllable, rhyme, meaning, main idea, detail, author, title',
  writing: 'sentence, paragraph, capital letter, period, comma, spelling, noun, verb, adjective, topic, detail, edit, draft',
  science: 'plant, animal, energy, matter, solid, liquid, gas, force, motion, water cycle, experiment, observe, temperature, measure',
  sat: 'equation, expression, variable, function, evidence, passage, inference, main idea, context, estimate',
}

export function buildTranscriptionPrompt(opts: {
  childName?: string | null
  subject?: string | null
  focusLabel?: string | null
}): string {
  const parts: string[] = []

  const name = opts.childName?.trim()
  if (name) parts.push(`The speaker is a child named ${name}.`)

  const topic = opts.focusLabel?.trim()
  if (topic) parts.push(`Today's lesson is ${topic}.`)

  const vocab = opts.subject ? SUBJECT_VOCAB[opts.subject] : undefined
  if (vocab) parts.push(`Common words: ${vocab}.`)

  return parts.join(' ')
}
