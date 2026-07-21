-- PathwayEd — Question Engine: GRADE 9, 10 & 12 math skills + questions (GENERATED).
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

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-alg9')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Algebra 1', null, '9-12', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-linear-equations')::uuid, 'skill', md5('pe-aos:dom-math-alg9')::uuid, 'math', 'Linear Equations', 'linear-equations', '9-12', 'algebra', '9', 9, 'CCSS.MATH.CONTENT.HSA.REI.B.3', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-linear-inequalities')::uuid, 'skill', md5('pe-aos:dom-math-alg9')::uuid, 'math', 'Linear Inequalities', 'linear-inequalities', '9-12', 'algebra', '9', 9, 'CCSS.MATH.CONTENT.HSA.REI.B.3', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-graphing-linear-functions')::uuid, 'skill', md5('pe-aos:dom-math-alg9')::uuid, 'math', 'Graphing Linear Functions', 'graphing-linear-functions', '9-12', 'algebra', '9', 9, 'CCSS.MATH.CONTENT.HSF.IF.C.7', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-systems-linear')::uuid, 'skill', md5('pe-aos:dom-math-alg9')::uuid, 'math', 'Systems of Linear Equations', 'systems-linear', '9-12', 'algebra', '9', 9, 'CCSS.MATH.CONTENT.HSA.REI.C.6', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-exponent-rules')::uuid, 'skill', md5('pe-aos:dom-math-alg9')::uuid, 'math', 'Exponent Rules', 'exponent-rules', '9-12', 'advanced-math', '9', 9, 'CCSS.MATH.CONTENT.HSA.SSE.A.2', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-stat-hs')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Statistics & Probability', null, '9-12', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-data-statistics')::uuid, 'skill', md5('pe-aos:dom-math-stat-hs')::uuid, 'math', 'Data & Statistics', 'data-statistics', '9-12', 'problem-solving-data-analysis', '9', 9, 'CCSS.MATH.CONTENT.HSS.ID.A.2', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-geo-hs')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Geometry', null, '9-12', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-geometry-proofs')::uuid, 'skill', md5('pe-aos:dom-math-geo-hs')::uuid, 'math', 'Geometry Proofs', 'geometry-proofs', '9-12', 'geometry-trigonometry', '10', 10, 'CCSS.MATH.CONTENT.HSG.CO.C.9', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-triangle-congruence')::uuid, 'skill', md5('pe-aos:dom-math-geo-hs')::uuid, 'math', 'Triangle Congruence', 'triangle-congruence', '9-12', 'geometry-trigonometry', '10', 10, 'CCSS.MATH.CONTENT.HSG.CO.B.8', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-similarity-right-triangles')::uuid, 'skill', md5('pe-aos:dom-math-geo-hs')::uuid, 'math', 'Similarity & Right Triangles', 'similarity-right-triangles', '9-12', 'geometry-trigonometry', '10', 10, 'CCSS.MATH.CONTENT.HSG.SRT.C.8', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-circle-geometry')::uuid, 'skill', md5('pe-aos:dom-math-geo-hs')::uuid, 'math', 'Circle Geometry', 'circle-geometry', '9-12', 'geometry-trigonometry', '10', 10, 'CCSS.MATH.CONTENT.HSG.C.A.2', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-coordinate-geometry')::uuid, 'skill', md5('pe-aos:dom-math-geo-hs')::uuid, 'math', 'Coordinate Geometry', 'coordinate-geometry', '9-12', 'geometry-trigonometry', '10', 10, 'CCSS.MATH.CONTENT.HSG.GPE.B.7', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-precalc')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Precalculus', null, '9-12', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-trigonometric-functions')::uuid, 'skill', md5('pe-aos:dom-math-precalc')::uuid, 'math', 'Trigonometric Functions', 'trigonometric-functions', '9-12', 'advanced-math', '12', 12, 'CCSS.MATH.CONTENT.HSF.TF.A.2', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-sequences-series')::uuid, 'skill', md5('pe-aos:dom-math-precalc')::uuid, 'math', 'Sequences & Series', 'sequences-series', '9-12', 'advanced-math', '12', 12, 'CCSS.MATH.CONTENT.HSF.BF.A.2', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-rational-functions')::uuid, 'skill', md5('pe-aos:dom-math-precalc')::uuid, 'math', 'Rational Functions', 'rational-functions', '9-12', 'advanced-math', '12', 12, 'CCSS.MATH.CONTENT.HSF.IF.C.7', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-conic-sections')::uuid, 'skill', md5('pe-aos:dom-math-precalc')::uuid, 'math', 'Conic Sections', 'conic-sections', '9-12', 'advanced-math', '12', 12, 'CCSS.MATH.CONTENT.HSG.GPE.A.1', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-combinatorics-probability')::uuid, 'skill', md5('pe-aos:dom-math-stat-hs')::uuid, 'math', 'Combinatorics & Probability', 'combinatorics-probability', '9-12', 'problem-solving-data-analysis', '12', 12, 'CCSS.MATH.CONTENT.HSS.CP.B.9', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- linear-equations (Linear Equations, grade 9, CCSS.MATH.CONTENT.HSA.REI.B.3) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f52beda0-3f4b-549a-949f-976adf06906e',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $2x + 5 = 13$.$q$, $q$[{"text":"1.5","is_correct":false,"misconception_token":"divided-before-subtracting"},{"text":"4","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"8","is_correct":false,"misconception_token":"skipped-division"}]$q$::jsonb, $q$4$q$, $q$Subtract 5 from both sides: $2x = 8$. Divide by 2: $x = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c05213d7-61dc-57ec-b78a-79e71cded31d',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $5x - 3 = 22$.$q$, $q$[{"text":"5","is_correct":true},{"text":"19","is_correct":false,"misconception_token":"skipped-division"},{"text":"3.8","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"4.4","is_correct":false,"misconception_token":"divided-before-adding"}]$q$::jsonb, $q$5$q$, $q$Add 3 to both sides: $5x = 25$. Divide by 5: $x = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bd5a1c12-5672-5a14-86a1-4c84949ed29c',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $3x + 7 = x + 15$.$q$, $q$[{"text":"11","is_correct":false,"misconception_token":"added-constants-instead-of-subtracting"},{"text":"4","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"skipped-division"},{"text":"2","is_correct":false,"misconception_token":"added-variables-instead-of-subtracting"}]$q$::jsonb, $q$4$q$, $q$Subtract $x$ from both sides and subtract 7: $2x = 8$. Divide by 2: $x = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('19624eb5-e4e2-5968-b8b3-8bc8b128f7b0',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $\frac{x}{4} = 6$.$q$, $q$[{"text":"24","is_correct":true},{"text":"1.5","is_correct":false,"misconception_token":"divided-instead-of-multiplied"},{"text":"2","is_correct":false,"misconception_token":"subtracted-instead-of-multiplied"},{"text":"10","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, $q$24$q$, $q$Multiply both sides by 4: $x = 6 \times 4 = 24$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('403b8830-ea05-5f82-83b0-3c0952fbaac7',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $2(x + 3) = 14$.$q$, $q$[{"text":"5.5","is_correct":false,"misconception_token":"distributed-to-first-term-only"},{"text":"7","is_correct":false,"misconception_token":"forgot-constant-term"},{"text":"10","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"4","is_correct":true}]$q$::jsonb, $q$4$q$, $q$Distribute: $2x + 6 = 14$. Subtract 6: $2x = 8$. Divide by 2: $x = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('22b4b719-6868-5f81-9a42-8de069f632fd',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $-4x = 20$.$q$, $q$[{"text":"-16","is_correct":false,"misconception_token":"subtracted-instead-of-dividing"},{"text":"-80","is_correct":false,"misconception_token":"multiplied-instead-of-divided"},{"text":"5","is_correct":false,"misconception_token":"ignored-negative-sign"},{"text":"-5","is_correct":true}]$q$::jsonb, $q$-5$q$, $q$Divide both sides by $-4$: $x = 20 \div (-4) = -5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f3b22e0a-c67f-5e8c-af2a-d364a834e818',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $\frac{2}{3}x = 8$.$q$, $q$[{"text":"4","is_correct":false,"misconception_token":"divided-by-numerator-only"},{"text":"$\\frac{16}{3}$","is_correct":false,"misconception_token":"multiplied-by-fraction-not-reciprocal"},{"text":"12","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"multiplied-by-denominator-only"}]$q$::jsonb, $q$12$q$, $q$Multiply both sides by the reciprocal $\frac{3}{2}$: $x = 8 \times \frac{3}{2} = 12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('194fc8cf-341d-5bb4-9cd3-a6da1d8799d2',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $6x - 4 = 2x + 8$.$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"skipped-division"},{"text":"1","is_correct":false,"misconception_token":"subtracted-constants-instead-of-adding"},{"text":"3","is_correct":true},{"text":"1.5","is_correct":false,"misconception_token":"added-variables-instead-of-subtracting"}]$q$::jsonb, $q$3$q$, $q$Subtract $2x$ and add 4: $4x = 12$. Divide by 4: $x = 3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e1a63a8e-854a-545e-a35f-997d966710ed',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'medium',
   $q$Solve for $x$: $3(2x - 1) + 4 = 2(x + 5) + 3x$.$q$, $q$[{"text":"9","is_correct":true},{"text":"3","is_correct":false,"misconception_token":"sign-error-in-distribution"},{"text":"11","is_correct":false,"misconception_token":"added-constants-instead-of-subtracting"},{"text":"4","is_correct":false,"misconception_token":"distributed-to-first-term-only"}]$q$::jsonb, $q$9$q$, $q$Left side: $6x - 3 + 4 = 6x + 1$. Right side: $2x + 10 + 3x = 5x + 10$. So $6x + 1 = 5x + 10$, giving $x = 9$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fbc680c8-e671-5549-8c88-379176bad5c5',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'medium',
   $q$The perimeter of a rectangle is 54 cm. Its length is 3 cm more than twice its width. What is the width, in cm?$q$, $q$[{"text":"19","is_correct":false,"misconception_token":"found-length-not-width"},{"text":"17","is_correct":false,"misconception_token":"forgot-to-double-perimeter"},{"text":"8","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"ignored-constant-term"}]$q$::jsonb, $q$8$q$, $q$Let width be $w$; length is $2w + 3$. Perimeter: $2(2w + 3 + w) = 54$, so $6w + 6 = 54$, $6w = 48$, $w = 8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('655ebf3b-2dab-59d9-aa15-199a6f396947',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'medium',
   $q$Solve for $x$: $\frac{x}{2} + \frac{x}{3} = 10$.$q$, $q$[{"text":"2","is_correct":false,"misconception_token":"forgot-to-multiply-constant-by-lcd"},{"text":"50","is_correct":false,"misconception_token":"added-denominators"},{"text":"12","is_correct":true},{"text":"60","is_correct":false,"misconception_token":"skipped-division"}]$q$::jsonb, $q$12$q$, $q$Multiply through by 6: $3x + 2x = 60$, so $5x = 60$ and $x = 12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('32f62925-8030-5bf9-8042-d594e70ec58b',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'medium',
   $q$A taxi charges a 4 dollar base fare plus 2 dollars per mile. A ride cost 30 dollars. How many miles was the ride?$q$, $q$[{"text":"26","is_correct":false,"misconception_token":"skipped-division"},{"text":"15","is_correct":false,"misconception_token":"ignored-base-fare"},{"text":"17","is_correct":false,"misconception_token":"added-base-instead-of-subtracting"},{"text":"13","is_correct":true}]$q$::jsonb, $q$13$q$, $q$Let $m$ be miles: $4 + 2m = 30$. Subtract 4: $2m = 26$. Divide by 2: $m = 13$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7a306cb6-5199-5ef7-a368-2ff0d7aac3ba',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'medium',
   $q$Solve for $x$: $0.4x + 1.2 = 0.1x + 3$.$q$, $q$[{"text":"14","is_correct":false,"misconception_token":"added-constants-instead-of-subtracting"},{"text":"6","is_correct":true},{"text":"1.8","is_correct":false,"misconception_token":"skipped-division"},{"text":"3.6","is_correct":false,"misconception_token":"added-variables-instead-of-subtracting"}]$q$::jsonb, $q$6$q$, $q$Subtract $0.1x$ and $1.2$: $0.3x = 1.8$. Divide by $0.3$: $x = 6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3267b88e-0ad1-5a31-aad8-fb9e4ef3c0f6',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'medium',
   $q$Maria is 3 times as old as her brother. In 6 years, the sum of their ages will be 44. How old is her brother now?$q$, $q$[{"text":"11","is_correct":false,"misconception_token":"ignored-future-years"},{"text":"24","is_correct":false,"misconception_token":"found-maria-not-brother"},{"text":"8","is_correct":true},{"text":"9.5","is_correct":false,"misconception_token":"added-years-to-one-person-only"}]$q$::jsonb, $q$8$q$, $q$Let brother be $b$, Maria $3b$. In 6 years: $(b + 6) + (3b + 6) = 44$, so $4b + 12 = 44$, $4b = 32$, $b = 8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('25f0fb5f-3cb9-5b65-bb2c-1fa61afb8dcb',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'medium',
   $q$Solve for $x$: $\frac{2x - 1}{3} = 5$.$q$, $q$[{"text":"16","is_correct":false,"misconception_token":"skipped-division"},{"text":"3","is_correct":false,"misconception_token":"forgot-to-multiply-both-sides"},{"text":"7","is_correct":false,"misconception_token":"subtracted-instead-of-adding"},{"text":"8","is_correct":true}]$q$::jsonb, $q$8$q$, $q$Multiply both sides by 3: $2x - 1 = 15$. Add 1: $2x = 16$. Divide by 2: $x = 8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('badf3244-69ef-592d-8bb4-6a872d3b38c4',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'medium',
   $q$A phone plan costs 20 dollars per month plus 10 dollars for each gigabyte over the limit. Sam's bill was 70 dollars. How many gigabytes over the limit was he?$q$, $q$[{"text":"5","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"added-base-instead-of-subtracting"},{"text":"50","is_correct":false,"misconception_token":"skipped-division"},{"text":"7","is_correct":false,"misconception_token":"ignored-monthly-base"}]$q$::jsonb, $q$5$q$, $q$Let $g$ be gigabytes over: $20 + 10g = 70$. Subtract 20: $10g = 50$. Divide by 10: $g = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9723a4fa-0642-598d-8f13-f50bafb4b680',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'hard',
   $q$Solve for $x$: $\frac{x + 2}{3} - \frac{x - 1}{4} = 2$.$q$, $q$[{"text":"-9","is_correct":false,"misconception_token":"forgot-to-multiply-constant-by-lcd"},{"text":"23","is_correct":false,"misconception_token":"forgot-to-distribute"},{"text":"19","is_correct":false,"misconception_token":"sign-error-in-distribution"},{"text":"13","is_correct":true}]$q$::jsonb, $q$13$q$, $q$Multiply through by 12: $4(x + 2) - 3(x - 1) = 24$, so $4x + 8 - 3x + 3 = 24$, giving $x + 11 = 24$ and $x = 13$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5d634e0f-8b11-5ba1-99c8-44c610d7cd2b',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'hard',
   $q$Two trains leave the same station traveling in opposite directions, one at 60 mph and the other at 45 mph. After how many hours are they 420 miles apart?$q$, $q$[{"text":"4","is_correct":true},{"text":"28","is_correct":false,"misconception_token":"used-speed-difference"},{"text":"8","is_correct":false,"misconception_token":"used-average-speed"},{"text":"7","is_correct":false,"misconception_token":"used-one-speed-only"}]$q$::jsonb, $q$4$q$, $q$Moving apart, the gap grows at $60 + 45 = 105$ mph. Solve $105t = 420$: $t = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e9550902-5782-51b5-8ed6-8541c1ea0c92',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'hard',
   $q$Solve for $x$: $4(x - 3) - 2(x + 1) = 3(x - 5) - 4$.$q$, $q$[{"text":"9","is_correct":false,"misconception_token":"sign-error-in-distribution"},{"text":"-1","is_correct":false,"misconception_token":"added-variables-instead-of-subtracting"},{"text":"5","is_correct":true},{"text":"14","is_correct":false,"misconception_token":"distributed-to-first-term-only"}]$q$::jsonb, $q$5$q$, $q$Left: $4x - 12 - 2x - 2 = 2x - 14$. Right: $3x - 15 - 4 = 3x - 19$. So $2x - 14 = 3x - 19$, giving $x = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bb4752a5-5461-536a-8278-db1512892da5',
   null,
   (select id from public.skills where slug = 'linear-equations'),
   'algebra', 'hard',
   $q$The length of a garden is 48 feet, which is one-third longer than its width. Find the width, in feet.$q$, $q$[{"text":"36","is_correct":true},{"text":"32","is_correct":false,"misconception_token":"subtracted-fraction-of-total"},{"text":"64","is_correct":false,"misconception_token":"multiplied-instead-of-divided"},{"text":"16","is_correct":false,"misconception_token":"took-fraction-of-total"}]$q$::jsonb, $q$36$q$, $q$Let width be $w$. One-third longer means $w + \frac{1}{3}w = 48$, so $\frac{4}{3}w = 48$ and $w = 48 \times \frac{3}{4} = 36$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- linear-inequalities (Linear Inequalities, grade 9, CCSS.MATH.CONTENT.HSA.REI.B.3) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a1c74ff4-3d16-5a02-93a2-e66cc4a023c6',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'easy',
   $q$Solve for $x$: $x + 5 < 12$.$q$, $q$[{"text":"$x \\leq 7$","is_correct":false,"misconception_token":"changed-strictness"},{"text":"$x < 7$","is_correct":true},{"text":"$x < 17$","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"$x > 7$","is_correct":false,"misconception_token":"flipped-sign-unnecessarily"}]$q$::jsonb, $q$$x < 7$$q$, $q$Subtract 5 from both sides: $x < 12 - 5$, so $x < 7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('df310fa0-0f7a-5251-9a54-288577ed195d',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'easy',
   $q$Solve for $x$: $x - 3 \geq 4$.$q$, $q$[{"text":"$x \\geq 7$","is_correct":true},{"text":"$x \\leq 7$","is_correct":false,"misconception_token":"flipped-sign-unnecessarily"},{"text":"$x \\geq 1$","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"$x > 7$","is_correct":false,"misconception_token":"changed-strictness"}]$q$::jsonb, $q$$x \geq 7$$q$, $q$Add 3 to both sides: $x \geq 4 + 3$, so $x \geq 7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bc0f800d-37e7-5cf1-b98a-1ef027b03e52',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'easy',
   $q$Solve for $x$: $3x < 15$.$q$, $q$[{"text":"$x < 12$","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"$x < 5$","is_correct":true},{"text":"$x > 5$","is_correct":false,"misconception_token":"flipped-sign-unnecessarily"},{"text":"$x < 45$","is_correct":false,"misconception_token":"multiplied-instead-of-divided"}]$q$::jsonb, $q$$x < 5$$q$, $q$Divide both sides by 3: $x < \frac{15}{3}$, so $x < 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9ecb8476-5f7b-5722-a972-11f6f078987d',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'easy',
   $q$Solve for $x$: $\frac{x}{2} \geq 6$.$q$, $q$[{"text":"$x \\geq 12$","is_correct":true},{"text":"$x \\geq 3$","is_correct":false,"misconception_token":"divided-instead-of-multiplied"},{"text":"$x \\geq 8$","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"$x \\leq 12$","is_correct":false,"misconception_token":"flipped-sign-unnecessarily"}]$q$::jsonb, $q$$x \geq 12$$q$, $q$Multiply both sides by 2: $x \geq 6 \times 2$, so $x \geq 12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('17ef3b76-231a-5f3a-b39f-48e11f9be512',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'easy',
   $q$Solve for $x$: $-x > 4$.$q$, $q$[{"text":"$x > -4$","is_correct":false,"misconception_token":"forgot-to-flip-sign"},{"text":"$x > 4$","is_correct":false,"misconception_token":"ignored-negative-and-flip"},{"text":"$x < 4$","is_correct":false,"misconception_token":"dropped-negative-sign"},{"text":"$x < -4$","is_correct":true}]$q$::jsonb, $q$$x < -4$$q$, $q$Divide (or multiply) both sides by $-1$, which flips the inequality: $x < -4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f5663bae-16d7-5be1-bf1e-6571cc67e3f6',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'easy',
   $q$Solve for $x$: $-2x \leq 10$.$q$, $q$[{"text":"$x \\leq 5$","is_correct":false,"misconception_token":"ignored-negative-and-flip"},{"text":"$x \\geq 5$","is_correct":false,"misconception_token":"dropped-negative-sign"},{"text":"$x \\leq -5$","is_correct":false,"misconception_token":"forgot-to-flip-sign"},{"text":"$x \\geq -5$","is_correct":true}]$q$::jsonb, $q$$x \geq -5$$q$, $q$Divide both sides by $-2$ and flip the inequality: $x \geq \frac{10}{-2}$, so $x \geq -5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4d6430de-6b88-5535-829b-fb8e1d817ab9',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'easy',
   $q$Solve for $x$: $x + 8 \leq 3$.$q$, $q$[{"text":"$x \\leq 5$","is_correct":false,"misconception_token":"dropped-negative-sign"},{"text":"$x \\leq 11$","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"$x \\leq -5$","is_correct":true},{"text":"$x \\geq -5$","is_correct":false,"misconception_token":"flipped-sign-unnecessarily"}]$q$::jsonb, $q$$x \leq -5$$q$, $q$Subtract 8 from both sides: $x \leq 3 - 8$, so $x \leq -5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fe9dcbf3-f338-549d-87c1-cad0cb7fcae1',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'easy',
   $q$Solve for $x$: $5x > 20$.$q$, $q$[{"text":"$x < 4$","is_correct":false,"misconception_token":"flipped-sign-unnecessarily"},{"text":"$x > 100$","is_correct":false,"misconception_token":"multiplied-instead-of-divided"},{"text":"$x > 4$","is_correct":true},{"text":"$x > 15$","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, $q$$x > 4$$q$, $q$Divide both sides by 5: $x > \frac{20}{5}$, so $x > 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9c9d068d-d02f-56a7-963a-958695a6dbf3',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'medium',
   $q$Solve for $x$: $2x + 3 < 11$.$q$, $q$[{"text":"$x < 4$","is_correct":true},{"text":"$x < 8$","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"$x > 4$","is_correct":false,"misconception_token":"flipped-sign-unnecessarily"},{"text":"$x < 7$","is_correct":false,"misconception_token":"added-instead-of-subtracted"}]$q$::jsonb, $q$$x < 4$$q$, $q$Subtract 3: $2x < 8$. Divide by 2: $x < 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d8a228da-0ca7-5be2-8cd5-da018e7551ed',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'medium',
   $q$Solve for $x$: $4x - 5 \geq 7$.$q$, $q$[{"text":"$x \\geq 12$","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"$x \\geq 0.5$","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"$x \\geq 3$","is_correct":true},{"text":"$x \\leq 3$","is_correct":false,"misconception_token":"flipped-sign-unnecessarily"}]$q$::jsonb, $q$$x \geq 3$$q$, $q$Add 5: $4x \geq 12$. Divide by 4: $x \geq 3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('38718ade-f34d-5cde-9dba-995b8b03afda',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'medium',
   $q$Solve for $x$: $-3x + 2 > 11$.$q$, $q$[{"text":"$x < 3$","is_correct":false,"misconception_token":"dropped-negative-sign"},{"text":"$x > -3$","is_correct":false,"misconception_token":"forgot-to-flip-sign"},{"text":"$x < -3$","is_correct":true},{"text":"$x > 3$","is_correct":false,"misconception_token":"ignored-negative-and-flip"}]$q$::jsonb, $q$$x < -3$$q$, $q$Subtract 2: $-3x > 9$. Divide by $-3$ and flip the sign: $x < -3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2c88819a-81c2-5cda-a424-6dcb98ef9620',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'medium',
   $q$Solve for $x$: $\frac{x}{3} - 4 \leq 2$.$q$, $q$[{"text":"$x \\leq -6$","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"$x \\leq 6$","is_correct":false,"misconception_token":"forgot-to-multiply"},{"text":"$x \\geq 18$","is_correct":false,"misconception_token":"flipped-sign-unnecessarily"},{"text":"$x \\leq 18$","is_correct":true}]$q$::jsonb, $q$$x \leq 18$$q$, $q$Add 4: $\frac{x}{3} \leq 6$. Multiply by 3: $x \leq 18$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('aafa9331-3074-558b-9bdb-9814ac2ee182',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'medium',
   $q$Solve for $x$: $5x - 3 > 2x + 9$.$q$, $q$[{"text":"$x > 12$","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"$x > 4$","is_correct":true},{"text":"$x < 4$","is_correct":false,"misconception_token":"flipped-sign-unnecessarily"},{"text":"$x > 2$","is_correct":false,"misconception_token":"combined-constants-wrong"}]$q$::jsonb, $q$$x > 4$$q$, $q$Subtract $2x$: $3x - 3 > 9$. Add 3: $3x > 12$. Divide by 3: $x > 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('20f2af13-e8c4-5238-b981-ffba5ed3960e',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'medium',
   $q$A taxi ride costs 3 dollars plus 2 dollars for each mile. If Sam can spend at most 15 dollars, which inequality shows the possible number of miles $m$ he can ride?$q$, $q$[{"text":"$m \\geq 6$","is_correct":false,"misconception_token":"flipped-sign-unnecessarily"},{"text":"$m \\leq 12$","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"$m \\leq 6$","is_correct":true},{"text":"$m \\leq 7.5$","is_correct":false,"misconception_token":"forgot-to-subtract-fee"}]$q$::jsonb, $q$$m \leq 6$$q$, $q$Set up $3 + 2m \leq 15$. Subtract 3: $2m \leq 12$. Divide by 2: $m \leq 6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e06a7563-bc2a-5381-9a11-5c7e80b681e8',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'medium',
   $q$Five more than twice a number $n$ is at least 17. Which inequality shows all possible values of $n$?$q$, $q$[{"text":"$n \\leq 6$","is_correct":false,"misconception_token":"flipped-sign-unnecessarily"},{"text":"$n \\geq 11$","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"$n \\geq 12$","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"$n \\geq 6$","is_correct":true}]$q$::jsonb, $q$$n \geq 6$$q$, $q$Set up $2n + 5 \geq 17$. Subtract 5: $2n \geq 12$. Divide by 2: $n \geq 6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f1311edf-d03c-534f-8290-bb4f6594f32f',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'medium',
   $q$On his first test a student scored 78. He wants his average over two tests to be at least 85. Which inequality shows the scores $x$ he can earn on the second test to reach his goal?$q$, $q$[{"text":"$x \\geq 92$","is_correct":true},{"text":"$x \\geq 7$","is_correct":false,"misconception_token":"forgot-to-double"},{"text":"$x \\leq 92$","is_correct":false,"misconception_token":"flipped-sign-unnecessarily"},{"text":"$x \\geq 85$","is_correct":false,"misconception_token":"used-target-as-answer"}]$q$::jsonb, $q$$x \geq 92$$q$, $q$Set up $\frac{78 + x}{2} \geq 85$. Multiply by 2: $78 + x \geq 170$. Subtract 78: $x \geq 92$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c26c9814-fbea-541f-867e-59897794956c',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'hard',
   $q$Solve for $x$: $\frac{2x - 1}{3} \geq 5$.$q$, $q$[{"text":"$x \\geq 7$","is_correct":false,"misconception_token":"wrong-sign-on-constant"},{"text":"$x \\leq 8$","is_correct":false,"misconception_token":"flipped-sign-unnecessarily"},{"text":"$x \\geq 3$","is_correct":false,"misconception_token":"forgot-to-multiply"},{"text":"$x \\geq 8$","is_correct":true}]$q$::jsonb, $q$$x \geq 8$$q$, $q$Multiply both sides by 3: $2x - 1 \geq 15$. Add 1: $2x \geq 16$. Divide by 2: $x \geq 8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9f83e3e4-510f-5c80-8e0f-b40d343894e7',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'hard',
   $q$Solve for $x$: $8 - 3x \geq 20$.$q$, $q$[{"text":"$x \\leq -4$","is_correct":true},{"text":"$x \\geq -4$","is_correct":false,"misconception_token":"forgot-to-flip-sign"},{"text":"$x \\geq 4$","is_correct":false,"misconception_token":"ignored-negative-and-flip"},{"text":"$x \\leq 4$","is_correct":false,"misconception_token":"dropped-negative-sign"}]$q$::jsonb, $q$$x \leq -4$$q$, $q$Subtract 8: $-3x \geq 12$. Divide by $-3$ and flip the sign: $x \leq -4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c4cfbef6-36a8-51f2-9ec4-65ef65f7db6f',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'hard',
   $q$A gym charges 25 dollars to join plus 15 dollars each month. If Maria has 130 dollars to spend, which inequality shows the number of months $m$ she can afford?$q$, $q$[{"text":"$m \\leq 105$","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"$m \\leq 8$","is_correct":false,"misconception_token":"forgot-to-subtract-fee"},{"text":"$m \\leq 7$","is_correct":true},{"text":"$m \\geq 7$","is_correct":false,"misconception_token":"flipped-sign-unnecessarily"}]$q$::jsonb, $q$$m \leq 7$$q$, $q$Set up $25 + 15m \leq 130$. Subtract 25: $15m \leq 105$. Divide by 15: $m \leq 7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('27e18ee4-04e7-53ca-8497-129ad4e2531e',
   null,
   (select id from public.skills where slug = 'linear-inequalities'),
   'algebra', 'hard',
   $q$Solve for $x$: $3(x - 2) < 5x + 4$.$q$, $q$[{"text":"$x > -5$","is_correct":true},{"text":"$x > 5$","is_correct":false,"misconception_token":"dropped-negative-sign"},{"text":"$x < 5$","is_correct":false,"misconception_token":"ignored-negative-and-flip"},{"text":"$x < -5$","is_correct":false,"misconception_token":"forgot-to-flip-sign"}]$q$::jsonb, $q$$x > -5$$q$, $q$Distribute: $3x - 6 < 5x + 4$. Subtract $5x$: $-2x - 6 < 4$. Add 6: $-2x < 10$. Divide by $-2$ and flip the sign: $x > -5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- graphing-linear-functions (Graphing Linear Functions, grade 9, CCSS.MATH.CONTENT.HSF.IF.C.7) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1354549b-b50b-5fbd-8907-05aecf986508',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'easy',
   $q$What is the slope of the line $y = 3x + 5$?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"added-m-and-b"},{"text":"3","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"used-y-intercept"},{"text":"-3","is_correct":false,"misconception_token":"negated-slope"}]$q$::jsonb, $q$3$q$, $q$In slope-intercept form $y = mx + b$, the slope is the coefficient of $x$, so the slope is 3.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('593c2886-8e68-539f-8885-875e7b0920a2',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'easy',
   $q$What is the $y$-intercept of the line $y = 2x - 7$?$q$, $q$[{"text":"-7","is_correct":true},{"text":"7","is_correct":false,"misconception_token":"dropped-negative-sign"},{"text":"2","is_correct":false,"misconception_token":"used-slope-as-intercept"},{"text":"-2","is_correct":false,"misconception_token":"negated-slope"}]$q$::jsonb, $q$-7$q$, $q$In $y = mx + b$, the $y$-intercept is $b$. Here $b = -7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('11223ef6-35ce-5a47-b8da-a4a5f5bea7f8',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'easy',
   $q$What is the slope of the line through the points $(1, 2)$ and $(3, 8)$?$q$, $q$[{"text":"-3","is_correct":false,"misconception_token":"negated-slope"},{"text":"3","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"used-numerator-only"},{"text":"\\frac{1}{3}","is_correct":false,"misconception_token":"inverted-slope-ratio"}]$q$::jsonb, $q$3$q$, $q$Slope $= \frac{8 - 2}{3 - 1} = \frac{6}{2} = 3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bb3ec9e1-2910-5a3b-9782-5eeeb88d70f8',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'easy',
   $q$What is the slope of the line $y = -4x + 9$?$q$, $q$[{"text":"-4","is_correct":true},{"text":"4","is_correct":false,"misconception_token":"dropped-negative-sign"},{"text":"9","is_correct":false,"misconception_token":"used-y-intercept"},{"text":"-9","is_correct":false,"misconception_token":"negated-y-intercept"}]$q$::jsonb, $q$-4$q$, $q$The slope is the coefficient of $x$ in $y = mx + b$, so the slope is $-4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b91267de-e3e3-5aeb-a9fb-28787c280b15',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'easy',
   $q$What is the $x$-intercept of the line $y = 2x - 6$?$q$, $q$[{"text":"-3","is_correct":false,"misconception_token":"sign-error-solving"},{"text":"-6","is_correct":false,"misconception_token":"used-constant-term"},{"text":"6","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"3","is_correct":true}]$q$::jsonb, $q$3$q$, $q$Set $y = 0$: $0 = 2x - 6$, so $2x = 6$ and $x = 3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('027c00da-ecdc-58c5-93ed-26ff61d06c32',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'easy',
   $q$What is the slope of the line $y = \frac{1}{2}x + 4$?$q$, $q$[{"text":"-\\frac{1}{2}","is_correct":false,"misconception_token":"negated-slope"},{"text":"2","is_correct":false,"misconception_token":"inverted-slope"},{"text":"4","is_correct":false,"misconception_token":"used-y-intercept"},{"text":"\\frac{1}{2}","is_correct":true}]$q$::jsonb, $q$\frac{1}{2}$q$, $q$The slope is the coefficient of $x$, which is $\frac{1}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c207bd19-930b-55cb-be24-0d4aa71046d7',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'easy',
   $q$A line passes through $(0, 1)$ and $(2, 5)$. What is its slope?$q$, $q$[{"text":"1","is_correct":false,"misconception_token":"used-y-intercept"},{"text":"\\frac{1}{2}","is_correct":false,"misconception_token":"inverted-slope-ratio"},{"text":"2","is_correct":true},{"text":"-2","is_correct":false,"misconception_token":"negated-slope"}]$q$::jsonb, $q$2$q$, $q$Slope $= \frac{5 - 1}{2 - 0} = \frac{4}{2} = 2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fc4942f8-74a5-59d1-a620-988a7d49f18e',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'easy',
   $q$Which equation has slope $3$ and $y$-intercept $-2$?$q$, $q$[{"text":"$y = -3x - 2$","is_correct":false,"misconception_token":"negated-slope"},{"text":"$y = -2x + 3$","is_correct":false,"misconception_token":"swapped-slope-and-intercept"},{"text":"$y = 3x - 2$","is_correct":true},{"text":"$y = 3x + 2$","is_correct":false,"misconception_token":"wrong-sign-on-intercept"}]$q$::jsonb, $q$$y = 3x - 2$$q$, $q$Slope-intercept form is $y = mx + b$ with $m = 3$ and $b = -2$, giving $y = 3x - 2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('63cdd66b-e4b6-5d2d-8e49-718d01b19914',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'medium',
   $q$What is the slope of the line through $(-2, 3)$ and $(4, -9)$?$q$, $q$[{"text":"-2","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"dropped-negative-sign"},{"text":"-12","is_correct":false,"misconception_token":"used-numerator-only"},{"text":"-\\frac{1}{2}","is_correct":false,"misconception_token":"inverted-slope-ratio"}]$q$::jsonb, $q$-2$q$, $q$Slope $= \frac{-9 - 3}{4 - (-2)} = \frac{-12}{6} = -2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('daaa3a4b-926b-59fb-a4fe-60caf17653bd',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'medium',
   $q$What is the equation of the line with slope $2$ that passes through $(3, 1)$?$q$, $q$[{"text":"$y = 2x + 5$","is_correct":false,"misconception_token":"wrong-sign-on-intercept"},{"text":"$y = 2x + 1$","is_correct":false,"misconception_token":"used-point-y-as-intercept"},{"text":"$y = 2x - 5$","is_correct":true},{"text":"$y = 2x + 7$","is_correct":false,"misconception_token":"added-instead-of-subtracted"}]$q$::jsonb, $q$$y = 2x - 5$$q$, $q$Using $b = y - mx = 1 - 2(3) = -5$, the equation is $y = 2x - 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c211cda5-1ac1-5383-9cfe-0935accb2172',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'medium',
   $q$A plant is 4 cm tall and grows 3 cm each week. Which equation gives the height $h$ in centimeters after $w$ weeks?$q$, $q$[{"text":"$h = 3w - 4$","is_correct":false,"misconception_token":"wrong-sign-on-start"},{"text":"$h = 4w + 3$","is_correct":false,"misconception_token":"swapped-rate-and-start"},{"text":"$h = 3w + 4$","is_correct":true},{"text":"$h = 7w$","is_correct":false,"misconception_token":"added-rate-and-start"}]$q$::jsonb, $q$$h = 3w + 4$$q$, $q$The growth rate 3 is the slope and the starting height 4 is the $y$-intercept, so $h = 3w + 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7b975b6d-ba32-5744-9fec-a65532a127f4',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'medium',
   $q$A taxi ride costs $c = 2.5m + 4$ dollars, where $m$ is the number of miles. What does the number $2.5$ represent?$q$, $q$[{"text":"The total cost of the ride","is_correct":false,"misconception_token":"confused-with-output"},{"text":"The base fee","is_correct":false,"misconception_token":"confused-with-intercept"},{"text":"The number of miles driven","is_correct":false,"misconception_token":"confused-with-input"},{"text":"The cost per mile","is_correct":true}]$q$::jsonb, $q$The cost per mile$q$, $q$As the slope (coefficient of $m$), $2.5$ is the rate of change: the cost added per mile.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5829ee4c-91f8-5e3a-bf99-c311e8802110',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'medium',
   $q$What is the $x$-intercept of the line $y = -3x + 12$?$q$, $q$[{"text":"-4","is_correct":false,"misconception_token":"sign-error-solving"},{"text":"4","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"subtracted-instead-of-dividing"},{"text":"12","is_correct":false,"misconception_token":"used-y-intercept"}]$q$::jsonb, $q$4$q$, $q$Set $y = 0$: $0 = -3x + 12$, so $3x = 12$ and $x = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('88772678-bbbd-5105-ab78-c93e3b1ecda0',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'medium',
   $q$A linear function has $y = 5$ when $x = 1$, and $y = 11$ when $x = 3$. What is its rate of change?$q$, $q$[{"text":"-3","is_correct":false,"misconception_token":"negated-rate"},{"text":"\\frac{1}{3}","is_correct":false,"misconception_token":"inverted-rate"},{"text":"3","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"used-numerator-only"}]$q$::jsonb, $q$3$q$, $q$Rate of change $= \frac{11 - 5}{3 - 1} = \frac{6}{2} = 3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c3c0959c-d891-5709-9756-cfca62060e58',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'medium',
   $q$What is the equation of the line through $(0, 2)$ and $(4, 10)$?$q$, $q$[{"text":"$y = 2x - 2$","is_correct":false,"misconception_token":"wrong-sign-on-intercept"},{"text":"$y = 2x + 10$","is_correct":false,"misconception_token":"used-second-point-y-as-intercept"},{"text":"$y = \\frac{1}{2}x + 2$","is_correct":false,"misconception_token":"inverted-slope"},{"text":"$y = 2x + 2$","is_correct":true}]$q$::jsonb, $q$$y = 2x + 2$$q$, $q$Slope $= \frac{10 - 2}{4 - 0} = 2$, and the point $(0, 2)$ gives $b = 2$, so $y = 2x + 2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2ff28a8e-97d7-58e1-a79d-52110d125716',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'medium',
   $q$A gym charges a 50 dollar signup fee plus 20 dollars per month. The total cost after $m$ months is $C = 20m + 50$. What is the total cost after 6 months?$q$, $q$[{"text":"170 dollars","is_correct":true},{"text":"70 dollars","is_correct":false,"misconception_token":"used-one-month"},{"text":"420 dollars","is_correct":false,"misconception_token":"applied-fee-monthly"},{"text":"120 dollars","is_correct":false,"misconception_token":"forgot-signup-fee"}]$q$::jsonb, $q$170 dollars$q$, $q$Substitute $m = 6$: $C = 20(6) + 50 = 120 + 50 = 170$ dollars.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6876e9ac-a90c-5dbc-9d03-552c886d5154',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'hard',
   $q$What is the slope of the line through $(2, -3)$ and $(-4, 6)$?$q$, $q$[{"text":"-\\frac{2}{3}","is_correct":false,"misconception_token":"inverted-slope-ratio"},{"text":"\\frac{2}{3}","is_correct":false,"misconception_token":"dropped-sign-and-inverted"},{"text":"\\frac{3}{2}","is_correct":false,"misconception_token":"dropped-negative-sign"},{"text":"-\\frac{3}{2}","is_correct":true}]$q$::jsonb, $q$-\frac{3}{2}$q$, $q$Slope $= \frac{6 - (-3)}{-4 - 2} = \frac{9}{-6} = -\frac{3}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7369a64f-ca4a-5a2f-a3d5-c77489cf6fe0',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'hard',
   $q$What is the equation of the line through $(-1, 5)$ and $(3, -3)$?$q$, $q$[{"text":"$y = -2x + 3$","is_correct":true},{"text":"$y = -2x + 5$","is_correct":false,"misconception_token":"used-point-y-as-intercept"},{"text":"$y = -2x - 3$","is_correct":false,"misconception_token":"wrong-sign-on-intercept"},{"text":"$y = 2x + 3$","is_correct":false,"misconception_token":"dropped-slope-sign"}]$q$::jsonb, $q$$y = -2x + 3$$q$, $q$Slope $= \frac{-3 - 5}{3 - (-1)} = \frac{-8}{4} = -2$; then $b = 5 - (-2)(-1) = 3$, so $y = -2x + 3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('baaace7b-7a9b-5a09-8dc8-c4aabaff7dec',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'hard',
   $q$A candle burns at a constant rate. After 2 hours it is 18 cm tall, and after 5 hours it is 9 cm tall. What is the rate of change of its height in centimeters per hour?$q$, $q$[{"text":"3","is_correct":false,"misconception_token":"dropped-negative-sign"},{"text":"-9","is_correct":false,"misconception_token":"used-numerator-only"},{"text":"-3","is_correct":true},{"text":"-\\frac{1}{3}","is_correct":false,"misconception_token":"inverted-rate"}]$q$::jsonb, $q$-3$q$, $q$Rate of change $= \frac{9 - 18}{5 - 2} = \frac{-9}{3} = -3$ cm per hour.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1e6dca88-23d1-54f2-92b9-33662b84de51',
   null,
   (select id from public.skills where slug = 'graphing-linear-functions'),
   'algebra', 'hard',
   $q$A tank of water is modeled by $g = 240 - 15t$, where $g$ is the gallons remaining and $t$ is the time in minutes. After how many minutes is the tank empty?$q$, $q$[{"text":"16","is_correct":true},{"text":"240","is_correct":false,"misconception_token":"used-start-amount"},{"text":"3600","is_correct":false,"misconception_token":"multiplied-values"},{"text":"15","is_correct":false,"misconception_token":"used-drain-rate"}]$q$::jsonb, $q$16$q$, $q$Set $g = 0$: $0 = 240 - 15t$, so $15t = 240$ and $t = 16$ minutes.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- systems-linear (Systems of Linear Equations, grade 9, CCSS.MATH.CONTENT.HSA.REI.C.6) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f353a94d-c16b-5ff0-affa-d0ee128161be',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'easy',
   $q$Solve the system $y = 2x$ and $x + y = 9$.$q$, $q$[{"text":"$(3, 3)$","is_correct":false,"misconception_token":"substituted-x-for-y"},{"text":"$(3, 6)$","is_correct":true},{"text":"$(6, 3)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(9, 18)$","is_correct":false,"misconception_token":"ignored-second-equation"}]$q$::jsonb, $q$$(3, 6)$$q$, $q$Substitute $y = 2x$ into $x + y = 9$: $x + 2x = 9$, so $3x = 9$ and $x = 3$. Then $y = 2(3) = 6$, giving $(3, 6)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7898d209-d5e8-5206-82ad-09d4bf709cd4',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'easy',
   $q$Solve the system $y = x - 1$ and $x + y = 7$.$q$, $q$[{"text":"$(4, 3)$","is_correct":true},{"text":"$(4, 5)$","is_correct":false,"misconception_token":"flipped-sign-in-substitution"},{"text":"$(3, 4)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(4, 4)$","is_correct":false,"misconception_token":"forgot-to-subtract-one"}]$q$::jsonb, $q$$(4, 3)$$q$, $q$Substitute $y = x - 1$ into $x + y = 7$: $x + (x - 1) = 7$, so $2x - 1 = 7$, $2x = 8$, $x = 4$. Then $y = 4 - 1 = 3$, giving $(4, 3)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dc5239c7-9505-5c61-9dda-eb87ffed6389',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'easy',
   $q$Solve the system $x + y = 10$ and $x - y = 4$ by elimination.$q$, $q$[{"text":"$(7, -3)$","is_correct":false,"misconception_token":"sign-error-on-y"},{"text":"$(7, 3)$","is_correct":true},{"text":"$(14, 3)$","is_correct":false,"misconception_token":"forgot-to-divide-by-2"},{"text":"$(3, 7)$","is_correct":false,"misconception_token":"swapped-coordinates"}]$q$::jsonb, $q$$(7, 3)$$q$, $q$Add the equations: $(x + y) + (x - y) = 10 + 4$, so $2x = 14$ and $x = 7$. Then $7 + y = 10$ gives $y = 3$, so $(7, 3)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9a542615-fe84-59e2-bc9f-28c843443177',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'easy',
   $q$Solve the system $2x + y = 7$ and $x - y = 2$ by elimination.$q$, $q$[{"text":"$(3, 1)$","is_correct":true},{"text":"$(1, 3)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(3, -1)$","is_correct":false,"misconception_token":"sign-error-on-y"},{"text":"$(9, 1)$","is_correct":false,"misconception_token":"forgot-to-divide-by-3"}]$q$::jsonb, $q$$(3, 1)$$q$, $q$Add the equations: $(2x + y) + (x - y) = 7 + 2$, so $3x = 9$ and $x = 3$. Then $3 - y = 2$ gives $y = 1$, so $(3, 1)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ed94008f-f943-53a4-8081-cf37ddf908ca',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'easy',
   $q$At what point do the lines $y = x + 2$ and $y = -x + 4$ intersect?$q$, $q$[{"text":"$(3, 1)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(0, 2)$","is_correct":false,"misconception_token":"used-y-intercept"},{"text":"$(2, 4)$","is_correct":false,"misconception_token":"forgot-to-divide-by-2"},{"text":"$(1, 3)$","is_correct":true}]$q$::jsonb, $q$$(1, 3)$$q$, $q$Set the expressions equal: $x + 2 = -x + 4$, so $2x = 2$ and $x = 1$. Then $y = 1 + 2 = 3$, giving $(1, 3)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b218e925-b616-5c96-8f4b-3c80dee57f45',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'easy',
   $q$How many solutions does the system $y = 3x + 1$ and $y = 3x - 4$ have?$q$, $q$[{"text":"Exactly two solutions","is_correct":false,"misconception_token":"linear-cannot-have-two"},{"text":"Infinitely many solutions","is_correct":false,"misconception_token":"assumed-same-line"},{"text":"One solution","is_correct":false,"misconception_token":"assumed-intersection"},{"text":"No solution","is_correct":true}]$q$::jsonb, $q$No solution$q$, $q$Both lines have slope $3$ but different y-intercepts ($1$ and $-4$), so they are parallel and never cross: no solution.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('756c29f5-0bd0-5ccf-9470-15e913a49f60',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'easy',
   $q$How many solutions does the system $y = 2x + 5$ and $2y = 4x + 10$ have?$q$, $q$[{"text":"No solution","is_correct":false,"misconception_token":"assumed-parallel-lines"},{"text":"One solution","is_correct":false,"misconception_token":"assumed-single-intersection"},{"text":"Infinitely many solutions","is_correct":true},{"text":"Exactly two solutions","is_correct":false,"misconception_token":"linear-cannot-have-two"}]$q$::jsonb, $q$Infinitely many solutions$q$, $q$Dividing the second equation by $2$ gives $y = 2x + 5$, which is identical to the first equation, so every point on the line works: infinitely many solutions.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e7766a5f-27ae-59ac-ba4a-f8558981d041',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'easy',
   $q$Solve the system $x = 4$ and $2x + y = 11$.$q$, $q$[{"text":"$(3, 4)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(4, 11)$","is_correct":false,"misconception_token":"forgot-to-subtract-2x"},{"text":"$(4, 3)$","is_correct":true},{"text":"$(4, 7)$","is_correct":false,"misconception_token":"forgot-to-double-x"}]$q$::jsonb, $q$$(4, 3)$$q$, $q$Substitute $x = 4$ into $2x + y = 11$: $2(4) + y = 11$, so $8 + y = 11$ and $y = 3$, giving $(4, 3)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8bc19b8a-d409-5e92-aebe-06ca91dbbbf2',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'medium',
   $q$Solve the system $2x + 3y = 12$ and $x - y = 1$.$q$, $q$[{"text":"$(3, 2)$","is_correct":true},{"text":"$(2, 3)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(3, -2)$","is_correct":false,"misconception_token":"sign-error-on-y"},{"text":"$(1, 2)$","is_correct":false,"misconception_token":"flipped-subtraction"}]$q$::jsonb, $q$$(3, 2)$$q$, $q$From $x - y = 1$, $x = y + 1$. Substitute: $2(y + 1) + 3y = 12$, so $5y + 2 = 12$, $y = 2$. Then $x = 3$, giving $(3, 2)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4b96abe0-ac63-55e2-88cb-0bc6ec6ea2ee',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'medium',
   $q$Solve the system $3x + 4y = 10$ and $2x + 3y = 7$.$q$, $q$[{"text":"$(1, 2)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(2, -1)$","is_correct":false,"misconception_token":"sign-error-on-y"},{"text":"$(2, 1)$","is_correct":true},{"text":"$(-2, 1)$","is_correct":false,"misconception_token":"sign-error-on-x"}]$q$::jsonb, $q$$(2, 1)$$q$, $q$Multiply the first by $3$ and the second by $4$: $9x + 12y = 30$ and $8x + 12y = 28$. Subtract to get $x = 2$, then $3(2) + 4y = 10$ gives $y = 1$, so $(2, 1)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e7f6c154-13d7-5875-85d9-e20484b417be',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'medium',
   $q$Two adult tickets and three child tickets cost 32 dollars. One adult ticket and one child ticket cost 13 dollars. How much does one child ticket cost?$q$, $q$[{"text":"5 dollars","is_correct":false,"misconception_token":"arithmetic-error"},{"text":"7 dollars","is_correct":false,"misconception_token":"solved-for-wrong-variable"},{"text":"6 dollars","is_correct":true},{"text":"13 dollars","is_correct":false,"misconception_token":"used-combined-total"}]$q$::jsonb, $q$6 dollars$q$, $q$Let $a$ and $c$ be the ticket prices: $2a + 3c = 32$ and $a + c = 13$. So $a = 13 - c$, and $2(13 - c) + 3c = 32$ gives $26 + c = 32$, so $c = 6$ dollars.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c4a48b5a-5b2e-5579-aae4-67d38c44ba6b',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'medium',
   $q$The sum of two numbers is 24 and their difference is 6. What is the larger number?$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"subtracted-instead-of-averaging"},{"text":"9","is_correct":false,"misconception_token":"found-smaller-number"},{"text":"12","is_correct":false,"misconception_token":"used-half-of-sum"},{"text":"15","is_correct":true}]$q$::jsonb, $q$15$q$, $q$Let the numbers be $x$ and $y$ with $x + y = 24$ and $x - y = 6$. Adding gives $2x = 30$, so $x = 15$, the larger number.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('867c44c7-07e3-5382-b435-f2c9ce0ea600',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'medium',
   $q$A jar holds 20 coins that are only nickels and dimes, worth 1.60 dollars in all. How many dimes are in the jar?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"found-nickels-instead"},{"text":"12","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"used-total-count"},{"text":"10","is_correct":false,"misconception_token":"assumed-equal-split"}]$q$::jsonb, $q$12$q$, $q$Let $n$ nickels and $d$ dimes: $n + d = 20$ and $0.05n + 0.10d = 1.60$. Multiplying the value equation by $20$ gives $n + 2d = 32$; subtracting $n + d = 20$ gives $d = 12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cdafad6d-8bb4-5b42-ad69-79f048c1d810',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'medium',
   $q$At what point do the lines $y = -2x + 7$ and $y = x - 2$ intersect?$q$, $q$[{"text":"$(9, 1)$","is_correct":false,"misconception_token":"forgot-to-divide-by-3"},{"text":"$(1, 3)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(3, 1)$","is_correct":true},{"text":"$(3, -1)$","is_correct":false,"misconception_token":"sign-error-on-y"}]$q$::jsonb, $q$$(3, 1)$$q$, $q$Set them equal: $-2x + 7 = x - 2$, so $9 = 3x$ and $x = 3$. Then $y = 3 - 2 = 1$, giving $(3, 1)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b37656fd-375b-5732-abc6-85504f3566df',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'medium',
   $q$Three times a first number plus twice a second number equals $23$, and the two numbers add to $9$. Written as (first, second), what are the numbers?$q$, $q$[{"text":"$(9, 0)$","is_correct":false,"misconception_token":"ignored-first-equation"},{"text":"$(4, 5)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(5, -4)$","is_correct":false,"misconception_token":"sign-error-on-second"},{"text":"$(5, 4)$","is_correct":true}]$q$::jsonb, $q$$(5, 4)$$q$, $q$Let the numbers be $x$ and $y$: $3x + 2y = 23$ and $x + y = 9$. So $y = 9 - x$, and $3x + 2(9 - x) = 23$ gives $x + 18 = 23$, $x = 5$, $y = 4$, so $(5, 4)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('543eb3fc-636a-53ce-ac1f-77a91935e892',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'medium',
   $q$A store sells pens for 2 dollars each and notebooks for 3 dollars each. Maria buys 10 items and spends 26 dollars. How many notebooks does she buy?$q$, $q$[{"text":"6","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"used-total-item-count"},{"text":"8","is_correct":false,"misconception_token":"arithmetic-error"},{"text":"4","is_correct":false,"misconception_token":"found-pen-count"}]$q$::jsonb, $q$6$q$, $q$Let $p$ pens and $n$ notebooks: $p + n = 10$ and $2p + 3n = 26$. Substituting $p = 10 - n$ gives $2(10 - n) + 3n = 26$, so $20 + n = 26$ and $n = 6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f5a43141-3fc5-580d-8e4a-ea6d441201ed',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'hard',
   $q$A chemist mixes a 10 percent acid solution with a 30 percent acid solution to make 20 liters of a 25 percent acid solution. How many liters of the 30 percent solution are needed?$q$, $q$[{"text":"10 liters","is_correct":false,"misconception_token":"assumed-equal-split"},{"text":"8 liters","is_correct":false,"misconception_token":"arithmetic-error"},{"text":"5 liters","is_correct":false,"misconception_token":"solved-for-other-solution"},{"text":"15 liters","is_correct":true}]$q$::jsonb, $q$15 liters$q$, $q$Let $x$ be liters of the 30 percent solution and $y$ the 10 percent: $x + y = 20$ and $0.30x + 0.10y = 0.25(20) = 5$. Substituting $y = 20 - x$ gives $0.20x = 3$, so $x = 15$ liters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('58769b93-1c13-521f-9013-ea59fccae50c',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'hard',
   $q$How many solutions does the system $2x - y = 4$ and $-4x + 2y = -8$ have?$q$, $q$[{"text":"Infinitely many solutions","is_correct":true},{"text":"No solution","is_correct":false,"misconception_token":"assumed-parallel-lines"},{"text":"No real solution","is_correct":false,"misconception_token":"confused-with-quadratic"},{"text":"Exactly one solution","is_correct":false,"misconception_token":"assumed-single-intersection"}]$q$::jsonb, $q$Infinitely many solutions$q$, $q$Multiplying the first equation by $-2$ gives $-4x + 2y = -8$, which is exactly the second equation, so the two lines coincide: infinitely many solutions.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3ada554a-20d1-597b-9a7c-85a6fdd4254c',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'hard',
   $q$A theater sells adult tickets for 8 dollars and student tickets for 5 dollars. One night it sold 200 tickets and collected 1330 dollars. How many student tickets were sold?$q$, $q$[{"text":"110","is_correct":false,"misconception_token":"found-adult-count"},{"text":"100","is_correct":false,"misconception_token":"assumed-equal-split"},{"text":"90","is_correct":true},{"text":"200","is_correct":false,"misconception_token":"used-total-tickets"}]$q$::jsonb, $q$90$q$, $q$Let $a$ adults and $s$ students: $a + s = 200$ and $8a + 5s = 1330$. Substituting $a = 200 - s$ gives $1600 - 3s = 1330$, so $3s = 270$ and $s = 90$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2f20b4e9-c848-5df1-9eb2-9a668a209340',
   null,
   (select id from public.skills where slug = 'systems-linear'),
   'algebra', 'hard',
   $q$Solve the system $5x - 3y = 1$ and $2x + 7y = 25$.$q$, $q$[{"text":"$(2, 3)$","is_correct":true},{"text":"$(2, -3)$","is_correct":false,"misconception_token":"sign-error-on-y"},{"text":"$(-2, 3)$","is_correct":false,"misconception_token":"sign-error-on-x"},{"text":"$(3, 2)$","is_correct":false,"misconception_token":"swapped-coordinates"}]$q$::jsonb, $q$$(2, 3)$$q$, $q$Multiply the first by $7$ and the second by $3$: $35x - 21y = 7$ and $6x + 21y = 75$. Adding gives $41x = 82$, so $x = 2$; then $2(2) + 7y = 25$ gives $y = 3$, so $(2, 3)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- exponent-rules (Exponent Rules, grade 9, CCSS.MATH.CONTENT.HSA.SSE.A.2) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3e30a323-c5f6-597a-9afa-d627a8d00449',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'easy',
   $q$Simplify $x^5 \cdot x^2$.$q$, $q$[{"text":"$2x^7$","is_correct":false,"misconception_token":"combined-bases"},{"text":"$x^7$","is_correct":true},{"text":"$x^{10}$","is_correct":false,"misconception_token":"multiplied-exponents"},{"text":"$x^3$","is_correct":false,"misconception_token":"subtracted-exponents"}]$q$::jsonb, $q$$x^7$$q$, $q$With the same base, add the exponents: $x^{5+2} = x^7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3459d65b-442e-5ff8-b0ba-7cbbcf0d0c9e',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'easy',
   $q$Simplify $\frac{x^9}{x^3}$.$q$, $q$[{"text":"$x^6$","is_correct":true},{"text":"$x^{27}$","is_correct":false,"misconception_token":"multiplied-exponents"},{"text":"$x^{12}$","is_correct":false,"misconception_token":"added-exponents"},{"text":"$x^3$","is_correct":false,"misconception_token":"divided-exponents"}]$q$::jsonb, $q$$x^6$$q$, $q$When dividing with the same base, subtract the exponents: $x^{9-3} = x^6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ce0c8cb1-7f13-54d0-bf92-38d4a603e04d',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'easy',
   $q$Simplify $(x^3)^4$.$q$, $q$[{"text":"$x^{81}$","is_correct":false,"misconception_token":"raised-inner-to-outer"},{"text":"$x^{12}$","is_correct":true},{"text":"$x^{64}$","is_correct":false,"misconception_token":"raised-outer-to-inner"},{"text":"$x^7$","is_correct":false,"misconception_token":"added-exponents"}]$q$::jsonb, $q$$x^{12}$$q$, $q$For a power of a power, multiply the exponents: $x^{3 \times 4} = x^{12}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a2e66b15-9804-5365-b23f-b8aa4530571e',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'easy',
   $q$What is $6^0$?$q$, $q$[{"text":"1","is_correct":true},{"text":"0","is_correct":false,"misconception_token":"answered-zero"},{"text":"6","is_correct":false,"misconception_token":"returned-base"},{"text":"undefined","is_correct":false,"misconception_token":"called-undefined"}]$q$::jsonb, $q$1$q$, $q$Any nonzero number raised to the power $0$ equals $1$, so $6^0 = 1$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e6df9eb0-161b-558d-8c9e-836ed5c1a1c7',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'easy',
   $q$Evaluate $2^{-3}$.$q$, $q$[{"text":"$-8$","is_correct":false,"misconception_token":"negated-result"},{"text":"$8$","is_correct":false,"misconception_token":"ignored-negative"},{"text":"$-6$","is_correct":false,"misconception_token":"multiplied-base-by-exponent"},{"text":"$\\frac{1}{8}$","is_correct":true}]$q$::jsonb, $q$$\frac{1}{8}$$q$, $q$A negative exponent means take the reciprocal: $2^{-3} = \frac{1}{2^3} = \frac{1}{8}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ffddd8cd-5294-596a-b233-34c522e21630',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'easy',
   $q$Simplify $(2x)^3$.$q$, $q$[{"text":"$8x$","is_correct":false,"misconception_token":"raised-coefficient-only"},{"text":"$2x^3$","is_correct":false,"misconception_token":"raised-variable-only"},{"text":"$6x^3$","is_correct":false,"misconception_token":"multiplied-coefficient-by-exponent"},{"text":"$8x^3$","is_correct":true}]$q$::jsonb, $q$$8x^3$$q$, $q$Raise each factor to the third power: $2^3 x^3 = 8x^3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2cc4d1a7-8d06-59b4-abde-e766dd951fef',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'easy',
   $q$Evaluate $2^3 \cdot 2^2$.$q$, $q$[{"text":"$1024$","is_correct":false,"misconception_token":"multiplied-bases"},{"text":"$64$","is_correct":false,"misconception_token":"multiplied-exponents"},{"text":"$32$","is_correct":true},{"text":"$12$","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, $q$$32$$q$, $q$Same base, so add the exponents: $2^{3+2} = 2^5 = 32$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('abce4d33-f0d1-551a-b6f6-6f7bf55557b5',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'easy',
   $q$Simplify $\frac{5^6}{5^4}$.$q$, $q$[{"text":"$5^{-2}$","is_correct":false,"misconception_token":"subtracted-reverse"},{"text":"$5^{10}$","is_correct":false,"misconception_token":"added-exponents"},{"text":"$5^2$","is_correct":true},{"text":"$5^{24}$","is_correct":false,"misconception_token":"multiplied-exponents"}]$q$::jsonb, $q$$5^2$$q$, $q$Subtract the exponents when dividing: $5^{6-4} = 5^2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ad2af0b0-9b0a-54b7-84c2-ea65652ccc20',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'medium',
   $q$Simplify $\frac{x^7 y^3}{x^2 y}$.$q$, $q$[{"text":"$x^5 y^2$","is_correct":true},{"text":"$x^9 y^4$","is_correct":false,"misconception_token":"added-exponents"},{"text":"$x^{14} y^2$","is_correct":false,"misconception_token":"multiplied-x-exponents"},{"text":"$x^5 y^3$","is_correct":false,"misconception_token":"forgot-to-subtract-y"}]$q$::jsonb, $q$$x^5 y^2$$q$, $q$Subtract exponents on each base, treating $y$ as $y^1$: $x^{7-2} y^{3-1} = x^5 y^2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('12836102-926e-5ea9-916a-41e7f8d13d35',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'medium',
   $q$Rewrite $3x^{-2}$ using only positive exponents.$q$, $q$[{"text":"$\\frac{1}{3x^2}$","is_correct":false,"misconception_token":"moved-coefficient-down"},{"text":"$-3x^2$","is_correct":false,"misconception_token":"negated-instead-of-reciprocal"},{"text":"$\\frac{3}{x^2}$","is_correct":true},{"text":"$3x^2$","is_correct":false,"misconception_token":"ignored-negative-exponent"}]$q$::jsonb, $q$$\frac{3}{x^2}$$q$, $q$Only the factor with the negative exponent moves: $3x^{-2} = \frac{3}{x^2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('121de71e-1521-5d15-9e57-606beab3a904',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'medium',
   $q$Simplify $(2x^3)^4$.$q$, $q$[{"text":"$2x^{12}$","is_correct":false,"misconception_token":"forgot-coefficient-power"},{"text":"$8x^{12}$","is_correct":false,"misconception_token":"wrong-coefficient-power"},{"text":"$16x^{12}$","is_correct":true},{"text":"$16x^7$","is_correct":false,"misconception_token":"added-exponents"}]$q$::jsonb, $q$$16x^{12}$$q$, $q$Raise each factor to the fourth power: $2^4 x^{3 \times 4} = 16x^{12}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6d09fc9b-9bbf-5426-ace5-b4839cb8f2d0',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'medium',
   $q$A square has side length $x^4$ units. What is its area?$q$, $q$[{"text":"$x^{16}$","is_correct":false,"misconception_token":"exponentiated-the-exponent"},{"text":"$x^6$","is_correct":false,"misconception_token":"added-exponents"},{"text":"$2x^4$","is_correct":false,"misconception_token":"multiplied-by-two"},{"text":"$x^8$","is_correct":true}]$q$::jsonb, $q$$x^8$$q$, $q$Area of a square is the side squared: $(x^4)^2 = x^{4 \times 2} = x^8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('54a83afd-4be9-547c-9998-6bfbaff94282',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'medium',
   $q$A rectangle is $x^2$ units wide and $x^5$ units long. What is its area?$q$, $q$[{"text":"$x^{10}$","is_correct":false,"misconception_token":"multiplied-exponents"},{"text":"$x^7$","is_correct":true},{"text":"$x^3$","is_correct":false,"misconception_token":"subtracted-exponents"},{"text":"$2x^7$","is_correct":false,"misconception_token":"added-a-coefficient"}]$q$::jsonb, $q$$x^7$$q$, $q$Area is length times width: $x^2 \cdot x^5 = x^{2+5} = x^7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e22e13e6-2409-518a-9746-5ff51e98df23',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'medium',
   $q$Simplify $\frac{(x^2)^3}{x^4}$.$q$, $q$[{"text":"$x^1$","is_correct":false,"misconception_token":"added-power-of-power"},{"text":"$x^{10}$","is_correct":false,"misconception_token":"added-in-quotient"},{"text":"$x^2$","is_correct":true},{"text":"$x^{-2}$","is_correct":false,"misconception_token":"reversed-subtraction"}]$q$::jsonb, $q$$x^2$$q$, $q$First $(x^2)^3 = x^6$, then $\frac{x^6}{x^4} = x^{6-4} = x^2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('aeff62eb-1e90-5405-b1f2-3af4eb790be6',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'medium',
   $q$A cube has edge length $2a^2$ units. What is its volume?$q$, $q$[{"text":"$2a^6$","is_correct":false,"misconception_token":"forgot-coefficient-power"},{"text":"$6a^6$","is_correct":false,"misconception_token":"multiplied-coefficient-by-exponent"},{"text":"$8a^5$","is_correct":false,"misconception_token":"added-exponents"},{"text":"$8a^6$","is_correct":true}]$q$::jsonb, $q$$8a^6$$q$, $q$Volume is the edge cubed: $(2a^2)^3 = 2^3 a^{2 \times 3} = 8a^6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e328d44e-235b-5403-88ed-8566df979b9c',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'medium',
   $q$Evaluate $2^{-2} \cdot 2^{5}$.$q$, $q$[{"text":"$8$","is_correct":true},{"text":"$\\frac{1}{1024}$","is_correct":false,"misconception_token":"multiplied-exponents"},{"text":"$\\frac{1}{128}$","is_correct":false,"misconception_token":"subtracted-exponents"},{"text":"$128$","is_correct":false,"misconception_token":"ignored-negative-exponent"}]$q$::jsonb, $q$$8$$q$, $q$Same base, so add the exponents: $2^{-2+5} = 2^3 = 8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fe3e3100-937b-55e4-9ca1-4c7731b09da1',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'hard',
   $q$Simplify $\left(\frac{x^3 y^{-2}}{x^{-1} y^4}\right)^2$.$q$, $q$[{"text":"$\\frac{x^4}{y^6}$","is_correct":false,"misconception_token":"forgot-outer-power"},{"text":"$x^8 y^{12}$","is_correct":false,"misconception_token":"kept-y-in-numerator"},{"text":"$x^4 y^4$","is_correct":false,"misconception_token":"added-exponents"},{"text":"$\\frac{x^8}{y^{12}}$","is_correct":true}]$q$::jsonb, $q$$\frac{x^8}{y^{12}}$$q$, $q$Inside, subtract exponents: $x^{3-(-1)} y^{-2-4} = x^4 y^{-6}$; squaring gives $x^8 y^{-12} = \frac{x^8}{y^{12}}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('58f554c4-e09b-5276-90b2-a6b905cdd589',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'hard',
   $q$A colony of bacteria is modeled by $P = 3 \cdot 2^{t}$, where $t$ is the time in hours. How many times larger is the colony at $t = 5$ than at $t = 2$?$q$, $q$[{"text":"$8$","is_correct":true},{"text":"$128$","is_correct":false,"misconception_token":"added-exponents"},{"text":"$32$","is_correct":false,"misconception_token":"used-only-numerator"},{"text":"$1024$","is_correct":false,"misconception_token":"multiplied-exponents"}]$q$::jsonb, $q$$8$$q$, $q$The ratio is $\frac{3 \cdot 2^5}{3 \cdot 2^2} = 2^{5-2} = 2^3 = 8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7d929698-799d-5294-821a-a15b55cf89bc',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'hard',
   $q$Simplify $\frac{(2x^2 y)^3 (x y^2)}{4 x^3 y^4}$.$q$, $q$[{"text":"$2x^{10} y^9$","is_correct":false,"misconception_token":"added-exponents-in-division"},{"text":"$\\frac{2x^4}{y}$","is_correct":false,"misconception_token":"incomplete-power-distribution"},{"text":"$2x^4 y$","is_correct":true},{"text":"$8x^4 y$","is_correct":false,"misconception_token":"forgot-to-divide-coefficient"}]$q$::jsonb, $q$$2x^4 y$$q$, $q$$(2x^2 y)^3 = 8x^6 y^3$; times $x y^2$ gives $8x^7 y^5$; dividing by $4x^3 y^4$: $\frac{8}{4} x^{7-3} y^{5-4} = 2x^4 y$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4037ac82-e96c-5279-895d-2a52bcddc22e',
   null,
   (select id from public.skills where slug = 'exponent-rules'),
   'advanced-math', 'hard',
   $q$One cube has edge length $x^2$ and another has edge length $x^5$. The volume of the larger cube is how many times the volume of the smaller cube?$q$, $q$[{"text":"$x^9$","is_correct":true},{"text":"$x^{21}$","is_correct":false,"misconception_token":"added-volume-exponents"},{"text":"$x^{13}$","is_correct":false,"misconception_token":"cubed-only-larger"},{"text":"$x^3$","is_correct":false,"misconception_token":"forgot-to-cube-ratio"}]$q$::jsonb, $q$$x^9$$q$, $q$The volumes are $(x^5)^3 = x^{15}$ and $(x^2)^3 = x^6$; the ratio is $\frac{x^{15}}{x^6} = x^9$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- data-statistics (Data & Statistics, grade 9, CCSS.MATH.CONTENT.HSS.ID.A.2) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cb76359d-20d1-53c6-bb48-b1404635aa66',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'easy',
   $q$Find the mean of the data set: 2, 4, 9.$q$, $q$[{"text":"7","is_correct":false,"misconception_token":"used-range"},{"text":"5","is_correct":true},{"text":"4","is_correct":false,"misconception_token":"used-median"},{"text":"15","is_correct":false,"misconception_token":"forgot-to-divide"}]$q$::jsonb, $q$5$q$, $q$The mean is the sum divided by the count: $(2 + 4 + 9) \div 3 = 15 \div 3 = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ca6b892e-8a14-5c39-9303-7bf498c04499',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'easy',
   $q$Find the median of the data set: 8, 2, 6, 1, 4.$q$, $q$[{"text":"4","is_correct":true},{"text":"4.2","is_correct":false,"misconception_token":"used-mean"},{"text":"6","is_correct":false,"misconception_token":"didnt-sort-first"},{"text":"7","is_correct":false,"misconception_token":"used-range"}]$q$::jsonb, $q$4$q$, $q$Sort the values: 1, 2, 4, 6, 8. The middle value of these five numbers is 4.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('87df1df9-017a-5fd5-b0e8-a7a8405f8cae',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'easy',
   $q$Find the mode of the data set: 2, 5, 5, 5, 9, 9.$q$, $q$[{"text":"3","is_correct":false,"misconception_token":"used-frequency-count"},{"text":"5","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"chose-lowest-value"},{"text":"9","is_correct":false,"misconception_token":"chose-highest-value"}]$q$::jsonb, $q$5$q$, $q$The mode is the value that appears most often. The value 5 appears three times, more than any other, so the mode is 5.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a46cd9eb-48c8-5146-9789-453c2d6536dd',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'easy',
   $q$Find the range of the data set: 12, 4, 9, 15, 7.$q$, $q$[{"text":"11","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"used-maximum"},{"text":"19","is_correct":false,"misconception_token":"added-min-and-max"},{"text":"4","is_correct":false,"misconception_token":"used-minimum"}]$q$::jsonb, $q$11$q$, $q$The range is the maximum minus the minimum: $15 - 4 = 11$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1955c470-2861-5d37-b7c2-6a0e24071fe8',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'easy',
   $q$A bag holds 3 red marbles and 5 blue marbles. If one marble is drawn at random, what is the probability it is red?$q$, $q$[{"text":"$\\frac{3}{5}$","is_correct":false,"misconception_token":"used-part-to-part"},{"text":"$\\frac{1}{8}$","is_correct":false,"misconception_token":"used-one-over-total"},{"text":"$\\frac{5}{8}$","is_correct":false,"misconception_token":"used-other-color"},{"text":"$\\frac{3}{8}$","is_correct":true}]$q$::jsonb, $q$$\frac{3}{8}$$q$, $q$There are $3 + 5 = 8$ marbles total and 3 are red, so the probability of red is $\frac{3}{8}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('30d9ea21-d831-5b13-815d-7ade18b66479',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'easy',
   $q$A fair six-sided die is rolled once. What is the probability of rolling a 4?$q$, $q$[{"text":"$\\frac{5}{6}$","is_correct":false,"misconception_token":"used-complement"},{"text":"$\\frac{1}{4}$","is_correct":false,"misconception_token":"used-value-as-denominator"},{"text":"$\\frac{4}{6}$","is_correct":false,"misconception_token":"put-value-over-total"},{"text":"$\\frac{1}{6}$","is_correct":true}]$q$::jsonb, $q$$\frac{1}{6}$$q$, $q$Exactly one of the 6 equally likely faces is a 4, so the probability is $\frac{1}{6}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('76bafa18-25cb-53be-8b7c-a213444ed999',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'easy',
   $q$On three tests a student scored 80, 90, and 100. What is the mean score?$q$, $q$[{"text":"100","is_correct":false,"misconception_token":"used-maximum"},{"text":"270","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"90","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"used-range"}]$q$::jsonb, $q$90$q$, $q$The mean is $(80 + 90 + 100) \div 3 = 270 \div 3 = 90$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7b80a572-da33-521a-937c-b687e84d7d2e',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'easy',
   $q$A dot plot shows the number of pets each student has: 0 pets has 3 dots, 1 pet has 5 dots, and 2 pets has 2 dots. How many students have exactly 1 pet?$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"used-total-students"},{"text":"1","is_correct":false,"misconception_token":"used-pet-number"},{"text":"5","is_correct":true},{"text":"3","is_correct":false,"misconception_token":"read-wrong-category"}]$q$::jsonb, $q$5$q$, $q$Each dot in the '1 pet' row is one student, and that row has 5 dots, so 5 students have exactly 1 pet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bb037dde-802b-5c7b-b302-920e1737607c',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'medium',
   $q$The mean of 4 numbers is 10. Three of the numbers are 8, 12, and 6. What is the fourth number?$q$, $q$[{"text":"14","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"used-mean-as-value"},{"text":"8.67","is_correct":false,"misconception_token":"averaged-known-three"},{"text":"26","is_correct":false,"misconception_token":"used-sum-of-three"}]$q$::jsonb, $q$14$q$, $q$The total of all 4 numbers is $10 \times 4 = 40$. The three known numbers sum to $8 + 12 + 6 = 26$, so the fourth is $40 - 26 = 14$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7f8e8a88-1874-53be-8fda-e0d542c351d9',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'medium',
   $q$Find the median of the data set: 1, 2, 3, 4, 5, 20.$q$, $q$[{"text":"3","is_correct":false,"misconception_token":"chose-lower-middle"},{"text":"4","is_correct":false,"misconception_token":"chose-upper-middle"},{"text":"3.5","is_correct":true},{"text":"7","is_correct":false,"misconception_token":"forgot-to-average-middles"}]$q$::jsonb, $q$3.5$q$, $q$The data are already in order. With 6 values, the median is the mean of the two middle values: $(3 + 4) \div 2 = 3.5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bcec2a81-3e9a-5fe3-9747-7b0a44dcb2aa',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'medium',
   $q$A store recorded these shoe sizes sold: 7, 8, 8, 9, 10, 8, 7. What is the mode of the sizes?$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"chose-largest-value"},{"text":"7","is_correct":false,"misconception_token":"chose-second-most-frequent"},{"text":"8","is_correct":true},{"text":"3","is_correct":false,"misconception_token":"used-frequency-count"}]$q$::jsonb, $q$8$q$, $q$Size 8 appears three times, more than any other size, so the mode is 8.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ea24728d-b415-5cd4-a201-1bf217964315',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'medium',
   $q$The recorded temperatures one week were -3, 5, 8, -1, and 12 degrees. What is the range of the temperatures?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"used-maximum"},{"text":"9","is_correct":false,"misconception_token":"treated-min-as-positive"},{"text":"-15","is_correct":false,"misconception_token":"subtracted-in-wrong-order"},{"text":"15","is_correct":true}]$q$::jsonb, $q$15$q$, $q$The maximum is 12 and the minimum is -3, so the range is $12 - (-3) = 15$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3a16b6a1-65ba-5cc9-a26b-3a9f44295299',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'medium',
   $q$A spinner has 6 equal sections numbered 1 through 6. What is the probability of landing on a multiple of 3?$q$, $q$[{"text":"$\\frac{1}{6}$","is_correct":false,"misconception_token":"counted-one-multiple"},{"text":"$\\frac{1}{3}$","is_correct":true},{"text":"$\\frac{2}{3}$","is_correct":false,"misconception_token":"found-complement"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"counted-even-numbers"}]$q$::jsonb, $q$$\frac{1}{3}$$q$, $q$The multiples of 3 from 1 to 6 are 3 and 6, giving 2 favorable outcomes out of 6: $\frac{2}{6} = \frac{1}{3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('19789ee4-97c0-5fd0-9e22-99f41d50126c',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'medium',
   $q$A student has quiz scores of 7, 9, 8, and 8. What score on a fifth quiz is needed for a mean of 8.4?$q$, $q$[{"text":"42","is_correct":false,"misconception_token":"gave-total-needed"},{"text":"8.4","is_correct":false,"misconception_token":"used-target-mean"},{"text":"10","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"used-current-mean"}]$q$::jsonb, $q$10$q$, $q$The five scores must total $8.4 \times 5 = 42$. The first four sum to $7 + 9 + 8 + 8 = 32$, so the fifth must be $42 - 32 = 10$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a778d2b5-bef5-5006-a6ab-771b90808ded',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'medium',
   $q$The ages of nine students are 12, 13, 11, 14, 12, 15, 13, 12, and 16. What is the median age?$q$, $q$[{"text":"16","is_correct":false,"misconception_token":"used-maximum"},{"text":"12","is_correct":false,"misconception_token":"chose-the-mode"},{"text":"5","is_correct":false,"misconception_token":"used-position-number"},{"text":"13","is_correct":true}]$q$::jsonb, $q$13$q$, $q$Sorted, the ages are 11, 12, 12, 12, 13, 13, 14, 15, 16. With 9 values, the median is the 5th value, which is 13.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('aa678c66-a0ea-53c4-9824-a4bd7b5e74b1',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'medium',
   $q$A jar contains 4 green, 6 yellow, and 10 red marbles. If one marble is drawn at random, what is the probability it is NOT green?$q$, $q$[{"text":"$\\frac{4}{5}$","is_correct":true},{"text":"$\\frac{1}{4}$","is_correct":false,"misconception_token":"inverted-fraction"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"used-single-color"},{"text":"$\\frac{1}{5}$","is_correct":false,"misconception_token":"found-green-probability"}]$q$::jsonb, $q$$\frac{4}{5}$$q$, $q$There are $4 + 6 + 10 = 20$ marbles, and $20 - 4 = 16$ are not green, so the probability is $\frac{16}{20} = \frac{4}{5}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b0c1b467-6bdc-5d81-9c89-db924c170e8d',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'hard',
   $q$The mean of 5 numbers is 14. When one number is removed, the mean of the remaining 4 numbers is 12. What was the number that was removed?$q$, $q$[{"text":"26","is_correct":false,"misconception_token":"added-the-means"},{"text":"12","is_correct":false,"misconception_token":"used-remaining-mean"},{"text":"2","is_correct":false,"misconception_token":"subtracted-the-means"},{"text":"22","is_correct":true}]$q$::jsonb, $q$22$q$, $q$The 5 numbers total $14 \times 5 = 70$ and the remaining 4 total $12 \times 4 = 48$, so the removed number is $70 - 48 = 22$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('860c30fe-2495-5933-9b32-529961093fef',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'hard',
   $q$For the data set 3, 5, 6, 6, 100, by how much does the mean exceed the median?$q$, $q$[{"text":"18","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"reported-mean-only"},{"text":"94","is_correct":false,"misconception_token":"used-max-minus-median"},{"text":"6","is_correct":false,"misconception_token":"reported-median-only"}]$q$::jsonb, $q$18$q$, $q$The mean is $(3 + 5 + 6 + 6 + 100) \div 5 = 120 \div 5 = 24$ and the median is 6, so the mean exceeds the median by $24 - 6 = 18$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('468aef3f-7849-54f6-b15a-ede3c484cc6c',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'hard',
   $q$A standard deck has 52 cards, including 12 face cards (jack, queen, king in each of the 4 suits). If one card is drawn at random, what is the probability it is a face card?$q$, $q$[{"text":"$\\frac{1}{13}$","is_correct":false,"misconception_token":"counted-four-face-cards"},{"text":"$\\frac{3}{52}$","is_correct":false,"misconception_token":"counted-three-face-cards"},{"text":"$\\frac{3}{13}$","is_correct":true},{"text":"$\\frac{4}{13}$","is_correct":false,"misconception_token":"included-aces-as-face"}]$q$::jsonb, $q$$\frac{3}{13}$$q$, $q$There are 12 face cards out of 52, so the probability is $\frac{12}{52} = \frac{3}{13}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8f839b1d-91a5-5ac9-8f92-09ce9c80a6fb',
   null,
   (select id from public.skills where slug = 'data-statistics'),
   'problem-solving-data-analysis', 'hard',
   $q$A data set of 6 values written in increasing order is 8, 11, 15, x, 20, 24. If the median is 16, what is the value of x?$q$, $q$[{"text":"17","is_correct":true},{"text":"32","is_correct":false,"misconception_token":"used-doubled-median"},{"text":"1","is_correct":false,"misconception_token":"subtracted-values"},{"text":"16","is_correct":false,"misconception_token":"used-median-directly"}]$q$::jsonb, $q$17$q$, $q$With 6 values, the median is the mean of the 3rd and 4th values: $(15 + x) \div 2 = 16$, so $15 + x = 32$ and $x = 17$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- geometry-proofs (Geometry Proofs, grade 10, CCSS.MATH.CONTENT.HSG.CO.C.9) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('426531bf-53d9-56b7-87ba-aaeb404a0ab6',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'easy',
   $q$Two lines intersect, forming vertical angles. One of the angles measures $65^\circ$. What is the measure of the angle vertical to it?$q$, $q$[{"text":"$295^\\circ$","is_correct":false,"misconception_token":"subtracted-from-360"},{"text":"$65^\\circ$","is_correct":true},{"text":"$115^\\circ$","is_correct":false,"misconception_token":"used-supplement"},{"text":"$25^\\circ$","is_correct":false,"misconception_token":"used-complement"}]$q$::jsonb, $q$$65^\circ$$q$, $q$Vertical angles are congruent, so the angle vertical to a $65^\circ$ angle also measures $65^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1abcb37c-a0ce-54d0-a5f8-0bf3c1c1f32e',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'easy',
   $q$Two angles form a linear pair. One of the angles measures $70^\circ$. What is the measure of the other angle?$q$, $q$[{"text":"$110^\\circ$","is_correct":true},{"text":"$290^\\circ$","is_correct":false,"misconception_token":"used-360"},{"text":"$20^\\circ$","is_correct":false,"misconception_token":"found-complement"},{"text":"$70^\\circ$","is_correct":false,"misconception_token":"assumed-vertical-equal"}]$q$::jsonb, $q$$110^\circ$$q$, $q$A linear pair is supplementary, so the other angle is $180^\circ - 70^\circ = 110^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('391c1733-69ee-5457-9217-67a38895f0d1',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'easy',
   $q$What is the measure of the angle complementary to $35^\circ$?$q$, $q$[{"text":"$325^\\circ$","is_correct":false,"misconception_token":"used-360"},{"text":"$55^\\circ$","is_correct":true},{"text":"$35^\\circ$","is_correct":false,"misconception_token":"copied-given"},{"text":"$145^\\circ$","is_correct":false,"misconception_token":"used-supplement"}]$q$::jsonb, $q$$55^\circ$$q$, $q$Complementary angles sum to $90^\circ$, so the angle is $90^\circ - 35^\circ = 55^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f91a0f76-afa2-5adf-b10e-ae3e7921fd93',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'easy',
   $q$What is the measure of the angle supplementary to $40^\circ$?$q$, $q$[{"text":"$140^\\circ$","is_correct":true},{"text":"$50^\\circ$","is_correct":false,"misconception_token":"found-complement"},{"text":"$320^\\circ$","is_correct":false,"misconception_token":"used-360"},{"text":"$40^\\circ$","is_correct":false,"misconception_token":"copied-given"}]$q$::jsonb, $q$$140^\circ$$q$, $q$Supplementary angles sum to $180^\circ$, so the angle is $180^\circ - 40^\circ = 140^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('92aa4892-688e-5704-a9ee-c845f3f63181',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'easy',
   $q$Two parallel lines are cut by a transversal. One angle measures $75^\circ$. What is the measure of its corresponding angle?$q$, $q$[{"text":"$105^\\circ$","is_correct":false,"misconception_token":"used-supplement"},{"text":"$285^\\circ$","is_correct":false,"misconception_token":"subtracted-from-360"},{"text":"$15^\\circ$","is_correct":false,"misconception_token":"used-complement"},{"text":"$75^\\circ$","is_correct":true}]$q$::jsonb, $q$$75^\circ$$q$, $q$Corresponding angles formed by parallel lines are congruent, so the angle measures $75^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9f0a6feb-db23-5a33-b61a-43ad40425e63',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'easy',
   $q$Two parallel lines are cut by a transversal. One interior angle measures $110^\circ$. What is the measure of its alternate interior angle?$q$, $q$[{"text":"$220^\\circ$","is_correct":false,"misconception_token":"doubled-angle"},{"text":"$250^\\circ$","is_correct":false,"misconception_token":"subtracted-from-360"},{"text":"$70^\\circ$","is_correct":false,"misconception_token":"used-supplement"},{"text":"$110^\\circ$","is_correct":true}]$q$::jsonb, $q$$110^\circ$$q$, $q$Alternate interior angles formed by parallel lines are congruent, so the angle measures $110^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('543d3e2c-5bcc-5d08-ae43-49c8bfb3fd50',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'easy',
   $q$Two parallel lines are cut by a transversal. One interior angle measures $65^\circ$. What is the measure of the co-interior (same-side interior) angle?$q$, $q$[{"text":"$25^\\circ$","is_correct":false,"misconception_token":"found-complement"},{"text":"$65^\\circ$","is_correct":false,"misconception_token":"treated-as-equal"},{"text":"$115^\\circ$","is_correct":true},{"text":"$295^\\circ$","is_correct":false,"misconception_token":"used-360"}]$q$::jsonb, $q$$115^\circ$$q$, $q$Co-interior (same-side interior) angles are supplementary, so the angle is $180^\circ - 65^\circ = 115^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e287aa25-913e-58f4-ad30-1f46815b3445',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'easy',
   $q$Two lines intersect at a point. $\angle 1$ and $\angle 3$ are the non-adjacent angles opposite each other. Which relationship justifies the statement that $\angle 1$ and $\angle 3$ are equal?$q$, $q$[{"text":"Corresponding angles","is_correct":false,"misconception_token":"chose-corresponding"},{"text":"Linear pair","is_correct":false,"misconception_token":"chose-linear-pair"},{"text":"Vertical angles","is_correct":true},{"text":"Complementary angles","is_correct":false,"misconception_token":"chose-complementary"}]$q$::jsonb, $q$Vertical angles$q$, $q$Angles opposite each other at the intersection of two lines are vertical angles, which are always congruent.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('971456f1-928b-513d-9ec5-d429df1d631d',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'medium',
   $q$Two vertical angles measure $(2x + 10)^\circ$ and $50^\circ$. What is the value of $x$?$q$, $q$[{"text":"20","is_correct":true},{"text":"25","is_correct":false,"misconception_token":"forgot-constant"},{"text":"30","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"60","is_correct":false,"misconception_token":"used-supplementary"}]$q$::jsonb, $q$20$q$, $q$Vertical angles are equal: $2x + 10 = 50$, so $2x = 40$ and $x = 20$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c6b599fe-37ca-5ac6-975e-6c5fce184683',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'medium',
   $q$Two angles that form a linear pair measure $(3x)^\circ$ and $(x + 20)^\circ$. What is the value of $x$?$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"treated-as-vertical"},{"text":"45","is_correct":false,"misconception_token":"forgot-constant"},{"text":"40","is_correct":true},{"text":"85","is_correct":false,"misconception_token":"used-360"}]$q$::jsonb, $q$40$q$, $q$A linear pair is supplementary: $3x + (x + 20) = 180$, so $4x = 160$ and $x = 40$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1d638065-b9b6-50a6-8fc7-e39c6e423196',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'medium',
   $q$Two parallel lines are cut by a transversal. A pair of corresponding angles measure $(3x - 15)^\circ$ and $60^\circ$. What is the value of $x$?$q$, $q$[{"text":"45","is_correct":false,"misconception_token":"used-supplementary"},{"text":"15","is_correct":false,"misconception_token":"subtracted-constant"},{"text":"25","is_correct":true},{"text":"75","is_correct":false,"misconception_token":"forgot-to-divide"}]$q$::jsonb, $q$25$q$, $q$Corresponding angles are equal: $3x - 15 = 60$, so $3x = 75$ and $x = 25$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8a084203-be7e-5531-a96c-a5bc9e58cd99',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'medium',
   $q$Two angles are complementary. The larger angle is $30^\circ$ more than the smaller angle. What is the measure of the larger angle?$q$, $q$[{"text":"$105^\\circ$","is_correct":false,"misconception_token":"used-supplementary"},{"text":"$30^\\circ$","is_correct":false,"misconception_token":"gave-smaller-angle"},{"text":"$45^\\circ$","is_correct":false,"misconception_token":"split-evenly"},{"text":"$60^\\circ$","is_correct":true}]$q$::jsonb, $q$$60^\circ$$q$, $q$Let the smaller angle be $s$; then $s + (s + 30) = 90$, so $2s = 60$, $s = 30$, and the larger angle is $60^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b74850a4-797f-524c-aefa-189c5528f46c',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'medium',
   $q$Two angles are supplementary. One angle is twice the measure of the other. What is the measure of the smaller angle?$q$, $q$[{"text":"$120^\\circ$","is_correct":false,"misconception_token":"gave-larger-angle"},{"text":"$60^\\circ$","is_correct":true},{"text":"$90^\\circ$","is_correct":false,"misconception_token":"split-evenly"},{"text":"$30^\\circ$","is_correct":false,"misconception_token":"used-90"}]$q$::jsonb, $q$$60^\circ$$q$, $q$Let the smaller angle be $x$; then $x + 2x = 180$, so $3x = 180$ and $x = 60^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d672fcf0-99ae-5a68-b16e-a9314a0cf179',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'medium',
   $q$Lines $m$ and $n$ are parallel and cut by a transversal. $\angle 1$ measures $115^\circ$. $\angle 1$ and $\angle 2$ are co-interior angles, and $\angle 2$ and $\angle 3$ are vertical angles. What is the measure of $\angle 3$?$q$, $q$[{"text":"$25^\\circ$","is_correct":false,"misconception_token":"found-complement"},{"text":"$115^\\circ$","is_correct":false,"misconception_token":"assumed-all-equal"},{"text":"$65^\\circ$","is_correct":true},{"text":"$245^\\circ$","is_correct":false,"misconception_token":"used-360"}]$q$::jsonb, $q$$65^\circ$$q$, $q$The co-interior angle to $\angle 1$ is $180^\circ - 115^\circ = 65^\circ$, and $\angle 3$ is vertical to that angle, so $\angle 3 = 65^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d5f36fbe-8425-54fc-b69f-b25d92741839',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'medium',
   $q$Two parallel lines are cut by a transversal. $\angle 4$ and $\angle 6$ lie between the two parallel lines on opposite sides of the transversal, and $\angle 4 = \angle 6$. Which relationship justifies this?$q$, $q$[{"text":"Vertical angles","is_correct":false,"misconception_token":"chose-vertical"},{"text":"Co-interior angles","is_correct":false,"misconception_token":"chose-co-interior"},{"text":"Corresponding angles","is_correct":false,"misconception_token":"chose-corresponding"},{"text":"Alternate interior angles","is_correct":true}]$q$::jsonb, $q$Alternate interior angles$q$, $q$The two angles lie between the parallel lines on opposite sides of the transversal, which defines alternate interior angles; these are congruent.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('31fdf672-b7e5-5660-a97b-531fff90eeb3',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'medium',
   $q$Three angles lie on one side of a straight line and together form a straight angle. Their measures are $x^\circ$, $(2x)^\circ$, and $60^\circ$. What is the value of $x$?$q$, $q$[{"text":"40","is_correct":true},{"text":"100","is_correct":false,"misconception_token":"used-360"},{"text":"120","is_correct":false,"misconception_token":"ignored-2x-term"},{"text":"60","is_correct":false,"misconception_token":"forgot-constant"}]$q$::jsonb, $q$40$q$, $q$The three angles form a straight angle: $x + 2x + 60 = 180$, so $3x = 120$ and $x = 40$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cc2113cf-e838-5bf4-b94b-346336e26a87',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'hard',
   $q$Two parallel lines are cut by a transversal. A pair of co-interior angles measure $(3x + 15)^\circ$ and $(x + 45)^\circ$. What is the value of $x$?$q$, $q$[{"text":"45","is_correct":false,"misconception_token":"forgot-constant"},{"text":"75","is_correct":false,"misconception_token":"used-360"},{"text":"15","is_correct":false,"misconception_token":"treated-as-equal"},{"text":"30","is_correct":true}]$q$::jsonb, $q$30$q$, $q$Co-interior angles are supplementary: $(3x + 15) + (x + 45) = 180$, so $4x + 60 = 180$, $4x = 120$, and $x = 30$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('72ab3c0d-5bb1-587a-aca3-6e71e83e7598',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'hard',
   $q$Two parallel lines are cut by a transversal. An angle measures $(2x)^\circ$ and its corresponding angle measures $(x + 40)^\circ$. What is the measure of the angle?$q$, $q$[{"text":"$80^\\circ$","is_correct":true},{"text":"$40^\\circ$","is_correct":false,"misconception_token":"gave-x-not-angle"},{"text":"$160^\\circ$","is_correct":false,"misconception_token":"doubled-angle"},{"text":"$100^\\circ$","is_correct":false,"misconception_token":"used-supplement"}]$q$::jsonb, $q$$80^\circ$$q$, $q$Corresponding angles are equal: $2x = x + 40$, so $x = 40$; the angle measures $2x = 80^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9a6c8ae7-eaae-52d6-8e8d-88baec754056',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'hard',
   $q$Two lines intersect. One angle measures $x^\circ$, and the angle vertical to it measures $(3x - 80)^\circ$. What is the value of $x$?$q$, $q$[{"text":"65","is_correct":false,"misconception_token":"used-supplementary"},{"text":"20","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"40","is_correct":true},{"text":"80","is_correct":false,"misconception_token":"forgot-to-divide"}]$q$::jsonb, $q$40$q$, $q$Vertical angles are equal: $x = 3x - 80$, so $2x = 80$ and $x = 40$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('974aaf22-64d4-503b-b7a8-27ad7d76a238',
   null,
   (select id from public.skills where slug = 'geometry-proofs'),
   'geometry-trigonometry', 'hard',
   $q$Two parallel lines are cut by a transversal. Angle $A$ and angle $B$ are co-interior angles. Angle $A$ measures $(4x + 10)^\circ$ and angle $B$ measures $(6x)^\circ$. What is the measure of angle $B$?$q$, $q$[{"text":"$102^\\circ$","is_correct":true},{"text":"$78^\\circ$","is_correct":false,"misconception_token":"gave-other-angle"},{"text":"$17^\\circ$","is_correct":false,"misconception_token":"gave-x-not-angle"},{"text":"$30^\\circ$","is_correct":false,"misconception_token":"treated-as-equal"}]$q$::jsonb, $q$$102^\circ$$q$, $q$Co-interior angles are supplementary: $(4x + 10) + 6x = 180$, so $10x + 10 = 180$, $10x = 170$, and $x = 17$; angle $B = 6x = 102^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- triangle-congruence (Triangle Congruence, grade 10, CCSS.MATH.CONTENT.HSG.CO.B.8) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f74a9b94-d748-5faa-9ae9-0353deba6082',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'easy',
   $q$Two angles of a triangle measure $50^\circ$ and $60^\circ$. What is the measure of the third angle?$q$, $q$[{"text":"$120^\\circ$","is_correct":false,"misconception_token":"subtracted-only-second-angle"},{"text":"$70^\\circ$","is_correct":true},{"text":"$110^\\circ$","is_correct":false,"misconception_token":"added-the-two-angles"},{"text":"$130^\\circ$","is_correct":false,"misconception_token":"subtracted-only-first-angle"}]$q$::jsonb, $q$$70^\circ$$q$, $q$The angles of a triangle sum to $180^\circ$, so the third angle is $180^\circ - 50^\circ - 60^\circ = 70^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('39620eb9-db25-5104-848b-a1524ec8513f',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'easy',
   $q$In two triangles, all three pairs of corresponding sides are congruent. Which criterion proves the triangles congruent?$q$, $q$[{"text":"SSS","is_correct":true},{"text":"ASA","is_correct":false,"misconception_token":"confused-sides-with-angles"},{"text":"SAS","is_correct":false,"misconception_token":"confused-with-two-sides-one-angle"},{"text":"AAS","is_correct":false,"misconception_token":"confused-with-two-angles-one-side"}]$q$::jsonb, $q$SSS$q$, $q$Three pairs of congruent sides matches the Side-Side-Side (SSS) congruence criterion.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5fc1b581-4501-5ef4-ada9-dd08d13a9254',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'easy',
   $q$All three angles of an equilateral triangle are equal. What is the measure of each angle?$q$, $q$[{"text":"$45^\\circ$","is_correct":false,"misconception_token":"divided-total-by-four"},{"text":"$60^\\circ$","is_correct":true},{"text":"$120^\\circ$","is_correct":false,"misconception_token":"used-exterior-angle"},{"text":"$90^\\circ$","is_correct":false,"misconception_token":"assumed-right-angle"}]$q$::jsonb, $q$$60^\circ$$q$, $q$The three equal angles sum to $180^\circ$, so each measures $180^\circ \div 3 = 60^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ce551884-bc94-5a78-8ee5-f049de9eedc1',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'easy',
   $q$In two triangles, two pairs of sides and the pair of angles between those sides are congruent. Which criterion proves the triangles congruent?$q$, $q$[{"text":"SAS","is_correct":true},{"text":"SSS","is_correct":false,"misconception_token":"ignored-the-angle"},{"text":"ASA","is_correct":false,"misconception_token":"swapped-sides-and-angles"},{"text":"HL","is_correct":false,"misconception_token":"assumed-right-triangle"}]$q$::jsonb, $q$SAS$q$, $q$Two sides with the included angle between them matches the Side-Angle-Side (SAS) congruence criterion.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cd0b1ca5-032f-5474-ac4c-08b4d3d1fe9e',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'easy',
   $q$An isosceles triangle has a vertex angle of $40^\circ$ and two equal base angles. What is the measure of each base angle?$q$, $q$[{"text":"$140^\\circ$","is_correct":false,"misconception_token":"forgot-to-halve-remainder"},{"text":"$20^\\circ$","is_correct":false,"misconception_token":"halved-the-vertex-angle"},{"text":"$40^\\circ$","is_correct":false,"misconception_token":"reused-vertex-angle"},{"text":"$70^\\circ$","is_correct":true}]$q$::jsonb, $q$$70^\circ$$q$, $q$The two base angles share $180^\circ - 40^\circ = 140^\circ$, so each base angle is $140^\circ \div 2 = 70^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0642b0d3-3c20-5407-ba75-222ad56b0fae',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'easy',
   $q$In two triangles, two pairs of angles and the pair of sides between those angles are congruent. Which criterion proves the triangles congruent?$q$, $q$[{"text":"SSS","is_correct":false,"misconception_token":"ignored-the-angles"},{"text":"SAS","is_correct":false,"misconception_token":"swapped-angles-and-sides"},{"text":"AAS","is_correct":false,"misconception_token":"used-non-included-side"},{"text":"ASA","is_correct":true}]$q$::jsonb, $q$ASA$q$, $q$Two angles with the included side between them matches the Angle-Side-Angle (ASA) congruence criterion.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('105dff83-cae5-5ccf-90ce-996b3ab5f264',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'easy',
   $q$A right triangle has a right angle and one acute angle of $35^\circ$. What is the measure of the other acute angle?$q$, $q$[{"text":"$45^\\circ$","is_correct":false,"misconception_token":"assumed-45-45-right-triangle"},{"text":"$145^\\circ$","is_correct":false,"misconception_token":"forgot-the-right-angle"},{"text":"$55^\\circ$","is_correct":true},{"text":"$35^\\circ$","is_correct":false,"misconception_token":"copied-the-given-acute-angle"}]$q$::jsonb, $q$$55^\circ$$q$, $q$The angles sum to $180^\circ$, so the other acute angle is $180^\circ - 90^\circ - 35^\circ = 55^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('aae5242d-4547-5039-921b-d7b1645670de',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'easy',
   $q$Triangle $ABC$ is congruent to triangle $DEF$, with $AB = 8$, $BC = 6$, and $CA = 5$. What is the length of $EF$?$q$, $q$[{"text":"$19$","is_correct":false,"misconception_token":"summed-all-sides"},{"text":"$8$","is_correct":false,"misconception_token":"used-side-ab"},{"text":"$6$","is_correct":true},{"text":"$5$","is_correct":false,"misconception_token":"used-side-ca"}]$q$::jsonb, $q$$6$$q$, $q$In $ABC \cong DEF$, side $EF$ corresponds to side $BC$, so $EF = BC = 6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('73e5e4fd-0597-5c56-8ef7-481435e442ef',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'medium',
   $q$The three angles of a triangle can be written as $x$, $2x$, and $3x$. What is the measure of the largest angle?$q$, $q$[{"text":"$90^\\circ$","is_correct":true},{"text":"$30^\\circ$","is_correct":false,"misconception_token":"gave-value-of-x"},{"text":"$180^\\circ$","is_correct":false,"misconception_token":"gave-the-total"},{"text":"$60^\\circ$","is_correct":false,"misconception_token":"gave-middle-angle"}]$q$::jsonb, $q$$90^\circ$$q$, $q$Since $x + 2x + 3x = 6x = 180^\circ$, we get $x = 30^\circ$, so the largest angle is $3x = 90^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4dffa623-deea-5d3a-995f-a29e4bddbf19',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'medium',
   $q$Two right triangles have congruent hypotenuses and one pair of congruent legs. Which criterion proves the triangles congruent?$q$, $q$[{"text":"SSA","is_correct":false,"misconception_token":"used-invalid-ssa"},{"text":"SAS","is_correct":false,"misconception_token":"treated-right-angle-as-included"},{"text":"HL","is_correct":true},{"text":"AAS","is_correct":false,"misconception_token":"confused-legs-with-angles"}]$q$::jsonb, $q$HL$q$, $q$A congruent hypotenuse and one congruent leg in right triangles matches the Hypotenuse-Leg (HL) criterion.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d3c9af1e-550b-5328-83a8-c36be005a357',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'medium',
   $q$An exterior angle of a triangle is formed at one vertex. Its two remote interior angles measure $45^\circ$ and $70^\circ$. What is the measure of that exterior angle?$q$, $q$[{"text":"$90^\\circ$","is_correct":false,"misconception_token":"assumed-right-angle"},{"text":"$65^\\circ$","is_correct":false,"misconception_token":"used-supplement-of-sum"},{"text":"$115^\\circ$","is_correct":true},{"text":"$25^\\circ$","is_correct":false,"misconception_token":"subtracted-remote-angles"}]$q$::jsonb, $q$$115^\circ$$q$, $q$An exterior angle equals the sum of its two remote interior angles: $45^\circ + 70^\circ = 115^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5e042c06-bb8c-5dd5-b8f4-e99996566e28',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'medium',
   $q$Triangle $ABC$ is congruent to triangle $DEF$, so $AB = DE$. If $AB = 2x + 3$ and $DE = 15$, what is the value of $x$?$q$, $q$[{"text":"$7.5$","is_correct":false,"misconception_token":"ignored-the-constant"},{"text":"$9$","is_correct":false,"misconception_token":"added-3-instead-of-subtracting"},{"text":"$12$","is_correct":false,"misconception_token":"forgot-to-divide-by-2"},{"text":"$6$","is_correct":true}]$q$::jsonb, $q$$6$$q$, $q$Set $2x + 3 = 15$, so $2x = 12$ and $x = 6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e7a2d64e-e8dd-5c6e-9e22-bc59801edc05',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'medium',
   $q$A triangular sail has two of its angles measuring $63^\circ$ and $48^\circ$. What is the measure of the third angle?$q$, $q$[{"text":"$111^\\circ$","is_correct":false,"misconception_token":"added-the-two-angles"},{"text":"$69^\\circ$","is_correct":true},{"text":"$132^\\circ$","is_correct":false,"misconception_token":"subtracted-only-second-angle"},{"text":"$117^\\circ$","is_correct":false,"misconception_token":"subtracted-only-first-angle"}]$q$::jsonb, $q$$69^\circ$$q$, $q$The angles sum to $180^\circ$, so the third angle is $180^\circ - 63^\circ - 48^\circ = 69^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('704882a5-23ba-509e-8fa9-e965f6a182ef',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'medium',
   $q$In triangles $ABC$ and $XYZ$, it is given that $AB = XY$, $BC = YZ$, and $\angle B = \angle Y$. Which criterion proves the triangles congruent?$q$, $q$[{"text":"AAS","is_correct":false,"misconception_token":"misidentified-parts-given"},{"text":"SSS","is_correct":false,"misconception_token":"counted-angle-as-side"},{"text":"SAS","is_correct":true},{"text":"ASA","is_correct":false,"misconception_token":"miscounted-angles-and-sides"}]$q$::jsonb, $q$SAS$q$, $q$Sides $AB$ and $BC$ meet at $\angle B$, so the given angle is included between the two sides, matching SAS.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('354f0b56-c7f6-5488-b5d9-18dc6809bd08',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'medium',
   $q$In triangles $ABC$ and $DEF$, it is given that $\angle A = \angle D$, $\angle B = \angle E$, and $BC = EF$. Since $BC$ is not between the two given angles, which criterion proves the triangles congruent?$q$, $q$[{"text":"SSS","is_correct":false,"misconception_token":"ignored-the-angles"},{"text":"ASA","is_correct":false,"misconception_token":"treated-side-as-included"},{"text":"SAS","is_correct":false,"misconception_token":"miscounted-sides-and-angles"},{"text":"AAS","is_correct":true}]$q$::jsonb, $q$AAS$q$, $q$Two angles and a non-included side ($BC$ is opposite $\angle A$, not between the angles) match the Angle-Angle-Side (AAS) criterion.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1d0c953b-fc13-5ea9-947c-ab29aa63d52c',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'medium',
   $q$An isosceles triangle has a vertex angle of $80^\circ$ and two equal base angles each measuring $x$. What is the value of $x$?$q$, $q$[{"text":"$50^\\circ$","is_correct":true},{"text":"$40^\\circ$","is_correct":false,"misconception_token":"halved-the-vertex-angle"},{"text":"$80^\\circ$","is_correct":false,"misconception_token":"reused-vertex-angle"},{"text":"$100^\\circ$","is_correct":false,"misconception_token":"forgot-to-divide-by-2"}]$q$::jsonb, $q$$50^\circ$$q$, $q$From $2x + 80^\circ = 180^\circ$, we get $2x = 100^\circ$, so $x = 50^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('83695acd-889a-538d-b9ec-6aafd7bb12d0',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'hard',
   $q$The three angles of a triangle are in the ratio $3 : 4 : 5$. What is the measure of the largest angle?$q$, $q$[{"text":"$60^\\circ$","is_correct":false,"misconception_token":"used-middle-ratio-part"},{"text":"$36^\\circ$","is_correct":false,"misconception_token":"divided-total-by-largest-ratio"},{"text":"$45^\\circ$","is_correct":false,"misconception_token":"used-smallest-ratio-part"},{"text":"$75^\\circ$","is_correct":true}]$q$::jsonb, $q$$75^\circ$$q$, $q$The parts total $3x + 4x + 5x = 12x = 180^\circ$, so $x = 15^\circ$ and the largest angle is $5x = 75^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('af4c3e6f-5f72-593c-b3ff-444fc3ba2239',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'hard',
   $q$In triangles $ABC$ and $DEF$, it is given that $\angle A = \angle D$, $\angle B = \angle E$, and $\angle C = \angle F$, with no side information. Which criterion proves the triangles congruent?$q$, $q$[{"text":"None; equal angles alone do not prove congruence","is_correct":true},{"text":"ASA","is_correct":false,"misconception_token":"invented-a-side-for-asa"},{"text":"SSS","is_correct":false,"misconception_token":"assumed-sides-from-angles"},{"text":"AAS","is_correct":false,"misconception_token":"invented-a-side-for-aas"}]$q$::jsonb, $q$None; equal angles alone do not prove congruence$q$, $q$Three pairs of equal angles (AAA) only guarantee similar shapes, not congruence, because no side length is fixed; there is no valid congruence criterion here.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c3cce6d2-9478-5721-8137-4340955f765e',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'hard',
   $q$In a right triangle, one angle is $90^\circ$ and the two acute angles are in the ratio $2 : 3$. What is the measure of the larger acute angle?$q$, $q$[{"text":"$36^\\circ$","is_correct":false,"misconception_token":"used-smaller-ratio-part"},{"text":"$108^\\circ$","is_correct":false,"misconception_token":"split-180-instead-of-90"},{"text":"$54^\\circ$","is_correct":true},{"text":"$45^\\circ$","is_correct":false,"misconception_token":"assumed-equal-acute-angles"}]$q$::jsonb, $q$$54^\circ$$q$, $q$The two acute angles share $180^\circ - 90^\circ = 90^\circ$; with ratio $2 : 3$, each part is $90^\circ \div 5 = 18^\circ$, so the larger acute angle is $3 \times 18^\circ = 54^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e27c9360-0265-5fb2-a87e-c44b6cb638ba',
   null,
   (select id from public.skills where slug = 'triangle-congruence'),
   'geometry-trigonometry', 'hard',
   $q$Triangle $ABC$ is congruent to triangle $PQR$. In triangle $ABC$, $\angle A = 50^\circ$ and $\angle B = 60^\circ$. What is the measure of $\angle R$?$q$, $q$[{"text":"$70^\\circ$","is_correct":true},{"text":"$60^\\circ$","is_correct":false,"misconception_token":"used-angle-b"},{"text":"$110^\\circ$","is_correct":false,"misconception_token":"summed-angles-a-and-b"},{"text":"$50^\\circ$","is_correct":false,"misconception_token":"used-angle-a"}]$q$::jsonb, $q$$70^\circ$$q$, $q$First $\angle C = 180^\circ - 50^\circ - 60^\circ = 70^\circ$; since $\angle R$ corresponds to $\angle C$, $\angle R = 70^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- similarity-right-triangles (Similarity & Right Triangles, grade 10, CCSS.MATH.CONTENT.HSG.SRT.C.8) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('25141439-1c9c-5c4d-8546-8a4023c12c6e',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'easy',
   $q$A right triangle has legs of length $3$ and $4$. What is the length of the hypotenuse?$q$, $q$[{"text":"$\\sqrt{7}$","is_correct":false,"misconception_token":"subtracted-squares"},{"text":"5","is_correct":true},{"text":"7","is_correct":false,"misconception_token":"added-legs"},{"text":"25","is_correct":false,"misconception_token":"forgot-square-root"}]$q$::jsonb, $q$5$q$, $q$By the Pythagorean theorem, $3^2 + 4^2 = 9 + 16 = 25$, so the hypotenuse is $\sqrt{25} = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('25eeb642-3359-5837-a79a-c8610c765fff',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'easy',
   $q$A right triangle has legs of length $5$ and $12$. What is the length of the hypotenuse?$q$, $q$[{"text":"13","is_correct":true},{"text":"169","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"17","is_correct":false,"misconception_token":"added-legs"},{"text":"$\\sqrt{119}$","is_correct":false,"misconception_token":"subtracted-squares"}]$q$::jsonb, $q$13$q$, $q$By the Pythagorean theorem, $5^2 + 12^2 = 25 + 144 = 169$, so the hypotenuse is $\sqrt{169} = 13$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cb2f1a3a-bbb5-57db-a7ad-8df2431fefeb',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'easy',
   $q$Two triangles are similar. A side of length $4$ in the smaller triangle corresponds to a side of length $12$ in the larger triangle. What is the scale factor from the smaller to the larger triangle?$q$, $q$[{"text":"$\\frac{1}{3}$","is_correct":false,"misconception_token":"inverted-ratio"},{"text":"3","is_correct":true},{"text":"48","is_correct":false,"misconception_token":"multiplied-lengths"},{"text":"8","is_correct":false,"misconception_token":"subtracted-lengths"}]$q$::jsonb, $q$3$q$, $q$The scale factor is the ratio of the larger side to the smaller side: $\frac{12}{4} = 3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a71d451b-f934-5798-b731-5d074887c3fe',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'easy',
   $q$Two triangles are similar. A side of length $5$ in the smaller triangle corresponds to a side of length $10$ in the larger triangle. Another side of the smaller triangle has length $7$. What is the length of the corresponding side in the larger triangle?$q$, $q$[{"text":"14","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"added-scale-difference"},{"text":"3.5","is_correct":false,"misconception_token":"divided-instead-of-multiplied"},{"text":"9","is_correct":false,"misconception_token":"added-scale-factor"}]$q$::jsonb, $q$14$q$, $q$The scale factor is $\frac{10}{5} = 2$, so the corresponding side is $7 \times 2 = 14$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('70b7c7ac-88ad-5e58-993e-925b9b3a3078',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'easy',
   $q$In a right triangle, the side opposite angle $A$ has length $3$ and the hypotenuse has length $5$. What is $\sin A$?$q$, $q$[{"text":"$\\frac{5}{3}$","is_correct":false,"misconception_token":"inverted-ratio"},{"text":"$\\frac{3}{4}$","is_correct":false,"misconception_token":"used-tangent-ratio"},{"text":"$\\frac{4}{5}$","is_correct":false,"misconception_token":"used-adjacent-cosine"},{"text":"$\\frac{3}{5}$","is_correct":true}]$q$::jsonb, $q$$\frac{3}{5}$$q$, $q$Sine is opposite over hypotenuse, so $\sin A = \frac{3}{5}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('196ac724-1331-5d2d-b59e-0b85248e3c97',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'easy',
   $q$In a right triangle, the side opposite angle $B$ has length $4$ and the side adjacent to angle $B$ has length $3$. What is $\tan B$?$q$, $q$[{"text":"$\\frac{3}{5}$","is_correct":false,"misconception_token":"used-hypotenuse-cosine"},{"text":"$\\frac{4}{5}$","is_correct":false,"misconception_token":"used-hypotenuse-sine"},{"text":"$\\frac{3}{4}$","is_correct":false,"misconception_token":"inverted-ratio"},{"text":"$\\frac{4}{3}$","is_correct":true}]$q$::jsonb, $q$$\frac{4}{3}$$q$, $q$Tangent is opposite over adjacent, so $\tan B = \frac{4}{3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f176703f-e552-5a5b-b2f5-4e3faf6b0467',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'easy',
   $q$A $45^\circ$-$45^\circ$-$90^\circ$ triangle has legs of length $7$. What is the length of the hypotenuse?$q$, $q$[{"text":"7","is_correct":false,"misconception_token":"used-leg-length"},{"text":"14","is_correct":false,"misconception_token":"doubled-leg"},{"text":"$7\\sqrt{2}$","is_correct":true},{"text":"$\\frac{7}{\\sqrt{2}}$","is_correct":false,"misconception_token":"divided-by-root-two"}]$q$::jsonb, $q$$7\sqrt{2}$$q$, $q$In a $45^\circ$-$45^\circ$-$90^\circ$ triangle the hypotenuse is a leg times $\sqrt{2}$, so it is $7\sqrt{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('074b5447-bad0-5274-ae8b-ed60d93532a7',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'easy',
   $q$In a $30^\circ$-$60^\circ$-$90^\circ$ triangle, the hypotenuse has length $10$. What is the length of the side opposite the $30^\circ$ angle?$q$, $q$[{"text":"20","is_correct":false,"misconception_token":"doubled-hypotenuse"},{"text":"$10\\sqrt{3}$","is_correct":false,"misconception_token":"multiplied-by-root-three"},{"text":"5","is_correct":true},{"text":"$5\\sqrt{3}$","is_correct":false,"misconception_token":"used-long-leg"}]$q$::jsonb, $q$5$q$, $q$The side opposite the $30^\circ$ angle is half the hypotenuse: $\frac{10}{2} = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('59c5f7f0-a9ae-5958-9315-bf781ff2dc27',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'medium',
   $q$A right triangle has a hypotenuse of length $13$ and one leg of length $5$. What is the length of the other leg?$q$, $q$[{"text":"12","is_correct":true},{"text":"$\\sqrt{194}$","is_correct":false,"misconception_token":"added-squares"},{"text":"144","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"8","is_correct":false,"misconception_token":"subtracted-lengths"}]$q$::jsonb, $q$12$q$, $q$The missing leg is $\sqrt{13^2 - 5^2} = \sqrt{169 - 25} = \sqrt{144} = 12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e7752446-a04e-5185-b081-7dd2c351b75a',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'medium',
   $q$A $13$-foot ladder leans against a wall with its base $5$ feet from the wall. How high up the wall does the ladder reach?$q$, $q$[{"text":"8 feet","is_correct":false,"misconception_token":"subtracted-lengths"},{"text":"18 feet","is_correct":false,"misconception_token":"added-lengths"},{"text":"12 feet","is_correct":true},{"text":"144 feet","is_correct":false,"misconception_token":"forgot-square-root"}]$q$::jsonb, $q$12 feet$q$, $q$The wall height is $\sqrt{13^2 - 5^2} = \sqrt{169 - 25} = \sqrt{144} = 12$ feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1e346d37-1062-5a97-bf56-235ec30a358c',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'medium',
   $q$A $4$-foot-tall person casts a $6$-foot shadow. At the same time, a nearby tree casts a $24$-foot shadow. How tall is the tree?$q$, $q$[{"text":"36 feet","is_correct":false,"misconception_token":"inverted-ratio"},{"text":"24 feet","is_correct":false,"misconception_token":"used-shadow-as-height"},{"text":"16 feet","is_correct":true},{"text":"34 feet","is_correct":false,"misconception_token":"added-all-lengths"}]$q$::jsonb, $q$16 feet$q$, $q$The triangles are similar, so $\frac{4}{6} = \frac{h}{24}$, giving $h = \frac{4 \times 24}{6} = 16$ feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4ff17a95-eaee-5713-b0b1-d7fbe76bd00c',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'medium',
   $q$Two triangles are similar with a scale factor of $3$. The smaller triangle has a perimeter of $12$. What is the perimeter of the larger triangle?$q$, $q$[{"text":"108","is_correct":false,"misconception_token":"used-area-factor"},{"text":"15","is_correct":false,"misconception_token":"added-scale-factor"},{"text":"4","is_correct":false,"misconception_token":"divided-instead-of-multiplied"},{"text":"36","is_correct":true}]$q$::jsonb, $q$36$q$, $q$Perimeter scales by the same factor as the sides, so the larger perimeter is $12 \times 3 = 36$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('afa40cc4-9c01-5476-a417-a23d441cbe2f',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'medium',
   $q$In a right triangle, one acute angle measures $30^\circ$ and the hypotenuse has length $12$. What is the length of the side opposite the $30^\circ$ angle?$q$, $q$[{"text":"$6\\sqrt{3}$","is_correct":false,"misconception_token":"used-adjacent-side"},{"text":"6","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"divided-by-half"},{"text":"$12\\sqrt{3}$","is_correct":false,"misconception_token":"multiplied-by-root-three"}]$q$::jsonb, $q$6$q$, $q$The opposite side is $12 \sin 30^\circ = 12 \times \frac{1}{2} = 6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0ffde9d8-a64d-52b2-a56f-3106f6e99b8a',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'medium',
   $q$From a point on the ground, the angle of elevation to the top of a flagpole is $45^\circ$. The point is $30$ feet from the base of the flagpole. How tall is the flagpole?$q$, $q$[{"text":"60 feet","is_correct":false,"misconception_token":"doubled-distance"},{"text":"$30\\sqrt{2}$ feet","is_correct":false,"misconception_token":"used-hypotenuse-relationship"},{"text":"30 feet","is_correct":true},{"text":"15 feet","is_correct":false,"misconception_token":"halved-distance"}]$q$::jsonb, $q$30 feet$q$, $q$The height is $30 \tan 45^\circ = 30 \times 1 = 30$ feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8c41c08c-4009-5dac-9f40-7d0fc6b6be53',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'medium',
   $q$Two triangles are similar. The first triangle has sides $8$, $12$, and $16$. In the second triangle, the side corresponding to $8$ has length $12$. What is the length of the side corresponding to $16$?$q$, $q$[{"text":"32","is_correct":false,"misconception_token":"doubled-side"},{"text":"20","is_correct":false,"misconception_token":"added-difference"},{"text":"$\\frac{32}{3}$","is_correct":false,"misconception_token":"inverted-ratio"},{"text":"24","is_correct":true}]$q$::jsonb, $q$24$q$, $q$The scale factor is $\frac{12}{8} = \frac{3}{2}$, so the side is $16 \times \frac{3}{2} = 24$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ea2bf1e3-f169-5e65-9703-a59594b8570c',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'medium',
   $q$A person walks $9$ meters east and then $12$ meters north. How far is the person from the starting point?$q$, $q$[{"text":"15 meters","is_correct":true},{"text":"$\\sqrt{63}$ meters","is_correct":false,"misconception_token":"subtracted-squares"},{"text":"225 meters","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"21 meters","is_correct":false,"misconception_token":"added-lengths"}]$q$::jsonb, $q$15 meters$q$, $q$The distance is $\sqrt{9^2 + 12^2} = \sqrt{81 + 144} = \sqrt{225} = 15$ meters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c9c39b78-adde-512f-8aec-aed4877cd68c',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'hard',
   $q$In a $30^\circ$-$60^\circ$-$90^\circ$ triangle, the hypotenuse has length $8$. What is the length of the side opposite the $60^\circ$ angle?$q$, $q$[{"text":"$4\\sqrt{2}$","is_correct":false,"misconception_token":"used-45-45-90-ratio"},{"text":"$8\\sqrt{3}$","is_correct":false,"misconception_token":"multiplied-hypotenuse-by-root-three"},{"text":"4","is_correct":false,"misconception_token":"used-short-leg"},{"text":"$4\\sqrt{3}$","is_correct":true}]$q$::jsonb, $q$$4\sqrt{3}$$q$, $q$The side opposite $60^\circ$ is $8 \sin 60^\circ = 8 \times \frac{\sqrt{3}}{2} = 4\sqrt{3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4aae20d9-138a-5667-9799-3a51db20eef6',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'hard',
   $q$A vertical pole is $15$ feet tall. When the sun's angle of elevation is $60^\circ$, how long is the pole's shadow on the ground?$q$, $q$[{"text":"$5\\sqrt{3}$ feet","is_correct":true},{"text":"$15\\sqrt{3}$ feet","is_correct":false,"misconception_token":"multiplied-instead-of-divided"},{"text":"$\\frac{15}{2}$ feet","is_correct":false,"misconception_token":"used-sine-half"},{"text":"15 feet","is_correct":false,"misconception_token":"used-45-degrees"}]$q$::jsonb, $q$$5\sqrt{3}$ feet$q$, $q$Since $\tan 60^\circ = \frac{15}{\text{shadow}}$, the shadow is $\frac{15}{\sqrt{3}} = 5\sqrt{3}$ feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('24055e05-e807-594a-949d-5fd77c247eea',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'hard',
   $q$A rectangular field is $30$ meters long and $40$ meters wide. What is the length of the diagonal path across the field?$q$, $q$[{"text":"70 meters","is_correct":false,"misconception_token":"added-lengths"},{"text":"2500 meters","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"50 meters","is_correct":true},{"text":"10 meters","is_correct":false,"misconception_token":"subtracted-lengths"}]$q$::jsonb, $q$50 meters$q$, $q$The diagonal is $\sqrt{30^2 + 40^2} = \sqrt{900 + 1600} = \sqrt{2500} = 50$ meters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('64d760cd-7c57-5096-a506-26ca64c04a35',
   null,
   (select id from public.skills where slug = 'similarity-right-triangles'),
   'geometry-trigonometry', 'hard',
   $q$A guy wire runs from the top of a $12$-meter pole to a point on the ground $5$ meters from the base of the pole. If $\theta$ is the angle the wire makes with the ground, what is $\cos\theta$?$q$, $q$[{"text":"$\\frac{5}{13}$","is_correct":true},{"text":"$\\frac{5}{12}$","is_correct":false,"misconception_token":"used-tangent-ratio"},{"text":"$\\frac{13}{5}$","is_correct":false,"misconception_token":"inverted-ratio"},{"text":"$\\frac{12}{13}$","is_correct":false,"misconception_token":"used-opposite-sine"}]$q$::jsonb, $q$$\frac{5}{13}$$q$, $q$The wire length is $\sqrt{12^2 + 5^2} = \sqrt{169} = 13$, so $\cos\theta = \frac{\text{adjacent}}{\text{hypotenuse}} = \frac{5}{13}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- circle-geometry (Circle Geometry, grade 10, CCSS.MATH.CONTENT.HSG.C.A.2) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b741e8b4-a651-5841-9746-320581cc6786',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'easy',
   $q$A circle has a diameter of $14$ cm. What is the length of its radius?$q$, $q$[{"text":"3.5 cm","is_correct":false,"misconception_token":"halved-twice"},{"text":"7 cm","is_correct":true},{"text":"14 cm","is_correct":false,"misconception_token":"used-diameter-as-radius"},{"text":"28 cm","is_correct":false,"misconception_token":"doubled-instead-of-halved"}]$q$::jsonb, $q$7 cm$q$, $q$The radius is half the diameter: $14 \div 2 = 7$ cm.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b3ae53f2-2d43-5b36-a247-04677bb721f0',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'easy',
   $q$A circle has a radius of $9$ in. What is the length of its diameter?$q$, $q$[{"text":"18 in","is_correct":true},{"text":"4.5 in","is_correct":false,"misconception_token":"halved-radius"},{"text":"9 in","is_correct":false,"misconception_token":"used-radius-as-diameter"},{"text":"81 in","is_correct":false,"misconception_token":"squared-radius"}]$q$::jsonb, $q$18 in$q$, $q$The diameter is twice the radius: $2 \times 9 = 18$ in.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('56f5ccd1-5f0d-5cd5-bb61-8559603d30b6',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'easy',
   $q$What is the circumference of a circle with radius $6$, left in terms of $\pi$?$q$, $q$[{"text":"$6\\pi$","is_correct":false,"misconception_token":"forgot-factor-2"},{"text":"$12\\pi$","is_correct":true},{"text":"$3\\pi$","is_correct":false,"misconception_token":"halved-radius"},{"text":"$36\\pi$","is_correct":false,"misconception_token":"used-area-formula"}]$q$::jsonb, $q$$12\pi$$q$, $q$Circumference is $2\pi r = 2\pi(6) = 12\pi$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('43e63cbb-cb0a-5f72-a7f5-8403aa9759a1',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'easy',
   $q$What is the area of a circle with radius $4$, left in terms of $\pi$?$q$, $q$[{"text":"$16\\pi$","is_correct":true},{"text":"$8\\pi$","is_correct":false,"misconception_token":"used-circumference-formula"},{"text":"$4\\pi$","is_correct":false,"misconception_token":"forgot-to-square-radius"},{"text":"$64\\pi$","is_correct":false,"misconception_token":"squared-diameter"}]$q$::jsonb, $q$$16\pi$$q$, $q$Area is $\pi r^2 = \pi(4)^2 = 16\pi$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('761ad5d8-244f-57c3-b578-4be2e1363b73',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'easy',
   $q$Using $\pi \approx 3.14$, what is the circumference of a circle with radius $10$?$q$, $q$[{"text":"31.4","is_correct":false,"misconception_token":"forgot-factor-2"},{"text":"20","is_correct":false,"misconception_token":"used-2r-only"},{"text":"314","is_correct":false,"misconception_token":"used-area-formula"},{"text":"62.8","is_correct":true}]$q$::jsonb, $q$62.8$q$, $q$Circumference is $2\pi r \approx 2(3.14)(10) = 62.8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3e3c3e20-112b-5f87-bdd2-7caa14428766',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'easy',
   $q$Using $\pi \approx 3.14$, what is the area of a circle with radius $5$?$q$, $q$[{"text":"314","is_correct":false,"misconception_token":"squared-diameter"},{"text":"15.7","is_correct":false,"misconception_token":"forgot-to-square-radius"},{"text":"31.4","is_correct":false,"misconception_token":"used-circumference-formula"},{"text":"78.5","is_correct":true}]$q$::jsonb, $q$78.5$q$, $q$Area is $\pi r^2 \approx 3.14(5)^2 = 3.14(25) = 78.5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('02c5d1ec-3035-5aed-8918-9cc0e3924b50',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'easy',
   $q$A central angle of a circle measures $70^\circ$. What is the measure of the arc it intercepts?$q$, $q$[{"text":"$140^\\circ$","is_correct":false,"misconception_token":"doubled-angle"},{"text":"$35^\\circ$","is_correct":false,"misconception_token":"applied-inscribed-halving"},{"text":"$70^\\circ$","is_correct":true},{"text":"$110^\\circ$","is_correct":false,"misconception_token":"used-supplement"}]$q$::jsonb, $q$$70^\circ$$q$, $q$An intercepted arc has the same measure as its central angle, so the arc is $70^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e8864d2c-b618-5744-8122-85b57ebbad14',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'easy',
   $q$A line is tangent to a circle at point $P$. What is the measure of the angle between the tangent line and the radius drawn to $P$?$q$, $q$[{"text":"$0^\\circ$","is_correct":false,"misconception_token":"assumed-parallel"},{"text":"$180^\\circ$","is_correct":false,"misconception_token":"used-straight-angle"},{"text":"$90^\\circ$","is_correct":true},{"text":"$45^\\circ$","is_correct":false,"misconception_token":"used-half-of-right-angle"}]$q$::jsonb, $q$$90^\circ$$q$, $q$A tangent line is perpendicular to the radius at the point of tangency, so the angle is $90^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2a25dd49-40d1-57b3-b1af-0e43f4942f53',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'medium',
   $q$A central angle intercepts the same arc as an inscribed angle. If the central angle is $80^\circ$, what is the inscribed angle?$q$, $q$[{"text":"$40^\\circ$","is_correct":true},{"text":"$80^\\circ$","is_correct":false,"misconception_token":"set-angles-equal"},{"text":"$20^\\circ$","is_correct":false,"misconception_token":"quartered-angle"},{"text":"$160^\\circ$","is_correct":false,"misconception_token":"doubled-instead-of-halved"}]$q$::jsonb, $q$$40^\circ$$q$, $q$An inscribed angle is half of the central angle on the same arc: $80 \div 2 = 40^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3353d533-6de2-56b4-bdf9-e102259bbf03',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'medium',
   $q$An inscribed angle intercepts an arc measuring $100^\circ$. What is the measure of the inscribed angle?$q$, $q$[{"text":"$100^\\circ$","is_correct":false,"misconception_token":"set-angle-equal-to-arc"},{"text":"$200^\\circ$","is_correct":false,"misconception_token":"doubled-the-arc"},{"text":"$50^\\circ$","is_correct":true},{"text":"$25^\\circ$","is_correct":false,"misconception_token":"quartered-the-arc"}]$q$::jsonb, $q$$50^\circ$$q$, $q$An inscribed angle is half its intercepted arc: $100 \div 2 = 50^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3aae90eb-2a1b-574f-a44c-24b74dab9966',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'medium',
   $q$A chord of length $24$ is drawn in a circle with radius $13$. How far is the chord from the center of the circle?$q$, $q$[{"text":"1","is_correct":false,"misconception_token":"subtracted-lengths"},{"text":"12","is_correct":false,"misconception_token":"used-half-chord-as-distance"},{"text":"5","is_correct":true},{"text":"25","is_correct":false,"misconception_token":"forgot-square-root"}]$q$::jsonb, $q$5$q$, $q$The perpendicular from the center bisects the chord, giving a right triangle with legs $d$ and $12$ and hypotenuse $13$: $d = \sqrt{13^2 - 12^2} = \sqrt{25} = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('26a5dfe0-1039-5342-943d-b0f7cb4d2f1d',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'medium',
   $q$A circular garden has a diameter of $20$ feet. Using $\pi \approx 3.14$, what is its circumference in feet?$q$, $q$[{"text":"314","is_correct":false,"misconception_token":"used-area-formula"},{"text":"31.4","is_correct":false,"misconception_token":"used-radius-in-formula"},{"text":"125.6","is_correct":false,"misconception_token":"doubled-diameter"},{"text":"62.8","is_correct":true}]$q$::jsonb, $q$62.8$q$, $q$Circumference is $\pi d \approx 3.14(20) = 62.8$ feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5d6ef8fd-c26f-5413-819f-543a021b320a',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'medium',
   $q$A circular pizza has a radius of $7$ inches. Using $\pi \approx 3.14$, what is its area in square inches?$q$, $q$[{"text":"43.96","is_correct":false,"misconception_token":"used-circumference-formula"},{"text":"153.86","is_correct":true},{"text":"615.44","is_correct":false,"misconception_token":"squared-diameter"},{"text":"21.98","is_correct":false,"misconception_token":"forgot-to-square-radius"}]$q$::jsonb, $q$153.86$q$, $q$Area is $\pi r^2 \approx 3.14(7)^2 = 3.14(49) = 153.86$ square inches.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c1ebf35b-2d65-52d8-9fcb-ccb0631f0396',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'medium',
   $q$A sector has a central angle of $90^\circ$ in a circle of radius $10$. What is the arc length of the sector, in terms of $\pi$?$q$, $q$[{"text":"$2.5\\pi$","is_correct":false,"misconception_token":"forgot-factor-2"},{"text":"$25\\pi$","is_correct":false,"misconception_token":"used-area-formula"},{"text":"$5\\pi$","is_correct":true},{"text":"$20\\pi$","is_correct":false,"misconception_token":"ignored-central-angle"}]$q$::jsonb, $q$$5\pi$$q$, $q$Arc length is $\frac{90}{360} \times 2\pi r = \frac{1}{4}(2\pi)(10) = 5\pi$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e40abbe5-d452-5825-8904-f7a394129cba',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'medium',
   $q$A sector has a central angle of $120^\circ$ in a circle of radius $6$. What is the area of the sector, in terms of $\pi$?$q$, $q$[{"text":"$2\\pi$","is_correct":false,"misconception_token":"forgot-to-square-radius"},{"text":"$4\\pi$","is_correct":false,"misconception_token":"used-arc-length-formula"},{"text":"$36\\pi$","is_correct":false,"misconception_token":"ignored-central-angle"},{"text":"$12\\pi$","is_correct":true}]$q$::jsonb, $q$$12\pi$$q$, $q$Sector area is $\frac{120}{360} \times \pi r^2 = \frac{1}{3}\pi(6)^2 = \frac{1}{3}(36\pi) = 12\pi$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('61eb43af-ff26-5db1-b026-7e9048a2c973',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'medium',
   $q$From a point $13$ units from the center of a circle, a tangent line is drawn to the circle. If the radius is $5$, how long is the tangent segment from the external point to the point of tangency?$q$, $q$[{"text":"12","is_correct":true},{"text":"18","is_correct":false,"misconception_token":"added-radius-to-distance"},{"text":"144","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"8","is_correct":false,"misconception_token":"subtracted-radius-from-distance"}]$q$::jsonb, $q$12$q$, $q$The tangent is perpendicular to the radius, forming a right triangle with legs $t$ and $5$ and hypotenuse $13$: $t = \sqrt{13^2 - 5^2} = \sqrt{144} = 12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('839a2b88-563c-559b-968c-b3618d3042c2',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'hard',
   $q$In a circle, $AB$ is a diameter and $C$ is a point on the circle. If $\angle A = 35^\circ$, what is the measure of $\angle B$ in triangle $ABC$?$q$, $q$[{"text":"$35^\\circ$","is_correct":false,"misconception_token":"set-equal-to-given"},{"text":"$145^\\circ$","is_correct":false,"misconception_token":"took-supplement-of-given"},{"text":"$90^\\circ$","is_correct":false,"misconception_token":"chose-the-right-angle"},{"text":"$55^\\circ$","is_correct":true}]$q$::jsonb, $q$$55^\circ$$q$, $q$An angle inscribed in a semicircle is a right angle, so $\angle C = 90^\circ$. Then $\angle B = 180 - 90 - 35 = 55^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('671349fe-5724-57d9-8031-c82c3ac3c481',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'hard',
   $q$A quadrilateral is inscribed in a circle. One angle measures $110^\circ$. What is the measure of the angle opposite to it?$q$, $q$[{"text":"$70^\\circ$","is_correct":true},{"text":"$110^\\circ$","is_correct":false,"misconception_token":"set-opposite-angles-equal"},{"text":"$90^\\circ$","is_correct":false,"misconception_token":"assumed-right-angle"},{"text":"$250^\\circ$","is_correct":false,"misconception_token":"used-360-instead-of-180"}]$q$::jsonb, $q$$70^\circ$$q$, $q$Opposite angles of a cyclic quadrilateral are supplementary: $180 - 110 = 70^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d1f6cf3b-1116-5610-aed3-051d7b87b3ef',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'hard',
   $q$A circular running track has a radius of $50$ meters. A runner travels three-quarters of the way around the track. Using $\pi \approx 3.14$, how many meters does the runner travel?$q$, $q$[{"text":"314","is_correct":false,"misconception_token":"used-whole-circumference"},{"text":"78.5","is_correct":false,"misconception_token":"used-one-quarter"},{"text":"235.5","is_correct":true},{"text":"157","is_correct":false,"misconception_token":"used-one-half"}]$q$::jsonb, $q$235.5$q$, $q$Full circumference is $2\pi r \approx 2(3.14)(50) = 314$; three-quarters is $\frac{3}{4}(314) = 235.5$ meters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2e41c62a-9515-5196-acd3-fa2244bab7a6',
   null,
   (select id from public.skills where slug = 'circle-geometry'),
   'geometry-trigonometry', 'hard',
   $q$Two chords intersect inside a circle. They intercept arcs measuring $70^\circ$ and $30^\circ$. What is the measure of the angle formed at their intersection?$q$, $q$[{"text":"$50^\\circ$","is_correct":true},{"text":"$20^\\circ$","is_correct":false,"misconception_token":"used-difference-instead-of-sum"},{"text":"$70^\\circ$","is_correct":false,"misconception_token":"used-single-arc"},{"text":"$100^\\circ$","is_correct":false,"misconception_token":"forgot-to-halve"}]$q$::jsonb, $q$$50^\circ$$q$, $q$The angle formed by two intersecting chords is half the sum of the intercepted arcs: $\frac{1}{2}(70 + 30) = \frac{1}{2}(100) = 50^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- coordinate-geometry (Coordinate Geometry, grade 10, CCSS.MATH.CONTENT.HSG.GPE.B.7) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9ce864da-01f8-5bb1-8a93-639545780c23',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'easy',
   $q$What is the distance between the points $(0,0)$ and $(3,4)$?$q$, $q$[{"text":"$\\sqrt{7}$","is_correct":false,"misconception_token":"rooted-sum-of-legs"},{"text":"5","is_correct":true},{"text":"25","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"7","is_correct":false,"misconception_token":"added-legs"}]$q$::jsonb, $q$5$q$, $q$Distance $=\sqrt{(3-0)^2+(4-0)^2}=\sqrt{9+16}=\sqrt{25}=5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3db0880a-b039-5465-bc9c-a133b9fd5300',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'easy',
   $q$What is the midpoint of the segment joining $(2,3)$ and $(8,7)$?$q$, $q$[{"text":"$(5,5)$","is_correct":true},{"text":"$(6,4)$","is_correct":false,"misconception_token":"used-difference"},{"text":"$(10,10)$","is_correct":false,"misconception_token":"summed-without-halving"},{"text":"$(3,2)$","is_correct":false,"misconception_token":"used-difference-halved"}]$q$::jsonb, $q$$(5,5)$$q$, $q$Midpoint $=\left(\frac{2+8}{2},\frac{3+7}{2}\right)=(5,5)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('22a148c6-51ca-5d84-86f4-3201179a374a',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'easy',
   $q$What is the slope of the line through $(1,2)$ and $(4,8)$?$q$, $q$[{"text":"-2","is_correct":false,"misconception_token":"sign-error"},{"text":"2","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"used-rise-only"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"inverted-slope"}]$q$::jsonb, $q$2$q$, $q$Slope $=\frac{8-2}{4-1}=\frac{6}{3}=2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('32554117-0df5-5390-b474-674b5e0f7739',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'easy',
   $q$What is the distance between $(2,5)$ and $(2,-3)$?$q$, $q$[{"text":"8","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"dropped-negative"},{"text":"-8","is_correct":false,"misconception_token":"kept-sign-in-distance"},{"text":"64","is_correct":false,"misconception_token":"forgot-square-root"}]$q$::jsonb, $q$8$q$, $q$The points share the same $x$-value, so distance $=|5-(-3)|=8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e64c46cd-3746-5776-b2bc-446c96d267e0',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'easy',
   $q$What is the midpoint of the segment joining $(-4,2)$ and $(6,-8)$?$q$, $q$[{"text":"$(2,-6)$","is_correct":false,"misconception_token":"summed-without-halving"},{"text":"$(-1,3)$","is_correct":false,"misconception_token":"flipped-signs"},{"text":"$(5,-5)$","is_correct":false,"misconception_token":"used-difference"},{"text":"$(1,-3)$","is_correct":true}]$q$::jsonb, $q$$(1,-3)$$q$, $q$Midpoint $=\left(\frac{-4+6}{2},\frac{2+(-8)}{2}\right)=(1,-3)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('68cd51f7-4c1a-5d55-b041-35c41da88275',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'easy',
   $q$What is the slope of the line through $(-2,3)$ and $(4,-9)$?$q$, $q$[{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"inverted-and-dropped-negative"},{"text":"$-\\frac{1}{2}$","is_correct":false,"misconception_token":"inverted-slope"},{"text":"2","is_correct":false,"misconception_token":"dropped-negative"},{"text":"-2","is_correct":true}]$q$::jsonb, $q$-2$q$, $q$Slope $=\frac{-9-3}{4-(-2)}=\frac{-12}{6}=-2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f164fe4f-8c5b-5ed5-acc3-c7266631d7e1',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'easy',
   $q$A line has slope $3$. What is the slope of any line parallel to it?$q$, $q$[{"text":"-3","is_correct":false,"misconception_token":"negated-slope"},{"text":"$-\\frac{1}{3}$","is_correct":false,"misconception_token":"used-perpendicular-slope"},{"text":"3","is_correct":true},{"text":"$\\frac{1}{3}$","is_correct":false,"misconception_token":"used-reciprocal"}]$q$::jsonb, $q$3$q$, $q$Parallel lines have equal slopes, so the slope is $3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ef33c414-194d-509c-a744-4b89363df9dd',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'easy',
   $q$A line has slope $\frac{2}{5}$. What is the slope of any line perpendicular to it?$q$, $q$[{"text":"$\\frac{2}{5}$","is_correct":false,"misconception_token":"used-same-slope"},{"text":"$\\frac{5}{2}$","is_correct":false,"misconception_token":"forgot-negative-reciprocal"},{"text":"$-\\frac{5}{2}$","is_correct":true},{"text":"$-\\frac{2}{5}$","is_correct":false,"misconception_token":"negated-not-reciprocal"}]$q$::jsonb, $q$$-\frac{5}{2}$$q$, $q$The perpendicular slope is the negative reciprocal of $\frac{2}{5}$, which is $-\frac{5}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b83818a9-2306-548d-87e6-30b52a0e9a3a',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'medium',
   $q$What is the distance between $(0,0)$ and $(2,2)$?$q$, $q$[{"text":"$2\\sqrt{2}$","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"2","is_correct":false,"misconception_token":"used-single-difference"},{"text":"4","is_correct":false,"misconception_token":"added-legs"}]$q$::jsonb, $q$$2\sqrt{2}$$q$, $q$Distance $=\sqrt{2^2+2^2}=\sqrt{8}=2\sqrt{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9f94b135-02b1-5e98-8549-a93b6f156b31',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'medium',
   $q$A straight path connects a school at $(3,4)$ and a library at $(11,10)$. A bus stop is placed at the midpoint of the path. What are its coordinates?$q$, $q$[{"text":"$(14,14)$","is_correct":false,"misconception_token":"summed-without-halving"},{"text":"$(8,6)$","is_correct":false,"misconception_token":"used-difference"},{"text":"$(7,7)$","is_correct":true},{"text":"$(4,3)$","is_correct":false,"misconception_token":"used-difference-halved"}]$q$::jsonb, $q$$(7,7)$$q$, $q$Midpoint $=\left(\frac{3+11}{2},\frac{4+10}{2}\right)=(7,7)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a849547a-743c-5d8b-9f05-84f587b2270f',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'medium',
   $q$A ramp rises in a straight line from the point $(2,1)$ to the point $(10,7)$. What is the slope of the ramp?$q$, $q$[{"text":"$-\\frac{4}{3}$","is_correct":false,"misconception_token":"inverted-and-negated"},{"text":"$\\frac{4}{3}$","is_correct":false,"misconception_token":"inverted-slope"},{"text":"$\\frac{3}{4}$","is_correct":true},{"text":"$-\\frac{3}{4}$","is_correct":false,"misconception_token":"sign-error"}]$q$::jsonb, $q$$\frac{3}{4}$$q$, $q$Slope $=\frac{7-1}{10-2}=\frac{6}{8}=\frac{3}{4}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cd35efda-05c8-559b-81d5-2824526d35d4',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'medium',
   $q$Line $j$ passes through $(0,0)$ and $(2,6)$. Line $k$ passes through $(0,1)$ and $(3,0)$. What is the relationship between the two lines?$q$, $q$[{"text":"Neither parallel nor perpendicular","is_correct":false,"misconception_token":"missed-negative-reciprocal"},{"text":"Parallel","is_correct":false,"misconception_token":"assumed-equal-slopes"},{"text":"The same line","is_correct":false,"misconception_token":"assumed-coincident"},{"text":"Perpendicular","is_correct":true}]$q$::jsonb, $q$Perpendicular$q$, $q$Line $j$ has slope $\frac{6}{2}=3$ and line $k$ has slope $\frac{0-1}{3-0}=-\frac{1}{3}$; since $3\cdot\left(-\frac{1}{3}\right)=-1$, the lines are perpendicular.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b8ef5c05-a3d0-5de0-8493-76d761c8b040',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'medium',
   $q$A rectangle has vertices $(1,1)$, $(6,1)$, $(6,4)$, and $(1,4)$. What is its perimeter?$q$, $q$[{"text":"15","is_correct":false,"misconception_token":"computed-area"},{"text":"16","is_correct":true},{"text":"30","is_correct":false,"misconception_token":"doubled-area"},{"text":"8","is_correct":false,"misconception_token":"added-sides-once"}]$q$::jsonb, $q$16$q$, $q$The width is $6-1=5$ and the height is $4-1=3$, so the perimeter is $2(5+3)=16$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6a620b92-8022-5f0d-a667-657c5973247d',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'medium',
   $q$A triangle has vertices $(0,0)$, $(6,0)$, and $(0,4)$. What is its area?$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"half-of-sum"},{"text":"24","is_correct":false,"misconception_token":"forgot-one-half"},{"text":"12","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"added-legs"}]$q$::jsonb, $q$12$q$, $q$The legs along the axes have lengths $6$ and $4$, so area $=\frac{1}{2}\cdot 6\cdot 4=12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b30112a2-c100-52d9-8783-eb362a0da938',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'medium',
   $q$On a map grid, a drone flies in a straight line from $(1,2)$ to $(5,5)$. How many units does it travel?$q$, $q$[{"text":"$\\sqrt{7}$","is_correct":false,"misconception_token":"rooted-sum-of-legs"},{"text":"7","is_correct":false,"misconception_token":"added-legs"},{"text":"25","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"5","is_correct":true}]$q$::jsonb, $q$5$q$, $q$Distance $=\sqrt{(5-1)^2+(5-2)^2}=\sqrt{16+9}=\sqrt{25}=5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5fb104f1-7ae9-599c-bd64-e681a84c4fae',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'medium',
   $q$The midpoint of segment $AB$ is $(4,3)$. If $A=(1,2)$, what are the coordinates of $B$?$q$, $q$[{"text":"$(7,4)$","is_correct":true},{"text":"$(5,5)$","is_correct":false,"misconception_token":"added-a-to-midpoint"},{"text":"$(2.5,2.5)$","is_correct":false,"misconception_token":"averaged-a-and-midpoint"},{"text":"$(3,1)$","is_correct":false,"misconception_token":"subtracted-a-from-midpoint"}]$q$::jsonb, $q$$(7,4)$$q$, $q$Set $\frac{1+x}{2}=4$ and $\frac{2+y}{2}=3$, giving $x=7$ and $y=4$, so $B=(7,4)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('149df59b-650c-52be-96f3-156243a655c4',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'hard',
   $q$A triangle has vertices $(0,0)$, $(3,0)$, and $(0,3)$. What is its perimeter?$q$, $q$[{"text":"24","is_correct":false,"misconception_token":"forgot-square-root-hypotenuse"},{"text":"$3+3\\sqrt{2}$","is_correct":false,"misconception_token":"missed-one-leg"},{"text":"12","is_correct":false,"misconception_token":"added-legs-as-hypotenuse"},{"text":"$6+3\\sqrt{2}$","is_correct":true}]$q$::jsonb, $q$$6+3\sqrt{2}$$q$, $q$The two legs each have length $3$ and the hypotenuse is $\sqrt{3^2+3^2}=3\sqrt{2}$, so the perimeter is $6+3\sqrt{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cf59234e-0c1b-544d-81ee-40648d271933',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'hard',
   $q$A parking lot is shaped like a parallelogram with vertices $(1,1)$, $(5,1)$, $(6,4)$, and $(2,4)$. What is its area?$q$, $q$[{"text":"12","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"used-y-coordinate-as-height"},{"text":"24","is_correct":false,"misconception_token":"doubled-the-area"},{"text":"7","is_correct":false,"misconception_token":"added-base-and-height"}]$q$::jsonb, $q$12$q$, $q$The base from $(1,1)$ to $(5,1)$ has length $4$ and the vertical height between $y=1$ and $y=4$ is $3$, so area $=4\cdot 3=12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1acfcb71-8f24-523e-b242-8368a98d10b7',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'hard',
   $q$Points $A(-2,1)$, $B(2,3)$, and $C(4,k)$ are given. For what value of $k$ is segment $BC$ perpendicular to segment $AB$?$q$, $q$[{"text":"4","is_correct":false,"misconception_token":"used-parallel-slope"},{"text":"7","is_correct":false,"misconception_token":"forgot-negative-reciprocal"},{"text":"-1","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"negated-not-reciprocal"}]$q$::jsonb, $q$-1$q$, $q$Slope $AB=\frac{3-1}{2-(-2)}=\frac{1}{2}$, so $BC$ needs slope $-2$; solving $\frac{k-3}{4-2}=-2$ gives $k=-1$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('13690fa5-84cb-56fe-a640-61cb96ab9983',
   null,
   (select id from public.skills where slug = 'coordinate-geometry'),
   'geometry-trigonometry', 'hard',
   $q$A triangular garden has corners at $(2,1)$, $(8,1)$, and $(4,6)$. What is its area?$q$, $q$[{"text":"15","is_correct":true},{"text":"11","is_correct":false,"misconception_token":"added-base-and-height"},{"text":"18","is_correct":false,"misconception_token":"used-y-coordinate-as-height"},{"text":"30","is_correct":false,"misconception_token":"forgot-one-half"}]$q$::jsonb, $q$15$q$, $q$The base from $(2,1)$ to $(8,1)$ has length $6$ and the height from $y=1$ up to $y=6$ is $5$, so area $=\frac{1}{2}\cdot 6\cdot 5=15$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- trigonometric-functions (Trigonometric Functions, grade 12, CCSS.MATH.CONTENT.HSF.TF.A.2) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('32af6a9a-28a7-54a7-a3e2-86ece4bd82c1',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'easy',
   $q$Convert $180^\circ$ to radians.$q$, $q$[{"text":"$180\\pi$","is_correct":false,"misconception_token":"forgot-to-divide-by-180"},{"text":"$\\pi$","is_correct":true},{"text":"$2\\pi$","is_correct":false,"misconception_token":"used-360-not-180"},{"text":"$\\frac{\\pi}{2}$","is_correct":false,"misconception_token":"confused-with-90-degrees"}]$q$::jsonb, $q$$\pi$$q$, $q$Multiply by $\frac{\pi}{180}$: $180 \times \frac{\pi}{180} = \pi$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('12fc2393-4670-53a5-bdf9-b0b188df9ce6',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'easy',
   $q$Convert $90^\circ$ to radians.$q$, $q$[{"text":"$\\frac{\\pi}{2}$","is_correct":true},{"text":"$\\frac{\\pi}{4}$","is_correct":false,"misconception_token":"halved-twice"},{"text":"$\\pi$","is_correct":false,"misconception_token":"used-180-not-90"},{"text":"$90\\pi$","is_correct":false,"misconception_token":"forgot-to-divide-by-180"}]$q$::jsonb, $q$$\frac{\pi}{2}$$q$, $q$Multiply by $\frac{\pi}{180}$: $90 \times \frac{\pi}{180} = \frac{\pi}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2fbdff14-7518-5439-8a98-7c9e9ee96323',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'easy',
   $q$Convert $\frac{\pi}{6}$ radians to degrees.$q$, $q$[{"text":"$45^\\circ$","is_correct":false,"misconception_token":"confused-with-pi-over-4"},{"text":"$30^\\circ$","is_correct":true},{"text":"$15^\\circ$","is_correct":false,"misconception_token":"halved-the-result"},{"text":"$60^\\circ$","is_correct":false,"misconception_token":"confused-pi-over-6-with-pi-over-3"}]$q$::jsonb, $q$$30^\circ$$q$, $q$Multiply by $\frac{180}{\pi}$: $\frac{\pi}{6} \times \frac{180}{\pi} = 30^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5c5c3dd9-d9a6-5098-ac02-defbd8f73178',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'easy',
   $q$What is $\sin 30^\circ$?$q$, $q$[{"text":"$\\frac{1}{2}$","is_correct":true},{"text":"$\\frac{\\sqrt{3}}{2}$","is_correct":false,"misconception_token":"used-cosine-value"},{"text":"$\\frac{\\sqrt{2}}{2}$","is_correct":false,"misconception_token":"used-forty-five-value"},{"text":"$1$","is_correct":false,"misconception_token":"used-ninety-value"}]$q$::jsonb, $q$$\frac{1}{2}$$q$, $q$On the unit circle, $\sin 30^\circ = \frac{1}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6dbe6e3a-721c-5065-af91-071afa8d23a9',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'easy',
   $q$What is $\cos 60^\circ$?$q$, $q$[{"text":"$\\frac{\\sqrt{3}}{2}$","is_correct":false,"misconception_token":"used-cosine-of-thirty"},{"text":"$0$","is_correct":false,"misconception_token":"used-ninety-value"},{"text":"$\\frac{\\sqrt{2}}{2}$","is_correct":false,"misconception_token":"used-forty-five-value"},{"text":"$\\frac{1}{2}$","is_correct":true}]$q$::jsonb, $q$$\frac{1}{2}$$q$, $q$On the unit circle, $\cos 60^\circ = \frac{1}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('60b1c6ce-f66b-5178-943f-fcb64aed0790',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'easy',
   $q$What is $\tan 45^\circ$?$q$, $q$[{"text":"$\\frac{\\sqrt{3}}{3}$","is_correct":false,"misconception_token":"used-thirty-value"},{"text":"$\\sqrt{3}$","is_correct":false,"misconception_token":"used-sixty-value"},{"text":"$0$","is_correct":false,"misconception_token":"used-zero-value"},{"text":"$1$","is_correct":true}]$q$::jsonb, $q$$1$$q$, $q$$\tan 45^\circ = \frac{\sin 45^\circ}{\cos 45^\circ} = \frac{\sqrt{2}/2}{\sqrt{2}/2} = 1$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a2b618a6-c7f4-59dc-ba36-7ab8652528e6',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'easy',
   $q$What is $\cos 0^\circ$?$q$, $q$[{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"used-sixty-value"},{"text":"$0$","is_correct":false,"misconception_token":"confused-with-sine-of-zero"},{"text":"$1$","is_correct":true},{"text":"$-1$","is_correct":false,"misconception_token":"used-one-eighty-value"}]$q$::jsonb, $q$$1$$q$, $q$At $0^\circ$ the point on the unit circle is $(1, 0)$, so $\cos 0^\circ = 1$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4482b762-dbfa-5859-bbf1-6feed614b448',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'easy',
   $q$What is $\sin 90^\circ$?$q$, $q$[{"text":"$\\frac{\\sqrt{2}}{2}$","is_correct":false,"misconception_token":"used-forty-five-value"},{"text":"$0$","is_correct":false,"misconception_token":"confused-with-sine-of-zero"},{"text":"$1$","is_correct":true},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"used-thirty-value"}]$q$::jsonb, $q$$1$$q$, $q$At $90^\circ$ the point on the unit circle is $(0, 1)$, so $\sin 90^\circ = 1$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('99e36185-b5f4-5061-81c3-08fca89bf6c1',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'medium',
   $q$Convert $240^\circ$ to radians.$q$, $q$[{"text":"$\\frac{4\\pi}{3}$","is_correct":true},{"text":"$\\frac{2\\pi}{3}$","is_correct":false,"misconception_token":"used-one-twenty-degrees"},{"text":"$\\frac{3\\pi}{2}$","is_correct":false,"misconception_token":"used-two-seventy-degrees"},{"text":"$\\frac{5\\pi}{3}$","is_correct":false,"misconception_token":"used-three-hundred-degrees"}]$q$::jsonb, $q$$\frac{4\pi}{3}$$q$, $q$Multiply by $\frac{\pi}{180}$: $240 \times \frac{\pi}{180} = \frac{4\pi}{3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('879b9293-2037-5e03-bccc-bc0ade13cebe',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'medium',
   $q$Convert $\frac{5\pi}{4}$ radians to degrees.$q$, $q$[{"text":"$45^\\circ$","is_correct":false,"misconception_token":"ignored-the-coefficient"},{"text":"$135^\\circ$","is_correct":false,"misconception_token":"used-three-pi-over-four"},{"text":"$225^\\circ$","is_correct":true},{"text":"$315^\\circ$","is_correct":false,"misconception_token":"used-seven-pi-over-four"}]$q$::jsonb, $q$$225^\circ$$q$, $q$Multiply by $\frac{180}{\pi}$: $\frac{5\pi}{4} \times \frac{180}{\pi} = 5 \times 45 = 225^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c2c64621-c36a-5f26-b59b-67546be008d5',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'medium',
   $q$In which quadrant is $\sin\theta > 0$ and $\cos\theta < 0$?$q$, $q$[{"text":"Quadrant III","is_correct":false,"misconception_token":"both-functions-negative"},{"text":"Quadrant I","is_correct":false,"misconception_token":"both-functions-positive"},{"text":"Quadrant II","is_correct":true},{"text":"Quadrant IV","is_correct":false,"misconception_token":"cosine-positive-sine-negative"}]$q$::jsonb, $q$Quadrant II$q$, $q$Sine is positive above the $x$-axis and cosine is negative left of the $y$-axis, which together is Quadrant II.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1d816cc2-cd1c-51dc-88dc-1bb82f291104',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'medium',
   $q$What is $\sin 210^\circ$?$q$, $q$[{"text":"$-\\frac{\\sqrt{3}}{2}$","is_correct":false,"misconception_token":"used-sixty-reference"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"forgot-negative-sign"},{"text":"$\\frac{\\sqrt{3}}{2}$","is_correct":false,"misconception_token":"wrong-sign-and-reference"},{"text":"$-\\frac{1}{2}$","is_correct":true}]$q$::jsonb, $q$$-\frac{1}{2}$$q$, $q$$210^\circ$ is in Quadrant III with reference angle $30^\circ$, and sine is negative there, so $\sin 210^\circ = -\frac{1}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4351bdad-53f9-5460-a1c2-e9d17938df08',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'medium',
   $q$What is $\tan 120^\circ$?$q$, $q$[{"text":"$\\sqrt{3}$","is_correct":false,"misconception_token":"forgot-negative-sign"},{"text":"$-\\sqrt{3}$","is_correct":true},{"text":"$\\frac{\\sqrt{3}}{3}$","is_correct":false,"misconception_token":"wrong-sign-and-reference"},{"text":"$-\\frac{\\sqrt{3}}{3}$","is_correct":false,"misconception_token":"used-thirty-reference"}]$q$::jsonb, $q$$-\sqrt{3}$$q$, $q$$120^\circ$ is in Quadrant II with reference angle $60^\circ$, and tangent is negative there, so $\tan 120^\circ = -\sqrt{3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c7daffc2-8b27-5059-946b-da5d19fbb82f',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'medium',
   $q$What is $\cos 135^\circ$?$q$, $q$[{"text":"$-\\frac{\\sqrt{3}}{2}$","is_correct":false,"misconception_token":"used-thirty-reference"},{"text":"$\\frac{\\sqrt{2}}{2}$","is_correct":false,"misconception_token":"forgot-negative-sign"},{"text":"$-\\frac{\\sqrt{2}}{2}$","is_correct":true},{"text":"$-\\frac{1}{2}$","is_correct":false,"misconception_token":"used-sixty-reference"}]$q$::jsonb, $q$$-\frac{\sqrt{2}}{2}$$q$, $q$$135^\circ$ is in Quadrant II with reference angle $45^\circ$, and cosine is negative there, so $\cos 135^\circ = -\frac{\sqrt{2}}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('350ac853-92d8-59dd-b378-04853a85ee06',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'medium',
   $q$A right triangle has an acute angle $\theta$ with $\sin\theta = \frac{3}{5}$. What is $\cos\theta$?$q$, $q$[{"text":"$\\frac{16}{25}$","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"$-\\frac{4}{5}$","is_correct":false,"misconception_token":"chose-negative-root"},{"text":"$\\frac{2}{5}$","is_correct":false,"misconception_token":"subtracted-fractions-wrong"},{"text":"$\\frac{4}{5}$","is_correct":true}]$q$::jsonb, $q$$\frac{4}{5}$$q$, $q$Since $\theta$ is acute, $\cos\theta = \sqrt{1 - \sin^2\theta} = \sqrt{1 - \frac{9}{25}} = \sqrt{\frac{16}{25}} = \frac{4}{5}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ab7818c0-4620-5623-91ac-64cc6bdb82b9',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'medium',
   $q$A point on the unit circle corresponds to an angle of $60^\circ$. What is the $y$-coordinate of this point?$q$, $q$[{"text":"$\\frac{\\sqrt{3}}{2}$","is_correct":true},{"text":"$\\frac{\\sqrt{2}}{2}$","is_correct":false,"misconception_token":"used-forty-five-value"},{"text":"$1$","is_correct":false,"misconception_token":"used-radius-as-coordinate"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"gave-x-coordinate"}]$q$::jsonb, $q$$\frac{\sqrt{3}}{2}$$q$, $q$On the unit circle the $y$-coordinate equals the sine, so it is $\sin 60^\circ = \frac{\sqrt{3}}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4394e524-ebae-5a7b-80df-16817e35ed8a',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'hard',
   $q$Convert $\frac{7\pi}{12}$ radians to degrees.$q$, $q$[{"text":"$150^\\circ$","is_correct":false,"misconception_token":"used-five-pi-over-six"},{"text":"$210^\\circ$","is_correct":false,"misconception_token":"doubled-the-angle"},{"text":"$75^\\circ$","is_correct":false,"misconception_token":"used-five-pi-over-twelve"},{"text":"$105^\\circ$","is_correct":true}]$q$::jsonb, $q$$105^\circ$$q$, $q$Multiply by $\frac{180}{\pi}$: $\frac{7\pi}{12} \times \frac{180}{\pi} = 7 \times 15 = 105^\circ$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('32491d2b-ac08-52cd-9310-3f99ff25071f',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'hard',
   $q$What is $\tan 300^\circ$?$q$, $q$[{"text":"$-\\sqrt{3}$","is_correct":true},{"text":"$\\sqrt{3}$","is_correct":false,"misconception_token":"forgot-negative-sign"},{"text":"$\\frac{\\sqrt{3}}{3}$","is_correct":false,"misconception_token":"wrong-sign-and-reference"},{"text":"$-\\frac{\\sqrt{3}}{3}$","is_correct":false,"misconception_token":"used-thirty-reference"}]$q$::jsonb, $q$$-\sqrt{3}$$q$, $q$$300^\circ$ is in Quadrant IV with reference angle $60^\circ$, and tangent is negative there, so $\tan 300^\circ = -\sqrt{3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a81105d0-7021-5714-b7a2-ca892bbffad1',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'hard',
   $q$For an angle $\theta$ in Quadrant II, $\cos\theta = -\frac{4}{5}$. What is $\tan\theta$?$q$, $q$[{"text":"$\\frac{3}{4}$","is_correct":false,"misconception_token":"forgot-negative-sign"},{"text":"$-\\frac{4}{3}$","is_correct":false,"misconception_token":"inverted-the-ratio"},{"text":"$-\\frac{3}{4}$","is_correct":true},{"text":"$\\frac{4}{3}$","is_correct":false,"misconception_token":"inverted-and-wrong-sign"}]$q$::jsonb, $q$$-\frac{3}{4}$$q$, $q$In Quadrant II sine is positive, so $\sin\theta = \frac{3}{5}$, and $\tan\theta = \frac{\sin\theta}{\cos\theta} = \frac{3/5}{-4/5} = -\frac{3}{4}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('81edc9dd-966b-5b4a-86e9-953de6252dac',
   null,
   (select id from public.skills where slug = 'trigonometric-functions'),
   'advanced-math', 'hard',
   $q$What is the exact value of $\sin 30^\circ \cos 60^\circ + \cos 30^\circ \sin 60^\circ$?$q$, $q$[{"text":"$1$","is_correct":true},{"text":"$\\frac{3}{4}$","is_correct":false,"misconception_token":"only-second-product"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"averaged-the-products"},{"text":"$\\frac{1}{4}$","is_correct":false,"misconception_token":"only-first-product"}]$q$::jsonb, $q$$1$$q$, $q$$\sin 30^\circ \cos 60^\circ + \cos 30^\circ \sin 60^\circ = \frac{1}{2}\cdot\frac{1}{2} + \frac{\sqrt{3}}{2}\cdot\frac{\sqrt{3}}{2} = \frac{1}{4} + \frac{3}{4} = 1$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- sequences-series (Sequences & Series, grade 12, CCSS.MATH.CONTENT.HSF.BF.A.2) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0b9fa1d4-efc5-53b8-8acc-94fbca4e43e5',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'easy',
   $q$What is the common difference of the arithmetic sequence $3, 7, 11, 15, \dots$?$q$, $q$[{"text":"-4","is_correct":false,"misconception_token":"subtracted-wrong-order"},{"text":"4","is_correct":true},{"text":"3","is_correct":false,"misconception_token":"used-first-term"},{"text":"7","is_correct":false,"misconception_token":"used-second-term"}]$q$::jsonb, $q$4$q$, $q$The common difference is any term minus the previous term: $7 - 3 = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('17d71f51-66e4-5c2e-a1cf-5920af4af9cf',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'easy',
   $q$What is the common ratio of the geometric sequence $2, 6, 18, 54, \dots$?$q$, $q$[{"text":"3","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"used-first-term"},{"text":"4","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"9","is_correct":false,"misconception_token":"divided-nonadjacent-terms"}]$q$::jsonb, $q$3$q$, $q$The common ratio is any term divided by the previous term: $6 \div 2 = 3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b153c37d-5746-5f5d-9db8-c9233be02633',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'easy',
   $q$What is the next term of the arithmetic sequence $5, 9, 13, \dots$?$q$, $q$[{"text":"16","is_correct":false,"misconception_token":"added-three-not-four"},{"text":"17","is_correct":true},{"text":"18","is_correct":false,"misconception_token":"added-five-not-four"},{"text":"13","is_correct":false,"misconception_token":"forgot-to-add-difference"}]$q$::jsonb, $q$17$q$, $q$The common difference is $4$, so the next term is $13 + 4 = 17$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('02998ef4-4f76-58e6-972d-10b75f2b1340',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'easy',
   $q$What is the next term of the geometric sequence $3, 6, 12, \dots$?$q$, $q$[{"text":"24","is_correct":true},{"text":"18","is_correct":false,"misconception_token":"added-difference-instead-of-multiply"},{"text":"36","is_correct":false,"misconception_token":"used-wrong-ratio"},{"text":"14","is_correct":false,"misconception_token":"added-two-instead"}]$q$::jsonb, $q$24$q$, $q$The common ratio is $2$, so the next term is $12 \times 2 = 24$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bebae01b-0baf-5af0-8afc-2f72068af375',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'easy',
   $q$Which type of sequence is $4, 8, 16, 32, \dots$?$q$, $q$[{"text":"Arithmetic","is_correct":false,"misconception_token":"mistook-ratio-for-difference"},{"text":"Both arithmetic and geometric","is_correct":false,"misconception_token":"thinks-both-apply"},{"text":"Neither","is_correct":false,"misconception_token":"thinks-no-pattern"},{"text":"Geometric","is_correct":true}]$q$::jsonb, $q$Geometric$q$, $q$Each term is the previous term times $2$ (a constant ratio), so the sequence is geometric.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0b4d445d-74e9-5469-a5e0-03a6253f40b8',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'easy',
   $q$Which type of sequence is $5, 8, 11, 14, \dots$?$q$, $q$[{"text":"Constant","is_correct":false,"misconception_token":"thinks-values-constant"},{"text":"Neither","is_correct":false,"misconception_token":"thinks-no-pattern"},{"text":"Geometric","is_correct":false,"misconception_token":"mistook-difference-for-ratio"},{"text":"Arithmetic","is_correct":true}]$q$::jsonb, $q$Arithmetic$q$, $q$Each term is the previous term plus $3$ (a constant difference), so the sequence is arithmetic.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('339a1ecb-576c-51fa-82c1-81e4291bcabd',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'easy',
   $q$An arithmetic sequence has first term $a_1 = 2$ and common difference $d = 5$. What is $a_4$?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"used-n-minus-2"},{"text":"22","is_correct":false,"misconception_token":"used-n-not-n-minus-1"},{"text":"17","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"dropped-first-term"}]$q$::jsonb, $q$17$q$, $q$Using $a_n = a_1 + (n-1)d$, we get $a_4 = 2 + (4-1)(5) = 2 + 15 = 17$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6addd5f1-42e9-5a63-b390-e8adf63eea4c',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'easy',
   $q$A geometric sequence has first term $a_1 = 3$ and common ratio $r = 2$. What is $a_4$?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"dropped-first-term"},{"text":"48","is_correct":false,"misconception_token":"used-exponent-n"},{"text":"24","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"used-exponent-n-minus-2"}]$q$::jsonb, $q$24$q$, $q$Using $a_n = a_1 r^{n-1}$, we get $a_4 = 3 \cdot 2^{4-1} = 3 \cdot 8 = 24$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('69b8d2e8-8a13-5708-bad1-d668189a8ab0',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'medium',
   $q$An arithmetic sequence has first term $a_1 = 7$ and common difference $d = 4$. What is $a_{10}$?$q$, $q$[{"text":"43","is_correct":true},{"text":"47","is_correct":false,"misconception_token":"used-n-not-n-minus-1"},{"text":"36","is_correct":false,"misconception_token":"dropped-first-term"},{"text":"40","is_correct":false,"misconception_token":"forgot-first-term"}]$q$::jsonb, $q$43$q$, $q$Using $a_n = a_1 + (n-1)d$, we get $a_{10} = 7 + (10-1)(4) = 7 + 36 = 43$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1a613764-0488-536a-a6da-236c5a7c7db9',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'medium',
   $q$A geometric sequence has first term $a_1 = 5$ and common ratio $r = 3$. What is $a_5$?$q$, $q$[{"text":"1215","is_correct":false,"misconception_token":"used-exponent-n"},{"text":"135","is_correct":false,"misconception_token":"used-exponent-n-minus-2"},{"text":"405","is_correct":true},{"text":"81","is_correct":false,"misconception_token":"dropped-first-term"}]$q$::jsonb, $q$405$q$, $q$Using $a_n = a_1 r^{n-1}$, we get $a_5 = 5 \cdot 3^{5-1} = 5 \cdot 81 = 405$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e67f3cfc-4a10-50ca-ad0a-9bf4d3a4c78f',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'medium',
   $q$In an arithmetic sequence, $a_1 = 1$ and $a_7 = 43$. What is the common difference $d$?$q$, $q$[{"text":"42","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"6","is_correct":false,"misconception_token":"divided-by-n-not-n-minus-1"},{"text":"7","is_correct":true},{"text":"21","is_correct":false,"misconception_token":"divided-by-wrong-count"}]$q$::jsonb, $q$7$q$, $q$Since $a_7 = a_1 + 6d$, we have $43 = 1 + 6d$, so $6d = 42$ and $d = 7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5edf9be7-6833-5b07-b3e1-32bf29cb0feb',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'medium',
   $q$What is the sum of the first $10$ terms of the arithmetic sequence $3, 7, 11, \dots$?$q$, $q$[{"text":"195","is_correct":false,"misconception_token":"dropped-first-term"},{"text":"420","is_correct":false,"misconception_token":"used-n-not-half-n"},{"text":"42","is_correct":false,"misconception_token":"forgot-to-multiply-count"},{"text":"210","is_correct":true}]$q$::jsonb, $q$210$q$, $q$The tenth term is $a_{10} = 3 + 9(4) = 39$, so $S_{10} = \frac{10}{2}(3 + 39) = 5 \cdot 42 = 210$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('559c17ff-4184-5b3c-8e21-c9c92465b408',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'medium',
   $q$Maria saves 50 dollars the first week and increases her savings by 15 dollars each week after that. How many dollars does she save in the eighth week?$q$, $q$[{"text":"170","is_correct":false,"misconception_token":"used-n-not-n-minus-1"},{"text":"155","is_correct":true},{"text":"140","is_correct":false,"misconception_token":"used-n-minus-2"},{"text":"105","is_correct":false,"misconception_token":"forgot-starting-amount"}]$q$::jsonb, $q$155$q$, $q$This is arithmetic with $a_1 = 50$ and $d = 15$, so $a_8 = 50 + (8-1)(15) = 50 + 105 = 155$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7d14f0d6-2b90-57f3-a7eb-a81cffcabb15',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'medium',
   $q$A colony starts with $20$ bacteria and the population doubles every hour. How many bacteria are there after $5$ hours?$q$, $q$[{"text":"100","is_correct":false,"misconception_token":"added-instead-of-doubled"},{"text":"320","is_correct":false,"misconception_token":"used-exponent-n-minus-1"},{"text":"640","is_correct":true},{"text":"200","is_correct":false,"misconception_token":"multiplied-by-count"}]$q$::jsonb, $q$640$q$, $q$The population is $20 \cdot 2^5 = 20 \cdot 32 = 640$ after $5$ doublings.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9078102e-19ff-5e15-b7d9-9e978672b43d',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'medium',
   $q$How many terms are in the arithmetic sequence $4, 7, 10, \dots, 49$?$q$, $q$[{"text":"45","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"15","is_correct":false,"misconception_token":"forgot-to-add-one"},{"text":"17","is_correct":false,"misconception_token":"added-two-instead"},{"text":"16","is_correct":true}]$q$::jsonb, $q$16$q$, $q$With $d = 3$, solving $49 = 4 + (n-1)(3)$ gives $n - 1 = 15$, so $n = 16$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('343bc0a8-5cd8-55f4-b7f9-e3b4166b95f6',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'medium',
   $q$A theater has $20$ seats in the first row, and each row after that has $4$ more seats than the one before. How many seats are in the twelfth row?$q$, $q$[{"text":"64","is_correct":true},{"text":"48","is_correct":false,"misconception_token":"forgot-first-row"},{"text":"60","is_correct":false,"misconception_token":"used-n-minus-2"},{"text":"68","is_correct":false,"misconception_token":"used-n-not-n-minus-1"}]$q$::jsonb, $q$64$q$, $q$This is arithmetic with $a_1 = 20$ and $d = 4$, so $a_{12} = 20 + (12-1)(4) = 20 + 44 = 64$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f596fd5e-c380-532e-bdfa-e645966c146c',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'hard',
   $q$A student saves 10 dollars on the first day and doubles the amount saved each day. How many dollars has the student saved in total after $7$ days?$q$, $q$[{"text":"640","is_correct":false,"misconception_token":"used-last-term-only"},{"text":"127","is_correct":false,"misconception_token":"forgot-first-term-factor"},{"text":"1280","is_correct":false,"misconception_token":"forgot-minus-one"},{"text":"1270","is_correct":true}]$q$::jsonb, $q$1270$q$, $q$This is a geometric sum with $a_1 = 10$, $r = 2$, $n = 7$: $S_7 = \frac{10(2^7 - 1)}{2 - 1} = 10 \cdot 127 = 1270$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7d697051-c08e-5de7-853a-4995b3d1f964',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'hard',
   $q$What is the sum of the first $5$ terms of the geometric sequence $16, 8, 4, \dots$?$q$, $q$[{"text":"31","is_correct":true},{"text":"30","is_correct":false,"misconception_token":"dropped-last-term"},{"text":"62","is_correct":false,"misconception_token":"doubled-the-sum"},{"text":"15","is_correct":false,"misconception_token":"dropped-first-term"}]$q$::jsonb, $q$31$q$, $q$With $a_1 = 16$ and $r = \frac{1}{2}$, the terms are $16, 8, 4, 2, 1$, so $S_5 = 16 + 8 + 4 + 2 + 1 = 31$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('76ab18cb-fd7c-52e8-9b70-3ebc67040ffa',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'hard',
   $q$A ball is dropped from a height of $64$ feet, and each bounce reaches $\frac{3}{4}$ of the previous height. How high, in feet, does the ball rise after the third bounce?$q$, $q$[{"text":"36","is_correct":false,"misconception_token":"used-second-bounce"},{"text":"48","is_correct":false,"misconception_token":"used-first-bounce"},{"text":"27","is_correct":true},{"text":"20.25","is_correct":false,"misconception_token":"used-fourth-bounce"}]$q$::jsonb, $q$27$q$, $q$The bounce heights form a geometric sequence: $64 \cdot \left(\frac{3}{4}\right)^3 = 64 \cdot \frac{27}{64} = 27$ feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3211f8a3-1c93-5a18-8b16-faedc0135524',
   null,
   (select id from public.skills where slug = 'sequences-series'),
   'advanced-math', 'hard',
   $q$An auditorium has $15$ seats in the first row, and each row has $3$ more seats than the row before. How many seats are there in total across the first $20$ rows?$q$, $q$[{"text":"870","is_correct":true},{"text":"1740","is_correct":false,"misconception_token":"forgot-to-halve"},{"text":"720","is_correct":false,"misconception_token":"dropped-first-term"},{"text":"900","is_correct":false,"misconception_token":"used-n-not-n-minus-1"}]$q$::jsonb, $q$870$q$, $q$The last row has $a_{20} = 15 + 19(3) = 72$ seats, so $S_{20} = \frac{20}{2}(15 + 72) = 10 \cdot 87 = 870$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- rational-functions (Rational Functions, grade 12, CCSS.MATH.CONTENT.HSF.IF.C.7) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c9c818f7-3329-5f58-aa6e-c51dc12190ae',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'easy',
   $q$For the function $f(x) = \frac{x+2}{x-3}$, which value of $x$ is excluded from the domain?$q$, $q$[{"text":"$x = 2$","is_correct":false,"misconception_token":"opposite-sign-on-numerator"},{"text":"$x = 3$","is_correct":true},{"text":"$x = -3$","is_correct":false,"misconception_token":"opposite-sign-on-denominator"},{"text":"$x = -2$","is_correct":false,"misconception_token":"used-numerator-zero"}]$q$::jsonb, $q$$x = 3$$q$, $q$The denominator is zero when $x - 3 = 0$, so $x = 3$ is excluded from the domain.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5c8d05d7-8d72-552a-b596-0bb2481f4ed1',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'easy',
   $q$What is the vertical asymptote of $f(x) = \frac{1}{x-5}$?$q$, $q$[{"text":"$x = 5$","is_correct":true},{"text":"$x = 1$","is_correct":false,"misconception_token":"used-numerator"},{"text":"$x = -5$","is_correct":false,"misconception_token":"opposite-sign"},{"text":"$y = 0$","is_correct":false,"misconception_token":"gave-horizontal-asymptote"}]$q$::jsonb, $q$$x = 5$$q$, $q$Set the denominator equal to zero: $x - 5 = 0$ gives the vertical asymptote $x = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0f09c998-050a-5e07-874a-e090b695769b',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'easy',
   $q$Which value of $x$ is not in the domain of $f(x) = \frac{x-1}{x+4}$?$q$, $q$[{"text":"$x = 1$","is_correct":false,"misconception_token":"used-numerator-zero"},{"text":"$x = -4$","is_correct":true},{"text":"$x = -1$","is_correct":false,"misconception_token":"opposite-sign-on-numerator"},{"text":"$x = 4$","is_correct":false,"misconception_token":"opposite-sign"}]$q$::jsonb, $q$$x = -4$$q$, $q$The denominator is zero when $x + 4 = 0$, so $x = -4$ is not in the domain.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('92a8f875-d985-54ee-87c3-5040f6922dce',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'easy',
   $q$What is the $x$-intercept of $f(x) = \frac{x-6}{x+2}$?$q$, $q$[{"text":"$x = 6$","is_correct":true},{"text":"$x = -6$","is_correct":false,"misconception_token":"opposite-sign"},{"text":"$x = -2$","is_correct":false,"misconception_token":"used-denominator-zero"},{"text":"$x = 2$","is_correct":false,"misconception_token":"opposite-sign-on-denominator"}]$q$::jsonb, $q$$x = 6$$q$, $q$An x-intercept occurs where the numerator is zero: $x - 6 = 0$, so $x = 6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ec60fd79-40b9-5961-8794-9a99ba9eaaa2',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'easy',
   $q$What is the horizontal asymptote of $f(x) = \frac{2x+1}{x-4}$?$q$, $q$[{"text":"$y = 0$","is_correct":false,"misconception_token":"assumed-numerator-smaller-degree"},{"text":"$y = 4$","is_correct":false,"misconception_token":"used-denominator-constant"},{"text":"$y = \\frac{1}{2}$","is_correct":false,"misconception_token":"inverted-coefficient-ratio"},{"text":"$y = 2$","is_correct":true}]$q$::jsonb, $q$$y = 2$$q$, $q$The numerator and denominator both have degree 1, so the horizontal asymptote is the ratio of leading coefficients: $y = \frac{2}{1} = 2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0fa04663-1d46-5b40-b4b1-976c94721e61',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'easy',
   $q$What is the horizontal asymptote of $f(x) = \frac{3}{x+7}$?$q$, $q$[{"text":"$y = 7$","is_correct":false,"misconception_token":"used-denominator-constant"},{"text":"$y = -7$","is_correct":false,"misconception_token":"used-vertical-asymptote"},{"text":"$y = 3$","is_correct":false,"misconception_token":"used-numerator-constant"},{"text":"$y = 0$","is_correct":true}]$q$::jsonb, $q$$y = 0$$q$, $q$The numerator's degree (0) is less than the denominator's degree (1), so the horizontal asymptote is $y = 0$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ff3a4c2c-09ac-5ae8-9d4e-dca791b42cf7',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'easy',
   $q$What is the vertical asymptote of $f(x) = \frac{x-1}{x+8}$?$q$, $q$[{"text":"$x = 1$","is_correct":false,"misconception_token":"used-numerator-zero"},{"text":"$x = 8$","is_correct":false,"misconception_token":"opposite-sign"},{"text":"$x = -8$","is_correct":true},{"text":"$x = -1$","is_correct":false,"misconception_token":"opposite-sign-on-numerator"}]$q$::jsonb, $q$$x = -8$$q$, $q$Set the denominator equal to zero: $x + 8 = 0$ gives the vertical asymptote $x = -8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('88406785-7db1-546e-bc1e-e5206936a4fe',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'easy',
   $q$What is the zero of $f(x) = \frac{2x-10}{x+3}$?$q$, $q$[{"text":"$x = -5$","is_correct":false,"misconception_token":"opposite-sign"},{"text":"$x = 10$","is_correct":false,"misconception_token":"forgot-to-divide-by-coefficient"},{"text":"$x = 5$","is_correct":true},{"text":"$x = -3$","is_correct":false,"misconception_token":"used-denominator-zero"}]$q$::jsonb, $q$$x = 5$$q$, $q$Set the numerator to zero: $2x - 10 = 0$, so $2x = 10$ and $x = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1f97c5e9-d4ef-5638-8e96-fe01da4ecbd9',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'medium',
   $q$The graph of $f(x) = \frac{x^2-4}{x-2}$ has a hole. At which $x$-value does the hole occur?$q$, $q$[{"text":"$x = 2$","is_correct":true},{"text":"$x = -2$","is_correct":false,"misconception_token":"picked-other-root"},{"text":"$x = 0$","is_correct":false,"misconception_token":"used-y-intercept"},{"text":"$x = 4$","is_correct":false,"misconception_token":"used-square-not-root"}]$q$::jsonb, $q$$x = 2$$q$, $q$Factor the numerator: $\frac{(x-2)(x+2)}{x-2}$. The common factor $x-2$ cancels, so the hole is at $x = 2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a3184eef-2479-5ec1-8b2b-d4aacd645a74',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'medium',
   $q$For $x \neq 1$, which expression is $f(x) = \frac{x^2-1}{x-1}$ in simplest form?$q$, $q$[{"text":"$x - 1$","is_correct":false,"misconception_token":"kept-denominator-factor"},{"text":"$x$","is_correct":false,"misconception_token":"canceled-constants-only"},{"text":"$x + 1$","is_correct":true},{"text":"$x^2 - 1$","is_correct":false,"misconception_token":"did-not-factor"}]$q$::jsonb, $q$$x + 1$$q$, $q$Factor the numerator: $\frac{(x-1)(x+1)}{x-1}$. Canceling $x-1$ gives $x + 1$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e5ab7014-228d-5a51-bcfd-59e86d5ad550',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'medium',
   $q$What are the vertical asymptotes of $f(x) = \frac{x+1}{x^2-9}$?$q$, $q$[{"text":"$x = 3$","is_correct":false,"misconception_token":"found-only-one-root"},{"text":"$x = 9$ and $x = -9$","is_correct":false,"misconception_token":"did-not-square-root"},{"text":"$x = 3$ and $x = -3$","is_correct":true},{"text":"$x = -1$","is_correct":false,"misconception_token":"used-numerator-zero"}]$q$::jsonb, $q$$x = 3$ and $x = -3$$q$, $q$Set the denominator to zero: $x^2 - 9 = (x-3)(x+3) = 0$, giving $x = 3$ and $x = -3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('63429b4c-e552-5b61-8030-66e6ec08a3e8',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'medium',
   $q$Which statement best describes the horizontal asymptote of $f(x) = \frac{x^2+1}{x-2}$?$q$, $q$[{"text":"$y = 1$","is_correct":false,"misconception_token":"used-leading-coefficients-of-unequal-degrees"},{"text":"$y = 0$","is_correct":false,"misconception_token":"assumed-y-equals-zero"},{"text":"$y = 2$","is_correct":false,"misconception_token":"used-denominator-constant"},{"text":"There is no horizontal asymptote.","is_correct":true}]$q$::jsonb, $q$There is no horizontal asymptote.$q$, $q$The numerator's degree (2) is greater than the denominator's degree (1), so there is no horizontal asymptote.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('93abb8a8-fc3a-5c7a-b65b-4930f86e3c27',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'medium',
   $q$Which values of $x$ are excluded from the domain of $f(x) = \frac{x+5}{x^2-x-6}$?$q$, $q$[{"text":"$x = -3$ and $x = 2$","is_correct":false,"misconception_token":"sign-error-on-both-roots"},{"text":"$x = 3$ and $x = -2$","is_correct":true},{"text":"$x = -5$","is_correct":false,"misconception_token":"used-numerator-zero"},{"text":"$x = 6$ and $x = -1$","is_correct":false,"misconception_token":"used-coefficients-not-roots"}]$q$::jsonb, $q$$x = 3$ and $x = -2$$q$, $q$Factor the denominator: $x^2 - x - 6 = (x-3)(x+2)$, which is zero at $x = 3$ and $x = -2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('df340010-c9eb-5c6b-be76-b2e1716fda1a',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'medium',
   $q$What is the vertical asymptote of $f(x) = \frac{(x-2)(x+3)}{(x-2)(x-5)}$?$q$, $q$[{"text":"$x = -5$","is_correct":false,"misconception_token":"opposite-sign"},{"text":"$x = 2$","is_correct":false,"misconception_token":"used-canceled-factor-as-asymptote"},{"text":"$x = 5$","is_correct":true},{"text":"$x = -3$","is_correct":false,"misconception_token":"used-numerator-factor"}]$q$::jsonb, $q$$x = 5$$q$, $q$The factor $x-2$ cancels, creating a hole. The remaining denominator factor gives the vertical asymptote $x - 5 = 0$, so $x = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('778cc6ca-998a-5d78-9497-ad9cf43ef83d',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'medium',
   $q$A company's average cost per item is $C(x) = \frac{500 + 2x}{x}$ dollars, where $x$ is the number of items produced. As $x$ grows very large, the average cost approaches what value?$q$, $q$[{"text":"502 dollars","is_correct":false,"misconception_token":"added-all-constants"},{"text":"0 dollars","is_correct":false,"misconception_token":"assumed-approaches-zero"},{"text":"500 dollars","is_correct":false,"misconception_token":"used-fixed-cost"},{"text":"2 dollars","is_correct":true}]$q$::jsonb, $q$2 dollars$q$, $q$As $x \to \infty$, $\frac{500+2x}{x}$ approaches the ratio of leading coefficients $\frac{2}{1} = 2$, so the average cost approaches 2 dollars.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('716a0321-b18b-594f-9b4c-00360b43dc85',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'medium',
   $q$The concentration of a drug is modeled by $C(t) = \frac{5t}{t+10}$, where $t$ is time in hours. As $t$ increases without bound, the concentration approaches what value?$q$, $q$[{"text":"$5$","is_correct":true},{"text":"$10$","is_correct":false,"misconception_token":"used-denominator-constant"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"divided-numerator-coefficient-by-constant"},{"text":"$0$","is_correct":false,"misconception_token":"assumed-approaches-zero"}]$q$::jsonb, $q$$5$$q$, $q$For large $t$, the degrees are equal, so $\frac{5t}{t+10}$ approaches the ratio of leading coefficients $\frac{5}{1} = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d46b7fb3-e4da-51cb-8207-e3f2f93e2dd2',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'hard',
   $q$The graph of $f(x) = \frac{x^2-4}{x^2-3x+2}$ has a hole. What are the coordinates of the hole?$q$, $q$[{"text":"$(-2, 0)$","is_correct":false,"misconception_token":"used-other-numerator-root"},{"text":"$(1, 0)$","is_correct":false,"misconception_token":"used-vertical-asymptote-x-value"},{"text":"$(2, 0)$","is_correct":false,"misconception_token":"assumed-hole-on-x-axis"},{"text":"$(2, 4)$","is_correct":true}]$q$::jsonb, $q$$(2, 4)$$q$, $q$Factor: $\frac{(x-2)(x+2)}{(x-1)(x-2)}$; cancel $x-2$ to get $\frac{x+2}{x-1}$. The hole is at $x = 2$, where $\frac{2+2}{2-1} = 4$, so the hole is at $(2, 4)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('09d2db5b-4ce1-52aa-8a34-ba3b4edb2aa6',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'hard',
   $q$An engineer models a signal with $g(x) = \frac{x^2-5x+6}{x^2-4}$. At which $x$-value does the graph have a vertical asymptote rather than a hole?$q$, $q$[{"text":"$x = -2$","is_correct":true},{"text":"$x = 2$","is_correct":false,"misconception_token":"chose-the-hole"},{"text":"$x = 4$","is_correct":false,"misconception_token":"did-not-square-root-denominator"},{"text":"$x = 3$","is_correct":false,"misconception_token":"used-numerator-root"}]$q$::jsonb, $q$$x = -2$$q$, $q$Factor: $\frac{(x-2)(x-3)}{(x-2)(x+2)}$. The $x-2$ cancels, giving a hole at $x=2$. The remaining factor $x+2 = 0$ gives the vertical asymptote $x = -2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0532e41e-2baa-5697-911c-8da348fad126',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'hard',
   $q$What is the horizontal asymptote of $f(x) = \frac{3x^2+2}{6x^2-x}$?$q$, $q$[{"text":"$y = 2$","is_correct":false,"misconception_token":"inverted-coefficient-ratio"},{"text":"$y = 0$","is_correct":false,"misconception_token":"assumed-approaches-zero"},{"text":"$y = \\frac{1}{2}$","is_correct":true},{"text":"$y = 3$","is_correct":false,"misconception_token":"used-numerator-leading-coefficient-only"}]$q$::jsonb, $q$$y = \frac{1}{2}$$q$, $q$Both numerator and denominator have degree 2, so the horizontal asymptote is the ratio of leading coefficients: $y = \frac{3}{6} = \frac{1}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5169cab2-2008-5c6e-91b4-6e619509f432',
   null,
   (select id from public.skills where slug = 'rational-functions'),
   'advanced-math', 'hard',
   $q$Which expression is $f(x) = \frac{2x^2-2}{x^2+2x-3}$ in fully simplified form?$q$, $q$[{"text":"$\\frac{2(x+1)}{x+3}$","is_correct":true},{"text":"$\\frac{2(x+1)}{x-3}$","is_correct":false,"misconception_token":"sign-error-in-denominator-factor"},{"text":"$\\frac{x+1}{x+3}$","is_correct":false,"misconception_token":"dropped-numerator-coefficient"},{"text":"$\\frac{2(x-1)}{x+3}$","is_correct":false,"misconception_token":"canceled-wrong-numerator-factor"}]$q$::jsonb, $q$$\frac{2(x+1)}{x+3}$$q$, $q$Factor: $\frac{2(x-1)(x+1)}{(x+3)(x-1)}$; cancel $x-1$ to get $\frac{2(x+1)}{x+3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- conic-sections (Conic Sections, grade 12, CCSS.MATH.CONTENT.HSG.GPE.A.1) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('addff36a-ad7e-5a1b-8d9d-51bb4049ed68',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'easy',
   $q$The equation of a circle is $(x-3)^2 + (y+2)^2 = 25$. What is the center of the circle?$q$, $q$[{"text":"$(-3, -2)$","is_correct":false,"misconception_token":"kept-sign-of-x"},{"text":"$(3, -2)$","is_correct":true},{"text":"$(-3, 2)$","is_correct":false,"misconception_token":"negated-both-coordinates"},{"text":"$(3, 2)$","is_correct":false,"misconception_token":"kept-sign-of-y"}]$q$::jsonb, $q$$(3, -2)$$q$, $q$In $(x-h)^2 + (y-k)^2 = r^2$ the center is $(h, k)$; here $h = 3$ and $k = -2$, so the center is $(3, -2)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('54b60a9f-61ff-54f9-8a5d-6d296a7dcd52',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'easy',
   $q$For the circle $(x-1)^2 + (y-4)^2 = 49$, what is the radius?$q$, $q$[{"text":"$7$","is_correct":true},{"text":"$14$","is_correct":false,"misconception_token":"used-diameter"},{"text":"$49$","is_correct":false,"misconception_token":"used-r-squared-as-radius"},{"text":"$24.5$","is_correct":false,"misconception_token":"halved-r-squared"}]$q$::jsonb, $q$$7$$q$, $q$The right side equals $r^2$, so $r = \sqrt{49} = 7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('299f7364-7cc5-501c-9ed2-2dbdaea5931e',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'easy',
   $q$What is the radius of the circle $(x+5)^2 + (y-2)^2 = 36$?$q$, $q$[{"text":"$12$","is_correct":false,"misconception_token":"used-diameter"},{"text":"$6$","is_correct":true},{"text":"$18$","is_correct":false,"misconception_token":"halved-r-squared"},{"text":"$36$","is_correct":false,"misconception_token":"used-r-squared-as-radius"}]$q$::jsonb, $q$$6$$q$, $q$$r^2 = 36$, so $r = \sqrt{36} = 6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a7bf730b-0128-5958-a87c-2e4605473198',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'easy',
   $q$What is the center of the circle $(x+7)^2 + (y+1)^2 = 16$?$q$, $q$[{"text":"$(-7, -1)$","is_correct":true},{"text":"$(7, 1)$","is_correct":false,"misconception_token":"negated-both-coordinates"},{"text":"$(7, -1)$","is_correct":false,"misconception_token":"kept-sign-of-x"},{"text":"$(-7, 1)$","is_correct":false,"misconception_token":"kept-sign-of-y"}]$q$::jsonb, $q$$(-7, -1)$$q$, $q$Write it as $(x-(-7))^2 + (y-(-1))^2 = 16$; the center $(h, k)$ is $(-7, -1)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('04ae89f2-e576-5669-8af1-a83e44cebc15',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'easy',
   $q$The parabola $y = (x-4)^2 + 3$ is written in vertex form. What is its vertex?$q$, $q$[{"text":"$(-4, 3)$","is_correct":false,"misconception_token":"negated-x-of-vertex"},{"text":"$(-4, -3)$","is_correct":false,"misconception_token":"negated-both-coordinates"},{"text":"$(4, -3)$","is_correct":false,"misconception_token":"negated-y-of-vertex"},{"text":"$(4, 3)$","is_correct":true}]$q$::jsonb, $q$$(4, 3)$$q$, $q$In $y = (x-h)^2 + k$ the vertex is $(h, k)$; here $h = 4$ and $k = 3$, so the vertex is $(4, 3)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('32d164f3-f5a7-5993-a145-5e5e61216a09',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'easy',
   $q$In which direction does the parabola $y = -2(x-1)^2 + 5$ open?$q$, $q$[{"text":"To the left","is_correct":false,"misconception_token":"treated-as-horizontal-parabola-left"},{"text":"To the right","is_correct":false,"misconception_token":"treated-as-horizontal-parabola-right"},{"text":"Upward","is_correct":false,"misconception_token":"ignored-negative-leading-coefficient"},{"text":"Downward","is_correct":true}]$q$::jsonb, $q$Downward$q$, $q$For $y = a(x-h)^2 + k$ the parabola opens up when $a > 0$ and down when $a < 0$; since $a = -2 < 0$, it opens downward.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c7ef09a5-9dd5-536e-b016-f2ee88a8e776',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'easy',
   $q$Which type of conic section is represented by $x^2 + y^2 = 9$?$q$, $q$[{"text":"Parabola","is_correct":false,"misconception_token":"ignored-second-squared-term"},{"text":"Ellipse","is_correct":false,"misconception_token":"mistook-equal-coefficients-for-ellipse"},{"text":"Circle","is_correct":true},{"text":"Hyperbola","is_correct":false,"misconception_token":"assumed-difference-of-squares"}]$q$::jsonb, $q$Circle$q$, $q$Both variables are squared with equal positive coefficients and the same sign, matching $x^2 + y^2 = r^2$, a circle with $r = 3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e0cfce1d-f6cd-58bb-a931-5d2dfb300bb0',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'easy',
   $q$What is the center of the ellipse $\frac{(x-2)^2}{9} + \frac{(y-5)^2}{4} = 1$?$q$, $q$[{"text":"$(2, -5)$","is_correct":false,"misconception_token":"negated-y-of-center"},{"text":"$(-2, -5)$","is_correct":false,"misconception_token":"negated-both-coordinates"},{"text":"$(2, 5)$","is_correct":true},{"text":"$(-2, 5)$","is_correct":false,"misconception_token":"negated-x-of-center"}]$q$::jsonb, $q$$(2, 5)$$q$, $q$In $\frac{(x-h)^2}{a^2} + \frac{(y-k)^2}{b^2} = 1$ the center is $(h, k) = (2, 5)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5e863060-a3e2-5152-a817-b502f7a0b302',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'medium',
   $q$A circle has center $(-3, 4)$ and radius $5$. Which equation represents this circle?$q$, $q$[{"text":"$(x+3)^2 + (y-4)^2 = 25$","is_correct":true},{"text":"$(x-3)^2 + (y+4)^2 = 25$","is_correct":false,"misconception_token":"negated-center-signs"},{"text":"$(x+3)^2 + (y-4)^2 = 10$","is_correct":false,"misconception_token":"doubled-radius-instead-of-squaring"},{"text":"$(x+3)^2 + (y-4)^2 = 5$","is_correct":false,"misconception_token":"forgot-to-square-radius"}]$q$::jsonb, $q$$(x+3)^2 + (y-4)^2 = 25$$q$, $q$Standard form is $(x-h)^2 + (y-k)^2 = r^2$ with $h = -3$, $k = 4$, $r = 5$, giving $(x+3)^2 + (y-4)^2 = 25$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8ea54c6d-41a3-582f-bb18-ee398e8e0178',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'medium',
   $q$Complete the square to find the center of the circle $x^2 + y^2 - 6x + 8y + 9 = 0$.$q$, $q$[{"text":"$(-3, 4)$","is_correct":false,"misconception_token":"negated-completed-square-values"},{"text":"$(6, -8)$","is_correct":false,"misconception_token":"used-full-linear-coefficients"},{"text":"$(3, -4)$","is_correct":true},{"text":"$(3, 4)$","is_correct":false,"misconception_token":"wrong-sign-on-y"}]$q$::jsonb, $q$$(3, -4)$$q$, $q$Grouping gives $(x-3)^2 + (y+4)^2 = -9 + 9 + 16 = 16$, so the center is $(3, -4)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f8dd7f55-4219-5b22-80c5-b733a0be8298',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'medium',
   $q$Find the radius of the circle $x^2 + y^2 + 4x - 2y - 11 = 0$.$q$, $q$[{"text":"$8$","is_correct":false,"misconception_token":"used-diameter"},{"text":"$16$","is_correct":false,"misconception_token":"used-r-squared-as-radius"},{"text":"$4$","is_correct":true},{"text":"$11$","is_correct":false,"misconception_token":"used-constant-term"}]$q$::jsonb, $q$$4$$q$, $q$Completing the square gives $(x+2)^2 + (y-1)^2 = 11 + 4 + 1 = 16$, so $r = \sqrt{16} = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('550baa5f-dd5e-5b7a-bda1-d8872d53a2f3',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'medium',
   $q$What are the vertices of the ellipse $\frac{x^2}{25} + \frac{y^2}{9} = 1$?$q$, $q$[{"text":"$(3, 0)$ and $(-3, 0)$","is_correct":false,"misconception_token":"used-minor-axis-value"},{"text":"$(0, 5)$ and $(0, -5)$","is_correct":false,"misconception_token":"used-wrong-axis"},{"text":"$(25, 0)$ and $(-25, 0)$","is_correct":false,"misconception_token":"forgot-to-take-square-root"},{"text":"$(5, 0)$ and $(-5, 0)$","is_correct":true}]$q$::jsonb, $q$$(5, 0)$ and $(-5, 0)$$q$, $q$The larger denominator $25$ is under $x^2$, so $a = 5$ along the x-axis and the vertices are $(\pm 5, 0)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b0ee02bf-33f5-5ade-8b0a-f8c54709128b',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'medium',
   $q$A circular garden is centered at $(5, -2)$ on a map and has a radius of $4$ units. Which equation represents its boundary?$q$, $q$[{"text":"$(x+5)^2 + (y-2)^2 = 16$","is_correct":false,"misconception_token":"negated-center-signs"},{"text":"$(x-5)^2 + (y+2)^2 = 16$","is_correct":true},{"text":"$(x-5)^2 + (y+2)^2 = 8$","is_correct":false,"misconception_token":"doubled-radius-instead-of-squaring"},{"text":"$(x-5)^2 + (y+2)^2 = 4$","is_correct":false,"misconception_token":"forgot-to-square-radius"}]$q$::jsonb, $q$$(x-5)^2 + (y+2)^2 = 16$$q$, $q$With center $(5, -2)$ and $r = 4$, standard form gives $(x-5)^2 + (y+2)^2 = 4^2 = 16$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('237b384f-c9a5-5f48-bd4b-bbedf4d6a964',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'medium',
   $q$The parabola $y = 3(x+2)^2 - 7$ opens upward. What is its minimum value?$q$, $q$[{"text":"$3$","is_correct":false,"misconception_token":"used-leading-coefficient"},{"text":"$7$","is_correct":false,"misconception_token":"negated-minimum-value"},{"text":"$-7$","is_correct":true},{"text":"$-2$","is_correct":false,"misconception_token":"used-x-coordinate-of-vertex"}]$q$::jsonb, $q$$-7$$q$, $q$The vertex of $y = a(x-h)^2 + k$ is $(h, k)$; since it opens upward, the minimum value is $k = -7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('654c48ef-4090-5319-b63d-f892c27fa1ee',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'medium',
   $q$Which type of conic section is represented by $4x^2 + 9y^2 = 36$?$q$, $q$[{"text":"Hyperbola","is_correct":false,"misconception_token":"assumed-difference-of-squares"},{"text":"Circle","is_correct":false,"misconception_token":"assumed-both-squares-mean-circle"},{"text":"Parabola","is_correct":false,"misconception_token":"ignored-one-squared-term"},{"text":"Ellipse","is_correct":true}]$q$::jsonb, $q$Ellipse$q$, $q$Dividing by $36$ gives $\frac{x^2}{9} + \frac{y^2}{4} = 1$; two squared terms with unequal positive coefficients and the same sign form an ellipse.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7e9f51d9-63f3-5e9a-8511-f0ee7b15a84c',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'medium',
   $q$What are the vertices of the ellipse $\frac{(x-4)^2}{4} + \frac{(y-1)^2}{25} = 1$?$q$, $q$[{"text":"$(4, 6)$ and $(4, -4)$","is_correct":true},{"text":"$(4, 3)$ and $(4, -1)$","is_correct":false,"misconception_token":"used-minor-axis-value"},{"text":"$(0, 5)$ and $(0, -5)$","is_correct":false,"misconception_token":"ignored-center-translation"},{"text":"$(9, 1)$ and $(-1, 1)$","is_correct":false,"misconception_token":"used-wrong-axis"}]$q$::jsonb, $q$$(4, 6)$ and $(4, -4)$$q$, $q$The larger denominator $25$ is under $(y-1)^2$, so the major axis is vertical with $a = 5$; from center $(4, 1)$ the vertices are $(4, 1 \pm 5) = (4, 6)$ and $(4, -4)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4dae1840-df9a-5889-8b14-79ae4f95511e',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'hard',
   $q$Find the radius of the circle $2x^2 + 2y^2 - 8x + 12y - 6 = 0$.$q$, $q$[{"text":"$2$","is_correct":false,"misconception_token":"used-leading-coefficient"},{"text":"$8$","is_correct":false,"misconception_token":"used-diameter"},{"text":"$16$","is_correct":false,"misconception_token":"used-r-squared-as-radius"},{"text":"$4$","is_correct":true}]$q$::jsonb, $q$$4$$q$, $q$Divide by $2$ to get $x^2 + y^2 - 4x + 6y - 3 = 0$, then $(x-2)^2 + (y+3)^2 = 3 + 4 + 9 = 16$, so $r = \sqrt{16} = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('336c5f16-eefb-5a66-bc0a-28a38bf6a970',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'hard',
   $q$An elliptical track is modeled by $\frac{x^2}{144} + \frac{y^2}{81} = 1$, with distances in meters. What is the length of the major axis?$q$, $q$[{"text":"$24$","is_correct":true},{"text":"$12$","is_correct":false,"misconception_token":"used-semi-major-axis"},{"text":"$144$","is_correct":false,"misconception_token":"used-a-squared"},{"text":"$18$","is_correct":false,"misconception_token":"used-minor-axis-length"}]$q$::jsonb, $q$$24$$q$, $q$The larger denominator gives $a^2 = 144$, so $a = 12$; the major axis length is $2a = 24$ meters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('45734f92-4974-54ef-a935-3d521c8e1065',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'hard',
   $q$A ball's height in feet is $h = -16(t-2)^2 + 64$, where $t$ is time in seconds. What is the maximum height of the ball?$q$, $q$[{"text":"$-64$","is_correct":false,"misconception_token":"negated-maximum-value"},{"text":"$2$","is_correct":false,"misconception_token":"used-time-coordinate"},{"text":"$64$","is_correct":true},{"text":"$48$","is_correct":false,"misconception_token":"subtracted-coefficient-from-vertex"}]$q$::jsonb, $q$$64$$q$, $q$In vertex form $h = a(t-h_0)^2 + k$ with $a = -16 < 0$ the parabola opens downward, so the maximum height is the vertex value $k = 64$ feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ae686968-d27e-5e3e-8d7a-33b90d8555f9',
   null,
   (select id from public.skills where slug = 'conic-sections'),
   'advanced-math', 'hard',
   $q$Which type of conic section is represented by $x^2 + 4y^2 - 2x + 8y + 1 = 0$?$q$, $q$[{"text":"Ellipse","is_correct":true},{"text":"Parabola","is_correct":false,"misconception_token":"thought-only-one-variable-squared"},{"text":"Hyperbola","is_correct":false,"misconception_token":"assumed-difference-of-squares"},{"text":"Circle","is_correct":false,"misconception_token":"assumed-both-squares-mean-circle"}]$q$::jsonb, $q$Ellipse$q$, $q$Both variables are squared with positive unequal coefficients ($1$ and $4$); completing the square gives $(x-1)^2 + 4(y+1)^2 = 4$, a real ellipse.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- combinatorics-probability (Combinatorics & Probability, grade 12, CCSS.MATH.CONTENT.HSS.CP.B.9) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('53e95726-2686-5bfb-ad6b-2e93801a68bf',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'easy',
   $q$What is the value of $5!$?$q$, $q$[{"text":"15","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"120","is_correct":true},{"text":"25","is_correct":false,"misconception_token":"squared-the-number"},{"text":"20","is_correct":false,"misconception_token":"multiplied-first-two-only"}]$q$::jsonb, $q$120$q$, $q$A factorial multiplies all positive integers down to 1: $5! = 5 \times 4 \times 3 \times 2 \times 1 = 120$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1523240d-e7de-55e2-9a6b-5bdf7c4c4bcd',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'easy',
   $q$A diner offers $4$ appetizers, $3$ entrees, and $2$ desserts. How many different three-course meals are possible?$q$, $q$[{"text":"24","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"dropped-a-factor"},{"text":"9","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"6","is_correct":false,"misconception_token":"used-two-factors-only"}]$q$::jsonb, $q$24$q$, $q$By the fundamental counting principle, multiply the choices: $4 \times 3 \times 2 = 24$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c33ef180-57bf-5dcb-96fe-b0bf9dab9123',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'easy',
   $q$Evaluate $_5P_2$.$q$, $q$[{"text":"25","is_correct":false,"misconception_token":"squared-n"},{"text":"20","is_correct":true},{"text":"7","is_correct":false,"misconception_token":"added-n-and-r"},{"text":"10","is_correct":false,"misconception_token":"computed-combination-instead"}]$q$::jsonb, $q$20$q$, $q$A permutation of $2$ from $5$ is $_5P_2 = 5 \times 4 = 20$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6dab0220-76eb-5cf5-854b-107df7b88404',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'easy',
   $q$Evaluate $_6C_2$.$q$, $q$[{"text":"15","is_correct":true},{"text":"30","is_correct":false,"misconception_token":"computed-permutation-instead"},{"text":"12","is_correct":false,"misconception_token":"multiplied-n-and-r"},{"text":"8","is_correct":false,"misconception_token":"added-n-and-r"}]$q$::jsonb, $q$15$q$, $q$A combination of $2$ from $6$ is $_6C_2 = \frac{6 \times 5}{2 \times 1} = 15$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('943f1082-d992-536f-92a9-8d52152128a1',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'easy',
   $q$A fair six-sided die is rolled once. What is the probability of rolling a $4$?$q$, $q$[{"text":"$\\frac{4}{6}$","is_correct":false,"misconception_token":"used-face-value-as-count"},{"text":"$\\frac{5}{6}$","is_correct":false,"misconception_token":"took-complement"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"guessed-half"},{"text":"$\\frac{1}{6}$","is_correct":true}]$q$::jsonb, $q$$\frac{1}{6}$$q$, $q$There is $1$ favorable outcome out of $6$ equally likely outcomes, so the probability is $\frac{1}{6}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0ecd7cdd-5092-5c6e-9dbc-09a5674e8312',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'easy',
   $q$A single card is drawn from a standard deck of $52$ cards. What is the probability that it is a heart?$q$, $q$[{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"guessed-half"},{"text":"$\\frac{1}{52}$","is_correct":false,"misconception_token":"counted-one-card"},{"text":"$\\frac{1}{13}$","is_correct":false,"misconception_token":"used-ranks-as-denominator"},{"text":"$\\frac{1}{4}$","is_correct":true}]$q$::jsonb, $q$$\frac{1}{4}$$q$, $q$There are $13$ hearts among $52$ cards, so the probability is $\frac{13}{52} = \frac{1}{4}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4daf0636-572e-5fc9-96a8-ee393e12d3c7',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'easy',
   $q$A fair coin is flipped twice. What is the probability of getting heads both times?$q$, $q$[{"text":"$\\frac{1}{3}$","is_correct":false,"misconception_token":"miscounted-outcomes"},{"text":"$1$","is_correct":false,"misconception_token":"added-probabilities"},{"text":"$\\frac{1}{4}$","is_correct":true},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"used-one-flip-only"}]$q$::jsonb, $q$$\frac{1}{4}$$q$, $q$The flips are independent, so $\frac{1}{2} \times \frac{1}{2} = \frac{1}{4}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f28ca4d5-42a3-5d8c-a3f4-56056317d26c',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'easy',
   $q$A fair six-sided die is rolled once. What is the probability of rolling a $2$ or a $5$?$q$, $q$[{"text":"$\\frac{2}{5}$","is_correct":false,"misconception_token":"used-wrong-total"},{"text":"$\\frac{1}{36}$","is_correct":false,"misconception_token":"multiplied-instead-of-added"},{"text":"$\\frac{1}{3}$","is_correct":true},{"text":"$\\frac{1}{6}$","is_correct":false,"misconception_token":"counted-one-outcome"}]$q$::jsonb, $q$$\frac{1}{3}$$q$, $q$The events are mutually exclusive, so add: $\frac{1}{6} + \frac{1}{6} = \frac{2}{6} = \frac{1}{3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('de870ac3-c436-52a2-baf7-a5ea965cf4ab',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'medium',
   $q$How many different ways can the letters of the word MATH be arranged?$q$, $q$[{"text":"24","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"used-two-positions-only"},{"text":"256","is_correct":false,"misconception_token":"used-n-to-the-n"},{"text":"16","is_correct":false,"misconception_token":"squared-the-count"}]$q$::jsonb, $q$24$q$, $q$There are $4$ distinct letters, so the number of arrangements is $4! = 24$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('19905c94-5102-5b9b-ad41-ce2e39ba94c6',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'medium',
   $q$A committee of $3$ people is selected from a group of $10$. How many different committees are possible?$q$, $q$[{"text":"720","is_correct":false,"misconception_token":"used-permutation-order-matters"},{"text":"30","is_correct":false,"misconception_token":"multiplied-n-and-r"},{"text":"120","is_correct":true},{"text":"1000","is_correct":false,"misconception_token":"cubed-n"}]$q$::jsonb, $q$120$q$, $q$Order does not matter for a committee, so $_{10}C_3 = \frac{10 \times 9 \times 8}{3 \times 2 \times 1} = 120$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2fc4b407-e097-5924-ac21-c16d84730a9d',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'medium',
   $q$A president, a vice-president, and a treasurer are chosen from $8$ club members, with no one holding two offices. In how many ways can this be done?$q$, $q$[{"text":"24","is_correct":false,"misconception_token":"multiplied-n-and-r"},{"text":"56","is_correct":false,"misconception_token":"used-combination-ignored-order"},{"text":"336","is_correct":true},{"text":"512","is_correct":false,"misconception_token":"cubed-n"}]$q$::jsonb, $q$336$q$, $q$The offices are distinct, so order matters: $_8P_3 = 8 \times 7 \times 6 = 336$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e133c135-630f-53fb-aca7-cf3e89b9bca6',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'medium',
   $q$How many distinct arrangements are there of the letters in the word BANANA?$q$, $q$[{"text":"360","is_correct":false,"misconception_token":"divided-by-one-repeat-only"},{"text":"720","is_correct":false,"misconception_token":"treated-all-letters-distinct"},{"text":"120","is_correct":false,"misconception_token":"divided-by-other-repeat-only"},{"text":"60","is_correct":true}]$q$::jsonb, $q$60$q$, $q$BANANA has $6$ letters with A repeated $3$ times and N repeated $2$ times: $\frac{6!}{3! \, 2!} = \frac{720}{12} = 60$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('96f6e8ea-c89a-5be5-9518-bf40745ef308',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'medium',
   $q$A fair coin is flipped and a fair six-sided die is rolled. What is the probability of getting heads and a $3$?$q$, $q$[{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"ignored-the-die"},{"text":"$\\frac{1}{12}$","is_correct":true},{"text":"$\\frac{2}{3}$","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"$\\frac{1}{6}$","is_correct":false,"misconception_token":"ignored-the-coin"}]$q$::jsonb, $q$$\frac{1}{12}$$q$, $q$The events are independent, so multiply: $\frac{1}{2} \times \frac{1}{6} = \frac{1}{12}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('13d7af29-6425-51f4-ad88-38cf66b8ed79',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'medium',
   $q$One card is drawn from a standard deck of $52$ cards. What is the probability that it is a king or a queen?$q$, $q$[{"text":"$\\frac{8}{13}$","is_correct":false,"misconception_token":"used-wrong-denominator"},{"text":"$\\frac{1}{13}$","is_correct":false,"misconception_token":"counted-one-rank-only"},{"text":"$\\frac{2}{13}$","is_correct":true},{"text":"$\\frac{1}{169}$","is_correct":false,"misconception_token":"multiplied-instead-of-added"}]$q$::jsonb, $q$$\frac{2}{13}$$q$, $q$There are $4$ kings and $4$ queens, and these are mutually exclusive: $\frac{4}{52} + \frac{4}{52} = \frac{8}{52} = \frac{2}{13}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f6196eb8-e5a0-53bd-878c-eba613d682c0',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'medium',
   $q$A team must include $2$ boys chosen from $5$ boys and $2$ girls chosen from $4$ girls. How many such teams are possible?$q$, $q$[{"text":"20","is_correct":false,"misconception_token":"multiplied-raw-numbers"},{"text":"16","is_correct":false,"misconception_token":"added-the-two-counts"},{"text":"126","is_correct":false,"misconception_token":"pooled-ignored-split"},{"text":"60","is_correct":true}]$q$::jsonb, $q$60$q$, $q$Choose the boys and girls separately, then multiply: $_5C_2 \times _4C_2 = 10 \times 6 = 60$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9743e918-d790-5575-b219-c670e1342214',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'medium',
   $q$A committee of $3$ is chosen at random from $4$ women and $5$ men. What is the probability that all $3$ chosen are women?$q$, $q$[{"text":"$\\frac{1}{21}$","is_correct":true},{"text":"$\\frac{1}{84}$","is_correct":false,"misconception_token":"forgot-to-count-selections"},{"text":"$\\frac{1}{3}$","is_correct":false,"misconception_token":"used-size-over-total"},{"text":"$\\frac{4}{9}$","is_correct":false,"misconception_token":"used-simple-ratio"}]$q$::jsonb, $q$$\frac{1}{21}$$q$, $q$There are $_4C_3 = 4$ all-women committees out of $_9C_3 = 84$ total, so the probability is $\frac{4}{84} = \frac{1}{21}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('69ecb712-dc39-5105-b809-0ac965434ed8',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'hard',
   $q$In how many ways can $5$ people be seated in a row if $2$ particular people must sit next to each other?$q$, $q$[{"text":"24","is_correct":false,"misconception_token":"forgot-to-swap-the-pair"},{"text":"240","is_correct":false,"misconception_token":"double-counted-the-block"},{"text":"120","is_correct":false,"misconception_token":"ignored-the-restriction"},{"text":"48","is_correct":true}]$q$::jsonb, $q$48$q$, $q$Treat the pair as one block, giving $4!$ arrangements, and the pair can be ordered $2$ ways: $2 \times 4! = 2 \times 24 = 48$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dae621f4-318f-5d53-999e-25de9b0192da',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'hard',
   $q$A fair coin is flipped $3$ times. What is the probability of getting at least one head?$q$, $q$[{"text":"$\\frac{7}{8}$","is_correct":true},{"text":"$\\frac{1}{8}$","is_correct":false,"misconception_token":"found-probability-of-no-heads"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"guessed-half"},{"text":"$\\frac{3}{8}$","is_correct":false,"misconception_token":"used-exactly-one-head"}]$q$::jsonb, $q$$\frac{7}{8}$$q$, $q$Use the complement: $P(\text{at least one head}) = 1 - \left(\frac{1}{2}\right)^3 = 1 - \frac{1}{8} = \frac{7}{8}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('864d398a-7b3f-5576-91a1-82b58a33b7bd',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'hard',
   $q$Two cards are drawn without replacement from a standard deck of $52$ cards. What is the probability that both are hearts?$q$, $q$[{"text":"$\\frac{1}{16}$","is_correct":false,"misconception_token":"assumed-replacement"},{"text":"$\\frac{1}{4}$","is_correct":false,"misconception_token":"used-one-draw-only"},{"text":"$\\frac{1}{17}$","is_correct":true},{"text":"$\\frac{4}{17}$","is_correct":false,"misconception_token":"used-second-draw-only"}]$q$::jsonb, $q$$\frac{1}{17}$$q$, $q$The draws are dependent: $\frac{13}{52} \times \frac{12}{51} = \frac{1}{4} \times \frac{4}{17} = \frac{1}{17}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e9b4148b-fb0d-52e2-8e25-6a1516e27937',
   null,
   (select id from public.skills where slug = 'combinatorics-probability'),
   'problem-solving-data-analysis', 'hard',
   $q$In a lottery you choose $5$ different numbers from $1$ to $20$. What is the probability of matching all $5$ winning numbers?$q$, $q$[{"text":"$\\frac{1}{15504}$","is_correct":true},{"text":"$\\frac{1}{4}$","is_correct":false,"misconception_token":"used-simple-ratio"},{"text":"$\\frac{1}{3200000}$","is_correct":false,"misconception_token":"allowed-repeats"},{"text":"$\\frac{1}{1860480}$","is_correct":false,"misconception_token":"used-permutation-order-matters"}]$q$::jsonb, $q$$\frac{1}{15504}$$q$, $q$Order does not matter, so there are $_{20}C_5 = 15504$ equally likely tickets and only one wins: $\frac{1}{15504}$.$q$, 'published')
on conflict (id) do update set
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
