-- PathwayEd — Question Engine: PREP number series skills + questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-prep-seeds.ts from the curated
-- pools in src/lib/prep/*Templates.ts. HOW TO APPLY (self-contained — creates the
-- isolated prep subject + domain + skills, then the questions):
--   bun run db:seed seeds/0018_prep_number_series_questions.sql
-- Idempotent (deterministic ids). Depends on migration 0004 (generated_questions).
-- Prep subjects are isolated from the K-12 tree; the prep engine reaches these by slug.
--
-- 100% ORIGINAL grade 6-8 items. Every item has 4 choices, one correct, and three
-- distractors that are each a specific wrong path (with a mapped misconception).

begin;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:subj-prep-quant')::uuid, 'subject', null, 'prep-quant', 'Test Prep — Quantitative', null, null, null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-prep-quant')::uuid, 'domain', md5('pe-aos:subj-prep-quant')::uuid, 'prep-quant', 'Quantitative Reasoning', null, null, null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:skill-prep-number-series')::uuid, 'skill', md5('pe-aos:dom-prep-quant')::uuid, 'prep-quant', 'Number Series', 'prep-number-series', '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band;

-- prep-number-series (Number Series) — 84 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f5e05cfb-688d-537b-ab59-c39429a21163', null, (select id from public.skills where slug = 'prep-number-series'), null, 'easy',
   $q$What number comes next: 2, 5, 8, 11, ___ ?$q$, $q$[{"text":"17","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"14","is_correct":true},{"text":"22","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"19","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$14$q$, $q$Each term adds 3 (arithmetic): 11 + 3 = 14.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5e198f47-7ca3-58fa-8d15-00f3711062ba', null, (select id from public.skills where slug = 'prep-number-series'), null, 'easy',
   $q$What number comes next: 1, 6, 11, 16, ___ ?$q$, $q$[{"text":"26","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"32","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"21","is_correct":true},{"text":"27","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$21$q$, $q$Each term adds 5 (arithmetic): 16 + 5 = 21.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f0a9a94a-9351-59c6-91ca-385de80092c4', null, (select id from public.skills where slug = 'prep-number-series'), null, 'easy',
   $q$What number comes next: 4, 6, 8, 10, ___ ?$q$, $q$[{"text":"14","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"20","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"18","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"12","is_correct":true}]$q$::jsonb, $q$12$q$, $q$Each term adds 2 (arithmetic): 10 + 2 = 12.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1243f9bc-8753-57b7-a35e-02fe54e1a3be', null, (select id from public.skills where slug = 'prep-number-series'), null, 'easy',
   $q$What number comes next: 3, 7, 11, 15, ___ ?$q$, $q$[{"text":"19","is_correct":true},{"text":"23","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"30","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"26","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$19$q$, $q$Each term adds 4 (arithmetic): 15 + 4 = 19.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cd811816-39ca-5f60-82f4-07aceede12d1', null, (select id from public.skills where slug = 'prep-number-series'), null, 'easy',
   $q$What number comes next: 5, 10, 15, 20, ___ ?$q$, $q$[{"text":"30","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"25","is_correct":true},{"text":"40","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"35","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$25$q$, $q$Each term adds 5 (arithmetic): 20 + 5 = 25.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5fe8020a-f339-5326-a923-6114b97f32fa', null, (select id from public.skills where slug = 'prep-number-series'), null, 'easy',
   $q$What number comes next: 6, 9, 12, 15, ___ ?$q$, $q$[{"text":"21","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"30","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"18","is_correct":true},{"text":"27","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$18$q$, $q$Each term adds 3 (arithmetic): 15 + 3 = 18.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('35889136-ffb8-5d2a-bdff-3ddb49a70388', null, (select id from public.skills where slug = 'prep-number-series'), null, 'easy',
   $q$What number comes next: 2, 9, 16, 23, ___ ?$q$, $q$[{"text":"37","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"46","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"39","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"30","is_correct":true}]$q$::jsonb, $q$30$q$, $q$Each term adds 7 (arithmetic): 23 + 7 = 30.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1b234909-7787-5569-ae22-fdeb4aca9e57', null, (select id from public.skills where slug = 'prep-number-series'), null, 'easy',
   $q$What number comes next: 10, 20, 30, 40, ___ ?$q$, $q$[{"text":"50","is_correct":true},{"text":"60","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"80","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"70","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$50$q$, $q$Each term adds 10 (arithmetic): 40 + 10 = 50.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d5c1fdcf-6d92-535a-9f86-13a95bb1bd4e', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 7, 13, 19, 25, ___ ?$q$, $q$[{"text":"37","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"31","is_correct":true},{"text":"50","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"44","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$31$q$, $q$Each term adds 6 (arithmetic): 25 + 6 = 31.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a0f7eaa5-508d-5117-9446-290ae04f01ce', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 12, 20, 28, 36, ___ ?$q$, $q$[{"text":"52","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"72","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"44","is_correct":true},{"text":"64","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$44$q$, $q$Each term adds 8 (arithmetic): 36 + 8 = 44.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cbac1c98-7d73-5e22-967c-0c666fd0d92d', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 9, 20, 31, 42, ___ ?$q$, $q$[{"text":"64","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"84","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"73","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"53","is_correct":true}]$q$::jsonb, $q$53$q$, $q$Each term adds 11 (arithmetic): 42 + 11 = 53.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1f0407a2-abb5-5bb6-a18d-f5f7269c939c', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 15, 24, 33, 42, ___ ?$q$, $q$[{"text":"51","is_correct":true},{"text":"60","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"84","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"75","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$51$q$, $q$Each term adds 9 (arithmetic): 42 + 9 = 51.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f5c4038a-599c-5531-b3ab-9d7b5cfdf5a2', null, (select id from public.skills where slug = 'prep-number-series'), null, 'easy',
   $q$What number is missing: 2, 5, ___, 11, 14 ?$q$, $q$[{"text":"11","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"8","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"16","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$8$q$, $q$Each term adds 3 (arithmetic): 5 + 3 = 8.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3830b7cc-aade-5caf-bc54-4e2a214480fe', null, (select id from public.skills where slug = 'prep-number-series'), null, 'easy',
   $q$What number is missing: 5, 7, ___, 11, 13 ?$q$, $q$[{"text":"11","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"14","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"9","is_correct":true},{"text":"18","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$9$q$, $q$Each term adds 2 (arithmetic): 7 + 2 = 9.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cf02796e-1351-5269-8109-331e39450c89', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number is missing: 3, 10, ___, 24, 31 ?$q$, $q$[{"text":"24","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"20","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"34","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"17","is_correct":true}]$q$::jsonb, $q$17$q$, $q$Each term adds 7 (arithmetic): 10 + 7 = 17.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0aa09c12-a832-55d2-adb7-3b9fd6e28a4d', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number is missing: 8, 11, ___, 17, 20 ?$q$, $q$[{"text":"14","is_correct":true},{"text":"17","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"22","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"28","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$14$q$, $q$Each term adds 3 (arithmetic): 11 + 3 = 14.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('12775b20-e0f7-5b55-870d-2f40c1b51658', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number is missing: 4, 13, ___, 31, 40 ?$q$, $q$[{"text":"31","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"22","is_correct":true},{"text":"26","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"44","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$22$q$, $q$Each term adds 9 (arithmetic): 13 + 9 = 22.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0eec2651-adfe-5f71-95db-999696371ac8', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number is missing: 10, 14, ___, 22, 26 ?$q$, $q$[{"text":"22","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"28","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"18","is_correct":true},{"text":"36","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$18$q$, $q$Each term adds 4 (arithmetic): 14 + 4 = 18.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('70dc879a-e36a-5daf-b0b3-5e4e2b635e14', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 1, 2, 4, 8, ___ ?$q$, $q$[{"text":"32","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"12","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"9","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"16","is_correct":true}]$q$::jsonb, $q$16$q$, $q$Each term multiplies by 2 (geometric): 8 × 2 = 16.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ceb59ead-de5f-5371-a624-cde689aea1d6', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 2, 4, 8, 16, ___ ?$q$, $q$[{"text":"32","is_correct":true},{"text":"64","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"24","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"18","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$32$q$, $q$Each term multiplies by 2 (geometric): 16 × 2 = 32.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dac0ae5a-184b-50f7-8f88-2ec614dee91b', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 3, 6, 12, 24, ___ ?$q$, $q$[{"text":"96","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"48","is_correct":true},{"text":"36","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"27","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$48$q$, $q$Each term multiplies by 2 (geometric): 24 × 2 = 48.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dfd06d2b-ec20-50a1-a7a9-a5b01b0274b0', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 4, 8, 16, 32, ___ ?$q$, $q$[{"text":"128","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"48","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"64","is_correct":true},{"text":"36","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$64$q$, $q$Each term multiplies by 2 (geometric): 32 × 2 = 64.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('73634dd6-fb62-5bee-8be5-511e776f2a93', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 5, 10, 20, 40, ___ ?$q$, $q$[{"text":"160","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"60","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"45","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"80","is_correct":true}]$q$::jsonb, $q$80$q$, $q$Each term multiplies by 2 (geometric): 40 × 2 = 80.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('976270da-50e6-5bdf-b26b-29cd1efb88d6', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 6, 12, 24, 48, ___ ?$q$, $q$[{"text":"96","is_correct":true},{"text":"192","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"72","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"54","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$96$q$, $q$Each term multiplies by 2 (geometric): 48 × 2 = 96.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0e8b97e5-07ae-52be-be6e-3c6070f6da23', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 1, 3, 9, 27, ___ ?$q$, $q$[{"text":"243","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"81","is_correct":true},{"text":"45","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"29","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$81$q$, $q$Each term multiplies by 3 (geometric): 27 × 3 = 81.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7f08bc29-086f-56b0-a7c0-54eaabca1e1e', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 2, 6, 18, 54, ___ ?$q$, $q$[{"text":"486","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"90","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"162","is_correct":true},{"text":"58","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$162$q$, $q$Each term multiplies by 3 (geometric): 54 × 3 = 162.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cb51c7ca-2008-5f65-b2dd-58421568c1a5', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 3, 9, 27, 81, ___ ?$q$, $q$[{"text":"729","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"135","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"87","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"243","is_correct":true}]$q$::jsonb, $q$243$q$, $q$Each term multiplies by 3 (geometric): 81 × 3 = 243.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('82a72469-68fb-586f-a328-9d68aad86d76', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 1, 4, 16, 64, ___ ?$q$, $q$[{"text":"256","is_correct":true},{"text":"1024","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"112","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"67","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$256$q$, $q$Each term multiplies by 4 (geometric): 64 × 4 = 256.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9012f464-abb2-5fc2-b307-0381ac786b48', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 2, 8, 32, 128, ___ ?$q$, $q$[{"text":"2048","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"512","is_correct":true},{"text":"224","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"134","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$512$q$, $q$Each term multiplies by 4 (geometric): 128 × 4 = 512.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9dc6a02f-2605-5458-b338-380ed1733f93', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 1, 5, 25, 125, ___ ?$q$, $q$[{"text":"3125","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"225","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"625","is_correct":true},{"text":"129","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$625$q$, $q$Each term multiplies by 5 (geometric): 125 × 5 = 625.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7acc3fde-6ead-53a2-b81a-f999714543dc', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 2, 5, 10, 13, ___ ?$q$, $q$[{"text":"29","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"16","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"18","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"26","is_correct":true}]$q$::jsonb, $q$26$q$, $q$The operations alternate +3, ×2: after 13, multiply by 2 to get 26.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d5bd41c2-46d9-5a5f-abd3-21580615ddeb', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 3, 5, 10, 12, ___ ?$q$, $q$[{"text":"24","is_correct":true},{"text":"26","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"14","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"17","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$24$q$, $q$The operations alternate +2, ×2: after 12, multiply by 2 to get 24.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bb214b4d-edd4-5085-8028-0902129d99f6', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 2, 6, 12, 16, ___ ?$q$, $q$[{"text":"36","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"32","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"22","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$32$q$, $q$The operations alternate +4, ×2: after 16, multiply by 2 to get 32.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9ebe4c3e-b579-5fc4-a047-fd5a9554f371', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 1, 5, 10, 14, ___ ?$q$, $q$[{"text":"32","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"18","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"28","is_correct":true},{"text":"19","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$28$q$, $q$The operations alternate +4, ×2: after 14, multiply by 2 to get 28.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('08b780fa-4a38-5631-903e-f07c1fd27925', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 4, 6, 12, 14, ___ ?$q$, $q$[{"text":"30","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"16","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"20","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"28","is_correct":true}]$q$::jsonb, $q$28$q$, $q$The operations alternate +2, ×2: after 14, multiply by 2 to get 28.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('083966c4-a0b2-57d3-8bea-70e346b8e1fd', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 1, 6, 12, 17, ___ ?$q$, $q$[{"text":"34","is_correct":true},{"text":"39","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"22","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"23","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$34$q$, $q$The operations alternate +5, ×2: after 17, multiply by 2 to get 34.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5c87e729-1842-51a9-938e-c7199050fe3a', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 5, 8, 16, 19, ___ ?$q$, $q$[{"text":"41","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"38","is_correct":true},{"text":"22","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"27","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$38$q$, $q$The operations alternate +3, ×2: after 19, multiply by 2 to get 38.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4c1da2f9-dcde-5d9d-a97d-6a7b197041cb', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 1, 3, 9, 11, ___ ?$q$, $q$[{"text":"35","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"13","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"33","is_correct":true},{"text":"17","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$33$q$, $q$The operations alternate +2, ×3: after 11, multiply by 3 to get 33.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('13b6739e-2cea-52b8-9d81-1f6e8efb88c5', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 1, 4, 12, 15, ___ ?$q$, $q$[{"text":"48","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"18","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"23","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"45","is_correct":true}]$q$::jsonb, $q$45$q$, $q$The operations alternate +3, ×3: after 15, multiply by 3 to get 45.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('14e2dc81-862f-5dda-b14c-4f738b06bd19', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 2, 4, 12, 14, ___ ?$q$, $q$[{"text":"42","is_correct":true},{"text":"44","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"16","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"22","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$42$q$, $q$The operations alternate +2, ×3: after 14, multiply by 3 to get 42.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2bac91f5-8fda-57ba-bfec-646a120e12e7', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 2, 7, 14, 19, ___ ?$q$, $q$[{"text":"43","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"38","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"26","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$38$q$, $q$The operations alternate +5, ×2: after 19, multiply by 2 to get 38.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e5222aba-bb63-5150-a9b1-e457118da826', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 3, 8, 16, 21, ___ ?$q$, $q$[{"text":"47","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"26","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"42","is_correct":true},{"text":"29","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$42$q$, $q$The operations alternate +5, ×2: after 21, multiply by 2 to get 42.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3bd27636-7737-50b2-ba00-e8fa5de29f13', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 1, 5, 4, 9, ___ ?$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"13","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"14","is_correct":false,"misconception_token":"series-misread-interleaved"},{"text":"7","is_correct":true}]$q$::jsonb, $q$7$q$, $q$Two sequences take turns. The 1st, 3rd, 5th terms go 1, 4, 7 (adding 3), so the next term is 7.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('81029756-3dd9-59bb-9fc7-f875647ad85f', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 2, 3, 7, 5, ___ ?$q$, $q$[{"text":"12","is_correct":true},{"text":"17","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"7","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"3","is_correct":false,"misconception_token":"series-misread-interleaved"}]$q$::jsonb, $q$12$q$, $q$Two sequences take turns. The 1st, 3rd, 5th terms go 2, 7, 12 (adding 5), so the next term is 12.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('24ecede5-c86a-5fc1-bafa-2ef9a0176ac6', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 2, 1, 8, 5, ___ ?$q$, $q$[{"text":"20","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"14","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"2","is_correct":false,"misconception_token":"series-misread-interleaved"}]$q$::jsonb, $q$14$q$, $q$Two sequences take turns. The 1st, 3rd, 5th terms go 2, 8, 14 (adding 6), so the next term is 14.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('571e6972-a25d-56d6-83e7-5268d6042f98', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 1, 4, 7, 6, ___ ?$q$, $q$[{"text":"19","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"8","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"13","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"series-misread-interleaved"}]$q$::jsonb, $q$13$q$, $q$Two sequences take turns. The 1st, 3rd, 5th terms go 1, 7, 13 (adding 6), so the next term is 13.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3940e9b3-af42-5417-9223-ade5e23ebca0', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 1, 10, 5, 13, ___ ?$q$, $q$[{"text":"13","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"16","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"21","is_correct":false,"misconception_token":"series-misread-interleaved"},{"text":"9","is_correct":true}]$q$::jsonb, $q$9$q$, $q$Two sequences take turns. The 1st, 3rd, 5th terms go 1, 5, 9 (adding 4), so the next term is 9.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4f98e6f0-e861-57d2-af1a-023bbea52337', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 3, 8, 5, 13, ___ ?$q$, $q$[{"text":"7","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"18","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"21","is_correct":false,"misconception_token":"series-misread-interleaved"}]$q$::jsonb, $q$7$q$, $q$Two sequences take turns. The 1st, 3rd, 5th terms go 3, 5, 7 (adding 2), so the next term is 7.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7e4db6f7-a151-52fd-9f59-df3495f589e6', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 5, 2, 9, 8, ___ ?$q$, $q$[{"text":"17","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"13","is_correct":true},{"text":"14","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"7","is_correct":false,"misconception_token":"series-misread-interleaved"}]$q$::jsonb, $q$13$q$, $q$Two sequences take turns. The 1st, 3rd, 5th terms go 5, 9, 13 (adding 4), so the next term is 13.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('39bff13c-3b7c-5cc7-b9ce-edebd40469e0', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 4, 10, 7, 16, ___ ?$q$, $q$[{"text":"13","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"22","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"10","is_correct":true},{"text":"25","is_correct":false,"misconception_token":"series-misread-interleaved"}]$q$::jsonb, $q$10$q$, $q$Two sequences take turns. The 1st, 3rd, 5th terms go 4, 7, 10 (adding 3), so the next term is 10.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7d1784c3-cc5a-53ac-9c31-6b75208ff699', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 1, 20, 6, 30, ___ ?$q$, $q$[{"text":"16","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"40","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"54","is_correct":false,"misconception_token":"series-misread-interleaved"},{"text":"11","is_correct":true}]$q$::jsonb, $q$11$q$, $q$Two sequences take turns. The 1st, 3rd, 5th terms go 1, 6, 11 (adding 5), so the next term is 11.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1ebdcdb2-3e3f-5580-ad0d-228ecea6bb8b', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 3, 8, 7, 14, ___ ?$q$, $q$[{"text":"11","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"20","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"21","is_correct":false,"misconception_token":"series-misread-interleaved"}]$q$::jsonb, $q$11$q$, $q$Two sequences take turns. The 1st, 3rd, 5th terms go 3, 7, 11 (adding 4), so the next term is 11.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('14fd4c37-91fd-5218-96e8-af41b6f600f7', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 2, 5, 9, 8, ___ ?$q$, $q$[{"text":"23","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"16","is_correct":true},{"text":"11","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"7","is_correct":false,"misconception_token":"series-misread-interleaved"}]$q$::jsonb, $q$16$q$, $q$Two sequences take turns. The 1st, 3rd, 5th terms go 2, 9, 16 (adding 7), so the next term is 16.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ba3658e1-cf7c-558a-9d14-355db0bec4ff', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 6, 2, 11, 10, ___ ?$q$, $q$[{"text":"21","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"18","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"16","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"series-misread-interleaved"}]$q$::jsonb, $q$16$q$, $q$Two sequences take turns. The 1st, 3rd, 5th terms go 6, 11, 16 (adding 5), so the next term is 16.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3af53a83-2198-560e-84b6-a48502928ada', null, (select id from public.skills where slug = 'prep-number-series'), null, 'easy',
   $q$What number comes next: 1, 4, 9, 16, ___ ?$q$, $q$[{"text":"36","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"23","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"32","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"25","is_correct":true}]$q$::jsonb, $q$25$q$, $q$These are perfect squares: 1², 2², 3², 4², so the next is 5² = 25.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2dafff53-9152-53b6-bdee-8f3425e00609', null, (select id from public.skills where slug = 'prep-number-series'), null, 'easy',
   $q$What number comes next: 4, 9, 16, 25, ___ ?$q$, $q$[{"text":"36","is_correct":true},{"text":"49","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"34","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"50","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$36$q$, $q$These are perfect squares: 2², 3², 4², 5², so the next is 6² = 36.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0e463007-5809-5434-b010-7b02e11f63e5', null, (select id from public.skills where slug = 'prep-number-series'), null, 'easy',
   $q$What number comes next: 9, 16, 25, 36, ___ ?$q$, $q$[{"text":"64","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"49","is_correct":true},{"text":"47","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"72","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$49$q$, $q$These are perfect squares: 3², 4², 5², 6², so the next is 7² = 49.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c6d21034-1041-5ad5-8b91-e194c06b930c', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 16, 25, 36, 49, ___ ?$q$, $q$[{"text":"81","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"62","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"64","is_correct":true},{"text":"98","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$64$q$, $q$These are perfect squares: 4², 5², 6², 7², so the next is 8² = 64.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('36106aa7-4db8-5bd1-99aa-7e692d28054e', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 25, 36, 49, 64, ___ ?$q$, $q$[{"text":"100","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"79","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"128","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"81","is_correct":true}]$q$::jsonb, $q$81$q$, $q$These are perfect squares: 5², 6², 7², 8², so the next is 9² = 81.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5702e744-fae3-5ccb-bd78-1f3bb92d591a', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 36, 49, 64, 81, ___ ?$q$, $q$[{"text":"100","is_correct":true},{"text":"121","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"98","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"162","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$100$q$, $q$These are perfect squares: 6², 7², 8², 9², so the next is 10² = 100.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d09d4eec-5027-51d1-909d-85d1f922359e', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 49, 64, 81, 100, ___ ?$q$, $q$[{"text":"144","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"121","is_correct":true},{"text":"119","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"200","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$121$q$, $q$These are perfect squares: 7², 8², 9², 10², so the next is 11² = 121.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b667a45d-1f2f-51bb-8733-f675aa78a7de', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 64, 81, 100, 121, ___ ?$q$, $q$[{"text":"169","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"142","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"144","is_correct":true},{"text":"242","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$144$q$, $q$These are perfect squares: 8², 9², 10², 11², so the next is 12² = 144.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8e77672a-b556-5a2f-a1e0-55cdf7571356', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 1, 8, 27, 64, ___ ?$q$, $q$[{"text":"216","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"101","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"128","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"125","is_correct":true}]$q$::jsonb, $q$125$q$, $q$These are perfect cubes: 1³, 2³, 3³, 4³, so the next is 5³ = 125.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('afc717de-4f64-52b4-bd1a-0ecba66f426e', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 8, 27, 64, 125, ___ ?$q$, $q$[{"text":"216","is_correct":true},{"text":"343","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"186","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"250","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$216$q$, $q$These are perfect cubes: 2³, 3³, 4³, 5³, so the next is 6³ = 216.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('eba27243-7202-5e46-bf49-4fbdbdf42e68', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 27, 64, 125, 216, ___ ?$q$, $q$[{"text":"512","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"343","is_correct":true},{"text":"307","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"432","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$343$q$, $q$These are perfect cubes: 3³, 4³, 5³, 6³, so the next is 7³ = 343.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d0817cca-2cba-527d-87d3-1c8ecd88875e', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 64, 125, 216, 343, ___ ?$q$, $q$[{"text":"729","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"470","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"512","is_correct":true},{"text":"686","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$512$q$, $q$These are perfect cubes: 4³, 5³, 6³, 7³, so the next is 8³ = 512.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('460842a6-be3c-5e65-9cac-8309b3375288', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 125, 216, 343, 512, ___ ?$q$, $q$[{"text":"1000","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"681","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"1024","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"729","is_correct":true}]$q$::jsonb, $q$729$q$, $q$These are perfect cubes: 5³, 6³, 7³, 8³, so the next is 9³ = 729.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c899f9aa-485b-5aa7-9e9d-e955311ba608', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 216, 343, 512, 729, ___ ?$q$, $q$[{"text":"1000","is_correct":true},{"text":"1331","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"946","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"1458","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$1000$q$, $q$These are perfect cubes: 6³, 7³, 8³, 9³, so the next is 10³ = 1000.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e5f97977-0a26-5c59-aa40-8fb9b2e5e2f0', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 1, 3, 7, 15, ___ ?$q$, $q$[{"text":"32","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"31","is_correct":true},{"text":"30","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"23","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$31$q$, $q$Each term is ×2 then +1: 15 × 2 + 1 = 31.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b6a46a97-3175-5ac6-8f37-4fde153127da', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 1, 4, 10, 22, ___ ?$q$, $q$[{"text":"48","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"44","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"46","is_correct":true},{"text":"34","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$46$q$, $q$Each term is ×2 then +2: 22 × 2 + 2 = 46.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dae4c479-54e5-59f3-8fdb-bb492a3c3c13', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 2, 5, 11, 23, ___ ?$q$, $q$[{"text":"48","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"46","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"35","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"47","is_correct":true}]$q$::jsonb, $q$47$q$, $q$Each term is ×2 then +1: 23 × 2 + 1 = 47.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c404aa56-8048-592b-921c-2e702c68f434', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 3, 8, 18, 38, ___ ?$q$, $q$[{"text":"78","is_correct":true},{"text":"80","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"76","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"58","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$78$q$, $q$Each term is ×2 then +2: 38 × 2 + 2 = 78.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ace9c191-e9c3-565e-ab24-a1ab2114329f', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 2, 6, 14, 30, ___ ?$q$, $q$[{"text":"64","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"62","is_correct":true},{"text":"60","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"46","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$62$q$, $q$Each term is ×2 then +2: 30 × 2 + 2 = 62.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('63d65725-4508-5e26-ad3c-367ddf5231c9', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 3, 7, 15, 31, ___ ?$q$, $q$[{"text":"64","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"62","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"63","is_correct":true},{"text":"47","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$63$q$, $q$Each term is ×2 then +1: 31 × 2 + 1 = 63.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f187f701-4176-5d99-9d38-558acdd22783', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 1, 5, 13, 29, ___ ?$q$, $q$[{"text":"64","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"58","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"45","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"61","is_correct":true}]$q$::jsonb, $q$61$q$, $q$Each term is ×2 then +3: 29 × 2 + 3 = 61.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3797d85f-5886-5568-8244-97dc2bce4236', null, (select id from public.skills where slug = 'prep-number-series'), null, 'medium',
   $q$What number comes next: 4, 11, 25, 53, ___ ?$q$, $q$[{"text":"109","is_correct":true},{"text":"112","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"106","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"81","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$109$q$, $q$Each term is ×2 then +3: 53 × 2 + 3 = 109.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('69d878ff-01e3-5119-8fe1-159863ce729b', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 2, 7, 17, 37, ___ ?$q$, $q$[{"text":"80","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"77","is_correct":true},{"text":"74","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"57","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$77$q$, $q$Each term is ×2 then +3: 37 × 2 + 3 = 77.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d529e0b6-d416-592d-b164-d79342f33cb4', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 1, 5, 17, 53, ___ ?$q$, $q$[{"text":"163","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"159","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"161","is_correct":true},{"text":"89","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$161$q$, $q$Each term is ×3 then +2: 53 × 3 + 2 = 161.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7a21541a-3326-5038-8fd8-198c27de37a8', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 2, 7, 22, 67, ___ ?$q$, $q$[{"text":"203","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"201","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"112","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"202","is_correct":true}]$q$::jsonb, $q$202$q$, $q$Each term is ×3 then +1: 67 × 3 + 1 = 202.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('54357199-5f90-59d8-84d8-08bc736f7792', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 1, 5, 21, 85, ___ ?$q$, $q$[{"text":"341","is_correct":true},{"text":"342","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"340","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"149","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$341$q$, $q$Each term is ×4 then +1: 85 × 4 + 1 = 341.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e5640c3c-e28a-5ffd-913c-a3b2e1d96bdf', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 1, 4, 13, 40, ___ ?$q$, $q$[{"text":"122","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"121","is_correct":true},{"text":"120","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"67","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$121$q$, $q$Each term is ×3 then +1: 40 × 3 + 1 = 121.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bd1b8811-a913-5b5a-83aa-aab8ddcb463e', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 2, 9, 37, 149, ___ ?$q$, $q$[{"text":"598","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"596","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"597","is_correct":true},{"text":"261","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$597$q$, $q$Each term is ×4 then +1: 149 × 4 + 1 = 597.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('60b5d1f3-5c7f-509d-9830-4b1a31286053', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 1, 7, 19, 43, ___ ?$q$, $q$[{"text":"96","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"86","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"67","is_correct":false,"misconception_token":"series-tempting-misread"},{"text":"91","is_correct":true}]$q$::jsonb, $q$91$q$, $q$Each term is ×2 then +5: 43 × 2 + 5 = 91.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('30e38d47-103a-5748-acc5-b85e99f9d2db', null, (select id from public.skills where slug = 'prep-number-series'), null, 'hard',
   $q$What number comes next: 3, 11, 35, 107, ___ ?$q$, $q$[{"text":"323","is_correct":true},{"text":"325","is_correct":false,"misconception_token":"series-off-by-one-step"},{"text":"321","is_correct":false,"misconception_token":"series-wrong-operation"},{"text":"179","is_correct":false,"misconception_token":"series-tempting-misread"}]$q$::jsonb, $q$323$q$, $q$Each term is ×3 then +2: 107 × 3 + 2 = 323.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;

commit;
