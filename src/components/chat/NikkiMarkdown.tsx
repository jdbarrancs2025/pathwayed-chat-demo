import type { ComponentPropsWithoutRef } from 'react'
import { Streamdown } from 'streamdown'
import { createMathPlugin } from '@streamdown/math'
import katex from 'katex'
import { formatMathForDisplay } from '@/lib/math/formatMathForDisplay'

// We reuse remark-math (the delimiter PARSER) from @streamdown/math, but NOT its
// rehype-katex renderer. rehype-katex emits KaTeX's default html+MathML twin,
// and in our bubble that renders doubled ("1/2" -> "1221"). Instead we render
// the parsed math spans ourselves with HTML-ONLY KaTeX — the exact path the
// student bubble (MathText) uses — so there is no MathML twin to leak.
const remarkMath = createMathPlugin({ singleDollarTextMath: true }).remarkPlugin

function renderKatexHtml(tex: string, displayMode: boolean): string {
  try {
    // output: 'html' — HTML only, no MathML. Same call as MathText.tsx.
    return katex.renderToString(tex, { throwOnError: false, displayMode, output: 'html' })
  } catch {
    return ''
  }
}

// Render guard: a $...$ span whose content reads like prose (two or more ordinary
// spaced words and NO LaTeX command) is almost always the model mistakenly
// wrapping a phrase. KaTeX would render it in math mode, which collapses the
// spaces ("Which is bigger" -> "Whichisbigger"). Detect that and show the span as
// literal text instead. The LaTeX-command check keeps real math like
// `\text{apple pie}` or `\sin x \cos y` rendering normally.
function looksLikeProse(tex: string): boolean {
  return /[A-Za-z]{2,}\s+[A-Za-z]{2,}/.test(tex) && !/\\[a-zA-Z]/.test(tex)
}

// remark-math turns `$...$` / `$$...$$` into a <code> whose className includes
// `language-math` (and `math-display` for block math). Override the code
// component so math goes through HTML-only KaTeX and everything else stays code.
function CodeOrMath({ className, children }: ComponentPropsWithoutRef<'code'> & { node?: unknown }) {
  const cls = typeof className === 'string' ? className : ''
  if (cls.includes('language-math') || cls.includes('math-inline') || cls.includes('math-display')) {
    const tex = String(children ?? '')
    // Prose mistakenly wrapped in $...$ -> show as text (spaces preserved), not math.
    if (looksLikeProse(tex)) {
      return <span>{tex}</span>
    }
    const html = renderKatexHtml(tex, cls.includes('math-display'))
    // Fall back to the raw tex (not an empty node) if KaTeX can't parse it.
    return html ? (
      <span className="mathrender" dangerouslySetInnerHTML={{ __html: html }} />
    ) : (
      <span>{tex}</span>
    )
  }
  return <code className={className}>{children}</code>
}

// Kid-safe markdown subset + math. Raw HTML is not rendered (Streamdown is
// safe-by-default — no rehype-raw) and images are suppressed.
const components = {
  img: () => null,
  code: CodeOrMath,
}

/**
 * Renders an assistant (Nikki) chat message as markdown + KaTeX. Streamdown
 * handles the prose; math is rendered HTML-only via KaTeX (no MathML twin).
 * Scoped to Nikki's prose bubbles; styling lives in `.nikki-md` + the shared
 * `.msg .katex` rule so the bubble's fonts, colors, and spacing are preserved.
 */
export function NikkiMarkdown({ content }: { content: string }) {
  return (
    <div className="nikki-md">
      <Streamdown remarkPlugins={[remarkMath]} components={components}>
        {formatMathForDisplay(content)}
      </Streamdown>
    </div>
  )
}
