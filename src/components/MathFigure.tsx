// A simple, hand-authored inline-SVG diagram for inherently visual elementary
// math questions (area, volume, shape identification) that would otherwise be
// text-only. It reads the figure straight out of the question stem (the
// dimensions and shape names are already written there) so no data, seed, or
// migration change is needed. Same philosophy as KidIcon: all SVG is authored
// JSX, no external images and no generation. Returns null for any stem that
// isn't one of the recognized visual patterns, so non-visual skills render
// exactly as before and the answer format is never touched.
//
// SIZING: every figure below is laid out against a constant design span (see
// DESIGN_SPAN) and emits a viewBox with NO width/height attributes. QuestionFigure
// scales it to the question card. Because the span is constant, one user unit is
// roughly one CSS px at phone size, so stroke widths and font sizes written here
// read as real px at the smallest size the figure is ever shown at, and grow
// proportionally from there.

import { QuestionFigure } from '@/components/QuestionFigure'

const NAVY = '#1e3a6e'
const NAVY_FILL = '#e8eef7'
const GRID = '#b9c8e0'
const ORANGE = '#e85a24'
const ORANGE_FILL = '#fdece4'

// The long side of a figure's content spans this many user units. Keeping it
// constant (rather than deriving px-per-unit from the numbers in the stem) is
// what stopped a 3x2 rectangle from rendering at a third the size of an 8x5 one.
const DESIGN_SPAN = 300

/** Per-figure render ceilings in CSS px, chosen so a figure lands in the 60-80%
 *  band on a tablet card and stays there on desktop rather than inflating with
 *  the viewport. Dense grids earn more room than a single outline shape, which
 *  only has to be big enough to count the sides of: `shape` is deliberately the
 *  tightest cap, since a 500px hexagon is not more countable than a 400px one. */
const MAX_W = {
  grid: 560,
  volume: 500,
  shape: 400,
} as const

/** Strip LaTeX `$` wrappers (area stems write numbers as `$8$`) and collapse
 *  whitespace so the matchers can read plain digits and words. */
function normalize(stem: string): string {
  return stem.replace(/\$/g, ' ').replace(/\s+/g, ' ').trim()
}

interface Figure {
  node: React.ReactNode
  maxWidth: number
}

/** A rectangle labeled with its dimensions, drawn as an L x W grid of unit
 *  squares so "square units" is visible. The longer side always spans
 *  DESIGN_SPAN units, so a small rectangle gets large cells rather than a small
 *  figure; the labels always show the real numbers from the stem. */
function RectangleArea(L: number, W: number): Figure {
  const cell = DESIGN_SPAN / Math.max(L, W)
  const w = L * cell
  const h = W * cell
  const padX = 42
  const padY = 36
  const vbW = w + padX * 2
  const vbH = h + padY * 2
  const cols = Array.from({ length: L + 1 }, (_, i) => i)
  const rows = Array.from({ length: W + 1 }, (_, j) => j)
  return {
    maxWidth: MAX_W.grid,
    node: (
      <svg viewBox={`0 0 ${vbW} ${vbH}`} role="img" aria-hidden="true" shapeRendering="geometricPrecision">
        <rect x={padX} y={padY} width={w} height={h} fill={NAVY_FILL} stroke={NAVY} strokeWidth={3} />
        {/* Unit grid. These are all axis aligned, so crispEdges snaps them to
            whole pixels and keeps them from smearing into faint grey at scale. */}
        <g shapeRendering="crispEdges">
          {cols.map((i) => (
            <line
              key={`c${i}`}
              x1={padX + i * cell}
              y1={padY}
              x2={padX + i * cell}
              y2={padY + h}
              stroke={GRID}
              strokeWidth={1.25}
            />
          ))}
          {rows.map((j) => (
            <line
              key={`r${j}`}
              x1={padX}
              y1={padY + j * cell}
              x2={padX + w}
              y2={padY + j * cell}
              stroke={GRID}
              strokeWidth={1.25}
            />
          ))}
        </g>
        <rect x={padX} y={padY} width={w} height={h} fill="none" stroke={NAVY} strokeWidth={3} />
        <text x={padX + w / 2} y={padY + h + 24} textAnchor="middle" fontSize={16} fontWeight={700} fill={NAVY}>
          {L} units
        </text>
        <text
          x={padX - 12}
          y={padY + h / 2}
          textAnchor="middle"
          fontSize={16}
          fontWeight={700}
          fill={NAVY}
          transform={`rotate(-90 ${padX - 12} ${padY + h / 2})`}
        >
          {W} units
        </text>
      </svg>
    ),
  }
}

