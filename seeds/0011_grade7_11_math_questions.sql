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

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-apr11')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Polynomials & Rational Expressions', null, '9-12', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-polynomial-operations')::uuid, 'skill', md5('pe-aos:dom-math-apr11')::uuid, 'math', 'Polynomial Operations', 'polynomial-operations', '9-12', 'advanced-math', '11', 11, 'CCSS.MATH.CONTENT.HSA.APR.A.1', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-rational-radical-expressions')::uuid, 'skill', md5('pe-aos:dom-math-apr11')::uuid, 'math', 'Rational & Radical Expressions', 'rational-radical-expressions', '9-12', 'advanced-math', '11', 11, 'CCSS.MATH.CONTENT.HSA.APR.D.6', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-fn11')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Functions', null, '9-12', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-quadratic-functions')::uuid, 'skill', md5('pe-aos:dom-math-fn11')::uuid, 'math', 'Quadratic Functions', 'quadratic-functions', '9-12', 'advanced-math', '11', 11, 'CCSS.MATH.CONTENT.HSF.IF.C.7', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-exponential-logarithmic')::uuid, 'skill', md5('pe-aos:dom-math-fn11')::uuid, 'math', 'Exponential & Logarithmic', 'exponential-logarithmic', '9-12', 'advanced-math', '11', 11, 'CCSS.MATH.CONTENT.HSF.LE.A.4', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-eq11')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Reasoning with Equations & Inequalities', null, '9-12', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-systems-of-equations')::uuid, 'skill', md5('pe-aos:dom-math-eq11')::uuid, 'math', 'Systems of Equations', 'systems-of-equations', '9-12', 'algebra', '11', 11, 'CCSS.MATH.CONTENT.HSA.REI.C.7', '{}')
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
   $q$A price rises from 40 dollars to 50 dollars. What is the percent increase?$q$, $q$[{"text":"10%","is_correct":false,"misconception_token":"used-difference-as-percent"},{"text":"20%","is_correct":false,"misconception_token":"divided-by-new-not-original"},{"text":"25%","is_correct":true},{"text":"125%","is_correct":false,"misconception_token":"used-ratio-of-prices"}]$q$::jsonb, $q$25%$q$, $q$Increase = 10; percent = 10 ÷ 40 (the original) = 0.25 = 25%.$q$, 'published')
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

