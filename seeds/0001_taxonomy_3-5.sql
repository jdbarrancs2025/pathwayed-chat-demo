-- PathwayEd — Academic OS, Phase 1 seed: starter taxonomy, grade band 3-5 only.
--
-- HOW TO APPLY: paste this whole file into the Supabase SQL editor and run it
-- (same flow as migrations/0001). This is a SEED (data), not schema — it depends
-- on migration 0001 already having run. Idempotent: safe to re-run.
--
-- WHAT IT SEEDS: the Subject -> Domain -> Skill (-> MicroSkill) tree for Math and
-- ELA (Reading + Writing strands) in the 3-5 band ONLY. Every Skill-level row's
-- `slug` is a REAL focusAreas value from src/lib/focusAreas.ts['3-5'] — no
-- invented slugs — so the Step 3 resolver joins focusAreas value -> skills.slug.
--
-- IDEMPOTENCY: each node gets a deterministic id = md5('pe-aos:'||key)::uuid, so
-- re-running upserts the SAME rows (on conflict (id) do update) and never creates
-- duplicates or disturbs existing student_skill_mastery rows (their skill_id ->
-- these stable ids). We do NOT delete skills on reseed (that would cascade and
-- wipe mastery).
--
-- SAFETY: before inserting, we assert every slug referenced in any row's
-- prerequisite_skills resolves to a real slug in this seed set, and every
-- parent_key resolves to a node in this seed set. Either failure RAISEs and
-- rolls back the whole transaction, naming the offending value.

begin;

-- Staging table for the seed rows (dropped automatically at commit).
create temporary table _seed (
  key                 text primary key,
  level               text not null,         -- subject|domain|skill|microskill
  parent_key          text,                  -- references _seed.key (null at root)
  subject             text not null,         -- app subject: math|reading|writing
  name                text not null,
  slug                text,                  -- = focusAreas value on Skill rows
  grade_band          text,                  -- null on Subject rows that span bands
  prerequisite_skills text[] not null default '{}'
) on commit drop;

insert into _seed (key, level, parent_key, subject, name, slug, grade_band, prerequisite_skills) values
  -- ===== MATH =====
  ('subj-math',              'subject',    null,                      'math',    'Mathematics',                       null,                   null,  '{}'),

  ('dom-math-frac',          'domain',     'subj-math',               'math',    'Number & Operations — Fractions',   null,                   '3-5', '{}'),
  ('skill-fractions',        'skill',      'dom-math-frac',           'math',    'Understanding Fractions',           'fractions',            '3-5', '{}'),
  ('micro-equiv-fractions',  'microskill', 'skill-fractions',         'math',    'Equivalent Fractions',              null,                   '3-5', '{}'),

  ('dom-math-oat',           'domain',     'subj-math',               'math',    'Operations & Algebraic Thinking',   null,                   '3-5', '{}'),
  ('skill-multiplication',   'skill',      'dom-math-oat',            'math',    'Multiplication',                    'multiplication',       '3-5', '{}'),
  ('skill-division',         'skill',      'dom-math-oat',            'math',    'Division',                          'division',             '3-5', array['multiplication']),

  ('dom-math-geo',           'domain',     'subj-math',               'math',    'Geometry',                          null,                   '3-5', '{}'),
  ('skill-geometry',         'skill',      'dom-math-geo',            'math',    'Geometry',                          'geometry',             '3-5', '{}'),

  -- ===== ELA: READING strand =====
  ('subj-reading',           'subject',    null,                      'reading', 'English Language Arts — Reading',    null,                   null,  '{}'),

  ('dom-reading-kid',        'domain',     'subj-reading',            'reading', 'Key Ideas & Details',               null,                   '3-5', '{}'),
  ('skill-main-idea',        'skill',      'dom-reading-kid',         'reading', 'Main Idea',                         'main-idea',            '3-5', '{}'),
  ('skill-reading-comp',     'skill',      'dom-reading-kid',         'reading', 'Reading Comprehension',             'reading-comprehension','3-5', array['main-idea','vocabulary']),

  ('dom-reading-craft',      'domain',     'subj-reading',            'reading', 'Craft & Structure',                 null,                   '3-5', '{}'),
  ('skill-story-elements',   'skill',      'dom-reading-craft',       'reading', 'Story Elements',                    'story-elements',       '3-5', array['reading-comprehension']),

  ('dom-reading-vocab',      'domain',     'subj-reading',            'reading', 'Vocabulary Acquisition & Use',      null,                   '3-5', '{}'),
  ('skill-vocabulary',       'skill',      'dom-reading-vocab',       'reading', 'Vocabulary',                        'vocabulary',           '3-5', '{}'),

  -- ===== ELA: WRITING strand =====
  ('subj-writing',           'subject',    null,                      'writing', 'English Language Arts — Writing',    null,                   null,  '{}'),

  ('dom-writing-foundations','domain',     'subj-writing',            'writing', 'Sentence & Paragraph Construction', null,                   '3-5', '{}'),
  ('skill-sentence-writing', 'skill',      'dom-writing-foundations', 'writing', 'Sentence Writing',                  'sentence-writing',     '3-5', '{}'),
  ('skill-paragraph-writing','skill',      'dom-writing-foundations', 'writing', 'Paragraph Writing',                 'paragraph-writing',    '3-5', array['sentence-writing']),

  ('dom-writing-composition','domain',     'subj-writing',            'writing', 'Composition & Response',            null,                   '3-5', '{}'),
  ('skill-short-response',   'skill',      'dom-writing-composition', 'writing', 'Short Response',                    'short-response',       '3-5', array['sentence-writing']),
  ('skill-creative-writing', 'skill',      'dom-writing-composition', 'writing', 'Creative Writing',                  'creative-writing',     '3-5', array['paragraph-writing']);

