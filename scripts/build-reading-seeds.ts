/**
 * Authoring script (run with Bun): emits the READING question seed from the
 * curated passage pool in src/lib/readingTemplates.ts, so the stored content
 * can't drift from the source. NOT run at request time — clients only SELECT.
 *
 *   bun run scripts/build-reading-seeds.ts
 *
 * Writes seeds/0008_reading_questions.sql: for each passage, one public.passages
 * row, then one public.generated_questions row per question, linked by passage_id
 * (the reading-set model — passage text stored once, not repeated per stem).
 * Reading items are curated (no formula template), so template_id is null and
 * difficulty is per item. Idempotent: passages upsert on a deterministic id from
 * the passage code; questions upsert on a deterministic id from "{code}:{slot}".
 * Depends on migration 0007 (public.passages + generated_questions.passage_id).
 * Apply with: bun run db:seed seeds/0008_reading_questions.sql
 */
import { createHash } from 'node:crypto'
import { writeFileSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'
import { READING_PASSAGES, buildReadingQuestion, seedForSlot } from '../src/lib/readingTemplates'

const here = dirname(fileURLToPath(import.meta.url))
const seedsDir = join(here, '..', 'seeds')

// Plain single-quoted literal — for quote-free scalars (uuid, slug, enum tokens).
const qq = (s: string) => `'${s.replace(/'/g, "''")}'`

// Dollar-quoted literal for free text (apostrophes, punctuation, quotes). The tag
// grows until it can't collide with the content, so everything inside is literal.
function dq(s: string): string {
  let tag = 'q'
  while (s.includes(`$${tag}$`)) tag += 'q'
  return `$${tag}$${s}$${tag}$`
}
const jsonb = (v: unknown) => `${dq(JSON.stringify(v))}::jsonb`

/** Stable v5-style UUID from a string, so re-runs upsert by id (idempotent). */
function deterministicId(input: string): string {
  const b = createHash('sha1').update(input).digest().subarray(0, 16)
  b[6] = (b[6] & 0x0f) | 0x50
  b[8] = (b[8] & 0x3f) | 0x80
  const h = b.toString('hex')
  return `${h.slice(0, 8)}-${h.slice(8, 12)}-${h.slice(12, 16)}-${h.slice(16, 20)}-${h.slice(20, 32)}`
}

const HEADER = `-- PathwayEd — Question Engine: curated READING questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-reading-seeds.ts from the
-- curated passage pool in src/lib/readingTemplates.ts. HOW TO APPLY:
--   bun run db:seed seeds/0008_reading_questions.sql
-- Idempotent (passages upsert on a deterministic id from the passage code;
-- questions upsert on a deterministic id from code + slot). Depends on migration
-- 0007 (public.passages + generated_questions.passage_id) and 0002 (reading skills).
--
-- The reading-set model: each passage is stored ONCE and its questions link to it
-- via passage_id. 100% ORIGINAL items written to the public SAT Reading & Writing
-- format/skill spec — no real SAT or prep-company passage or item is copied or
-- paraphrased.

begin;
`

let sql = HEADER
let passageCount = 0
let questionCount = 0
for (const p of READING_PASSAGES) {
  const passageId = deterministicId(p.code)
  sql += `\n-- ${p.code} (${p.skillSlug}, ${p.satAlignment}, ${p.gradeBand}) — ${p.items.length} question(s)\n`
  sql += `insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  (${qq(passageId)},
   ${qq(p.code)},
   (select id from public.skills where slug = ${qq(p.skillSlug)}),
   ${qq(p.satAlignment)}, ${qq(p.gradeBand)}, ${p.title ? dq(p.title) : 'null'}, ${dq(p.body)}, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;\n`
  passageCount++

  for (const item of p.items) {
    const gq = buildReadingQuestion(item, seedForSlot(item.slot))
    const id = deterministicId(`${p.code}:${item.slot}`)
    sql += `insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  (${qq(id)},
   null,
   (select id from public.skills where slug = ${qq(p.skillSlug)}),
   ${qq(p.satAlignment)}, ${qq(gq.difficulty)},
   ${dq(gq.stem)}, ${jsonb(gq.choices)}, ${dq(gq.correct_answer)}, ${dq(gq.solution)}, 'published',
   ${qq(passageId)})
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;\n`
    questionCount++
  }
}
sql += '\ncommit;\n'

writeFileSync(join(seedsDir, '0008_reading_questions.sql'), sql)
console.log(
  `Wrote seeds/0008 (${questionCount} reading questions across ${passageCount} passages, ${new Set(READING_PASSAGES.map((p) => p.skillSlug)).size} skill(s)).`,
)
