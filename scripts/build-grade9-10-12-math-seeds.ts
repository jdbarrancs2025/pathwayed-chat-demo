/**
 * Authoring script (run with Bun): emits the GRADE 9, 10 & 12 math question seed
 * from the curated pool in src/lib/grade9_10_12MathTemplates.ts. NOT run at
 * request time.
 *
 *   bun run scripts/build-grade9-10-12-math-seeds.ts
 *
 * Writes seeds/0012_grade9_10_12_math_questions.sql (self-contained — creates the
 * fresh CCSS math domains + skills with their CCSS grade tags, then the questions).
 * Completes the 9-12 band (Algebra 1 / Geometry / Precalculus) for the school
 * customer. Idempotent: upsert questions on a deterministic id from "{slug}:{slot}".
 *
 * Skills upsert ON CONFLICT (slug) — unlike the grade-7/11 build, this batch may
 * FILL skills that already exist in the DB (the backlogged placeholders), so we
 * key on the unique slug and update the existing row's grade/domain in place.
 * Apply with: bun run db:seed seeds/0012_grade9_10_12_math_questions.sql
 */
import { createHash } from 'node:crypto'
import { writeFileSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'
import { GRADE_9_10_12_MATH_SKILLS } from '../src/lib/grade9_10_12MathTemplates'
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

const DOMAIN: Record<string, { name: string; band: string }> = {
  'dom-math-alg9': { name: 'Algebra 1', band: '9-12' },
  'dom-math-stat-hs': { name: 'Statistics & Probability', band: '9-12' },
  'dom-math-geo-hs': { name: 'Geometry', band: '9-12' },
  'dom-math-precalc': { name: 'Precalculus', band: '9-12' },
}
const DOMAIN_BY_SLUG: Record<string, string> = {
  'linear-equations': 'dom-math-alg9',
  'linear-inequalities': 'dom-math-alg9',
  'graphing-linear-functions': 'dom-math-alg9',
  'systems-linear': 'dom-math-alg9',
  'exponent-rules': 'dom-math-alg9',
  'data-statistics': 'dom-math-stat-hs',
  'combinatorics-probability': 'dom-math-stat-hs',
  'geometry-proofs': 'dom-math-geo-hs',
  'triangle-congruence': 'dom-math-geo-hs',
  'similarity-right-triangles': 'dom-math-geo-hs',
  'circle-geometry': 'dom-math-geo-hs',
  'coordinate-geometry': 'dom-math-geo-hs',
  'trigonometric-functions': 'dom-math-precalc',
  'sequences-series': 'dom-math-precalc',
  'rational-functions': 'dom-math-precalc',
  'conic-sections': 'dom-math-precalc',
}
const md5uuid = (key: string) => `md5('pe-aos:${key.replace(/'/g, "''")}')::uuid`

const HEADER = `-- PathwayEd — Question Engine: GRADE 9, 10 & 12 math skills + questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-grade9-10-12-math-seeds.ts from
-- the curated pool in src/lib/grade9_10_12MathTemplates.ts. Completes the 9-12
-- band: Algebra 1 (grade 9), Geometry (grade 10), Precalculus (grade 12), and
-- folds in the backlogged placeholder concepts (algebra / statistics-probability /
-- geometry-proofs) as properly authored, question-backed skills.
--
-- HOW TO APPLY (self-contained — creates the fresh CCSS math domains + skills with
-- their CCSS tags, then the questions):
--   bun run db:seed seeds/0012_grade9_10_12_math_questions.sql
-- Idempotent. Skills upsert ON CONFLICT (slug) so a placeholder skill that already
-- exists in the DB is FILLED in place (its grade/domain updated, its id preserved).
-- Depends on migration 0004 (generated_questions), 0008 (skills.ccss_grade*), and
-- seed 0001 (public.skills root subject rows).
--
-- 100% ORIGINAL items written to one CCSS/course standard each, grade-appropriate.
-- Answer keys are verified by hand before this seed is run.

begin;
`

let sql = HEADER

const domainsSeen = new Set<string>()
for (const skill of GRADE_9_10_12_MATH_SKILLS) {
  const domKey = DOMAIN_BY_SLUG[skill.slug]
  if (!domKey) throw new Error(`No domain mapped for skill "${skill.slug}"`)
  const dom = DOMAIN[domKey]
  if (!domainsSeen.has(domKey)) {
    domainsSeen.add(domKey)
    sql += `\ninsert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (${md5uuid(domKey)}, 'domain', ${md5uuid('subj-math')}, 'math', ${qq(dom.name)}, null, ${qq(dom.band)}, null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;\n`
  }
  // ON CONFLICT (slug): fill an existing placeholder row in place, or create anew.
  sql += `insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (${md5uuid('skill-' + skill.slug)}, 'skill', ${md5uuid(domKey)}, 'math', ${qq(skill.name)}, ${qq(skill.slug)}, ${qq(skill.gradeBand)}, ${qq(skill.satAlignment)}, ${qq(skill.ccssGrade)}, ${skill.ccssGradeNum}, ${qq(skill.ccssCode)}, '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;\n`
}

let count = 0
for (const skill of GRADE_9_10_12_MATH_SKILLS) {
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

writeFileSync(join(seedsDir, '0012_grade9_10_12_math_questions.sql'), sql)
console.log(`Wrote seeds/0012 (${count} questions across ${GRADE_9_10_12_MATH_SKILLS.length} skill(s)).`)
