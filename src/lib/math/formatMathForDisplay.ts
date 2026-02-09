/**
 * Prepares assistant markdown so math renders reliably with Streamdown/KaTeX.
 * Repairs common delimiter issues while preserving non-math content.
 */
export function formatMathForDisplay(content: string): string {
  const withWrappedBareLatex = sanitizeBareLatexOutsideMath(content)
  const withNormalizedDelimiters = normalizeEscapedDelimiters(withWrappedBareLatex)
  return repairDollarBlockInternals(withNormalizedDelimiters)
}

function sanitizeBareLatexOutsideMath(content: string): string {
  // Existing math regions we should not touch while wrapping bare commands.
  const mathRegion = /(\$\$[\s\S]*?\$\$|\$[^$]*?\$|\\\[[\s\S]*?\\\]|\\\([\s\S]*?\\\))/g
  const parts = content.split(mathRegion)

  const standalone = [
    "times",
    "div",
    "pm",
    "leq",
    "geq",
    "angle",
    "triangle",
    "cong",
    "sim",
    "parallel",
    "perp",
    "cdot",
    "neq",
    "approx",
    "infty",
    "pi",
  ]

  const standaloneRe = new RegExp(`\\\\(${standalone.join("|")})(?![a-zA-Z])`, "g")
  const argRe = /\\(frac|sqrt)(\{[^}]*\}(?:\{[^}]*\})?)/g

  return parts
    .map((part) => {
      if (
        (part.startsWith("$") && part.endsWith("$")) ||
        (part.startsWith("\\(") && part.endsWith("\\)")) ||
        (part.startsWith("\\[") && part.endsWith("\\]"))
      ) {
        return part
      }

      let safePart = part
      safePart = safePart.replace(standaloneRe, (_match, cmd) => `$\\${cmd}$`)
      safePart = safePart.replace(argRe, (_match, cmd, args) => `$\\${cmd}${args}$`)
      return safePart
    })
    .join("")
}

function normalizeEscapedDelimiters(content: string): string {
  return content
    .replace(/\\\[([\s\S]*?)\\\]/g, (_match, inner: string) => `$$${cleanConvertedInnerMath(inner)}$$`)
    .replace(/\\\(([\s\S]*?)\\\)/g, (_match, inner: string) => `$${cleanConvertedInnerMath(inner)}$`)
}

function cleanConvertedInnerMath(inner: string): string {
  const trimmed = inner.trim()
  const withoutOuterDelimiters = unwrapFullDollarFence(trimmed)
  return removeUnescapedDollars(withoutOuterDelimiters)
}

function unwrapFullDollarFence(value: string): string {
  if (value.startsWith("$$") && value.endsWith("$$") && value.length >= 4) {
    return value.slice(2, -2).trim()
  }

  if (
    value.startsWith("$") &&
    value.endsWith("$") &&
    value.length >= 2 &&
    !value.startsWith("$$") &&
    !value.endsWith("$$")
  ) {
    return value.slice(1, -1).trim()
  }

  return value
}

function repairDollarBlockInternals(content: string): string {
  return content.replace(/\$\$([\s\S]*?)\$\$/g, (_match, inner: string) => `$$${removeUnescapedDollars(inner)}$$`)
}

function removeUnescapedDollars(value: string): string {
  let result = ""

  for (let index = 0; index < value.length; index += 1) {
    if (value[index] === "$" && !isEscaped(value, index)) {
      continue
    }
    result += value[index]
  }

  return result
}

function isEscaped(value: string, index: number): boolean {
  let backslashCount = 0
  for (let cursor = index - 1; cursor >= 0 && value[cursor] === "\\"; cursor -= 1) {
    backslashCount += 1
  }
  return backslashCount % 2 === 1
}