-- ---- Assertion 1: every parent_key resolves to a node in this seed ----------
do $$
declare bad text;
begin
  select s.parent_key into bad
  from _seed s
  where s.parent_key is not null
    and not exists (select 1 from _seed p where p.key = s.parent_key)
  limit 1;
  if bad is not null then
    raise exception 'Seed error: parent_key "%" does not match any node key in the seed set', bad;
  end if;
end $$;

-- ---- Assertion 2: every prerequisite slug resolves to a real slug -----------
-- Fail loudly (and name the slug) on a typo BEFORE anything is written.
do $$
declare bad text;
begin
  select p into bad
  from (select distinct unnest(prerequisite_skills) as p from _seed) prereqs
  where not exists (select 1 from _seed s where s.slug = prereqs.p)
  limit 1;
  if bad is not null then
    raise exception 'Seed error: prerequisite slug "%" does not resolve to any skills.slug in the seed set', bad;
  end if;
end $$;

-- ---- Upsert into the real taxonomy table ------------------------------------
-- Ordered Subject -> Domain -> Skill -> MicroSkill so each row's parent exists
-- before its (immediate, non-deferrable) FK is checked within this statement.
insert into public.skills
  (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
select
  md5('pe-aos:' || s.key)::uuid,
  s.level::public.skill_level,
  case when s.parent_key is null then null else md5('pe-aos:' || s.parent_key)::uuid end,
  s.subject,
  s.name,
  s.slug,
  s.grade_band::public.grade_band,
  null,                       -- sat_alignment: forward-compat, filled in Phase 2
  s.prerequisite_skills
from _seed s
order by case s.level
           when 'subject'    then 0
           when 'domain'     then 1
           when 'skill'      then 2
           when 'microskill' then 3
         end
on conflict (id) do update set
  level               = excluded.level,
  parent_id           = excluded.parent_id,
  subject             = excluded.subject,
  name                = excluded.name,
  slug                = excluded.slug,
  grade_band          = excluded.grade_band,
  sat_alignment       = excluded.sat_alignment,
  prerequisite_skills = excluded.prerequisite_skills;

-- ---- Report what landed -----------------------------------------------------
do $$
declare n_total int; n_skills int;
begin
  select count(*) into n_total  from public.skills where subject in ('math','reading','writing') and (grade_band = '3-5' or level = 'subject');
  select count(*) into n_skills from public.skills where grade_band = '3-5' and level = 'skill';
  raise notice 'Taxonomy seed (3-5) applied: % Skill-level rows with focusAreas slugs; % total taxonomy rows touched.', n_skills, n_total;
end $$;

commit;
