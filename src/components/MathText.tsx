import { Fragment, type ReactNode } from 'react'
import katex from 'katex'

// Match display ($$...$$) first, then inline ($...$). Inline excludes newlines
// and empty content to avoid catching stray dollar signs.
const MATH_RE = /\$\$([\s\S]+?)\$\$|\$([^$\n]+?)\$/g

function renderMath(tex: string, displayMode: boolean): string | null {
  try {
    return katex.renderToString(tex, { throwOnError: false, displayMode, output: 'html' })
  } catch {
    return null
  }
}

/**
 * Render chat text with LaTeX math: `$$...$$` as a block (display) and `$...$`
 * inline, via KaTeX (whose stylesheet is already loaded globally). Non-math text
 * is passed through unchanged so ordinary messages look exactly as before. Used
 * for both Nikki's and the student's bubbles so the student sees a real fraction
 * instead of raw LaTeX.
 */
export function MathText({ content }: { content: string }) {
  const out: ReactNode[] = []
  let last = 0
  let key = 0
  // matchAll iterates without mutating MATH_RE.lastIndex (it clones the regex
  // internally), so repeated renders stay independent and there's no shared state.
  for (const m of content.matchAll(MATH_RE)) {
    if (m.index > last) out.push(<Fragment key={key++}>{content.slice(last, m.index)}</Fragment>)
    const displayMode = m[1] !== undefined
    const tex = (m[1] ?? m[2] ?? '').trim()
    const html = renderMath(tex, displayMode)
    out.push(
      html ? (
        <span key={key++} className="mathrender" dangerouslySetInnerHTML={{ __html: html }} />
      ) : (
        <Fragment key={key++}>{m[0]}</Fragment>
      ),
    )
    last = m.index + m[0].length
  }
  if (last < content.length) out.push(<Fragment key={key++}>{content.slice(last)}</Fragment>)
  return <>{out}</>
}
