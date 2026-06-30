/**
 * Authoring script (run with Bun): emits the Question Engine MATH seeds from the
 * single source of truth in src/lib/mathTemplates.ts, so the stored content
 * can't drift from the generator. NOT run at request time — clients only SELECT.
 *
 *   bun run scripts/build-math-seeds.ts
 *
 * Writes:
 *   seeds/0003_question_templates_math.sql   (the 2 templates, code-keyed upsert)
 *   seeds/0004_generated_questions_math.sql  (cached questions, deterministic-id upsert)
 *
 * Then paste each into the Supabase SQL editor (service role / table owner
 * bypasses RLS to write content). Re-running is idempotent: templates upsert on
 * (code); generated questions upsert on a deterministic id derived from
 * "{template_code}:{seed}", so re-generation updates in place, no duplicates.
 */
import { createHash } from 'node:crypto'
import { writeFileSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'
import { MATH_TEMPLATES, QUESTIONS_PER_TEMPLATE } from '../src/lib/mathTemplates'
import { generateQuestion } from '../src/lib/questionGen'

const here = dirname(fileURLToPath(import.meta.url))
const seedsDir = join(here, '..', 'seeds')

// --- SQL helpers -------------------------------------------------------------
// Plain single-quoted literal — only for $-, backslash-, quote-free values
// (uuids, slugs, enum tokens, numeric answers).
const q = (s: string) => `'${s.replace(/'/g, "''")}'`

// Dollar-quoted literal for anything containing KaTeX ($...$ and backslashes
// like \frac, \,, \times). A single-quoted literal is fragile here: SQL clients
// mis-tokenize the inner `$x$` as a dollar-quote tag (breaking statement
// boundaries) and backslash handling depends on standard_conforming_strings.
// A dollar-quoted string with a tag NOT present in the content is immune to
// both — backslashes/quotes/`$` are all literal. The tag is auto-grown until it
// can't collide with the content.
function dq(s: string): string {
  let tag = 'q'
  while (s.includes(`$${tag}$`)) tag += 'q'
  return `$${tag}$${s}$${tag}$`
}
// jsonb literals carry the templates' KaTeX (stemTemplate) and backslashes, so
// dollar-quote them too.
const jsonb = (v: unknown) => `${dq(JSON.stringify(v))}::jsonb`

/**
 * Decorrelate the generation seed from the cache index. mulberry32's FIRST
 * output is correlated for small consecutive seeds (1,2,3 clustered on the same
 * coefficient draw), making the first cached questions look repetitive. Mixing
 * the index by the golden-ratio constant spreads consecutive indices across the
 * 32-bit seed space, so the FIRST handful varies, not just the full set. The
 * generator stays a pure seed->question map; only the cache's seed choice
 * changes. Cache identity stays the human index (1..N) below.
 */
function seedForIndex(index: number): number {
  return Math.imul(index, 0x9e3779b1) >>> 0
}

/** Stable v5-style UUID from a string, so seeds re-run idempotently by id. */
function deterministicId(input: string): string {
  const b = createHash('sha1').update(input).digest().subarray(0, 16)
  b[6] = (b[6] & 0x0f) | 0x50 // version 5
  b[8] = (b[8] & 0x3f) | 0x80 // RFC-4122 variant
  const h = b.toString('hex')
  return `${h.slice(0, 8)}-${h.slice(8, 12)}-${h.slice(12, 16)}-${h.slice(16, 20)}-${h.slice(20, 32)}`
}

const TEMPLATES_HEADER = `-- PathwayEd — Question Engine, Stage 2: MATH question templates (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-math-seeds.ts from
-- src/lib/mathTemplates.ts. HOW TO APPLY: paste into the Supabase SQL editor and
-- run (same flow as the other seeds). Idempotent (upsert on code). Depends on
-- migration 0004 (public.question_templates) and the skills taxonomy (seed 0002).
--
-- Original items from the public digital-SAT blueprint; no copyrighted text.

begin;
`

const QUESTIONS_HEADER = `-- PathwayEd — Question Engine, Stage 2: cached MATH questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-math-seeds.ts from the
-- templates + the deterministic generator. HOW TO APPLY: paste into the Supabase
-- SQL editor and run. Idempotent (upsert on a deterministic id derived from
-- template_code + seed). Depends on migration 0004 (public.generated_questions)
-- and seed 0003 (templates).

begin;
`

// --- Emit 0003: templates ----------------------------------------------------
const templatesSql =
  TEMPLATES_HEADER +
  MATH_TEMPLATES.map(
    (t) => `
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  (${q(t.code)},
   (select id from public.skills where slug = ${q(t.skillSlug)}),
   ${q(t.satAlignment)}, ${q(t.difficulty)}, 'template_math',
   ${jsonb(t.generationSpec)},
   ${jsonb(t.distractorSpec)},
   'published', 1)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;`,
  ).join('\n') +
  '\n\ncommit;\n'

type MathTemplate = (typeof MATH_TEMPLATES)[number]
type CachedQuestion = { slot: number; question: ReturnType<typeof generateQuestion> }

/**
 * The N distinct cached questions for a template: walk indices, generate, and
 * dedupe by stem so the cache never repeats the same question (sampling 20 of a
 * limited combo space otherwise collides). Cache slot (1..N) is the stable id
 * key; deterministic + idempotent. Throws if a template can't yield N distinct.
 */
function buildCached(t: MathTemplate): CachedQuestion[] {
  const out: CachedQuestion[] = []
  const seenStems = new Set<string>()
  const MAX_INDEX = 5000
  for (let index = 1; out.length < QUESTIONS_PER_TEMPLATE && index <= MAX_INDEX; index++) {
    const question = generateQuestion(t.generationSpec, t.distractorSpec, seedForIndex(index))
    if (seenStems.has(question.stem)) continue
    seenStems.add(question.stem)
    out.push({ slot: out.length + 1, question })
  }
  if (out.length < QUESTIONS_PER_TEMPLATE) {
    throw new Error(`${t.code}: only ${out.length} distinct questions available (need ${QUESTIONS_PER_TEMPLATE})`)
  }
  return out
}

// --- Emit 0004: generated questions -----------------------------------------
let questionsSql = QUESTIONS_HEADER
let count = 0
for (const t of MATH_TEMPLATES) {
  questionsSql += `\n-- ${t.code} (${t.satAlignment}, ${t.difficulty}) — questions 1..${QUESTIONS_PER_TEMPLATE}\n`
  for (const { slot, question: gq } of buildCached(t)) {
    // Cache identity is the stable slot (1..N), not the mixed seed.
    const id = deterministicId(`${t.code}:${slot}`)
    questionsSql += `insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  (${q(id)},
   (select id from public.question_templates where code = ${q(t.code)}),
   (select id from public.skills where slug = ${q(t.skillSlug)}),
   ${q(t.satAlignment)}, ${q(t.difficulty)},
   ${dq(gq.stem)}, ${jsonb(gq.choices)}, ${q(gq.correct_answer)}, ${gq.solution === null ? 'null' : dq(gq.solution)}, 'published')
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
    count++
  }
}
questionsSql += '\ncommit;\n'

writeFileSync(join(seedsDir, '0003_question_templates_math.sql'), templatesSql)
writeFileSync(join(seedsDir, '0004_generated_questions_math.sql'), questionsSql)

console.log(`Wrote seeds/0003 (${MATH_TEMPLATES.length} templates) and seeds/0004 (${count} questions).`)

// --- Human-readable samples for review --------------------------------------
if (process.argv.includes('--samples')) {
  for (const t of MATH_TEMPLATES) {
    console.log(`\n================ ${t.code} (${t.satAlignment}) ================`)
    for (const { slot, question: gq } of buildCached(t).slice(0, 6)) {
      console.log(`\n  [#${slot}] ${gq.stem}`)
      for (const c of gq.choices) {
        console.log(`     ${c.is_correct ? '*' : ' '} ${c.text}${c.misconception_token ? `   (${c.misconception_token})` : ''}`)
      }
      console.log(`     answer: ${gq.correct_answer}`)
      console.log(`     solution: ${gq.solution}`)
    }
  }
}
