-- PathwayEd — SAT taxonomy: seed the Standard English Conventions domain.
--
-- HOW TO APPLY: run the THREE chunks below in order in the Supabase SQL editor.
-- They are split into independent transactions (no shared temp table) so each
-- pastes safely on its own and Supabase paste-truncation can't leave a half-run
-- transaction. Depends on migration 0001 and seed 0002 (reuses the existing
-- 'dom-sat-conventions' domain row and the 3-5 'sentence-writing' skill).
--
-- WHY: the SAT R&W domain 'standard-english-conventions' had 0 skills mapped, so
-- Reading & Writing readiness projected from only 3 of its 4 domains. This adds a
-- grammar/conventions skill ladder (6-8 -> 9-12) under that domain so the 4th
-- domain is populated (it contributes to the trajectory ceiling + missing list
-- immediately, and to the today score once a student practices it).
--
-- CONVENTIONS (mirror seed 0002): level='skill', subject='writing', unique
-- kebab-case slug, grade_band in ('6-8','9-12'), sat_alignment=
-- 'standard-english-conventions', prerequisite_skills as an array of SLUGS.
--
-- IDEMPOTENT: deterministic id = md5('pe-aos:'||key)::uuid + on conflict (id)
-- do update. NO delete-on-reseed (never cascade-wipes student_skill_mastery).
-- Prerequisite slugs are resolved/asserted in CHUNK 3 after all rows exist.

-- =====================================================================
-- CHUNK 1 of 3 — 6-8 conventions ladder (foundations)
-- =====================================================================
begin;

-- Guard: the parent SAT domain must already exist (seed 0002). Clear message
-- instead of a raw foreign-key error if seed 0002 hasn't been run.
do $$ begin
  if not exists (select 1 from public.skills where id = md5('pe-aos:dom-sat-conventions')::uuid) then
    raise exception 'Missing parent domain dom-sat-conventions — run seed 0002 first.';
  end if;
end $$;

insert into public.skills
  (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills, description)
values
  (md5('pe-aos:skill-sentence-structure')::uuid, 'skill'::public.skill_level, md5('pe-aos:dom-sat-conventions')::uuid, 'writing', 'Sentence Structure',           'sentence-structure',       '6-8'::public.grade_band, 'standard-english-conventions', array['sentence-writing'],       null),
  (md5('pe-aos:skill-subject-verb-agree')::uuid, 'skill'::public.skill_level, md5('pe-aos:dom-sat-conventions')::uuid, 'writing', 'Subject-Verb Agreement',       'subject-verb-agreement',   '6-8'::public.grade_band, 'standard-english-conventions', array['sentence-structure'],     null),
  (md5('pe-aos:skill-pronoun-agreement')::uuid,  'skill'::public.skill_level, md5('pe-aos:dom-sat-conventions')::uuid, 'writing', 'Pronoun-Antecedent Agreement', 'pronoun-agreement',        '6-8'::public.grade_band, 'standard-english-conventions', array['sentence-structure'],     null),
  (md5('pe-aos:skill-verb-tense')::uuid,         'skill'::public.skill_level, md5('pe-aos:dom-sat-conventions')::uuid, 'writing', 'Verb Tense & Form',            'verb-tense-and-form',      '6-8'::public.grade_band, 'standard-english-conventions', array['subject-verb-agreement'], null),
  (md5('pe-aos:skill-punctuation-basics')::uuid, 'skill'::public.skill_level, md5('pe-aos:dom-sat-conventions')::uuid, 'writing', 'Commas & End Punctuation',     'punctuation-basics',       '6-8'::public.grade_band, 'standard-english-conventions', array['sentence-structure'],     null)
on conflict (id) do update set
  level = excluded.level, parent_id = excluded.parent_id, subject = excluded.subject,
  name = excluded.name, slug = excluded.slug, grade_band = excluded.grade_band,
  sat_alignment = excluded.sat_alignment, prerequisite_skills = excluded.prerequisite_skills,
  description = excluded.description;

commit;

-- =====================================================================
-- CHUNK 2 of 3 — 9-12 conventions ladder (SAT-level)
-- =====================================================================
begin;

insert into public.skills
  (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills, description)
values
  (md5('pe-aos:skill-advanced-punctuation')::uuid, 'skill'::public.skill_level, md5('pe-aos:dom-sat-conventions')::uuid, 'writing', 'Advanced Punctuation',      'advanced-punctuation',        '9-12'::public.grade_band, 'standard-english-conventions', array['punctuation-basics'],                      null),
  (md5('pe-aos:skill-possessives')::uuid,          'skill'::public.skill_level, md5('pe-aos:dom-sat-conventions')::uuid, 'writing', 'Possessives & Apostrophes', 'possessives-and-apostrophes', '9-12'::public.grade_band, 'standard-english-conventions', array['pronoun-agreement'],                       null),
  (md5('pe-aos:skill-modifier-placement')::uuid,   'skill'::public.skill_level, md5('pe-aos:dom-sat-conventions')::uuid, 'writing', 'Modifier Placement',        'modifier-placement',          '9-12'::public.grade_band, 'standard-english-conventions', array['sentence-structure'],                      null),
  (md5('pe-aos:skill-sentence-boundaries')::uuid,  'skill'::public.skill_level, md5('pe-aos:dom-sat-conventions')::uuid, 'writing', 'Sentence Boundaries',       'sentence-boundaries',         '9-12'::public.grade_band, 'standard-english-conventions', array['sentence-structure','advanced-punctuation'], null)
on conflict (id) do update set
  level = excluded.level, parent_id = excluded.parent_id, subject = excluded.subject,
  name = excluded.name, slug = excluded.slug, grade_band = excluded.grade_band,
  sat_alignment = excluded.sat_alignment, prerequisite_skills = excluded.prerequisite_skills,
  description = excluded.description;

commit;

-- =====================================================================
-- CHUNK 3 of 3 — assert every prerequisite slug resolves + report
-- =====================================================================
begin;

-- Assertion: every prerequisite slug on the conventions skills resolves to a
-- real skill row (in this domain OR anywhere in the taxonomy, e.g. the 3-5
-- 'sentence-writing' anchor). Raises loudly if a chunk was skipped/mis-pasted.
do $$
declare bad text;
begin
  select p into bad
  from (
    select distinct unnest(prerequisite_skills) as p
    from public.skills
    where level = 'skill' and sat_alignment = 'standard-english-conventions'
  ) q
  where not exists (select 1 from public.skills k where k.slug = q.p)
  limit 1;
  if bad is not null then
    raise exception 'Prerequisite slug "%" does not resolve — did chunk 1/2 run?', bad;
  end if;
end $$;

-- Report: expect 9 total (5 in 6-8, 4 in 9-12).
do $$
declare n_conv int; n_68 int; n_912 int;
begin
  select count(*) into n_conv from public.skills where level='skill' and sat_alignment='standard-english-conventions';
  select count(*) into n_68  from public.skills where level='skill' and sat_alignment='standard-english-conventions' and grade_band='6-8';
  select count(*) into n_912 from public.skills where level='skill' and sat_alignment='standard-english-conventions' and grade_band='9-12';
  raise notice 'Conventions seed: % skills tagged standard-english-conventions (% in 6-8, % in 9-12).', n_conv, n_68, n_912;
end $$;

commit;
