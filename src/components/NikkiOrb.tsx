import './NikkiOrb.css'

export type NikkiOrbState = 'idle' | 'thinking' | 'speaking'

/**
 * Build the JARVIS-style orb SVG once at module load (mirrors the prototype's
 * `_jarvis` cache so the procedurally-placed sparks stay stable across renders).
 * Ported verbatim from design/prototype.html → jarvisOrbSvg().
 */
function buildOrbSvg(): string {
  const C = 100
  let sp1 = ''
  let sp2 = ''

  for (let i = 0; i < 54; i++) {
    const a = ((i * 360) / 54) * (Math.PI / 180)
    const r1 = 30 + Math.random() * 10
    const r2 = 66 + Math.random() * 26
    const x1 = (C + Math.cos(a) * r1).toFixed(1)
    const y1 = (C + Math.sin(a) * r1).toFixed(1)
    const x2 = (C + Math.cos(a) * r2).toFixed(1)
    const y2 = (C + Math.sin(a) * r2).toFixed(1)
    sp1 += `<line x1="${x1}" y1="${y1}" x2="${x2}" y2="${y2}" stroke="#CC543C" stroke-width="${(0.4 + Math.random() * 1.1).toFixed(2)}" opacity="${(0.18 + Math.random() * 0.5).toFixed(2)}"/>`
  }

  for (let i = 0; i < 40; i++) {
    const a = ((i * 360) / 40 + 4) * (Math.PI / 180)
    const r1 = 18 + Math.random() * 8
    const r2 = 42 + Math.random() * 30
    const x1 = (C + Math.cos(a) * r1).toFixed(1)
    const y1 = (C + Math.sin(a) * r1).toFixed(1)
    const x2 = (C + Math.cos(a) * r2).toFixed(1)
    const y2 = (C + Math.sin(a) * r2).toFixed(1)
    sp2 += `<line x1="${x1}" y1="${y1}" x2="${x2}" y2="${y2}" stroke="#E07A4E" stroke-width="${(0.3 + Math.random() * 0.8).toFixed(2)}" opacity="${(0.14 + Math.random() * 0.4).toFixed(2)}"/>`
  }

  const arc = (r: number, d: string, w: number, op: number, c: string) =>
    `<circle cx="100" cy="100" r="${r}" fill="none" stroke="${c}" stroke-width="${w}" stroke-dasharray="${d}" opacity="${op}"/>`

  const arcsA =
    arc(48, '16 10', 1.6, 0.6, '#CC543C') +
    arc(60, '6 12', 1.2, 0.45, '#E07A4E') +
    arc(78, '30 16', 1.4, 0.3, '#B0432E')
  const arcsB =
    arc(54, '4 10', 1, 0.45, '#003078') +
    arc(70, '20 14', 1.2, 0.35, '#2E5BB8') +
    arc(88, '2 8', 1, 0.25, '#003078')

  return `<svg class="jarvis" viewBox="0 0 200 200" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg"><defs><radialGradient id="jglowg" cx="50%" cy="50%" r="50%"><stop offset="0%" stop-color="rgba(255,229,206,.98)"/><stop offset="38%" stop-color="rgba(232,100,58,.62)"/><stop offset="100%" stop-color="rgba(204,84,60,0)"/></radialGradient><filter id="jblur" x="-50%" y="-50%" width="200%" height="200%"><feGaussianBlur stdDeviation="2.4"/></filter></defs><g class="jspin-cw">${sp1}</g><g class="jspin-ccw">${sp2}</g><g class="jarcA">${arcsA}</g><g class="jarcB">${arcsB}</g><circle class="jglow" cx="100" cy="100" r="70" fill="url(#jglowg)" opacity=".5"/><circle class="jcore" cx="100" cy="100" r="14" fill="#FFE0CC" filter="url(#jblur)"/><g class="jswirl" opacity=".8"><path d="M70 100 A30 30 0 0 1 130 96" fill="none" stroke="#E8643A" stroke-width="2"/><path d="M86 118 A22 22 0 0 1 120 80" fill="none" stroke="#CC543C" stroke-width="1.5" opacity=".7"/></g><circle cx="100" cy="100" r="97" fill="none" stroke="#CC543C" stroke-width="1" opacity=".28"/><circle class="jping" cx="100" cy="100" r="46" fill="none" stroke="#CC543C" stroke-width="1.6"/><circle class="jping jping2" cx="100" cy="100" r="46" fill="none" stroke="#E07A4E" stroke-width="1.2"/></svg>`
}

const ORB_SVG = buildOrbSvg()

interface NikkiOrbProps {
  /** Rendered width/height in px (the SVG scales to fit). */
  size?: number
  /** Animation state — `idle` by default; `thinking`/`speaking` for the call stage. */
  state?: NikkiOrbState
  className?: string
}

/**
 * Reusable animated JARVIS-style energy orb. Used in the Choose-your-Nikki grid
 * and (later) the session call stage — pass `state="thinking"` / `"speaking"`.
 */
export function NikkiOrb({ size = 92, state = 'idle', className = '' }: NikkiOrbProps) {
  const classes = ['nikki-orb', state === 'idle' ? '' : state, className]
    .filter(Boolean)
    .join(' ')

  return (
    <span
      className={classes}
      style={{ width: size, height: size }}
      aria-hidden
      dangerouslySetInnerHTML={{ __html: ORB_SVG }}
    />
  )
}
