-- PathwayEd — Question Engine: GRADE 4 & 8 math skills + questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-grade4-8-math-seeds.ts from the
-- curated pool in src/lib/grade4_8MathTemplates.ts. Grade 4 fills out the 3-5 band;
-- grade 8 completes the 6-8 band.
--
-- HOW TO APPLY (self-contained — upserts the reused CCSS domains + the skills with
-- their CCSS tags, then the questions):
--   bun run db:seed seeds/0013_grade4_8_math_questions.sql
-- Idempotent. Skills upsert ON CONFLICT (slug) so an existing empty grade-4/8
-- placeholder row is filled in place (id preserved). Depends on migration 0004,
-- 0008, and seed 0001. Answer keys are verified by hand before this seed is run.
--
-- 100% ORIGINAL items written to one CCSS standard each, grade-appropriate.

begin;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-nbt')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Number & Operations in Base Ten', null, '3-5', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-multi-digit-multiplication')::uuid, 'skill', md5('pe-aos:dom-math-nbt')::uuid, 'math', 'Multi-Digit Multiplication', 'multi-digit-multiplication', '3-5', 'problem-solving-data-analysis', '4', 4, 'CCSS.MATH.CONTENT.4.NBT.B.5', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-multi-digit-division')::uuid, 'skill', md5('pe-aos:dom-math-nbt')::uuid, 'math', 'Multi-Digit Division', 'multi-digit-division', '3-5', 'problem-solving-data-analysis', '4', 4, 'CCSS.MATH.CONTENT.4.NBT.B.6', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-frac')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Number & Operations — Fractions', null, '3-5', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-fraction-equivalence')::uuid, 'skill', md5('pe-aos:dom-math-frac')::uuid, 'math', 'Fraction Equivalence & Comparison', 'fraction-equivalence', '3-5', 'problem-solving-data-analysis', '4', 4, 'CCSS.MATH.CONTENT.4.NF.A.1', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-fraction-operations-4')::uuid, 'skill', md5('pe-aos:dom-math-frac')::uuid, 'math', 'Fraction Operations', 'fraction-operations-4', '3-5', 'problem-solving-data-analysis', '4', 4, 'CCSS.MATH.CONTENT.4.NF.B.3', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-oat')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Operations & Algebraic Thinking', null, '3-5', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-factors-multiples')::uuid, 'skill', md5('pe-aos:dom-math-oat')::uuid, 'math', 'Factors & Multiples', 'factors-multiples', '3-5', 'algebra', '4', 4, 'CCSS.MATH.CONTENT.4.OA.B.4', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-md')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Measurement & Data', null, '3-5', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-area-perimeter')::uuid, 'skill', md5('pe-aos:dom-math-md')::uuid, 'math', 'Area & Perimeter', 'area-perimeter', '3-5', 'geometry-trigonometry', '4', 4, 'CCSS.MATH.CONTENT.4.MD.A.3', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-ee7')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Expressions & Equations', null, '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-exponents-scientific-notation')::uuid, 'skill', md5('pe-aos:dom-math-ee7')::uuid, 'math', 'Exponents & Scientific Notation', 'exponents-scientific-notation', '6-8', 'advanced-math', '8', 8, 'CCSS.MATH.CONTENT.8.EE.A', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-geo7')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Geometry', null, '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-pythagorean-theorem')::uuid, 'skill', md5('pe-aos:dom-math-geo7')::uuid, 'math', 'Pythagorean Theorem', 'pythagorean-theorem', '6-8', 'geometry-trigonometry', '8', 8, 'CCSS.MATH.CONTENT.8.G.B.7', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-transformations-8')::uuid, 'skill', md5('pe-aos:dom-math-geo7')::uuid, 'math', 'Transformations', 'transformations-8', '6-8', 'geometry-trigonometry', '8', 8, 'CCSS.MATH.CONTENT.8.G.A', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- multi-digit-multiplication (Multi-Digit Multiplication, grade 4, CCSS.MATH.CONTENT.4.NBT.B.5) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bd3c704c-f34b-5ea6-be74-3a746faf6607',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $3 \times 24$?$q$, $q$[{"text":"27","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"72","is_correct":true},{"text":"60","is_correct":false,"misconception_token":"multiplied-only-tens-place"},{"text":"612","is_correct":false,"misconception_token":"concatenated-digit-products"}]$q$::jsonb, $q$72$q$, $q$Break 24 into 20 and 4: $3 \times 20 = 60$ and $3 \times 4 = 12$, then $60 + 12 = 72$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('035907a4-328f-561c-bde3-35b05452708b',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $5 \times 63$?$q$, $q$[{"text":"315","is_correct":true},{"text":"300","is_correct":false,"misconception_token":"multiplied-only-tens-place"},{"text":"305","is_correct":false,"misconception_token":"dropped-the-carry"},{"text":"68","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, $q$315$q$, $q$Break 63 into 60 and 3: $5 \times 60 = 300$ and $5 \times 3 = 15$, then $300 + 15 = 315$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7870c8cd-ab8b-51c8-b417-69ddfec6797d',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $6 \times 48$?$q$, $q$[{"text":"248","is_correct":false,"misconception_token":"dropped-the-carry"},{"text":"288","is_correct":true},{"text":"2448","is_correct":false,"misconception_token":"concatenated-digit-products"},{"text":"240","is_correct":false,"misconception_token":"multiplied-only-tens-place"}]$q$::jsonb, $q$288$q$, $q$Break 48 into 40 and 8: $6 \times 40 = 240$ and $6 \times 8 = 48$, then $240 + 48 = 288$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5134abe9-3101-5026-ae7f-e94ad2e2de6b',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$A box holds 8 crayons. How many crayons are in 34 boxes?$q$, $q$[{"text":"272","is_correct":true},{"text":"240","is_correct":false,"misconception_token":"multiplied-only-tens-place"},{"text":"32","is_correct":false,"misconception_token":"multiplied-only-ones-place"},{"text":"42","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, $q$272$q$, $q$Multiply $8 \times 34$: $8 \times 30 = 240$ and $8 \times 4 = 32$, then $240 + 32 = 272$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b4b4fbd7-c52f-5efe-bf8a-8083be34c8a8',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $9 \times 26$?$q$, $q$[{"text":"180","is_correct":false,"misconception_token":"multiplied-only-tens-place"},{"text":"35","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"184","is_correct":false,"misconception_token":"dropped-the-carry"},{"text":"234","is_correct":true}]$q$::jsonb, $q$234$q$, $q$Break 26 into 20 and 6: $9 \times 20 = 180$ and $9 \times 6 = 54$, then $180 + 54 = 234$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('070e7cd7-f7c5-51f6-825a-927b5ab815b4',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$Each row in a theater has 7 seats. The theater has 58 rows. How many seats are there in all?$q$, $q$[{"text":"65","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"356","is_correct":false,"misconception_token":"dropped-the-carry"},{"text":"350","is_correct":false,"misconception_token":"multiplied-only-tens-place"},{"text":"406","is_correct":true}]$q$::jsonb, $q$406$q$, $q$Multiply $7 \times 58$: $7 \times 50 = 350$ and $7 \times 8 = 56$, then $350 + 56 = 406$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('271912ac-d66a-57e4-863f-eac962be103c',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $2 \times 346$?$q$, $q$[{"text":"348","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"682","is_correct":false,"misconception_token":"dropped-the-carry"},{"text":"692","is_correct":true},{"text":"6812","is_correct":false,"misconception_token":"concatenated-digit-products"}]$q$::jsonb, $q$692$q$, $q$Break 346 into 300, 40, and 6: $2 \times 300 = 600$, $2 \times 40 = 80$, $2 \times 6 = 12$, then $600 + 80 + 12 = 692$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3b7e49b8-fc79-56e4-9fba-5c83e9c544c3',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $6 \times 70$?$q$, $q$[{"text":"76","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"42","is_correct":false,"misconception_token":"dropped-the-place-value-zero"},{"text":"420","is_correct":true},{"text":"4200","is_correct":false,"misconception_token":"added-extra-zero"}]$q$::jsonb, $q$420$q$, $q$Multiply $6 \times 7 = 42$, then attach the place-value zero from 70: $6 \times 70 = 420$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6e386722-3b74-53c1-95d5-543dd39aef3b',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $23 \times 14$?$q$, $q$[{"text":"322","is_correct":true},{"text":"115","is_correct":false,"misconception_token":"forgot-place-value-shift"},{"text":"37","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"92","is_correct":false,"misconception_token":"used-only-ones-partial"}]$q$::jsonb, $q$322$q$, $q$Break 14 into 10 and 4: $23 \times 10 = 230$ and $23 \times 4 = 92$, then $230 + 92 = 322$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c21a28b1-8ae3-5f4b-aff7-b2c3c2ca4dc8',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $46 \times 25$?$q$, $q$[{"text":"322","is_correct":false,"misconception_token":"forgot-place-value-shift"},{"text":"920","is_correct":false,"misconception_token":"used-only-tens-partial"},{"text":"1150","is_correct":true},{"text":"230","is_correct":false,"misconception_token":"used-only-ones-partial"}]$q$::jsonb, $q$1150$q$, $q$Break 25 into 20 and 5: $46 \times 20 = 920$ and $46 \times 5 = 230$, then $920 + 230 = 1150$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6c78869f-ae97-5fd0-bd6a-260e3922937f',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$A school orders 32 tablets. Each tablet costs 15 dollars. How much do all the tablets cost?$q$, $q$[{"text":"320 dollars","is_correct":false,"misconception_token":"used-only-tens-partial"},{"text":"192 dollars","is_correct":false,"misconception_token":"forgot-place-value-shift"},{"text":"480 dollars","is_correct":true},{"text":"47 dollars","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, $q$480 dollars$q$, $q$Multiply $32 \times 15$: $32 \times 10 = 320$ and $32 \times 5 = 160$, then $320 + 160 = 480$, so the cost is 480 dollars.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ebf43b03-1d90-5986-9d34-1aa2bb86afe4',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $7 \times 1234$?$q$, $q$[{"text":"1638","is_correct":false,"misconception_token":"ignored-thousands-digit"},{"text":"7418","is_correct":false,"misconception_token":"dropped-the-carry"},{"text":"1241","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"8638","is_correct":true}]$q$::jsonb, $q$8638$q$, $q$Break 1234 into 1000, 200, 30, and 4: $7 \times 1000 = 7000$, $7 \times 200 = 1400$, $7 \times 30 = 210$, $7 \times 4 = 28$, then $7000 + 1400 + 210 + 28 = 8638$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('52c3bc1e-53db-5e0c-bad4-a14046aa791e',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$A factory makes 268 bottles each hour. How many bottles does it make in 6 hours?$q$, $q$[{"text":"1268","is_correct":false,"misconception_token":"dropped-the-carry"},{"text":"1608","is_correct":true},{"text":"274","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"168","is_correct":false,"misconception_token":"ignored-hundreds-digit"}]$q$::jsonb, $q$1608$q$, $q$Multiply $268 \times 6$: $200 \times 6 = 1200$, $60 \times 6 = 360$, $8 \times 6 = 48$, then $1200 + 360 + 48 = 1608$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0a4ae329-2158-50c5-967f-9f4193dca56c',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $58 \times 37$?$q$, $q$[{"text":"95","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"580","is_correct":false,"misconception_token":"forgot-place-value-shift"},{"text":"2146","is_correct":true},{"text":"1740","is_correct":false,"misconception_token":"used-only-tens-partial"}]$q$::jsonb, $q$2146$q$, $q$Break 37 into 30 and 7: $58 \times 30 = 1740$ and $58 \times 7 = 406$, then $1740 + 406 = 2146$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2999d584-b41a-54e8-867f-01485502e318',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$A garden has 24 rows of plants with 36 plants in each row. How many plants are in the garden?$q$, $q$[{"text":"60","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"216","is_correct":false,"misconception_token":"forgot-place-value-shift"},{"text":"720","is_correct":false,"misconception_token":"used-only-tens-partial"},{"text":"864","is_correct":true}]$q$::jsonb, $q$864$q$, $q$Multiply $24 \times 36$: $24 \times 30 = 720$ and $24 \times 6 = 144$, then $720 + 144 = 864$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('82f855f7-d53d-5c4a-843d-48643c4c177e',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $8 \times 3005$?$q$, $q$[{"text":"24040","is_correct":true},{"text":"280","is_correct":false,"misconception_token":"ignored-place-value-zeros"},{"text":"3013","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"24000","is_correct":false,"misconception_token":"dropped-the-carry"}]$q$::jsonb, $q$24040$q$, $q$Break 3005 into 3000 and 5: $8 \times 3000 = 24000$ and $8 \times 5 = 40$, then $24000 + 40 = 24040$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bbf73076-1edc-53d3-9228-8d6a8a5652e3',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What is $67 \times 48$?$q$, $q$[{"text":"2680","is_correct":false,"misconception_token":"used-only-tens-partial"},{"text":"115","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"804","is_correct":false,"misconception_token":"forgot-place-value-shift"},{"text":"3216","is_correct":true}]$q$::jsonb, $q$3216$q$, $q$Break 48 into 40 and 8: $67 \times 40 = 2680$ and $67 \times 8 = 536$, then $2680 + 536 = 3216$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f094f45a-0662-5628-ad53-0ab545630f26',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$A stadium has 48 sections, and each section has 76 seats. If 512 seats are broken, how many seats can be used?$q$, $q$[{"text":"3136","is_correct":true},{"text":"3648","is_correct":false,"misconception_token":"forgot-to-subtract"},{"text":"112","is_correct":false,"misconception_token":"forgot-place-value-shift"},{"text":"4160","is_correct":false,"misconception_token":"added-instead-of-subtracting"}]$q$::jsonb, $q$3136$q$, $q$First multiply $48 \times 76 = 3648$ total seats, then subtract the broken ones: $3648 - 512 = 3136$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('414b3493-f603-5b01-b459-47ce6cf5f143',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$A warehouse ships 1875 boxes each day. How many boxes does it ship in 4 days?$q$, $q$[{"text":"4280","is_correct":false,"misconception_token":"dropped-the-carry"},{"text":"3500","is_correct":false,"misconception_token":"ignored-thousands-digit"},{"text":"7500","is_correct":true},{"text":"1879","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, $q$7500$q$, $q$Break 1875 into 1000, 800, 70, and 5: $4 \times 1000 = 4000$, $4 \times 800 = 3200$, $4 \times 70 = 280$, $4 \times 5 = 20$, then $4000 + 3200 + 280 + 20 = 7500$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a0beb088-62a6-5c3e-bdda-836bf2f66444',
   null,
   (select id from public.skills where slug = 'multi-digit-multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$A book fair sells 35 books at 12 dollars each and 18 books at 20 dollars each. How much money does the fair collect in all?$q$, $q$[{"text":"780 dollars","is_correct":true},{"text":"360 dollars","is_correct":false,"misconception_token":"used-only-second-group"},{"text":"456 dollars","is_correct":false,"misconception_token":"dropped-the-place-value-zero"},{"text":"420 dollars","is_correct":false,"misconception_token":"used-only-first-group"}]$q$::jsonb, $q$780 dollars$q$, $q$Find each group: $35 \times 12 = 420$ and $18 \times 20 = 360$, then add: $420 + 360 = 780$, so the fair collects 780 dollars.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- multi-digit-division (Multi-Digit Division, grade 4, CCSS.MATH.CONTENT.4.NBT.B.6) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('508a8707-d6a3-5878-b3e2-afc0ab2db95e',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $84 \div 4$?$q$, $q$[{"text":"22","is_correct":false,"misconception_token":"wrong-partial-quotient"},{"text":"21","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"dropped-ones-place"},{"text":"12","is_correct":false,"misconception_token":"reversed-quotient-digits"}]$q$::jsonb, $q$21$q$, $q$Break 84 into 80 and 4: $80 \div 4 = 20$ and $4 \div 4 = 1$, so $84 \div 4 = 21$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('24fb7502-b913-5c45-8b65-b9ac3062c840',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $96 \div 3$?$q$, $q$[{"text":"32","is_correct":true},{"text":"33","is_correct":false,"misconception_token":"wrong-partial-quotient"},{"text":"23","is_correct":false,"misconception_token":"reversed-quotient-digits"},{"text":"31","is_correct":false,"misconception_token":"off-by-one-quotient"}]$q$::jsonb, $q$32$q$, $q$Break 96 into 90 and 6: $90 \div 3 = 30$ and $6 \div 3 = 2$, so $96 \div 3 = 32$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('81f20c01-2546-5924-a1c8-7d42e3b68264',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $72 \div 6$?$q$, $q$[{"text":"11","is_correct":false,"misconception_token":"off-by-one-quotient"},{"text":"12","is_correct":true},{"text":"13","is_correct":false,"misconception_token":"wrong-partial-quotient"},{"text":"21","is_correct":false,"misconception_token":"reversed-quotient-digits"}]$q$::jsonb, $q$12$q$, $q$Break 72 into 60 and 12: $60 \div 6 = 10$ and $12 \div 6 = 2$, so $72 \div 6 = 12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('35b3737e-c81c-5dd2-99d2-b5e81aa1e39b',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $65 \div 5$?$q$, $q$[{"text":"13","is_correct":true},{"text":"31","is_correct":false,"misconception_token":"reversed-quotient-digits"},{"text":"12","is_correct":false,"misconception_token":"off-by-one-quotient"},{"text":"15","is_correct":false,"misconception_token":"wrong-partial-quotient"}]$q$::jsonb, $q$13$q$, $q$Break 65 into 50 and 15: $50 \div 5 = 10$ and $15 \div 5 = 3$, so $65 \div 5 = 13$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('714d91db-faaf-5d6c-8e53-569de3c55810',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $47 \div 5$? Give the quotient and remainder.$q$, $q$[{"text":"9 R3","is_correct":false,"misconception_token":"wrong-remainder"},{"text":"9 R5","is_correct":false,"misconception_token":"remainder-equals-divisor"},{"text":"8 R2","is_correct":false,"misconception_token":"quotient-too-small"},{"text":"9 R2","is_correct":true}]$q$::jsonb, $q$9 R2$q$, $q$The largest multiple of 5 below 47 is $5 \times 9 = 45$, and $47 - 45 = 2$, so the answer is 9 R2.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ace4be4b-fbc8-5caf-9033-a11b12b1596f',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $38 \div 4$? Give the quotient and remainder.$q$, $q$[{"text":"10 R2","is_correct":false,"misconception_token":"quotient-too-big"},{"text":"9 R1","is_correct":false,"misconception_token":"wrong-remainder"},{"text":"8 R6","is_correct":false,"misconception_token":"remainder-too-big"},{"text":"9 R2","is_correct":true}]$q$::jsonb, $q$9 R2$q$, $q$The largest multiple of 4 below 38 is $4 \times 9 = 36$, and $38 - 36 = 2$, so the answer is 9 R2.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d67b90d8-10f6-57cb-97fe-c0dbae0370a1',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $128 \div 4$?$q$, $q$[{"text":"23","is_correct":false,"misconception_token":"reversed-quotient-digits"},{"text":"31","is_correct":false,"misconception_token":"off-by-one-quotient"},{"text":"32","is_correct":true},{"text":"42","is_correct":false,"misconception_token":"wrong-partial-quotient"}]$q$::jsonb, $q$32$q$, $q$Break 128 into 120 and 8: $120 \div 4 = 30$ and $8 \div 4 = 2$, so $128 \div 4 = 32$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9d5ef560-c13d-5649-a814-137358ec7237',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $150 \div 5$?$q$, $q$[{"text":"25","is_correct":false,"misconception_token":"quotient-too-small"},{"text":"3","is_correct":false,"misconception_token":"dropped-trailing-zero"},{"text":"30","is_correct":true},{"text":"35","is_correct":false,"misconception_token":"quotient-too-big"}]$q$::jsonb, $q$30$q$, $q$Since $5 \times 30 = 150$, the quotient is 30. In place value, $15 \div 5 = 3$ tens, which is 30.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5c8efa6d-071f-5815-ad53-390015c30546',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $856 \div 4$?$q$, $q$[{"text":"214","is_correct":true},{"text":"204","is_correct":false,"misconception_token":"skipped-middle-digit"},{"text":"215","is_correct":false,"misconception_token":"wrong-partial-quotient"},{"text":"213","is_correct":false,"misconception_token":"off-by-one-quotient"}]$q$::jsonb, $q$214$q$, $q$Dividing by place: $8 \div 4 = 2$ hundreds, $5 \div 4 = 1$ ten remainder 1, then $16 \div 4 = 4$ ones, giving 214.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('86c98eb5-0a4f-5cf2-a332-2033d45a33dc',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $738 \div 6$?$q$, $q$[{"text":"122","is_correct":false,"misconception_token":"off-by-one-quotient"},{"text":"113","is_correct":false,"misconception_token":"skipped-middle-digit"},{"text":"123","is_correct":true},{"text":"133","is_correct":false,"misconception_token":"wrong-partial-quotient"}]$q$::jsonb, $q$123$q$, $q$Dividing by place: $7 \div 6 = 1$ remainder 1, then $13 \div 6 = 2$ remainder 1, then $18 \div 6 = 3$, giving 123.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8e5c27ac-310d-5c36-ac51-3510fdc55bea',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'medium',
   $q$A teacher shares 100 pencils equally among 6 students. How many pencils does each student get, and how many are left over?$q$, $q$[{"text":"17 each, 2 left over","is_correct":false,"misconception_token":"quotient-too-big"},{"text":"16 each, 6 left over","is_correct":false,"misconception_token":"remainder-equals-divisor"},{"text":"16 each, 4 left over","is_correct":true},{"text":"15 each, 10 left over","is_correct":false,"misconception_token":"remainder-too-big"}]$q$::jsonb, $q$16 each, 4 left over$q$, $q$Since $6 \times 16 = 96$ and $100 - 96 = 4$, each student gets 16 pencils with 4 left over.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('24639c7c-4ac7-5deb-92a2-b5254b219dfb',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $945 \div 7$?$q$, $q$[{"text":"125","is_correct":false,"misconception_token":"skipped-middle-digit"},{"text":"134","is_correct":false,"misconception_token":"off-by-one-quotient"},{"text":"145","is_correct":false,"misconception_token":"wrong-partial-quotient"},{"text":"135","is_correct":true}]$q$::jsonb, $q$135$q$, $q$Dividing by place: $9 \div 7 = 1$ remainder 2, then $24 \div 7 = 3$ remainder 3, then $35 \div 7 = 5$, giving 135.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2454bac8-428c-5741-affd-8a76aee9ed67',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'medium',
   $q$A farmer puts 512 apples into bags that each hold 8 apples. How many bags does the farmer fill?$q$, $q$[{"text":"63","is_correct":false,"misconception_token":"off-by-one-quotient"},{"text":"64","is_correct":true},{"text":"62","is_correct":false,"misconception_token":"wrong-partial-quotient"},{"text":"65","is_correct":false,"misconception_token":"rounded-up-unnecessarily"}]$q$::jsonb, $q$64$q$, $q$Since $8 \times 64 = 512$ exactly, the farmer fills 64 bags with no apples left over.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0d4b963d-5484-5ffb-9fc0-ddb68304ed5d',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $623 \div 3$? Give the quotient and remainder.$q$, $q$[{"text":"217 R2","is_correct":false,"misconception_token":"wrong-partial-quotient"},{"text":"27 R2","is_correct":false,"misconception_token":"dropped-middle-zero"},{"text":"207 R2","is_correct":true},{"text":"207 R1","is_correct":false,"misconception_token":"wrong-remainder"}]$q$::jsonb, $q$207 R2$q$, $q$Dividing by place: $6 \div 3 = 2$, then $2 \div 3 = 0$ remainder 2, then $23 \div 3 = 7$ remainder 2, giving 207 R2.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7b8754b3-05d4-55ab-91cf-0466fc3dc184',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'medium',
   $q$A ferry can carry 8 cars on each trip. There are 50 cars waiting to cross the river. How many trips are needed to carry all of the cars?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"rounded-too-far"},{"text":"6","is_correct":false,"misconception_token":"ignored-remainder"},{"text":"6 R2","is_correct":false,"misconception_token":"left-answer-as-remainder"},{"text":"7","is_correct":true}]$q$::jsonb, $q$7$q$, $q$Since $50 \div 8 = 6$ remainder 2, six trips carry 48 cars and 2 cars remain, so a 7th trip is needed, for 7 trips.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('17260aaa-bc35-51b0-9860-3533e1d9a245',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $2408 \div 4$?$q$, $q$[{"text":"602","is_correct":true},{"text":"612","is_correct":false,"misconception_token":"wrong-partial-quotient"},{"text":"601","is_correct":false,"misconception_token":"off-by-one-quotient"},{"text":"62","is_correct":false,"misconception_token":"dropped-place-zero"}]$q$::jsonb, $q$602$q$, $q$Dividing by place: $24 \div 4 = 6$ hundreds, $0 \div 4 = 0$ tens, and $8 \div 4 = 2$ ones, giving 602.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('089a783c-647c-5ba9-95e1-e224bbb21048',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'hard',
   $q$What is $3765 \div 5$?$q$, $q$[{"text":"752","is_correct":false,"misconception_token":"off-by-one-quotient"},{"text":"763","is_correct":false,"misconception_token":"wrong-partial-quotient"},{"text":"743","is_correct":false,"misconception_token":"skipped-middle-digit"},{"text":"753","is_correct":true}]$q$::jsonb, $q$753$q$, $q$Dividing by place: $37 \div 5 = 7$ remainder 2, then $26 \div 5 = 5$ remainder 1, then $15 \div 5 = 3$, giving 753.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5c612b97-cae7-5f2d-9002-768485cbdab3',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'hard',
   $q$What is $4926 \div 8$? Give the quotient and remainder.$q$, $q$[{"text":"615 R6","is_correct":true},{"text":"605 R6","is_correct":false,"misconception_token":"skipped-middle-digit"},{"text":"616 R6","is_correct":false,"misconception_token":"quotient-too-big"},{"text":"615 R2","is_correct":false,"misconception_token":"wrong-remainder"}]$q$::jsonb, $q$615 R6$q$, $q$Dividing by place: $49 \div 8 = 6$ remainder 1, then $12 \div 8 = 1$ remainder 4, then $46 \div 8 = 5$ remainder 6, giving 615 R6.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1b2e9f53-cc86-5969-b3c1-802dcd602675',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'hard',
   $q$A factory makes 1,250 toys and packs them into boxes that each hold 9 toys. After filling as many complete boxes as possible, how many toys are left over?$q$, $q$[{"text":"138","is_correct":false,"misconception_token":"gave-quotient-not-remainder"},{"text":"7","is_correct":false,"misconception_token":"wrong-remainder"},{"text":"8","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"subtracted-incorrectly"}]$q$::jsonb, $q$8$q$, $q$Since $9 \times 138 = 1242$ and $1250 - 1242 = 8$, there are 138 full boxes and 8 toys left over.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('584ee11d-96aa-5398-8369-7ff229514b1e',
   null,
   (select id from public.skills where slug = 'multi-digit-division'),
   'problem-solving-data-analysis', 'hard',
   $q$A park worker plants 2,024 trees, putting exactly 7 trees in each row. How many complete rows are planted, and how many trees are left over?$q$, $q$[{"text":"289 rows, 1 left over","is_correct":true},{"text":"288 rows, 8 left over","is_correct":false,"misconception_token":"remainder-too-big"},{"text":"290 rows, 6 left over","is_correct":false,"misconception_token":"quotient-too-big"},{"text":"289 rows, 3 left over","is_correct":false,"misconception_token":"wrong-remainder"}]$q$::jsonb, $q$289 rows, 1 left over$q$, $q$Since $7 \times 289 = 2023$ and $2024 - 2023 = 1$, there are 289 complete rows with 1 tree left over.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- fraction-equivalence (Fraction Equivalence & Comparison, grade 4, CCSS.MATH.CONTENT.4.NF.A.1) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('57fe81f7-dbd2-51fd-bc12-16f5685428e2',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'easy',
   $q$Which fraction is equivalent to $\frac{1}{2}$?$q$, $q$[{"text":"$\\frac{4}{2}$","is_correct":false,"misconception_token":"inverted-fraction"},{"text":"$\\frac{2}{4}$","is_correct":true},{"text":"$\\frac{1}{4}$","is_correct":false,"misconception_token":"multiplied-denominator-only"},{"text":"$\\frac{2}{3}$","is_correct":false,"misconception_token":"added-one-to-both"}]$q$::jsonb, $q$$\frac{2}{4}$$q$, $q$Multiply the numerator and denominator by the same number: $\frac{1}{2} = \frac{1 \times 2}{2 \times 2} = \frac{2}{4}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('28df7d9c-d474-59b9-82d2-c86d10cf4c82',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'easy',
   $q$Fill in the missing numerator: $\frac{1}{3} = \frac{?}{6}$.$q$, $q$[{"text":"2","is_correct":true},{"text":"1","is_correct":false,"misconception_token":"kept-numerator-unchanged"},{"text":"3","is_correct":false,"misconception_token":"used-half-of-denominator"},{"text":"4","is_correct":false,"misconception_token":"added-denominator-difference"}]$q$::jsonb, $q$2$q$, $q$The denominator was multiplied by 2 to get from 3 to 6, so the numerator is $1 \times 2 = 2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b1b5ed1e-c158-534c-af38-659c85de550f',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'easy',
   $q$Write $\frac{4}{8}$ in lowest terms.$q$, $q$[{"text":"$\\frac{1}{4}$","is_correct":false,"misconception_token":"over-divided-numerator"},{"text":"$\\frac{1}{2}$","is_correct":true},{"text":"$\\frac{2}{1}$","is_correct":false,"misconception_token":"inverted-fraction"},{"text":"$\\frac{2}{4}$","is_correct":false,"misconception_token":"not-fully-reduced"}]$q$::jsonb, $q$$\frac{1}{2}$$q$, $q$Divide the numerator and denominator by their greatest common factor 4: $\frac{4 \div 4}{8 \div 4} = \frac{1}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0a31adae-ca20-5c0c-9dca-8e7448450b2d',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'easy',
   $q$Write $\frac{6}{9}$ in lowest terms.$q$, $q$[{"text":"$\\frac{2}{3}$","is_correct":true},{"text":"$\\frac{3}{6}$","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"$\\frac{2}{9}$","is_correct":false,"misconception_token":"divided-numerator-only"},{"text":"$\\frac{3}{2}$","is_correct":false,"misconception_token":"inverted-fraction"}]$q$::jsonb, $q$$\frac{2}{3}$$q$, $q$The greatest common factor of 6 and 9 is 3, so $\frac{6 \div 3}{9 \div 3} = \frac{2}{3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8b00a63c-6abb-5551-b166-b902a8a50b17',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'easy',
   $q$Which fraction is equivalent to $\frac{3}{4}$?$q$, $q$[{"text":"$\\frac{4}{5}$","is_correct":false,"misconception_token":"added-one-to-both"},{"text":"$\\frac{3}{8}$","is_correct":false,"misconception_token":"multiplied-denominator-only"},{"text":"$\\frac{6}{4}$","is_correct":false,"misconception_token":"multiplied-numerator-only"},{"text":"$\\frac{6}{8}$","is_correct":true}]$q$::jsonb, $q$$\frac{6}{8}$$q$, $q$Multiply numerator and denominator by 2: $\frac{3 \times 2}{4 \times 2} = \frac{6}{8}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d9c50f33-0e24-5409-915c-ff7c3c9b2bdc',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'easy',
   $q$Fill in the missing numerator: $\frac{2}{5} = \frac{?}{15}$.$q$, $q$[{"text":"2","is_correct":false,"misconception_token":"kept-numerator-unchanged"},{"text":"3","is_correct":false,"misconception_token":"used-multiplier-as-numerator"},{"text":"12","is_correct":false,"misconception_token":"added-denominator-difference"},{"text":"6","is_correct":true}]$q$::jsonb, $q$6$q$, $q$The denominator was multiplied by 3 to get from 5 to 15, so the numerator is $2 \times 3 = 6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5c7df02b-297a-55b0-93c3-7fdef3077aaf',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'easy',
   $q$Which of these fractions is the largest: $\frac{1}{2}$, $\frac{1}{3}$, $\frac{1}{4}$, or $\frac{1}{5}$?$q$, $q$[{"text":"$\\frac{1}{4}$","is_correct":false,"misconception_token":"denominator-4-looks-big"},{"text":"$\\frac{1}{5}$","is_correct":false,"misconception_token":"bigger-denominator-bigger-fraction"},{"text":"$\\frac{1}{2}$","is_correct":true},{"text":"$\\frac{1}{3}$","is_correct":false,"misconception_token":"denominator-3-looks-big"}]$q$::jsonb, $q$$\frac{1}{2}$$q$, $q$With the same numerator, the fraction with the smallest denominator is largest, so $\frac{1}{2}$ is the largest.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('893badf4-cb2a-5cfe-b701-e76dec2c83dd',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'easy',
   $q$Write $\frac{8}{12}$ in lowest terms.$q$, $q$[{"text":"$\\frac{2}{4}$","is_correct":false,"misconception_token":"divided-by-different-numbers"},{"text":"$\\frac{4}{6}$","is_correct":false,"misconception_token":"only-divided-once"},{"text":"$\\frac{2}{3}$","is_correct":true},{"text":"$\\frac{3}{2}$","is_correct":false,"misconception_token":"inverted-fraction"}]$q$::jsonb, $q$$\frac{2}{3}$$q$, $q$The greatest common factor of 8 and 12 is 4, so $\frac{8 \div 4}{12 \div 4} = \frac{2}{3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ce5fdd79-073d-5029-aad7-daf7d9bb7e27',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'medium',
   $q$Which symbol makes this true: $\frac{2}{3}$ ___ $\frac{3}{5}$?$q$, $q$[{"text":"$>$","is_correct":true},{"text":"$<$","is_correct":false,"misconception_token":"compared-denominators"},{"text":"$\\leq$","is_correct":false,"misconception_token":"chose-less-or-equal"},{"text":"$=$","is_correct":false,"misconception_token":"assumed-equal"}]$q$::jsonb, $q$$>$$q$, $q$Using a common denominator of 15, $\frac{2}{3} = \frac{10}{15}$ and $\frac{3}{5} = \frac{9}{15}$, so $\frac{2}{3} > \frac{3}{5}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7c0fe599-6348-58d3-b027-49313b48466a',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'medium',
   $q$Fill in the missing denominator: $\frac{3}{5} = \frac{12}{?}$.$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"added-numerator-to-denominator"},{"text":"14","is_correct":false,"misconception_token":"added-numerator-difference"},{"text":"20","is_correct":true},{"text":"60","is_correct":false,"misconception_token":"multiplied-denominator-by-numerator"}]$q$::jsonb, $q$20$q$, $q$The numerator was multiplied by 4 to get from 3 to 12, so the denominator is $5 \times 4 = 20$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ef74e871-bf57-584d-9842-b9a5a23697cf',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'medium',
   $q$A pizza is cut into 8 equal slices. Maria eats 2 slices. What fraction of the pizza did she eat, in lowest terms?$q$, $q$[{"text":"$\\frac{1}{3}$","is_correct":false,"misconception_token":"wrong-simplification"},{"text":"$\\frac{2}{8}$","is_correct":false,"misconception_token":"did-not-simplify"},{"text":"$\\frac{1}{4}$","is_correct":true},{"text":"$\\frac{2}{6}$","is_correct":false,"misconception_token":"subtracted-from-denominator"}]$q$::jsonb, $q$$\frac{1}{4}$$q$, $q$She ate $\frac{2}{8}$, and dividing top and bottom by 2 gives $\frac{1}{4}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9fb74d31-d906-5f25-ab75-1396f9c83dcb',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'medium',
   $q$In a class, $\frac{4}{6}$ of the students play a sport. Written in lowest terms, what fraction is this?$q$, $q$[{"text":"$\\frac{1}{3}$","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"$\\frac{4}{6}$","is_correct":false,"misconception_token":"left-unsimplified"},{"text":"$\\frac{3}{2}$","is_correct":false,"misconception_token":"inverted-fraction"},{"text":"$\\frac{2}{3}$","is_correct":true}]$q$::jsonb, $q$$\frac{2}{3}$$q$, $q$The greatest common factor of 4 and 6 is 2, so $\frac{4 \div 2}{6 \div 2} = \frac{2}{3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('97232a75-5313-5a60-bfc1-4b3e945c6a2b',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'medium',
   $q$Ben ran $\frac{5}{8}$ of a mile and Tara ran $\frac{3}{4}$ of a mile. Who ran farther?$q$, $q$[{"text":"Ben","is_correct":false,"misconception_token":"compared-numerators-only"},{"text":"Tara","is_correct":true},{"text":"It cannot be determined","is_correct":false,"misconception_token":"thought-uncomparable"},{"text":"They ran the same distance","is_correct":false,"misconception_token":"ignored-denominators"}]$q$::jsonb, $q$Tara$q$, $q$Rewrite $\frac{3}{4}$ as $\frac{6}{8}$; since $\frac{6}{8} > \frac{5}{8}$, Tara ran farther.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d6b1f676-2428-5d8d-b176-0fc549487e9b',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'medium',
   $q$Which fraction is equivalent to $\frac{2}{3}$?$q$, $q$[{"text":"$\\frac{10}{20}$","is_correct":false,"misconception_token":"multiplied-denominator-by-more"},{"text":"$\\frac{10}{12}$","is_correct":false,"misconception_token":"used-different-multipliers"},{"text":"$\\frac{10}{15}$","is_correct":true},{"text":"$\\frac{9}{15}$","is_correct":false,"misconception_token":"wrong-numerator"}]$q$::jsonb, $q$$\frac{10}{15}$$q$, $q$Multiply numerator and denominator by 5: $\frac{2 \times 5}{3 \times 5} = \frac{10}{15}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1409a64f-7115-5e95-8497-bbcfdf346e17',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'medium',
   $q$Which fraction is the smallest: $\frac{3}{4}$, $\frac{2}{3}$, or $\frac{5}{6}$?$q$, $q$[{"text":"They are all equal","is_correct":false,"misconception_token":"assumed-equal"},{"text":"$\\frac{3}{4}$","is_correct":false,"misconception_token":"misjudged-by-numerator"},{"text":"$\\frac{5}{6}$","is_correct":false,"misconception_token":"largest-mistaken-for-smallest"},{"text":"$\\frac{2}{3}$","is_correct":true}]$q$::jsonb, $q$$\frac{2}{3}$$q$, $q$Using a common denominator of 12, they become $\frac{9}{12}$, $\frac{8}{12}$, and $\frac{10}{12}$, so $\frac{2}{3}$ is smallest.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4bbc99cc-14e8-555a-b6a9-9dd4233b1c06',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'medium',
   $q$Write $\frac{12}{18}$ in lowest terms.$q$, $q$[{"text":"$\\frac{2}{3}$","is_correct":true},{"text":"$\\frac{4}{6}$","is_correct":false,"misconception_token":"divided-by-3-only"},{"text":"$\\frac{3}{2}$","is_correct":false,"misconception_token":"inverted-fraction"},{"text":"$\\frac{6}{9}$","is_correct":false,"misconception_token":"divided-by-2-only"}]$q$::jsonb, $q$$\frac{2}{3}$$q$, $q$The greatest common factor of 12 and 18 is 6, so $\frac{12 \div 6}{18 \div 6} = \frac{2}{3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('26f8acf8-d6c2-5894-9c95-9ef89bf11045',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'hard',
   $q$Jordan answered 15 of the 20 problems on a quiz correctly. Written in lowest terms, what fraction did Jordan get correct?$q$, $q$[{"text":"$\\frac{3}{5}$","is_correct":false,"misconception_token":"divided-by-different-numbers"},{"text":"$\\frac{1}{4}$","is_correct":false,"misconception_token":"used-incorrect-part"},{"text":"$\\frac{15}{20}$","is_correct":false,"misconception_token":"did-not-simplify"},{"text":"$\\frac{3}{4}$","is_correct":true}]$q$::jsonb, $q$$\frac{3}{4}$$q$, $q$Jordan got $\frac{15}{20}$ correct, and dividing top and bottom by 5 gives $\frac{3}{4}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4c056672-fb06-54ab-8820-b0a96812e31c',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'hard',
   $q$One runner has completed $\frac{7}{12}$ of a race and another has completed $\frac{5}{8}$. Which fraction is farther along?$q$, $q$[{"text":"$\\frac{5}{8}$","is_correct":true},{"text":"$\\frac{7}{12}$","is_correct":false,"misconception_token":"chose-larger-numbers"},{"text":"Cannot be compared","is_correct":false,"misconception_token":"thought-uncomparable"},{"text":"They are equal","is_correct":false,"misconception_token":"assumed-equal"}]$q$::jsonb, $q$$\frac{5}{8}$$q$, $q$Using a common denominator of 24, $\frac{7}{12} = \frac{14}{24}$ and $\frac{5}{8} = \frac{15}{24}$, so $\frac{5}{8}$ is farther along.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('17975710-6ed8-5a49-87e1-f5ef0b1c36c6',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'hard',
   $q$Fill in the missing numerator: $\frac{?}{9} = \frac{20}{45}$.$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"used-scale-factor-as-answer"},{"text":"20","is_correct":false,"misconception_token":"kept-original-numerator"},{"text":"4","is_correct":true},{"text":"11","is_correct":false,"misconception_token":"subtracted-denominator"}]$q$::jsonb, $q$4$q$, $q$Since $45 \div 9 = 5$, divide the numerator by 5: $20 \div 5 = 4$, so $\frac{4}{9} = \frac{20}{45}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c4b2270c-e6ab-519d-866f-3828492f8064',
   null,
   (select id from public.skills where slug = 'fraction-equivalence'),
   'problem-solving-data-analysis', 'hard',
   $q$A bag has 24 marbles: 6 red, 10 blue, and 8 green. What fraction of the marbles are blue, in lowest terms?$q$, $q$[{"text":"$\\frac{5}{12}$","is_correct":true},{"text":"$\\frac{5}{7}$","is_correct":false,"misconception_token":"part-to-part-instead-of-whole"},{"text":"$\\frac{2}{5}$","is_correct":false,"misconception_token":"wrong-simplification"},{"text":"$\\frac{10}{24}$","is_correct":false,"misconception_token":"did-not-simplify"}]$q$::jsonb, $q$$\frac{5}{12}$$q$, $q$There are 10 blue out of 24 total, and dividing top and bottom by 2 gives $\frac{10 \div 2}{24 \div 2} = \frac{5}{12}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- fraction-operations-4 (Fraction Operations, grade 4, CCSS.MATH.CONTENT.4.NF.B.3) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f3e850ad-8e0e-5e5f-a514-9aad21045209',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{5} + \frac{2}{5}$?$q$, $q$[{"text":"$\\frac{3}{25}$","is_correct":false,"misconception_token":"multiplied-denominators"},{"text":"$\\frac{3}{5}$","is_correct":true},{"text":"$\\frac{3}{10}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$\\frac{1}{5}$","is_correct":false,"misconception_token":"subtracted-numerators"}]$q$::jsonb, $q$$\frac{3}{5}$$q$, $q$The denominators are the same, so add the numerators and keep the denominator: $\frac{1}{5} + \frac{2}{5} = \frac{3}{5}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1fefe180-f651-54c9-ae6d-e4b7e6e90704',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{3}{8} + \frac{2}{8}$?$q$, $q$[{"text":"$\\frac{5}{8}$","is_correct":true},{"text":"$\\frac{1}{8}$","is_correct":false,"misconception_token":"subtracted-numerators"},{"text":"$\\frac{5}{16}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$\\frac{5}{64}$","is_correct":false,"misconception_token":"multiplied-denominators"}]$q$::jsonb, $q$$\frac{5}{8}$$q$, $q$Keep the like denominator and add the numerators: $\frac{3}{8} + \frac{2}{8} = \frac{5}{8}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1cd23063-3756-502c-a8cb-f7cfe2b509d4',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{7}{9} - \frac{2}{9}$?$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"dropped-denominator"},{"text":"$\\frac{5}{9}$","is_correct":true},{"text":"$\\frac{6}{9}$","is_correct":false,"misconception_token":"off-by-one"},{"text":"$\\frac{9}{9}$","is_correct":false,"misconception_token":"added-instead-of-subtracted"}]$q$::jsonb, $q$$\frac{5}{9}$$q$, $q$Subtract the numerators over the like denominator: $\frac{7}{9} - \frac{2}{9} = \frac{5}{9}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a948321c-d3ce-5b90-8bf6-38322c0c5034',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $3 \times \frac{1}{5}$?$q$, $q$[{"text":"$\\frac{3}{5}$","is_correct":true},{"text":"$\\frac{3}{15}$","is_correct":false,"misconception_token":"multiplied-denominator"},{"text":"$\\frac{4}{5}$","is_correct":false,"misconception_token":"added-whole-to-numerator"},{"text":"$\\frac{1}{5}$","is_correct":false,"misconception_token":"forgot-to-multiply"}]$q$::jsonb, $q$$\frac{3}{5}$$q$, $q$Multiplying by a whole number multiplies the numerator: $3 \times \frac{1}{5} = \frac{3}{5}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b03a6fa2-8e6e-5863-a4dc-ce041d5e6e9e',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $4 \times \frac{2}{7}$?$q$, $q$[{"text":"$\\frac{8}{28}$","is_correct":false,"misconception_token":"multiplied-denominator"},{"text":"$\\frac{2}{7}$","is_correct":false,"misconception_token":"forgot-to-multiply"},{"text":"$\\frac{6}{7}$","is_correct":false,"misconception_token":"added-whole-to-numerator"},{"text":"$\\frac{8}{7}$","is_correct":true}]$q$::jsonb, $q$$\frac{8}{7}$$q$, $q$Multiply the numerator by the whole number and keep the denominator: $4 \times \frac{2}{7} = \frac{8}{7}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('01eadf59-27e4-5317-8fea-96350c622569',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{2}{5} + \frac{2}{5}$?$q$, $q$[{"text":"$\\frac{0}{5}$","is_correct":false,"misconception_token":"subtracted-numerators"},{"text":"$\\frac{4}{25}$","is_correct":false,"misconception_token":"multiplied-denominators"},{"text":"$\\frac{4}{10}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$\\frac{4}{5}$","is_correct":true}]$q$::jsonb, $q$$\frac{4}{5}$$q$, $q$Add the numerators over the shared denominator: $\frac{2}{5} + \frac{2}{5} = \frac{4}{5}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ea8b289f-cdcc-5fc3-a61d-529e1bf322a6',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{7}{10} - \frac{4}{10}$?$q$, $q$[{"text":"3","is_correct":false,"misconception_token":"dropped-denominator"},{"text":"$\\frac{11}{10}$","is_correct":false,"misconception_token":"added-numerators"},{"text":"$\\frac{3}{10}$","is_correct":true},{"text":"$\\frac{2}{10}$","is_correct":false,"misconception_token":"off-by-one"}]$q$::jsonb, $q$$\frac{3}{10}$$q$, $q$Subtract the numerators and keep the like denominator: $\frac{7}{10} - \frac{4}{10} = \frac{3}{10}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5d4ac603-2aff-5520-a9e0-b8f6da0140ed',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{4}{9} + \frac{4}{9}$?$q$, $q$[{"text":"$\\frac{0}{9}$","is_correct":false,"misconception_token":"subtracted-numerators"},{"text":"$\\frac{8}{18}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$\\frac{8}{9}$","is_correct":true},{"text":"$\\frac{8}{81}$","is_correct":false,"misconception_token":"multiplied-denominators"}]$q$::jsonb, $q$$\frac{8}{9}$$q$, $q$The denominators match, so add the numerators: $\frac{4}{9} + \frac{4}{9} = \frac{8}{9}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('19dee49f-485a-59b2-a70b-9005df3ef330',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'medium',
   $q$Maria ate $\frac{2}{8}$ of a pizza and her brother ate $\frac{3}{8}$ of the same pizza. How much of the pizza did they eat in all?$q$, $q$[{"text":"$\\frac{5}{8}$","is_correct":true},{"text":"$\\frac{5}{16}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$\\frac{5}{64}$","is_correct":false,"misconception_token":"multiplied-denominators"},{"text":"$\\frac{1}{8}$","is_correct":false,"misconception_token":"subtracted-numerators"}]$q$::jsonb, $q$$\frac{5}{8}$$q$, $q$Add the two like fractions: $\frac{2}{8} + \frac{3}{8} = \frac{5}{8}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e2866e94-2a08-5ce4-aee3-168a8a1efa15',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $2\frac{3}{6} + 1\frac{2}{6}$?$q$, $q$[{"text":"$3\\frac{5}{12}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$1\\frac{1}{6}$","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"$3\\frac{5}{6}$","is_correct":true},{"text":"$\\frac{5}{6}$","is_correct":false,"misconception_token":"forgot-whole-numbers"}]$q$::jsonb, $q$$3\frac{5}{6}$$q$, $q$Add the whole numbers and the like fractions: $2 + 1 = 3$ and $\frac{3}{6} + \frac{2}{6} = \frac{5}{6}$, giving $3\frac{5}{6}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d927cd17-2df3-595b-bc59-5a6f5fcedacb',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $4\frac{1}{5} - 1\frac{3}{5}$?$q$, $q$[{"text":"$3\\frac{3}{5}$","is_correct":false,"misconception_token":"forgot-borrow-decrement"},{"text":"$3\\frac{2}{5}$","is_correct":false,"misconception_token":"flipped-fraction-difference"},{"text":"$2\\frac{3}{5}$","is_correct":true},{"text":"$2\\frac{2}{5}$","is_correct":false,"misconception_token":"incorrect-borrow"}]$q$::jsonb, $q$$2\frac{3}{5}$$q$, $q$Regroup: $4\frac{1}{5} = 3\frac{6}{5}$, then $3\frac{6}{5} - 1\frac{3}{5} = 2\frac{3}{5}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('23a2a39c-6b92-50b8-aafc-f56c9796bd07',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'medium',
   $q$A recipe needs $\frac{3}{4}$ cup of flour for one batch. How much flour is needed for 3 batches?$q$, $q$[{"text":"$\\frac{6}{4}$","is_correct":false,"misconception_token":"added-whole-to-numerator"},{"text":"$\\frac{9}{12}$","is_correct":false,"misconception_token":"multiplied-denominator"},{"text":"$\\frac{3}{4}$","is_correct":false,"misconception_token":"forgot-to-multiply"},{"text":"$\\frac{9}{4}$","is_correct":true}]$q$::jsonb, $q$$\frac{9}{4}$$q$, $q$Multiply the fraction by the number of batches: $3 \times \frac{3}{4} = \frac{9}{4}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f5c6b033-ede7-5641-ad1c-d4fe7f7bdc21',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $5 \times \frac{3}{8}$?$q$, $q$[{"text":"$\\frac{15}{40}$","is_correct":false,"misconception_token":"multiplied-denominator"},{"text":"$\\frac{15}{8}$","is_correct":true},{"text":"$\\frac{3}{8}$","is_correct":false,"misconception_token":"forgot-to-multiply"},{"text":"$\\frac{8}{8}$","is_correct":false,"misconception_token":"added-whole-to-numerator"}]$q$::jsonb, $q$$\frac{15}{8}$$q$, $q$Multiply the numerator by the whole number: $5 \times \frac{3}{8} = \frac{15}{8}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0d25da92-dcc0-5db9-b0a9-ae7bb8b717ec',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'medium',
   $q$Jordan had $3\frac{5}{8}$ feet of rope and used $1\frac{2}{8}$ feet. How much rope is left?$q$, $q$[{"text":"$3\\frac{3}{8}$","is_correct":false,"misconception_token":"forgot-to-subtract-whole"},{"text":"$4\\frac{7}{8}$","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"$2\\frac{3}{8}$","is_correct":true},{"text":"$2\\frac{7}{8}$","is_correct":false,"misconception_token":"added-the-fractions"}]$q$::jsonb, $q$$2\frac{3}{8}$$q$, $q$Subtract wholes and like fractions: $3 - 1 = 2$ and $\frac{5}{8} - \frac{2}{8} = \frac{3}{8}$, giving $2\frac{3}{8}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d1d5eab9-2dcf-5c35-98c2-b85607e2f37a',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'medium',
   $q$In a class, $\frac{4}{10}$ of the students walk to school and $\frac{3}{10}$ ride a bike. What fraction of the students walk or ride a bike?$q$, $q$[{"text":"$\\frac{7}{100}$","is_correct":false,"misconception_token":"multiplied-denominators"},{"text":"$\\frac{7}{20}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$\\frac{1}{10}$","is_correct":false,"misconception_token":"subtracted-numerators"},{"text":"$\\frac{7}{10}$","is_correct":true}]$q$::jsonb, $q$$\frac{7}{10}$$q$, $q$Add the like fractions: $\frac{4}{10} + \frac{3}{10} = \frac{7}{10}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d8dbf65f-a3f7-56d1-b7e2-07896ebe37fc',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'medium',
   $q$Each lap around a track is $\frac{2}{3}$ mile. Sam ran 4 laps. How far did Sam run?$q$, $q$[{"text":"$\\frac{8}{3}$","is_correct":true},{"text":"$\\frac{6}{3}$","is_correct":false,"misconception_token":"added-whole-to-numerator"},{"text":"$\\frac{2}{3}$","is_correct":false,"misconception_token":"forgot-to-multiply"},{"text":"$\\frac{8}{12}$","is_correct":false,"misconception_token":"multiplied-denominator"}]$q$::jsonb, $q$$\frac{8}{3}$$q$, $q$Multiply the distance per lap by the number of laps: $4 \times \frac{2}{3} = \frac{8}{3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8b5caa8f-8341-5d7f-a1c4-4dc5803e04bd',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'hard',
   $q$A baker used $\frac{4}{9}$ kilogram of sugar in the morning and $\frac{7}{9}$ kilogram in the afternoon. How much sugar did the baker use in all?$q$, $q$[{"text":"$\\frac{3}{9}$","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"$\\frac{2}{9}$","is_correct":false,"misconception_token":"dropped-the-whole"},{"text":"$\\frac{11}{18}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$1\\frac{2}{9}$","is_correct":true}]$q$::jsonb, $q$$1\frac{2}{9}$$q$, $q$Add the like fractions to get $\frac{4}{9} + \frac{7}{9} = \frac{11}{9}$, which is $1\frac{2}{9}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d2d1dbda-9015-5595-81c0-f23475fc4f3c',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'hard',
   $q$What is $\frac{5}{9} + \frac{8}{9} - \frac{4}{9}$?$q$, $q$[{"text":"1","is_correct":true},{"text":"$1\\frac{8}{9}$","is_correct":false,"misconception_token":"added-all-three"},{"text":"$\\frac{1}{9}$","is_correct":false,"misconception_token":"subtracted-before-adding"},{"text":"$\\frac{9}{27}$","is_correct":false,"misconception_token":"added-denominators"}]$q$::jsonb, $q$1$q$, $q$Combine the numerators over the like denominator: $5 + 8 - 4 = 9$, so $\frac{9}{9} = 1$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a8d01122-4d67-547d-9ce1-bf0f46922da5',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'hard',
   $q$A ribbon is 5 feet long. Mia cut 3 pieces, each $\frac{3}{4}$ foot long. How much ribbon is left?$q$, $q$[{"text":"$4\\frac{1}{4}$","is_correct":false,"misconception_token":"subtracted-one-piece"},{"text":"$2\\frac{1}{4}$","is_correct":false,"misconception_token":"gave-amount-used"},{"text":"$2\\frac{3}{4}$","is_correct":true},{"text":"$7\\frac{1}{4}$","is_correct":false,"misconception_token":"added-instead-of-subtracted"}]$q$::jsonb, $q$$2\frac{3}{4}$$q$, $q$The pieces use $3 \times \frac{3}{4} = \frac{9}{4} = 2\frac{1}{4}$ feet, so $5 - 2\frac{1}{4} = 2\frac{3}{4}$ feet remain.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e84791d9-eeda-540e-af90-a28453d7d5fc',
   null,
   (select id from public.skills where slug = 'fraction-operations-4'),
   'problem-solving-data-analysis', 'hard',
   $q$Two ropes measuring $2\frac{5}{6}$ meters and $3\frac{4}{6}$ meters are tied together, and $\frac{2}{6}$ meter is lost in the knot. How long is the combined rope?$q$, $q$[{"text":"$6\\frac{1}{6}$","is_correct":true},{"text":"$6\\frac{5}{6}$","is_correct":false,"misconception_token":"added-loss-instead"},{"text":"$6\\frac{2}{6}$","is_correct":false,"misconception_token":"subtracted-wrong-amount"},{"text":"$6\\frac{3}{6}$","is_correct":false,"misconception_token":"forgot-to-subtract-loss"}]$q$::jsonb, $q$$6\frac{1}{6}$$q$, $q$Add the ropes: $2\frac{5}{6} + 3\frac{4}{6} = 6\frac{3}{6}$, then subtract the knot loss: $6\frac{3}{6} - \frac{2}{6} = 6\frac{1}{6}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- factors-multiples (Factors & Multiples, grade 4, CCSS.MATH.CONTENT.4.OA.B.4) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1260d042-d4ff-58bf-8950-745893a08d2a',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'easy',
   $q$Which number is a multiple of $4$?$q$, $q$[{"text":"14","is_correct":false,"misconception_token":"multiple-of-7-not-4"},{"text":"16","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"multiple-of-5-not-4"},{"text":"9","is_correct":false,"misconception_token":"multiple-of-3-not-4"}]$q$::jsonb, $q$16$q$, $q$Count by fours: 4, 8, 12, 16. So 16 is a multiple of 4.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('013cd6c4-7824-53ba-b8ce-127d5b9964ff',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'easy',
   $q$Which number is a factor of $18$?$q$, $q$[{"text":"6","is_correct":true},{"text":"4","is_correct":false,"misconception_token":"four-does-not-divide-18"},{"text":"36","is_correct":false,"misconception_token":"chose-multiple-not-factor"},{"text":"5","is_correct":false,"misconception_token":"five-does-not-divide-18"}]$q$::jsonb, $q$6$q$, $q$18 divided by 6 is 3 with no remainder, so 6 is a factor of 18.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b2223640-eb82-5589-baa9-4a9481f8096c',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'easy',
   $q$Is $7$ prime or composite?$q$, $q$[{"text":"Neither prime nor composite","is_correct":false,"misconception_token":"called-7-neither"},{"text":"Prime","is_correct":true},{"text":"Both prime and composite","is_correct":false,"misconception_token":"called-7-both"},{"text":"Composite","is_correct":false,"misconception_token":"counted-7-as-composite"}]$q$::jsonb, $q$Prime$q$, $q$7 has exactly two factors, 1 and 7, so it is prime.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6834d496-386d-5a80-8b17-c4ada3335cf7',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'easy',
   $q$Is $9$ prime or composite?$q$, $q$[{"text":"Composite","is_correct":true},{"text":"Prime","is_correct":false,"misconception_token":"odd-so-called-prime"},{"text":"Neither prime nor composite","is_correct":false,"misconception_token":"called-9-neither"},{"text":"Both prime and composite","is_correct":false,"misconception_token":"called-9-both"}]$q$::jsonb, $q$Composite$q$, $q$9 equals 3 times 3, so it has a factor other than 1 and 9, making it composite.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('63cbf5f0-ac11-5521-bb26-0a7740f2eedf',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'easy',
   $q$Which multiplication has a product of $20$?$q$, $q$[{"text":"$4 \\times 6$","is_correct":false,"misconception_token":"product-is-24"},{"text":"$2 \\times 8$","is_correct":false,"misconception_token":"product-is-16"},{"text":"$3 \\times 6$","is_correct":false,"misconception_token":"product-is-18"},{"text":"$4 \\times 5$","is_correct":true}]$q$::jsonb, $q$$4 \times 5$$q$, $q$4 times 5 equals 20.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fc8c19ef-66e7-551b-bfef-8e2497bb7a18',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'easy',
   $q$What is the next multiple of $6$ after $18$?$q$, $q$[{"text":"30","is_correct":false,"misconception_token":"skipped-a-multiple"},{"text":"20","is_correct":false,"misconception_token":"added-two-not-six"},{"text":"19","is_correct":false,"misconception_token":"added-one-not-six"},{"text":"24","is_correct":true}]$q$::jsonb, $q$24$q$, $q$The multiples of 6 are 6, 12, 18, 24, so the next one after 18 is 24.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9e6f2b13-333a-5952-a6bd-cbda55851d65',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'easy',
   $q$Which of these is NOT a factor of $16$?$q$, $q$[{"text":"4","is_correct":false,"misconception_token":"four-is-a-factor"},{"text":"2","is_correct":false,"misconception_token":"two-is-a-factor"},{"text":"6","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"eight-is-a-factor"}]$q$::jsonb, $q$6$q$, $q$The factors of 16 are 1, 2, 4, 8, 16. Since 6 is not in that list, 6 is not a factor.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5f124f0b-abaa-5ad2-9e1c-f9ee1bd2153d',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'easy',
   $q$Which number is a multiple of $10$?$q$, $q$[{"text":"55","is_correct":false,"misconception_token":"odd-multiple-of-5"},{"text":"14","is_correct":false,"misconception_token":"ends-in-4-not-0"},{"text":"40","is_correct":true},{"text":"25","is_correct":false,"misconception_token":"multiple-of-5-not-10"}]$q$::jsonb, $q$40$q$, $q$Multiples of 10 end in 0: 10, 20, 30, 40. So 40 is a multiple of 10.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('591786a8-ede2-58e9-a6ac-e49e4de827f7',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'medium',
   $q$How many factor pairs does $16$ have?$q$, $q$[{"text":"3","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"counted-all-factors"},{"text":"6","is_correct":false,"misconception_token":"counted-each-pair-twice"},{"text":"2","is_correct":false,"misconception_token":"forgot-the-4-times-4-pair"}]$q$::jsonb, $q$3$q$, $q$The factor pairs of 16 are 1 and 16, 2 and 8, and 4 and 4, which is 3 pairs.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('028f76a3-ab3f-5cbd-8608-00bbe74cc99c',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'medium',
   $q$A teacher arranges $24$ chairs into equal rows with $6$ chairs in each row. How many rows are there?$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"144","is_correct":false,"misconception_token":"multiplied-instead-of-divided"},{"text":"4","is_correct":true},{"text":"3","is_correct":false,"misconception_token":"divided-incorrectly"}]$q$::jsonb, $q$4$q$, $q$24 divided by 6 equals 4 rows.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7c87751e-0d13-565f-85b0-8feaea29e3c9',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'medium',
   $q$A baker puts $36$ muffins into boxes of $9$. How many boxes does she fill?$q$, $q$[{"text":"45","is_correct":false,"misconception_token":"added-9-to-36"},{"text":"27","is_correct":false,"misconception_token":"subtracted-9-from-36"},{"text":"4","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"off-by-one-division"}]$q$::jsonb, $q$4$q$, $q$36 divided by 9 equals 4 boxes.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('10cf76ef-a053-5bb8-87a8-3031ea21d422',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'medium',
   $q$Which of these numbers is prime?$q$, $q$[{"text":"27","is_correct":false,"misconception_token":"chose-27-divisible-by-3"},{"text":"21","is_correct":false,"misconception_token":"chose-21-divisible-by-3"},{"text":"33","is_correct":false,"misconception_token":"chose-33-divisible-by-11"},{"text":"29","is_correct":true}]$q$::jsonb, $q$29$q$, $q$29 has only the factors 1 and 29, so it is prime; 21, 27, and 33 each have other factors.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d770f359-1c85-5d4b-a641-ae272efa5fbb',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'medium',
   $q$Which of these numbers is composite?$q$, $q$[{"text":"13","is_correct":false,"misconception_token":"chose-13-which-is-prime"},{"text":"15","is_correct":true},{"text":"23","is_correct":false,"misconception_token":"chose-23-which-is-prime"},{"text":"17","is_correct":false,"misconception_token":"chose-17-which-is-prime"}]$q$::jsonb, $q$15$q$, $q$15 equals 3 times 5, so it has factors besides 1 and 15, making it composite.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4e7684d9-de7f-5d4b-8627-eb942c4daab2',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'medium',
   $q$Rowan has $30$ stickers to share equally among some friends with none left over. Which number of friends works?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"eight-does-not-divide-30"},{"text":"4","is_correct":false,"misconception_token":"four-does-not-divide-30"},{"text":"5","is_correct":true},{"text":"7","is_correct":false,"misconception_token":"seven-does-not-divide-30"}]$q$::jsonb, $q$5$q$, $q$30 divided by 5 equals 6 with no remainder, so 5 friends works.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cdff67c0-538f-5f06-97cc-57ef7741dd52',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'medium',
   $q$Every $8$ minutes a bus leaves the station. If a bus leaves at minute $0$, at which minute will another bus leave?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"multiple-of-4-not-8"},{"text":"20","is_correct":false,"misconception_token":"not-a-multiple-of-8"},{"text":"28","is_correct":false,"misconception_token":"off-by-4-from-multiple"},{"text":"40","is_correct":true}]$q$::jsonb, $q$40$q$, $q$Buses leave at multiples of 8: 8, 16, 24, 32, 40. So a bus leaves at minute 40.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d0647778-2def-5973-a5a4-97a43c2d428e',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'medium',
   $q$If $7 \times \square = 56$, what is the missing factor?$q$, $q$[{"text":"8","is_correct":true},{"text":"63","is_correct":false,"misconception_token":"added-7-to-56"},{"text":"9","is_correct":false,"misconception_token":"off-by-one"},{"text":"49","is_correct":false,"misconception_token":"used-7-times-7"}]$q$::jsonb, $q$8$q$, $q$56 divided by 7 equals 8, so the missing factor is 8.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9df0f365-ce1f-5552-9c92-41583d51fb69',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'hard',
   $q$A gardener plants $48$ flowers in equal rows with none left over. Which number of rows is NOT possible?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"eight-is-a-factor-of-48"},{"text":"12","is_correct":false,"misconception_token":"twelve-is-a-factor-of-48"},{"text":"6","is_correct":false,"misconception_token":"six-is-a-factor-of-48"},{"text":"5","is_correct":true}]$q$::jsonb, $q$5$q$, $q$The factors of 48 include 6, 8, and 12 but not 5, since 48 divided by 5 leaves a remainder.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d474c5a9-0f13-5956-8efd-9a550f2bf3a1',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'hard',
   $q$How many prime numbers are there between $10$ and $20$?$q$, $q$[{"text":"4","is_correct":true},{"text":"3","is_correct":false,"misconception_token":"missed-one-prime"},{"text":"2","is_correct":false,"misconception_token":"counted-too-few"},{"text":"5","is_correct":false,"misconception_token":"included-a-composite"}]$q$::jsonb, $q$4$q$, $q$The primes between 10 and 20 are 11, 13, 17, and 19, which is 4 numbers.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9933e0dd-b827-5507-977c-20ac8b11b38a',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'hard',
   $q$A coach splits $60$ players into equal teams, with more than one team and more than one player per team. Which number of players per team is NOT possible?$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"five-divides-60"},{"text":"6","is_correct":false,"misconception_token":"six-divides-60"},{"text":"7","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"ten-divides-60"}]$q$::jsonb, $q$7$q$, $q$60 divided by 5, 6, or 10 comes out even, but 60 divided by 7 leaves a remainder, so 7 is not possible.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('06fcf0a0-9658-5c1b-befa-28915b23a2ff',
   null,
   (select id from public.skills where slug = 'factors-multiples'),
   'algebra', 'hard',
   $q$Balloons come in packs of $6$ and candles come in packs of $8$. What is the least number of each you must buy to have an equal number of balloons and candles?$q$, $q$[{"text":"24","is_correct":true},{"text":"14","is_correct":false,"misconception_token":"added-6-and-8"},{"text":"12","is_correct":false,"misconception_token":"multiple-of-6-not-8"},{"text":"48","is_correct":false,"misconception_token":"used-product-not-lcm"}]$q$::jsonb, $q$24$q$, $q$The least common multiple of 6 and 8 is 24, so you need 24 of each.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- area-perimeter (Area & Perimeter, grade 4, CCSS.MATH.CONTENT.4.MD.A.3) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3a9e9380-981f-55db-810a-8878a7beda53',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $5$ cm long and $3$ cm wide. What is its area in square centimeters?$q$, $q$[{"text":"30","is_correct":false,"misconception_token":"doubled-the-product"},{"text":"15","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"used-perimeter-formula"},{"text":"8","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, $q$15$q$, $q$Area is length times width: $5 \times 3 = 15$ square centimeters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1c2db7d2-79e2-544b-817d-e28b66be1aab',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $6$ inches long and $2$ inches wide. What is its perimeter in inches?$q$, $q$[{"text":"16","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"half-perimeter"},{"text":"12","is_correct":false,"misconception_token":"multiplied-for-area"},{"text":"14","is_correct":false,"misconception_token":"missed-a-side"}]$q$::jsonb, $q$16$q$, $q$Perimeter is $2 \times 6 + 2 \times 2 = 12 + 4 = 16$ inches.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c4297a48-8a7a-596b-a324-59c37ebca081',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'easy',
   $q$A poster is $7$ feet tall and $2$ feet wide. What is the area of the poster in square feet?$q$, $q$[{"text":"9","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"14","is_correct":true},{"text":"28","is_correct":false,"misconception_token":"doubled-the-product"},{"text":"18","is_correct":false,"misconception_token":"used-perimeter-formula"}]$q$::jsonb, $q$14$q$, $q$Area is length times width: $7 \times 2 = 14$ square feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e9ebc7de-2f52-5cf1-8c81-cc9fd986bfef',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'easy',
   $q$A rug is $8$ meters long and $5$ meters wide. What is its perimeter in meters?$q$, $q$[{"text":"26","is_correct":true},{"text":"40","is_correct":false,"misconception_token":"multiplied-for-area"},{"text":"13","is_correct":false,"misconception_token":"half-perimeter"},{"text":"21","is_correct":false,"misconception_token":"missed-a-side"}]$q$::jsonb, $q$26$q$, $q$Perimeter is $2 \times 8 + 2 \times 5 = 16 + 10 = 26$ meters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cfcbda7c-01d3-59d9-a0d7-cdf05fe8667a',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'easy',
   $q$A garden is $9$ yards long and $3$ yards wide. What is the area of the garden in square yards?$q$, $q$[{"text":"24","is_correct":false,"misconception_token":"used-perimeter-formula"},{"text":"54","is_correct":false,"misconception_token":"doubled-the-product"},{"text":"12","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"27","is_correct":true}]$q$::jsonb, $q$27$q$, $q$Area is length times width: $9 \times 3 = 27$ square yards.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('39f5f736-eac2-56b2-ab77-824856742091',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'easy',
   $q$A square tile has a side length of $6$ cm. What is the perimeter of the tile in centimeters?$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"side-times-three"},{"text":"12","is_correct":false,"misconception_token":"side-times-two"},{"text":"36","is_correct":false,"misconception_token":"computed-area"},{"text":"24","is_correct":true}]$q$::jsonb, $q$24$q$, $q$A square has four equal sides, so the perimeter is $4 \times 6 = 24$ centimeters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2be65aa9-9cc8-52a5-95e0-961e59898b8f',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'easy',
   $q$A square rug has a side length of $5$ feet. What is the area of the rug in square feet?$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"side-times-two"},{"text":"20","is_correct":false,"misconception_token":"found-perimeter"},{"text":"25","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"side-times-three"}]$q$::jsonb, $q$25$q$, $q$The area of a square is side times side: $5 \times 5 = 25$ square feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('76a61ff0-e3d7-5d05-a87f-7b67736f3b84',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'easy',
   $q$A room is $10$ feet long and $4$ feet wide. What is the perimeter of the room in feet?$q$, $q$[{"text":"20","is_correct":false,"misconception_token":"doubled-length-only"},{"text":"40","is_correct":false,"misconception_token":"multiplied-for-area"},{"text":"28","is_correct":true},{"text":"14","is_correct":false,"misconception_token":"half-perimeter"}]$q$::jsonb, $q$28$q$, $q$Perimeter is $2 \times 10 + 2 \times 4 = 20 + 8 = 28$ feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4bfacd30-7ee9-5585-acb0-d5acd69f4aff',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'medium',
   $q$A rectangle has an area of $48$ square inches. Its length is $8$ inches. What is its width in inches?$q$, $q$[{"text":"6","is_correct":true},{"text":"40","is_correct":false,"misconception_token":"subtracted-length"},{"text":"56","is_correct":false,"misconception_token":"added-length"},{"text":"24","is_correct":false,"misconception_token":"halved-the-area"}]$q$::jsonb, $q$6$q$, $q$Width is area divided by length: $48 \div 8 = 6$ inches.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6243f822-8f2a-54f0-8296-5d32a7ea99d6',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'medium',
   $q$A rectangle has a perimeter of $30$ cm. Its length is $9$ cm. What is its width in centimeters?$q$, $q$[{"text":"21","is_correct":false,"misconception_token":"subtracted-length"},{"text":"12","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"6","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"halved-perimeter"}]$q$::jsonb, $q$6$q$, $q$The two lengths use $2 \times 9 = 18$ cm, leaving $30 - 18 = 12$ cm for the two widths, so each width is $12 \div 2 = 6$ centimeters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c1d085c9-32cd-5194-b1ca-082942fb3950',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'medium',
   $q$A soccer field is $25$ meters long and $12$ meters wide. What is the area of the field in square meters?$q$, $q$[{"text":"37","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"74","is_correct":false,"misconception_token":"used-perimeter-formula"},{"text":"300","is_correct":true},{"text":"600","is_correct":false,"misconception_token":"doubled-the-product"}]$q$::jsonb, $q$300$q$, $q$Area is length times width: $25 \times 12 = 300$ square meters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b7364876-f634-50fc-bf38-90964b8498c0',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'medium',
   $q$A rectangular garden is $15$ feet long and $8$ feet wide. Maria wants to put a fence around it. How many feet of fencing does she need?$q$, $q$[{"text":"23","is_correct":false,"misconception_token":"half-perimeter"},{"text":"120","is_correct":false,"misconception_token":"computed-area"},{"text":"30","is_correct":false,"misconception_token":"doubled-length-only"},{"text":"46","is_correct":true}]$q$::jsonb, $q$46$q$, $q$The fence follows the perimeter: $2 \times 15 + 2 \times 8 = 30 + 16 = 46$ feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('72fa4c28-f3fa-53ce-bba3-15012a1209c6',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'medium',
   $q$A rectangular room has an area of $72$ square feet. Its width is $6$ feet. What is its length in feet?$q$, $q$[{"text":"66","is_correct":false,"misconception_token":"subtracted-width"},{"text":"12","is_correct":true},{"text":"78","is_correct":false,"misconception_token":"added-width"},{"text":"36","is_correct":false,"misconception_token":"halved-the-area"}]$q$::jsonb, $q$12$q$, $q$Length is area divided by width: $72 \div 6 = 12$ feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8711b745-06dd-56b9-a19d-07c71dd9ceca',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'medium',
   $q$A rectangular swimming pool has a perimeter of $40$ meters. Its length is $12$ meters. What is its width in meters?$q$, $q$[{"text":"20","is_correct":false,"misconception_token":"halved-perimeter"},{"text":"28","is_correct":false,"misconception_token":"subtracted-length"},{"text":"8","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"forgot-to-divide"}]$q$::jsonb, $q$8$q$, $q$The two lengths use $2 \times 12 = 24$ meters, leaving $40 - 24 = 16$ meters for the two widths, so each width is $16 \div 2 = 8$ meters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('facd6faf-865f-5e57-aa4b-65afec52aa32',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'medium',
   $q$A square painting has a side length of $12$ inches. What is the area of the painting in square inches?$q$, $q$[{"text":"36","is_correct":false,"misconception_token":"side-times-three"},{"text":"48","is_correct":false,"misconception_token":"found-perimeter"},{"text":"24","is_correct":false,"misconception_token":"side-times-two"},{"text":"144","is_correct":true}]$q$::jsonb, $q$144$q$, $q$The area of a square is side times side: $12 \times 12 = 144$ square inches.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9f773833-289f-5dd2-a2a5-02b699779ce5',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'medium',
   $q$A rectangular kitchen floor is $8$ feet long and $6$ feet wide. Tile costs $2$ dollars for each square foot. How much will it cost to tile the whole floor?$q$, $q$[{"text":"96 dollars","is_correct":true},{"text":"56 dollars","is_correct":false,"misconception_token":"used-perimeter-times-cost"},{"text":"28 dollars","is_correct":false,"misconception_token":"computed-perimeter-only"},{"text":"48 dollars","is_correct":false,"misconception_token":"forgot-cost-multiplier"}]$q$::jsonb, $q$96 dollars$q$, $q$The floor area is $8 \times 6 = 48$ square feet, and at $2$ dollars each the cost is $48 \times 2 = 96$ dollars.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a88889d2-4c36-5971-8d7a-3ce775afc886',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'hard',
   $q$A rectangular garden has a perimeter of $34$ feet. Its length is $10$ feet. What is the area of the garden in square feet?$q$, $q$[{"text":"240","is_correct":false,"misconception_token":"subtracted-length-for-width"},{"text":"100","is_correct":false,"misconception_token":"assumed-square"},{"text":"140","is_correct":false,"misconception_token":"forgot-to-halve-width"},{"text":"70","is_correct":true}]$q$::jsonb, $q$70$q$, $q$The two lengths use $2 \times 10 = 20$ feet, so the two widths total $34 - 20 = 14$ feet and each width is $7$ feet; the area is $10 \times 7 = 70$ square feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c8eb2da0-f5f4-5a70-98dd-6d7dc235cab2',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'hard',
   $q$A rectangular rug has an area of $60$ square feet. Its width is $5$ feet. What is the perimeter of the rug in feet?$q$, $q$[{"text":"34","is_correct":true},{"text":"17","is_correct":false,"misconception_token":"half-perimeter"},{"text":"24","is_correct":false,"misconception_token":"doubled-length-only"},{"text":"130","is_correct":false,"misconception_token":"used-area-as-length"}]$q$::jsonb, $q$34$q$, $q$The length is $60 \div 5 = 12$ feet, so the perimeter is $2 \times 12 + 2 \times 5 = 24 + 10 = 34$ feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4e37da58-8881-5454-ac77-1c2f85fb0a44',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'hard',
   $q$A rectangular field is $40$ meters long and $25$ meters wide. A runner runs all the way around the edge of the field $2$ times. How many meters does the runner run in total?$q$, $q$[{"text":"130","is_correct":false,"misconception_token":"ran-only-one-lap"},{"text":"1000","is_correct":false,"misconception_token":"used-area"},{"text":"260","is_correct":true},{"text":"2000","is_correct":false,"misconception_token":"used-area-times-two"}]$q$::jsonb, $q$260$q$, $q$One lap is the perimeter $2 \times 40 + 2 \times 25 = 80 + 50 = 130$ meters, and two laps is $130 \times 2 = 260$ meters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dfaf5e5d-2d5c-5eca-9e47-d7c4ad44ccc8',
   null,
   (select id from public.skills where slug = 'area-perimeter'),
   'geometry-trigonometry', 'hard',
   $q$A rectangular garden is $12$ meters long and $9$ meters wide. A fence costs $3$ dollars for each meter. How much will it cost to put a fence all the way around the garden?$q$, $q$[{"text":"126 dollars","is_correct":true},{"text":"42 dollars","is_correct":false,"misconception_token":"forgot-cost-multiplier"},{"text":"63 dollars","is_correct":false,"misconception_token":"half-perimeter-times-cost"},{"text":"324 dollars","is_correct":false,"misconception_token":"used-area-times-cost"}]$q$::jsonb, $q$126 dollars$q$, $q$The perimeter is $2 \times 12 + 2 \times 9 = 24 + 18 = 42$ meters, and at $3$ dollars each the cost is $42 \times 3 = 126$ dollars.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- exponents-scientific-notation (Exponents & Scientific Notation, grade 8, CCSS.MATH.CONTENT.8.EE.A) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bc46cd4d-c597-5153-8dd2-c526996d3c8e',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'easy',
   $q$What is the value of $2^5$?$q$, $q$[{"text":"16","is_correct":false,"misconception_token":"used-one-less-exponent"},{"text":"32","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"multiplied-base-times-exponent"},{"text":"25","is_correct":false,"misconception_token":"swapped-base-and-exponent"}]$q$::jsonb, $q$32$q$, $q$$2^5 = 2 \times 2 \times 2 \times 2 \times 2 = 32$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1810728a-f7d9-5c8f-8792-e672f2ceaf7c',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'easy',
   $q$Simplify $3^4 \times 3^2$.$q$, $q$[{"text":"$3^6$","is_correct":true},{"text":"$9^6$","is_correct":false,"misconception_token":"multiplied-bases"},{"text":"$3^8$","is_correct":false,"misconception_token":"multiplied-exponents"},{"text":"$3^2$","is_correct":false,"misconception_token":"subtracted-exponents"}]$q$::jsonb, $q$$3^6$$q$, $q$With the same base, add the exponents: $3^4 \times 3^2 = 3^{4+2} = 3^6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2f9f4f36-7ee1-5c39-83fe-8b1809059c07',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'easy',
   $q$Simplify $\frac{5^7}{5^3}$.$q$, $q$[{"text":"$5^{21}$","is_correct":false,"misconception_token":"multiplied-exponents"},{"text":"$5^4$","is_correct":true},{"text":"$1^4$","is_correct":false,"misconception_token":"divided-bases"},{"text":"$5^{10}$","is_correct":false,"misconception_token":"added-exponents"}]$q$::jsonb, $q$$5^4$$q$, $q$With the same base, subtract the exponents: $\frac{5^7}{5^3} = 5^{7-3} = 5^4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e4a19883-bee4-5b99-aa10-fa3a28d670d7',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'easy',
   $q$What is the value of $7^0$?$q$, $q$[{"text":"1","is_correct":true},{"text":"0","is_correct":false,"misconception_token":"zero-exponent-gives-zero"},{"text":"7","is_correct":false,"misconception_token":"treated-as-base"},{"text":"undefined","is_correct":false,"misconception_token":"thinks-undefined"}]$q$::jsonb, $q$1$q$, $q$Any nonzero number raised to the zero power equals 1, so $7^0 = 1$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6ed3995a-afa9-53db-9a45-a6854090fe5d',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'easy',
   $q$What is the value of $2^{-3}$?$q$, $q$[{"text":"$-8$","is_correct":false,"misconception_token":"made-base-negative"},{"text":"$8$","is_correct":false,"misconception_token":"ignored-negative"},{"text":"$-6$","is_correct":false,"misconception_token":"multiplied-base-times-exponent"},{"text":"$\\frac{1}{8}$","is_correct":true}]$q$::jsonb, $q$$\frac{1}{8}$$q$, $q$A negative exponent means reciprocal: $2^{-3} = \frac{1}{2^3} = \frac{1}{8}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bf88e951-bef1-50c9-839a-7c46613068cc',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'easy',
   $q$Simplify $(x^3)^4$.$q$, $q$[{"text":"$x^3$","is_correct":false,"misconception_token":"kept-inner-exponent-only"},{"text":"$x^4$","is_correct":false,"misconception_token":"kept-outer-exponent-only"},{"text":"$x^7$","is_correct":false,"misconception_token":"added-exponents"},{"text":"$x^{12}$","is_correct":true}]$q$::jsonb, $q$$x^{12}$$q$, $q$Raising a power to a power multiplies the exponents: $(x^3)^4 = x^{3 \times 4} = x^{12}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4dff3330-8092-5c69-a340-12371f40a458',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'easy',
   $q$Write $3 \times 10^4$ in standard form.$q$, $q$[{"text":"3000","is_correct":false,"misconception_token":"moved-too-few-places"},{"text":"300000","is_correct":false,"misconception_token":"moved-one-extra-place"},{"text":"30000","is_correct":true},{"text":"30004","is_correct":false,"misconception_token":"added-the-exponent"}]$q$::jsonb, $q$30000$q$, $q$$3 \times 10^4 = 3 \times 10000 = 30000$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('72e49885-012f-59f3-aeb9-0bb2c13aa8d3',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'easy',
   $q$Write the number 52,000 in scientific notation.$q$, $q$[{"text":"$5.2 \\times 10^5$","is_correct":false,"misconception_token":"overcounted-places"},{"text":"$5.2 \\times 10^3$","is_correct":false,"misconception_token":"miscounted-places"},{"text":"$5.2 \\times 10^4$","is_correct":true},{"text":"$52 \\times 10^3$","is_correct":false,"misconception_token":"coefficient-not-between-one-and-ten"}]$q$::jsonb, $q$$5.2 \times 10^4$$q$, $q$Move the decimal 4 places to the left: $52000 = 5.2 \times 10^4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cd0ef860-6e97-5f9d-a0c4-02882fe98ac3',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'medium',
   $q$What is the value of $\frac{1}{3^{-2}}$?$q$, $q$[{"text":"9","is_correct":true},{"text":"$\\frac{1}{9}$","is_correct":false,"misconception_token":"did-not-flip"},{"text":"6","is_correct":false,"misconception_token":"multiplied-base-times-exponent"},{"text":"$-9$","is_correct":false,"misconception_token":"made-negative"}]$q$::jsonb, $q$9$q$, $q$A negative exponent in the denominator moves up: $\frac{1}{3^{-2}} = 3^{2} = 9$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fab7b867-12cd-50c1-a8c8-26dd49779f23',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'medium',
   $q$Simplify $(2 \times 10^3)(4 \times 10^5)$.$q$, $q$[{"text":"$8 \\times 10^{15}$","is_correct":false,"misconception_token":"multiplied-exponents"},{"text":"$6 \\times 10^8$","is_correct":false,"misconception_token":"added-coefficients"},{"text":"$8 \\times 10^8$","is_correct":true},{"text":"$8 \\times 10^2$","is_correct":false,"misconception_token":"subtracted-exponents"}]$q$::jsonb, $q$$8 \times 10^8$$q$, $q$Multiply the coefficients and add the exponents: $2 \times 4 = 8$ and $10^{3+5} = 10^8$, giving $8 \times 10^8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('500d2013-96e3-5bd7-85f0-88f5d471427d',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'medium',
   $q$Simplify $\frac{8 \times 10^9}{2 \times 10^4}$.$q$, $q$[{"text":"$6 \\times 10^5$","is_correct":false,"misconception_token":"subtracted-coefficients"},{"text":"$4 \\times 10^{13}$","is_correct":false,"misconception_token":"added-exponents"},{"text":"$4 \\times 10^5$","is_correct":true},{"text":"$16 \\times 10^5$","is_correct":false,"misconception_token":"multiplied-coefficients"}]$q$::jsonb, $q$$4 \times 10^5$$q$, $q$Divide the coefficients and subtract the exponents: $8 \div 2 = 4$ and $10^{9-4} = 10^5$, giving $4 \times 10^5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4cdad255-06f7-5964-942e-c3c834b56735',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'medium',
   $q$How many times larger is $6 \times 10^8$ than $3 \times 10^5$?$q$, $q$[{"text":"$18 \\times 10^3$","is_correct":false,"misconception_token":"multiplied-coefficients"},{"text":"$2 \\times 10^{13}$","is_correct":false,"misconception_token":"added-exponents"},{"text":"$0.5 \\times 10^3$","is_correct":false,"misconception_token":"inverted-coefficient-division"},{"text":"$2 \\times 10^3$","is_correct":true}]$q$::jsonb, $q$$2 \times 10^3$$q$, $q$Divide: $\frac{6 \times 10^8}{3 \times 10^5} = 2 \times 10^{8-5} = 2 \times 10^3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2b59e350-acfe-5dac-bfca-7937f1c0f4f8',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'medium',
   $q$A data center stores 74,000,000,000 bytes of information. Write this number in scientific notation.$q$, $q$[{"text":"$7.4 \\times 10^9$","is_correct":false,"misconception_token":"miscounted-places"},{"text":"$7.4 \\times 10^{10}$","is_correct":true},{"text":"$7.4 \\times 10^{11}$","is_correct":false,"misconception_token":"overcounted-places"},{"text":"$74 \\times 10^9$","is_correct":false,"misconception_token":"coefficient-not-between-one-and-ten"}]$q$::jsonb, $q$$7.4 \times 10^{10}$$q$, $q$Move the decimal 10 places: $74000000000 = 7.4 \times 10^{10}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('40bd74f2-0c8c-5609-b52c-53116a25851d',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'medium',
   $q$A virus particle measures about 0.00000012 meters across. Write this number in scientific notation.$q$, $q$[{"text":"$12 \\times 10^{-8}$","is_correct":false,"misconception_token":"coefficient-not-between-one-and-ten"},{"text":"$1.2 \\times 10^{7}$","is_correct":false,"misconception_token":"wrong-sign-exponent"},{"text":"$1.2 \\times 10^{-7}$","is_correct":true},{"text":"$1.2 \\times 10^{-6}$","is_correct":false,"misconception_token":"miscounted-places"}]$q$::jsonb, $q$$1.2 \times 10^{-7}$$q$, $q$Move the decimal 7 places to the right: $0.00000012 = 1.2 \times 10^{-7}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f16baec2-cb7d-576c-bb74-f4c8037752cb',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'medium',
   $q$What is the value of $(-3)^3$?$q$, $q$[{"text":"$9$","is_correct":false,"misconception_token":"squared-instead-of-cubed"},{"text":"$27$","is_correct":false,"misconception_token":"dropped-negative-sign"},{"text":"$-9$","is_correct":false,"misconception_token":"multiplied-base-times-exponent"},{"text":"$-27$","is_correct":true}]$q$::jsonb, $q$$-27$$q$, $q$$(-3)^3 = (-3)(-3)(-3) = -27$; an odd power keeps the negative sign.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8515c957-3ca1-54b4-bfc2-ded4991ba3e9',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'medium',
   $q$Simplify $\frac{a^3}{a^{-2}}$.$q$, $q$[{"text":"$a^5$","is_correct":true},{"text":"$a^6$","is_correct":false,"misconception_token":"multiplied-exponents"},{"text":"$\\frac{1}{a^5}$","is_correct":false,"misconception_token":"flipped-final-sign"},{"text":"$a$","is_correct":false,"misconception_token":"kept-negative-sign"}]$q$::jsonb, $q$$a^5$$q$, $q$Subtract the exponents: $\frac{a^3}{a^{-2}} = a^{3-(-2)} = a^5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('67ed5a5d-7d8f-58c3-9f01-87ae137559f0',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'hard',
   $q$Simplify $(5 \times 10^6)(6 \times 10^3)$ and express the result in scientific notation.$q$, $q$[{"text":"$11 \\times 10^9$","is_correct":false,"misconception_token":"added-coefficients"},{"text":"$3 \\times 10^9$","is_correct":false,"misconception_token":"forgot-to-adjust-exponent"},{"text":"$30 \\times 10^9$","is_correct":false,"misconception_token":"not-normalized"},{"text":"$3 \\times 10^{10}$","is_correct":true}]$q$::jsonb, $q$$3 \times 10^{10}$$q$, $q$$5 \times 6 = 30$ and $10^{6+3} = 10^9$, so $30 \times 10^9 = 3 \times 10^{10}$ after normalizing.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d4f9f366-dc70-5e95-8385-127d7db59c0c',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'hard',
   $q$The distance from Earth to the Sun is about $1.5 \times 10^{11}$ meters, and the distance from Earth to the Moon is about $3 \times 10^8$ meters. About how many times farther away is the Sun than the Moon?$q$, $q$[{"text":"$5 \\times 10^2$","is_correct":true},{"text":"$5 \\times 10^3$","is_correct":false,"misconception_token":"mis-normalized-coefficient"},{"text":"$4.5 \\times 10^{19}$","is_correct":false,"misconception_token":"multiplied-instead-of-dividing"},{"text":"$2 \\times 10^3$","is_correct":false,"misconception_token":"inverted-division"}]$q$::jsonb, $q$$5 \times 10^2$$q$, $q$$\frac{1.5 \times 10^{11}}{3 \times 10^8} = 0.5 \times 10^3 = 5 \times 10^2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6ae477cf-8349-5d5e-8587-e6c72d850cd2',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'hard',
   $q$One bacterium has a mass of about $9.5 \times 10^{-13}$ grams. A colony contains $4 \times 10^8$ bacteria. What is the total mass of the colony, in grams?$q$, $q$[{"text":"$38 \\times 10^{-5}$","is_correct":false,"misconception_token":"not-normalized"},{"text":"$3.8 \\times 10^{-5}$","is_correct":false,"misconception_token":"forgot-to-adjust-exponent"},{"text":"$3.8 \\times 10^{-4}$","is_correct":true},{"text":"$13.5 \\times 10^{-5}$","is_correct":false,"misconception_token":"added-coefficients"}]$q$::jsonb, $q$$3.8 \times 10^{-4}$$q$, $q$$9.5 \times 4 = 38$ and $10^{-13+8} = 10^{-5}$, so $38 \times 10^{-5} = 3.8 \times 10^{-4}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8dad5b55-426c-5da9-8d9a-117a2a20a2b5',
   null,
   (select id from public.skills where slug = 'exponents-scientific-notation'),
   'advanced-math', 'hard',
   $q$Simplify $\frac{(2^3)^2 \cdot 2^{-4}}{2^5}$.$q$, $q$[{"text":"$\\frac{1}{8}$","is_correct":true},{"text":"$\\frac{1}{16}$","is_correct":false,"misconception_token":"added-inner-exponents"},{"text":"$32$","is_correct":false,"misconception_token":"ignored-negative-exponent"},{"text":"$8$","is_correct":false,"misconception_token":"dropped-final-negative-sign"}]$q$::jsonb, $q$$\frac{1}{8}$$q$, $q$$(2^3)^2 = 2^6$, then $2^6 \cdot 2^{-4} = 2^2$, and $\frac{2^2}{2^5} = 2^{-3} = \frac{1}{8}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- pythagorean-theorem (Pythagorean Theorem, grade 8, CCSS.MATH.CONTENT.8.G.B.7) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f01a90e8-b179-5d0b-bbcd-b0849cb95575',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'easy',
   $q$A right triangle has legs of length $3$ and $4$. What is the length of the hypotenuse?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"multiplied-legs"},{"text":"5","is_correct":true},{"text":"7","is_correct":false,"misconception_token":"added-legs"},{"text":"25","is_correct":false,"misconception_token":"forgot-square-root"}]$q$::jsonb, $q$5$q$, $q$Using $a^2 + b^2 = c^2$: $3^2 + 4^2 = 9 + 16 = 25$, so $c = \sqrt{25} = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('60a6baf1-77c9-5149-9020-f8e7308f49cb',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'easy',
   $q$A right triangle has legs of length $6$ and $8$. What is the length of the hypotenuse?$q$, $q$[{"text":"10","is_correct":true},{"text":"100","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"14","is_correct":false,"misconception_token":"added-legs"},{"text":"48","is_correct":false,"misconception_token":"multiplied-legs"}]$q$::jsonb, $q$10$q$, $q$Using $a^2 + b^2 = c^2$: $6^2 + 8^2 = 36 + 64 = 100$, so $c = \sqrt{100} = 10$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ec46a13b-52ce-5c30-81d2-f874dab7c10f',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'easy',
   $q$A right triangle has legs of length $5$ and $12$. What is the length of the hypotenuse?$q$, $q$[{"text":"169","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"13","is_correct":true},{"text":"60","is_correct":false,"misconception_token":"multiplied-legs"},{"text":"17","is_correct":false,"misconception_token":"added-legs"}]$q$::jsonb, $q$13$q$, $q$Using $a^2 + b^2 = c^2$: $5^2 + 12^2 = 25 + 144 = 169$, so $c = \sqrt{169} = 13$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cebc8155-c06b-5a23-ab08-dda94cf2df90',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'easy',
   $q$A right triangle has legs of length $8$ and $15$. What is the length of the hypotenuse?$q$, $q$[{"text":"17","is_correct":true},{"text":"23","is_correct":false,"misconception_token":"added-legs"},{"text":"289","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"120","is_correct":false,"misconception_token":"multiplied-legs"}]$q$::jsonb, $q$17$q$, $q$Using $a^2 + b^2 = c^2$: $8^2 + 15^2 = 64 + 225 = 289$, so $c = \sqrt{289} = 17$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b8498d83-e57a-56e0-9cc3-d83613557786',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'easy',
   $q$A right triangle has a hypotenuse of length $5$ and one leg of length $3$. What is the length of the other leg?$q$, $q$[{"text":"$\\sqrt{34}$","is_correct":false,"misconception_token":"added-squares-instead-of-subtracting"},{"text":"8","is_correct":false,"misconception_token":"added-lengths"},{"text":"2","is_correct":false,"misconception_token":"subtracted-lengths"},{"text":"4","is_correct":true}]$q$::jsonb, $q$4$q$, $q$Rearrange to $b^2 = c^2 - a^2 = 5^2 - 3^2 = 25 - 9 = 16$, so $b = \sqrt{16} = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('67e91f83-a168-5803-82cb-26bf97d4def8',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'easy',
   $q$A right triangle has a hypotenuse of length $10$ and one leg of length $8$. What is the length of the other leg?$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"added-lengths"},{"text":"2","is_correct":false,"misconception_token":"subtracted-lengths"},{"text":"$\\sqrt{164}$","is_correct":false,"misconception_token":"added-squares-instead-of-subtracting"},{"text":"6","is_correct":true}]$q$::jsonb, $q$6$q$, $q$Rearrange to $b^2 = c^2 - a^2 = 10^2 - 8^2 = 100 - 64 = 36$, so $b = \sqrt{36} = 6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7206839c-2852-5294-9e58-76edd5eedcda',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'easy',
   $q$A right triangle has a hypotenuse of length $13$ and one leg of length $5$. What is the length of the other leg?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"subtracted-lengths"},{"text":"$\\sqrt{194}$","is_correct":false,"misconception_token":"added-squares-instead-of-subtracting"},{"text":"12","is_correct":true},{"text":"18","is_correct":false,"misconception_token":"added-lengths"}]$q$::jsonb, $q$12$q$, $q$Rearrange to $b^2 = c^2 - a^2 = 13^2 - 5^2 = 169 - 25 = 144$, so $b = \sqrt{144} = 12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('739b82bb-270a-5afb-b778-4ebd86653dbd',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'easy',
   $q$A right triangle has two legs, each of length $1$. What is the length of the hypotenuse?$q$, $q$[{"text":"4","is_correct":false,"misconception_token":"squared-the-sum"},{"text":"2","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"$\\sqrt{2}$","is_correct":true},{"text":"1","is_correct":false,"misconception_token":"used-single-leg"}]$q$::jsonb, $q$$\sqrt{2}$$q$, $q$Using $a^2 + b^2 = c^2$: $1^2 + 1^2 = 2$, so $c = \sqrt{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('690d699a-7af1-5b78-aa32-31757f5053b4',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'medium',
   $q$A ladder $17$ feet long leans against a wall with its base $8$ feet from the wall. How high up the wall does the ladder reach?$q$, $q$[{"text":"15","is_correct":true},{"text":"$\\sqrt{353}$","is_correct":false,"misconception_token":"added-squares-instead-of-subtracting"},{"text":"25","is_correct":false,"misconception_token":"added-lengths"},{"text":"9","is_correct":false,"misconception_token":"subtracted-lengths"}]$q$::jsonb, $q$15$q$, $q$The ladder is the hypotenuse: $h^2 = 17^2 - 8^2 = 289 - 64 = 225$, so $h = \sqrt{225} = 15$ feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7853dae9-e5ac-509d-a30e-4e0092025244',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'medium',
   $q$An isosceles right triangle has two legs, each of length $5$. What is the length of the hypotenuse?$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"added-legs"},{"text":"50","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"$5\\sqrt{2}$","is_correct":true},{"text":"$5\\sqrt{10}$","is_correct":false,"misconception_token":"wrong-radical-simplification"}]$q$::jsonb, $q$$5\sqrt{2}$$q$, $q$Using $a^2 + b^2 = c^2$: $5^2 + 5^2 = 50$, so $c = \sqrt{50} = \sqrt{25 \times 2} = 5\sqrt{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('094e6238-3f74-5204-8316-ed9f87a37d34',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'medium',
   $q$What is the distance between the points $(1, 2)$ and $(4, 6)$ on the coordinate plane?$q$, $q$[{"text":"25","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"7","is_correct":false,"misconception_token":"added-differences"},{"text":"5","is_correct":true},{"text":"$\\sqrt{7}$","is_correct":false,"misconception_token":"did-not-square-differences"}]$q$::jsonb, $q$5$q$, $q$The differences are $4 - 1 = 3$ and $6 - 2 = 4$, so the distance is $\sqrt{3^2 + 4^2} = \sqrt{25} = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d1cc0e51-d9eb-58ed-99a4-af3aabc0b843',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'medium',
   $q$What is the distance between the points $(-2, 1)$ and $(3, 13)$ on the coordinate plane?$q$, $q$[{"text":"169","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"17","is_correct":false,"misconception_token":"added-differences"},{"text":"$\\sqrt{17}$","is_correct":false,"misconception_token":"did-not-square-differences"},{"text":"13","is_correct":true}]$q$::jsonb, $q$13$q$, $q$The differences are $3 - (-2) = 5$ and $13 - 1 = 12$, so the distance is $\sqrt{5^2 + 12^2} = \sqrt{169} = 13$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3394e1b0-0c82-5c9f-b949-2d39465e9d6e',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'medium',
   $q$A rectangle measures $20$ cm by $21$ cm. What is the length of its diagonal?$q$, $q$[{"text":"41","is_correct":false,"misconception_token":"added-sides"},{"text":"29","is_correct":true},{"text":"420","is_correct":false,"misconception_token":"multiplied-sides"},{"text":"841","is_correct":false,"misconception_token":"forgot-square-root"}]$q$::jsonb, $q$29$q$, $q$The diagonal is the hypotenuse: $d^2 = 20^2 + 21^2 = 400 + 441 = 841$, so $d = \sqrt{841} = 29$ cm.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('25abc323-cb7d-5b38-b43d-d9f78b979b75',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'medium',
   $q$A person walks $9$ blocks east and then $12$ blocks north. How far is the person from the starting point in a straight line?$q$, $q$[{"text":"3","is_correct":false,"misconception_token":"subtracted-distances"},{"text":"21","is_correct":false,"misconception_token":"added-distances"},{"text":"15","is_correct":true},{"text":"225","is_correct":false,"misconception_token":"forgot-square-root"}]$q$::jsonb, $q$15$q$, $q$The two legs are $9$ and $12$: $d = \sqrt{9^2 + 12^2} = \sqrt{81 + 144} = \sqrt{225} = 15$ blocks.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('de658c27-7695-563f-8c98-de5e9871c397',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'medium',
   $q$A right triangle has a hypotenuse of length $25$ and one leg of length $24$. What is the length of the other leg?$q$, $q$[{"text":"$\\sqrt{1201}$","is_correct":false,"misconception_token":"added-squares-instead-of-subtracting"},{"text":"1","is_correct":false,"misconception_token":"subtracted-lengths"},{"text":"49","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"7","is_correct":true}]$q$::jsonb, $q$7$q$, $q$Rearrange to $b^2 = c^2 - a^2 = 25^2 - 24^2 = 625 - 576 = 49$, so $b = \sqrt{49} = 7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('97c4990e-12cb-516d-be20-08411fb33fee',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'medium',
   $q$A rectangular box has edge lengths $2$, $3$, and $6$. What is the length of the box's longest interior diagonal?$q$, $q$[{"text":"7","is_correct":true},{"text":"49","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"$\\sqrt{13}$","is_correct":false,"misconception_token":"used-two-edges"},{"text":"11","is_correct":false,"misconception_token":"added-edges"}]$q$::jsonb, $q$7$q$, $q$The space diagonal is $\sqrt{2^2 + 3^2 + 6^2} = \sqrt{4 + 9 + 36} = \sqrt{49} = 7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f74490c3-b0fc-52e3-a138-91a3ed2e0d5c',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'hard',
   $q$A rectangular box has edge lengths $3$, $4$, and $12$. What is the length of the box's longest interior diagonal?$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"used-two-edges"},{"text":"169","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"19","is_correct":false,"misconception_token":"added-edges"},{"text":"13","is_correct":true}]$q$::jsonb, $q$13$q$, $q$The space diagonal is $\sqrt{3^2 + 4^2 + 12^2} = \sqrt{9 + 16 + 144} = \sqrt{169} = 13$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d1bf462c-432c-5a44-a4e3-b160f73a47fe',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'hard',
   $q$A $25$-foot ladder leans against a wall, reaching $24$ feet up. The base is then pulled out until the top of the ladder is only $20$ feet up the wall. How far is the base of the ladder from the wall now?$q$, $q$[{"text":"15","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"subtracted-lengths"},{"text":"$\\sqrt{1025}$","is_correct":false,"misconception_token":"added-squares-instead-of-subtracting"},{"text":"45","is_correct":false,"misconception_token":"added-lengths"}]$q$::jsonb, $q$15$q$, $q$The ladder length ($25$) stays the hypotenuse. With the top at $20$: $b^2 = 25^2 - 20^2 = 625 - 400 = 225$, so $b = \sqrt{225} = 15$ feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d858365d-bc7c-560e-8c03-e73e930f077e',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'hard',
   $q$A cube has edges of length $4$. What is the length of the cube's longest interior diagonal (from one corner to the opposite corner)?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"added-edges"},{"text":"48","is_correct":false,"misconception_token":"forgot-square-root"},{"text":"$4\\sqrt{3}$","is_correct":true},{"text":"$4\\sqrt{2}$","is_correct":false,"misconception_token":"used-two-edges"}]$q$::jsonb, $q$$4\sqrt{3}$$q$, $q$The space diagonal is $\sqrt{4^2 + 4^2 + 4^2} = \sqrt{48} = \sqrt{16 \times 3} = 4\sqrt{3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3b2427da-34b9-57ee-bd58-e11a8abc3ea6',
   null,
   (select id from public.skills where slug = 'pythagorean-theorem'),
   'geometry-trigonometry', 'hard',
   $q$An isosceles triangle has a base of length $10$ and two equal sides of length $13$. What is the height of the triangle from the base to the opposite vertex?$q$, $q$[{"text":"12","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"subtracted-lengths"},{"text":"3","is_correct":false,"misconception_token":"subtracted-base-from-side"},{"text":"$\\sqrt{194}$","is_correct":false,"misconception_token":"added-squares-instead-of-subtracting"}]$q$::jsonb, $q$12$q$, $q$The height splits the base in half, giving a right triangle with hypotenuse $13$ and one leg $5$: $h^2 = 13^2 - 5^2 = 169 - 25 = 144$, so $h = \sqrt{144} = 12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- transformations-8 (Transformations, grade 8, CCSS.MATH.CONTENT.8.G.A) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('631e4090-d3d0-5032-8bdf-9854cfc1ddbd',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'easy',
   $q$The point $(3, -2)$ is reflected over the x-axis. What are the coordinates of its image?$q$, $q$[{"text":"$(-2, 3)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(3, 2)$","is_correct":true},{"text":"$(-3, -2)$","is_correct":false,"misconception_token":"reflected-over-y-axis"},{"text":"$(-3, 2)$","is_correct":false,"misconception_token":"rotated-180-instead"}]$q$::jsonb, $q$$(3, 2)$$q$, $q$A reflection over the x-axis keeps $x$ and negates $y$: $(3, -2) \to (3, 2)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('52abb74d-8ce5-5b99-bd5e-e40acbdb8f3e',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'easy',
   $q$The point $(-4, 5)$ is reflected over the y-axis. What are the coordinates of its image?$q$, $q$[{"text":"$(4, 5)$","is_correct":true},{"text":"$(4, -5)$","is_correct":false,"misconception_token":"rotated-180-instead"},{"text":"$(-4, -5)$","is_correct":false,"misconception_token":"reflected-over-x-axis"},{"text":"$(5, -4)$","is_correct":false,"misconception_token":"swapped-coordinates"}]$q$::jsonb, $q$$(4, 5)$$q$, $q$A reflection over the y-axis negates $x$ and keeps $y$: $(-4, 5) \to (4, 5)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dc5c15a6-7a9a-56dc-aee6-805caa44a4fe',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'easy',
   $q$The point $(2, 3)$ is translated right 4 units and up 1 unit. What are the coordinates of its image?$q$, $q$[{"text":"$(-2, 4)$","is_correct":false,"misconception_token":"moved-left-not-right"},{"text":"$(6, 4)$","is_correct":true},{"text":"$(3, 7)$","is_correct":false,"misconception_token":"swapped-shift-amounts"},{"text":"$(6, 2)$","is_correct":false,"misconception_token":"moved-down-not-up"}]$q$::jsonb, $q$$(6, 4)$$q$, $q$Translating right 4 and up 1 adds to each coordinate: $(2+4, 3+1) = (6, 4)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('84c902fb-5b59-55ce-93ff-9fa8797332ba',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'easy',
   $q$The point $(1, 4)$ is rotated $180^\circ$ about the origin. What are the coordinates of its image?$q$, $q$[{"text":"$(-1, -4)$","is_correct":true},{"text":"$(1, -4)$","is_correct":false,"misconception_token":"reflected-over-x-axis"},{"text":"$(-1, 4)$","is_correct":false,"misconception_token":"reflected-over-y-axis"},{"text":"$(4, 1)$","is_correct":false,"misconception_token":"swapped-coordinates"}]$q$::jsonb, $q$$(-1, -4)$$q$, $q$A $180^\circ$ rotation about the origin negates both coordinates: $(1, 4) \to (-1, -4)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dc8dcb24-5f29-5d5f-8159-ec94cb35a198',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'easy',
   $q$The point $(3, -1)$ is dilated from the origin by a scale factor of $2$. What are the coordinates of its image?$q$, $q$[{"text":"$(6, -1)$","is_correct":false,"misconception_token":"scaled-x-only"},{"text":"$(1.5, -0.5)$","is_correct":false,"misconception_token":"divided-by-factor"},{"text":"$(5, 1)$","is_correct":false,"misconception_token":"added-scale-factor"},{"text":"$(6, -2)$","is_correct":true}]$q$::jsonb, $q$$(6, -2)$$q$, $q$A dilation from the origin multiplies both coordinates by the scale factor: $(3 \times 2, -1 \times 2) = (6, -2)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5306da6c-0f98-5792-856d-4435f5ed1801',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'easy',
   $q$The point $(-2, -6)$ is reflected over the x-axis. What are the coordinates of its image?$q$, $q$[{"text":"$(-6, -2)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(2, 6)$","is_correct":false,"misconception_token":"rotated-180-instead"},{"text":"$(2, -6)$","is_correct":false,"misconception_token":"reflected-over-y-axis"},{"text":"$(-2, 6)$","is_correct":true}]$q$::jsonb, $q$$(-2, 6)$$q$, $q$A reflection over the x-axis keeps $x$ and negates $y$: $(-2, -6) \to (-2, 6)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ae2a6754-528e-52f9-bd99-b5c0264a20d1',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'easy',
   $q$The point $(5, 2)$ is rotated $90^\circ$ counterclockwise about the origin. What are the coordinates of its image?$q$, $q$[{"text":"$(2, 5)$","is_correct":false,"misconception_token":"swapped-without-negating"},{"text":"$(2, -5)$","is_correct":false,"misconception_token":"used-clockwise-rule"},{"text":"$(-2, 5)$","is_correct":true},{"text":"$(-5, -2)$","is_correct":false,"misconception_token":"rotated-180-instead"}]$q$::jsonb, $q$$(-2, 5)$$q$, $q$A $90^\circ$ counterclockwise rotation sends $(x, y) \to (-y, x)$: $(5, 2) \to (-2, 5)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('21aacb52-8767-5e1c-a2d7-6d20d670dd00',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'easy',
   $q$The point $(-3, 4)$ is translated left 2 units and down 5 units. What are the coordinates of its image?$q$, $q$[{"text":"$(-1, 9)$","is_correct":false,"misconception_token":"reversed-both-directions"},{"text":"$(-1, -1)$","is_correct":false,"misconception_token":"moved-right-not-left"},{"text":"$(-5, -1)$","is_correct":true},{"text":"$(-5, 9)$","is_correct":false,"misconception_token":"moved-up-not-down"}]$q$::jsonb, $q$$(-5, -1)$$q$, $q$Left 2 subtracts from $x$ and down 5 subtracts from $y$: $(-3-2, 4-5) = (-5, -1)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c7841e1a-e919-5d20-a9af-b74543c830a2',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'medium',
   $q$Triangle $ABC$ has vertices $A(2, 3)$, $B(5, 3)$, and $C(2, 7)$. Its image has vertices $A'(-2, 3)$, $B'(-5, 3)$, and $C'(-2, 7)$. Which transformation was applied?$q$, $q$[{"text":"Reflection over the y-axis","is_correct":true},{"text":"Reflection over the x-axis","is_correct":false,"misconception_token":"reflected-wrong-axis"},{"text":"Translation to the left","is_correct":false,"misconception_token":"mistook-for-translation"},{"text":"Rotation of 180 degrees about the origin","is_correct":false,"misconception_token":"mistook-for-rotation"}]$q$::jsonb, $q$Reflection over the y-axis$q$, $q$Each $x$ is negated while every $y$ stays the same, so the figure was reflected over the y-axis: $(x, y) \to (-x, y)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7e3aab8e-f251-58b5-8f4b-ad82d670b159',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'medium',
   $q$The point $(-6, 3)$ is rotated $270^\circ$ counterclockwise about the origin. What are the coordinates of its image?$q$, $q$[{"text":"$(-3, -6)$","is_correct":false,"misconception_token":"used-90-ccw-rule"},{"text":"$(6, -3)$","is_correct":false,"misconception_token":"rotated-180-instead"},{"text":"$(3, 6)$","is_correct":true},{"text":"$(3, -6)$","is_correct":false,"misconception_token":"swapped-without-negating"}]$q$::jsonb, $q$$(3, 6)$$q$, $q$A $270^\circ$ counterclockwise rotation sends $(x, y) \to (y, -x)$: $(-6, 3) \to (3, 6)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('91b0f801-e08d-594c-bdc2-fd95a2eb7230',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'medium',
   $q$On a coordinate map, a park entrance is at $(4, -6)$. A designer applies a dilation from the origin with scale factor $\frac{1}{2}$. What are the coordinates of the image?$q$, $q$[{"text":"$(4.5, -5.5)$","is_correct":false,"misconception_token":"added-scale-factor"},{"text":"$(8, -12)$","is_correct":false,"misconception_token":"multiplied-instead-of-halved"},{"text":"$(2, -3)$","is_correct":true},{"text":"$(2, -6)$","is_correct":false,"misconception_token":"scaled-x-only"}]$q$::jsonb, $q$$(2, -3)$$q$, $q$Multiply both coordinates by $\frac{1}{2}$: $(4 \times \frac{1}{2}, -6 \times \frac{1}{2}) = (2, -3)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ab405dae-616a-5b6b-92b2-972284108252',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'medium',
   $q$Triangle $PQR$ has vertices $P(1, 2)$, $Q(4, 5)$, and $R(6, 2)$. Its image has vertices $P'(1, -3)$, $Q'(4, 0)$, and $R'(6, -3)$. Which transformation was applied?$q$, $q$[{"text":"Translation up 5 units","is_correct":false,"misconception_token":"wrong-direction"},{"text":"Reflection over the x-axis","is_correct":false,"misconception_token":"mistook-for-reflection"},{"text":"Translation down 3 units","is_correct":false,"misconception_token":"misread-distance"},{"text":"Translation down 5 units","is_correct":true}]$q$::jsonb, $q$Translation down 5 units$q$, $q$Every $x$ stays the same and every $y$ decreases by 5, so the figure was translated down 5 units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2a70ee0f-bad7-5808-aac6-9ced033bf683',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'medium',
   $q$A video game character stands at $(-7, 2)$. When the level flips, the character is reflected over the y-axis. What are the character's new coordinates?$q$, $q$[{"text":"$(-7, -2)$","is_correct":false,"misconception_token":"reflected-over-x-axis"},{"text":"$(7, 2)$","is_correct":true},{"text":"$(2, -7)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(7, -2)$","is_correct":false,"misconception_token":"rotated-180-instead"}]$q$::jsonb, $q$$(7, 2)$$q$, $q$A reflection over the y-axis negates $x$ and keeps $y$: $(-7, 2) \to (7, 2)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('17ffdc78-df58-517d-8146-74c7903e2e41',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'medium',
   $q$The point $(3, 5)$ is first translated up 2 units and then reflected over the x-axis. What are the coordinates of the final image?$q$, $q$[{"text":"$(-3, 7)$","is_correct":false,"misconception_token":"reflected-wrong-axis"},{"text":"$(3, 7)$","is_correct":false,"misconception_token":"forgot-to-reflect"},{"text":"$(3, -7)$","is_correct":true},{"text":"$(3, -3)$","is_correct":false,"misconception_token":"performed-steps-in-reverse"}]$q$::jsonb, $q$$(3, -7)$$q$, $q$Up 2 gives $(3, 7)$, then reflecting over the x-axis negates $y$: $(3, 7) \to (3, -7)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('55105186-39d6-5ec3-9557-5b5acbe00d44',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'medium',
   $q$A photo has a corner at $(-2, 5)$. It is enlarged by a dilation from the origin with scale factor $3$. What are the new coordinates of that corner?$q$, $q$[{"text":"$(-2, 15)$","is_correct":false,"misconception_token":"scaled-y-only"},{"text":"$(1, 8)$","is_correct":false,"misconception_token":"added-scale-factor"},{"text":"$(-6, 5)$","is_correct":false,"misconception_token":"scaled-x-only"},{"text":"$(-6, 15)$","is_correct":true}]$q$::jsonb, $q$$(-6, 15)$$q$, $q$Multiply both coordinates by $3$: $(-2 \times 3, 5 \times 3) = (-6, 15)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('78a1d8b0-764d-5c6b-8738-1253cb6fa897',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'medium',
   $q$The point $(-3, -8)$ is rotated $90^\circ$ clockwise about the origin. What are the coordinates of its image?$q$, $q$[{"text":"$(-8, 3)$","is_correct":true},{"text":"$(3, 8)$","is_correct":false,"misconception_token":"rotated-180-instead"},{"text":"$(-8, -3)$","is_correct":false,"misconception_token":"forgot-to-negate"},{"text":"$(8, -3)$","is_correct":false,"misconception_token":"used-counterclockwise-rule"}]$q$::jsonb, $q$$(-8, 3)$$q$, $q$A $90^\circ$ clockwise rotation sends $(x, y) \to (y, -x)$: $(-3, -8) \to (-8, 3)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('42fa7ede-4428-5e50-9428-c41878ca5e2c',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'hard',
   $q$A drone starts at $(6, -4)$. It is rotated $180^\circ$ about the origin, then translated left 3 units and up 5 units. What is its final position?$q$, $q$[{"text":"$(-6, 4)$","is_correct":false,"misconception_token":"skipped-translation"},{"text":"$(-3, -1)$","is_correct":false,"misconception_token":"reversed-translation-directions"},{"text":"$(3, 1)$","is_correct":false,"misconception_token":"skipped-rotation"},{"text":"$(-9, 9)$","is_correct":true}]$q$::jsonb, $q$$(-9, 9)$$q$, $q$The $180^\circ$ rotation gives $(-6, 4)$, then left 3 and up 5 gives $(-6-3, 4+5) = (-9, 9)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d6c49aa2-a7a0-5116-97ec-f647cc1c4bf3',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'hard',
   $q$Triangle $ABC$ has vertices $A(1, 2)$, $B(3, 4)$, and $C(5, 1)$. Its image has vertices $A'(3, 6)$, $B'(9, 12)$, and $C'(15, 3)$. Which transformation was applied?$q$, $q$[{"text":"Dilation from the origin with scale factor 3","is_correct":true},{"text":"Dilation from the origin with scale factor 2","is_correct":false,"misconception_token":"wrong-scale-factor"},{"text":"Rotation of 90 degrees about the origin","is_correct":false,"misconception_token":"mistook-for-rotation"},{"text":"Translation by adding 2 to each coordinate","is_correct":false,"misconception_token":"mistook-for-translation"}]$q$::jsonb, $q$Dilation from the origin with scale factor 3$q$, $q$Each coordinate is multiplied by 3 (for example $A(1, 2) \to A'(3, 6)$), so it is a dilation from the origin with scale factor 3.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a1de8fa0-d56d-52a1-9856-3d3df418886f',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'hard',
   $q$A robot at $(-5, 6)$ is reflected over the x-axis and then rotated $90^\circ$ counterclockwise about the origin. What are its final coordinates?$q$, $q$[{"text":"$(-6, 5)$","is_correct":false,"misconception_token":"performed-steps-in-reverse"},{"text":"$(-6, -5)$","is_correct":false,"misconception_token":"skipped-reflection"},{"text":"$(6, -5)$","is_correct":true},{"text":"$(-5, -6)$","is_correct":false,"misconception_token":"skipped-rotation"}]$q$::jsonb, $q$$(6, -5)$$q$, $q$Reflecting over the x-axis gives $(-5, -6)$, then a $90^\circ$ counterclockwise rotation sends $(x, y) \to (-y, x)$: $(-5, -6) \to (6, -5)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('227bc5b0-f265-5700-b628-a01a14899a66',
   null,
   (select id from public.skills where slug = 'transformations-8'),
   'geometry-trigonometry', 'hard',
   $q$An architect places a beam endpoint at $(8, -10)$. She dilates the drawing from the origin by scale factor $\frac{1}{2}$, then reflects the result over the y-axis. What are the final coordinates?$q$, $q$[{"text":"$(-4, -5)$","is_correct":true},{"text":"$(4, 5)$","is_correct":false,"misconception_token":"reflected-wrong-axis"},{"text":"$(-16, -20)$","is_correct":false,"misconception_token":"used-reciprocal-factor"},{"text":"$(4, -5)$","is_correct":false,"misconception_token":"skipped-reflection"}]$q$::jsonb, $q$$(-4, -5)$$q$, $q$The dilation gives $(8 \times \frac{1}{2}, -10 \times \frac{1}{2}) = (4, -5)$, then reflecting over the y-axis negates $x$: $(4, -5) \to (-4, -5)$.$q$, 'published')
on conflict (id) do update set
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
