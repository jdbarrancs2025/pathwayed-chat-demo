/**
 * Authoring script (run with Bun): emits the Phase-3 step-1 TIERED math seeds from
 * src/lib/tieredMathTemplates.ts.
 *
 *   bun run scripts/build-tiered-math-seeds.ts
 *   bun run scripts/build-tiered-math-seeds.ts --samples   # review output only
 *
 * Writes seeds/0022_tiered_math_questions.sql (templates + questions in one file).
 *
 * ADDITIVE AND NON-DESTRUCTIVE BY CONSTRUCTION:
 *   - every template code is new (-v2), so the deterministic id sha1("code:slot")
 *     cannot collide with an existing generated_questions row;
 *   - questions are inserted with status='draft', so nothing is served until a
 *     human publishes them;
 *   - there is no update, no delete, and no touch of any v1 row, so every existing
 *     question_attempts row stays joinable and every time median stays intact.
 *
 * Deliberately a SEPARATE script from build-math-seeds.ts, which is left untouched
 * so re-running this can never regenerate or re-tag the live v1 pool.
 */
import { createHash } from 'node:crypto'
import { writeFileSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'
import { TIERED_MATH_TEMPLATES } from '../src/lib/tieredMathTemplates'
import { generateQuestion } from '../src/lib/questionGen'

const here = dirname(fileURLToPath(import.meta.url))
const seedsDir = join(here, '..', 'seeds')

const q = (s: string) => `'${s.replace(/'/g, "''")}'`

/** Dollar-quoted literal for KaTeX-bearing text (see build-math-seeds.ts). */
function dq(s: string): string {
  let tag = 'q'
  while (s.includes(`$${tag}$`)) tag += 'q'
  return `$${tag}$${s}$${tag}$`
}
const jsonb = (v: unknown) => `${dq(JSON.stringify(v))}::jsonb`

/** Decorrelate the generation seed from the cache index (see build-math-seeds.ts). */
function seedForIndex(index: number): number {
  return Math.imul(index, 0x9e3779b1) >>> 0
}

/** Stable v5-style UUID, so re-running upserts in place. */
function deterministicId(input: string): string {
  const b = createHash('sha1').update(input).digest().subarray(0, 16)
  b[6] = (b[6] & 0x0f) | 0x50
  b[8] = (b[8] & 0x3f) | 0x80
  const h = b.toString('hex')
  return `${h.slice(0, 8)}-${h.slice(8, 12)}-${h.slice(12, 16)}-${h.slice(16, 20)}-${h.slice(20, 32)}`
}

type Tpl = (typeof TIERED_MATH_TEMPLATES)[number]

/** N distinct cached questions for a tier, deduped by stem. */
function buildCached(t: Tpl) {
  const out: { slot: number; question: ReturnType<typeof generateQuestion> }[] = []
  const seenStems = new Set<string>()
  const MAX_INDEX = 20000
  for (let index = 1; out.length < t.count && index <= MAX_INDEX; index++) {
    const question = generateQuestion(t.generationSpec, t.distractorSpec, seedForIndex(index))
    if (seenStems.has(question.stem)) continue
    seenStems.add(question.stem)
    out.push({ slot: out.length + 1, question })
  }
  if (out.length < t.count) {
    throw new Error(`${t.code}: only ${out.length} distinct questions available (need ${t.count})`)
  }
  return out
}

const HEADER = `-- PathwayEd — Phase 3 step 1: TIERED math questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-tiered-math-seeds.ts from
-- src/lib/tieredMathTemplates.ts.
--
-- HOW TO APPLY: paste into the Supabase SQL editor and run against
-- papiowjjoyhnbyhgtbxq. Idempotent: templates upsert on (code), questions upsert on
-- a deterministic id derived from "{template_code}:{slot}".
--
-- WHAT THIS DOES AND DOES NOT DO.
--   DOES:     insert 12 NEW templates and 192 NEW questions, all status='draft'.
--   DOES NOT: update, re-tag, or delete a single existing row. Every template code
--             ends -v2 and is new, so no deterministic id can collide with the
--             live v1 pool, and every existing question_attempts row stays joinable
--             with its per-question time median intact.
--
-- NOTHING IS SERVED BY THIS FILE. Questions land as 'draft'; the client only ever
-- selects status='published'. Publishing is a separate, deliberate step.
--
-- Grade anchoring: each tier's standard is quoted above its block. Harder means a
-- harder task AT THE SAME GRADE, never a bigger number borrowed from a later grade.

begin;
`

let sql = HEADER
let templateCount = 0
let questionCount = 0

for (const t of TIERED_MATH_TEMPLATES) {
  sql += `\n-- =====================================================================
-- ${t.code}
-- skill: ${t.skillSlug}   tier: ${t.difficulty}   items: ${t.count}
-- standard: ${t.standard}
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  (${q(t.code)},
   (select id from public.skills where slug = ${q(t.skillSlug)}),
   ${q(t.satAlignment)}, ${q(t.difficulty)}, 'template_math',
   ${jsonb(t.generationSpec)},
   ${jsonb(t.distractorSpec)},
   'draft', 2)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;\n`
  templateCount++

  for (const { slot, question: gq } of buildCached(t)) {
    const id = deterministicId(`${t.code}:${slot}`)
    sql += `insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  (${q(id)},
   (select id from public.question_templates where code = ${q(t.code)}),
   (select id from public.skills where slug = ${q(t.skillSlug)}),
   ${q(t.satAlignment)}, ${q(t.difficulty)},
   ${dq(gq.stem)}, ${jsonb(gq.choices)}, ${q(gq.correct_answer)}, ${gq.solution === null ? 'null' : dq(gq.solution)}, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;\n`
    questionCount++
  }
}

sql += `
-- Report what landed, so applying this is verifiable at a glance.
select sk.slug, gq.difficulty, count(*) as drafted
from public.generated_questions gq
join public.skills sk on sk.id = gq.skill_id
where gq.status = 'draft'
group by 1, 2 order by 1, 2;

commit;
`

writeFileSync(join(seedsDir, '0022_tiered_math_questions.sql'), sql)
console.log(`Wrote seeds/0022_tiered_math_questions.sql (${templateCount} templates, ${questionCount} questions, all draft).`)

// --- Review samples as markdown ----------------------------------------------
// Written from the SAME buildCached() call that produced the seed, so the file
// cannot drift from what 0022 actually contains.
if (process.argv.includes('--markdown')) {
  const PER_TIER = 3
  const bySkill = new Map<string, Tpl[]>()
  for (const t of TIERED_MATH_TEMPLATES) {
    bySkill.set(t.skillSlug, [...(bySkill.get(t.skillSlug) ?? []), t])
  }

  let md = `# Tiered math samples — seeds/0022 (draft)

Generated by \`scripts/build-tiered-math-seeds.ts --markdown\` from
\`src/lib/tieredMathTemplates.ts\`, the same source that produced
\`seeds/0022_tiered_math_questions.sql\`. Everything below is DRAFT and is not
served to anyone.

Three items per skill per tier. The correct choice is marked \`**<-- correct**\`;
every other choice shows its misconception token.

`
  for (const [slug, tiers] of bySkill) {
    md += `\n## ${slug}\n`
    for (const t of tiers) {
      md += `\n### ${t.difficulty} (${t.count} items in the seed)\n\n`
      md += `- template: \`${t.code}\`\n- standard: ${t.standard}\n`
      const ranges = t.generationSpec.slots
        .map((s) => `${s.name} ${s.min}..${s.max}${s.step && s.step !== 1 ? ` step ${s.step}` : ''}`)
        .join(', ')
      md += `- drawn ranges: ${ranges}\n`
      if (t.generationSpec.constraints?.length) {
        md += `- constraints: ${t.generationSpec.constraints.join('; ')}\n`
      }
      md += '\n'
      for (const { slot, question: gq } of buildCached(t).slice(0, PER_TIER)) {
        md += `**Item ${slot}.** ${gq.stem}\n\n`
        for (const c of gq.choices) {
          md += c.is_correct
            ? `- \`${c.text}\` **<-- correct**\n`
            : `- \`${c.text}\` — _${c.misconception_token}_\n`
        }
        md += `\nSolution: ${gq.solution}\n\n`
      }
    }
  }
  writeFileSync(join(here, '..', 'samples-tiered-v2.md'), md)
  console.log('Wrote samples-tiered-v2.md')
}

// --- Review samples: N per skill per tier (console) ---------------------------
if (process.argv.includes('--samples')) {
  const perTier = Number(process.argv[process.argv.indexOf('--samples') + 1]) || 3
  for (const t of TIERED_MATH_TEMPLATES) {
    console.log(`\n======== ${t.skillSlug} / ${t.difficulty} ========`)
    console.log(`standard: ${t.standard}`)
    for (const { slot, question: gq } of buildCached(t).slice(0, perTier)) {
      console.log(`\n  [#${slot}] ${gq.stem}`)
      for (const c of gq.choices) {
        console.log(
          `     ${c.is_correct ? '*' : ' '} ${c.text}${c.misconception_token ? `   (${c.misconception_token})` : ''}`,
        )
      }
      console.log(`     solution: ${gq.solution}`)
    }
  }
}
