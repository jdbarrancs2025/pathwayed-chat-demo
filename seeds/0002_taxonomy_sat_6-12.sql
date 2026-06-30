-- PathwayEd — SAT build, Stage 1: SAT-align the taxonomy and seed the 6-12 ladder.
--
-- HOW TO APPLY: paste into the Supabase SQL editor and run (same flow as
-- seeds/0001). Idempotent; safe to re-run. Depends on migration 0001 and
-- seed 0001 (reuses the existing Subject rows and the 3-5 skills).
--
-- WHAT IT DOES (additive only, taxonomy data — NO engine/view):
--   * 8 SAT domain rows (the digital-SAT domains) under the Mathematics /
--     Reading / Writing subjects, each tagged with its SAT domain token
--     (sat_alignment) and its SAT section (description: 'math' | 'reading-writing').
--   * 6-8 and 9-12 skill ladder; each skill's slug equals a focusAreas value
--     (focusAreas.ts updated in the same change) and is tagged with its SAT
--     domain token.
--   * BRIDGE: tags the existing 3-5 skills' sat_alignment to the SAT domain they
--     feed, so earlier practice counts toward SAT readiness (Stage 2/3).
--
-- sat_alignment token set (used identically on new skills AND bridge tags):
--   MATH: algebra | advanced-math | problem-solving-data-analysis | geometry-trigonometry
--   R&W : information-and-ideas | craft-and-structure | expression-of-ideas | standard-english-conventions
--
-- IDEMPOTENT: deterministic id = md5('pe-aos:'||key)::uuid + on conflict (id)
-- do update. NO delete-on-reseed (never cascade-wipes student_skill_mastery).

begin;

create temporary table _seed (
  key                 text primary key,
  level               text not null,
  parent_key          text,           -- references _seed.key OR an existing skills row (by md5 id)
  subject             text not null,
  name                text not null,
  slug                text,
  grade_band          text,
  sat_alignment       text,
  description         text,           -- SAT section token on domain rows
  prerequisite_skills text[] not null default '{}'
) on commit drop;

insert into _seed
  (key, level, parent_key, subject, name, slug, grade_band, sat_alignment, description, prerequisite_skills)
values
  -- ============ SAT DOMAIN ROWS (8) ============
  -- Math section (under the existing 'subj-math' Mathematics subject)
  ('dom-sat-algebra',          'domain', 'subj-math',    'math',    'Algebra',                          null, null, 'algebra',                       'math',            '{}'),
  ('dom-sat-advanced-math',    'domain', 'subj-math',    'math',    'Advanced Math',                    null, null, 'advanced-math',                 'math',            '{}'),
  ('dom-sat-psda',             'domain', 'subj-math',    'math',    'Problem-Solving & Data Analysis',  null, null, 'problem-solving-data-analysis', 'math',            '{}'),
  ('dom-sat-geo-trig',         'domain', 'subj-math',    'math',    'Geometry & Trigonometry',          null, null, 'geometry-trigonometry',         'math',            '{}'),
  -- Reading & Writing section (under the existing Reading / Writing subjects)
  ('dom-sat-info-ideas',       'domain', 'subj-reading', 'reading', 'Information & Ideas',              null, null, 'information-and-ideas',         'reading-writing', '{}'),
  ('dom-sat-craft-structure',  'domain', 'subj-reading', 'reading', 'Craft & Structure',               null, null, 'craft-and-structure',           'reading-writing', '{}'),
  ('dom-sat-expression',       'domain', 'subj-writing', 'writing', 'Expression of Ideas',              null, null, 'expression-of-ideas',           'reading-writing', '{}'),
  ('dom-sat-conventions',      'domain', 'subj-writing', 'writing', 'Standard English Conventions',     null, null, 'standard-english-conventions',  'reading-writing', '{}'),

  -- ============ 6-8 SKILL LADDER ============
  ('skill-ratios',             'skill', 'dom-sat-psda',          'math', 'Ratios & Proportions',  'ratios',                 '6-8', 'problem-solving-data-analysis', null, array['multiplication','division']),
  ('skill-percentages',        'skill', 'dom-sat-psda',          'math', 'Percentages',           'percentages',            '6-8', 'problem-solving-data-analysis', null, array['ratios','fractions']),
  ('skill-expressions',        'skill', 'dom-sat-algebra',       'math', 'Expressions',           'expressions',            '6-8', 'algebra',                       null, array['ratios']),
  ('skill-proportional',       'skill', 'dom-sat-psda',          'math', 'Proportional Reasoning','proportional-reasoning', '6-8', 'problem-solving-data-analysis', null, array['ratios','percentages']),
  ('skill-linear-thinking',    'skill', 'dom-sat-algebra',       'math', 'Linear Thinking',       'linear-thinking',        '6-8', 'algebra',                       null, array['expressions']),
  ('skill-algebra-1',          'skill', 'dom-sat-algebra',       'math', 'Algebra 1 Concepts',    'algebra-1-concepts',     '6-8', 'algebra',                       null, array['expressions','linear-thinking']),
  ('skill-functions',          'skill', 'dom-sat-advanced-math', 'math', 'Functions',             'functions',              '6-8', 'advanced-math',                 null, array['algebra-1-concepts','linear-thinking']),
  ('skill-data-analysis',      'skill', 'dom-sat-psda',          'math', 'Data Analysis',         'data-analysis',          '6-8', 'problem-solving-data-analysis', null, array['percentages','proportional-reasoning']),

  -- ============ 9-12 SKILL LADDER ============
  ('skill-hs-geometry',        'skill', 'dom-sat-geo-trig',      'math',    'Geometry (HS)',        'hs-geometry',            '9-12', 'geometry-trigonometry', null, array['geometry']),
  ('skill-algebra-2',          'skill', 'dom-sat-advanced-math', 'math',    'Algebra 2',            'algebra-2',              '9-12', 'advanced-math',         null, array['algebra-1-concepts']),
  ('skill-advanced-functions', 'skill', 'dom-sat-advanced-math', 'math',    'Advanced Functions',   'advanced-functions',     '9-12', 'advanced-math',         null, array['functions','algebra-2']),
  ('skill-evidence-reading',   'skill', 'dom-sat-info-ideas',    'reading', 'Evidence-Based Reading','evidence-based-reading', '9-12', 'information-and-ideas',  null, array['reading-comprehension','main-idea']),
  ('skill-writing-structure',  'skill', 'dom-sat-expression',    'writing', 'Writing Structure',    'writing-structure',      '9-12', 'expression-of-ideas',   null, array['paragraph-writing']);

