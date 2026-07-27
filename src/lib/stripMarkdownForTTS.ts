/**
 * Strips markdown and LaTeX from text for TTS, so Nikki speaks natural words
 * ("two over four", "divided by") and never reads symbols, LaTeX, markdown, or
 * emoji aloud. Runs on the raw message before it reaches TTS (Session.tsx
 * auto-speak + replay).
 */
export function stripMarkdownForTTS(text: string): string {
  let result = text

  // 1) Code — drop fenced blocks, keep inline code's text.
  result = result.replace(/```[\s\S]*?```/g, '')
  result = result.replace(/`([^`]+)`/g, '$1')

  // 2) Math — convert delimited spans first, then any UNDELIMITED LaTeX left in
  //    the prose, then remove whatever LaTeX remains so nothing like
  //    "backslash frac" is ever spoken.
  result = result.replace(/\$\$([\s\S]*?)\$\$/g, (_m, inner: string) => ` ${convertDelimitedMath(inner)} `)
  result = result.replace(/\\\[([\s\S]*?)\\\]/g, (_m, inner: string) => ` ${convertDelimitedMath(inner)} `)
  result = result.replace(/\$([^$\n]+?)\$/g, (_m, inner: string) => ` ${convertDelimitedMath(inner)} `)
  result = result.replace(/\\\(([\s\S]*?)\\\)/g, (_m, inner: string) => ` ${convertDelimitedMath(inner)} `)
  // Undelimited / bare LaTeX commands sitting in normal prose.
  result = speakMathCommands(result)
  result = stripLeftoverLatex(result)
  // Any leftover unpaired $ (e.g. a stray money sign) — don't read "dollar sign".
  result = result.replace(/\$/g, ' ')

  // 3) Markdown structure.
  result = result.replace(/!\[([^\]]*)\]\([^)]+\)/g, '$1') // images -> alt text
  result = result.replace(/\[([^\]]+)\]\([^)]+\)/g, '$1') // links -> text
  result = result.replace(/^#{1,6}\s+/gm, '') // headings
  result = result.replace(/\*\*\*(.+?)\*\*\*/g, '$1')
  result = result.replace(/\*\*(.+?)\*\*/g, '$1')
  result = result.replace(/\*(.+?)\*/g, '$1')
  result = result.replace(/___(.+?)___/g, '$1')
  result = result.replace(/__(.+?)__/g, '$1')
  result = result.replace(/_(.+?)_/g, '$1')
  result = result.replace(/~~(.+?)~~/g, '$1') // strikethrough
  result = result.replace(/^[-*_]{3,}\s*$/gm, '') // horizontal rules
  result = result.replace(/^>\s?/gm, '') // blockquote markers
  result = result.replace(/^[\s]*[-*+]\s+/gm, '') // unordered list markers
  result = result.replace(/^[\s]*\d+\.\s+/gm, '') // ordered list markers

  // 3b) Bare URLs. Markdown links are already reduced to their text above, so
  //     anything left is a raw address. Never read a URL out to a child.
  result = result.replace(/\bhttps?:\/\/\S+/gi, ' ')
  result = result.replace(/\bwww\.\S+/gi, ' ')

  // 3c) Plain-text fractions ("3/4" -> "three fourths"). Runs after URL removal
  //     so path separators are already gone.
  result = speakSimpleFractions(result)

  // 4) Stray math symbols (in case Unicode slipped past the LaTeX rules).
  result = result
    .replace(/×/g, ' times ')
    .replace(/÷/g, ' divided by ')
    .replace(/√/g, ' square root of ')
    .replace(/²/g, ' squared ')
    .replace(/³/g, ' cubed ')

  // 5) Emoji — strip pictographs, flags, variation selectors, ZWJ, keycaps.
  //    Alternation (not a character class) so combining code points are allowed.
  result = result.replace(
    /\p{Extended_Pictographic}|\p{Regional_Indicator}|\u{FE0F}|\u{200D}|\u{20E3}/gu,
    '',
  )

  // 6) Whitespace cleanup.
  result = result.replace(/[ \t]{2,}/g, ' ')
  result = result.replace(/ +([,.!?;:])/g, '$1') // no space before punctuation
  result = result.replace(/\n{3,}/g, '\n\n')
  return result.trim()
}

const NUMBER_WORDS = [
  'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine',
  'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen',
  'seventeen', 'eighteen', 'nineteen', 'twenty',
]

/** Denominator -> [singular, plural] spoken form. */
const DENOMINATOR_WORDS: Record<number, [string, string]> = {
  2: ['half', 'halves'],
  3: ['third', 'thirds'],
  4: ['fourth', 'fourths'],
  5: ['fifth', 'fifths'],
  6: ['sixth', 'sixths'],
  7: ['seventh', 'sevenths'],
  8: ['eighth', 'eighths'],
  9: ['ninth', 'ninths'],
  10: ['tenth', 'tenths'],
  11: ['eleventh', 'elevenths'],
  12: ['twelfth', 'twelfths'],
}

/**
 * Speak plain-text fractions the way a teacher would: "3/4" -> "three fourths",
 * "1/2" -> "one half". Deliberately conservative: it only fires on a bare
 * numerator/denominator pair that is NOT part of a longer run of digits and
 * slashes (so dates like 3/4/2026 and ratios like 100/200 are left alone), and
 * only for denominators with a clean spoken name. Anything it can't say safely
 * is left for the model to read as-is rather than guessed at.
 */
function speakSimpleFractions(s: string): string {
  return s.replace(/(?<![\w/.])(\d{1,2})\/(\d{1,2})(?![\w/.])/g, (match, rawNum: string, rawDen: string) => {
    const numerator = Number(rawNum)
    const denominator = Number(rawDen)
    const denomWord = DENOMINATOR_WORDS[denominator]
    const numWord = NUMBER_WORDS[numerator]
    if (!denomWord || !numWord || numerator === 0) return match
    return `${numWord} ${numerator === 1 ? denomWord[0] : denomWord[1]}`
  })
}

/**
 * Convert LaTeX commands to spoken words. Safe to run on bare prose (it only
 * touches recognized commands and ^ powers; it does NOT touch markdown _italics_
 * or stray punctuation).
 */
function speakMathCommands(s: string): string {
  return (
    s
      // \frac{a}{b} / \dfrac{a}{b} -> "a over b"
      .replace(/\\d?frac\s*\{([^{}]*)\}\s*\{([^{}]*)\}/g, ' $1 over $2 ')
      // \sqrt[n]{x} -> "n root of x"; \sqrt{x} -> "square root of x"
      .replace(/\\sqrt\s*\[([^\]]*)\]\s*\{([^{}]*)\}/g, ' $1 root of $2 ')
      .replace(/\\sqrt\s*\{([^{}]*)\}/g, ' square root of $1 ')
      .replace(/\\times/g, ' times ')
      .replace(/\\div/g, ' divided by ')
      .replace(/\\cdot/g, ' times ')
      .replace(/\\pm/g, ' plus or minus ')
      .replace(/\\leq/g, ' is less than or equal to ')
      .replace(/\\geq/g, ' is greater than or equal to ')
      .replace(/\\neq/g, ' is not equal to ')
      .replace(/\\approx/g, ' is approximately ')
      .replace(/\\pi\b/g, ' pi ')
      .replace(/\\infty/g, ' infinity ')
      // powers: ^{...} and ^x / ^2
      .replace(/\^\{([^{}]*)\}/g, ' to the power of $1 ')
      .replace(/\^(\w+)/g, ' to the power of $1 ')
  )
}

/** Convert the inside of a delimited math span to speech (subscripts too); fall
 *  back to a neutral phrase if it's too complex to speak cleanly. */
function convertDelimitedMath(inner: string): string {
  let s = speakMathCommands(inner)
  s = s.replace(/_\{([^{}]*)\}/g, ' sub $1 ').replace(/_(\w+)/g, ' sub $1 ')
  s = s.replace(/\\[,;!]|\\ /g, ' ') // LaTeX spacing commands
  // Still has backslash commands we don't speak -> neutral phrase (never read the LaTeX).
  if (/\\[a-zA-Z]/.test(s)) return 'math expression'
  return s
    .replace(/[{}]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

/** Remove any LaTeX still left in bare prose so it's never spoken literally. */
function stripLeftoverLatex(s: string): string {
  return s
    .replace(/\\([%$&#_{}~^])/g, '$1') // \% \$ etc -> the literal character
    .replace(/\\[a-zA-Z]+\*?/g, ' ') // remaining \command -> removed
    .replace(/[{}]/g, ' ') // stray braces
    .replace(/\\/g, ' ') // any lone backslash
}