/** A rectangular prism of unit cubes in cabinet projection, with unit-grid
 *  lines on the three visible faces and L/W/H labels: the standard textbook
 *  volume figure. Bounded on both axes so a tall box stays as legible as a
 *  wide one. */
function VolumeBox(L: number, W: number, H: number): Figure {
  const DX = Math.cos(Math.PI / 6) * 0.5 // horizontal offset factor per depth unit
  const DY = Math.sin(Math.PI / 6) * 0.5 // vertical (upward) offset factor per depth unit
  // Fit the projected figure inside the design span on both axes.
  const u = Math.min(DESIGN_SPAN / (L + W * DX), (DESIGN_SPAN * 0.85) / (H + W * DY))
  const dxu = DX * u
  const dyu = DY * u
  const pad = 34
  const boardH = H * u + W * dyu
  // Project cube coords (x right 0..L, y up 0..H, z depth 0..W) to screen.
  const px = (x: number, z: number) => pad + x * u + z * dxu
  const py = (y: number, z: number) => pad + boardH - (y * u + z * dyu)
  const vbW = L * u + W * dxu + pad * 2
  const vbH = boardH + pad * 2

  const face = (pts: Array<[number, number, number]>, fill: string) => (
    <polygon points={pts.map(([x, y, z]) => `${px(x, z)},${py(y, z)}`).join(' ')} fill={fill} stroke={NAVY} strokeWidth={2.5} />
  )
  const line = (a: [number, number, number], b: [number, number, number], key: string) => (
    <line key={key} x1={px(a[0], a[2])} y1={py(a[1], a[2])} x2={px(b[0], b[2])} y2={py(b[1], b[2])} stroke={GRID} strokeWidth={1.1} />
  )
  const range = (n: number) => Array.from({ length: n + 1 }, (_, i) => i)

  return {
    maxWidth: MAX_W.volume,
    node: (
      // The depth grid lines are diagonal, so this figure stays on
      // geometricPrecision throughout rather than snapping to pixels.
      <svg viewBox={`0 0 ${vbW} ${vbH}`} role="img" aria-hidden="true" shapeRendering="geometricPrecision">
        {/* top face (y = H) */}
        {face([[0, H, 0], [L, H, 0], [L, H, W], [0, H, W]], '#dfe7f5')}
        {range(L).map((i) => line([i, H, 0], [i, H, W], `tI${i}`))}
        {range(W).map((k) => line([0, H, k], [L, H, k], `tK${k}`))}
        {/* right face (x = L) */}
        {face([[L, 0, 0], [L, H, 0], [L, H, W], [L, 0, W]], '#cdd9ee')}
        {range(H).map((j) => line([L, j, 0], [L, j, W], `sJ${j}`))}
        {range(W).map((k) => line([L, 0, k], [L, H, k], `sK${k}`))}
        {/* front face (z = 0) */}
        {face([[0, 0, 0], [L, 0, 0], [L, H, 0], [0, H, 0]], NAVY_FILL)}
        {range(L).map((i) => line([i, 0, 0], [i, H, 0], `fI${i}`))}
        {range(H).map((j) => line([0, j, 0], [L, j, 0], `fJ${j}`))}
        {/* dimension labels */}
        <text x={px(L / 2, 0)} y={py(0, 0) + 22} textAnchor="middle" fontSize={16} fontWeight={700} fill={NAVY}>
          {L}
        </text>
        <text x={px(L, 0) + 16} y={py(H / 2, 0)} textAnchor="middle" fontSize={16} fontWeight={700} fill={NAVY}>
          {H}
        </text>
        <text x={px(L / 2, W) - 2} y={py(H, W / 2) - 8} textAnchor="middle" fontSize={16} fontWeight={700} fill={NAVY}>
          {W}
        </text>
      </svg>
    ),
  }
}

