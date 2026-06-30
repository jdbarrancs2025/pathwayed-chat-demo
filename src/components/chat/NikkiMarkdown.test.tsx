import { describe, it, expect } from 'vitest'
import { renderToStaticMarkup } from 'react-dom/server'
import { NikkiMarkdown } from './NikkiMarkdown'

// Renders the real Streamdown pipeline to static HTML (no DOM env needed) to
// confirm Nikki's prose is shown as markdown rather than literal asterisks.
function render(content: string): string {
  return renderToStaticMarkup(<NikkiMarkdown content={content} />)
}

describe('NikkiMarkdown', () => {
  it('renders bold, line breaks, and a numbered list', () => {
    const html = render(
      [
        'Hold up **3 fingers**.',
        '',
        'Now lets count:',
        '',
        '1. First finger',
        '2. Second finger',
        '3. Third finger',
      ].join('\n'),
    )

    // Bold renders as a strong element (Streamdown marks it data-streamdown=
    // "strong"), not literal asterisks.
    expect(html).toContain('data-streamdown="strong"')
    expect(html).toContain('3 fingers')
    expect(html).not.toContain('**3 fingers**')

    // The paragraph break produces separate <p> blocks (line breaks display).
    expect(html.match(/<p[\s>]/g)?.length ?? 0).toBeGreaterThanOrEqual(2)

    // The numbered list renders as an ordered list with items.
    expect(html).toContain('<ol')
    expect(html).toContain('First finger')
    expect(html).toContain('Third finger')
  })

  it('renders italics', () => {
    const html = render('That is *really* important.')
    expect(html).toContain('<em>really</em>')
  })

  it('does not render images', () => {
    const html = render('![alt text](https://example.com/cat.png)')
    expect(html).not.toContain('<img')
  })

  it('does not render raw HTML', () => {
    const html = render('Be careful <script>alert(1)</script> here.')
    expect(html).not.toContain('<script>')
  })

  // Regression for the "1221" bug: math must render as HTML-only KaTeX (no
  // MathML twin), so it shows a single fraction, not a doubled/garbled one.
  it('renders inline fractions as html-only KaTeX with no MathML twin', () => {
    const html = render('So $\\frac{1}{2}$ is bigger than $\\frac{2}{4}$? Lets check.')

    // KaTeX html rendered…
    expect(html).toContain('class="katex"')
    // …but NO MathML twin (the source of the doubling).
    expect(html).not.toContain('<math')
    expect(html).not.toContain('katex-mathml')

    // Visible text (tags stripped) contains each fraction's digits exactly once
    // — "12"/"24", not "1221"/"2442".
    const text = html.replace(/<[^>]+>/g, '')
    expect(text).not.toContain('1221')
    expect(text).not.toContain('2442')

    // The raw LaTeX must not leak as literal text either.
    expect(html).not.toContain('\\frac')
  })

  it('renders bare \\frac (no $ delimiters) via formatMathForDisplay + KaTeX', () => {
    const html = render('Hold up \\frac{1}{2} of the pizza.')
    expect(html).toContain('class="katex"')
    expect(html).not.toContain('<math')
    expect(html).not.toContain('\\frac')
  })

  it('renders display math ($$...$$) as html-only KaTeX', () => {
    const html = render('Here it is:\n\n$$\\frac{3}{4}$$')
    expect(html).toContain('class="katex"')
    expect(html).not.toContain('<math')
  })

  // Render guard: a prose phrase wrapped in $...$ must keep its spaces, not be
  // KaTeX-rendered in math mode (which collapses them to "Whichisbigger").
  it('does not math-render a prose phrase wrapped in $...$ (keeps spaces)', () => {
    const html = render('$Which is bigger, 1/2 or 2/4$?')
    const text = html.replace(/<[^>]+>/g, '')
    expect(text).toContain('Which is bigger, 1/2 or 2/4')
    expect(text).not.toContain('Whichisbigger')
    expect(html).not.toContain('katex-error')
  })

  it('keeps a stray "$5" literal while still rendering the real fraction', () => {
    const html = render('It costs $5, and half is $\\frac{1}{2}$.')
    const text = html.replace(/<[^>]+>/g, '')
    expect(text).toContain('It costs $5, and half is') // $5 literal, spaces intact
    expect(html).toContain('class="katex"') // the \frac still renders
    expect(html).not.toContain('katex-error')
  })

  it('renders both spans on a line with two separate $\\frac$ and flanking text', () => {
    const html = render('Which is bigger, $\\frac{1}{2}$ or $\\frac{2}{4}$?')
    const text = html.replace(/<[^>]+>/g, '')
    expect(text).toContain('Which is bigger,')
    expect(text).toContain('or')
    expect(html).toContain('class="katex"')
    expect(html).not.toContain('katex-error')
    expect(html).not.toContain('\\frac') // no raw leak
  })

  // A real math span with spaces but LaTeX commands must still render as math.
  it('still renders legitimate math with spaces (\\sin x \\cos y)', () => {
    const html = render('Recall $\\sin x \\cos y$ here.')
    expect(html).toContain('class="katex"')
    expect(html).not.toContain('katex-error')
  })
})
