import { Streamdown } from 'streamdown'
import { createMathPlugin } from '@streamdown/math'
import { formatMathForDisplay } from '@/lib/math/formatMathForDisplay'

// Render Nikki's prose with single-dollar inline math support so `$...$` and
// `$$...$$` still go through KaTeX (the student's bubbles use MathText for the
// same effect).
const mathPlugin = createMathPlugin({
  singleDollarTextMath: true,
})

// Kid-safe markdown subset: bold, italics, line breaks, lists, paragraphs, and
// math. Raw HTML is not rendered (Streamdown is safe-by-default — no rehype-raw)
// and images are suppressed so Nikki can never surface external/inline images.
const components = {
  img: () => null,
}

/**
 * Renders an assistant (Nikki) chat message as markdown + KaTeX. Scoped to
 * Nikki's prose bubbles only; the styling lives in `.nikki-md` (app-screens.css)
 * so the bubble's fonts, colors, and spacing are preserved.
 */
export function NikkiMarkdown({ content }: { content: string }) {
  return (
    <div className="nikki-md">
      <Streamdown plugins={{ math: mathPlugin }} components={components}>
        {formatMathForDisplay(content)}
      </Streamdown>
    </div>
  )
}