// Named shapes to number of sides (regular polygon). Special cases handled below.
const POLY_SIDES: Record<string, number> = {
  triangle: 3,
  quadrilateral: 4,
  pentagon: 5,
  hexagon: 6,
  heptagon: 7,
  septagon: 7,
  octagon: 8,
}

/** A single named shape, so the child can see and count it. */
function ShapeFigure(name: string): Figure | null {
  const size = DESIGN_SPAN
  const c = size / 2
  const r = size * 0.4
  const common = { fill: ORANGE_FILL, stroke: ORANGE, strokeWidth: 6, strokeLinejoin: 'round' as const }
  let body: React.ReactNode
  if (name === 'circle') {
    body = <circle cx={c} cy={c} r={r} {...common} />
  } else if (name === 'square') {
    const s = r * 1.5
    body = <rect x={c - s / 2} y={c - s / 2} width={s} height={s} rx={4} {...common} />
  } else if (name === 'rectangle') {
    const rw = r * 2
    const rh = r * 1.2
    body = <rect x={c - rw / 2} y={c - rh / 2} width={rw} height={rh} rx={4} {...common} />
  } else {
    const n = POLY_SIDES[name]
    if (!n) return null
    // Flat-bottom regular polygon.
    const offset = Math.PI / 2 + Math.PI / n
    const pts = Array.from({ length: n }, (_, i) => {
      const a = offset + (i * 2 * Math.PI) / n
      return `${(c + r * Math.cos(a)).toFixed(1)},${(c + r * Math.sin(a)).toFixed(1)}`
    }).join(' ')
    body = <polygon points={pts} {...common} />
  }
  return {
    maxWidth: MAX_W.shape,
    node: (
      <svg viewBox={`0 0 ${size} ${size}`} role="img" aria-hidden="true" shapeRendering="geometricPrecision">
        {body}
      </svg>
    ),
  }
}

/** Pick a figure for the stem, or null if it isn't a recognized visual pattern. */
function figureForStem(stem: string): Figure | null {
  const s = normalize(stem)

  const rect = s.match(/rectangle is (\d+)\s*units?\s*long\s*and\s*(\d+)\s*units?\s*wide/i)
  if (rect) return RectangleArea(parseInt(rect[1], 10), parseInt(rect[2], 10))

  const box = s.match(
    /box (?:is|that is) (\d+)\s*(?:units?)?\s*long,?\s*(\d+)\s*(?:units?)?\s*wide,?\s*and\s*(\d+)\s*(?:units?)?\s*tall/i,
  )
  if (box) return VolumeBox(parseInt(box[1], 10), parseInt(box[2], 10), parseInt(box[3], 10))

  const cube = s.match(/cube has edges that are all (\d+)/i)
  if (cube) {
    const n = parseInt(cube[1], 10)
    return VolumeBox(n, n, n)
  }

  const shape = s.match(/how many (?:sides|corners|vertices|corners \(vertices\)) does an? (\w+) have/i)
  if (shape) return ShapeFigure(shape[1].toLowerCase())

  return null
}

/**
 * Renders a supporting inline-SVG diagram beneath a visual math stem, or
 * nothing at all. Decorative (aria-hidden): the stem text remains the source
 * of truth for screen readers and the read-aloud voice, so the figure never
 * double-narrates or alters the question.
 */
export function MathFigure({ stem }: { stem: string }) {
  const fig = figureForStem(stem)
  if (!fig) return null
  return <QuestionFigure maxWidth={fig.maxWidth}>{fig.node}</QuestionFigure>
}
