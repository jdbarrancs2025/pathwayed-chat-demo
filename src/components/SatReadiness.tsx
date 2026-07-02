import type { SatProjectionPayload } from '@/lib/readiness'
import { satPacingTone } from '@/lib/satFraming'

/**
 * Shared SAT Readiness presentation for BOTH surfaces — the student dashboard
 * card (variant 'student') and the parent dashboard per-child section (variant
 * 'parent'). Read-only: it renders the stored 'sat' payload, no engine logic.
 *
 * Everything is shared except the wrapper element and the intro copy, so the
 * framing — the ESTIMATE badge, the methodology line, and the
 * "potential, not a prediction" disclaimer — CANNOT drift between the two
 * surfaces (a school sees the parent view, so this matters).
 *
 * Grade- AND gate-dependent:
 *   - gate 'insufficient' (any grade): section %s + "building toward" copy,
 *     never a score or a fabricated range.
 *   - grade <= 8 (incl. K / unknown): foundation framing only, no SAT score.
 *   - grade 9-10, gate ok: dual ranges (today + junior-year) framed as college
 *     readiness.
 *   - grade 11-12, gate ok: full SAT framing + ranges + top missing skills +
 *     timeline.
 */

// Defined ONCE — the non-negotiable framing strings shared by both surfaces.
const METHODOLOGY = 'Projected from demonstrated mastery, refined as your child practices.'
const TRAJECTORY_DISCLAIMER =
  'Junior-year potential is where they could land if they master weak and untouched skills — a potential, not a prediction.'

// Pacing message: readiness comes from MASTERING the material, not from reaching a
// grade. "Ready by 11th" is a target, not a gate — a strong-mastery student is
// ready early. Two honest, encouraging variants (no numbers), chosen by tone.
const PACING: Record<Variant, Record<'ahead' | 'building', string>> = {
  student: {
    ahead:
      "You're ahead of the usual pace! Readiness comes from mastering the skills, not waiting for a grade — keep it up and you'll be ready early.",
    building:
      "Readiness comes from mastering the skills, not reaching a certain grade. Master them and you're ready — as soon as that takes you, not a moment later.",
  },
  parent: {
    ahead:
      'Ahead of the usual pace — readiness comes from mastered skills, not a grade. A strong-mastery student is ready early, ahead of the typical junior-year timeline.',
    building:
      "Readiness comes from mastered skills, not a grade. As your child masters the material they become ready — potentially ahead of the typical junior-year timeline, never held to it.",
  },
}

type Band = 'foundation' | 'college' | 'sat'
type Variant = 'student' | 'parent'

function bandFor(grade: string): Band {
  const n = parseInt(grade, 10)
  if (Number.isNaN(n) || n <= 8) return 'foundation' // K and anything <= 8
  if (n <= 10) return 'college' // 9-10
  return 'sat' // 11-12
}

// Intro copy varies by surface + state. Student strings are kept verbatim from
// the original card so the student view renders identically post-refactor.
const COPY: Record<Variant, Record<'empty' | 'foundation' | 'insufficient' | 'college' | 'sat', string>> = {
  student: {
    empty: 'As your child practices SAT-aligned skills, a readiness estimate will appear here.',
    foundation:
      "You're building skills that lead toward the SAT. Keep practicing — these are the foundations that get them there.",
    insufficient: "A little more SAT-skill practice and we'll project a score range. Here's where things stand so far.",
    college: 'On track toward college-level work. Below is an estimated SAT range from demonstrated mastery.',
    sat: 'Here is an estimated SAT range from demonstrated mastery.',
  },
  parent: {
    empty: 'As your child practices SAT-aligned skills, a readiness estimate will appear here.',
    foundation:
      'Your child is building foundational skills toward college readiness — no SAT estimate yet; that comes as they grow these skills.',
    insufficient:
      'A little more SAT-skill practice and an estimated score range will appear. Here is where things stand so far.',
    college:
      'On track toward college-level work. Below is an estimated SAT range projected from demonstrated mastery.',
    sat: 'An estimated SAT range projected from demonstrated mastery.',
  },
}

