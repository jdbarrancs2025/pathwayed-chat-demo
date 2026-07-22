/**
 * Build a short context-biasing prompt for the transcription endpoint. Passed as
 * the model's `prompt`, it nudges recognition toward this lesson's vocabulary,
 * spells the child's name right, and — for MATH sessions — unconditionally tells
 * the model to write numbers as digits and to expect operation vocabulary. That
 * math bias is the single biggest defense against the observed failures: bare
 * numbers mis-heard ("9" -> "4", "32" -> "you too") and operation phrases mangled
 * ("subtract five from those" -> "Track five from those studs"). A further
 * problem-specific digit hint is added when the last question was numeric.
 *
 * Kept to a few sentences, well under ~200 tokens: the model only reads roughly
 * the last 224 tokens, and a long prompt crowds out the actual audio.
 */

/** A compact word list per subject. Plain, high-frequency lesson terms, not an
 *  exhaustive glossary — just enough to tip homophones the right way. */
const SUBJECT_VOCAB: Record<string, string> = {
  math: 'number, digit, count, add, plus, subtract, minus, take away, times, multiply, divide, equals, negative, positive, both sides, greater than, less than, sum, difference, product, quotient, fraction, numerator, denominator, decimal, place value, factor, multiple, equation, square root, angle, area, perimeter',
  reading: 'story, character, sentence, paragraph, letter, sound, vowel, syllable, rhyme, meaning, main idea, detail, author, title',
  writing: 'sentence, paragraph, capital letter, period, comma, spelling, noun, verb, adjective, topic, detail, edit, draft',
  science: 'plant, animal, energy, matter, solid, liquid, gas, force, motion, water cycle, experiment, observe, temperature, measure',
  sat: 'equation, expression, variable, function, evidence, passage, inference, main idea, context, estimate',
}

/** Subjects whose answers are usually a number or a short math phrase. */
const MATH_SUBJECTS = new Set(['math', 'sat'])

/** Heuristic: did the last Nikki turn ask for a numeric answer? Looks for inline
 *  math, digits, or arithmetic phrasing. Cheap and forgiving on purpose. */
function looksNumericQuestion(text: string): boolean {
  if (/\$[^$]+\$/.test(text)) return true // inline LaTeX math
  if (/\d/.test(text)) return true
  return /\b(how many|how much|what is|solve|sum|difference|product|add|subtract|multiply|divide|equals?|total|equal to|round|estimate)\b/i.test(
    text,
  )
}

/** Pull up to two distinct integers from the question to seed digit output, so the
 *  model's example numbers come from this very problem. Falls back to generic
 *  small numbers when the question has none. */
function exampleNumbers(text: string): string[] {
  const found = [...new Set(text.match(/\d[\d,]*/g) ?? [])].slice(0, 2)
  return found.length ? found : ['12', '250']
}

export function buildTranscriptionPrompt(opts: {
  childName?: string | null
  subject?: string | null
  focusLabel?: string | null
  lastNikkiText?: string | null
}): string {
  const parts: string[] = []
  const subject = opts.subject ?? ''
  const isMath = MATH_SUBJECTS.has(subject)

  // (a) Framing: who is speaking and what an answer tends to look like. For math,
  //     immediately follow with a strong, ALWAYS-ON style hint: spoken numbers are
  //     digits (not number-words) and operation vocabulary is expected. This is the
  //     main defense against the observed failures — bare "9"/"32" mis-heard, and
  //     "subtract five from those" heard as "Track five from those studs". Placed
  //     early so it survives the length cap even with a long vocab list.
  if (isMath) {
    parts.push(
      'A young student is answering a math tutoring question out loud. They say numbers and math operations aloud.',
    )
    parts.push(
      'Write spoken numbers as digits — for example 9, 32, 405 — never spelled out as words. Expect math operation words such as subtract, add, multiply, divide, equals, negative, and both sides — for example "subtract 5 from those" or "divide both sides by 3".',
    )
  } else if (subject) {
    parts.push(`A young student is answering a ${subject} tutoring question out loud.`)
  } else {
    parts.push('A young student is answering a tutoring question out loud.')
  }

  // (b) The child's name and this lesson's words.
  const name = opts.childName?.trim()
  if (name) parts.push(`The speaker is a child named ${name}.`)
  const topic = opts.focusLabel?.trim()
  if (topic) parts.push(`Today's lesson is ${topic}.`)
  const vocab = SUBJECT_VOCAB[subject]
  if (vocab) parts.push(`Common words: ${vocab}.`)

  // (c) When the last question asked for a number, say so explicitly and give
  //     digit examples drawn from the problem, so a short numeric utterance is
  //     transcribed as digits rather than hallucinated into words.
  const lastNikki = opts.lastNikkiText?.trim()
  if (isMath && lastNikki && looksNumericQuestion(lastNikki)) {
    parts.push(
      `The answer is most likely a number written as digits, such as ${exampleNumbers(lastNikki).join(' or ')}.`,
    )
  }

  return parts.join(' ')
}
