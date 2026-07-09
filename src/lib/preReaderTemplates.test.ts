import { describe, it, expect } from 'vitest'
import { PRE_READER_SKILLS, KID_IMAGES, buildPreReaderItem, seedForSlot } from './preReaderTemplates'

const IMAGES = new Set<string>(KID_IMAGES)

/** The counting quantity a tile represents (numeral value, or group size). */
function quantityOf(tile: { kind: string; value?: string; count?: number }): number {
  return tile.kind === 'number' ? Number(tile.value) : (tile.count ?? NaN)
}

describe.each(PRE_READER_SKILLS.map((s) => [s.slug, s] as const))('%s — pre-reader (audio-picture) guarantees', (_slug, skill) => {
  it('is tagged Kindergarten (K), the k-2 band, and the audio_picture render mode', () => {
    expect(['math', 'reading']).toContain(skill.subject)
    expect(skill.renderMode).toBe('audio_picture')
    expect(skill.ccssGrade).toBe('K')
    expect(skill.ccssGradeNum).toBe(0)
    // Counting (K.CC / math) or letter sounds (RF.K / reading foundational).
    expect(skill.ccssCode).toMatch(/^CCSS\.(MATH\.CONTENT\.K\.CC|ELA-LITERACY\.RF\.K)/)
    expect(skill.gradeBand).toBe('k-2')
    expect(skill.items.length).toBeGreaterThanOrEqual(4)
  })

  it('each item: a spoken prompt, a warm solution, 2–4 kind tiles, exactly one correct, valid tiles', () => {
    const slots = new Set<number>()
    for (const item of skill.items) {
      slots.add(item.slot)
      expect(['easy', 'medium', 'hard']).toContain(item.difficulty)
      expect(item.stem.length).toBeGreaterThan(0) // spoken prompt
      expect(item.solution.length).toBeGreaterThan(0) // warm feedback (no token model in K-2)

      expect(item.choices.length).toBeGreaterThanOrEqual(2)
      expect(item.choices.length).toBeLessThanOrEqual(4)
      expect(new Set(item.choices.map((c) => c.text)).size).toBe(item.choices.length) // distinct labels
      const correct = item.choices.filter((c) => c.is_correct)
      expect(correct).toHaveLength(1)

      // No misconception tokens on K-2 items (warm-feedback model).
      for (const c of item.choices) expect('misconception_token' in c).toBe(false)

      // Every answer is a well-formed TILE: a numeral, a letter, or a group of
      // curated icons.
      for (const c of item.choices) {
        if (c.tile.kind === 'number' || c.tile.kind === 'letter') {
          expect(c.tile.value.length).toBeGreaterThan(0)
        } else {
          expect(IMAGES.has(c.tile.image)).toBe(true)
          expect(c.tile.count).toBeGreaterThanOrEqual(1)
          expect(c.tile.count).toBeLessThanOrEqual(12)
        }
      }

      // KIND distractors, per tile kind:
      const correctTile = correct[0].tile
      if (correctTile.kind === 'letter') {
        // Phonics: distinct single letters, none equal to the answer (clearly
        // different letters/sounds — the visible review checks phonetic kindness).
        const vals = item.choices.map((c) => (c.tile.kind === 'letter' ? c.tile.value : ''))
        expect(new Set(vals).size).toBe(vals.length)
        for (const c of item.choices) {
          if (c.is_correct) continue
          expect(c.tile.kind).toBe('letter')
          expect(c.tile.kind === 'letter' && c.tile.value).not.toBe(correctTile.value)
        }
      } else {
        // Counting: distinct, positive quantities, each off-by 1..3 (never tricky).
        const correctQty = quantityOf(correctTile)
        const qtys = item.choices.map((c) => quantityOf(c.tile))
        expect(new Set(qtys).size).toBe(qtys.length)
        for (const c of item.choices) {
          if (c.is_correct) continue
          const d = Math.abs(quantityOf(c.tile) - correctQty)
          expect(d).toBeGreaterThanOrEqual(1)
          expect(d).toBeLessThanOrEqual(3)
        }
      }

      if (item.prompt) {
        expect(IMAGES.has(item.prompt.image)).toBe(true)
        expect(item.prompt.count).toBeGreaterThanOrEqual(1)
        expect(item.prompt.count).toBeLessThanOrEqual(12)
      }
    }
    expect(slots.size).toBe(skill.items.length) // unique slots
  })

  it('built items are deterministic, put correct_answer on the correct tile, and vary its position', () => {
    const positions = new Set<number>()
    for (const item of skill.items) {
      const seed = seedForSlot(item.slot)
      const a = buildPreReaderItem(item, seed)
      const b = buildPreReaderItem(item, seed)
      expect(JSON.stringify(a)).toBe(JSON.stringify(b))
      const correct = a.choices.find((c) => c.is_correct)!
      expect(a.correct_answer).toBe(correct.text)
      positions.add(a.choices.findIndex((c) => c.is_correct))
    }
    expect(positions.size).toBeGreaterThanOrEqual(2)
  })
})
