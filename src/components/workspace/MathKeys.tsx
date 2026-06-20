import { useState } from 'react'

const MATHCATS = ['Basic', 'Algebra', 'Geometry', 'Trig', 'Calculus', 'Stats'] as const
type Cat = (typeof MATHCATS)[number]

const MATHSETS: Record<Cat, string[]> = {
  Basic: ['+', '−', '×', '÷', '=', '≠', '<', '>', '≤', '≥', '(', ')', '½', '¼', '¾', '%', '°'],
  Algebra: ['x', 'y', '^', '²', '³', '√', '∛', '±', '≈', '≠', '≤', '≥', 'π', '∞', '|', '→'],
  Geometry: ['°', '∠', '△', '⊥', '∥', '≅', '∼', 'π', '√', '↔', '⌒', '·'],
  Trig: ['sin', 'cos', 'tan', 'θ', '∠', '°', 'π', '√', '⁻¹', 'csc', 'sec', 'cot'],
  Calculus: ['∫', '∑', '∏', 'lim', '→', '∞', '∂', 'Δ', 'dx', 'dy', '′', '≈'],
  Stats: ['x̄', 'Σ', 'σ', 'σ²', 'μ', '√', '≤', '≥', '≠', '%', '!', '±'],
}

/** Tiered math keyboard. Inserts symbols at the textarea cursor via onInsert. */
export function MathKeys({ onInsert }: { onInsert: (symbol: string) => void }) {
  const [cat, setCat] = useState<Cat>('Basic')

  return (
    <>
      <div className="mathcats">
        {MATHCATS.map((c) => (
          <button key={c} type="button" className={`mcat ${cat === c ? 'on' : ''}`} onClick={() => setCat(c)}>
            {c}
          </button>
        ))}
      </div>
      <div className="mathbar">
        {MATHSETS[cat].map((sym, i) => (
          <button
            key={`${sym}-${i}`}
            type="button"
            // mousedown (not click) so the textarea keeps focus / selection
            onMouseDown={(e) => {
              e.preventDefault()
              onInsert(sym)
            }}
          >
            {sym}
          </button>
        ))}
      </div>
    </>
  )
}
