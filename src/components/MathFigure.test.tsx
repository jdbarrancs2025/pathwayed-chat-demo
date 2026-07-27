import { describe, it, expect } from 'vitest'
import { renderToStaticMarkup } from 'react-dom/server'
import { MathFigure } from './MathFigure'

// Renders to static HTML (no DOM env needed). These guard the sizing contract
// that makes diagrams scale with the question card: a viewBox and no fixed
// width/height. A fixed width attribute is exactly what made these render at
// 130px to 250px regardless of how much room the card had.
function render(stem: string): string {
  return renderToStaticMarkup(<MathFigure stem={stem} />)
}

const AREA = 'A rectangle is 3 units long and 2 units wide. What is its area?'
const BIG_AREA = 'A rectangle is 12 units long and 5 units wide. What is its area?'
const VOLUME = 'A box is 2 units long, 2 units wide, and 2 units tall. What is its volume?'
const CUBE = 'A cube has edges that are all 4 units. What is its volume?'
const SHAPE = 'How many sides does a hexagon have?'

const VISUAL_STEMS = [AREA, BIG_AREA, VOLUME, CUBE, SHAPE]

/** Pull the viewBox width/height out of the first svg tag. */
function viewBox(html: string): { w: number; h: number } {
  const m = html.match(/viewBox="0 0 ([\d.]+) ([\d.]+)"/)
  if (!m) throw new Error(`no viewBox in: ${html.slice(0, 200)}`)
  return { w: parseFloat(m[1]), h: parseFloat(m[2]) }
}

describe('MathFigure sizing contract', () => {
  it('emits a viewBox for every recognized visual stem', () => {
    for (const stem of VISUAL_STEMS) {
      expect(render(stem)).toContain('viewBox="0 0 ')
    }
  })

  it('never emits a fixed width or height on the svg', () => {
    for (const stem of VISUAL_STEMS) {
      const html = render(stem)
      // Attributes on the <svg> element itself. rect/line children legitimately
      // carry width/height, so only the opening svg tag is checked.
      const svgTag = html.slice(html.indexOf('<svg'), html.indexOf('>', html.indexOf('<svg')) + 1)
      expect(svgTag).not.toMatch(/\swidth="/)
      expect(svgTag).not.toMatch(/\sheight="/)
    }
  })

  it('wraps every figure in the shared sizing wrapper with a max width', () => {
    for (const stem of VISUAL_STEMS) {
      const html = render(stem)
      expect(html).toContain('class="qfig"')
      expect(html).toMatch(/max-width:\s*\d+px/)
    }
  })

  it('gives a small rectangle the same figure width as a large one', () => {
    // The old code derived px-per-unit from the numbers in the stem, so a 3x2
    // rendered at roughly half the width of a 12x5. Both should now lay out
    // against the same design span and differ only in aspect ratio.
    const small = viewBox(render(AREA))
    const big = viewBox(render(BIG_AREA))
    expect(small.w).toBeCloseTo(big.w, 0)
    // The 3x2 is squatter than the 12x5, so it is the taller of the two.
    expect(small.h).toBeGreaterThan(big.h)
  })

  it('keeps every figure within a sane aspect ratio', () => {
    for (const stem of VISUAL_STEMS) {
      const { w, h } = viewBox(stem === SHAPE ? render(SHAPE) : render(stem))
      expect(w / h).toBeGreaterThan(0.25)
      expect(w / h).toBeLessThan(8)
    }
  })

  it('renders nothing for a stem with no recognized figure', () => {
    expect(render('What is 7 plus 5?')).toBe('')
    expect(render('Which word rhymes with cat?')).toBe('')
  })
})
