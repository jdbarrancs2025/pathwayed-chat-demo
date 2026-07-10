// A simple, hand-authored inline-SVG diagram for inherently visual elementary
// math questions (area, volume, shape identification) that would otherwise be
// text-only. It reads the figure straight out of the question stem — the
// dimensions and shape names are already written there — so no data, seed, or
// migration change is needed. Same philosophy as KidIcon: all SVG is authored
// JSX, no external images and no generation. Returns null for any stem that
// isn't one of the recognized visual patterns, so non-visual skills render
// exactly as before and the answer format is never touched.

const NAVY = '#1e3a6e'
const NAVY_FILL = '#e8eef7'
const GRID = '#b9c8e0'
const ORANGE = '#e85a24'
const ORANGE_FILL = '#fdece4'

const wrap = { display: 'flex', justifyContent: 'center', margin: '4px 0 14px' } as const

/** Strip LaTeX `$` wrappers (area stems write numbers as `$8$`) and collapse
 *  whitespace so the matchers can read plain digits and words. */
function normalize(stem: string): string {
  return stem.replace(/\$/g, ' ').replace(/\s+/g, ' ').trim()
}

/** A rectangle labeled with its dimensions, drawn as an L×W grid of unit
 *  squares so "square units" is visible. Display cells are clamped for size;
 *  the labels always show the real numbers from the stem. */
function RectangleArea(L: number, W: number) {
  const cell = Math.max(12, Math.min(26, Math.floor(200 / Math.max(L, W)))) // px per unit
  const pad = 26
  const w = L * cell
  const h = W * cell
  const cols = Array.from({ length: L + 1 }, (_, i) => i)
  const rows = Array.from({ length: W + 1 }, (_, j) => j)
  return (
    <svg
      width={w + pad * 2}
      height={h + pad * 2}
      viewBox={`0 0 ${w + pad * 2} ${h + pad * 2}`}
      role="img"
      aria-hidden="true"
    >
      <rect x={pad} y={pad} width={w} height={h} fill={NAVY_FILL} stroke={NAVY} strokeWidth={2} />
      {cols.map((i) => (
        <line key={`c${i}`} x1={pad + i * cell} y1={pad} x2={pad + i * cell} y2={pad + h} stroke={GRID} strokeWidth={1} />
      ))}
      {rows.map((j) => (
        <line key={`r${j}`} x1={pad} y1={pad + j * cell} x2={pad + w} y2={pad + j * cell} stroke={GRID} strokeWidth={1} />
      ))}
      <rect x={pad} y={pad} width={w} height={h} fill="none" stroke={NAVY} strokeWidth={2} />
      <text x={pad + w / 2} y={pad + h + 18} textAnchor="middle" fontSize={13} fontWeight={700} fill={NAVY}>
        {L} units
      </text>
      <text
        x={pad - 8}
        y={pad + h / 2}
        textAnchor="middle"
        fontSize={13}
        fontWeight={700}
        fill={NAVY}
        transform={`rotate(-90 ${pad - 8} ${pad + h / 2})`}
      >
        {W} units
      </text>
    </svg>
  )
}

/** A rectangular prism of unit cubes in cabinet projection, with unit-grid
 *  lines on the three visible faces and L/W/H labels — the standard textbook
 *  volume figure. */
function VolumeBox(L: number, W: number, H: number) {
  const u = Math.max(12, Math.min(26, Math.floor(150 / (Math.max(L, H) + W * 0.5)))) // px per unit
  const dxu = Math.cos(Math.PI / 6) * 0.5 * u // horizontal offset of one depth unit
  const dyu = Math.sin(Math.PI / 6) * 0.5 * u // vertical (upward) offset of one depth unit
  const pad = 26
  const boardH = H * u + W * dyu
  // Project cube coords (x right 0..L, y up 0..H, z depth 0..W) to screen.
  const px = (x: number, z: number) => pad + x * u + z * dxu
  const py = (y: number, z: number) => pad + boardH - (y * u + z * dyu)
  const vbW = L * u + W * dxu + pad * 2
  const vbH = boardH + pad * 2

  const face = (pts: Array<[number, number, number]>, fill: string) => (
    <polygon points={pts.map(([x, y, z]) => `${px(x, z)},${py(y, z)}`).join(' ')} fill={fill} stroke={NAVY} strokeWidth={2} />
  )
  const line = (a: [number, number, number], b: [number, number, number], key: string) => (
    <line key={key} x1={px(a[0], a[2])} y1={py(a[1], a[2])} x2={px(b[0], b[2])} y2={py(b[1], b[2])} stroke={GRID} strokeWidth={1} />
  )
  const range = (n: number) => Array.from({ length: n + 1 }, (_, i) => i)

  return (
    <svg width={vbW} height={vbH} viewBox={`0 0 ${vbW} ${vbH}`} role="img" aria-hidden="true">
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
      <text x={px(L / 2, 0)} y={py(0, 0) + 16} textAnchor="middle" fontSize={12} fontWeight={700} fill={NAVY}>
        {L}
      </text>
      <text x={px(L, 0) + 12} y={py(H / 2, 0)} textAnchor="middle" fontSize={12} fontWeight={700} fill={NAVY}>
        {H}
      </text>
      <text x={px(L / 2, W) - 2} y={py(H, W / 2) - 6} textAnchor="middle" fontSize={12} fontWeight={700} fill={NAVY}>
        {W}
      </text>
    </svg>
  )
}

// Named shapes → number of sides (regular polygon). Special cases handled below.
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
function ShapeFigure(name: string) {
  const size = 150
  const c = size / 2
  const r = size * 0.4
  const common = { fill: ORANGE_FILL, stroke: ORANGE, strokeWidth: 3 }
  let body: React.ReactNode
  if (name === 'circle') {
    body = <circle cx={c} cy={c} r={r} {...common} />
  } else if (name === 'square') {
    const s = r * 1.5
    body = <rect x={c - s / 2} y={c - s / 2} width={s} height={s} rx={2} {...common} />
  } else if (name === 'rectangle') {
    const rw = r * 2
    const rh = r * 1.2
    body = <rect x={c - rw / 2} y={c - rh / 2} width={rw} height={rh} rx={2} {...common} />
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
  return (
    <svg width={size} height={size} viewBox={`0 0 ${size} ${size}`} role="img" aria-hidden="true">
      {body}
    </svg>
  )
}

/** Pick a figure for the stem, or null if it isn't a recognized visual pattern. */
function figureForStem(stem: string): React.ReactNode {
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
 * nothing at all. Decorative (aria-hidden) — the stem text remains the source
 * of truth for screen readers and the read-aloud voice, so the figure never
 * double-narrates or alters the question.
 */
export function MathFigure({ stem }: { stem: string }) {
  const fig = figureForStem(stem)
  if (!fig) return null
  return (
    <figure style={wrap} aria-hidden="true">
      {fig}
    </figure>
  )
}
