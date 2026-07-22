-- PathwayEd — Question Engine: PREP quantitative comparisons skills + questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-prep-seeds.ts from the curated
-- pools in src/lib/prep/*Templates.ts. HOW TO APPLY (self-contained — creates the
-- isolated prep subject + domain + skills, then the questions):
--   bun run db:seed seeds/0019_prep_quant_compare_questions.sql
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
values (md5('pe-aos:skill-prep-quantitative-comparison')::uuid, 'skill', md5('pe-aos:dom-prep-quant')::uuid, 'prep-quant', 'Quantitative Comparison', 'prep-quantitative-comparison', '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band;

-- prep-quantitative-comparison (Quantitative Comparison) — 84 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('32d295db-62b1-58e3-bd55-3f3774e1ccff', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 3/4.  Column B: 2/3.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"Column A is greater","is_correct":true},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column A is greater$q$, $q$3/4 = 0.75 and 2/3 ≈ 0.667, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('014115cc-304c-5b56-9a60-b9a6b77ab6f8', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 25% of 80.  Column B: 15.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column A is greater","is_correct":true},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column A is greater$q$, $q$25% of 80 = 20, which is greater than 15.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e579c7e8-2cc1-5b22-a99b-9cdb5343a360', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: 2^5.  Column B: 5^2.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"},{"text":"Column A is greater","is_correct":true}]$q$::jsonb, $q$Column A is greater$q$, $q$2^5 = 32 and 5^2 = 25, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('79402431-2744-5901-9632-b5a453d19ff9', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: the perimeter of a square with side 6.  Column B: the perimeter of a 5-by-6 rectangle.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":true},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column A is greater$q$, $q$Square perimeter = 4 × 6 = 24; rectangle perimeter = 2 × (5 + 6) = 22. Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a400e601-bfad-5d00-9fab-a0a320d877f3', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 0.5.  Column B: 0.45.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"Column A is greater","is_correct":true},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column A is greater$q$, $q$0.5 > 0.45, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4576b2c4-82e3-5a1f-82c4-4f273a5a7d34', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: the least common multiple of 4 and 6.  Column B: 10.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column A is greater","is_correct":true},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column A is greater$q$, $q$LCM(4, 6) = 12 > 10, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3431fdc5-2def-5fcb-b86a-4b5b9038519b', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 7 × 8.  Column B: 6 × 9.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"},{"text":"Column A is greater","is_correct":true}]$q$::jsonb, $q$Column A is greater$q$, $q$7 × 8 = 56 and 6 × 9 = 54, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('59e88b51-cf40-5f2f-86fd-9d7114a13df5', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: the average of 10, 20, and 30.  Column B: 18.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":true},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column A is greater$q$, $q$Average = 60 ÷ 3 = 20 > 18, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('529e130c-26e8-52a6-957f-8cea27c755fe', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: 3/5.  Column B: 0.55.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"Column A is greater","is_correct":true},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column A is greater$q$, $q$3/5 = 0.6 > 0.55, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('030ccaa4-ba33-501c-983e-62e0eadb8537', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'hard',
   $q$Column A: 2^10.  Column B: 1000.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column A is greater","is_correct":true},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column A is greater$q$, $q$2^10 = 1024 > 1000, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('651df2f9-fe94-51df-a340-e83b05ce3711', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Given x = 4, Column A: x².  Column B: 3x + 2.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-ignored-condition"},{"text":"Column A is greater","is_correct":true}]$q$::jsonb, $q$Column A is greater$q$, $q$With x = 4: x² = 16 and 3x + 2 = 14, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('42f7102f-46e2-5ceb-b5cf-11457b3370cd', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: 15% of 200.  Column B: 25% of 100.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":true},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column A is greater$q$, $q$15% of 200 = 30 and 25% of 100 = 25, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bd91e0d5-88d9-52dd-bc94-7b95c33120d1', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'hard',
   $q$Column A: 5!.  Column B: 100.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"Column A is greater","is_correct":true},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column A is greater$q$, $q$5! = 5 × 4 × 3 × 2 × 1 = 120 > 100, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7af1a265-8f31-5a9d-ad75-3300530b5134', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: 1/2 + 1/3.  Column B: 3/4.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column A is greater","is_correct":true},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column A is greater$q$, $q$1/2 + 1/3 = 5/6 ≈ 0.833, which is greater than 3/4 = 0.75.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('18533551-f482-5341-80a2-38f4cb0dc8cc', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: the sum of the first 5 positive integers.  Column B: 14.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"},{"text":"Column A is greater","is_correct":true}]$q$::jsonb, $q$Column A is greater$q$, $q$1 + 2 + 3 + 4 + 5 = 15 > 14, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4bc18cb8-0b8e-54f7-b2e3-fb5fcb3719eb', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: (-3)².  Column B: 8.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":true},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column A is greater$q$, $q$(-3)² = 9 > 8, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b08bc942-e6d4-5ef5-9b4f-974e465fede2', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Given x > 10, Column A: x.  Column B: 9.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"Column A is greater","is_correct":true},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-ignored-condition"}]$q$::jsonb, $q$Column A is greater$q$, $q$Since x > 10, x is always greater than 9. Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bef2f50b-57ea-586f-abfd-2bce97dbcf0a', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 2/5 of 50.  Column B: 18.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column A is greater","is_correct":true},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column A is greater$q$, $q$2/5 of 50 = 20 > 18, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5e081d29-8d71-53c6-a790-c9700a9714ca', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 6².  Column B: 30.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"},{"text":"Column A is greater","is_correct":true}]$q$::jsonb, $q$Column A is greater$q$, $q$6² = 36 > 30, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d013a984-65fa-5cc8-99cf-430fedb76289', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Given x = 5, Column A: x².  Column B: 4x + 3.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":true},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-ignored-condition"}]$q$::jsonb, $q$Column A is greater$q$, $q$With x = 5: x² = 25 and 4x + 3 = 23, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('19d89bdb-1fab-5094-a588-5718169bb0ad', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: the number of days in 3 weeks.  Column B: 20.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"Column A is greater","is_correct":true},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column A is greater$q$, $q$3 weeks = 3 × 7 = 21 days > 20, so Column A is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('555d1c8a-7b31-5937-8068-8e5871e7c3da', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 2/3.  Column B: 3/4.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":true},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column B is greater$q$, $q$2/3 ≈ 0.667 and 3/4 = 0.75, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6b75111d-dcc5-5452-bb1b-e0fa545dec76', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: 3².  Column B: 2^4.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"},{"text":"Column B is greater","is_correct":true}]$q$::jsonb, $q$Column B is greater$q$, $q$3² = 9 and 2^4 = 16, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('64098535-0cc4-585b-9800-1fa97f8a999c', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 10.  Column B: 12.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":true},{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column B is greater$q$, $q$12 > 10, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('33d16827-a4eb-5612-90ae-33929c0dc163', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: 0.3.  Column B: 1/3.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"Column B is greater","is_correct":true},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column B is greater$q$, $q$1/3 ≈ 0.333 > 0.3, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b23ccce4-5489-5067-8b88-862c039a63c6', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 5 × 6.  Column B: 4 × 8.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":true},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column B is greater$q$, $q$5 × 6 = 30 and 4 × 8 = 32, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ffd86aae-ea1e-540f-816f-83b3bd25a23b', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: the average of 5 and 10.  Column B: 8.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"},{"text":"Column B is greater","is_correct":true}]$q$::jsonb, $q$Column B is greater$q$, $q$Average = 15 ÷ 2 = 7.5 < 8, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('68cc2e53-2dfe-5296-990a-34a053b29cdf', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: 20% of 50.  Column B: 30% of 40.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":true},{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column B is greater$q$, $q$20% of 50 = 10 and 30% of 40 = 12, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1e7453a5-652a-51d6-9478-fed34580748a', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Given x = 3, Column A: 2x.  Column B: x².  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"Column B is greater","is_correct":true},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-ignored-condition"}]$q$::jsonb, $q$Column B is greater$q$, $q$With x = 3: 2x = 6 and x² = 9, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2e0dd97f-4ab8-581f-9b03-929b8875abcf', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: the perimeter of a square with side 4.  Column B: the perimeter of a 5-by-4 rectangle.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":true},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column B is greater$q$, $q$Square perimeter = 4 × 4 = 16; rectangle perimeter = 2 × (5 + 4) = 18. Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c19601cc-db34-5306-8cb8-4e72a557a47b', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: 3/8.  Column B: 2/5.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"},{"text":"Column B is greater","is_correct":true}]$q$::jsonb, $q$Column B is greater$q$, $q$3/8 = 0.375 and 2/5 = 0.4, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('16043a78-d062-5524-9502-bbc27f940ef4', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'hard',
   $q$Column A: 4!.  Column B: 5².  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":true},{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column B is greater$q$, $q$4! = 24 and 5² = 25, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('60e90b52-fc7f-563e-8da9-0d8f691b7d43', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'hard',
   $q$Column A: 100.  Column B: 2^7.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"Column B is greater","is_correct":true},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column B is greater$q$, $q$2^7 = 128 > 100, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('698ce1bd-2e3a-5aac-a195-9f2ebb4b2bb5', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Given y < 0, Column A: y.  Column B: 0.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":true},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-ignored-condition"}]$q$::jsonb, $q$Column B is greater$q$, $q$Since y < 0, y is always less than 0, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f86ca5f6-bbed-5fc1-9280-11440b7b8a25', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 1/4 + 1/4.  Column B: 0.6.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"},{"text":"Column B is greater","is_correct":true}]$q$::jsonb, $q$Column B is greater$q$, $q$1/4 + 1/4 = 0.5 < 0.6, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c144f8e6-c4a6-5bc4-b006-c7466910e939', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: 7².  Column B: 50.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":true},{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column B is greater$q$, $q$7² = 49 < 50, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f26acff6-451f-57c6-b544-133ccd6a6d53', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: the sum of the first 4 positive integers.  Column B: 11.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"Column B is greater","is_correct":true},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column B is greater$q$, $q$1 + 2 + 3 + 4 = 10 < 11, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a0225d18-2ac3-56be-8ee5-fa828f2c1d0f', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: 15.  Column B: the least common multiple of 5 and 6.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":true},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column B is greater$q$, $q$LCM(5, 6) = 30 > 15, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('009d8662-5a8d-531e-bd39-3a1115bd121c', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Given x > 5, Column A: 10.  Column B: x + 7.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-ignored-condition"},{"text":"Column B is greater","is_correct":true}]$q$::jsonb, $q$Column B is greater$q$, $q$Since x > 5, x + 7 > 12, which is always greater than 10. Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2547017a-c7bf-591a-9b58-0b445d7c6640', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: 3/7.  Column B: 1/2.  Which is greater?$q$, $q$[{"text":"Column B is greater","is_correct":true},{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column B is greater$q$, $q$3/7 ≈ 0.429 < 0.5 = 1/2, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0253f0a3-cc69-5158-8e7f-15abca6463c7', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 40.  Column B: 6² + 5.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"Column B is greater","is_correct":true},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column B is greater$q$, $q$6² + 5 = 36 + 5 = 41 > 40, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7cf61b2c-a38f-5c51-bb1e-d86526157136', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 2^3.  Column B: 3².  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-swapped-columns"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":true},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$Column B is greater$q$, $q$2^3 = 8 and 3² = 9, so Column B is greater.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8753bd60-0d68-5d69-bf3a-f05e2ed09fa1', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 1/2.  Column B: 0.5.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"},{"text":"The two are equal","is_correct":true}]$q$::jsonb, $q$The two are equal$q$, $q$1/2 = 0.5, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('35274c44-385d-508d-b3d2-0e45eefb6f9b', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 3/6.  Column B: 2/4.  Which is greater?$q$, $q$[{"text":"The two are equal","is_correct":true},{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$The two are equal$q$, $q$Both fractions reduce to 1/2, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8fbf4cb0-4680-5a97-85dd-66a7f02cb850', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 2^3.  Column B: 2 × 4.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"The two are equal","is_correct":true},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$The two are equal$q$, $q$2^3 = 8 and 2 × 4 = 8, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fce2f31a-8f05-5087-af5b-84cebd04fd7c', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: 25% of 40.  Column B: 10% of 100.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"The two are equal","is_correct":true},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$The two are equal$q$, $q$25% of 40 = 10 and 10% of 100 = 10, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6fc71c3e-d270-56aa-b582-2953782a211a', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: 3 + 4 × 2.  Column B: 22 ÷ 2.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"},{"text":"The two are equal","is_correct":true}]$q$::jsonb, $q$The two are equal$q$, $q$Order of operations: 3 + 4 × 2 = 3 + 8 = 11; and 22 ÷ 2 = 11. The two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4a5119ea-c866-5c83-9168-acd3e0961821', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: the perimeter of a square with side 5.  Column B: the perimeter of a 6-by-4 rectangle.  Which is greater?$q$, $q$[{"text":"The two are equal","is_correct":true},{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$The two are equal$q$, $q$Square perimeter = 4 × 5 = 20; rectangle perimeter = 2 × (6 + 4) = 20. The two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1488143a-208d-5149-822e-2b470092cfb2', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 0.25.  Column B: 1/4.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"The two are equal","is_correct":true},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$The two are equal$q$, $q$1/4 = 0.25, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cebb05d6-96b2-5187-bc86-335f52f82272', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: the average of 5 and 7.  Column B: the average of 4 and 8.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"The two are equal","is_correct":true},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$The two are equal$q$, $q$Average of 5 and 7 = 6; average of 4 and 8 = 6. The two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f2cb65c3-65f3-53a3-a16f-521ab4ef3f2d', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 5².  Column B: 100 ÷ 4.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"},{"text":"The two are equal","is_correct":true}]$q$::jsonb, $q$The two are equal$q$, $q$5² = 25 and 100 ÷ 4 = 25, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ffd8c121-2871-5591-8c85-4ce05a2e2238', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'hard',
   $q$Column A: 6! ÷ 5!.  Column B: 2 × 3.  Which is greater?$q$, $q$[{"text":"The two are equal","is_correct":true},{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$The two are equal$q$, $q$6! ÷ 5! = 6 and 2 × 3 = 6, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c4b97562-efd1-5729-b32b-7cb5c8c74076', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: 1/3 + 1/6.  Column B: 2/4.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"The two are equal","is_correct":true},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$The two are equal$q$, $q$1/3 + 1/6 = 1/2 and 2/4 = 1/2, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fb104e29-be4d-5aac-a15a-75d56285cbb1', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: 2^4.  Column B: 4².  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"The two are equal","is_correct":true},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$The two are equal$q$, $q$2^4 = 16 and 4² = 16, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c58364ec-30a2-5875-8336-88aa39e47cde', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 0.75.  Column B: 3/4.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"},{"text":"The two are equal","is_correct":true}]$q$::jsonb, $q$The two are equal$q$, $q$3/4 = 0.75, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cd851850-1310-5f20-a2aa-73e9e1baa8b5', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Column A: 30% of 200.  Column B: 60% of 100.  Which is greater?$q$, $q$[{"text":"The two are equal","is_correct":true},{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$The two are equal$q$, $q$30% of 200 = 60 and 60% of 100 = 60, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e242e0ed-5f71-5a13-a9c0-c20191cec608', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 7 × 6.  Column B: 84 ÷ 2.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"The two are equal","is_correct":true},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$The two are equal$q$, $q$7 × 6 = 42 and 84 ÷ 2 = 42, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('32cc0e7a-3047-5b09-9491-c6f26962319c', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'hard',
   $q$Column A: 9².  Column B: 3^4.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"The two are equal","is_correct":true},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$The two are equal$q$, $q$9² = 81 and 3^4 = 81, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('424954ca-6c25-51b9-8fb2-cd3a3f51bc9b', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Given x = 5, Column A: 2x + 3.  Column B: 3x - 2.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-ignored-condition"},{"text":"The two are equal","is_correct":true}]$q$::jsonb, $q$The two are equal$q$, $q$With x = 5: 2x + 3 = 13 and 3x - 2 = 13, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0b366ebf-f896-5a09-a0da-51d27a09e06e', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: 1/5 of 100.  Column B: 4 × 5.  Which is greater?$q$, $q$[{"text":"The two are equal","is_correct":true},{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$The two are equal$q$, $q$1/5 of 100 = 20 and 4 × 5 = 20, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2f7ecd4e-5ece-51f9-8c37-eea4da447dbe', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'hard',
   $q$Column A: (2 + 3)².  Column B: 2² + 3² + (2 × 2 × 3).  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"The two are equal","is_correct":true},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$The two are equal$q$, $q$(2 + 3)² = 25; and 2² + 3² + (2 × 2 × 3) = 4 + 9 + 12 = 25. The two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e2120a54-f3a8-5f4a-ae16-30ed934a4bc8', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Column A: the number of minutes in an hour.  Column B: 5 × 12.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"The two are equal","is_correct":true},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-computed-one-side"}]$q$::jsonb, $q$The two are equal$q$, $q$An hour has 60 minutes and 5 × 12 = 60, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('069b12ab-b08b-503e-9d6d-ae6c1ab486d5', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Given x = 2, Column A: 4x.  Column B: x³.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-off-by-arithmetic"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-misread-expression"},{"text":"It cannot be determined from the information given","is_correct":false,"misconception_token":"qc-ignored-condition"},{"text":"The two are equal","is_correct":true}]$q$::jsonb, $q$The two are equal$q$, $q$With x = 2: 4x = 8 and x³ = 8, so the two are equal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9cb2d7a2-e2ce-5148-8e45-9ec1fe1fbf1c', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Given x > 0, Column A: x.  Column B: x².  Which is greater?$q$, $q$[{"text":"It cannot be determined from the information given","is_correct":true},{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-tested-one-value"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-fraction"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-assumed-integer"}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If x = 3, A = 3 and B = 9, so B is greater. But if x = 1/2, A = 0.5 and B = 0.25, so A is greater. Since x is only "positive," it cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e614c61f-02a7-5445-876c-9fb929034382', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$For a number x, Column A: x².  Column B: 5x.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-tested-one-value"},{"text":"It cannot be determined from the information given","is_correct":true},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-fraction"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-ignored-negative"}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If x = 6, A = 36 and B = 30, so A is greater. If x = 2, A = 4 and B = 10, so B is greater. It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6b45168f-80e5-5e92-9dc9-8d4d821c5312', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'hard',
   $q$Given a > b, Column A: a².  Column B: b².  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-tested-one-value"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-negative"},{"text":"It cannot be determined from the information given","is_correct":true},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-assumed-positive"}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If a = 3 and b = 2, A = 9 and B = 4, so A is greater. But if a = 1 and b = -5, A = 1 and B = 25, so B is greater. It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('33416ff5-43ae-5d9d-a83d-8104dc2d0dd0', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$For a number x, Column A: 3x.  Column B: 2x.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-tested-one-value"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-negative"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-assumed-positive"},{"text":"It cannot be determined from the information given","is_correct":true}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If x = 4, A = 12 and B = 8, so A is greater. If x = -4, A = -12 and B = -8, so B is greater (and if x = 0 they are equal). It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('90cbab98-3253-5ab5-8a55-53d465e92369', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$For a nonzero number x, Column A: 1/x.  Column B: x.  Which is greater?$q$, $q$[{"text":"It cannot be determined from the information given","is_correct":true},{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-tested-one-value"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-fraction"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-ignored-negative"}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If x = 2, A = 0.5 and B = 2, so B is greater. If x = 1/2, A = 2 and B = 0.5, so A is greater. It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5aa11a61-e8c2-5d03-a27e-1f47b4c0d7bb', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Given x > 0, Column A: x².  Column B: 2x.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-tested-one-value"},{"text":"It cannot be determined from the information given","is_correct":true},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-fraction"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-assumed-integer"}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If x = 3, A = 9 and B = 6, so A is greater. If x = 1, A = 1 and B = 2, so B is greater. It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ae380f13-15b5-50d9-9129-8db671b6b5c3', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$The average of two numbers is 10.  Column A: the larger of the two numbers.  Column B: 12.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-tested-one-value"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-assumed-even-split"},{"text":"It cannot be determined from the information given","is_correct":true},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-assumed-integer"}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If the numbers are 5 and 15, the larger is 15, so A is greater. If the numbers are 10 and 10, the larger is 10, so B is greater. It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6f8142a5-f1df-58b7-bb9e-a6aa48769884', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$A class has an average test score of 80.  Column A: the highest score in the class.  Column B: 80.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-tested-one-value"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-assumed-even-split"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-assumed-positive"},{"text":"It cannot be determined from the information given","is_correct":true}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If one student scored 95, the highest is 95, so A is greater. If everyone scored exactly 80, the highest is 80, so the two are equal. Since it could be either, it cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4373da88-ac7f-5c34-a1f5-2edb4a9ef5dc', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'hard',
   $q$Given that x is an integer and x² = 9, Column A: x.  Column B: 0.  Which is greater?$q$, $q$[{"text":"It cannot be determined from the information given","is_correct":true},{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-assumed-positive"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-negative"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-tested-one-value"}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$x² = 9 means x = 3 or x = -3. If x = 3, A is greater; if x = -3, A = -3 < 0, so B is greater. It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6dcda99c-af83-5d1a-8461-d97836954cfc', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Given |x| = 5, Column A: x.  Column B: 4.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-assumed-positive"},{"text":"It cannot be determined from the information given","is_correct":true},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-negative"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-tested-one-value"}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$|x| = 5 means x = 5 or x = -5. If x = 5, A is greater; if x = -5, A = -5 < 4, so B is greater. It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6f662383-2b4f-5e40-9a3e-f0a74fade00b', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'hard',
   $q$Given that xy > 0, Column A: x.  Column B: 0.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-assumed-positive"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-negative"},{"text":"It cannot be determined from the information given","is_correct":true},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-tested-one-value"}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$xy > 0 means x and y share the same sign. If x = 2 and y = 3, then A = 2 > 0, so A is greater. If x = -2 and y = -3, then A = -2 < 0, so B is greater. It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fae02054-30bd-5d15-a5eb-d5da71335a1f', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Given that x + y = 10, Column A: x.  Column B: 5.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-tested-one-value"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-assumed-even-split"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-assumed-integer"},{"text":"It cannot be determined from the information given","is_correct":true}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If x = 6 (so y = 4), A is greater. If x = 3 (so y = 7), A = 3 < 5, so B is greater. It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1a5478ea-2e1f-59ac-910b-ae6d62958415', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'hard',
   $q$Given that x² > 4, Column A: x.  Column B: 2.  Which is greater?$q$, $q$[{"text":"It cannot be determined from the information given","is_correct":true},{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-assumed-positive"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-negative"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-tested-one-value"}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$x² > 4 means x > 2 or x < -2. If x = 3, A is greater. If x = -3, A = -3 < 2, so B is greater. It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('43f70971-ab83-5c0a-8782-cf0eecb57385', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$For a number x, Column A: 2x.  Column B: x + 3.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-tested-one-value"},{"text":"It cannot be determined from the information given","is_correct":true},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-negative"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-assumed-integer"}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If x = 5, A = 10 and B = 8, so A is greater. If x = 1, A = 2 and B = 4, so B is greater. It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b4a6fa8a-f80b-57d9-9f6d-8945dc8462a8', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$The average of 5 numbers is 12.  Column A: the largest of the numbers.  Column B: 12.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-tested-one-value"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-assumed-even-split"},{"text":"It cannot be determined from the information given","is_correct":true},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-assumed-integer"}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If all five numbers are 12, the largest is 12, so the two are equal. If the numbers are 10, 10, 10, 10, 20, the largest is 20, so A is greater. It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0ac65254-1260-5f00-85b9-9298afc7982f', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$Given that a > 0 and b > 0, Column A: a/b.  Column B: 1.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-tested-one-value"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-fraction"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-assumed-integer"},{"text":"It cannot be determined from the information given","is_correct":true}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If a = 3 and b = 2, then A = 1.5, so A is greater. If a = 2 and b = 3, then A ≈ 0.67, so B is greater. It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('95064727-c27a-5bf2-a5a1-744c0c11a693', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'easy',
   $q$Given that x < 5, Column A: x.  Column B: 3.  Which is greater?$q$, $q$[{"text":"It cannot be determined from the information given","is_correct":true},{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-tested-one-value"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-negative"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-assumed-integer"}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If x = 4, A is greater. If x = 1, A = 1 < 3, so B is greater. It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f5baca12-0785-5e28-8902-85974a64d46a', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$For a number x, Column A: -x.  Column B: x.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-assumed-positive"},{"text":"It cannot be determined from the information given","is_correct":true},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-negative"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-tested-one-value"}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If x = -3, then A = 3 and B = -3, so A is greater. If x = 3, then A = -3 and B = 3, so B is greater (and if x = 0 they are equal). It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d4cd33d3-dabd-5e67-9ce1-8a3dffe8b63a', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'hard',
   $q$Given x > 0, Column A: x + 1/x.  Column B: 2.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-tested-one-value"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-fraction"},{"text":"It cannot be determined from the information given","is_correct":true},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-assumed-integer"}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If x = 2, A = 2.5, so A is greater. If x = 1, A = 2, so the two are equal. Since A is sometimes greater and sometimes equal, it cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a931e616-1632-5aad-9130-84cf8e85d4e0', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'medium',
   $q$For a number m, Column A: m².  Column B: 1.  Which is greater?$q$, $q$[{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-tested-one-value"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-fraction"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-assumed-integer"},{"text":"It cannot be determined from the information given","is_correct":true}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If m = 2, A = 4, so A is greater. If m = 1/2, A = 0.25, so B is greater. It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ebaa99fc-3787-58fb-941a-1f5dcc59de43', null, (select id from public.skills where slug = 'prep-quantitative-comparison'), null, 'hard',
   $q$Given that p > 0 and q > 0, Column A: p + q.  Column B: pq.  Which is greater?$q$, $q$[{"text":"It cannot be determined from the information given","is_correct":true},{"text":"Column A is greater","is_correct":false,"misconception_token":"qc-tested-one-value"},{"text":"Column B is greater","is_correct":false,"misconception_token":"qc-ignored-fraction"},{"text":"The two are equal","is_correct":false,"misconception_token":"qc-assumed-integer"}]$q$::jsonb, $q$It cannot be determined from the information given$q$, $q$If p = 1 and q = 1, then A = 2 and B = 1, so A is greater. If p = 3 and q = 3, then A = 6 and B = 9, so B is greater. It cannot be determined.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;

commit;
