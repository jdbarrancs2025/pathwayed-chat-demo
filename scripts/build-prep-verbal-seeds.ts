/**
 * Authoring script (run with Bun): emits the PREP verbal (synonyms/antonyms)
 * question seed from the curated pool in src/lib/prep/verbalTemplates.ts, so stored
 * content can't drift from the source. NOT run at request time.
 *
 *   bun run scripts/build-prep-verbal-seeds.ts
 *
 * Writes seeds/0015_prep_verbal_questions.sql — SELF-CONTAINED: creates the isolated
 * prep-verbal subject + domain + the prep-synonyms / prep-antonyms skills, then the
 * questions. Idempotent (deterministic ids). Curated items, so template_id is null
 * and difficulty is per item. Apply with:
 *   bun run db:seed seeds/0015_prep_verbal_questions.sql
 */
import { createHash } from 'node:crypto'
import { writeFileSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'
import {
  PREP_VERBAL_DOMAIN,
  PREP_VERBAL_SKILLS,
  PREP_VERBAL_SUBJECT,
  buildPrepQuestion,
  seedForSlot,
} from '../src/lib/prep/verbalTemplates'

const here = dirname(fileURLToPath(import.meta.url))
const seedsDir = join(here, '..', 'seeds')

const qq = (s: string) => `'${s.replace(/'/g, "''")}'`
function dq(s: string): string {
  let tag = 'q'
  while (s.includes(`$${tag}$`)) tag += 'q'
  return `$${tag}$${s}$${tag}$`
}
const jsonb = (v: unknown) => `${dq(JSON.stringify(v))}::jsonb`
const md5uuid = (key: string) => `md5('pe-aos:${key.replace(/'/g, "''")}')::uuid`

function deterministicId(input: string): string {
  const b = createHash('sha1').update(input).digest().subarray(0, 16)
  b[6] = (b[6] & 0x0f) | 0x50
  b[8] = (b[8] & 0x3f) | 0x80
  const h = b.toString('hex')
  return `${h.slice(0, 8)}-${h.slice(8, 12)}-${h.slice(12, 16)}-${h.slice(16, 20)}-${h.slice(20, 32)}`
}

const SUBJECT = PREP_VERBAL_SUBJECT.subject // 'prep-verbal'

const HEADER = `-- PathwayEd — Question Engine: PREP verbal (synonyms/antonyms) skills + questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-prep-verbal-seeds.ts from the
-- curated pool in src/lib/prep/verbalTemplates.ts. HOW TO APPLY (self-contained —
-- creates the isolated prep-verbal subject + domain + skills, then the questions):
--   bun run db:seed seeds/0015_prep_verbal_questions.sql
-- Idempotent (deterministic ids). Depends on migration 0004 (generated_questions).
-- The prep-verbal subject is isolated from the K-12 learning tree; the prep engine
-- reaches these skills by slug (prep-synonyms, prep-antonyms).
--
-- 100% ORIGINAL grade 6-8 items — no published test or workbook copied. Every item
-- has 4 choices, one correct, and three distractors that are each a specific wrong
-- path a real 7th grader takes (with a mapped misconception explanation).

begin;

-- Subject + domain (isolated prep taxonomy).
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (${md5uuid(PREP_VERBAL_SUBJECT.key)}, 'subject', null, ${qq(SUBJECT)}, ${qq(PREP_VERBAL_SUBJECT.name)}, null, null, null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (${md5uuid(PREP_VERBAL_DOMAIN.key)}, 'domain', ${md5uuid(PREP_VERBAL_SUBJECT.key)}, ${qq(SUBJECT)}, ${qq(PREP_VERBAL_DOMAIN.name)}, null, null, null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name;
`

let sql = HEADER

// Skill rows.
for (const skill of PREP_VERBAL_SKILLS) {
  sql += `insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (${md5uuid('skill-' + skill.slug)}, 'skill', ${md5uuid(PREP_VERBAL_DOMAIN.key)}, ${qq(SUBJECT)}, ${qq(skill.name)}, ${qq(skill.slug)}, ${qq(skill.gradeBand)}, null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band;\n`
}

let count = 0
for (const skill of PREP_VERBAL_SKILLS) {
  sql += `\n-- ${skill.slug} (${skill.name}) — ${skill.items.length} items\n`
  for (const item of skill.items) {
    const gq = buildPrepQuestion(item, seedForSlot(item.slot))
    const id = deterministicId(`${skill.slug}:${item.slot}`)
    sql += `insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  (${qq(id)},
   null,
   (select id from public.skills where slug = ${qq(skill.slug)}),
   null, ${qq(gq.difficulty)},
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

writeFileSync(join(seedsDir, '0015_prep_verbal_questions.sql'), sql)
console.log(`Wrote seeds/0015_prep_verbal_questions.sql (${count} questions across ${PREP_VERBAL_SKILLS.length} skills).`)
