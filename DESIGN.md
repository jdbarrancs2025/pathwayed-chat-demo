# DESIGN.md

> Design system for the Impeccable design skill. Hand-authored (no interactive init).
> Source of truth: `design/prototype.html`.

## Brand

**PathwayEd.** Warm, friendly, trustworthy, education-first. Rounded shapes,
soft paper background, confident navy with a warm orange accent.

## Colors

| Token | Hex | Role |
|-------|-----|------|
| **Navy** | `#003078` | Primary — headings, primary surfaces, focus |
| **Orange** | `#CC543C` | Accent — primary CTAs, kickers, highlights |
| **Paper** | `#FBF8F3` | App background |

Supporting neutrals (from the prototype, not brand-defining): surface `#FFFFFF`,
ink `#1C2230`, muted `#5A6172`, line `#ECE4D8`.

These three brand colors are intentional. Do not swap navy/orange for trendier
hues or shift the paper background to pure white.

## Typography — LOCKED (intentional brand choices)

| Use | Family |
|-----|--------|
| **Display / headings** | **Baloo 2** |
| **Body / UI** | **Inter** |

**Do NOT replace, substitute, or "upgrade" these fonts.** Inter and Baloo 2 are
deliberate brand decisions. The common design anti-pattern of avoiding Inter /
system-default fonts **does not apply to this project** — Inter is the chosen
body face here, on purpose. Any redesign keeps Inter (body) and Baloo 2 (display).

## Components

- **Cards** — white surface, `1px` line border, ~`20px` radius, soft shadow,
  generous padding (`~34px`), max-width ~`480px`, centered.
- **Buttons** — fully rounded (pill). Primary = orange fill, white text. Navy
  and soft (cream) variants for secondary actions.
- **SSO buttons** — white, pill, `1.6px` line border, provider glyph + label,
  centered.
- **Kicker** — orange, uppercase, letter-spaced, small, bold (Inter).

## Anti-patterns

- Don't introduce purple/gradient "AI" clichés or generic dashboard chrome.
- Don't use pure-white page backgrounds — the paper tone is part of the brand.
- Don't add visual noise that distracts kids from the current task.
- **Do not** flag or replace Inter / Baloo 2 — see Typography above.
