/**
 * Authoring script (run with Bun): emits the GRADE 4 & 8 math question seed from
 * the curated pool in src/lib/grade4_8MathTemplates.ts. NOT run at request time.
 *
 *   bun run scripts/build-grade4-8-math-seeds.ts
 *
 * Writes seeds/0013_grade4_8_math_questions.sql. Grade 4 fills out the 3-5 band
 * (multi-digit operations, fractions, factors/multiples, area/perimeter); grade 8
 * completes the 6-8 band (exponents/scientific notation, Pythagorean theorem,
 * transformations). Reuses the existing CCSS math domains created by seed 0009
 * (base-ten / fractions / OA&T / measurement) and seed 0011 (grade-8 EE / geometry),
 * so no duplicate domain rows are made. Idempotent; skills upsert ON CONFLICT (slug).
 * Apply with: bun run db:seed seeds/0013_grade4_8_math_questions.sql
 */
import { createHash } from 'node:crypto'
import { writeFileSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'
import { GRADE_4_8_MATH_SKILLS } from '../src/lib/grade4_8MathTemplates'
import { buildGapQuestion, seedForSlot } from '../src/lib/gapMathTemplates'

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

// Reuse the domains already created by seeds 0009 (3-5) and 0011 (6-8).
const DOMAIN: Record<string, { name: string; band: string }> = {
  'dom-math-nbt': { name: 'Number & Operations in Base Ten', band: '3-5' },
  'dom-math-frac': { name: 'Number & Operations — Fractions', band: '3-5' },
  'dom-math-oat': { name: 'Operations & Algebraic Thinking', band: '3-5' },
  'dom-math-md': { name: 'Measurement & Data', band: '3-5' },
  'dom-math-ee7': { name: 'Expressions & Equations', band: '6-8' },
  'dom-math-geo7': { name: 'Geometry', band: '6-8' },
}
const DOMAIN_BY_SLUG: Record<string, string> = {
  'multi-digit-multiplication': 'dom-math-nbt',
  'multi-digit-division': 'dom-math-nbt',
  'fraction-equivalence': 'dom-math-frac',
  'fraction-operations-4': 'dom-math-frac',
  'factors-multiples': 'dom-math-oat',
  'area-perimeter': 'dom-math-md',
  'exponents-scientific-notation': 'dom-math-ee7',
  'pythagorean-theorem': 'dom-math-geo7',
  'transformations-8': 'dom-math-geo7',
}
const md5uuid = (key: string) => `md5('pe-aos:${key.replace(/'/g, "''")}')::uuid`

const HEADER = `-- PathwayEd — Question Engine: GRADE 4 & 8 math skills + questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-grade4-8-math-seeds.ts from the
-- curated pool in src/lib/grade4_8MathTemplates.ts. Grade 4 fills out the 3-5 band;
-- grade 8 completes the 6-8 band.
--
-- HOW TO APPLY (self-contained — upserts the reused CCSS domains + the skills with
-- their CCSS tags, then the questions):
--   bun run db:seed seeds/0013_grade4_8_math_questions.sql
-- Idempotent. Skills upsert ON CONFLICT (slug) so an existing empty grade-4/8
-- placeholder row is filled in place (id preserved). Depends on migration 0004,
-- 0008, and seed 0001. Answer keys are verified by hand before this seed is run.
--
-- 100% ORIGINAL items written to one CCSS standard each, grade-appropriate.

begin;
`

let sql = HEADER

const domainsSeen = new Set<string>()
for (const skill of GRADE_4_8_MATH_SKILLS) {
  const domKey = DOMAIN_BY_SLUG[skill.slug]
  if (!domKey) throw new Error(`No domain mapped for skill "${skill.slug}"`)
  const dom = DOMAIN[domKey]
  if (!domainsSeen.has(domKey)) {
    domainsSeen.add(domKey)
    sql += `\ninsert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (${md5uuid(domKey)}, 'domain', ${md5uuid('subj-math')}, 'math', ${qq(dom.name)}, null, ${qq(dom.band)}, null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;\n`
  }
  sql += `insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (${md5uuid('skill-' + skill.slug)}, 'skill', ${md5uuid(domKey)}, 'math', ${qq(skill.name)}, ${qq(skill.slug)}, ${qq(skill.gradeBand)}, ${qq(skill.satAlignment)}, ${qq(skill.ccssGrade)}, ${skill.ccssGradeNum}, ${qq(skill.ccssCode)}, '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;\n`
}

let count = 0
for (const skill of GRADE_4_8_MATH_SKILLS) {
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

writeFileSync(join(seedsDir, '0013_grade4_8_math_questions.sql'), sql)
console.log(`Wrote seeds/0013 (${count} questions across ${GRADE_4_8_MATH_SKILLS.length} skill(s)).`)
