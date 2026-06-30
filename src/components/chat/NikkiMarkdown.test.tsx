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
})