-- ---- Assertion 1: every parent_key resolves (in this seed OR existing skills) -
do $$
declare bad text;
begin
  select s.parent_key into bad
  from _seed s
  where s.parent_key is not null
    and not exists (select 1 from _seed p where p.key = s.parent_key)
    and not exists (select 1 from public.skills k where k.id = md5('pe-aos:' || s.parent_key)::uuid)
  limit 1;
  if bad is not null then
    raise exception 'Seed error: parent_key "%" not found in this seed or existing skills', bad;
  end if;
end $$;

-- ---- Assertion 2: every prerequisite slug resolves (this seed OR existing) ----
do $$
declare bad text;
begin
  select p into bad
  from (select distinct unnest(prerequisite_skills) as p from _seed) q
  where not exists (select 1 from _seed s where s.slug = q.p)
    and not exists (select 1 from public.skills k where k.slug = q.p)
  limit 1;
  if bad is not null then
    raise exception 'Seed error: prerequisite slug "%" not found in this seed or existing skills', bad;
  end if;
end $$;

-- ---- Upsert the new domain + skill rows (domains before skills for the FK) ----
insert into public.skills
  (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills, description)
select
  md5('pe-aos:' || s.key)::uuid,
  s.level::public.skill_level,
  case when s.parent_key is null then null else md5('pe-aos:' || s.parent_key)::uuid end,
  s.subject,
  s.name,
  s.slug,
  s.grade_band::public.grade_band,
  s.sat_alignment,
  s.prerequisite_skills,
  s.description
from _seed s
order by case s.level when 'subject' then 0 when 'domain' then 1 when 'skill' then 2 else 3 end
on conflict (id) do update set
  level               = excluded.level,
  parent_id           = excluded.parent_id,
  subject             = excluded.subject,
  name                = excluded.name,
  slug                = excluded.slug,
  grade_band          = excluded.grade_band,
  sat_alignment       = excluded.sat_alignment,
  prerequisite_skills = excluded.prerequisite_skills,
  description          = excluded.description;

-- ---- BRIDGE: tag the EXISTING 3-5 skills with the SAT domain they feed --------
-- Idempotent (sets the same token each run); only touches sat_alignment.
update public.skills set sat_alignment = 'problem-solving-data-analysis'
  where slug in ('fractions', 'multiplication', 'division');
update public.skills set sat_alignment = 'geometry-trigonometry'
  where slug = 'geometry';
update public.skills set sat_alignment = 'information-and-ideas'
  where slug in ('main-idea', 'reading-comprehension', 'story-elements');
update public.skills set sat_alignment = 'craft-and-structure'
  where slug = 'vocabulary';
update public.skills set sat_alignment = 'expression-of-ideas'
  where slug in ('sentence-writing', 'paragraph-writing', 'short-response', 'creative-writing');

-- ---- Report ------------------------------------------------------------------
do $$
declare n_dom int; n_skill int; n_bridged int;
begin
  select count(*) into n_dom from public.skills where level = 'domain' and sat_alignment is not null;
  select count(*) into n_skill from public.skills where level = 'skill' and grade_band in ('6-8','9-12');
  select count(*) into n_bridged from public.skills where level = 'skill' and grade_band = '3-5' and sat_alignment is not null;
  raise notice 'SAT taxonomy seed: % SAT domains, % skills in 6-8/9-12, % bridged 3-5 skills.', n_dom, n_skill, n_bridged;
end $$;

commit;