export function SatReadiness({
  payload,
  grade,
  variant,
}: {
  payload: SatProjectionPayload | null
  grade: string
  variant: Variant
}) {
  const band = bandFor(grade)
  const heading = (text: string) =>
    variant === 'parent' ? <div className="pd-label">{text}</div> : <h3>{text}</h3>
  const wrap = (children: React.ReactNode) =>
    variant === 'parent' ? (
      <div className="pd-section">{children}</div>
    ) : (
      <section className="panel">{children}</section>
    )

  // No row yet / unrecognised payload -> gentle empty state. Never a number.
  if (!payload) {
    return wrap(
      <>
        {heading('SAT Readiness')}
        <p className="muted sat-intro">{COPY[variant].empty}</p>
      </>,
    )
  }

  const sections = (
    [
      { key: 'math', label: 'Math', pct: payload.sections?.math?.pct ?? null, accent: 'var(--math)' },
      {
        key: 'rw',
        label: 'Reading & Writing',
        pct: payload.sections?.['reading-writing']?.pct ?? null,
        accent: 'var(--reading)',
      },
    ] as { key: string; label: string; pct: number | null; accent: string }[]
  ).filter((s): s is { key: string; label: string; pct: number; accent: string } => typeof s.pct === 'number')

  const gateOk = payload.gate === 'ok'
  // Foundation grades NEVER show a score/range, even if the gate is somehow ok.
  const showRanges = gateOk && band !== 'foundation' && !!payload.today && !!payload.trajectory
  const showSatExtras = showRanges && band === 'sat'

  const headingText = band === 'college' ? 'College Readiness' : 'SAT Readiness'
  const introKey: 'foundation' | 'insufficient' | 'college' | 'sat' =
    band === 'foundation' ? 'foundation' : !gateOk ? 'insufficient' : band
  const intro = COPY[variant][introKey]

  const missing = showSatExtras
    ? [...(payload.missingBySection?.math ?? []), ...(payload.missingBySection?.['reading-writing'] ?? [])]
        .filter((s) => s && typeof s.name === 'string')
        .slice(0, 4)
    : []

  return wrap(
    <>
      {heading(headingText)}
      <p className="muted sat-intro">{intro}</p>

      {sections.length > 0 && (
        <div className="sat-sections">
          {sections.map((s) => (
            <div key={s.key} className="skill-row">
              <div className="skill-top">
                <span className="skill-name">{s.label}</span>
                <span className="skill-pct">{Math.round(s.pct)}%</span>
              </div>
              <div className="bar">
                <i style={{ width: `${Math.round(s.pct)}%`, background: s.accent }} />
              </div>
            </div>
          ))}
        </div>
      )}

      {showRanges && (
        <div className="sat-ranges">
          <div className="sat-range">
            <span className="sat-range-label">
              Estimated SAT today <span className="sat-badge">Estimate</span>
            </span>
            <span className="sat-range-val">
              {payload.today!.low}&ndash;{payload.today!.high}
            </span>
          </div>
          <div className="sat-range">
            <span className="sat-range-label">Junior-year potential</span>
            <span className="sat-range-val">
              {payload.trajectory!.low}&ndash;{payload.trajectory!.high}
            </span>
          </div>
          <p className={`sat-pacing${satPacingTone(payload.overallPct) === 'ahead' ? ' ahead' : ''}`}>
            {PACING[variant][satPacingTone(payload.overallPct)]}
          </p>
          <p className="sat-note">{TRAJECTORY_DISCLAIMER}</p>
          <p className="sat-method">{METHODOLOGY}</p>
        </div>
      )}

      {showSatExtras && missing.length > 0 && (
        <div className="sat-missing">
          <div className="subj-head">Top skills to focus on</div>
          <ul>
            {missing.map((s) => (
              <li key={s.slug}>{s.name}</li>
            ))}
          </ul>
        </div>
      )}

      {showSatExtras && payload.timeline && <p className="sat-method">{payload.timeline}</p>}
    </>,
  )
}