-- polynomial-operations (Polynomial Operations, grade 11, CCSS.MATH.CONTENT.HSA.APR.A.1) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fdf2f0bc-b651-53c9-a1af-057a09a8f220',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'easy',
   $q$Add: $(3x^2 + 2x) + (x^2 + 5x)$.$q$, $q$[{"text":"$3x^2 + 7x$","is_correct":false,"misconception_token":"dropped-a-term"},{"text":"$4x^2 + 7x$","is_correct":true},{"text":"$4x^2 + 10x$","is_correct":false,"misconception_token":"added-unlike-terms"},{"text":"$4x^4 + 7x^2$","is_correct":false,"misconception_token":"added-exponents"}]$q$::jsonb, $q$$4x^2 + 7x$$q$, $q$Combine like terms: 3x² + x² = 4x²; 2x + 5x = 7x.$q$, 'published')
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
  ('9dd6d073-d50b-5cdd-b215-7bbad881f8fd',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'easy',
   $q$Subtract: $(5x^2 - 3x) - (2x^2 + x)$.$q$, $q$[{"text":"$3x^2 - 4x$","is_correct":true},{"text":"$7x^2 - 4x$","is_correct":false,"misconception_token":"added-first-terms"},{"text":"$3x^2 - 2x$","is_correct":false,"misconception_token":"did-not-distribute-minus"},{"text":"$3x^2 + 4x$","is_correct":false,"misconception_token":"sign-error"}]$q$::jsonb, $q$$3x^2 - 4x$$q$, $q$Distribute the minus: 5x² - 3x - 2x² - x = 3x² - 4x.$q$, 'published')
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
  ('9dec1dd9-041b-5e71-bb26-6f236259d7e8',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'easy',
   $q$Multiply: $2x(3x + 4)$.$q$, $q$[{"text":"$6x + 8$","is_correct":false,"misconception_token":"dropped-a-variable"},{"text":"$6x^2 + 8x$","is_correct":true},{"text":"$8x^2$","is_correct":false,"misconception_token":"combined-unlike-terms"},{"text":"$6x^2 + 4x$","is_correct":false,"misconception_token":"partial-distribution"}]$q$::jsonb, $q$$6x^2 + 8x$$q$, $q$Distribute: 2x·3x = 6x²; 2x·4 = 8x.$q$, 'published')
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
  ('48f5f77b-4304-5612-ae77-f152f44b91b1',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'easy',
   $q$Multiply: $(x + 3)(x + 2)$.$q$, $q$[{"text":"$x^2 + 5x + 6$","is_correct":true},{"text":"$x^2 + 6$","is_correct":false,"misconception_token":"only-first-and-last"},{"text":"$x^2 + 5x + 5$","is_correct":false,"misconception_token":"added-instead-of-multiplying-constants"},{"text":"$x^2 + 6x + 6$","is_correct":false,"misconception_token":"added-inner-outer-wrong"}]$q$::jsonb, $q$$x^2 + 5x + 6$$q$, $q$FOIL: x² + 2x + 3x + 6 = x² + 5x + 6.$q$, 'published')
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
  ('c1ccf25c-26b3-5a4d-b327-1027355ed408',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'easy',
   $q$What is the degree of $4x^3 + 2x^2 - 7$?$q$, $q$[{"text":"4","is_correct":false,"misconception_token":"used-leading-coefficient"},{"text":"9","is_correct":false,"misconception_token":"summed-exponents"},{"text":"2","is_correct":false,"misconception_token":"used-second-term"},{"text":"3","is_correct":true}]$q$::jsonb, $q$3$q$, $q$The degree is the highest exponent, which is 3.$q$, 'published')
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
  ('0e70934a-12ec-5111-be4a-f6264a095153',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'easy',
   $q$Simplify: $(x^2)(x^3)$.$q$, $q$[{"text":"$x^{-1}$","is_correct":false,"misconception_token":"subtracted-exponents"},{"text":"$2x^5$","is_correct":false,"misconception_token":"added-a-coefficient"},{"text":"$x^6$","is_correct":false,"misconception_token":"multiplied-exponents"},{"text":"$x^5$","is_correct":true}]$q$::jsonb, $q$$x^5$$q$, $q$Multiplying powers adds exponents: x^(2+3) = x⁵.$q$, 'published')
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
  ('0df817b4-c07b-5ea3-b3c7-b883583f6c9a',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'easy',
   $q$Factor: $x^2 + 5x$.$q$, $q$[{"text":"$x(x - 5)$","is_correct":false,"misconception_token":"sign-error"},{"text":"$(x + 5)$","is_correct":false,"misconception_token":"dropped-the-factor"},{"text":"$x(x + 5)$","is_correct":true},{"text":"$x^2 + 5$","is_correct":false,"misconception_token":"did-not-factor"}]$q$::jsonb, $q$$x(x + 5)$$q$, $q$Factor out the common x: x(x + 5).$q$, 'published')
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
  ('9d5cc8a9-2a94-5bbb-9899-7a50d22bd82c',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'easy',
   $q$Simplify: $-(2x - 3)$.$q$, $q$[{"text":"$2x + 3$","is_correct":false,"misconception_token":"flipped-only-second"},{"text":"$-2x - 3$","is_correct":false,"misconception_token":"did-not-distribute-to-second"},{"text":"$-2x + 3$","is_correct":true},{"text":"$2x - 3$","is_correct":false,"misconception_token":"ignored-negative"}]$q$::jsonb, $q$$-2x + 3$$q$, $q$Distribute the negative to both terms: -2x + 3.$q$, 'published')
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
  ('93be1b90-6262-5b2b-a23f-94512a201d3b',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'medium',
   $q$Add: $(2x^2 + 3x - 1) + (x^2 - 4x + 5)$.$q$, $q$[{"text":"$3x^2 - x + 4$","is_correct":true},{"text":"$3x^2 + 7x + 4$","is_correct":false,"misconception_token":"added-middle-signs-wrong"},{"text":"$3x^4 - x + 4$","is_correct":false,"misconception_token":"added-exponents"},{"text":"$3x^2 - x - 4$","is_correct":false,"misconception_token":"constant-sign-error"}]$q$::jsonb, $q$$3x^2 - x + 4$$q$, $q$3x²; 3x - 4x = -x; -1 + 5 = 4.$q$, 'published')
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
  ('0728b57e-1688-56d7-b8f3-c6f141437a5c',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'medium',
   $q$Multiply: $(3x - 2)(x + 4)$.$q$, $q$[{"text":"$3x^2 + 10x + 8$","is_correct":false,"misconception_token":"last-term-sign-error"},{"text":"$3x^2 + 14x - 8$","is_correct":false,"misconception_token":"added-inner-outer-wrong"},{"text":"$3x^2 + 10x - 8$","is_correct":true},{"text":"$3x^2 - 8$","is_correct":false,"misconception_token":"only-first-and-last"}]$q$::jsonb, $q$$3x^2 + 10x - 8$$q$, $q$FOIL: 3x² + 12x - 2x - 8 = 3x² + 10x - 8.$q$, 'published')
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
  ('f1a1bbd6-fc02-5358-ac9c-d1cf73f31451',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'medium',
   $q$Multiply: $(x - 5)(x + 5)$.$q$, $q$[{"text":"$x^2 - 10x + 25$","is_correct":false,"misconception_token":"treated-as-square"},{"text":"$x^2 + 25$","is_correct":false,"misconception_token":"sign-error"},{"text":"$x^2 - 25$","is_correct":true},{"text":"$x^2 - 10$","is_correct":false,"misconception_token":"added-instead-of-multiplying"}]$q$::jsonb, $q$$x^2 - 25$$q$, $q$Difference of squares: x² - 25.$q$, 'published')
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
  ('a81d992c-d1a4-5938-a49f-86b2447fadc6',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'medium',
   $q$Expand: $(x + 4)^2$.$q$, $q$[{"text":"$x^2 + 8x + 8$","is_correct":false,"misconception_token":"wrong-constant"},{"text":"$x^2 + 16$","is_correct":false,"misconception_token":"forgot-middle-term"},{"text":"$x^2 + 16x + 16$","is_correct":false,"misconception_token":"doubled-wrong-term"},{"text":"$x^2 + 8x + 16$","is_correct":true}]$q$::jsonb, $q$$x^2 + 8x + 16$$q$, $q$(x+4)² = x² + 2·4·x + 16 = x² + 8x + 16.$q$, 'published')
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
  ('55ffce9f-ac40-51fc-8d20-57d8f65ab4bf',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'medium',
   $q$Factor: $x^2 - 9$.$q$, $q$[{"text":"$(x - 3)^2$","is_correct":false,"misconception_token":"treated-as-perfect-square"},{"text":"$(x - 3)(x + 3)$","is_correct":true},{"text":"$(x - 9)(x + 1)$","is_correct":false,"misconception_token":"wrong-factor-pair"},{"text":"$(x + 3)^2$","is_correct":false,"misconception_token":"sign-error"}]$q$::jsonb, $q$$(x - 3)(x + 3)$$q$, $q$Difference of squares: x² - 9 = (x - 3)(x + 3).$q$, 'published')
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
  ('59248457-b059-5221-a8a1-4b56da09a405',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'medium',
   $q$Factor: $x^2 + 7x + 12$.$q$, $q$[{"text":"$(x - 3)(x - 4)$","is_correct":false,"misconception_token":"sign-error"},{"text":"$(x + 2)(x + 6)$","is_correct":false,"misconception_token":"wrong-factor-pair-right-product"},{"text":"$(x + 3)(x + 4)$","is_correct":true},{"text":"$(x + 1)(x + 12)$","is_correct":false,"misconception_token":"used-product-not-sum"}]$q$::jsonb, $q$$(x + 3)(x + 4)$$q$, $q$Two numbers multiply to 12 and add to 7: 3 and 4.$q$, 'published')
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
  ('3fd9ebc0-021d-58d1-9dba-fe6e067409a0',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'medium',
   $q$Factor: $x^2 - 5x + 6$.$q$, $q$[{"text":"$(x - 2)(x + 3)$","is_correct":false,"misconception_token":"mixed-signs"},{"text":"$(x + 2)(x + 3)$","is_correct":false,"misconception_token":"sign-error"},{"text":"$(x - 1)(x - 6)$","is_correct":false,"misconception_token":"used-product-not-sum"},{"text":"$(x - 2)(x - 3)$","is_correct":true}]$q$::jsonb, $q$$(x - 2)(x - 3)$$q$, $q$Two numbers multiply to 6 and add to -5: -2 and -3.$q$, 'published')
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
  ('7ba4b0d8-3ef3-5f68-a713-de18d2ae8107',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'medium',
   $q$Divide: $\dfrac{6x^3 + 4x^2}{2x}$.$q$, $q$[{"text":"$3x^2 + 2x$","is_correct":true},{"text":"$3x + 2$","is_correct":false,"misconception_token":"over-reduced-exponents"},{"text":"$3x^2 + 2$","is_correct":false,"misconception_token":"dropped-a-variable"},{"text":"$3x^3 + 2x^2$","is_correct":false,"misconception_token":"did-not-reduce-exponents"}]$q$::jsonb, $q$$3x^2 + 2x$$q$, $q$Divide each term by 2x: 6x³/2x = 3x²; 4x²/2x = 2x.$q$, 'published')
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
  ('b3b4db7d-4c10-5f74-8fcd-7849245853c3',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'medium',
   $q$What are the zeros of $(x - 2)(x + 5)$?$q$, $q$[{"text":"$x = 2,\\ x = 5$","is_correct":false,"misconception_token":"ignored-negative"},{"text":"$x = -2,\\ x = -5$","is_correct":false,"misconception_token":"both-signs-wrong"},{"text":"$x = -2,\\ x = 5$","is_correct":false,"misconception_token":"sign-flip"},{"text":"$x = 2,\\ x = -5$","is_correct":true}]$q$::jsonb, $q$$x = 2,\ x = -5$$q$, $q$Set each factor to 0: x - 2 = 0 → x = 2; x + 5 = 0 → x = -5.$q$, 'published')
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
  ('b701ce1f-f9ee-58a8-a3d3-8db8bb59d26a',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'medium',
   $q$By the Remainder Theorem, what is the remainder when $P(x) = x^2 - 4$ is divided by $(x - 3)$?$q$, $q$[{"text":"5","is_correct":true},{"text":"13","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"1","is_correct":false,"misconception_token":"arithmetic-slip"},{"text":"6","is_correct":false,"misconception_token":"used-3x-not-x-squared"}]$q$::jsonb, $q$5$q$, $q$Remainder = P(3) = 3² - 4 = 9 - 4 = 5.$q$, 'published')
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
  ('2ccb1e6a-87a7-55fe-a3a7-7c66a40dfe88',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'hard',
   $q$Multiply: $(x + 2)(x^2 - 3x + 1)$.$q$, $q$[{"text":"$x^3 - 5x^2 - 5x + 2$","is_correct":false,"misconception_token":"combined-x2-terms-wrong"},{"text":"$x^3 - x^2 + 5x + 2$","is_correct":false,"misconception_token":"x-term-sign-error"},{"text":"$x^3 - x^2 - 5x + 2$","is_correct":true},{"text":"$x^3 - x^2 - 5x - 2$","is_correct":false,"misconception_token":"constant-sign-error"}]$q$::jsonb, $q$$x^3 - x^2 - 5x + 2$$q$, $q$x³ - 3x² + x + 2x² - 6x + 2 = x³ - x² - 5x + 2.$q$, 'published')
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
  ('ddf0a2ed-5806-5130-b16c-3dca0872b70d',
   null,
   (select id from public.skills where slug = 'polynomial-operations'),
   'advanced-math', 'hard',
   $q$Factor completely: $2x^2 + 10x + 12$.$q$, $q$[{"text":"$2(x + 2)(x + 3)$","is_correct":true},{"text":"$2(x + 1)(x + 6)$","is_correct":false,"misconception_token":"wrong-factor-pair"},{"text":"$(x + 2)(x + 3)$","is_correct":false,"misconception_token":"dropped-the-gcf"},{"text":"$(2x + 4)(x + 3)$","is_correct":false,"misconception_token":"not-fully-factored"}]$q$::jsonb, $q$$2(x + 2)(x + 3)$$q$, $q$GCF 2: 2(x² + 5x + 6) = 2(x + 2)(x + 3).$q$, 'published')
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

-- rational-radical-expressions (Rational & Radical Expressions, grade 11, CCSS.MATH.CONTENT.HSA.APR.D.6) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e9448431-cee3-5dae-8aed-614fef7646c9',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'easy',
   $q$Simplify: $\sqrt{36}$.$q$, $q$[{"text":"1296","is_correct":false,"misconception_token":"squared-instead"},{"text":"6","is_correct":true},{"text":"18","is_correct":false,"misconception_token":"halved-instead-of-rooting"},{"text":"72","is_correct":false,"misconception_token":"doubled"}]$q$::jsonb, $q$6$q$, $q$6 × 6 = 36, so √36 = 6.$q$, 'published')
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
  ('032473c1-cefe-5b09-b352-8c47e8a73dad',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'easy',
   $q$Simplify: $\sqrt{50}$.$q$, $q$[{"text":"$5\\sqrt{2}$","is_correct":true},{"text":"$2\\sqrt{5}$","is_correct":false,"misconception_token":"swapped-factors"},{"text":"$25\\sqrt{2}$","is_correct":false,"misconception_token":"did-not-root-the-square"},{"text":"$5\\sqrt{10}$","is_correct":false,"misconception_token":"wrong-factor-pair"}]$q$::jsonb, $q$$5\sqrt{2}$$q$, $q$√50 = √(25·2) = 5√2.$q$, 'published')
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
  ('0c6999ff-b2f0-57df-ac98-a1ca052a845d',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'easy',
   $q$Evaluate: $8^{1/3}$.$q$, $q$[{"text":"24","is_correct":false,"misconception_token":"multiplied-by-power"},{"text":"2","is_correct":true},{"text":"512","is_correct":false,"misconception_token":"cubed-instead"},{"text":"4","is_correct":false,"misconception_token":"divided-by-power"}]$q$::jsonb, $q$2$q$, $q$8^(1/3) is the cube root of 8, which is 2.$q$, 'published')
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
  ('ab104601-8608-56bd-beb0-f3eadf33ea2d',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'easy',
   $q$Simplify (for $x \neq 0$): $\dfrac{x^2}{x}$.$q$, $q$[{"text":"$x$","is_correct":true},{"text":"$x^2$","is_correct":false,"misconception_token":"did-not-reduce"},{"text":"$x^3$","is_correct":false,"misconception_token":"added-exponents"},{"text":"$1$","is_correct":false,"misconception_token":"cancelled-everything"}]$q$::jsonb, $q$$x$$q$, $q$x²/x = x^(2-1) = x.$q$, 'published')
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
  ('535ac190-e569-520d-9597-f926fec5f802',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'easy',
   $q$Simplify (for $x \neq 0$): $\dfrac{xy}{x}$.$q$, $q$[{"text":"$xy$","is_correct":false,"misconception_token":"did-not-cancel"},{"text":"$1$","is_correct":false,"misconception_token":"cancelled-everything"},{"text":"$x$","is_correct":false,"misconception_token":"cancelled-wrong-variable"},{"text":"$y$","is_correct":true}]$q$::jsonb, $q$$y$$q$, $q$The x cancels, leaving y.$q$, 'published')
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
  ('7fe4deb7-6a87-5a6f-9179-8075aa0a8cea',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'easy',
   $q$Evaluate: $16^{1/2}$.$q$, $q$[{"text":"256","is_correct":false,"misconception_token":"squared-instead"},{"text":"32","is_correct":false,"misconception_token":"multiplied"},{"text":"8","is_correct":false,"misconception_token":"halved-instead-of-rooting"},{"text":"4","is_correct":true}]$q$::jsonb, $q$4$q$, $q$16^(1/2) = √16 = 4.$q$, 'published')
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
  ('85d9ed5f-c4a5-5829-b744-d6fdf6afe13e',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'easy',
   $q$Evaluate: $\sqrt{9} + \sqrt{16}$.$q$, $q$[{"text":"25","is_correct":false,"misconception_token":"added-under-root-no-root"},{"text":"5","is_correct":false,"misconception_token":"rooted-the-sum"},{"text":"7","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"arithmetic-slip"}]$q$::jsonb, $q$7$q$, $q$√9 = 3 and √16 = 4, so 3 + 4 = 7.$q$, 'published')
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
  ('993da206-1d32-5919-95a6-4ef997c6fbef',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'easy',
   $q$Simplify (for $x \neq 0$): $\dfrac{6x^2}{2x}$.$q$, $q$[{"text":"$4x$","is_correct":false,"misconception_token":"subtracted-coefficients"},{"text":"$3x^2$","is_correct":false,"misconception_token":"did-not-reduce-exponent"},{"text":"$3x$","is_correct":true},{"text":"$3$","is_correct":false,"misconception_token":"cancelled-all-x"}]$q$::jsonb, $q$$3x$$q$, $q$6/2 = 3 and x²/x = x, so 3x.$q$, 'published')
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
  ('0722da24-2953-5e4e-9cc7-32bb9b34f577',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'medium',
   $q$Simplify (for $x \neq 3$): $\dfrac{x^2 - 9}{x - 3}$.$q$, $q$[{"text":"$x + 3$","is_correct":true},{"text":"$x - 3$","is_correct":false,"misconception_token":"sign-error"},{"text":"$3$","is_correct":false,"misconception_token":"cancelled-terms-not-factors"},{"text":"$x + 9$","is_correct":false,"misconception_token":"kept-constant"}]$q$::jsonb, $q$$x + 3$$q$, $q$x² - 9 = (x - 3)(x + 3); cancel (x - 3) to get x + 3.$q$, 'published')
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
  ('e5bec39f-643a-5f37-9376-2223fa0260b8',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'medium',
   $q$Simplify (for $x \neq -2$): $\dfrac{x^2 + 5x + 6}{x + 2}$.$q$, $q$[{"text":"$x + 2$","is_correct":false,"misconception_token":"cancelled-wrong-factor"},{"text":"$x + 6$","is_correct":false,"misconception_token":"kept-constant"},{"text":"$x + 3$","is_correct":true},{"text":"$x - 3$","is_correct":false,"misconception_token":"sign-error"}]$q$::jsonb, $q$$x + 3$$q$, $q$Factor: (x + 2)(x + 3)/(x + 2) = x + 3.$q$, 'published')
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
  ('cfb494da-e5ad-50ed-85d6-e723287a2574',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'medium',
   $q$Multiply: $\dfrac{2}{x} \cdot \dfrac{3}{x^2}$.$q$, $q$[{"text":"$\\dfrac{5}{x^3}$","is_correct":false,"misconception_token":"added-numerators"},{"text":"$\\dfrac{6}{x^2}$","is_correct":false,"misconception_token":"did-not-add-exponents"},{"text":"$\\dfrac{6}{x^3}$","is_correct":true},{"text":"$\\dfrac{6}{x}$","is_correct":false,"misconception_token":"subtracted-exponents"}]$q$::jsonb, $q$$\dfrac{6}{x^3}$$q$, $q$Multiply across: (2·3)/(x·x²) = 6/x³.$q$, 'published')
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
  ('54986753-6ad4-53f5-bf3b-17514e293f3a',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'medium',
   $q$Add (for $x \neq 0$): $\dfrac{1}{x} + \dfrac{2}{x}$.$q$, $q$[{"text":"$\\dfrac{3}{x^2}$","is_correct":false,"misconception_token":"multiplied-denominators"},{"text":"$\\dfrac{3}{2x}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$\\dfrac{2}{x^2}$","is_correct":false,"misconception_token":"multiplied-instead-of-adding"},{"text":"$\\dfrac{3}{x}$","is_correct":true}]$q$::jsonb, $q$$\dfrac{3}{x}$$q$, $q$Same denominator: (1 + 2)/x = 3/x.$q$, 'published')
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
  ('afb576b9-ced4-50f2-9b82-e36596bc091f',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'medium',
   $q$Simplify (for $x \geq 0$): $\sqrt{x^2}$.$q$, $q$[{"text":"$x^2$","is_correct":false,"misconception_token":"did-not-root"},{"text":"$x$","is_correct":true},{"text":"$\\sqrt{x}$","is_correct":false,"misconception_token":"half-rooted"},{"text":"$2x$","is_correct":false,"misconception_token":"multiplied-by-index"}]$q$::jsonb, $q$$x$$q$, $q$For x ≥ 0, √(x²) = x.$q$, 'published')
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
  ('f0dc2b69-1f3a-54e6-b59b-fc3ad926d29d',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'medium',
   $q$Simplify: $\sqrt{8} \cdot \sqrt{2}$.$q$, $q$[{"text":"$2\\sqrt{2}$","is_correct":false,"misconception_token":"stopped-early"},{"text":"$\\sqrt{10}$","is_correct":false,"misconception_token":"added-under-root"},{"text":"4","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"did-not-take-root"}]$q$::jsonb, $q$4$q$, $q$√8·√2 = √16 = 4.$q$, 'published')
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
  ('61252fd7-5802-58fd-a225-8aa4ac282611',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'medium',
   $q$Simplify (for $x, y \neq 0$): $\dfrac{x^3 y^2}{xy}$.$q$, $q$[{"text":"$x^3 y$","is_correct":false,"misconception_token":"did-not-reduce-x"},{"text":"$x^2 y^2$","is_correct":false,"misconception_token":"did-not-reduce-y"},{"text":"$x^4 y^3$","is_correct":false,"misconception_token":"added-exponents"},{"text":"$x^2 y$","is_correct":true}]$q$::jsonb, $q$$x^2 y$$q$, $q$x³/x = x²; y²/y = y, so x²y.$q$, 'published')
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
  ('ead00e6c-7c6d-532c-98c4-84cfe008b096',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'medium',
   $q$Evaluate: $27^{2/3}$.$q$, $q$[{"text":"9","is_correct":true},{"text":"3","is_correct":false,"misconception_token":"ignored-the-power-2"},{"text":"729","is_correct":false,"misconception_token":"used-exponent-2-3"},{"text":"18","is_correct":false,"misconception_token":"multiplied-by-fraction"}]$q$::jsonb, $q$9$q$, $q$27^(2/3) = (27^(1/3))² = 3² = 9.$q$, 'published')
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
  ('bf0e574f-074e-598f-8a76-a6e4378f2b89',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'medium',
   $q$Divide: $\dfrac{x/3}{2/x}$ (for $x \neq 0$).$q$, $q$[{"text":"$\\dfrac{6}{x^2}$","is_correct":false,"misconception_token":"did-not-flip"},{"text":"$\\dfrac{x}{6}$","is_correct":false,"misconception_token":"dropped-a-variable"},{"text":"$\\dfrac{2}{3}$","is_correct":false,"misconception_token":"cancelled-x-wrong"},{"text":"$\\dfrac{x^2}{6}$","is_correct":true}]$q$::jsonb, $q$$\dfrac{x^2}{6}$$q$, $q$Multiply by the reciprocal: (x/3)·(x/2) = x²/6.$q$, 'published')
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
  ('c6cfe185-e89d-53a6-896e-933056e4b42d',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'medium',
   $q$Simplify (for $x \geq 0$): $\sqrt{4x^2}$.$q$, $q$[{"text":"$2x$","is_correct":true},{"text":"$4x$","is_correct":false,"misconception_token":"did-not-root-the-4"},{"text":"$\\sqrt{2}x$","is_correct":false,"misconception_token":"wrong-root-of-4"},{"text":"$2x^2$","is_correct":false,"misconception_token":"did-not-root-the-x"}]$q$::jsonb, $q$$2x$$q$, $q$√4 = 2 and √(x²) = x, so 2x.$q$, 'published')
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
  ('692ef035-0a57-5bf9-bb2c-da295d3345c2',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'hard',
   $q$Simplify (for $x \neq -2$): $\dfrac{x^2 - 4}{x^2 + 4x + 4}$.$q$, $q$[{"text":"$\\dfrac{x + 2}{x - 2}$","is_correct":false,"misconception_token":"inverted-result"},{"text":"$1$","is_correct":false,"misconception_token":"cancelled-everything"},{"text":"$\\dfrac{x - 2}{x + 2}$","is_correct":true},{"text":"$\\dfrac{1}{x + 2}$","is_correct":false,"misconception_token":"dropped-a-factor"}]$q$::jsonb, $q$$\dfrac{x - 2}{x + 2}$$q$, $q$(x-2)(x+2) / (x+2)² = (x - 2)/(x + 2).$q$, 'published')
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
  ('a06d40aa-63e4-55ef-b318-6d89bfee89b9',
   null,
   (select id from public.skills where slug = 'rational-radical-expressions'),
   'advanced-math', 'hard',
   $q$Simplify: $\sqrt{18} + \sqrt{8}$.$q$, $q$[{"text":"$5\\sqrt{2}$","is_correct":true},{"text":"$6\\sqrt{2}$","is_correct":false,"misconception_token":"arithmetic-slip"},{"text":"$5\\sqrt{10}$","is_correct":false,"misconception_token":"wrong-radicand"},{"text":"$\\sqrt{26}$","is_correct":false,"misconception_token":"added-under-root"}]$q$::jsonb, $q$$5\sqrt{2}$$q$, $q$√18 = 3√2, √8 = 2√2; 3√2 + 2√2 = 5√2.$q$, 'published')
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

-- quadratic-functions (Quadratic Functions, grade 11, CCSS.MATH.CONTENT.HSF.IF.C.7) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c5986ec4-7d39-5875-a90b-ee66231d7757',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'easy',
   $q$What is the vertex of $y = x^2 + 3$?$q$, $q$[{"text":"$(-3, 0)$","is_correct":false,"misconception_token":"swapped-and-sign"},{"text":"$(0, 3)$","is_correct":true},{"text":"$(3, 0)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(0, -3)$","is_correct":false,"misconception_token":"sign-error"}]$q$::jsonb, $q$$(0, 3)$$q$, $q$y = x² + 3 has vertex at (0, 3) — shifted up 3.$q$, 'published')
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
  ('02fae45f-b731-543a-b889-2ce5313ce47e',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'easy',
   $q$The parabola $y = -2x^2$ opens:$q$, $q$[{"text":"downward","is_correct":true},{"text":"sideways","is_correct":false,"misconception_token":"confused-with-x-equals"},{"text":"upward","is_correct":false,"misconception_token":"ignored-negative-leading"},{"text":"it is a straight line","is_correct":false,"misconception_token":"not-recognized-as-quadratic"}]$q$::jsonb, $q$downward$q$, $q$A negative leading coefficient opens the parabola downward.$q$, 'published')
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
  ('2aa39117-2fb0-553d-96b5-062330b16dcf',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'easy',
   $q$What is the axis of symmetry of $y = x^2$?$q$, $q$[{"text":"$x = 1$","is_correct":false,"misconception_token":"guessed-nonzero"},{"text":"$x = 0$","is_correct":true},{"text":"$x = 2$","is_correct":false,"misconception_token":"guessed-value"},{"text":"$y = 0$","is_correct":false,"misconception_token":"used-wrong-variable"}]$q$::jsonb, $q$$x = 0$$q$, $q$The axis of symmetry passes through the vertex (0,0): x = 0.$q$, 'published')
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
  ('edd98cc3-2e47-5dc0-8f33-f4a8438a6ad2',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'easy',
   $q$What are the x-intercepts of $y = (x - 4)(x + 2)$?$q$, $q$[{"text":"$x = 4,\\ x = -2$","is_correct":true},{"text":"$x = -4,\\ x = 2$","is_correct":false,"misconception_token":"sign-flip"},{"text":"$x = 4,\\ x = 2$","is_correct":false,"misconception_token":"ignored-negative"},{"text":"$x = -4,\\ x = -2$","is_correct":false,"misconception_token":"both-signs-wrong"}]$q$::jsonb, $q$$x = 4,\ x = -2$$q$, $q$Set each factor to 0: x = 4 and x = -2.$q$, 'published')
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
  ('3a6fc85a-6b2d-5c7f-836b-e84d12e11563',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'easy',
   $q$What are the x-intercepts of $y = x^2 - 9$?$q$, $q$[{"text":"$x = 9,\\ x = -9$","is_correct":false,"misconception_token":"did-not-take-root"},{"text":"$x = 81$","is_correct":false,"misconception_token":"squared-instead"},{"text":"$x = 3$ only","is_correct":false,"misconception_token":"missed-negative-root"},{"text":"$x = 3,\\ x = -3$","is_correct":true}]$q$::jsonb, $q$$x = 3,\ x = -3$$q$, $q$x² = 9, so x = ±3.$q$, 'published')
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
  ('e0e2280f-ecfc-5be3-b4b1-be0584e6991a',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'easy',
   $q$What is the vertex of $y = (x - 2)^2 + 5$?$q$, $q$[{"text":"$(5, 2)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(2, -5)$","is_correct":false,"misconception_token":"sign-of-k-error"},{"text":"$(-2, 5)$","is_correct":false,"misconception_token":"sign-of-h-error"},{"text":"$(2, 5)$","is_correct":true}]$q$::jsonb, $q$$(2, 5)$$q$, $q$Vertex form y = (x - h)² + k gives vertex (2, 5).$q$, 'published')
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
  ('c11c2dd3-aa57-5303-9bdd-cfbc3bd06916',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'easy',
   $q$What is the vertex of $y = (x + 3)^2 - 1$?$q$, $q$[{"text":"$(-3, 1)$","is_correct":false,"misconception_token":"sign-of-k-error"},{"text":"$(3, -1)$","is_correct":false,"misconception_token":"sign-of-h-error"},{"text":"$(-3, -1)$","is_correct":true},{"text":"$(3, 1)$","is_correct":false,"misconception_token":"both-signs-wrong"}]$q$::jsonb, $q$$(-3, -1)$$q$, $q$(x + 3)² = (x - (-3))², so h = -3, k = -1: vertex (-3, -1).$q$, 'published')
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
  ('5f192ed8-ef09-58ba-b479-a05c7fe8d1aa',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'easy',
   $q$The graph of $y = x^2$ is called a:$q$, $q$[{"text":"V-shape","is_correct":false,"misconception_token":"confused-with-absolute-value"},{"text":"line","is_correct":false,"misconception_token":"confused-with-linear"},{"text":"parabola","is_correct":true},{"text":"circle","is_correct":false,"misconception_token":"confused-with-conic"}]$q$::jsonb, $q$parabola$q$, $q$A quadratic graphs as a parabola.$q$, 'published')
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
  ('768d7f7d-a708-5c7f-b04c-a47e14911bc1',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'medium',
   $q$What is the axis of symmetry of $y = x^2 - 6x + 5$?$q$, $q$[{"text":"$x = 3$","is_correct":true},{"text":"$x = -3$","is_correct":false,"misconception_token":"forgot-negative-in-formula"},{"text":"$x = 5$","is_correct":false,"misconception_token":"used-constant"},{"text":"$x = 6$","is_correct":false,"misconception_token":"used-b-not-b-over-2a"}]$q$::jsonb, $q$$x = 3$$q$, $q$x = -b/(2a) = -(-6)/2 = 3.$q$, 'published')
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
  ('4be45d38-1d60-5319-9155-0db68ef15008',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'medium',
   $q$What is the vertex of $y = x^2 - 6x + 5$?$q$, $q$[{"text":"$(3, 4)$","is_correct":false,"misconception_token":"y-sign-error"},{"text":"$(-3, -4)$","is_correct":false,"misconception_token":"x-sign-error"},{"text":"$(3, -4)$","is_correct":true},{"text":"$(3, 5)$","is_correct":false,"misconception_token":"used-constant-as-y"}]$q$::jsonb, $q$$(3, -4)$$q$, $q$x = 3; y = 3² - 6·3 + 5 = 9 - 18 + 5 = -4.$q$, 'published')
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
  ('54865efb-9e3d-58eb-8c51-b41b939d7e3d',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'medium',
   $q$What are the x-intercepts of $y = x^2 - 4x + 3$?$q$, $q$[{"text":"$x = 1,\\ x = -3$","is_correct":false,"misconception_token":"mixed-signs"},{"text":"$x = -1,\\ x = -3$","is_correct":false,"misconception_token":"sign-error"},{"text":"$x = 1,\\ x = 3$","is_correct":true},{"text":"$x = 4,\\ x = 3$","is_correct":false,"misconception_token":"used-coefficients"}]$q$::jsonb, $q$$x = 1,\ x = 3$$q$, $q$Factor: (x - 1)(x - 3) = 0, so x = 1 and x = 3.$q$, 'published')
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
  ('ce4ee580-0909-5112-94d3-89013b468455',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'medium',
   $q$How many real x-intercepts does $y = x^2 + 1$ have?$q$, $q$[{"text":"2","is_correct":false,"misconception_token":"assumed-two-roots"},{"text":"1","is_correct":false,"misconception_token":"assumed-vertex-touches"},{"text":"infinitely many","is_correct":false,"misconception_token":"misunderstood-graph"},{"text":"0","is_correct":true}]$q$::jsonb, $q$0$q$, $q$x² + 1 = 0 has no real solution (x² = -1), so 0 x-intercepts.$q$, 'published')
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
  ('ce0fae8c-6ae6-549c-8fe6-5c5635a52e7c',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'medium',
   $q$Compared with $y = x^2$, the graph of $y = 2x^2$ is:$q$, $q$[{"text":"wider","is_correct":false,"misconception_token":"reversed-effect"},{"text":"narrower","is_correct":true},{"text":"opens downward","is_correct":false,"misconception_token":"confused-sign-with-size"},{"text":"the same width","is_correct":false,"misconception_token":"ignored-coefficient"}]$q$::jsonb, $q$narrower$q$, $q$A larger leading coefficient makes the parabola narrower (steeper).$q$, 'published')
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
  ('779bbfb9-04d4-5bb2-b66e-f86ebbc08d36',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'medium',
   $q$What is the minimum value of $y = x^2 - 4$?$q$, $q$[{"text":"-2","is_correct":false,"misconception_token":"guessed"},{"text":"0","is_correct":false,"misconception_token":"used-vertex-x"},{"text":"-4","is_correct":true},{"text":"4","is_correct":false,"misconception_token":"sign-error"}]$q$::jsonb, $q$-4$q$, $q$The vertex is (0, -4), so the minimum y-value is -4.$q$, 'published')
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
  ('a4caf11f-0299-54a8-95dd-b12ab5301546',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'medium',
   $q$The function $y = -(x - 1)^2 + 4$ has a:$q$, $q$[{"text":"minimum of -4","is_correct":false,"misconception_token":"sign-and-type-error"},{"text":"minimum of 4","is_correct":false,"misconception_token":"ignored-negative-leading"},{"text":"maximum of 1","is_correct":false,"misconception_token":"used-h-not-k"},{"text":"maximum of 4","is_correct":true}]$q$::jsonb, $q$maximum of 4$q$, $q$Negative leading coefficient opens down, so vertex k = 4 is a maximum.$q$, 'published')
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
  ('b68ab298-ded7-5163-9c2f-1db6337cddf3',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'medium',
   $q$Write $y = (x - 3)^2$ in standard form.$q$, $q$[{"text":"$y = x^2 - 6x + 9$","is_correct":true},{"text":"$y = x^2 - 9$","is_correct":false,"misconception_token":"sign-and-middle-error"},{"text":"$y = x^2 - 6x - 9$","is_correct":false,"misconception_token":"constant-sign-error"},{"text":"$y = x^2 + 9$","is_correct":false,"misconception_token":"forgot-middle-term"}]$q$::jsonb, $q$$y = x^2 - 6x + 9$$q$, $q$(x - 3)² = x² - 6x + 9.$q$, 'published')
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
  ('aad9ddd4-cd10-552d-a5e0-e62d11217b90',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'medium',
   $q$Factor $y = x^2 + 2x + 1$ into a perfect square.$q$, $q$[{"text":"$y = (x + 1)(x - 1)$","is_correct":false,"misconception_token":"difference-of-squares-confusion"},{"text":"$y = (x + 2)(x + 1)$","is_correct":false,"misconception_token":"wrong-factor-pair"},{"text":"$y = (x - 1)^2$","is_correct":false,"misconception_token":"sign-error"},{"text":"$y = (x + 1)^2$","is_correct":true}]$q$::jsonb, $q$$y = (x + 1)^2$$q$, $q$x² + 2x + 1 = (x + 1)².$q$, 'published')
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
  ('d847a2bc-2479-5863-a203-88bc9a52e3d3',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'medium',
   $q$What is the y-intercept of $y = x^2 - 5x + 6$?$q$, $q$[{"text":"$(0, 6)$","is_correct":true},{"text":"$(6, 0)$","is_correct":false,"misconception_token":"swapped-with-x-intercept"},{"text":"$(0, 5)$","is_correct":false,"misconception_token":"used-b-not-c"},{"text":"$(0, -6)$","is_correct":false,"misconception_token":"sign-error"}]$q$::jsonb, $q$$(0, 6)$$q$, $q$Set x = 0: y = 6, so the y-intercept is (0, 6).$q$, 'published')
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
  ('21e9739d-7879-5fb3-85bc-2e359199c660',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'hard',
   $q$Find the vertex of $y = x^2 + 4x + 1$ by completing the square.$q$, $q$[{"text":"$(2, -3)$","is_correct":false,"misconception_token":"x-sign-error"},{"text":"$(-2, 3)$","is_correct":false,"misconception_token":"y-sign-error"},{"text":"$(-2, -3)$","is_correct":true},{"text":"$(-4, 1)$","is_correct":false,"misconception_token":"used-b-and-c"}]$q$::jsonb, $q$$(-2, -3)$$q$, $q$x² + 4x + 1 = (x + 2)² - 3, so the vertex is (-2, -3).$q$, 'published')
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
  ('d3686ac9-6316-5747-b437-0838e874240d',
   null,
   (select id from public.skills where slug = 'quadratic-functions'),
   'advanced-math', 'hard',
   $q$Write $y = x^2 - 2x - 8$ in factored form.$q$, $q$[{"text":"$y = (x - 4)(x + 2)$","is_correct":true},{"text":"$y = (x - 4)(x - 2)$","is_correct":false,"misconception_token":"both-negative"},{"text":"$y = (x - 8)(x + 1)$","is_correct":false,"misconception_token":"used-product-not-sum"},{"text":"$y = (x + 4)(x - 2)$","is_correct":false,"misconception_token":"sign-flip"}]$q$::jsonb, $q$$y = (x - 4)(x + 2)$$q$, $q$Two numbers multiply to -8 and add to -2: -4 and 2.$q$, 'published')
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

-- exponential-logarithmic (Exponential & Logarithmic, grade 11, CCSS.MATH.CONTENT.HSF.LE.A.4) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3fe0923f-790e-5de1-9a12-db2b6d4e58e6',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'easy',
   $q$Evaluate: $2^3$.$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"added-base-and-exponent"},{"text":"8","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"multiplied-base-times-exponent"},{"text":"9","is_correct":false,"misconception_token":"wrong-power"}]$q$::jsonb, $q$8$q$, $q$2³ = 2·2·2 = 8.$q$, 'published')
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
  ('6871bdcd-4ebc-5ac4-84a7-c2288fdbc69d',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'easy',
   $q$Evaluate: $5^0$.$q$, $q$[{"text":"1","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"ignored-exponent"},{"text":"0","is_correct":false,"misconception_token":"zero-exponent-equals-zero"},{"text":"undefined","is_correct":false,"misconception_token":"confused-with-zero-base"}]$q$::jsonb, $q$1$q$, $q$Any nonzero number to the 0 power is 1.$q$, 'published')
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
  ('c36e5c37-eba3-54a4-88cd-5be14d89a06b',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'easy',
   $q$Evaluate: $\log_2(8)$.$q$, $q$[{"text":"16","is_correct":false,"misconception_token":"multiplied-base-and-argument"},{"text":"3","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"used-base-as-answer"},{"text":"4","is_correct":false,"misconception_token":"off-by-one"}]$q$::jsonb, $q$3$q$, $q$log₂(8) asks 2 to what power is 8? 2³ = 8, so 3.$q$, 'published')
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
  ('4d22438e-84c5-55c4-99a0-a166a2f47516',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'easy',
   $q$Evaluate: $10^2$.$q$, $q$[{"text":"100","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"multiplied-base-times-exponent"},{"text":"1000","is_correct":false,"misconception_token":"wrong-power"},{"text":"12","is_correct":false,"misconception_token":"added"}]$q$::jsonb, $q$100$q$, $q$10² = 100.$q$, 'published')
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
  ('91affa36-9a89-5347-9607-7c065f7a4172',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'easy',
   $q$Evaluate: $\log_{10}(100)$.$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"used-base"},{"text":"1","is_correct":false,"misconception_token":"off-by-one"},{"text":"100","is_correct":false,"misconception_token":"used-argument"},{"text":"2","is_correct":true}]$q$::jsonb, $q$2$q$, $q$10² = 100, so log₁₀(100) = 2.$q$, 'published')
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
  ('4044c2f3-ae0f-5dd3-a5ac-804d6cd26b4a',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'easy',
   $q$Evaluate: $3^{-1}$.$q$, $q$[{"text":"$-\\dfrac{1}{3}$","is_correct":false,"misconception_token":"kept-negative-sign"},{"text":"$3$","is_correct":false,"misconception_token":"ignored-negative-exponent"},{"text":"$-3$","is_correct":false,"misconception_token":"made-base-negative"},{"text":"$\\dfrac{1}{3}$","is_correct":true}]$q$::jsonb, $q$$\dfrac{1}{3}$$q$, $q$A negative exponent takes the reciprocal: 3⁻¹ = 1/3.$q$, 'published')
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
  ('a902216d-1148-5a3e-b7d0-0e1d035640fe',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'easy',
   $q$If $y = 2^x$, what is $y$ when $x = 4$?$q$, $q$[{"text":"6","is_correct":false,"misconception_token":"multiplied-base-times-exponent"},{"text":"8","is_correct":false,"misconception_token":"off-by-one-power"},{"text":"16","is_correct":true},{"text":"32","is_correct":false,"misconception_token":"used-wrong-power"}]$q$::jsonb, $q$16$q$, $q$2⁴ = 16.$q$, 'published')
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
  ('38f2f446-7d69-5ead-a362-7bb1c2e916cd',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'easy',
   $q$Evaluate: $\log_3(1)$.$q$, $q$[{"text":"undefined","is_correct":false,"misconception_token":"thought-undefined"},{"text":"1","is_correct":false,"misconception_token":"confused-log-of-one"},{"text":"0","is_correct":true},{"text":"3","is_correct":false,"misconception_token":"used-base"}]$q$::jsonb, $q$0$q$, $q$3⁰ = 1, so log₃(1) = 0.$q$, 'published')
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
  ('d275b158-57c9-53bc-b77b-49c42d50baf7',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'medium',
   $q$Solve for $x$: $2^x = 16$.$q$, $q$[{"text":"$x = 4$","is_correct":true},{"text":"$x = 8$","is_correct":false,"misconception_token":"divided-by-base"},{"text":"$x = 32$","is_correct":false,"misconception_token":"multiplied"},{"text":"$x = 2$","is_correct":false,"misconception_token":"off-by-power"}]$q$::jsonb, $q$$x = 4$$q$, $q$2⁴ = 16, so x = 4.$q$, 'published')
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
  ('3595b615-ae9c-548e-87db-baa50cdcb5c1',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'medium',
   $q$Solve for $x$: $3^x = 27$.$q$, $q$[{"text":"$x = 9$","is_correct":false,"misconception_token":"divided-by-base"},{"text":"$x = 24$","is_correct":false,"misconception_token":"subtracted"},{"text":"$x = 3$","is_correct":true},{"text":"$x = 2$","is_correct":false,"misconception_token":"off-by-power"}]$q$::jsonb, $q$$x = 3$$q$, $q$3³ = 27, so x = 3.$q$, 'published')
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
  ('5beb0276-e505-538d-9aa0-1b0f3eb3525a',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'medium',
   $q$Evaluate: $\log_5(25)$.$q$, $q$[{"text":"20","is_correct":false,"misconception_token":"subtracted"},{"text":"5","is_correct":false,"misconception_token":"used-base"},{"text":"2","is_correct":true},{"text":"3","is_correct":false,"misconception_token":"off-by-one"}]$q$::jsonb, $q$2$q$, $q$5² = 25, so log₅(25) = 2.$q$, 'published')
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
  ('a08d1f2e-514f-50dd-9d74-f33a466fca86',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'medium',
   $q$Evaluate: $4^{3/2}$.$q$, $q$[{"text":"64","is_correct":false,"misconception_token":"used-exponent-3"},{"text":"6","is_correct":false,"misconception_token":"multiplied-base-by-fraction"},{"text":"16","is_correct":false,"misconception_token":"squared-only"},{"text":"8","is_correct":true}]$q$::jsonb, $q$8$q$, $q$4^(3/2) = (√4)³ = 2³ = 8.$q$, 'published')
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
  ('b74f2662-08b7-51da-b8c1-f6d7494e077e',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'medium',
   $q$A colony of 100 bacteria doubles every hour. How many are there after 3 hours?$q$, $q$[{"text":"600","is_correct":false,"misconception_token":"multiplied-by-6"},{"text":"800","is_correct":true},{"text":"1600","is_correct":false,"misconception_token":"doubled-too-many-times"},{"text":"300","is_correct":false,"misconception_token":"multiplied-by-3"}]$q$::jsonb, $q$800$q$, $q$100 × 2³ = 100 × 8 = 800.$q$, 'published')
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
  ('0c228211-65c4-599e-88a7-d32b4bd475fc',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'medium',
   $q$Rewrite $\log_2(8) = 3$ in exponential form.$q$, $q$[{"text":"$2^8 = 256$","is_correct":false,"misconception_token":"swapped-exponent-and-argument"},{"text":"$3^2 = 9$","is_correct":false,"misconception_token":"swapped-base-and-exponent"},{"text":"$2^3 = 8$","is_correct":true},{"text":"$8^3 = 512$","is_correct":false,"misconception_token":"used-argument-as-base"}]$q$::jsonb, $q$$2^3 = 8$$q$, $q$log_b(y) = x means bˣ = y, so 2³ = 8.$q$, 'published')
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
  ('0e3efd05-6b32-50a1-ae60-2452ac804ee8',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'medium',
   $q$Solve for $x$: $10^x = 1000$.$q$, $q$[{"text":"$x = 30$","is_correct":false,"misconception_token":"multiplied"},{"text":"$x = 100$","is_correct":false,"misconception_token":"divided-by-ten"},{"text":"$x = 2$","is_correct":false,"misconception_token":"off-by-power"},{"text":"$x = 3$","is_correct":true}]$q$::jsonb, $q$$x = 3$$q$, $q$10³ = 1000, so x = 3.$q$, 'published')
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
  ('fcc21cf2-dc9c-5530-95ad-4fa5c0fb61ab',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'medium',
   $q$$500 is invested and doubles each year. What is its value after 2 years?$q$, $q$[{"text":"$2000","is_correct":true},{"text":"$1500","is_correct":false,"misconception_token":"added-linearly"},{"text":"$4000","is_correct":false,"misconception_token":"doubled-too-many-times"},{"text":"$1000","is_correct":false,"misconception_token":"doubled-once"}]$q$::jsonb, $q$$2000$q$, $q$500 × 2² = 500 × 4 = $2000.$q$, 'published')
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
  ('48ef5579-c23c-59ef-8967-737162a27aab',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'medium',
   $q$Simplify: $2^x \cdot 2^3$.$q$, $q$[{"text":"$4^{x+3}$","is_correct":false,"misconception_token":"added-bases"},{"text":"$2^{x \\cdot 3}$","is_correct":false,"misconception_token":"multiplied-exponents-form"},{"text":"$2^{3x}$","is_correct":false,"misconception_token":"multiplied-exponents"},{"text":"$2^{x+3}$","is_correct":true}]$q$::jsonb, $q$$2^{x+3}$$q$, $q$Same base multiplies by adding exponents: 2^(x+3).$q$, 'published')
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
  ('938c1a5d-0b51-5741-ae6a-78e7adfb7bcc',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'medium',
   $q$Evaluate $\log(1000)$ (base 10).$q$, $q$[{"text":"3","is_correct":true},{"text":"100","is_correct":false,"misconception_token":"used-argument"},{"text":"30","is_correct":false,"misconception_token":"multiplied"},{"text":"10","is_correct":false,"misconception_token":"used-base"}]$q$::jsonb, $q$3$q$, $q$10³ = 1000, so log(1000) = 3.$q$, 'published')
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
  ('bc7cd7ec-1ca8-5a2d-b0b8-58bd81c89489',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'hard',
   $q$Solve for $x$: $2^{x+1} = 32$.$q$, $q$[{"text":"$x = 5$","is_correct":false,"misconception_token":"forgot-to-subtract-one"},{"text":"$x = 15$","is_correct":false,"misconception_token":"divided-by-base"},{"text":"$x = 4$","is_correct":true},{"text":"$x = 3$","is_correct":false,"misconception_token":"off-by-one"}]$q$::jsonb, $q$$x = 4$$q$, $q$32 = 2⁵, so x + 1 = 5, giving x = 4.$q$, 'published')
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
  ('30a85412-c0a5-5f90-a98b-d0f0d5b53781',
   null,
   (select id from public.skills where slug = 'exponential-logarithmic'),
   'advanced-math', 'hard',
   $q$A $20,000 car loses 10% of its value each year. What is it worth after 2 years?$q$, $q$[{"text":"$16,200","is_correct":true},{"text":"$18,000","is_correct":false,"misconception_token":"depreciated-once"},{"text":"$12,000","is_correct":false,"misconception_token":"subtracted-40-percent"},{"text":"$16,000","is_correct":false,"misconception_token":"subtracted-linearly"}]$q$::jsonb, $q$$16,200$q$, $q$20000 × 0.9² = 20000 × 0.81 = $16,200.$q$, 'published')
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

-- systems-of-equations (Systems of Equations, grade 11, CCSS.MATH.CONTENT.HSA.REI.C.7) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5ed2dbd7-570a-5529-8ef0-5b799a852fd6',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'easy',
   $q$Solve the system: $y = x$ and $y = 4$.$q$, $q$[{"text":"$(2, 2)$","is_correct":false,"misconception_token":"guessed"},{"text":"$(4, 4)$","is_correct":true},{"text":"$(0, 4)$","is_correct":false,"misconception_token":"used-wrong-x"},{"text":"$(4, 0)$","is_correct":false,"misconception_token":"swapped-coordinates"}]$q$::jsonb, $q$$(4, 4)$$q$, $q$Since y = 4 and y = x, x = 4: (4, 4).$q$, 'published')
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
  ('8326840a-be6b-5306-a487-cd9eca63e693',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'easy',
   $q$Solve: $x + y = 10$ and $x - y = 2$.$q$, $q$[{"text":"$(6, 4)$","is_correct":true},{"text":"$(8, 2)$","is_correct":false,"misconception_token":"used-difference-as-y"},{"text":"$(4, 6)$","is_correct":false,"misconception_token":"swapped-values"},{"text":"$(5, 5)$","is_correct":false,"misconception_token":"split-evenly"}]$q$::jsonb, $q$$(6, 4)$$q$, $q$Add the equations: 2x = 12 → x = 6; then y = 4.$q$, 'published')
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
  ('85b5a6e6-5676-577c-863a-c88f7e74ff74',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'easy',
   $q$Solve: $y = 2x$ and $y = x + 3$.$q$, $q$[{"text":"$(1, 2)$","is_correct":false,"misconception_token":"guessed"},{"text":"$(3, 6)$","is_correct":true},{"text":"$(3, 3)$","is_correct":false,"misconception_token":"used-wrong-y"},{"text":"$(6, 3)$","is_correct":false,"misconception_token":"swapped-coordinates"}]$q$::jsonb, $q$$(3, 6)$$q$, $q$2x = x + 3 → x = 3; y = 2·3 = 6.$q$, 'published')
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
  ('1015d3ed-55bf-5694-923a-3ed59193e1d2',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'easy',
   $q$Solve: $x = 5$ and $x + y = 8$.$q$, $q$[{"text":"$(5, 3)$","is_correct":true},{"text":"$(5, 8)$","is_correct":false,"misconception_token":"forgot-to-subtract"},{"text":"$(3, 5)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(5, 13)$","is_correct":false,"misconception_token":"added-instead"}]$q$::jsonb, $q$$(5, 3)$$q$, $q$Substitute x = 5: 5 + y = 8 → y = 3.$q$, 'published')
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
  ('dd6ced55-65ee-5351-9ade-e1062a7ea97f',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'easy',
   $q$Solve: $y = 3x$ and $y = 12$.$q$, $q$[{"text":"$(12, 4)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(36, 12)$","is_correct":false,"misconception_token":"multiplied-instead-of-dividing"},{"text":"$(4, 4)$","is_correct":false,"misconception_token":"used-wrong-y"},{"text":"$(4, 12)$","is_correct":true}]$q$::jsonb, $q$$(4, 12)$$q$, $q$12 = 3x → x = 4: (4, 12).$q$, 'published')
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
  ('8b66d3de-7bca-5b19-bd06-b843cf5b7d8d',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'easy',
   $q$On a graph, the solution to a system of two equations is where the graphs:$q$, $q$[{"text":"have the same slope","is_correct":false,"misconception_token":"confused-slope-with-solution"},{"text":"cross the y-axis","is_correct":false,"misconception_token":"confused-with-intercept"},{"text":"are parallel","is_correct":false,"misconception_token":"parallel-means-solution"},{"text":"intersect","is_correct":true}]$q$::jsonb, $q$intersect$q$, $q$The solution is the point(s) where the graphs intersect.$q$, 'published')
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
  ('2d829734-9ec1-52b5-9757-94e32fdd3bfa',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'easy',
   $q$Solve: $y = x + 1$ and $y = -x + 5$.$q$, $q$[{"text":"$(2, 5)$","is_correct":false,"misconception_token":"used-wrong-equation-for-y"},{"text":"$(3, 2)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(2, 3)$","is_correct":true},{"text":"$(4, 3)$","is_correct":false,"misconception_token":"arithmetic-slip"}]$q$::jsonb, $q$$(2, 3)$$q$, $q$x + 1 = -x + 5 → 2x = 4 → x = 2; y = 3.$q$, 'published')
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
  ('690a5314-4600-543d-8b32-6949d106b646',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'easy',
   $q$How many solutions do two parallel lines have?$q$, $q$[{"text":"infinitely many","is_correct":false,"misconception_token":"confused-with-same-line"},{"text":"1","is_correct":false,"misconception_token":"assumed-they-cross"},{"text":"0","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"guessed"}]$q$::jsonb, $q$0$q$, $q$Parallel lines never intersect, so there is no solution.$q$, 'published')
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
  ('41ee9b44-3695-5fc3-9bfd-30c7d0a6b690',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'medium',
   $q$Solve by substitution: $y = 2x + 1$ and $3x + y = 11$.$q$, $q$[{"text":"$(2, 5)$","is_correct":true},{"text":"$(5, 2)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(1, 3)$","is_correct":false,"misconception_token":"arithmetic-slip"},{"text":"$(2, 11)$","is_correct":false,"misconception_token":"used-wrong-y"}]$q$::jsonb, $q$$(2, 5)$$q$, $q$3x + (2x + 1) = 11 → 5x = 10 → x = 2; y = 5.$q$, 'published')
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
  ('be410980-6721-57b6-ba50-00a4193ad02d',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'medium',
   $q$Solve by elimination: $2x + y = 7$ and $x - y = 2$.$q$, $q$[{"text":"$(1, 3)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(3, 7)$","is_correct":false,"misconception_token":"used-wrong-y"},{"text":"$(3, 1)$","is_correct":true},{"text":"$(5, 2)$","is_correct":false,"misconception_token":"arithmetic-slip"}]$q$::jsonb, $q$$(3, 1)$$q$, $q$Add: 3x = 9 → x = 3; then 3 - y = 2 → y = 1.$q$, 'published')
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
  ('28de89e3-0de4-5e5d-aa7f-506ee1b3ea3a',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'medium',
   $q$Solve: $3x + 2y = 12$ and $x = 2$.$q$, $q$[{"text":"$(3, 2)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(2, 6)$","is_correct":false,"misconception_token":"forgot-coefficient"},{"text":"$(2, 3)$","is_correct":true},{"text":"$(2, 0)$","is_correct":false,"misconception_token":"arithmetic-slip"}]$q$::jsonb, $q$$(2, 3)$$q$, $q$3·2 + 2y = 12 → 2y = 6 → y = 3.$q$, 'published')
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
  ('6cb9d9ea-c8c1-5911-b2d5-b7392e20d6e1',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'medium',
   $q$Solve: $y = x^2$ and $y = 9$.$q$, $q$[{"text":"$x = 81$","is_correct":false,"misconception_token":"squared-instead"},{"text":"$x = 3$ only","is_correct":false,"misconception_token":"missed-negative-root"},{"text":"$x = \\pm 9$","is_correct":false,"misconception_token":"did-not-take-root"},{"text":"$x = 3$ and $x = -3$","is_correct":true}]$q$::jsonb, $q$$x = 3$ and $x = -3$$q$, $q$x² = 9 → x = ±3.$q$, 'published')
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
  ('fcd95ee3-9b9a-53ea-bbc8-157fdea88e52',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'medium',
   $q$Solve: $y = x^2$ and $y = x$.$q$, $q$[{"text":"$x = 1$ only","is_correct":false,"misconception_token":"divided-out-x"},{"text":"$x = 0$ and $x = 1$","is_correct":true},{"text":"$x = -1$ and $x = 1$","is_correct":false,"misconception_token":"sign-error"},{"text":"$x = 0$ only","is_correct":false,"misconception_token":"missed-second-root"}]$q$::jsonb, $q$$x = 0$ and $x = 1$$q$, $q$x² = x → x² - x = 0 → x(x - 1) = 0 → x = 0 or x = 1.$q$, 'published')
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
  ('10916b89-69e5-55cd-9465-0a96b1467dbe',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'medium',
   $q$Two lines have the same slope but different y-intercepts. How many solutions?$q$, $q$[{"text":"exactly two","is_correct":false,"misconception_token":"guessed"},{"text":"one solution","is_correct":false,"misconception_token":"assumed-they-cross"},{"text":"no solution","is_correct":true},{"text":"infinitely many","is_correct":false,"misconception_token":"confused-with-same-line"}]$q$::jsonb, $q$no solution$q$, $q$Same slope, different intercepts → parallel → no solution.$q$, 'published')
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
  ('cac0f9ce-c54e-5ebf-bb7e-b93c22f13aa5',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'medium',
   $q$Solve: $x + y = 5$ and $2x + 2y = 10$.$q$, $q$[{"text":"$(5, 0)$","is_correct":false,"misconception_token":"picked-one-point"},{"text":"no solution","is_correct":false,"misconception_token":"assumed-parallel"},{"text":"one solution","is_correct":false,"misconception_token":"assumed-single-point"},{"text":"infinitely many solutions","is_correct":true}]$q$::jsonb, $q$infinitely many solutions$q$, $q$The second equation is twice the first — the same line — so infinitely many solutions.$q$, 'published')
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
  ('3f8cdabe-00a4-5b87-8b1c-2ec650f0d88c',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'medium',
   $q$Solve: $y = -x + 4$ and $y = x - 2$.$q$, $q$[{"text":"$(3, 1)$","is_correct":true},{"text":"$(3, 4)$","is_correct":false,"misconception_token":"used-wrong-equation-for-y"},{"text":"$(0, 4)$","is_correct":false,"misconception_token":"used-intercept"},{"text":"$(1, 3)$","is_correct":false,"misconception_token":"swapped-coordinates"}]$q$::jsonb, $q$$(3, 1)$$q$, $q$-x + 4 = x - 2 → 6 = 2x → x = 3; y = 1.$q$, 'published')
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
  ('117c6fb7-f4b8-57d1-af8d-92b3a0f46b9e',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'medium',
   $q$Solve: $y = x^2 - 1$ and $y = 3$.$q$, $q$[{"text":"$x = \\pm 4$","is_correct":false,"misconception_token":"did-not-take-root"},{"text":"$x = \\pm \\sqrt{3}$","is_correct":false,"misconception_token":"forgot-the-minus-one"},{"text":"$x = 2$ only","is_correct":false,"misconception_token":"missed-negative-root"},{"text":"$x = 2$ and $x = -2$","is_correct":true}]$q$::jsonb, $q$$x = 2$ and $x = -2$$q$, $q$x² - 1 = 3 → x² = 4 → x = ±2.$q$, 'published')
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
  ('e073da0f-76ef-538d-8da6-d396197036ba',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'medium',
   $q$Solve: $4x - y = 5$ and $y = 3$.$q$, $q$[{"text":"$(2, 3)$","is_correct":true},{"text":"$(3, 2)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(2, 0)$","is_correct":false,"misconception_token":"arithmetic-slip"},{"text":"$(2, 5)$","is_correct":false,"misconception_token":"used-wrong-y"}]$q$::jsonb, $q$$(2, 3)$$q$, $q$4x - 3 = 5 → 4x = 8 → x = 2: (2, 3).$q$, 'published')
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
  ('da9576bf-e050-52c4-aadb-82a3849c1dc9',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'hard',
   $q$Solve the linear-quadratic system: $y = x^2$ and $y = 2x + 3$.$q$, $q$[{"text":"$x = 3$ only","is_correct":false,"misconception_token":"missed-a-root"},{"text":"$x = 1$ and $x = -3$","is_correct":false,"misconception_token":"sign-error-in-factoring"},{"text":"$x = 3$ and $x = -1$","is_correct":true},{"text":"$x = \\pm 3$","is_correct":false,"misconception_token":"ignored-linear-term"}]$q$::jsonb, $q$$x = 3$ and $x = -1$$q$, $q$x² = 2x + 3 → x² - 2x - 3 = 0 → (x - 3)(x + 1) = 0 → x = 3 or x = -1.$q$, 'published')
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
  ('e7d88333-e9c6-5977-9a75-d9ea54bdcea5',
   null,
   (select id from public.skills where slug = 'systems-of-equations'),
   'algebra', 'hard',
   $q$Solve the linear-quadratic system: $y = x^2 - 2x$ and $y = x$.$q$, $q$[{"text":"$x = 0$ and $x = 3$","is_correct":true},{"text":"$x = 0$ and $x = -3$","is_correct":false,"misconception_token":"sign-error"},{"text":"$x = \\pm 3$","is_correct":false,"misconception_token":"ignored-a-root"},{"text":"$x = 3$ only","is_correct":false,"misconception_token":"divided-out-x"}]$q$::jsonb, $q$$x = 0$ and $x = 3$$q$, $q$x² - 2x = x → x² - 3x = 0 → x(x - 3) = 0 → x = 0 or x = 3.$q$, 'published')
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
