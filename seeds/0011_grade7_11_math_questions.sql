-- PathwayEd — Question Engine: GRADE 7 & 11 math skills + questions (GENERATED).
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

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-ns7')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'The Number System', null, '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-rational-number-operations')::uuid, 'skill', md5('pe-aos:dom-math-ns7')::uuid, 'math', 'Operations with Rational Numbers', 'rational-number-operations', '6-8', 'algebra', '7', 7, 'CCSS.MATH.CONTENT.7.NS.A', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-rp7')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Ratios & Proportional Relationships', null, '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-percent-applications')::uuid, 'skill', md5('pe-aos:dom-math-rp7')::uuid, 'math', 'Percent Applications', 'percent-applications', '6-8', 'problem-solving-data-analysis', '7', 7, 'CCSS.MATH.CONTENT.7.RP.A.3', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-ee7')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Expressions & Equations', null, '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-two-step-equations')::uuid, 'skill', md5('pe-aos:dom-math-ee7')::uuid, 'math', 'Two-Step Equations & Inequalities', 'two-step-equations', '6-8', 'algebra', '7', 7, 'CCSS.MATH.CONTENT.7.EE.B.4', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-geo7')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Geometry', null, '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-angles-area-volume')::uuid, 'skill', md5('pe-aos:dom-math-geo7')::uuid, 'math', 'Angles, Area & Volume', 'angles-area-volume', '6-8', 'geometry-trigonometry', '7', 7, 'CCSS.MATH.CONTENT.7.G.B', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-sp7')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Statistics & Probability', null, '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-probability-models')::uuid, 'skill', md5('pe-aos:dom-math-sp7')::uuid, 'math', 'Probability', 'probability-models', '6-8', 'problem-solving-data-analysis', '7', 7, 'CCSS.MATH.CONTENT.7.SP.C', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- rational-number-operations (Operations with Rational Numbers, grade 7, CCSS.MATH.CONTENT.7.NS.A) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fd26aa31-e32c-5867-8e6f-75658959a756',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'easy',
   $q$What is $-3 + 8$?$q$, $q$[{"text":"11","is_correct":false,"misconception_token":"ignored-negative"},{"text":"5","is_correct":true},{"text":"-5","is_correct":false,"misconception_token":"kept-larger-sign"},{"text":"-11","is_correct":false,"misconception_token":"subtracted-magnitudes-wrong-sign"}]$q$::jsonb, $q$5$q$, $q$Start at -3 and move up 8: -3 + 8 = 5.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('602d8dad-63df-51c4-ac15-76332500c143',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'easy',
   $q$What is $-7 + (-5)$?$q$, $q$[{"text":"-12","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"subtracted-wrong-sign"},{"text":"-2","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"12","is_correct":false,"misconception_token":"dropped-negatives"}]$q$::jsonb, $q$-12$q$, $q$Two negatives add in size and stay negative: -(7 + 5) = -12.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c45c341b-0760-5f58-bc77-2704cf33f186',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'easy',
   $q$What is $6 - 10$?$q$, $q$[{"text":"16","is_correct":false,"misconception_token":"added-instead"},{"text":"-4","is_correct":true},{"text":"-16","is_correct":false,"misconception_token":"added-wrong-sign"},{"text":"4","is_correct":false,"misconception_token":"dropped-negative"}]$q$::jsonb, $q$-4$q$, $q$6 - 10 crosses zero: you owe 4 more than you have, so -4.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3b325645-9128-5ffc-92d8-a4efa811477d',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'easy',
   $q$What is $-4 - 6$?$q$, $q$[{"text":"-10","is_correct":true},{"text":"-2","is_correct":false,"misconception_token":"subtracted-magnitudes"},{"text":"2","is_correct":false,"misconception_token":"subtracted-wrong-sign"},{"text":"10","is_correct":false,"misconception_token":"dropped-negatives"}]$q$::jsonb, $q$-10$q$, $q$Subtracting 6 moves further left: -4 - 6 = -10.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('23644414-9d46-5479-be84-adcfe901bd43',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'easy',
   $q$What is $-3 \times 4$?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"ignored-negative"},{"text":"1","is_correct":false,"misconception_token":"added-wrong-sign"},{"text":"-7","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"-12","is_correct":true}]$q$::jsonb, $q$-12$q$, $q$A negative times a positive is negative: -3 × 4 = -12.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('eeb049fe-2d01-5f60-ade6-e77442c50038',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'easy',
   $q$What is $(-5)(-6)$?$q$, $q$[{"text":"11","is_correct":false,"misconception_token":"added-dropped-sign"},{"text":"-11","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"-30","is_correct":false,"misconception_token":"negative-times-negative-negative"},{"text":"30","is_correct":true}]$q$::jsonb, $q$30$q$, $q$A negative times a negative is positive: 5 × 6 = 30.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5d57a74d-7bb9-530b-bde4-8b1402631cfb',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'easy',
   $q$What is $-20 \div 5$?$q$, $q$[{"text":"-100","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"4","is_correct":false,"misconception_token":"ignored-negative"},{"text":"-4","is_correct":true},{"text":"-15","is_correct":false,"misconception_token":"subtracted-instead"}]$q$::jsonb, $q$-4$q$, $q$A negative divided by a positive is negative: -20 ÷ 5 = -4.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0bf1d109-2bca-581b-8ff3-ce6fca8ba911',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'easy',
   $q$What is $-18 \div (-3)$?$q$, $q$[{"text":"-15","is_correct":false,"misconception_token":"subtracted-wrong"},{"text":"-6","is_correct":false,"misconception_token":"negative-over-negative-negative"},{"text":"6","is_correct":true},{"text":"-21","is_correct":false,"misconception_token":"subtracted-instead"}]$q$::jsonb, $q$6$q$, $q$A negative divided by a negative is positive: 18 ÷ 3 = 6.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2e9bcefe-47e5-56d0-b677-4bf00e75568d',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'medium',
   $q$What is $-2.5 + 4.1$?$q$, $q$[{"text":"1.6","is_correct":true},{"text":"-1.6","is_correct":false,"misconception_token":"kept-negative-sign"},{"text":"-6.6","is_correct":false,"misconception_token":"added-magnitudes-negative"},{"text":"6.6","is_correct":false,"misconception_token":"added-magnitudes"}]$q$::jsonb, $q$1.6$q$, $q$4.1 is larger, so the sum is positive: 4.1 - 2.5 = 1.6.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('42700a59-766e-537f-a9a5-409cf49d1460',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'medium',
   $q$What is $3.2 - 5.7$?$q$, $q$[{"text":"2.5","is_correct":false,"misconception_token":"dropped-negative"},{"text":"8.9","is_correct":false,"misconception_token":"added-instead"},{"text":"-2.5","is_correct":true},{"text":"-8.9","is_correct":false,"misconception_token":"added-wrong-sign"}]$q$::jsonb, $q$-2.5$q$, $q$3.2 - 5.7 goes below zero: 5.7 - 3.2 = 2.5, so -2.5.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a7143e61-7098-5e48-9f43-38bb6ddd7b61',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'medium',
   $q$What is $-\frac{1}{2} + \frac{3}{4}$?$q$, $q$[{"text":"$\\frac{5}{4}$","is_correct":false,"misconception_token":"added-magnitudes"},{"text":"$-\\frac{1}{4}$","is_correct":false,"misconception_token":"kept-negative-sign"},{"text":"$\\frac{1}{4}$","is_correct":true},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"ignored-first-term"}]$q$::jsonb, $q$$\frac{1}{4}$$q$, $q$Common denominator 4: -2/4 + 3/4 = 1/4.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b11c3f55-aa34-5131-a088-dfe822668f91',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'medium',
   $q$What is $\frac{2}{3} - \frac{5}{6}$?$q$, $q$[{"text":"$-\\frac{3}{6}$","is_correct":false,"misconception_token":"subtracted-numerators-and-denominators"},{"text":"$\\frac{1}{6}$","is_correct":false,"misconception_token":"dropped-negative"},{"text":"$-\\frac{7}{6}$","is_correct":false,"misconception_token":"added-instead"},{"text":"$-\\frac{1}{6}$","is_correct":true}]$q$::jsonb, $q$$-\frac{1}{6}$$q$, $q$Common denominator 6: 4/6 - 5/6 = -1/6.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a476f995-41d3-5a30-ae54-9973cceb95f9',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'medium',
   $q$What is $-\frac{3}{5} \times 10$?$q$, $q$[{"text":"6","is_correct":false,"misconception_token":"ignored-negative"},{"text":"-6","is_correct":true},{"text":"-2","is_correct":false,"misconception_token":"divided-instead"},{"text":"-30","is_correct":false,"misconception_token":"multiplied-denominator-too"}]$q$::jsonb, $q$-6$q$, $q$-3/5 × 10 = -30/5 = -6.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0f7dec92-3e2a-50fe-81be-7c83fe4e68c6',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'medium',
   $q$What is $-\frac{2}{3} \times (-9)$?$q$, $q$[{"text":"-18","is_correct":false,"misconception_token":"ignored-denominator-and-sign"},{"text":"-6","is_correct":false,"misconception_token":"negative-times-negative-negative"},{"text":"6","is_correct":true},{"text":"18","is_correct":false,"misconception_token":"ignored-denominator"}]$q$::jsonb, $q$6$q$, $q$Negative × negative is positive: 2/3 × 9 = 18/3 = 6.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3e86b3c7-a4c9-5174-a5b5-4ba7f8eefb81',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'medium',
   $q$What is $-0.4 \times 0.5$?$q$, $q$[{"text":"-0.9","is_correct":false,"misconception_token":"added-instead"},{"text":"0.2","is_correct":false,"misconception_token":"ignored-negative"},{"text":"-2","is_correct":false,"misconception_token":"misplaced-decimal"},{"text":"-0.2","is_correct":true}]$q$::jsonb, $q$-0.2$q$, $q$0.4 × 0.5 = 0.2, and negative × positive is negative: -0.2.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('959f9cb5-0c68-50dc-bd41-14dfdd479193',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'medium',
   $q$What is $-\frac{3}{4} \div \frac{1}{2}$?$q$, $q$[{"text":"$-\\frac{3}{2}$","is_correct":true},{"text":"$-\\frac{3}{8}$","is_correct":false,"misconception_token":"multiplied-instead-of-flipping"},{"text":"$-\\frac{3}{4}$","is_correct":false,"misconception_token":"divided-by-one"},{"text":"$\\frac{3}{2}$","is_correct":false,"misconception_token":"ignored-negative"}]$q$::jsonb, $q$$-\frac{3}{2}$$q$, $q$Divide = multiply by the reciprocal: -3/4 × 2/1 = -6/4 = -3/2.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fe170ddd-518a-541b-a97d-8e474e7ffc6a',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'medium',
   $q$A diver is 30 feet below the surface (at -30 ft) and descends 15 more feet. What is the diver’s position?$q$, $q$[{"text":"45 ft","is_correct":false,"misconception_token":"dropped-negative"},{"text":"-2 ft","is_correct":false,"misconception_token":"divided-instead"},{"text":"-15 ft","is_correct":false,"misconception_token":"subtracted-instead"},{"text":"-45 ft","is_correct":true}]$q$::jsonb, $q$-45 ft$q$, $q$Descending adds to the depth: -30 + (-15) = -45 ft.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('566a5a0e-6ea4-5b27-82bf-eaaeba4ce4ac',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'medium',
   $q$The temperature is $-4^\circ$F. It rises 9 degrees, then falls 3 degrees. What is the final temperature?$q$, $q$[{"text":"$2^\\circ$F","is_correct":true},{"text":"$-16^\\circ$F","is_correct":false,"misconception_token":"subtracted-both"},{"text":"$8^\\circ$F","is_correct":false,"misconception_token":"added-the-fall"},{"text":"$10^\\circ$F","is_correct":false,"misconception_token":"ignored-start-negative"}]$q$::jsonb, $q$$2^\circ$F$q$, $q$-4 + 9 = 5, then 5 - 3 = 2°F.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('39b79997-11ef-5455-90ff-42a66ee031e4',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'hard',
   $q$What is $-5 + 3 \times (-2)$?$q$, $q$[{"text":"4","is_correct":false,"misconception_token":"added-before-multiplying"},{"text":"16","is_correct":false,"misconception_token":"added-before-multiplying-wrong-sign"},{"text":"-11","is_correct":true},{"text":"-2","is_correct":false,"misconception_token":"multiply-only"}]$q$::jsonb, $q$-11$q$, $q$Multiply first: 3 × (-2) = -6. Then -5 + (-6) = -11.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b446e385-c4c4-55ab-92e2-422ec9234fd9',
   null,
   (select id from public.skills where slug = 'rational-number-operations'),
   'algebra', 'hard',
   $q$Over three days a stock changes by $-2.5$, $+1.75$, and $-0.5$. What is the net change?$q$, $q$[{"text":"-1.25","is_correct":true},{"text":"-4.75","is_correct":false,"misconception_token":"made-all-negative"},{"text":"-0.75","is_correct":false,"misconception_token":"dropped-a-term"},{"text":"1.25","is_correct":false,"misconception_token":"dropped-final-sign"}]$q$::jsonb, $q$-1.25$q$, $q$-2.5 + 1.75 = -0.75, then -0.75 + (-0.5) = -1.25.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- percent-applications (Percent Applications, grade 7, CCSS.MATH.CONTENT.7.RP.A.3) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('845b4cd4-de17-54eb-b439-8c4f22969e9f',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'easy',
   $q$What is 10% of 50?$q$, $q$[{"text":"45","is_correct":false,"misconception_token":"subtracted-instead"},{"text":"5","is_correct":true},{"text":"0.5","is_correct":false,"misconception_token":"shifted-decimal-twice"},{"text":"15","is_correct":false,"misconception_token":"added-instead"}]$q$::jsonb, $q$5$q$, $q$10% = 0.10, and 0.10 × 50 = 5.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bf206c20-18d6-5cc1-ab7c-828757cd5b05',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'easy',
   $q$What is 25% of 80?$q$, $q$[{"text":"20","is_correct":true},{"text":"55","is_correct":false,"misconception_token":"subtracted-instead"},{"text":"2","is_correct":false,"misconception_token":"shifted-decimal-wrong"},{"text":"105","is_correct":false,"misconception_token":"added-instead"}]$q$::jsonb, $q$20$q$, $q$25% = 1/4, and 80 ÷ 4 = 20.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c11cf16f-399f-571a-a4e2-ab3323da13bd',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'easy',
   $q$What is 50% of 30?$q$, $q$[{"text":"1.5","is_correct":false,"misconception_token":"shifted-decimal-wrong"},{"text":"15","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"wrong-fraction"},{"text":"60","is_correct":false,"misconception_token":"doubled-instead"}]$q$::jsonb, $q$15$q$, $q$50% = half, and half of 30 is 15.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d9c9a775-788c-5951-9f97-62add7dbb242',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'easy',
   $q$What is 20% of 200?$q$, $q$[{"text":"40","is_correct":true},{"text":"4","is_correct":false,"misconception_token":"shifted-decimal-wrong"},{"text":"20","is_correct":false,"misconception_token":"used-percent-as-answer"},{"text":"180","is_correct":false,"misconception_token":"subtracted-instead"}]$q$::jsonb, $q$40$q$, $q$0.20 × 200 = 40.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('46dafbdc-7a36-509e-a327-0881352f75cc',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'easy',
   $q$A $40 shirt is marked 10% off. How much is the discount?$q$, $q$[{"text":"$36","is_correct":false,"misconception_token":"found-sale-price-not-discount"},{"text":"$14","is_correct":false,"misconception_token":"added-ten"},{"text":"$0.40","is_correct":false,"misconception_token":"shifted-decimal-twice"},{"text":"$4","is_correct":true}]$q$::jsonb, $q$$4$q$, $q$The discount is 10% of $40: 0.10 × 40 = $4.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8ced7ee0-a97c-56bf-a0a4-41807aaad311',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'easy',
   $q$What is 15% of 60?$q$, $q$[{"text":"75","is_correct":false,"misconception_token":"added-instead"},{"text":"45","is_correct":false,"misconception_token":"subtracted-instead"},{"text":"0.9","is_correct":false,"misconception_token":"shifted-decimal-twice"},{"text":"9","is_correct":true}]$q$::jsonb, $q$9$q$, $q$0.15 × 60 = 9.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('efa01d89-1dce-5472-810c-730b8ac9d888',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'easy',
   $q$A $20 meal has 5% sales tax. How much is the tax?$q$, $q$[{"text":"$0.05","is_correct":false,"misconception_token":"shifted-decimal-twice"},{"text":"$21","is_correct":false,"misconception_token":"found-total-not-tax"},{"text":"$1","is_correct":true},{"text":"$25","is_correct":false,"misconception_token":"added-five"}]$q$::jsonb, $q$$1$q$, $q$5% of $20 = 0.05 × 20 = $1.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('84e65ffc-a1ee-5cde-8748-6e7da8947bab',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'easy',
   $q$What is 100% of 45?$q$, $q$[{"text":"0","is_correct":false,"misconception_token":"confused-with-zero-percent"},{"text":"90","is_correct":false,"misconception_token":"doubled-instead"},{"text":"45","is_correct":true},{"text":"4.5","is_correct":false,"misconception_token":"shifted-decimal-wrong"}]$q$::jsonb, $q$45$q$, $q$100% means the whole amount, so 100% of 45 is 45.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e16cbd47-fc49-5bd2-b5b2-5ed0378dcfb8',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'medium',
   $q$A $50 jacket is 20% off. What is the sale price?$q$, $q$[{"text":"$40","is_correct":true},{"text":"$30","is_correct":false,"misconception_token":"took-double-the-discount"},{"text":"$60","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"$10","is_correct":false,"misconception_token":"found-discount-not-price"}]$q$::jsonb, $q$$40$q$, $q$20% of $50 is $10 off, so $50 - $10 = $40.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7c0c297f-daca-59cb-9be0-b6529a2eb05a',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'medium',
   $q$An $80 dinner gets a 15% tip. What is the total?$q$, $q$[{"text":"$12","is_correct":false,"misconception_token":"found-tip-not-total"},{"text":"$95","is_correct":false,"misconception_token":"used-wrong-percent"},{"text":"$92","is_correct":true},{"text":"$68","is_correct":false,"misconception_token":"subtracted-tip"}]$q$::jsonb, $q$$92$q$, $q$Tip = 15% of 80 = $12; total = 80 + 12 = $92.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3302468f-be54-5450-902f-0605a9e76cbc',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'medium',
   $q$A price rises from $40 to $50. What is the percent increase?$q$, $q$[{"text":"10%","is_correct":false,"misconception_token":"used-difference-as-percent"},{"text":"20%","is_correct":false,"misconception_token":"divided-by-new-not-original"},{"text":"25%","is_correct":true},{"text":"125%","is_correct":false,"misconception_token":"used-ratio-of-prices"}]$q$::jsonb, $q$25%$q$, $q$Increase = 10; percent = 10 ÷ 40 (the original) = 0.25 = 25%.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9b99ca1d-b4ee-5bb2-ba97-5bae4b520588',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'medium',
   $q$8 is what percent of 40?$q$, $q$[{"text":"32%","is_correct":false,"misconception_token":"used-difference"},{"text":"5%","is_correct":false,"misconception_token":"divided-in-wrong-order"},{"text":"320%","is_correct":false,"misconception_token":"shifted-decimal-wrong"},{"text":"20%","is_correct":true}]$q$::jsonb, $q$20%$q$, $q$8 ÷ 40 = 0.2 = 20%.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6c60fabc-af32-57ad-b6a0-2f89ea3bcce0',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'medium',
   $q$A $120 item is marked up 25%. What is the new price?$q$, $q$[{"text":"$145","is_correct":false,"misconception_token":"added-flat-25"},{"text":"$150","is_correct":true},{"text":"$30","is_correct":false,"misconception_token":"found-markup-not-price"},{"text":"$95","is_correct":false,"misconception_token":"subtracted-markup"}]$q$::jsonb, $q$$150$q$, $q$Markup = 25% of 120 = $30; new price = 120 + 30 = $150.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a8e24a77-df61-5b6c-921d-1ce472f1af06',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'medium',
   $q$30% of what number is 12?$q$, $q$[{"text":"4","is_correct":false,"misconception_token":"divided-by-three"},{"text":"3.6","is_correct":false,"misconception_token":"multiplied-instead-of-divided"},{"text":"40","is_correct":true},{"text":"360","is_correct":false,"misconception_token":"shifted-decimal-wrong"}]$q$::jsonb, $q$40$q$, $q$Number = 12 ÷ 0.30 = 40.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f4e3a428-aa1e-5c01-923a-ee285a9c67d6',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'medium',
   $q$A shirt is 40% off and now costs $18. What was the original price?$q$, $q$[{"text":"$12.60","is_correct":false,"misconception_token":"took-more-off"},{"text":"$45","is_correct":false,"misconception_token":"added-40-percent-to-sale"},{"text":"$25.20","is_correct":false,"misconception_token":"took-40-off-the-sale"},{"text":"$30","is_correct":true}]$q$::jsonb, $q$$30$q$, $q$$18 is 60% of the original, so original = 18 ÷ 0.60 = $30.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6ae09d29-fac7-53ad-87e5-ff567e0442c9',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'medium',
   $q$How much simple interest does $200 earn at 5% per year for 2 years?$q$, $q$[{"text":"$20","is_correct":true},{"text":"$210","is_correct":false,"misconception_token":"found-balance-not-interest"},{"text":"$220","is_correct":false,"misconception_token":"found-balance-two-years"},{"text":"$10","is_correct":false,"misconception_token":"forgot-the-two-years"}]$q$::jsonb, $q$$20$q$, $q$Interest = 200 × 0.05 × 2 = $20.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4516cea1-be86-5dde-b53a-adceff6d6f62',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'medium',
   $q$A town of 500 people grows by 12%. What is the new population?$q$, $q$[{"text":"60","is_correct":false,"misconception_token":"found-increase-not-total"},{"text":"440","is_correct":false,"misconception_token":"subtracted-instead"},{"text":"512","is_correct":false,"misconception_token":"added-flat-12"},{"text":"560","is_correct":true}]$q$::jsonb, $q$560$q$, $q$Increase = 12% of 500 = 60; new = 500 + 60 = 560.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a8ab6012-923b-5f88-8e2b-95f870094e7c',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'medium',
   $q$45 is what percent of 60?$q$, $q$[{"text":"75%","is_correct":true},{"text":"25%","is_correct":false,"misconception_token":"used-the-leftover"},{"text":"133%","is_correct":false,"misconception_token":"divided-in-wrong-order"},{"text":"15%","is_correct":false,"misconception_token":"used-difference"}]$q$::jsonb, $q$75%$q$, $q$45 ÷ 60 = 0.75 = 75%.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('114fc790-934d-55b7-8cb0-528fd07309d6',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'hard',
   $q$A $60 game is 25% off, and then 8% tax is added to the sale price. What is the total paid?$q$, $q$[{"text":"$48.00","is_correct":false,"misconception_token":"forgot-the-tax"},{"text":"$50.40","is_correct":false,"misconception_token":"taxed-original-price"},{"text":"$48.60","is_correct":true},{"text":"$49.20","is_correct":false,"misconception_token":"used-wrong-tax-base"}]$q$::jsonb, $q$$48.60$q$, $q$Sale price = 60 × 0.75 = $45; with 8% tax: 45 × 1.08 = $48.60.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ad37dd53-7b1b-52b6-8fe9-67f315656d38',
   null,
   (select id from public.skills where slug = 'percent-applications'),
   'problem-solving-data-analysis', 'hard',
   $q$A $100 stock rises 10% one day and then falls 10% the next. What is its final value?$q$, $q$[{"text":"$99","is_correct":true},{"text":"$90","is_correct":false,"misconception_token":"subtracted-twenty-percent"},{"text":"$101","is_correct":false,"misconception_token":"added-net-one-percent"},{"text":"$100","is_correct":false,"misconception_token":"assumed-percents-cancel"}]$q$::jsonb, $q$$99$q$, $q$Up 10%: 100 → 110. Down 10% of 110 is 11: 110 - 11 = $99.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- two-step-equations (Two-Step Equations & Inequalities, grade 7, CCSS.MATH.CONTENT.7.EE.B.4) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7b332519-8ac4-53a6-9d40-0d759ec08d5d',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $2x + 3 = 11$.$q$, $q$[{"text":"$x = 3$","is_correct":false,"misconception_token":"divided-before-subtracting"},{"text":"$x = 4$","is_correct":true},{"text":"$x = 7$","is_correct":false,"misconception_token":"skipped-divide"},{"text":"$x = 8$","is_correct":false,"misconception_token":"subtracted-only"}]$q$::jsonb, $q$$x = 4$$q$, $q$Subtract 3: 2x = 8. Divide by 2: x = 4.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('23d84b0a-4f27-5cd1-8edb-f099426f17fe',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $3x - 5 = 10$.$q$, $q$[{"text":"$x = 5$","is_correct":true},{"text":"$x = \\frac{5}{3}$","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"$x = 15$","is_correct":false,"misconception_token":"skipped-divide"},{"text":"$x = 45$","is_correct":false,"misconception_token":"multiplied-both"}]$q$::jsonb, $q$$x = 5$$q$, $q$Add 5: 3x = 15. Divide by 3: x = 5.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a42aa7e9-6c14-50ae-ad53-78846be9e94a',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $5x + 2 = 22$.$q$, $q$[{"text":"$x = \\frac{24}{5}$","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"$x = 4$","is_correct":true},{"text":"$x = 5$","is_correct":false,"misconception_token":"ignored-the-two"},{"text":"$x = 20$","is_correct":false,"misconception_token":"skipped-divide"}]$q$::jsonb, $q$$x = 4$$q$, $q$Subtract 2: 5x = 20. Divide by 5: x = 4.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8234d884-c602-59a8-acb0-ee31427b2524',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $\frac{x}{2} + 1 = 5$.$q$, $q$[{"text":"$x = 8$","is_correct":true},{"text":"$x = 3$","is_correct":false,"misconception_token":"forgot-to-multiply"},{"text":"$x = 12$","is_correct":false,"misconception_token":"added-before-multiplying"},{"text":"$x = 2$","is_correct":false,"misconception_token":"divided-instead"}]$q$::jsonb, $q$$x = 8$$q$, $q$Subtract 1: x/2 = 4. Multiply by 2: x = 8.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('91c25bc8-4b51-5170-ac07-b44c49c883f2',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $4x - 3 = 13$.$q$, $q$[{"text":"$x = 16$","is_correct":false,"misconception_token":"skipped-divide"},{"text":"$x = 64$","is_correct":false,"misconception_token":"multiplied-both"},{"text":"$x = 2.5$","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"$x = 4$","is_correct":true}]$q$::jsonb, $q$$x = 4$$q$, $q$Add 3: 4x = 16. Divide by 4: x = 4.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('30b994c9-a575-5a2b-a3dc-f9a962a6b0c9',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $2x + 7 = 1$.$q$, $q$[{"text":"$x = -4$","is_correct":false,"misconception_token":"skipped-divide"},{"text":"$x = 4$","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"$x = 3$","is_correct":false,"misconception_token":"dropped-negative"},{"text":"$x = -3$","is_correct":true}]$q$::jsonb, $q$$x = -3$$q$, $q$Subtract 7: 2x = -6. Divide by 2: x = -3.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4202a334-cff3-5e78-b36c-921f75c2b053',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $6x + 10 = 4$.$q$, $q$[{"text":"$x = -6$","is_correct":false,"misconception_token":"skipped-divide"},{"text":"$x = 1$","is_correct":false,"misconception_token":"dropped-negative"},{"text":"$x = -1$","is_correct":true},{"text":"$x = \\frac{7}{3}$","is_correct":false,"misconception_token":"added-instead"}]$q$::jsonb, $q$$x = -1$$q$, $q$Subtract 10: 6x = -6. Divide by 6: x = -1.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e5d2bf4f-826f-590f-99ba-bcfc1a85309b',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $\frac{x}{3} - 2 = 1$.$q$, $q$[{"text":"$x = 1$","is_correct":false,"misconception_token":"divided-instead"},{"text":"$x = 3$","is_correct":false,"misconception_token":"forgot-to-multiply"},{"text":"$x = 9$","is_correct":true},{"text":"$x = -3$","is_correct":false,"misconception_token":"subtracted-instead-of-adding"}]$q$::jsonb, $q$$x = 9$$q$, $q$Add 2: x/3 = 3. Multiply by 3: x = 9.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('22da574b-b00c-58b6-951b-905f50907682',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'medium',
   $q$Solve for $x$: $3(x + 2) = 18$.$q$, $q$[{"text":"$x = 4$","is_correct":true},{"text":"$x = 6$","is_correct":false,"misconception_token":"forgot-to-subtract-two"},{"text":"$x = 8$","is_correct":false,"misconception_token":"added-instead"},{"text":"$x = 16$","is_correct":false,"misconception_token":"distributed-wrong"}]$q$::jsonb, $q$$x = 4$$q$, $q$Divide by 3: x + 2 = 6. Subtract 2: x = 4.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('203e940d-1773-5dd0-8daa-5c31fda3af33',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'medium',
   $q$Solve for $x$: $2x - 5 = x + 3$.$q$, $q$[{"text":"$x = -2$","is_correct":false,"misconception_token":"moved-terms-wrong-sign"},{"text":"$x = -8$","is_correct":false,"misconception_token":"sign-error"},{"text":"$x = 8$","is_correct":true},{"text":"$x = \\frac{8}{3}$","is_correct":false,"misconception_token":"combined-x-terms-wrong"}]$q$::jsonb, $q$$x = 8$$q$, $q$Subtract x: x - 5 = 3. Add 5: x = 8.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a533855d-4c79-5365-80d7-69da6611758b',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'medium',
   $q$Solve for $x$: $5x + 4 = 3x + 12$.$q$, $q$[{"text":"$x = 8$","is_correct":false,"misconception_token":"skipped-divide"},{"text":"$x = 2$","is_correct":false,"misconception_token":"combined-constants-wrong"},{"text":"$x = 4$","is_correct":true},{"text":"$x = -4$","is_correct":false,"misconception_token":"sign-error"}]$q$::jsonb, $q$$x = 4$$q$, $q$Subtract 3x: 2x + 4 = 12. Subtract 4: 2x = 8. Divide: x = 4.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0fcb834b-aa58-5819-b380-ce17a7e9fbc4',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'medium',
   $q$Solve for $x$: $-2x + 7 = 1$.$q$, $q$[{"text":"$x = 4$","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"$x = -3$","is_correct":false,"misconception_token":"sign-error-on-divide"},{"text":"$x = -4$","is_correct":false,"misconception_token":"skipped-divide"},{"text":"$x = 3$","is_correct":true}]$q$::jsonb, $q$$x = 3$$q$, $q$Subtract 7: -2x = -6. Divide by -2: x = 3.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('016eab41-a5f2-5982-9411-281c92eee94e',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'medium',
   $q$Solve for $x$: $\frac{x - 4}{2} = 5$.$q$, $q$[{"text":"$x = 6$","is_correct":false,"misconception_token":"divided-then-added-wrong"},{"text":"$x = 14$","is_correct":true},{"text":"$x = 9$","is_correct":false,"misconception_token":"multiplied-only-one-side"},{"text":"$x = 7$","is_correct":false,"misconception_token":"forgot-to-multiply"}]$q$::jsonb, $q$$x = 14$$q$, $q$Multiply by 2: x - 4 = 10. Add 4: x = 14.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('33e67626-ae7b-54d7-aabb-66a29f96462c',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'medium',
   $q$Solve for $x$: $7 = 2x - 3$.$q$, $q$[{"text":"$x = 4$","is_correct":false,"misconception_token":"skipped-divide"},{"text":"$x = 2$","is_correct":false,"misconception_token":"subtracted-instead-of-adding"},{"text":"$x = 5$","is_correct":true},{"text":"$x = -5$","is_correct":false,"misconception_token":"sign-error"}]$q$::jsonb, $q$$x = 5$$q$, $q$Add 3: 10 = 2x. Divide by 2: x = 5.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('959cac61-36c5-5c14-8957-6185ade68b6e',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'medium',
   $q$Solve the inequality: $x + 5 > 12$.$q$, $q$[{"text":"$x > 60$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$x > 17$","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"$x < 7$","is_correct":false,"misconception_token":"flipped-sign-needlessly"},{"text":"$x > 7$","is_correct":true}]$q$::jsonb, $q$$x > 7$$q$, $q$Subtract 5 from both sides: x > 7.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4237eb82-9eb5-5b99-adcc-2b73265e9be7',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'medium',
   $q$Solve the inequality: $2x < 10$.$q$, $q$[{"text":"$x < 5$","is_correct":true},{"text":"$x > 5$","is_correct":false,"misconception_token":"flipped-sign-needlessly"},{"text":"$x < 8$","is_correct":false,"misconception_token":"subtracted-instead"},{"text":"$x < 20$","is_correct":false,"misconception_token":"multiplied-instead"}]$q$::jsonb, $q$$x < 5$$q$, $q$Divide both sides by 2 (positive, no flip): x < 5.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fb082330-8148-5e15-9885-7a90d91cbfa3',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'medium',
   $q$Solve the inequality: $3x - 2 \geq 7$.$q$, $q$[{"text":"$x \\leq 3$","is_correct":false,"misconception_token":"flipped-sign-needlessly"},{"text":"$x \\geq \\frac{5}{3}$","is_correct":false,"misconception_token":"subtracted-instead-of-adding"},{"text":"$x \\geq 5$","is_correct":false,"misconception_token":"skipped-divide"},{"text":"$x \\geq 3$","is_correct":true}]$q$::jsonb, $q$$x \geq 3$$q$, $q$Add 2: 3x ≥ 9. Divide by 3: x ≥ 3.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('515a4999-ca3b-5124-993a-53c5bd24dead',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'medium',
   $q$A number tripled, plus 4, equals 19. What is the number?$q$, $q$[{"text":"5","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"skipped-divide"},{"text":"45","is_correct":false,"misconception_token":"multiplied-both"},{"text":"$\\frac{23}{3}$","is_correct":false,"misconception_token":"added-instead-of-subtracting"}]$q$::jsonb, $q$5$q$, $q$3n + 4 = 19 → 3n = 15 → n = 5.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d177c019-b027-5174-a729-314c2b617ea4',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'hard',
   $q$Solve for $x$: $-3x + 5 = -7$.$q$, $q$[{"text":"$x = -4$","is_correct":false,"misconception_token":"sign-error-on-divide"},{"text":"$x = \\frac{2}{3}$","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"$x = 4$","is_correct":true},{"text":"$x = -\\frac{2}{3}$","is_correct":false,"misconception_token":"combined-sign-errors"}]$q$::jsonb, $q$$x = 4$$q$, $q$Subtract 5: -3x = -12. Divide by -3: x = 4.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7ece512a-33b2-5f6c-bf19-d7df6d9e1609',
   null,
   (select id from public.skills where slug = 'two-step-equations'),
   'algebra', 'hard',
   $q$Solve the inequality: $-2x + 3 < 9$.$q$, $q$[{"text":"$x > -3$","is_correct":true},{"text":"$x > -6$","is_correct":false,"misconception_token":"skipped-divide"},{"text":"$x < 3$","is_correct":false,"misconception_token":"sign-and-flip-errors"},{"text":"$x < -3$","is_correct":false,"misconception_token":"forgot-to-flip-sign"}]$q$::jsonb, $q$$x > -3$$q$, $q$Subtract 3: -2x < 6. Divide by -2 and FLIP the sign: x > -3.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- angles-area-volume (Angles, Area & Volume, grade 7, CCSS.MATH.CONTENT.7.G.B) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('49f048e0-72a0-599e-a021-d049e175b439',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'easy',
   $q$A circle has radius 5. What is its circumference? (Use $\pi \approx 3.14$.)$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"forgot-pi"},{"text":"31.4","is_correct":true},{"text":"15.7","is_correct":false,"misconception_token":"used-radius-not-diameter"},{"text":"78.5","is_correct":false,"misconception_token":"used-area-formula"}]$q$::jsonb, $q$31.4$q$, $q$C = 2πr = 2 × 3.14 × 5 = 31.4.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9c887cc7-724f-588c-ac5c-98e463282268',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'easy',
   $q$A circle has radius 3. What is its area? (Use $\pi \approx 3.14$.)$q$, $q$[{"text":"28.26","is_correct":true},{"text":"9.42","is_correct":false,"misconception_token":"forgot-to-square"},{"text":"18.84","is_correct":false,"misconception_token":"used-circumference-formula"},{"text":"9","is_correct":false,"misconception_token":"forgot-pi"}]$q$::jsonb, $q$28.26$q$, $q$A = πr² = 3.14 × 3² = 3.14 × 9 = 28.26.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('64f453ea-19f0-5781-bb1e-40ab5eac8df5',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'easy',
   $q$Two angles are complementary. One is $30^\circ$. What is the other?$q$, $q$[{"text":"$70^\\circ$","is_correct":false,"misconception_token":"used-wrong-total"},{"text":"$60^\\circ$","is_correct":true},{"text":"$330^\\circ$","is_correct":false,"misconception_token":"used-full-circle"},{"text":"$150^\\circ$","is_correct":false,"misconception_token":"used-supplementary"}]$q$::jsonb, $q$$60^\circ$$q$, $q$Complementary angles add to 90°: 90 - 30 = 60°.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ee30d0f3-c45b-5f04-857f-fc257f4ca2d8',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'easy',
   $q$Two angles are supplementary. One is $110^\circ$. What is the other?$q$, $q$[{"text":"$70^\\circ$","is_correct":true},{"text":"$20^\\circ$","is_correct":false,"misconception_token":"used-complementary"},{"text":"$250^\\circ$","is_correct":false,"misconception_token":"used-full-circle"},{"text":"$90^\\circ$","is_correct":false,"misconception_token":"guessed-right-angle"}]$q$::jsonb, $q$$70^\circ$$q$, $q$Supplementary angles add to 180°: 180 - 110 = 70°.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('37c280b4-411a-5e62-a6b1-43a591e905e4',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is 8 units long and 5 units wide. What is its area?$q$, $q$[{"text":"26","is_correct":false,"misconception_token":"found-perimeter"},{"text":"80","is_correct":false,"misconception_token":"doubled-area"},{"text":"13","is_correct":false,"misconception_token":"added-sides"},{"text":"40","is_correct":true}]$q$::jsonb, $q$40$q$, $q$Area = length × width = 8 × 5 = 40.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('debb2675-cfa5-5d42-901d-6651ac4564d1',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'easy',
   $q$A triangle has base 10 and height 6. What is its area?$q$, $q$[{"text":"32","is_correct":false,"misconception_token":"found-perimeter-ish"},{"text":"16","is_correct":false,"misconception_token":"added-base-and-height"},{"text":"60","is_correct":false,"misconception_token":"forgot-one-half"},{"text":"30","is_correct":true}]$q$::jsonb, $q$30$q$, $q$Area = ½ × base × height = ½ × 10 × 6 = 30.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('892e933e-be03-520f-b741-16173a4c665d',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'easy',
   $q$Two lines cross. One angle is $65^\circ$. What is the angle vertical (opposite) to it?$q$, $q$[{"text":"$25^\\circ$","is_correct":false,"misconception_token":"used-complementary"},{"text":"$115^\\circ$","is_correct":false,"misconception_token":"used-supplementary"},{"text":"$65^\\circ$","is_correct":true},{"text":"$295^\\circ$","is_correct":false,"misconception_token":"used-reflex"}]$q$::jsonb, $q$$65^\circ$$q$, $q$Vertical (opposite) angles are equal, so it is also 65°.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('963e2e3d-285c-58f6-974b-966b312befb0',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'easy',
   $q$A cube has side length 3. What is its volume?$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"multiplied-by-sides-count"},{"text":"9","is_correct":false,"misconception_token":"squared-instead-of-cubed"},{"text":"27","is_correct":true},{"text":"54","is_correct":false,"misconception_token":"found-surface-area"}]$q$::jsonb, $q$27$q$, $q$Volume of a cube = side³ = 3 × 3 × 3 = 27.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('17d34c17-05c6-5a5b-948a-0685eb318361',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'medium',
   $q$A circle has diameter 10. What is its area? (Use $\pi \approx 3.14$.)$q$, $q$[{"text":"78.5","is_correct":true},{"text":"314","is_correct":false,"misconception_token":"used-diameter-as-radius"},{"text":"157","is_correct":false,"misconception_token":"forgot-to-square-took-double"},{"text":"31.4","is_correct":false,"misconception_token":"found-circumference"}]$q$::jsonb, $q$78.5$q$, $q$Radius = 5, so A = πr² = 3.14 × 25 = 78.5.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6f8480c4-f3e0-54ca-b482-f745be9b3ead',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'medium',
   $q$A circle has radius 7. What is its circumference? (Use $\pi \approx 3.14$.)$q$, $q$[{"text":"21.98","is_correct":false,"misconception_token":"used-radius-not-diameter"},{"text":"153.86","is_correct":false,"misconception_token":"used-area-formula"},{"text":"43.96","is_correct":true},{"text":"14","is_correct":false,"misconception_token":"forgot-pi"}]$q$::jsonb, $q$43.96$q$, $q$C = 2πr = 2 × 3.14 × 7 = 43.96.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c729263e-9ec5-58bc-ab80-825b6c2998c1',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'medium',
   $q$A rectangular prism is 4 by 3 by 2. What is its volume?$q$, $q$[{"text":"9","is_correct":false,"misconception_token":"added-dimensions"},{"text":"26","is_correct":false,"misconception_token":"added-some-edges"},{"text":"24","is_correct":true},{"text":"52","is_correct":false,"misconception_token":"found-surface-area"}]$q$::jsonb, $q$24$q$, $q$Volume = l × w × h = 4 × 3 × 2 = 24.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a9db9112-731e-5524-b609-bede4c5211ae',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'medium',
   $q$Three angles lie on a straight line: $40^\circ$, $x$, and $90^\circ$. Find $x$.$q$, $q$[{"text":"$230^\\circ$","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"$130^\\circ$","is_correct":false,"misconception_token":"used-90-total"},{"text":"$40^\\circ$","is_correct":false,"misconception_token":"guessed-equal"},{"text":"$50^\\circ$","is_correct":true}]$q$::jsonb, $q$$50^\circ$$q$, $q$Angles on a line add to 180°: 180 - 40 - 90 = 50°.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('045ab584-7704-57a6-8b59-0558786612bd',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'medium',
   $q$A triangle has two angles of $50^\circ$ and $60^\circ$. What is the third angle?$q$, $q$[{"text":"$110^\\circ$","is_correct":false,"misconception_token":"forgot-to-subtract-from-180"},{"text":"$70^\\circ$","is_correct":true},{"text":"$250^\\circ$","is_correct":false,"misconception_token":"added-instead"},{"text":"$80^\\circ$","is_correct":false,"misconception_token":"used-90-total"}]$q$::jsonb, $q$$70^\circ$$q$, $q$Angles of a triangle add to 180°: 180 - 50 - 60 = 70°.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('22cd76e9-8ec7-5db3-86fa-2a867c1f2310',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'medium',
   $q$A circle has radius 6. What is its area? (Use $\pi \approx 3.14$.)$q$, $q$[{"text":"226.08","is_correct":false,"misconception_token":"used-diameter-as-radius"},{"text":"37.68","is_correct":false,"misconception_token":"found-circumference"},{"text":"113.04","is_correct":true},{"text":"18.84","is_correct":false,"misconception_token":"forgot-to-square"}]$q$::jsonb, $q$113.04$q$, $q$A = πr² = 3.14 × 36 = 113.04.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('70399965-c692-58f6-ac07-efcce22b1933',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'medium',
   $q$A cube has side length 4. What is its total surface area?$q$, $q$[{"text":"24","is_correct":false,"misconception_token":"multiplied-side-by-faces"},{"text":"64","is_correct":false,"misconception_token":"found-volume"},{"text":"16","is_correct":false,"misconception_token":"found-one-face"},{"text":"96","is_correct":true}]$q$::jsonb, $q$96$q$, $q$Surface area = 6 × side² = 6 × 16 = 96.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('915df64f-14ab-52d3-99b0-aae1e7f5a0d0',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'medium',
   $q$A rectangular prism is 5 by 5 by 2. What is its volume?$q$, $q$[{"text":"50","is_correct":true},{"text":"25","is_correct":false,"misconception_token":"forgot-height"},{"text":"90","is_correct":false,"misconception_token":"found-surface-area"},{"text":"12","is_correct":false,"misconception_token":"added-dimensions"}]$q$::jsonb, $q$50$q$, $q$Volume = 5 × 5 × 2 = 50.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2ee7f682-ba9a-5acd-8dc2-dbd05e10644f',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'medium',
   $q$An angle and its supplement are equal. What is the measure of each angle?$q$, $q$[{"text":"$180^\\circ$","is_correct":false,"misconception_token":"used-total-as-answer"},{"text":"$60^\\circ$","is_correct":false,"misconception_token":"guessed"},{"text":"$45^\\circ$","is_correct":false,"misconception_token":"used-90-total"},{"text":"$90^\\circ$","is_correct":true}]$q$::jsonb, $q$$90^\circ$$q$, $q$If x + x = 180, then 2x = 180, so x = 90°.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('10032f17-f8fb-581f-a11e-9addbad88734',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'medium',
   $q$A semicircle has radius 4. What is its area? (Use $\pi \approx 3.14$.)$q$, $q$[{"text":"25.12","is_correct":true},{"text":"50.24","is_correct":false,"misconception_token":"forgot-to-halve"},{"text":"100.48","is_correct":false,"misconception_token":"used-diameter-as-radius"},{"text":"12.56","is_correct":false,"misconception_token":"found-half-circumference"}]$q$::jsonb, $q$25.12$q$, $q$Full circle = 3.14 × 16 = 50.24; a semicircle is half: 25.12.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('08225b08-f811-53a2-842c-f7df3fb434ea',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'hard',
   $q$A circle has circumference 31.4. What is its radius? (Use $\pi \approx 3.14$.)$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"found-diameter"},{"text":"15.7","is_correct":false,"misconception_token":"divided-by-pi-only"},{"text":"5","is_correct":true},{"text":"9.87","is_correct":false,"misconception_token":"used-area-relationship"}]$q$::jsonb, $q$5$q$, $q$C = 2πr, so r = 31.4 ÷ (2 × 3.14) = 31.4 ÷ 6.28 = 5.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9f487f36-c2cd-5fca-9224-558508407b9a',
   null,
   (select id from public.skills where slug = 'angles-area-volume'),
   'geometry-trigonometry', 'hard',
   $q$A box is 6 by 4 by 5. What is its total surface area?$q$, $q$[{"text":"148","is_correct":true},{"text":"74","is_correct":false,"misconception_token":"forgot-to-double"},{"text":"296","is_correct":false,"misconception_token":"doubled-twice"},{"text":"120","is_correct":false,"misconception_token":"found-volume"}]$q$::jsonb, $q$148$q$, $q$SA = 2(lw + lh + wh) = 2(24 + 30 + 20) = 2(74) = 148.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- probability-models (Probability, grade 7, CCSS.MATH.CONTENT.7.SP.C) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('db2d0014-d1f3-5309-a69a-c4fb3d89f8c3',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'easy',
   $q$A fair coin is flipped. What is the probability of heads?$q$, $q$[{"text":"2","is_correct":false,"misconception_token":"used-count-not-probability"},{"text":"$\\frac{1}{2}$","is_correct":true},{"text":"1","is_correct":false,"misconception_token":"certain-event-confusion"},{"text":"$\\frac{1}{4}$","is_correct":false,"misconception_token":"used-two-flips"}]$q$::jsonb, $q$$\frac{1}{2}$$q$, $q$One of two equally likely outcomes: P = 1/2.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c534f8ed-715c-5bd5-b0e3-078367ef90db',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'easy',
   $q$A standard number cube (die) is rolled. What is the probability of rolling a 3?$q$, $q$[{"text":"$\\frac{1}{6}$","is_correct":true},{"text":"$\\frac{3}{6}$","is_correct":false,"misconception_token":"used-face-in-numerator"},{"text":"$\\frac{1}{3}$","is_correct":false,"misconception_token":"used-the-face-value"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"guessed-half"}]$q$::jsonb, $q$$\frac{1}{6}$$q$, $q$One favorable outcome out of six: P = 1/6.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('55d611d7-0e82-5fd8-8598-8024dccdee47',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'easy',
   $q$A bag has 3 red and 2 blue marbles. What is the probability of drawing red?$q$, $q$[{"text":"$\\frac{2}{5}$","is_correct":false,"misconception_token":"used-the-other-color"},{"text":"$\\frac{3}{5}$","is_correct":true},{"text":"$\\frac{1}{3}$","is_correct":false,"misconception_token":"guessed"},{"text":"$\\frac{3}{2}$","is_correct":false,"misconception_token":"used-red-over-blue"}]$q$::jsonb, $q$$\frac{3}{5}$$q$, $q$3 red out of 5 total: P = 3/5.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('332bc87d-8a63-5d17-9a3b-b101431caa8f',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'easy',
   $q$A spinner has 4 equal-sized colored sections. What is the probability of landing on one particular color?$q$, $q$[{"text":"$\\frac{1}{4}$","is_correct":true},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"guessed-half"},{"text":"4","is_correct":false,"misconception_token":"used-count-not-probability"},{"text":"$\\frac{3}{4}$","is_correct":false,"misconception_token":"used-complement"}]$q$::jsonb, $q$$\frac{1}{4}$$q$, $q$One of four equally likely sections: P = 1/4.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('59ac5a3b-ede6-5551-84d0-eb43684fa188',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'easy',
   $q$A die is rolled. What is the probability of an even number?$q$, $q$[{"text":"$\\frac{1}{6}$","is_correct":false,"misconception_token":"counted-one-even"},{"text":"$\\frac{2}{3}$","is_correct":false,"misconception_token":"overcounted"},{"text":"$\\frac{1}{3}$","is_correct":false,"misconception_token":"miscounted-evens"},{"text":"$\\frac{1}{2}$","is_correct":true}]$q$::jsonb, $q$$\frac{1}{2}$$q$, $q$Even faces are 2, 4, 6 — 3 of 6, so P = 3/6 = 1/2.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1ae26be6-b429-5efc-930a-dbedc6a63efb',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'easy',
   $q$What is the probability of an impossible event?$q$, $q$[{"text":"-1","is_correct":false,"misconception_token":"used-negative"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"guessed-half"},{"text":"1","is_correct":false,"misconception_token":"confused-with-certain"},{"text":"0","is_correct":true}]$q$::jsonb, $q$0$q$, $q$An impossible event never happens, so its probability is 0.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('30fd1deb-5314-5827-bbc2-b6d382957d71',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'easy',
   $q$What is the probability of a certain event?$q$, $q$[{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"guessed-half"},{"text":"0","is_correct":false,"misconception_token":"confused-with-impossible"},{"text":"1","is_correct":true},{"text":"100","is_correct":false,"misconception_token":"used-percent-as-number"}]$q$::jsonb, $q$1$q$, $q$A certain event always happens, so its probability is 1.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('761ee044-edda-5d38-845b-e1af755f5946',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'easy',
   $q$A bag has 5 marbles; 1 is green. What is the probability of drawing green?$q$, $q$[{"text":"$\\frac{1}{4}$","is_correct":false,"misconception_token":"used-non-green-total"},{"text":"$\\frac{4}{5}$","is_correct":false,"misconception_token":"used-complement"},{"text":"$\\frac{1}{5}$","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"used-count-not-probability"}]$q$::jsonb, $q$$\frac{1}{5}$$q$, $q$1 green out of 5 total: P = 1/5.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('37f3e309-aa88-57bd-961a-aae818bd8826',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has 4 red and 6 blue marbles. What is the probability of drawing blue?$q$, $q$[{"text":"$\\frac{3}{5}$","is_correct":true},{"text":"$\\frac{2}{5}$","is_correct":false,"misconception_token":"used-the-other-color"},{"text":"$\\frac{4}{6}$","is_correct":false,"misconception_token":"inverted-ratio"},{"text":"$\\frac{6}{4}$","is_correct":false,"misconception_token":"used-blue-over-red"}]$q$::jsonb, $q$$\frac{3}{5}$$q$, $q$6 blue of 10 total: 6/10 = 3/5.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8418ff1a-1453-50b4-9414-f461fb8ab4c3',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'medium',
   $q$A die is rolled. What is the probability of a number greater than 4?$q$, $q$[{"text":"$\\frac{1}{6}$","is_correct":false,"misconception_token":"counted-one-face"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"included-four"},{"text":"$\\frac{1}{3}$","is_correct":true},{"text":"$\\frac{2}{3}$","is_correct":false,"misconception_token":"used-complement"}]$q$::jsonb, $q$$\frac{1}{3}$$q$, $q$Greater than 4 means 5 or 6 — 2 of 6, so 2/6 = 1/3.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1e56c342-6461-5586-9490-75387efb7092',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'medium',
   $q$On a spinner, $P(A) = 0.3$ and $P(B) = 0.5$. What is $P(C)$ if C is the only other outcome?$q$, $q$[{"text":"0.5","is_correct":false,"misconception_token":"guessed"},{"text":"0.8","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"0.2","is_correct":true},{"text":"0.15","is_correct":false,"misconception_token":"multiplied"}]$q$::jsonb, $q$0.2$q$, $q$All probabilities sum to 1: 1 - 0.3 - 0.5 = 0.2.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('53b38bde-6ef7-5b5e-a237-a64805813299',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'medium',
   $q$If $P(\text{rain}) = 0.7$, what is $P(\text{no rain})$?$q$, $q$[{"text":"1.7","is_correct":false,"misconception_token":"added-to-one"},{"text":"0.7","is_correct":false,"misconception_token":"repeated-given"},{"text":"-0.7","is_correct":false,"misconception_token":"negated"},{"text":"0.3","is_correct":true}]$q$::jsonb, $q$0.3$q$, $q$The complement: 1 - 0.7 = 0.3.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('233b00ec-4141-5e30-a485-6d56295f3045',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'medium',
   $q$Two fair coins are flipped. What is the probability of two heads?$q$, $q$[{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"used-one-coin"},{"text":"$\\frac{1}{4}$","is_correct":true},{"text":"$\\frac{1}{3}$","is_correct":false,"misconception_token":"miscounted-outcomes"},{"text":"$\\frac{3}{4}$","is_correct":false,"misconception_token":"used-complement"}]$q$::jsonb, $q$$\frac{1}{4}$$q$, $q$P(HH) = 1/2 × 1/2 = 1/4.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ab78ce47-3304-5588-b453-7e0768d77b3f',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'medium',
   $q$A die is rolled 60 times. About how many times would you expect to roll a 2?$q$, $q$[{"text":"30","is_correct":false,"misconception_token":"used-half"},{"text":"60","is_correct":false,"misconception_token":"used-total-rolls"},{"text":"10","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"used-face-value"}]$q$::jsonb, $q$10$q$, $q$Expected = 60 × 1/6 = 10.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a3182398-881e-53f5-89e2-01588a707bbb',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has 2 red, 3 blue, and 3 green marbles. What is the probability of NOT drawing red?$q$, $q$[{"text":"$\\frac{5}{8}$","is_correct":false,"misconception_token":"miscounted-non-red"},{"text":"$\\frac{1}{4}$","is_correct":false,"misconception_token":"found-probability-of-red"},{"text":"$\\frac{3}{8}$","is_correct":false,"misconception_token":"used-one-other-color"},{"text":"$\\frac{3}{4}$","is_correct":true}]$q$::jsonb, $q$$\frac{3}{4}$$q$, $q$Not red = 6 of 8 = 6/8 = 3/4 (or 1 - 2/8).$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3be72c08-4f2a-50aa-afa9-0ae6458ceb19',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'medium',
   $q$Cards numbered 1 to 10 are shuffled; one is drawn. What is the probability of a multiple of 3?$q$, $q$[{"text":"$\\frac{3}{10}$","is_correct":true},{"text":"$\\frac{1}{3}$","is_correct":false,"misconception_token":"used-3-in-denominator"},{"text":"$\\frac{4}{10}$","is_correct":false,"misconception_token":"included-ten"},{"text":"$\\frac{1}{10}$","is_correct":false,"misconception_token":"counted-one"}]$q$::jsonb, $q$$\frac{3}{10}$$q$, $q$Multiples of 3 in 1–10 are 3, 6, 9 — three of ten: 3/10.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e13d820d-752d-5d96-8415-b70627ec44af',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'medium',
   $q$A spinner is spun 20 times and lands on red 8 times. What is the experimental probability of red?$q$, $q$[{"text":"$\\frac{20}{8}$","is_correct":false,"misconception_token":"inverted-ratio"},{"text":"8","is_correct":false,"misconception_token":"used-count-not-probability"},{"text":"$\\frac{3}{5}$","is_correct":false,"misconception_token":"used-non-red"},{"text":"$\\frac{2}{5}$","is_correct":true}]$q$::jsonb, $q$$\frac{2}{5}$$q$, $q$Experimental probability = 8/20 = 2/5.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('63545a69-7dc4-5e65-ac1b-1fba7cefe928',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'medium',
   $q$A spinner has theoretical $P(\text{red}) = \frac{1}{4}$. In 40 spins, how many reds are expected?$q$, $q$[{"text":"10","is_correct":true},{"text":"4","is_correct":false,"misconception_token":"used-denominator"},{"text":"25","is_correct":false,"misconception_token":"used-percent-of-100"},{"text":"40","is_correct":false,"misconception_token":"used-total-spins"}]$q$::jsonb, $q$10$q$, $q$Expected = 40 × 1/4 = 10.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3163ba3d-18af-58f8-8838-e56f7487c594',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'hard',
   $q$Two dice are rolled. What is the probability the sum is 7?$q$, $q$[{"text":"$\\frac{1}{12}$","is_correct":false,"misconception_token":"undercounted-combinations"},{"text":"$\\frac{7}{36}$","is_correct":false,"misconception_token":"used-sum-as-count"},{"text":"$\\frac{1}{6}$","is_correct":true},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"guessed"}]$q$::jsonb, $q$$\frac{1}{6}$$q$, $q$Six ways make 7: (1,6)(2,5)(3,4)(4,3)(5,2)(6,1). 6/36 = 1/6.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ec351b22-68db-5811-aed4-8d5209e7e621',
   null,
   (select id from public.skills where slug = 'probability-models'),
   'problem-solving-data-analysis', 'hard',
   $q$A bag has 3 red and 2 blue marbles. Two are drawn WITHOUT replacement. What is the probability both are red?$q$, $q$[{"text":"$\\frac{3}{10}$","is_correct":true},{"text":"$\\frac{3}{5}$","is_correct":false,"misconception_token":"used-one-draw"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"guessed"},{"text":"$\\frac{9}{25}$","is_correct":false,"misconception_token":"used-with-replacement"}]$q$::jsonb, $q$$\frac{3}{10}$$q$, $q$First red 3/5, then 2 red of 4 left: 3/5 × 2/4 = 6/20 = 3/10.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

commit;
