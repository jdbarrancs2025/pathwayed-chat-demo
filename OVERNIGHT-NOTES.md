# Overnight build session — log

Branch: `phase-2-app`. Goal: pedagogy upgrade for Nikki (teaching engine, K-2
reading depth, eval harness, misconception library, self-review).

Conventions followed: no dev server started; `bun run build` must exit 0 before
each commit; `api/` relative imports use explicit `.js` (Vercel type-checks
`api/` under nodenext); each part committed and pushed separately.

## Status by part

### PART 1 — Teaching engine — DONE (commit 5606de0, verified this session)
Modular engine already in place from earlier work:
- `api/teaching-cycle.ts` — shared 5-step cycle: diagnose first, teach in the
  ZPD, scaffold then fade (smallest hint → escalate → worked step last → never
  the final answer, always a next move), check understanding then apply,
  diagnose errors by cause (careless / missing-prerequisite / misconception).
  Grade-band helpers (`k-2`/`3-5`/`6-8`/`9-12`).
- `api/subject-modules.ts` — reading/writing/math/science modules, each a
  function of grade band.
- `api/prompts.ts` — `kid-tutor` composes MASTER (safety/warmth/formatting,
  preserved) + teaching cycle + subject module + per-child context.

### PART 2 — K-2 reading depth — DONE (commit 5606de0)
`READING_K2` in `subject-modules.ts`: systematic explicit phonics + phonemic
awareness, explicit ban on three-cueing (no picture/context word-guessing), the
five pillars, multisensory/cumulative/repetition framing for ages ~5-8.

### PART 3 — Eval harness — DONE (commit 8552855)
`eval/` with scenario fixtures, `run.ts` (uses the real prompt builder + LLM
judge `claude-sonnet-4-6`), and `README.md`. (Scenario count topped up toward
~15 in PART 4/5 work below.)

### PART 4 — Misconception library — DONE
- `api/misconceptions.ts` — structured library of 10 high-frequency early errors:
  6 K-2 reading (b/d reversal, short-vowel confusion, first-letter/picture
  guessing, letter-name-vs-sound, can't-blend, dropping sounds in blends) and
  4 early math (subtract-smaller-from-larger per column, count-all-not-on,
  teen-number reversal, miscount/one-to-one). Each entry has a signature, a
  confirming diagnostic, and a targeted re-teach move.
- `misconceptionsFor(subject, band)` and `getMisconceptionGuidance(subject,
  band)` (renders a compact "watch for these" prompt section, reinforcing "never
  give the final answer").
- Wired into `api/prompts.ts`: the `kid-tutor` prompt now appends the
  misconception guidance for the subject + band (reading/math @ k-2) after the
  subject module.
- `api/misconceptions.test.ts` — 6 tests covering structure, required coverage,
  and the formatter. Full suite: 44 tests pass. build exit 0. api nodenext
  type-check clean.

### PART 5 — Self-review — see entry added on completion below.
