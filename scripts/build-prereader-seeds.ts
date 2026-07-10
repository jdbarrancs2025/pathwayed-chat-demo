/**
 * Authoring script (Bun): emits the K–2 PRE-READER (audio-picture) question seed
 * from the curated pool in src/lib/preReaderTemplates.ts. NOT run at request time.
 *
 *   bun run scripts/build-prereader-seeds.ts
 *
 * Writes seeds/0010_prereader_questions.sql — self-contained: creates the K.CC
 * domain + skill (with CCSS tags), then generated_questions rows marked
 * format='audio_picture' with an optional visual `prompt` and per-choice tiles.
 * Idempotent (deterministic ids). Depends on the audio-picture schema
 * (generated_questions.format + .prompt — see the proposed migration) and the
 * re-level migration (skills.ccss_*). Apply AFTER those:
 *   bun run db:seed seeds/0010_prereader_questions.sql
 */
import { createHash } from 'node:crypto'
import { writeFileSync } from 'node:fs'
import { dirname, join } from 'node:path'
import { fileURLToPath } from 'node:url'
import { PRE_READER_SKILLS, buildPreReaderItem, seedForSlot } from '../src/lib/preReaderTemplates'

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

const HEADER = `-- PathwayEd — Question Engine: K-2 PRE-READER (audio-picture) items (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-prereader-seeds.ts from the
-- curated pool in src/lib/preReaderTemplates.ts. Self-contained (creates each K
-- domain + skill with CCSS tags, then the audio-picture questions).
-- HOW TO APPLY (needs the audio-picture schema + re-level migration first):
--   bun run db:seed seeds/0010_prereader_questions.sql
-- Idempotent (deterministic ids). 100% ORIGINAL, authored to CCSS K.CC / RF.K.

begin;
`

// Optional subset publish: PRESEED_ONLY=slug1,slug2 emits only those skills (used
// to publish math ahead of reading); PRESEED_OUT overrides the output path so the
// full seeds/0010 stays intact. Default (no env) = the complete 0010 seed.
const only = process.env.PRESEED_ONLY ? new Set(process.env.PRESEED_ONLY.split(',').map((s) => s.trim())) : null
const skills = only ? PRE_READER_SKILLS.filter((s) => only.has(s.slug)) : PRE_READER_SKILLS

let sql = HEADER
let count = 0
const domainsSeen = new Set<string>()
for (const skill of skills) {
  if (!domainsSeen.has(skill.domainKey)) {
    domainsSeen.add(skill.domainKey)
    sql += `\ninsert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (${md5uuid(skill.domainKey)}, 'domain', ${md5uuid(skill.parentSubjectKey)}, ${qq(skill.subject)}, ${qq(skill.domainName)}, null, 'k-2', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;\n`
  }
  sql += `insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (${md5uuid('skill-' + skill.slug)}, 'skill', ${md5uuid(skill.domainKey)}, ${qq(skill.subject)}, ${qq(skill.name)}, ${qq(skill.slug)}, ${qq(skill.gradeBand)}, ${qq(skill.satAlignment)}, ${qq(skill.ccssGrade)}, ${skill.ccssGradeNum}, ${qq(skill.ccssCode)}, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;\n`

  sql += `\n-- ${skill.slug} (${skill.name}, grade ${skill.ccssGrade}, ${skill.ccssCode}) — ${skill.items.length} audio-picture items\n`
  for (const item of skill.items) {
    const q = buildPreReaderItem(item, seedForSlot(item.slot))
    const id = deterministicId(`${skill.slug}:${item.slot}`)
    sql += `insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  (${qq(id)}, null, (select id from public.skills where slug = ${qq(skill.slug)}),
   ${qq(skill.satAlignment)}, ${qq(q.difficulty)}, ${dq(q.stem)}, ${jsonb(q.choices)}, ${dq(q.correct_answer)}, ${dq(q.solution)},
   'published', 'audio_picture', ${q.prompt ? jsonb(q.prompt) : 'null'})
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;\n`
    count++
  }
}
sql += '\ncommit;\n'

const outPath = process.env.PRESEED_OUT ? join(here, '..', process.env.PRESEED_OUT) : join(seedsDir, '0010_prereader_questions.sql')
writeFileSync(outPath, sql)
console.log(`Wrote ${outPath} (${count} pre-reader items across ${skills.length} skill(s)).`)
