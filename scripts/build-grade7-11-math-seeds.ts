/**
 * Authoring script (run with Bun): emits the GRADE 7 & 11 math question seed from
 * the curated pool in src/lib/grade7_11MathTemplates.ts, so stored content can't
 * drift from the source. NOT run at request time.
 *
 *   bun run scripts/build-grade7-11-math-seeds.ts
 *
 * Writes seeds/0011_grade7_11_math_questions.sql (self-contained — creates the
 * fresh CCSS math domains + skills with their CCSS grade tags, then the questions).
 * Items are curated (no formula template), so template_id is null and difficulty
 * is per item. Idempotent: upsert on a deterministic id from "{slug}:{slot}".
 * Apply with: bun run db:seed seeds/0011_grade7_11_math_questions.sql
 */
import { createHash } from 'node:crypto'
import { writeFileSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'
import { GRADE_7_11_MATH_SKILLS } from '../src/lib/grade7_11MathTemplates'
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

// Fresh CCSS math domains under subj-math (one parent per CCSS domain). Grade-7
// domains sit in the 6-8 band; grade-11 in 9-12. Keys are stable so re-runs upsert.
const DOMAIN: Record<string, { name: string; band: string }> = {
  'dom-math-ns7': { name: 'The Number System', band: '6-8' },
  'dom-math-rp7': { name: 'Ratios & Proportional Relationships', band: '6-8' },
  'dom-math-ee7': { name: 'Expressions & Equations', band: '6-8' },
  'dom-math-geo7': { name: 'Geometry', band: '6-8' },
  'dom-math-sp7': { name: 'Statistics & Probability', band: '6-8' },
  'dom-math-apr11': { name: 'Polynomials & Rational Expressions', band: '9-12' },
  'dom-math-fn11': { name: 'Functions', band: '9-12' },
  'dom-math-eq11': { name: 'Reasoning with Equations & Inequalities', band: '9-12' },
}
const DOMAIN_BY_SLUG: Record<string, string> = {
  // Grade 7
  'rational-number-operations': 'dom-math-ns7',
  'percent-applications': 'dom-math-rp7',
  'two-step-equations': 'dom-math-ee7',
  'angles-area-volume': 'dom-math-geo7',
  'probability-models': 'dom-math-sp7',
  // Grade 11 (appended in the next slice)
  'polynomial-operations': 'dom-math-apr11',
  'rational-radical-expressions': 'dom-math-apr11',
  'quadratic-functions': 'dom-math-fn11',
  'exponential-logarithmic': 'dom-math-fn11',
  'systems-of-equations': 'dom-math-eq11',
}
const md5uuid = (key: string) => `md5('pe-aos:${key.replace(/'/g, "''")}')::uuid`

const HEADER = `-- PathwayEd — Question Engine: GRADE 7 & 11 math skills + questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-grade7-11-math-seeds.ts from the
-- curated pool in src/lib/grade7_11MathTemplates.ts. HOW TO APPLY (self-contained —
-- creates the fresh CCSS math domains + skills with their CCSS tags, then the
-- questions):
--   bun run db:seed seeds/0011_grade7_11_math_questions.sql
-- Idempotent (deterministic ids). Depends on migration 0004 (generated_questions),
-- migration 0008 (skills.ccss_grade/ccss_grade_num/ccss_code) and seed 0001
-- (public.skills root subject rows). Widens placement breadth at grades 7 & 11.
--
-- 100% ORIGINAL items written to one exact Common Core standard each, in
-- grade-appropriate language — no published curriculum, workbook, or test copied.

begin;
`

let sql = HEADER

const domainsSeen = new Set<string>()
for (const skill of GRADE_7_11_MATH_SKILLS) {
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
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;\n`
}

let count = 0
for (const skill of GRADE_7_11_MATH_SKILLS) {
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

writeFileSync(join(seedsDir, '0011_grade7_11_math_questions.sql'), sql)
console.log(`Wrote seeds/0011 (${count} questions across ${GRADE_7_11_MATH_SKILLS.length} skill(s)).`)
