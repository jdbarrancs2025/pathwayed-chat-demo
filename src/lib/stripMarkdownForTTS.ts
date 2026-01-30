/**
 * Strips markdown and LaTeX formatting from text for TTS consumption.
 * Converts complex math to spoken placeholders and removes formatting syntax.
 */
export function stripMarkdownForTTS(text: string): string {
  let result = text

  // Remove code blocks entirely (``` ... ```)
  result = result.replace(/```[\s\S]*?```/g, '')

  // Remove inline code (`code`)
  result = result.replace(/`([^`]+)`/g, '$1')

  // Replace display math ($$...$$ or \[...\]) with spoken placeholder
  result = result.replace(/\$\$[\s\S]*?\$\$/g, '(math expression)')
  result = result.replace(/\\\[[\s\S]*?\\\]/g, '(math expression)')

  // Handle inline math ($...$) — try to speak simple expressions
  result = result.replace(/\$([^$]+)\$/g, (_match, inner: string) => {
    return convertSimpleMath(inner)
  })

  // Handle \(...\) inline math
  result = result.replace(/\\\(([^)]+)\\\)/g, (_match, inner: string) => {
    return convertSimpleMath(inner)
  })

  // Remove images ![alt](url)
  result = result.replace(/!\[([^\]]*)\]\([^)]+\)/g, '$1')

  // Convert links [text](url) → just the text
  result = result.replace(/\[([^\]]+)\]\([^)]+\)/g, '$1')

  // Remove headings (# Heading → Heading)
  result = result.replace(/^#{1,6}\s+/gm, '')

  // Remove bold/italic markers
  result = result.replace(/\*\*\*(.+?)\*\*\*/g, '$1')
  result = result.replace(/\*\*(.+?)\*\*/g, '$1')
  result = result.replace(/\*(.+?)\*/g, '$1')
  result = result.replace(/___(.+?)___/g, '$1')
  result = result.replace(/__(.+?)__/g, '$1')
  result = result.replace(/_(.+?)_/g, '$1')

  // Remove strikethrough
  result = result.replace(/~~(.+?)~~/g, '$1')

  // Remove horizontal rules
  result = result.replace(/^[-*_]{3,}\s*$/gm, '')

  // Remove blockquote markers
  result = result.replace(/^>\s?/gm, '')

  // Remove unordered list markers (- or * at start of line)
  result = result.replace(/^[\s]*[-*+]\s+/gm, '')

  // Remove ordered list markers (1. 2. etc.)
  result = result.replace(/^[\s]*\d+\.\s+/gm, '')

  // Collapse multiple newlines into one
  result = result.replace(/\n{3,}/g, '\n\n')

  // Trim whitespace
  result = result.trim()

  return result
}

/**
 * Attempts to convert simple LaTeX math into spoken text.
 * Falls back to "(math expression)" for complex expressions.
 */
function convertSimpleMath(latex: string): string {
  let spoken = latex.trim()

  // Replace common LaTeX commands with spoken equivalents
  spoken = spoken.replace(/\\frac\{([^}]+)\}\{([^}]+)\}/g, '$1 over $2')
  spoken = spoken.replace(/\\sqrt\{([^}]+)\}/g, 'square root of $1')
  spoken = spoken.replace(/\\times/g, ' times ')
  spoken = spoken.replace(/\\div/g, ' divided by ')
  spoken = spoken.replace(/\\cdot/g, ' times ')
  spoken = spoken.replace(/\\pm/g, ' plus or minus ')
  spoken = spoken.replace(/\\leq/g, ' is less than or equal to ')
  spoken = spoken.replace(/\\geq/g, ' is greater than or equal to ')
  spoken = spoken.replace(/\\lt/g, ' is less than ')
  spoken = spoken.replace(/\\gt/g, ' is greater than ')
  spoken = spoken.replace(/\\neq/g, ' is not equal to ')
  spoken = spoken.replace(/\\approx/g, ' is approximately ')
  spoken = spoken.replace(/\\pi/g, 'pi')
  spoken = spoken.replace(/\\infty/g, 'infinity')
  spoken = spoken.replace(/\^{([^}]+)}/g, ' to the power of $1')
  spoken = spoken.replace(/\^(\d)/g, ' to the power of $1')
  spoken = spoken.replace(/_{([^}]+)}/g, ' sub $1')

  // If there are still backslash commands remaining, it's too complex
  if (/\\[a-zA-Z]/.test(spoken)) {
    return '(math expression)'
  }

  // Clean up extra spaces
  spoken = spoken.replace(/\s+/g, ' ').trim()

  return spoken
}
