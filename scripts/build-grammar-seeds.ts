/**
 * Authoring script (run with Bun): emits the GRAMMAR question seed from the
 * curated pool in src/lib/grammarTemplates.ts, so the stored content can't drift
 * from the source. NOT run at request time — clients only SELECT.
 *
 *   bun run scripts/build-grammar-seeds.ts
 *
 * Writes seeds/0007_grammar_questions.sql (generated_questions rows). Grammar
 * items are curated (no formula template), so template_id is null and difficulty
 * is per item. Idempotent: upsert on a deterministic id from "{code}:{slot}".
 * Apply with: bun run db:seed seeds/0007_grammar_questions.sql
 */
import { createHash } from 'node:crypto'
import { writeFileSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'
import { GRAMMAR_TEMPLATES, buildGrammarQuestion, seedForSlot } from '../src/lib/grammarTemplates'

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

const HEADER = `-- PathwayEd — Question Engine: curated GRAMMAR questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-grammar-seeds.ts from the
-- curated pool in src/lib/grammarTemplates.ts. HOW TO APPLY:
--   bun run db:seed seeds/0007_grammar_questions.sql
-- Idempotent (upsert on a deterministic id from code + slot). Depends on
-- migration 0004 (public.generated_questions) and seed 0005 (grammar skills).
--
-- 100% ORIGINAL items written to the public SAT Standard English Conventions
-- format/skill spec — no real SAT or prep-company text is copied or paraphrased.

begin;
`

let sql = HEADER
let count = 0
for (const t of GRAMMAR_TEMPLATES) {
  sql += `\n-- ${t.code} (${t.skillSlug}, ${t.satAlignment}) — ${t.items.length} items\n`
  for (const item of t.items) {
    const gq = buildGrammarQuestion(item, seedForSlot(item.slot))
    const id = deterministicId(`${t.code}:${item.slot}`)
    sql += `insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  (${qq(id)},
   null,
   (select id from public.skills where slug = ${qq(t.skillSlug)}),
   ${qq(t.satAlignment)}, ${qq(gq.difficulty)},
   ${dq(gq.stem)}, ${jsonb(gq.choices)}, ${dq(gq.correct_answer)}, ${dq(gq.solution)}, 'published')
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
sql += '\ncommit;\n'

writeFileSync(join(seedsDir, '0007_grammar_questions.sql'), sql)
console.log(`Wrote seeds/0007 (${count} grammar questions across ${GRAMMAR_TEMPLATES.length} skills).`)
