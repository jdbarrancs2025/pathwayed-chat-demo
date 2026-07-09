/**
 * Authoring script (run with Bun): emits the elementary math GAP-FILL question
 * seed from the curated pool in src/lib/gapMathTemplates.ts, so stored content
 * can't drift from the source. NOT run at request time.
 *
 *   bun run scripts/build-gap-math-seeds.ts
 *
 * Writes seeds/0009_gap_math_questions.sql (generated_questions rows). Items are
 * curated (no formula template), so template_id is null and difficulty is per
 * item. Idempotent: upsert on a deterministic id from "{slug}:{slot}". The skill
 * row itself is created by its taxonomy SQL (see the plan) — this seed only
 * inserts questions, linked by slug. Apply AFTER the skill exists:
 *   bun run db:seed seeds/0009_gap_math_questions.sql
 */
import { createHash } from 'node:crypto'
import { writeFileSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'
import { GAP_MATH_SKILLS, buildGapQuestion, seedForSlot } from '../src/lib/gapMathTemplates'

const here = dirname(fileURLToPath(import.meta.url))
const seedsDir = join(here, '..', 'seeds')

const qq = (s: string) => `'${s.replace(/'/g, "''")}'`
function dq(s: string): string {
  let tag = 'q'
  while (s.includes(`$${tag}$`)) tag += 'q'
  return `$${tag}$${s}$${tag}$`
}
const jsonb = (v: unknown) => `${dq(JSON.stringify(v))}::jsonb`

function deterministicId(input: string): string {
  const b = createHash('sha1').update(input).digest().subarray(0, 16)
  b[6] = (b[6] & 0x0f) | 0x50
  b[8] = (b[8] & 0x3f) | 0x80
  const h = b.toString('hex')
  return `${h.slice(0, 8)}-${h.slice(8, 12)}-${h.slice(12, 16)}-${h.slice(16, 20)}-${h.slice(20, 32)}`
}

// Each gap skill's CCSS domain (its parent in the taxonomy). New domains (nbt, md)
// are created here; existing ones (frac/oat/geo from seed 0001) upsert to the same
// values. md5('pe-aos:'||key) matches the deterministic-id scheme of seed 0001.
const DOMAIN_BY_SLUG: Record<string, string> = {
  'place-value': 'dom-math-nbt', 'rounding': 'dom-math-nbt', 'multi-digit-add-subtract': 'dom-math-nbt',
  'measurement-and-data': 'dom-math-md', 'early-geometry': 'dom-math-geo', 'volume': 'dom-math-md',
  'multi-digit-multiplication': 'dom-math-nbt', 'long-division': 'dom-math-nbt',
  'fraction-equivalence': 'dom-math-frac', 'fraction-add-subtract': 'dom-math-frac', 'decimals-intro': 'dom-math-frac',
  'factors-and-multiples': 'dom-math-oat', 'lines-and-angles': 'dom-math-geo',
  'decimal-place-value': 'dom-math-nbt', 'decimal-operations': 'dom-math-nbt',
  'fractions-unlike-denominators': 'dom-math-frac', 'fraction-multiply-divide': 'dom-math-frac',
  'coordinate-plane': 'dom-math-geo', 'numerical-expressions': 'dom-math-oat',
}
const DOMAIN_NAME: Record<string, string> = {
  'dom-math-nbt': 'Number & Operations in Base Ten',
  'dom-math-md': 'Measurement & Data',
  'dom-math-geo': 'Geometry',
  'dom-math-frac': 'Number & Operations — Fractions',
  'dom-math-oat': 'Operations & Algebraic Thinking',
}
const md5uuid = (key: string) =>
  `md5('pe-aos:${key.replace(/'/g, "''")}')::uuid`

const HEADER = `-- PathwayEd — Question Engine: elementary math GAP-FILL skills + questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-gap-math-seeds.ts from the
-- curated pool in src/lib/gapMathTemplates.ts. HOW TO APPLY (self-contained —
-- creates the domains + skills with their CCSS tags, then the questions):
--   bun run db:seed seeds/0009_gap_math_questions.sql
-- Idempotent (deterministic ids). Depends on migration 0004 (generated_questions),
-- the re-level migration (skills.ccss_grade/ccss_grade_num/ccss_code), and seed
-- 0001 (public.skills root subject rows).
--
-- 100% ORIGINAL items written to a single exact Common Core grade standard, in
-- grade-appropriate language — no published curriculum, workbook, or test copied.

begin;
`

let sql = HEADER

// --- Taxonomy: create each used domain (once) + each gap skill, with CCSS tags ---
const domainsSeen = new Set<string>()
for (const skill of GAP_MATH_SKILLS) {
  const domKey = DOMAIN_BY_SLUG[skill.slug]
  if (!domKey) throw new Error(`No domain mapped for gap skill "${skill.slug}"`)
  if (!domainsSeen.has(domKey)) {
    domainsSeen.add(domKey)
    sql += `\ninsert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (${md5uuid(domKey)}, 'domain', ${md5uuid('subj-math')}, 'math', ${qq(DOMAIN_NAME[domKey])}, null, '3-5', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;\n`
  }
  sql += `insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (${md5uuid('skill-' + skill.slug)}, 'skill', ${md5uuid(domKey)}, 'math', ${qq(skill.name)}, ${qq(skill.slug)}, ${qq(skill.gradeBand)}, ${qq(skill.satAlignment)}, ${qq(skill.ccssGrade)}, ${skill.ccssGradeNum}, ${qq(skill.ccssCode)}, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;\n`
}

let count = 0
for (const skill of GAP_MATH_SKILLS) {
  sql += `\n-- ${skill.slug} (${skill.name}, grade ${skill.ccssGrade}, ${skill.ccssCode}) — ${skill.items.length} items\n`
  for (const item of skill.items) {
    const gq = buildGapQuestion(item, seedForSlot(item.slot))
    const id = deterministicId(`${skill.slug}:${item.slot}`)
    sql += `insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  (${qq(id)},
   null,
   (select id from public.skills where slug = ${qq(skill.slug)}),
   ${qq(skill.satAlignment)}, ${qq(gq.difficulty)},
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

writeFileSync(join(seedsDir, '0009_gap_math_questions.sql'), sql)
console.log(`Wrote seeds/0009 (${count} gap-math questions across ${GAP_MATH_SKILLS.length} skill(s)).`)
