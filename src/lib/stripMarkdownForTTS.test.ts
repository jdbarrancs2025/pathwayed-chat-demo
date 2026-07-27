import { describe, it, expect } from 'vitest'
import { stripMarkdownForTTS } from './stripMarkdownForTTS'

// Helper: normalize internal whitespace so assertions focus on the words spoken.
const spoken = (s: string) => stripMarkdownForTTS(s).replace(/\s+/g, ' ').trim()

describe('stripMarkdownForTTS — LaTeX to speech', () => {
  it('converts a delimited fraction to "a over b"', () => {
    expect(spoken('It is $\\frac{2}{4}$ of the pie.')).toBe('It is 2 over 4 of the pie.')
  })

  it('converts a BARE (undelimited) fraction to "a over b"', () => {
    expect(spoken('Hold up \\frac{1}{2} now.')).toBe('Hold up 1 over 2 now.')
  })

  it('converts \\times and \\div to words (delimited and bare)', () => {
    expect(spoken('$3 \\times 4$')).toBe('3 times 4')
    expect(spoken('compute 12 \\div 3 please')).toBe('compute 12 divided by 3 please')
  })

  it('converts powers to "to the power of"', () => {
    expect(spoken('$x^2$ and 2^3')).toBe('x to the power of 2 and 2 to the power of 3')
  })

  it('converts \\sqrt to "square root of"', () => {
    expect(spoken('$\\sqrt{16}$ is 4')).toBe('square root of 16 is 4')
  })

  it('never speaks a leftover backslash-command ("backslash frac")', () => {
    const out = stripMarkdownForTTS('Look at \\beta and \\frac{1}{2}.')
    expect(out).not.toMatch(/\\/) // no backslashes survive
    expect(out.toLowerCase()).not.toContain('backslash')
    expect(out.toLowerCase()).not.toContain('beta') // unknown command stripped
    expect(out).toContain('1 over 2')
  })

  it('converts stray Unicode math symbols', () => {
    expect(spoken('5 × 2 ÷ 1')).toBe('5 times 2 divided by 1')
  })
})

describe('stripMarkdownForTTS — emoji', () => {
  it('strips emoji entirely', () => {
    const out = stripMarkdownForTTS('Great job! 👍🌱 You got it 😊')
    expect(out).not.toMatch(/\p{Extended_Pictographic}/u)
    expect(out).toContain('Great job!')
    expect(out).toContain('You got it')
  })
})

describe('stripMarkdownForTTS — markdown', () => {
  it('strips bold/italic, headings, and list markers', () => {
    expect(spoken('**bold** and *italic*')).toBe('bold and italic')
    expect(spoken('### Heading')).toBe('Heading')
    expect(spoken('- one\n- two')).toBe('one two')
    expect(spoken('1. first\n2. second')).toBe('first second')
  })
})

describe('stripMarkdownForTTS: URLs', () => {
  it('removes bare URLs so they are never read aloud', () => {
    expect(spoken('Go to https://example.com/page?a=1 now')).toBe('Go to now')
    expect(spoken('See www.example.com today')).toBe('See today')
  })

  it('keeps the visible text of a markdown link', () => {
    expect(spoken('Read [this page](https://example.com) first')).toBe('Read this page first')
  })
})

describe('stripMarkdownForTTS: plain-text fractions', () => {
  it('speaks simple fractions as words', () => {
    expect(spoken('Shade 3/4 of it')).toBe('Shade three fourths of it')
    expect(spoken('That is 1/2 exactly')).toBe('That is one half exactly')
    expect(spoken('Add 1/3 and 2/3')).toBe('Add one third and two thirds')
  })

  it('leaves dates and out-of-range denominators alone', () => {
    expect(spoken('due 3/4/2026')).toBe('due 3/4/2026')
    expect(spoken('scored 40/50 points')).toBe('scored 40/50 points')
  })

  it('is idempotent on already-converted text', () => {
    expect(spoken(stripMarkdownForTTS('Shade 3/4 of it'))).toBe('Shade three fourths of it')
  })
})

describe('stripMarkdownForTTS — combined realistic message', () => {
  it('speaks clean words, no emoji/LaTeX/symbols', () => {
    const out = stripMarkdownForTTS('Nice! 👍 $\\frac{2}{4}$ is the same as $\\frac{1}{2}$.')
    expect(out).not.toMatch(/[\\${}]/)
    expect(out).not.toMatch(/\p{Extended_Pictographic}/u)
    expect(spoken(out)).toBe('Nice! 2 over 4 is the same as 1 over 2.')
  })
})
