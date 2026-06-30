import type { SatProjectionPayload } from '@/lib/readiness'

/**
 * Student-dashboard SAT Readiness card. Read-only: it renders the stored 'sat'
 * readiness_scores payload (no engine logic). Grade- AND gate-dependent:
 *   - gate 'insufficient' (any grade): section %s + "building toward" copy,
 *     never a score or a fabricated range.
 *   - grade <= 8 (incl. K / unknown): foundation framing only, no SAT score.
 *   - grade 9-10, gate ok: dual ranges (today + junior-year) framed as college
 *     readiness.
 *   - grade 11-12, gate ok: full SAT framing + ranges + top missing skills +
 *     timeline.
 * Ranges are always labeled an ESTIMATE with a visible methodology line; the
 * trajectory is a junior-year potential, never a prediction.
 */

const METHODOLOGY = 'Projected from demonstrated mastery, refined as your child practices.'

type Band = 'foundation' | 'college' | 'sat'

function bandFor(grade: string): Band {
  const n = parseInt(grade, 10)
  if (Number.isNaN(n) || n <= 8) return 'foundation' // K and anything <= 8
  if (n <= 10) return 'college' // 9-10
  return 'sat' // 11-12
}

export function SatReadinessCard({
  payload,
  grade,
}: {
  payload: SatProjectionPayload | null
  grade: string
}) {
  const band = bandFor(grade)

  // No row yet / unrecognised payload -> gentle empty state. Never a number.
  if (!payload) {
    return (
      <section className="panel">
        <h3>SAT Readiness</h3>
        <p className="muted sat-intro">
          As your child practices SAT-aligned skills, a readiness estimate will appear here.
        </p>
      </section>
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

  const heading = band === 'college' ? 'College Readiness' : 'SAT Readiness'

  const intro =
    band === 'foundation'
      ? "You're building skills that lead toward the SAT. Keep practicing — these are the foundations that get them there."
      : !gateOk
        ? "A little more SAT-skill practice and we'll project a score range. Here's where things stand so far."
        : band === 'college'
          ? 'On track toward college-level work. Below is an estimated SAT range from demonstrated mastery.'
          : 'Here is an estimated SAT range from demonstrated mastery.'

  const missing = showSatExtras
    ? [
        ...(payload.missingBySection?.math ?? []),
        ...(payload.missingBySection?.['reading-writing'] ?? []),
      ]
        .filter((s) => s && typeof s.name === 'string')
        .slice(0, 4)
    : []

  return (
    <section className="panel">
      <h3>{heading}</h3>
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
          <p className="sat-note">
            Junior-year potential is where they could land if they master weak and untouched
            skills &mdash; a potential, not a prediction.
          </p>
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
    </section>
  )
}
