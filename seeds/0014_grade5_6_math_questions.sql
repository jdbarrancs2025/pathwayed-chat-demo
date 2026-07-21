-- PathwayEd — Question Engine: GRADE 5 & 6 math skills + questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-grade5-6-math-seeds.ts from the
-- curated pool in src/lib/grade5_6MathTemplates.ts. Tops up grades 5 and 6 toward
-- the grade-3 shape (~8 skills each).
--
-- HOW TO APPLY (self-contained — upserts the reused CCSS domains + the skills with
-- their CCSS tags, then the questions):
--   bun run db:seed seeds/0014_grade5_6_math_questions.sql
-- Idempotent. Skills upsert ON CONFLICT (slug). Depends on migration 0004, 0008,
-- and seed 0001. Answer keys are verified by hand before this seed is run.
--
-- 100% ORIGINAL items written to one CCSS standard each, grade-appropriate.

begin;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-nbt')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Number & Operations in Base Ten', null, '3-5', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-decimal-place-value')::uuid, 'skill', md5('pe-aos:dom-math-nbt')::uuid, 'math', 'Decimal Place Value', 'decimal-place-value', '3-5', 'problem-solving-data-analysis', '5', 5, 'CCSS.MATH.CONTENT.5.NBT.A.3', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-decimal-operations')::uuid, 'skill', md5('pe-aos:dom-math-nbt')::uuid, 'math', 'Decimal Operations', 'decimal-operations', '3-5', 'problem-solving-data-analysis', '5', 5, 'CCSS.MATH.CONTENT.5.NBT.B.7', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-multiply-divide-whole-5')::uuid, 'skill', md5('pe-aos:dom-math-nbt')::uuid, 'math', 'Multiply & Divide Whole Numbers', 'multiply-divide-whole-5', '3-5', 'problem-solving-data-analysis', '5', 5, 'CCSS.MATH.CONTENT.5.NBT.B.5', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-frac')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Number & Operations — Fractions', null, '3-5', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-add-subtract-fractions-unlike')::uuid, 'skill', md5('pe-aos:dom-math-frac')::uuid, 'math', 'Add & Subtract Fractions', 'add-subtract-fractions-unlike', '3-5', 'problem-solving-data-analysis', '5', 5, 'CCSS.MATH.CONTENT.5.NF.A.1', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-multiply-divide-fractions')::uuid, 'skill', md5('pe-aos:dom-math-frac')::uuid, 'math', 'Multiply & Divide Fractions', 'multiply-divide-fractions', '3-5', 'problem-solving-data-analysis', '5', 5, 'CCSS.MATH.CONTENT.5.NF.B.4', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-geo')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Geometry', null, '3-5', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-coordinate-plane')::uuid, 'skill', md5('pe-aos:dom-math-geo')::uuid, 'math', 'Coordinate Plane', 'coordinate-plane', '3-5', 'geometry-trigonometry', '5', 5, 'CCSS.MATH.CONTENT.5.G.A.2', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-oat')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Operations & Algebraic Thinking', null, '3-5', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-numerical-expressions')::uuid, 'skill', md5('pe-aos:dom-math-oat')::uuid, 'math', 'Numerical Expressions', 'numerical-expressions', '3-5', 'algebra', '5', 5, 'CCSS.MATH.CONTENT.5.OA.A.1', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-ns7')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'The Number System', null, '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-integers-rational-numbers')::uuid, 'skill', md5('pe-aos:dom-math-ns7')::uuid, 'math', 'Integers & Rational Numbers', 'integers-rational-numbers', '6-8', 'algebra', '6', 6, 'CCSS.MATH.CONTENT.6.NS.C', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-divide-fractions')::uuid, 'skill', md5('pe-aos:dom-math-ns7')::uuid, 'math', 'Dividing Fractions', 'divide-fractions', '6-8', 'problem-solving-data-analysis', '6', 6, 'CCSS.MATH.CONTENT.6.NS.A.1', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-ee7')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Expressions & Equations', null, '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-one-step-equations')::uuid, 'skill', md5('pe-aos:dom-math-ee7')::uuid, 'math', 'One-Step Equations', 'one-step-equations', '6-8', 'algebra', '6', 6, 'CCSS.MATH.CONTENT.6.EE.B.7', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-geo7')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Geometry', null, '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-area-surface-volume-6')::uuid, 'skill', md5('pe-aos:dom-math-geo7')::uuid, 'math', 'Area, Surface Area & Volume', 'area-surface-volume-6', '6-8', 'geometry-trigonometry', '6', 6, 'CCSS.MATH.CONTENT.6.G.A.1', '{}')
on conflict (slug) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- decimal-place-value (Decimal Place Value, grade 5, CCSS.MATH.CONTENT.5.NBT.A.3) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bbf72662-61ef-51f0-b3fd-bd9f8979475f',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'easy',
   $q$In the number $2.463$, what is the value of the digit $4$?$q$, $q$[{"text":"$0.004$","is_correct":false,"misconception_token":"read-as-thousandths"},{"text":"$0.4$","is_correct":true},{"text":"$0.04$","is_correct":false,"misconception_token":"read-as-hundredths"},{"text":"$4$","is_correct":false,"misconception_token":"ignored-place-value"}]$q$::jsonb, $q$$0.4$$q$, $q$The digit $4$ is in the tenths place, so its value is $4 \times 0.1 = 0.4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9317f429-3e5d-5ddc-9368-0c9d99047973',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'easy',
   $q$How do you read the decimal $0.35$?$q$, $q$[{"text":"Thirty-five hundredths","is_correct":true},{"text":"Thirty-five thousandths","is_correct":false,"misconception_token":"read-as-thousandths"},{"text":"Thirty-five tenths","is_correct":false,"misconception_token":"read-as-tenths"},{"text":"Three hundred five","is_correct":false,"misconception_token":"misread-digits"}]$q$::jsonb, $q$Thirty-five hundredths$q$, $q$In $0.35$ the last digit is in the hundredths place, so it is read "thirty-five hundredths."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('355525bd-4e43-588b-bebe-d08d1a20be92',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'easy',
   $q$Which number is equal to six and seven tenths?$q$, $q$[{"text":"$0.67$","is_correct":false,"misconception_token":"misplaced-decimal"},{"text":"$6.7$","is_correct":true},{"text":"$67$","is_correct":false,"misconception_token":"ignored-decimal"},{"text":"$6.07$","is_correct":false,"misconception_token":"wrote-tenths-as-hundredths"}]$q$::jsonb, $q$$6.7$$q$, $q$Six and seven tenths is $6 + 0.7 = 6.7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3532eed5-a7ea-58dc-8628-f735e707bb6a',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'easy',
   $q$Which statement is true?$q$, $q$[{"text":"$0.6 = 0.60$","is_correct":true},{"text":"$0.6 < 0.60$","is_correct":false,"misconception_token":"thinks-fewer-digits-smaller"},{"text":"$0.6 > 0.60$","is_correct":false,"misconception_token":"thinks-fewer-digits-larger"},{"text":"$0.06 = 0.6$","is_correct":false,"misconception_token":"ignored-place-value"}]$q$::jsonb, $q$$0.6 = 0.60$$q$, $q$Adding a trailing zero does not change a decimal's value, so $0.6 = 0.60$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1a653bd5-9654-5d69-b212-824a2b23a955',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'easy',
   $q$Which of these decimals is the greatest?$q$, $q$[{"text":"$0.45$","is_correct":false,"misconception_token":"compared-digits-ignoring-place"},{"text":"$0.051$","is_correct":false,"misconception_token":"ignored-leading-place"},{"text":"$0.409$","is_correct":false,"misconception_token":"longer-is-larger"},{"text":"$0.5$","is_correct":true}]$q$::jsonb, $q$$0.5$$q$, $q$Aligning place values, $0.500 > 0.450 > 0.409 > 0.051$, so $0.5$ is greatest.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0d511508-cb48-56d2-8e14-e7f3128589f8',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'easy',
   $q$Round $3.47$ to the nearest tenth.$q$, $q$[{"text":"$4$","is_correct":false,"misconception_token":"rounded-to-whole"},{"text":"$3.47$","is_correct":false,"misconception_token":"did-not-round"},{"text":"$3.4$","is_correct":false,"misconception_token":"rounded-down-instead"},{"text":"$3.5$","is_correct":true}]$q$::jsonb, $q$$3.5$$q$, $q$The hundredths digit is $7$, which is $\geq 5$, so round the tenths up: $3.47 \approx 3.5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bc0794e2-2351-5121-9fa8-0d3568d8def5',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'easy',
   $q$Round $6.2$ to the nearest whole number.$q$, $q$[{"text":"$6.2$","is_correct":false,"misconception_token":"did-not-round"},{"text":"$7$","is_correct":false,"misconception_token":"rounded-up-instead"},{"text":"$6$","is_correct":true},{"text":"$6.5$","is_correct":false,"misconception_token":"rounded-to-half"}]$q$::jsonb, $q$$6$$q$, $q$The tenths digit is $2$, which is $< 5$, so round down: $6.2 \approx 6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dff6237a-4577-5a73-ba2a-bce6ed491c84',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'easy',
   $q$Which expanded form is equal to $0.24$?$q$, $q$[{"text":"$0.02 + 0.004$","is_correct":false,"misconception_token":"shifted-places-right"},{"text":"$0.2 + 0.4$","is_correct":false,"misconception_token":"wrong-hundredths-place"},{"text":"$0.2 + 0.04$","is_correct":true},{"text":"$2 + 4$","is_correct":false,"misconception_token":"ignored-decimal-places"}]$q$::jsonb, $q$$0.2 + 0.04$$q$, $q$The value $0.24$ is two tenths and four hundredths, so $0.24 = 0.2 + 0.04$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('055e9221-5a72-52bb-8a7b-432a78bf9b9e',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'medium',
   $q$In $0.66$, how does the value of the $6$ in the tenths place compare to the value of the $6$ in the hundredths place?$q$, $q$[{"text":"It is $10$ times as great.","is_correct":true},{"text":"It is $\\frac{1}{10}$ as great.","is_correct":false,"misconception_token":"reversed-the-relationship"},{"text":"It is the same value.","is_correct":false,"misconception_token":"thinks-places-equal"},{"text":"It is $100$ times as great.","is_correct":false,"misconception_token":"used-100-instead-of-10"}]$q$::jsonb, $q$It is $10$ times as great.$q$, $q$A digit is $10$ times the value of the same digit one place to its right, so the tenths $6$ is $10$ times the hundredths $6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('52b96579-59c8-504d-9eb5-be1b8c593557',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'medium',
   $q$Which decimal represents nine and fifty-three thousandths?$q$, $q$[{"text":"$9.53$","is_correct":false,"misconception_token":"fifty-three-as-hundredths"},{"text":"$9.0053$","is_correct":false,"misconception_token":"over-shifted-place"},{"text":"$9.053$","is_correct":true},{"text":"$9.530$","is_correct":false,"misconception_token":"appended-trailing-zero"}]$q$::jsonb, $q$$9.053$$q$, $q$Thousandths is the third decimal place; $53$ thousandths is $0.053$, so the number is $9.053$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('42951c16-1cab-5f68-b5d8-72aa17f1e099',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'medium',
   $q$Which comparison is correct?$q$, $q$[{"text":"$0.4 < 0.375$","is_correct":false,"misconception_token":"longer-is-larger"},{"text":"$0.125 > 0.13$","is_correct":false,"misconception_token":"more-digits-larger"},{"text":"$0.125 < 0.13$","is_correct":true},{"text":"$0.09 > 0.1$","is_correct":false,"misconception_token":"ignored-place-value"}]$q$::jsonb, $q$$0.125 < 0.13$$q$, $q$Writing $0.13$ as $0.130$, we compare $125$ and $130$; since $125 < 130$, $0.125 < 0.13$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cfd0f1ac-5cc0-5b10-8a1e-98bd38c67a95',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'medium',
   $q$Round $5.837$ to the nearest hundredth.$q$, $q$[{"text":"$5.8$","is_correct":false,"misconception_token":"rounded-to-tenth"},{"text":"$5.83$","is_correct":false,"misconception_token":"truncated-instead-of-rounding"},{"text":"$5.85$","is_correct":false,"misconception_token":"over-rounded"},{"text":"$5.84$","is_correct":true}]$q$::jsonb, $q$$5.84$$q$, $q$The thousandths digit is $7$, which is $\geq 5$, so round the hundredths up: $5.837 \approx 5.84$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('30133241-8d91-56c2-a305-f94c79b31d41',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'medium',
   $q$Which expanded form is equal to $0.507$?$q$, $q$[{"text":"$0.5 + 0.07$","is_correct":false,"misconception_token":"seven-in-hundredths"},{"text":"$0.5 + 0.007$","is_correct":true},{"text":"$0.05 + 0.007$","is_correct":false,"misconception_token":"five-in-hundredths"},{"text":"$0.5 + 0.7$","is_correct":false,"misconception_token":"seven-in-tenths"}]$q$::jsonb, $q$$0.5 + 0.007$$q$, $q$The value $0.507$ is five tenths, zero hundredths, and seven thousandths, so $0.507 = 0.5 + 0.007$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ab0c5904-67cb-5475-929d-d471c6ae44d0',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'medium',
   $q$What number is equal to $3 + 0.4 + 0.06 + 0.002$?$q$, $q$[{"text":"$34.62$","is_correct":false,"misconception_token":"ignored-decimal"},{"text":"$3.46$","is_correct":false,"misconception_token":"dropped-thousandths"},{"text":"$3.462$","is_correct":true},{"text":"$3.4062$","is_correct":false,"misconception_token":"misaligned-places"}]$q$::jsonb, $q$$3.462$$q$, $q$Combining the place values, $3 + 0.4 + 0.06 + 0.002 = 3.462$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a6db510d-6d31-5597-a2f4-92e846d07e0a',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'medium',
   $q$A runner's time was $12.08$ seconds. Written in words, this time is:$q$, $q$[{"text":"twelve and eighty hundredths","is_correct":false,"misconception_token":"misread-zero"},{"text":"twelve and eight tenths","is_correct":false,"misconception_token":"read-as-tenths"},{"text":"twelve and eight thousandths","is_correct":false,"misconception_token":"read-as-thousandths"},{"text":"twelve and eight hundredths","is_correct":true}]$q$::jsonb, $q$twelve and eight hundredths$q$, $q$In $12.08$ the digit $8$ is in the hundredths place, so it is "twelve and eight hundredths."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e9992dab-0fa8-57e9-89c7-30a1161bfff7',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'medium',
   $q$Three ribbons measure $0.8$ m, $0.75$ m, and $0.709$ m. Which ribbon is the longest?$q$, $q$[{"text":"The $0.8$ m ribbon","is_correct":true},{"text":"The $0.709$ m ribbon","is_correct":false,"misconception_token":"longer-decimal-larger"},{"text":"They are all equal","is_correct":false,"misconception_token":"thinks-all-equal"},{"text":"The $0.75$ m ribbon","is_correct":false,"misconception_token":"most-digits-longest"}]$q$::jsonb, $q$The $0.8$ m ribbon$q$, $q$Aligning places, $0.800 > 0.750 > 0.709$, so the $0.8$ m ribbon is longest.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b33037fd-337d-58d2-a9ce-15aceff13561',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'hard',
   $q$A scientist measures a sample at $4.0863$ grams and rounds it to the nearest hundredth of a gram. What is the rounded mass?$q$, $q$[{"text":"$4.10$ grams","is_correct":false,"misconception_token":"over-carried-rounding"},{"text":"$4.087$ grams","is_correct":false,"misconception_token":"rounded-to-thousandth"},{"text":"$4.08$ grams","is_correct":false,"misconception_token":"truncated-instead-of-rounding"},{"text":"$4.09$ grams","is_correct":true}]$q$::jsonb, $q$$4.09$ grams$q$, $q$The thousandths digit is $6$, which is $\geq 5$, so the hundredths digit $8$ rounds up to $9$: $4.0863 \approx 4.09$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('99339b4e-bb06-5a91-a354-2a83abca25f4',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'hard',
   $q$In the number $7.077$, the digit $7$ appears in the ones place and in the thousandths place. How many times as great is the value of the $7$ in the ones place as the value of the $7$ in the thousandths place?$q$, $q$[{"text":"$1000$ times","is_correct":true},{"text":"$100$ times","is_correct":false,"misconception_token":"counted-two-place-jumps"},{"text":"$3$ times","is_correct":false,"misconception_token":"counted-digit-positions"},{"text":"$10$ times","is_correct":false,"misconception_token":"counted-one-place-jump"}]$q$::jsonb, $q$$1000$ times$q$, $q$The ones place is three places left of the thousandths place, and each place is $10$ times the next, so $10 \times 10 \times 10 = 1000$ times as great.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('efc2eb9e-08fa-561b-a7f7-5b16dd2b85d0',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'hard',
   $q$Which number is equal to $(2 \times 1) + (6 \times \frac{1}{100}) + (3 \times \frac{1}{1000})$?$q$, $q$[{"text":"$2.63$","is_correct":false,"misconception_token":"dropped-zero-placeholder"},{"text":"$20.063$","is_correct":false,"misconception_token":"misread-ones-as-tens"},{"text":"$2.063$","is_correct":true},{"text":"$2.0603$","is_correct":false,"misconception_token":"misplaced-thousandths"}]$q$::jsonb, $q$$2.063$$q$, $q$This equals $2 + 0.06 + 0.003 = 2.063$; the tenths place is $0$ as a placeholder.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5291d83c-1b3a-57b0-b07e-eab3bef16caf',
   null,
   (select id from public.skills where slug = 'decimal-place-value'),
   'problem-solving-data-analysis', 'hard',
   $q$Four students recorded these distances in kilometers: $3.4$, $3.399$, $3.41$, and $3.04$. Ordered from greatest to least, which list is correct?$q$, $q$[{"text":"$3.41, 3.4, 3.399, 3.04$","is_correct":true},{"text":"$3.04, 3.399, 3.4, 3.41$","is_correct":false,"misconception_token":"ordered-least-to-greatest"},{"text":"$3.4, 3.41, 3.399, 3.04$","is_correct":false,"misconception_token":"fewer-digits-larger"},{"text":"$3.399, 3.41, 3.4, 3.04$","is_correct":false,"misconception_token":"longer-decimal-first"}]$q$::jsonb, $q$$3.41, 3.4, 3.399, 3.04$$q$, $q$Aligning places, $3.410 > 3.400 > 3.399 > 3.040$, so greatest to least is $3.41, 3.4, 3.399, 3.04$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- decimal-operations (Decimal Operations, grade 5, CCSS.MATH.CONTENT.5.NBT.B.7) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('368cb579-a23b-58e8-9dcf-bf6fdc057d2d',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $0.6 + 0.3$?$q$, $q$[{"text":"0.09","is_correct":false,"misconception_token":"misplaced-decimal"},{"text":"0.9","is_correct":true},{"text":"0.3","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"0.18","is_correct":false,"misconception_token":"multiplied-instead-of-added"}]$q$::jsonb, $q$0.9$q$, $q$Add the tenths: $0.6 + 0.3 = 0.9$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6b572961-b032-5093-8914-d9152ac58542',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $0.8 - 0.5$?$q$, $q$[{"text":"0.3","is_correct":true},{"text":"0.4","is_correct":false,"misconception_token":"multiplied-instead-of-subtracted"},{"text":"1.3","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"0.03","is_correct":false,"misconception_token":"misplaced-decimal"}]$q$::jsonb, $q$0.3$q$, $q$Subtract the tenths: $0.8 - 0.5 = 0.3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0f5808e5-964c-559d-b5b6-1a8120fb0449',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $0.45 + 0.24$?$q$, $q$[{"text":"0.108","is_correct":false,"misconception_token":"multiplied-instead-of-added"},{"text":"0.69","is_correct":true},{"text":"6.9","is_correct":false,"misconception_token":"misplaced-decimal"},{"text":"0.21","is_correct":false,"misconception_token":"subtracted-instead-of-added"}]$q$::jsonb, $q$0.69$q$, $q$Line up the decimals and add: $0.45 + 0.24 = 0.69$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e0dd5b95-dd6d-5efd-a63c-718d48f2a93e',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $0.72 - 0.31$?$q$, $q$[{"text":"0.41","is_correct":true},{"text":"1.03","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"0.2232","is_correct":false,"misconception_token":"multiplied-instead-of-subtracted"},{"text":"4.1","is_correct":false,"misconception_token":"misplaced-decimal"}]$q$::jsonb, $q$0.41$q$, $q$Line up the decimals and subtract: $0.72 - 0.31 = 0.41$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('74cb231f-642e-5f8d-80b4-7cc2af37aa70',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $0.4 \times 3$?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"dropped-decimal-point"},{"text":"3.4","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"0.12","is_correct":false,"misconception_token":"too-many-decimal-places"},{"text":"1.2","is_correct":true}]$q$::jsonb, $q$1.2$q$, $q$Multiply $4 \times 3 = 12$, then place one decimal digit: $0.4 \times 3 = 1.2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('eaad2874-cd74-52fa-9e2c-c1f97c4efbc8',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $0.8 \div 4$?$q$, $q$[{"text":"0.4","is_correct":false,"misconception_token":"used-wrong-divisor"},{"text":"3.2","is_correct":false,"misconception_token":"multiplied-instead-of-divided"},{"text":"2","is_correct":false,"misconception_token":"misplaced-decimal"},{"text":"0.2","is_correct":true}]$q$::jsonb, $q$0.2$q$, $q$Divide $8 \div 4 = 2$, keeping one decimal digit: $0.8 \div 4 = 0.2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2cf0708f-2855-5630-a577-9e6cb715d25f',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $0.5 + 0.25$?$q$, $q$[{"text":"0.125","is_correct":false,"misconception_token":"multiplied-instead-of-added"},{"text":"0.3","is_correct":false,"misconception_token":"misaligned-place-value"},{"text":"0.75","is_correct":true},{"text":"0.25","is_correct":false,"misconception_token":"subtracted-instead-of-added"}]$q$::jsonb, $q$0.75$q$, $q$Write $0.5$ as $0.50$ and add: $0.50 + 0.25 = 0.75$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('aaa36846-e209-5579-8e85-707dffdf4d86',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'easy',
   $q$A pencil costs 0.40 dollars and an eraser costs 0.35 dollars. How much do they cost together?$q$, $q$[{"text":"7.5","is_correct":false,"misconception_token":"misplaced-decimal"},{"text":"0.05","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"0.75","is_correct":true},{"text":"0.14","is_correct":false,"misconception_token":"multiplied-instead-of-added"}]$q$::jsonb, $q$0.75$q$, $q$Add the two prices: $0.40 + 0.35 = 0.75$, so they cost 0.75 dollars together.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('767c3655-f7b3-5ce3-b414-7f6a30a33098',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $3.6 + 2.75$?$q$, $q$[{"text":"6.35","is_correct":true},{"text":"0.85","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"5.81","is_correct":false,"misconception_token":"misaligned-place-value"},{"text":"9.9","is_correct":false,"misconception_token":"multiplied-instead-of-added"}]$q$::jsonb, $q$6.35$q$, $q$Write $3.6$ as $3.60$ and add: $3.60 + 2.75 = 6.35$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9f1fdd04-ca8e-5473-b79d-83b4d08d5291',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $5.4 - 2.85$?$q$, $q$[{"text":"8.25","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"15.39","is_correct":false,"misconception_token":"multiplied-instead-of-subtracted"},{"text":"2.55","is_correct":true},{"text":"3.45","is_correct":false,"misconception_token":"subtract-smaller-from-larger"}]$q$::jsonb, $q$2.55$q$, $q$Write $5.4$ as $5.40$ and subtract with regrouping: $5.40 - 2.85 = 2.55$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3a936a37-762a-557e-ad2c-84a19661c1ce',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $0.6 \times 0.4$?$q$, $q$[{"text":"1.0","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"2.4","is_correct":false,"misconception_token":"too-few-decimal-places"},{"text":"0.24","is_correct":true},{"text":"0.024","is_correct":false,"misconception_token":"too-many-decimal-places"}]$q$::jsonb, $q$0.24$q$, $q$Multiply $6 \times 4 = 24$, then place two decimal digits: $0.6 \times 0.4 = 0.24$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3e7a3252-1679-5345-a1d1-4ec330c3e5eb',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $1.2 \times 0.5$?$q$, $q$[{"text":"0.06","is_correct":false,"misconception_token":"too-many-decimal-places"},{"text":"6","is_correct":false,"misconception_token":"dropped-decimal-point"},{"text":"1.7","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"0.6","is_correct":true}]$q$::jsonb, $q$0.6$q$, $q$Multiply $12 \times 5 = 60$, then place two decimal digits: $1.2 \times 0.5 = 0.6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('01d79351-b912-54d4-86af-0b8535f5360d',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $4.5 \div 5$?$q$, $q$[{"text":"9","is_correct":false,"misconception_token":"misplaced-decimal"},{"text":"0.9","is_correct":true},{"text":"22.5","is_correct":false,"misconception_token":"multiplied-instead-of-divided"},{"text":"0.09","is_correct":false,"misconception_token":"too-many-decimal-places"}]$q$::jsonb, $q$0.9$q$, $q$Divide $45 \div 5 = 9$, keeping one decimal digit: $4.5 \div 5 = 0.9$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a99fd7bd-294e-5fd6-a011-2994595ece79',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'medium',
   $q$Maria buys 3 notebooks that each cost 1.25 dollars. How much does she spend in all?$q$, $q$[{"text":"3.6","is_correct":false,"misconception_token":"dropped-hundredths"},{"text":"4.25","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"3.75","is_correct":true},{"text":"0.375","is_correct":false,"misconception_token":"misplaced-decimal"}]$q$::jsonb, $q$3.75$q$, $q$Multiply the price by the count: $3 \times 1.25 = 3.75$, so she spends 3.75 dollars.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6a114b6e-9789-5b0e-b7fa-83388bdafa20',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'medium',
   $q$A ribbon is 2.4 meters long. Jed cuts off 0.85 meters. How long is the ribbon now?$q$, $q$[{"text":"2.45","is_correct":false,"misconception_token":"subtract-smaller-from-larger"},{"text":"3.25","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"2.04","is_correct":false,"misconception_token":"multiplied-instead-of-subtracted"},{"text":"1.55","is_correct":true}]$q$::jsonb, $q$1.55$q$, $q$Write $2.4$ as $2.40$ and subtract: $2.40 - 0.85 = 1.55$ meters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3a1aa507-7df6-5e9c-bfbe-c4738d57fbc8',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'medium',
   $q$Ken pays for a 6.50 dollar lunch with a 10 dollar bill. How much change should he get?$q$, $q$[{"text":"3.50","is_correct":true},{"text":"4.50","is_correct":false,"misconception_token":"subtract-smaller-from-larger"},{"text":"65","is_correct":false,"misconception_token":"multiplied-instead-of-subtracted"},{"text":"16.50","is_correct":false,"misconception_token":"added-instead-of-subtracted"}]$q$::jsonb, $q$3.50$q$, $q$Write $10$ as $10.00$ and subtract: $10.00 - 6.50 = 3.50$, so his change is 3.50 dollars.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c97a3704-aa64-55d6-b40e-7095c547af73',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'hard',
   $q$What is $12.5 \times 0.4$?$q$, $q$[{"text":"0.5","is_correct":false,"misconception_token":"too-many-decimal-places"},{"text":"12.9","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"50","is_correct":false,"misconception_token":"dropped-decimal-point"},{"text":"5","is_correct":true}]$q$::jsonb, $q$5$q$, $q$Multiply $125 \times 4 = 500$, then place two decimal digits: $12.5 \times 0.4 = 5.00 = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('00c0fa6a-94e1-5db4-84b1-6051328b1192',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'hard',
   $q$A store sells apples for 0.75 dollars each. Dana buys 4 apples and pays with a 5 dollar bill. How much change should she get?$q$, $q$[{"text":"2.00","is_correct":true},{"text":"3.00","is_correct":false,"misconception_token":"gave-total-cost-not-change"},{"text":"8.00","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"4.25","is_correct":false,"misconception_token":"subtracted-one-item-only"}]$q$::jsonb, $q$2.00$q$, $q$The apples cost $4 \times 0.75 = 3.00$, so the change is $5 - 3.00 = 2.00$ dollars.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('856666d7-07c8-5d1f-a900-d0af1d9396b7',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'hard',
   $q$A rope 7.5 meters long is cut into 6 equal pieces. How long is each piece?$q$, $q$[{"text":"45","is_correct":false,"misconception_token":"multiplied-instead-of-divided"},{"text":"12.5","is_correct":false,"misconception_token":"misplaced-decimal"},{"text":"1.25","is_correct":true},{"text":"1.5","is_correct":false,"misconception_token":"used-wrong-divisor"}]$q$::jsonb, $q$1.25$q$, $q$Divide the length by the number of pieces: $7.5 \div 6 = 1.25$ meters each.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d9f63695-469b-5428-a170-22a0db254c26',
   null,
   (select id from public.skills where slug = 'decimal-operations'),
   'problem-solving-data-analysis', 'hard',
   $q$Liam has 20 dollars. He buys a book for 8.75 dollars and a pen for 2.40 dollars. How much money does he have left?$q$, $q$[{"text":"8.85","is_correct":true},{"text":"31.15","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"8.95","is_correct":false,"misconception_token":"addition-error-in-subtotal"},{"text":"11.15","is_correct":false,"misconception_token":"gave-total-spent-not-remaining"}]$q$::jsonb, $q$8.85$q$, $q$He spends $8.75 + 2.40 = 11.15$, so he has $20 - 11.15 = 8.85$ dollars left.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- multiply-divide-whole-5 (Multiply & Divide Whole Numbers, grade 5, CCSS.MATH.CONTENT.5.NBT.B.5) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('986f967b-9ec5-59de-a4db-e58340502b30',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $23 \times 14$?$q$, $q$[{"text":"312","is_correct":false,"misconception_token":"carry-error"},{"text":"322","is_correct":true},{"text":"92","is_correct":false,"misconception_token":"multiplied-only-by-ones"},{"text":"230","is_correct":false,"misconception_token":"multiplied-only-by-tens"}]$q$::jsonb, $q$322$q$, $q$$23 \times 14 = (23 \times 10) + (23 \times 4) = 230 + 92 = 322$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e8f60c57-b588-5f1a-b60a-5a2b6f0b88bf',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $246 \times 3$?$q$, $q$[{"text":"738","is_correct":true},{"text":"249","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"628","is_correct":false,"misconception_token":"dropped-all-carries"},{"text":"7380","is_correct":false,"misconception_token":"appended-extra-zero"}]$q$::jsonb, $q$738$q$, $q$$246 \times 3$: ones $6 \times 3 = 18$ (write 8, carry 1), tens $4 \times 3 = 12 + 1 = 13$ (write 3, carry 1), hundreds $2 \times 3 = 6 + 1 = 7$, giving 738.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7179f144-7d51-5560-9bf9-8a3ad528a1c2',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $84 \div 12$?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"off-by-one-high"},{"text":"7","is_correct":true},{"text":"72","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"6","is_correct":false,"misconception_token":"off-by-one-low"}]$q$::jsonb, $q$7$q$, $q$$12 \times 7 = 84$, so $84 \div 12 = 7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('576c4e71-ab3a-594e-823f-e1c6c7a38cc4',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $120 \times 30$?$q$, $q$[{"text":"3600","is_correct":true},{"text":"360","is_correct":false,"misconception_token":"dropped-a-zero"},{"text":"36000","is_correct":false,"misconception_token":"added-extra-zero"},{"text":"150","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, $q$3600$q$, $q$$12 \times 3 = 36$, then attach the two zeros from 120 and 30: $120 \times 30 = 3600$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bebe1251-bc33-5c7e-bbff-3ec8b8641051',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $50 \div 15$? Give the quotient and remainder.$q$, $q$[{"text":"3 R0","is_correct":false,"misconception_token":"ignored-remainder"},{"text":"5 R3","is_correct":false,"misconception_token":"swapped-quotient-and-remainder"},{"text":"2 R20","is_correct":false,"misconception_token":"remainder-larger-than-divisor"},{"text":"3 R5","is_correct":true}]$q$::jsonb, $q$3 R5$q$, $q$$15 \times 3 = 45$ and $50 - 45 = 5$, and $5 < 15$, so $50 \div 15 = 3$ remainder $5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2de5e53b-2432-53d6-926e-123c9ac0c38e',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $45 \times 12$?$q$, $q$[{"text":"490","is_correct":false,"misconception_token":"missing-partial-product"},{"text":"450","is_correct":false,"misconception_token":"multiplied-only-by-tens"},{"text":"90","is_correct":false,"misconception_token":"multiplied-only-by-ones"},{"text":"540","is_correct":true}]$q$::jsonb, $q$540$q$, $q$$45 \times 12 = (45 \times 10) + (45 \times 2) = 450 + 90 = 540$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ee17d0ab-5e8b-5d15-8052-bee31b6bff1c',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'easy',
   $q$A theater has 18 rows with 24 seats in each row. How many seats are there in all?$q$, $q$[{"text":"360","is_correct":false,"misconception_token":"multiplied-only-by-tens"},{"text":"42","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"432","is_correct":true},{"text":"72","is_correct":false,"misconception_token":"multiplied-only-by-ones"}]$q$::jsonb, $q$432$q$, $q$$18 \times 24 = (18 \times 20) + (18 \times 4) = 360 + 72 = 432$ seats.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('518b845d-73b1-5ad3-8e78-85f27fe1e1e8',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $144 \div 12$?$q$, $q$[{"text":"132","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"11","is_correct":false,"misconception_token":"off-by-one-low"},{"text":"12","is_correct":true},{"text":"13","is_correct":false,"misconception_token":"off-by-one-high"}]$q$::jsonb, $q$12$q$, $q$$12 \times 12 = 144$, so $144 \div 12 = 12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('18f59d59-84f6-5aa3-93df-4f7232cb6bcf',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $326 \times 14$?$q$, $q$[{"text":"4564","is_correct":true},{"text":"1304","is_correct":false,"misconception_token":"multiplied-only-by-ones"},{"text":"1630","is_correct":false,"misconception_token":"did-not-shift-partial-product"},{"text":"3260","is_correct":false,"misconception_token":"multiplied-only-by-tens"}]$q$::jsonb, $q$4564$q$, $q$$326 \times 14 = (326 \times 10) + (326 \times 4) = 3260 + 1304 = 4564$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b4743e71-a89e-5d12-8381-3684ede741c4',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $408 \times 25$?$q$, $q$[{"text":"2040","is_correct":false,"misconception_token":"multiplied-only-by-ones"},{"text":"8160","is_correct":false,"misconception_token":"multiplied-only-by-tens"},{"text":"10200","is_correct":true},{"text":"10000","is_correct":false,"misconception_token":"ignored-ones-digit"}]$q$::jsonb, $q$10200$q$, $q$$408 \times 25 = (400 \times 25) + (8 \times 25) = 10000 + 200 = 10200$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7fde300d-4675-51aa-bcc4-f106bf14fe56',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $1348 \div 24$? Give the quotient and remainder.$q$, $q$[{"text":"55 R28","is_correct":false,"misconception_token":"remainder-larger-than-divisor"},{"text":"56 R0","is_correct":false,"misconception_token":"ignored-remainder"},{"text":"56 R4","is_correct":true},{"text":"56 R8","is_correct":false,"misconception_token":"subtraction-error"}]$q$::jsonb, $q$56 R4$q$, $q$$24 \times 56 = 1344$ and $1348 - 1344 = 4$, and $4 < 24$, so $1348 \div 24 = 56$ remainder $4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5db03587-1f3a-5e4b-bd24-2085a3d75947',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'medium',
   $q$A factory produces 156 toys each hour. How many toys does it produce in 24 hours?$q$, $q$[{"text":"624","is_correct":false,"misconception_token":"multiplied-only-by-ones"},{"text":"180","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"3120","is_correct":false,"misconception_token":"multiplied-only-by-tens"},{"text":"3744","is_correct":true}]$q$::jsonb, $q$3744$q$, $q$$156 \times 24 = (156 \times 20) + (156 \times 4) = 3120 + 624 = 3744$ toys.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('810c7eca-3162-59f9-a9db-16cc0919fa85',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'medium',
   $q$A school has 1250 students to seat in buses that hold 48 students each. How many buses are completely full, and how many students are left over?$q$, $q$[{"text":"26 full, 0 left over","is_correct":false,"misconception_token":"ignored-remainder"},{"text":"26 full, 2 left over","is_correct":true},{"text":"26 full, 12 left over","is_correct":false,"misconception_token":"subtraction-error"},{"text":"25 full, 50 left over","is_correct":false,"misconception_token":"remainder-larger-than-divisor"}]$q$::jsonb, $q$26 full, 2 left over$q$, $q$$48 \times 26 = 1248$ and $1250 - 1248 = 2$, so 26 buses are full with 2 students left over.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1ffb4b95-dad1-5e1f-8fe3-f6ca326adcb4',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $234 \times 56$?$q$, $q$[{"text":"2574","is_correct":false,"misconception_token":"did-not-shift-partial-product"},{"text":"1404","is_correct":false,"misconception_token":"multiplied-only-by-ones"},{"text":"13104","is_correct":true},{"text":"11700","is_correct":false,"misconception_token":"multiplied-only-by-tens"}]$q$::jsonb, $q$13104$q$, $q$$234 \times 56 = (234 \times 50) + (234 \times 6) = 11700 + 1404 = 13104$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c263763e-f26f-5510-8cc2-49d722d84272',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $3600 \div 45$?$q$, $q$[{"text":"81","is_correct":false,"misconception_token":"off-by-one-high"},{"text":"8","is_correct":false,"misconception_token":"dropped-a-zero"},{"text":"800","is_correct":false,"misconception_token":"added-extra-zero"},{"text":"80","is_correct":true}]$q$::jsonb, $q$80$q$, $q$$45 \times 80 = 3600$, so $3600 \div 45 = 80$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6cc4caee-ac5b-5672-92e6-7c0aa5570e83',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'medium',
   $q$A store received a shipment of 2016 water bottles packed into cases of 36 bottles each. How many cases are there?$q$, $q$[{"text":"56","is_correct":true},{"text":"57","is_correct":false,"misconception_token":"off-by-one-high"},{"text":"560","is_correct":false,"misconception_token":"added-extra-zero"},{"text":"55 R36","is_correct":false,"misconception_token":"remainder-larger-than-divisor"}]$q$::jsonb, $q$56$q$, $q$$36 \times 56 = 2016$ exactly, so there are 56 cases with no bottles left over.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('98e2e2b6-dc47-581f-8590-8acb4d172c24',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'hard',
   $q$A warehouse has 27 shelves. Each shelf holds 38 boxes, and each box contains 15 cans. How many cans are in the warehouse?$q$, $q$[{"text":"80","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"15290","is_correct":false,"misconception_token":"multiplication-error"},{"text":"1026","is_correct":false,"misconception_token":"stopped-at-boxes"},{"text":"15390","is_correct":true}]$q$::jsonb, $q$15390$q$, $q$Boxes $= 27 \times 38 = 1026$; cans $= 1026 \times 15 = 15390$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1666422a-7b2d-5e02-9084-b34bcfb8f45d',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'hard',
   $q$A charity collected 5000 dollars to share equally among 32 families. How many whole dollars does each family receive, and how many dollars are left over?$q$, $q$[{"text":"156 dollars each, 8 dollars left over","is_correct":true},{"text":"156 dollars each, 0 dollars left over","is_correct":false,"misconception_token":"ignored-remainder"},{"text":"156 dollars each, 18 dollars left over","is_correct":false,"misconception_token":"subtraction-error"},{"text":"155 dollars each, 40 dollars left over","is_correct":false,"misconception_token":"remainder-larger-than-divisor"}]$q$::jsonb, $q$156 dollars each, 8 dollars left over$q$, $q$$32 \times 156 = 4992$ and $5000 - 4992 = 8$, so each family gets 156 dollars with 8 dollars left over.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6e885613-5911-5af7-a9cf-45702c77db78',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'hard',
   $q$A school orders 24 boxes of pencils. Each box has 144 pencils. The pencils are shared equally among 18 classrooms. How many pencils does each classroom get?$q$, $q$[{"text":"3456","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"191","is_correct":false,"misconception_token":"off-by-one-low"},{"text":"192","is_correct":true},{"text":"200","is_correct":false,"misconception_token":"rounded-before-dividing"}]$q$::jsonb, $q$192$q$, $q$Total pencils $= 24 \times 144 = 3456$; then $3456 \div 18 = 192$ pencils per classroom.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6ce358bb-c1e1-589b-8477-e23e15230427',
   null,
   (select id from public.skills where slug = 'multiply-divide-whole-5'),
   'problem-solving-data-analysis', 'hard',
   $q$A publisher prints 8700 pages that must be bound into books. Each book uses 96 pages. How many complete books can be made, and how many pages are left over?$q$, $q$[{"text":"90 books, 60 pages left over","is_correct":true},{"text":"89 books, 156 pages left over","is_correct":false,"misconception_token":"remainder-larger-than-divisor"},{"text":"90 books, 70 pages left over","is_correct":false,"misconception_token":"subtraction-error"},{"text":"90 books, 0 pages left over","is_correct":false,"misconception_token":"ignored-remainder"}]$q$::jsonb, $q$90 books, 60 pages left over$q$, $q$$96 \times 90 = 8640$ and $8700 - 8640 = 60$, and $60 < 96$, so 90 complete books can be made with 60 pages left over.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- add-subtract-fractions-unlike (Add & Subtract Fractions, grade 5, CCSS.MATH.CONTENT.5.NF.A.1) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3b11a333-6e45-503f-900e-83df3a7435e1',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{2} + \frac{1}{4}$?$q$, $q$[{"text":"$\\frac{5}{8}$","is_correct":false,"misconception_token":"only-scaled-one-fraction"},{"text":"$\\frac{3}{4}$","is_correct":true},{"text":"$\\frac{2}{6}$","is_correct":false,"misconception_token":"added-numerators-and-denominators"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"numerator-not-scaled"}]$q$::jsonb, $q$$\frac{3}{4}$$q$, $q$Rewrite $\frac{1}{2}$ as $\frac{2}{4}$, then $\frac{2}{4} + \frac{1}{4} = \frac{3}{4}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a95e3745-56b2-550e-aefa-f6d3a969f863',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{2}{3} - \frac{1}{6}$?$q$, $q$[{"text":"$\\frac{1}{2}$","is_correct":true},{"text":"$\\frac{5}{6}$","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"$\\frac{1}{6}$","is_correct":false,"misconception_token":"forgot-to-convert-first-fraction"},{"text":"$\\frac{1}{3}$","is_correct":false,"misconception_token":"subtracted-across"}]$q$::jsonb, $q$$\frac{1}{2}$$q$, $q$Rewrite $\frac{2}{3}$ as $\frac{4}{6}$, then $\frac{4}{6} - \frac{1}{6} = \frac{3}{6} = \frac{1}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('df960312-96de-504f-8380-31962eb0356d',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{3}{4} + \frac{1}{8}$?$q$, $q$[{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"numerator-not-scaled"},{"text":"$\\frac{7}{8}$","is_correct":true},{"text":"$\\frac{5}{8}$","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"$\\frac{4}{12}$","is_correct":false,"misconception_token":"added-numerators-and-denominators"}]$q$::jsonb, $q$$\frac{7}{8}$$q$, $q$Rewrite $\frac{3}{4}$ as $\frac{6}{8}$, then $\frac{6}{8} + \frac{1}{8} = \frac{7}{8}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6f8f5fc6-2b6f-5594-9b8e-a1d4959dd808',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{5}{6} - \frac{1}{3}$?$q$, $q$[{"text":"$\\frac{1}{2}$","is_correct":true},{"text":"$\\frac{2}{3}$","is_correct":false,"misconception_token":"forgot-to-convert-second-fraction"},{"text":"$\\frac{7}{6}$","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"$\\frac{4}{3}$","is_correct":false,"misconception_token":"subtracted-across"}]$q$::jsonb, $q$$\frac{1}{2}$$q$, $q$Rewrite $\frac{1}{3}$ as $\frac{2}{6}$, then $\frac{5}{6} - \frac{2}{6} = \frac{3}{6} = \frac{1}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3401bf32-549a-51a9-8871-5775b48abe0f',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{3} + \frac{1}{6}$?$q$, $q$[{"text":"$\\frac{2}{9}$","is_correct":false,"misconception_token":"added-numerators-and-denominators"},{"text":"$\\frac{1}{6}$","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"$\\frac{1}{3}$","is_correct":false,"misconception_token":"numerator-not-scaled"},{"text":"$\\frac{1}{2}$","is_correct":true}]$q$::jsonb, $q$$\frac{1}{2}$$q$, $q$Rewrite $\frac{1}{3}$ as $\frac{2}{6}$, then $\frac{2}{6} + \frac{1}{6} = \frac{3}{6} = \frac{1}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6e3bba76-a6bf-5b96-885d-dfcf2cff6ecc',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{4}{5} - \frac{3}{10}$?$q$, $q$[{"text":"$\\frac{1}{5}$","is_correct":false,"misconception_token":"subtracted-across"},{"text":"$\\frac{11}{10}$","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"$\\frac{1}{10}$","is_correct":false,"misconception_token":"forgot-to-convert-first-fraction"},{"text":"$\\frac{1}{2}$","is_correct":true}]$q$::jsonb, $q$$\frac{1}{2}$$q$, $q$Rewrite $\frac{4}{5}$ as $\frac{8}{10}$, then $\frac{8}{10} - \frac{3}{10} = \frac{5}{10} = \frac{1}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('39253c08-19fd-5e40-b23b-250baf5978c1',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{4} + \frac{2}{3}$?$q$, $q$[{"text":"$\\frac{1}{4}$","is_correct":false,"misconception_token":"numerators-not-scaled"},{"text":"$\\frac{3}{7}$","is_correct":false,"misconception_token":"added-numerators-and-denominators"},{"text":"$\\frac{11}{12}$","is_correct":true},{"text":"$\\frac{5}{12}$","is_correct":false,"misconception_token":"subtracted-instead-of-added"}]$q$::jsonb, $q$$\frac{11}{12}$$q$, $q$Rewrite as $\frac{3}{12} + \frac{8}{12} = \frac{11}{12}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7b66e540-ed8a-545d-9242-0597822a823b',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{7}{8} - \frac{1}{2}$?$q$, $q$[{"text":"$1$","is_correct":false,"misconception_token":"subtracted-across"},{"text":"$\\frac{3}{4}$","is_correct":false,"misconception_token":"forgot-to-convert-second-fraction"},{"text":"$\\frac{3}{8}$","is_correct":true},{"text":"$\\frac{11}{8}$","is_correct":false,"misconception_token":"added-instead-of-subtracted"}]$q$::jsonb, $q$$\frac{3}{8}$$q$, $q$Rewrite $\frac{1}{2}$ as $\frac{4}{8}$, then $\frac{7}{8} - \frac{4}{8} = \frac{3}{8}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b58b1af8-52ba-5ecb-983b-ebf489d307d0',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'medium',
   $q$A recipe needs $\frac{2}{3}$ cup of white sugar and $\frac{1}{4}$ cup of brown sugar. How much sugar does the recipe need in all?$q$, $q$[{"text":"$\\frac{11}{12}$ cup","is_correct":true},{"text":"$\\frac{3}{7}$ cup","is_correct":false,"misconception_token":"added-numerators-and-denominators"},{"text":"$\\frac{5}{12}$ cup","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"$\\frac{3}{4}$ cup","is_correct":false,"misconception_token":"only-scaled-one-fraction"}]$q$::jsonb, $q$$\frac{11}{12}$ cup$q$, $q$Rewrite as $\frac{8}{12} + \frac{3}{12} = \frac{11}{12}$ cup.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('04027714-800c-5536-90ec-9d7e62a3c654',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'medium',
   $q$Maria ran $\frac{3}{4}$ mile and then walked $\frac{5}{8}$ mile. How far did she travel in all?$q$, $q$[{"text":"$\\frac{2}{3}$ mile","is_correct":false,"misconception_token":"added-numerators-and-denominators"},{"text":"$1$ mile","is_correct":false,"misconception_token":"forgot-to-convert-first-fraction"},{"text":"$1\\frac{3}{8}$ miles","is_correct":true},{"text":"$\\frac{1}{8}$ mile","is_correct":false,"misconception_token":"subtracted-instead-of-added"}]$q$::jsonb, $q$$1\frac{3}{8}$ miles$q$, $q$Rewrite $\frac{3}{4}$ as $\frac{6}{8}$, then $\frac{6}{8} + \frac{5}{8} = \frac{11}{8} = 1\frac{3}{8}$ miles.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d4c4a0da-e293-5e76-8656-fe5847936dcf',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $1\frac{1}{2} + 2\frac{1}{3}$?$q$, $q$[{"text":"$3\\frac{1}{6}$","is_correct":false,"misconception_token":"subtracted-fraction-parts"},{"text":"$3\\frac{2}{5}$","is_correct":false,"misconception_token":"added-fraction-parts-across"},{"text":"$3\\frac{5}{6}$","is_correct":true},{"text":"$3\\frac{1}{3}$","is_correct":false,"misconception_token":"numerators-not-scaled"}]$q$::jsonb, $q$$3\frac{5}{6}$$q$, $q$Add wholes $1 + 2 = 3$; add fractions $\frac{3}{6} + \frac{2}{6} = \frac{5}{6}$, giving $3\frac{5}{6}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a6282baa-6fc5-5e2a-83a3-f72656fb1dac',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $3\frac{3}{4} - 1\frac{1}{2}$?$q$, $q$[{"text":"$3\\frac{1}{4}$","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"$2\\frac{1}{2}$","is_correct":false,"misconception_token":"forgot-to-convert-fraction-part"},{"text":"$2\\frac{3}{4}$","is_correct":false,"misconception_token":"ignored-fraction-subtraction"},{"text":"$2\\frac{1}{4}$","is_correct":true}]$q$::jsonb, $q$$2\frac{1}{4}$$q$, $q$Rewrite $1\frac{1}{2}$ as $1\frac{2}{4}$; subtract wholes $3 - 1 = 2$ and fractions $\frac{3}{4} - \frac{2}{4} = \frac{1}{4}$, giving $2\frac{1}{4}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6676ea91-8ed4-531f-b8c2-c653914bd880',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $4\frac{1}{3} - 1\frac{5}{6}$?$q$, $q$[{"text":"$3\\frac{1}{2}$","is_correct":false,"misconception_token":"subtracted-fraction-backwards"},{"text":"$2\\frac{1}{2}$","is_correct":true},{"text":"$6\\frac{1}{6}$","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"$2\\frac{1}{3}$","is_correct":false,"misconception_token":"forgot-to-convert-first-fraction"}]$q$::jsonb, $q$$2\frac{1}{2}$$q$, $q$Rewrite $4\frac{1}{3}$ as $4\frac{2}{6} = 3\frac{8}{6}$, then $3\frac{8}{6} - 1\frac{5}{6} = 2\frac{3}{6} = 2\frac{1}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('55b15f80-c2e8-58b6-be8b-e539e7a39778',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'medium',
   $q$A board is $5\frac{1}{2}$ feet long. A carpenter cuts off $2\frac{3}{4}$ feet. How long is the remaining piece?$q$, $q$[{"text":"$8\\frac{1}{4}$ feet","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"$3\\frac{1}{4}$ feet","is_correct":false,"misconception_token":"subtracted-fraction-backwards"},{"text":"$2\\frac{3}{4}$ feet","is_correct":true},{"text":"$2\\frac{1}{2}$ feet","is_correct":false,"misconception_token":"forgot-to-convert-fraction-part"}]$q$::jsonb, $q$$2\frac{3}{4}$ feet$q$, $q$Rewrite $5\frac{1}{2}$ as $5\frac{2}{4} = 4\frac{6}{4}$, then $4\frac{6}{4} - 2\frac{3}{4} = 2\frac{3}{4}$ feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('193e9482-85ec-50ad-83e2-8ea442215606',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'medium',
   $q$Jack had $\frac{7}{8}$ of a pizza. He ate $\frac{1}{3}$ of a pizza. How much of the pizza is left?$q$, $q$[{"text":"$\\frac{29}{24}$","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"$\\frac{6}{5}$","is_correct":false,"misconception_token":"subtracted-across"},{"text":"$\\frac{3}{4}$","is_correct":false,"misconception_token":"forgot-to-convert-second-fraction"},{"text":"$\\frac{13}{24}$","is_correct":true}]$q$::jsonb, $q$$\frac{13}{24}$$q$, $q$Rewrite as $\frac{21}{24} - \frac{8}{24} = \frac{13}{24}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4c50147b-fb86-5e04-8b4f-6fe013c7c920',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{5}{6} + \frac{3}{4}$?$q$, $q$[{"text":"$1\\frac{7}{12}$","is_correct":true},{"text":"$1\\frac{1}{12}$","is_correct":false,"misconception_token":"only-scaled-one-fraction"},{"text":"$\\frac{1}{12}$","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"$\\frac{4}{5}$","is_correct":false,"misconception_token":"added-numerators-and-denominators"}]$q$::jsonb, $q$$1\frac{7}{12}$$q$, $q$Rewrite as $\frac{10}{12} + \frac{9}{12} = \frac{19}{12} = 1\frac{7}{12}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c415eef1-14e7-50e9-b48f-457db1f02e4b',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'hard',
   $q$What is $\frac{1}{2} + \frac{2}{3} + \frac{3}{4}$?$q$, $q$[{"text":"$1\\frac{5}{12}$","is_correct":false,"misconception_token":"dropped-a-term"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"numerators-not-scaled"},{"text":"$\\frac{2}{3}$","is_correct":false,"misconception_token":"added-numerators-and-denominators"},{"text":"$1\\frac{11}{12}$","is_correct":true}]$q$::jsonb, $q$$1\frac{11}{12}$$q$, $q$Rewrite as $\frac{6}{12} + \frac{8}{12} + \frac{9}{12} = \frac{23}{12} = 1\frac{11}{12}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('97c3550e-7468-5fb8-871a-05742e8b674b',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'hard',
   $q$A runner ran $2\frac{1}{2}$ miles on Monday and $1\frac{5}{6}$ miles on Tuesday. How many miles did she run in all?$q$, $q$[{"text":"$4\\frac{1}{3}$ miles","is_correct":true},{"text":"$3\\frac{3}{4}$ miles","is_correct":false,"misconception_token":"added-fraction-parts-across"},{"text":"$\\frac{2}{3}$ mile","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"$4$ miles","is_correct":false,"misconception_token":"forgot-to-convert-first-fraction"}]$q$::jsonb, $q$$4\frac{1}{3}$ miles$q$, $q$Rewrite $2\frac{1}{2}$ as $2\frac{3}{6}$; then $2\frac{3}{6} + 1\frac{5}{6} = 3\frac{8}{6} = 4\frac{2}{6} = 4\frac{1}{3}$ miles.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('850edc03-6a0b-51e7-ab82-68cf9284b368',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'hard',
   $q$Sarah had $6\frac{1}{4}$ yards of ribbon. She used $2\frac{2}{3}$ yards. How many yards of ribbon are left?$q$, $q$[{"text":"$4\\frac{5}{12}$ yards","is_correct":false,"misconception_token":"subtracted-fraction-backwards"},{"text":"$8\\frac{11}{12}$ yards","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"$3\\frac{7}{12}$ yards","is_correct":true},{"text":"$3\\frac{5}{12}$ yards","is_correct":false,"misconception_token":"borrowed-wrong-amount"}]$q$::jsonb, $q$$3\frac{7}{12}$ yards$q$, $q$Rewrite as $6\frac{3}{12} - 2\frac{8}{12}$; regroup $6\frac{3}{12} = 5\frac{15}{12}$, then $5\frac{15}{12} - 2\frac{8}{12} = 3\frac{7}{12}$ yards.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7208ecaf-9cbc-5c28-a8ae-6a1bdf594e97',
   null,
   (select id from public.skills where slug = 'add-subtract-fractions-unlike'),
   'problem-solving-data-analysis', 'hard',
   $q$A tank is $\frac{7}{8}$ full. First $\frac{1}{3}$ of a tank is used, then $\frac{1}{4}$ of a tank is added. How full is the tank now?$q$, $q$[{"text":"$\\frac{19}{24}$","is_correct":true},{"text":"$1\\frac{11}{24}$","is_correct":false,"misconception_token":"added-all-terms"},{"text":"$\\frac{7}{12}$","is_correct":false,"misconception_token":"last-fraction-not-scaled"},{"text":"$\\frac{7}{24}$","is_correct":false,"misconception_token":"subtracted-last-term-instead-of-adding"}]$q$::jsonb, $q$$\frac{19}{24}$$q$, $q$Rewrite as $\frac{21}{24} - \frac{8}{24} + \frac{6}{24} = \frac{19}{24}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- multiply-divide-fractions (Multiply & Divide Fractions, grade 5, CCSS.MATH.CONTENT.5.NF.B.4) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1e5a88c5-b542-5dd7-a4c0-903eedf5006f',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{2}\times\frac{1}{3}$?$q$, $q$[{"text":"$\\frac{2}{6}$","is_correct":false,"misconception_token":"added-numerators"},{"text":"$\\frac{1}{6}$","is_correct":true},{"text":"$\\frac{2}{5}$","is_correct":false,"misconception_token":"added-across"},{"text":"$\\frac{1}{5}$","is_correct":false,"misconception_token":"added-denominators"}]$q$::jsonb, $q$$\frac{1}{6}$$q$, $q$Multiply straight across: $\frac{1\times 1}{2\times 3}=\frac{1}{6}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d1d53d75-4f6e-57b9-b970-74da4e79dfe7',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{3}\times\frac{1}{5}$?$q$, $q$[{"text":"$\\frac{1}{15}$","is_correct":true},{"text":"$\\frac{1}{8}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$\\frac{2}{8}$","is_correct":false,"misconception_token":"added-across"},{"text":"$\\frac{2}{15}$","is_correct":false,"misconception_token":"added-numerators"}]$q$::jsonb, $q$$\frac{1}{15}$$q$, $q$Multiply straight across: $\frac{1\times 1}{3\times 5}=\frac{1}{15}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f851f4e3-978c-5bf3-ad4d-8af91cc05a65',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{2}{3}\times\frac{1}{5}$?$q$, $q$[{"text":"$\\frac{2}{8}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$\\frac{2}{15}$","is_correct":true},{"text":"$\\frac{3}{15}$","is_correct":false,"misconception_token":"added-numerators"},{"text":"$\\frac{3}{8}$","is_correct":false,"misconception_token":"added-across"}]$q$::jsonb, $q$$\frac{2}{15}$$q$, $q$Multiply straight across: $\frac{2\times 1}{3\times 5}=\frac{2}{15}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ba917c98-c3c9-50c9-9e96-39f73068e474',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{3}{4}\times\frac{1}{2}$?$q$, $q$[{"text":"$\\frac{3}{8}$","is_correct":true},{"text":"$\\frac{4}{6}$","is_correct":false,"misconception_token":"added-across"},{"text":"$\\frac{3}{6}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$\\frac{6}{4}$","is_correct":false,"misconception_token":"inverted-second-factor"}]$q$::jsonb, $q$$\frac{3}{8}$$q$, $q$Multiply straight across: $\frac{3\times 1}{4\times 2}=\frac{3}{8}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('66ef3e54-0a3e-5d08-8cc9-3ec2d817a95b',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{2}{7}\times\frac{3}{5}$?$q$, $q$[{"text":"$\\frac{5}{12}$","is_correct":false,"misconception_token":"added-across"},{"text":"$\\frac{5}{35}$","is_correct":false,"misconception_token":"added-numerators"},{"text":"$\\frac{6}{12}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$\\frac{6}{35}$","is_correct":true}]$q$::jsonb, $q$$\frac{6}{35}$$q$, $q$Multiply straight across: $\frac{2\times 3}{7\times 5}=\frac{6}{35}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1c8e335c-d01c-5f7f-a384-352a05febcf6',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{4}{5}\times\frac{2}{3}$?$q$, $q$[{"text":"$\\frac{6}{15}$","is_correct":false,"misconception_token":"added-numerators"},{"text":"$\\frac{8}{8}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$\\frac{6}{8}$","is_correct":false,"misconception_token":"added-across"},{"text":"$\\frac{8}{15}$","is_correct":true}]$q$::jsonb, $q$$\frac{8}{15}$$q$, $q$Multiply straight across: $\frac{4\times 2}{5\times 3}=\frac{8}{15}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dbc1030d-76c2-55cb-be31-58bcc4e371ef',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{4}\times 8$?$q$, $q$[{"text":"$\\frac{1}{32}$","is_correct":false,"misconception_token":"multiplied-into-denominator"},{"text":"$32$","is_correct":false,"misconception_token":"multiplied-whole-by-denominator"},{"text":"$2$","is_correct":true},{"text":"$12$","is_correct":false,"misconception_token":"added-whole-and-denominator"}]$q$::jsonb, $q$$2$$q$, $q$Write $8$ as $\frac{8}{1}$: $\frac{1\times 8}{4\times 1}=\frac{8}{4}=2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('11f698ab-84af-5200-89ed-3c38a76bf3ee',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $6\times\frac{1}{2}$?$q$, $q$[{"text":"$8$","is_correct":false,"misconception_token":"added-whole-and-denominator"},{"text":"$12$","is_correct":false,"misconception_token":"multiplied-whole-by-denominator"},{"text":"$3$","is_correct":true},{"text":"$\\frac{1}{12}$","is_correct":false,"misconception_token":"multiplied-into-denominator"}]$q$::jsonb, $q$$3$$q$, $q$Write $6$ as $\frac{6}{1}$: $\frac{6\times 1}{1\times 2}=\frac{6}{2}=3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5a617e0a-b804-5efe-8b58-d5ef4ab1f332',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{2}{3}\times\frac{3}{4}$ in simplest form?$q$, $q$[{"text":"$\\frac{1}{2}$","is_correct":true},{"text":"$\\frac{5}{7}$","is_correct":false,"misconception_token":"added-across"},{"text":"$\\frac{5}{12}$","is_correct":false,"misconception_token":"added-numerators"},{"text":"$\\frac{6}{7}$","is_correct":false,"misconception_token":"added-denominators"}]$q$::jsonb, $q$$\frac{1}{2}$$q$, $q$Multiply across: $\frac{2\times 3}{3\times 4}=\frac{6}{12}$, which simplifies to $\frac{1}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f6abc008-9708-5847-b0c7-8dceba4c401d',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{3}{4}\times\frac{8}{9}$ in simplest form?$q$, $q$[{"text":"$\\frac{11}{13}$","is_correct":false,"misconception_token":"added-across"},{"text":"$\\frac{24}{13}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$\\frac{2}{3}$","is_correct":true},{"text":"$\\frac{11}{36}$","is_correct":false,"misconception_token":"added-numerators"}]$q$::jsonb, $q$$\frac{2}{3}$$q$, $q$Multiply across: $\frac{3\times 8}{4\times 9}=\frac{24}{36}$, which simplifies to $\frac{2}{3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('04b889a1-391d-5d28-9c75-21d513e12fb9',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $12\times\frac{2}{3}$?$q$, $q$[{"text":"$4$","is_correct":false,"misconception_token":"forgot-to-multiply-by-numerator"},{"text":"$24$","is_correct":false,"misconception_token":"forgot-to-divide-by-denominator"},{"text":"$8$","is_correct":true},{"text":"$18$","is_correct":false,"misconception_token":"inverted-the-fraction"}]$q$::jsonb, $q$$8$$q$, $q$Multiply then divide: $\frac{12\times 2}{3}=\frac{24}{3}=8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('70706341-fc99-50e0-8fbf-799f52bc45e9',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$A rectangle is $\frac{3}{4}$ meter long and $\frac{2}{5}$ meter wide. What is its area in square meters?$q$, $q$[{"text":"$\\frac{6}{9}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$\\frac{5}{9}$","is_correct":false,"misconception_token":"added-across"},{"text":"$\\frac{5}{20}$","is_correct":false,"misconception_token":"added-numerators"},{"text":"$\\frac{3}{10}$","is_correct":true}]$q$::jsonb, $q$$\frac{3}{10}$$q$, $q$Area is length times width: $\frac{3}{4}\times\frac{2}{5}=\frac{6}{20}=\frac{3}{10}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('227d1596-7fbf-5434-9950-e7159defba50',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$Maria has $\frac{1}{2}$ of a pizza and shares it equally among 3 friends. What fraction of the whole pizza does each friend get?$q$, $q$[{"text":"$\\frac{3}{2}$","is_correct":false,"misconception_token":"multiplied-instead-of-divided"},{"text":"$\\frac{1}{6}$","is_correct":true},{"text":"$\\frac{2}{3}$","is_correct":false,"misconception_token":"inverted-wrong-number"},{"text":"$\\frac{1}{5}$","is_correct":false,"misconception_token":"added-whole-to-denominator"}]$q$::jsonb, $q$$\frac{1}{6}$$q$, $q$Divide the half into 3 equal parts: $\frac{1}{2}\div 3=\frac{1}{2\times 3}=\frac{1}{6}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f4444c6f-1c49-533c-b9b0-d48ff3ba564e',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$How many $\frac{1}{4}$-cup servings are in 3 cups?$q$, $q$[{"text":"$\\frac{1}{12}$","is_correct":false,"misconception_token":"inverted-the-whole-number"},{"text":"$\\frac{3}{4}$","is_correct":false,"misconception_token":"multiplied-instead-of-divided"},{"text":"$12$","is_correct":true},{"text":"$7$","is_correct":false,"misconception_token":"added-whole-and-denominator"}]$q$::jsonb, $q$$12$$q$, $q$Divide by the serving size: $3\div\frac{1}{4}=3\times 4=12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8eefc1e0-be39-51bd-bf02-733ded7663f1',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{5}{6}\times\frac{3}{10}$ in simplest form?$q$, $q$[{"text":"$\\frac{8}{60}$","is_correct":false,"misconception_token":"added-numerators"},{"text":"$\\frac{8}{16}$","is_correct":false,"misconception_token":"added-across"},{"text":"$\\frac{15}{16}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$\\frac{1}{4}$","is_correct":true}]$q$::jsonb, $q$$\frac{1}{4}$$q$, $q$Multiply across: $\frac{5\times 3}{6\times 10}=\frac{15}{60}$, which simplifies to $\frac{1}{4}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4cd000cc-fbfe-5d84-83f2-4c90d0996af2',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$A recipe needs $\frac{2}{3}$ cup of sugar for one batch. How much sugar is needed for 4 batches?$q$, $q$[{"text":"$2\\frac{2}{3}$","is_correct":true},{"text":"$\\frac{8}{12}$","is_correct":false,"misconception_token":"multiplied-numerator-and-denominator"},{"text":"$\\frac{1}{6}$","is_correct":false,"misconception_token":"multiplied-whole-into-denominator"},{"text":"$4\\frac{2}{3}$","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, $q$$2\frac{2}{3}$$q$, $q$Multiply: $\frac{2}{3}\times 4=\frac{8}{3}=2\frac{2}{3}$ cups.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2a55d37c-e0df-501c-adb6-0e0760f03436',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$In a class, $\frac{3}{5}$ of the students play a sport. Of those who play a sport, $\frac{2}{3}$ play soccer. What fraction of the whole class plays soccer?$q$, $q$[{"text":"$\\frac{6}{8}$","is_correct":false,"misconception_token":"added-denominators"},{"text":"$\\frac{5}{15}$","is_correct":false,"misconception_token":"added-numerators"},{"text":"$\\frac{5}{8}$","is_correct":false,"misconception_token":"added-across"},{"text":"$\\frac{2}{5}$","is_correct":true}]$q$::jsonb, $q$$\frac{2}{5}$$q$, $q$Take a fraction of a fraction: $\frac{3}{5}\times\frac{2}{3}=\frac{6}{15}=\frac{2}{5}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6e316b19-e8ea-5752-840d-d393f51a996d',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$A garden plot is $\frac{5}{6}$ meter long and $\frac{3}{4}$ meter wide. What is its area in square meters?$q$, $q$[{"text":"$\\frac{5}{8}$","is_correct":true},{"text":"$\\frac{8}{10}$","is_correct":false,"misconception_token":"added-across"},{"text":"$\\frac{8}{24}$","is_correct":false,"misconception_token":"added-numerators"},{"text":"$\\frac{15}{10}$","is_correct":false,"misconception_token":"added-denominators"}]$q$::jsonb, $q$$\frac{5}{8}$$q$, $q$Area is length times width: $\frac{5}{6}\times\frac{3}{4}=\frac{15}{24}=\frac{5}{8}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e2959ae8-309f-512e-978a-5bf18063bb0d',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$A ribbon is 5 meters long. How many pieces each $\frac{1}{3}$ meter long can be cut from it?$q$, $q$[{"text":"$\\frac{5}{3}$","is_correct":false,"misconception_token":"multiplied-instead-of-divided"},{"text":"$8$","is_correct":false,"misconception_token":"added-whole-and-denominator"},{"text":"$15$","is_correct":true},{"text":"$\\frac{1}{15}$","is_correct":false,"misconception_token":"inverted-the-whole-number"}]$q$::jsonb, $q$$15$$q$, $q$Divide by the piece length: $5\div\frac{1}{3}=5\times 3=15$ pieces.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d5e57592-4302-5669-bcf9-33bf2eeb21a7',
   null,
   (select id from public.skills where slug = 'multiply-divide-fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$Three friends equally share $\frac{1}{2}$ of a pan of brownies. Then each friend gives half of their share to a sibling. What fraction of the whole pan does each sibling get?$q$, $q$[{"text":"$\\frac{1}{12}$","is_correct":true},{"text":"$\\frac{1}{4}$","is_correct":false,"misconception_token":"ignored-the-three-friends"},{"text":"$\\frac{3}{4}$","is_correct":false,"misconception_token":"multiplied-instead-of-dividing"},{"text":"$\\frac{1}{6}$","is_correct":false,"misconception_token":"stopped-at-first-step"}]$q$::jsonb, $q$$\frac{1}{12}$$q$, $q$Each friend gets $\frac{1}{2}\div 3=\frac{1}{6}$; half of that is $\frac{1}{6}\times\frac{1}{2}=\frac{1}{12}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- coordinate-plane (Coordinate Plane, grade 5, CCSS.MATH.CONTENT.5.G.A.2) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cc22b303-98f2-5013-b4a3-74e4b33f44ae',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'easy',
   $q$A point is located 4 units to the right of the origin and 2 units up. What are its coordinates?$q$, $q$[{"text":"$(0, 2)$","is_correct":false,"misconception_token":"ignored-right-value"},{"text":"$(4, 2)$","is_correct":true},{"text":"$(2, 4)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(4, 0)$","is_correct":false,"misconception_token":"ignored-up-value"}]$q$::jsonb, $q$$(4, 2)$$q$, $q$The x-coordinate is the distance right (4) and the y-coordinate is the distance up (2), so the point is $(4, 2)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d7d30441-a1c3-5d1c-9faf-abc6475ea2b7',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'easy',
   $q$In the ordered pair $(6, 1)$, what is the x-coordinate?$q$, $q$[{"text":"6","is_correct":true},{"text":"7","is_correct":false,"misconception_token":"added-coordinates"},{"text":"1","is_correct":false,"misconception_token":"used-y-coordinate"},{"text":"5","is_correct":false,"misconception_token":"subtracted-coordinates"}]$q$::jsonb, $q$6$q$, $q$The x-coordinate is the first number in the ordered pair, so it is 6.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('98f4eccc-1d06-5748-b9de-03d59ac76ed9',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'easy',
   $q$In the ordered pair $(2, 9)$, how many units up from the x-axis is the point?$q$, $q$[{"text":"11","is_correct":false,"misconception_token":"added-coordinates"},{"text":"9","is_correct":true},{"text":"7","is_correct":false,"misconception_token":"subtracted-coordinates"},{"text":"2","is_correct":false,"misconception_token":"used-x-coordinate"}]$q$::jsonb, $q$9$q$, $q$The distance up is the y-coordinate, the second number, so the point is 9 units up.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9ac29234-d811-5112-886f-c07926368c50',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'easy',
   $q$Which ordered pair describes a point 5 units to the right of the origin and 0 units up?$q$, $q$[{"text":"$(5, 0)$","is_correct":true},{"text":"$(0, 5)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(5, 5)$","is_correct":false,"misconception_token":"duplicated-value"},{"text":"$(0, 0)$","is_correct":false,"misconception_token":"chose-origin"}]$q$::jsonb, $q$$(5, 0)$$q$, $q$Right is the x-value (5) and up is the y-value (0), so the point is $(5, 0)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('302aecc4-8b96-5771-920b-66d5514118b6',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'easy',
   $q$The first number in an ordered pair tells you the distance to move in which direction from the origin?$q$, $q$[{"text":"Up","is_correct":false,"misconception_token":"used-second-number-direction"},{"text":"Down","is_correct":false,"misconception_token":"moved-down"},{"text":"Left","is_correct":false,"misconception_token":"moved-left"},{"text":"Right","is_correct":true}]$q$::jsonb, $q$Right$q$, $q$The first number is the x-coordinate, which tells you how far to move right from the origin.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5caeb387-6125-5843-ab40-5b5eecb6f3f4',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'easy',
   $q$A point sits 7 units to the right of the origin and 7 units up. What are its coordinates?$q$, $q$[{"text":"$(14, 7)$","is_correct":false,"misconception_token":"added-coordinates"},{"text":"$(0, 7)$","is_correct":false,"misconception_token":"ignored-right-value"},{"text":"$(7, 0)$","is_correct":false,"misconception_token":"ignored-up-value"},{"text":"$(7, 7)$","is_correct":true}]$q$::jsonb, $q$$(7, 7)$$q$, $q$The distance right (7) is the x-value and the distance up (7) is the y-value, so the point is $(7, 7)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fe81a573-8f91-5455-b129-7ed8a79333ba',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'easy',
   $q$In the ordered pair $(8, 3)$, what is the y-coordinate?$q$, $q$[{"text":"11","is_correct":false,"misconception_token":"added-coordinates"},{"text":"8","is_correct":false,"misconception_token":"used-x-coordinate"},{"text":"3","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"subtracted-coordinates"}]$q$::jsonb, $q$3$q$, $q$The y-coordinate is the second number in the ordered pair, so it is 3.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9b5c0e69-be53-5ca9-8730-6a436fcdabd3',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'easy',
   $q$Which point lies exactly on the y-axis?$q$, $q$[{"text":"$(5, 1)$","is_correct":false,"misconception_token":"interior-point-two"},{"text":"$(4, 0)$","is_correct":false,"misconception_token":"confused-x-axis"},{"text":"$(0, 4)$","is_correct":true},{"text":"$(2, 2)$","is_correct":false,"misconception_token":"interior-point"}]$q$::jsonb, $q$$(0, 4)$$q$, $q$A point on the y-axis has an x-coordinate of 0, so $(0, 4)$ lies on the y-axis.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('014741aa-888c-5ca5-b751-0e555a4231bd',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'medium',
   $q$Two points are located at $(2, 3)$ and $(9, 3)$. How many units apart are they?$q$, $q$[{"text":"7","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"off-by-one"},{"text":"3","is_correct":false,"misconception_token":"used-y-coordinate"},{"text":"11","is_correct":false,"misconception_token":"added-x-coordinates"}]$q$::jsonb, $q$7$q$, $q$The points share the same y-value, so the distance is the difference of the x-values: $9 - 2 = 7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('aa024c78-5de7-5eea-a99b-ee01fa6cbf1e',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'medium',
   $q$A point is at $(5, 2)$ and another point is at $(5, 10)$. How far apart are they?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"added-y-coordinates"},{"text":"7","is_correct":false,"misconception_token":"off-by-one"},{"text":"8","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"used-x-coordinate"}]$q$::jsonb, $q$8$q$, $q$The points share the same x-value, so the distance is the difference of the y-values: $10 - 2 = 8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('366277f2-5be2-5880-85d4-6d2a913548ce',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'medium',
   $q$On a map grid, the library is at $(3, 4)$ and the school is at $(3, 9)$. Each unit is 1 block. How many blocks apart are they?$q$, $q$[{"text":"6","is_correct":false,"misconception_token":"off-by-one"},{"text":"13","is_correct":false,"misconception_token":"added-y-coordinates"},{"text":"5","is_correct":true},{"text":"3","is_correct":false,"misconception_token":"used-x-coordinate"}]$q$::jsonb, $q$5$q$, $q$The two places share the same x-value, so the distance is the difference of the y-values: $9 - 4 = 5$ blocks.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('731f4af7-7655-5ad9-b934-434d94988e01',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'medium',
   $q$A treasure is buried 6 units east and 8 units north of the start. On the grid, east is right and north is up. What ordered pair marks the treasure?$q$, $q$[{"text":"$(6, 0)$","is_correct":false,"misconception_token":"ignored-north-value"},{"text":"$(8, 6)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(0, 8)$","is_correct":false,"misconception_token":"ignored-east-value"},{"text":"$(6, 8)$","is_correct":true}]$q$::jsonb, $q$$(6, 8)$$q$, $q$East (right) is the x-value (6) and north (up) is the y-value (8), so the treasure is at $(6, 8)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0fa12835-7b67-53bd-bf0b-1994987e6734',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'medium',
   $q$Maria starts at the origin, walks 4 units right, then 3 units up, then 2 more units up. What are her final coordinates?$q$, $q$[{"text":"$(4, 3)$","is_correct":false,"misconception_token":"forgot-second-up-move"},{"text":"$(4, 5)$","is_correct":true},{"text":"$(5, 4)$","is_correct":false,"misconception_token":"swapped-coordinates"},{"text":"$(9, 0)$","is_correct":false,"misconception_token":"added-all-to-x"}]$q$::jsonb, $q$$(4, 5)$$q$, $q$She moves 4 right (x = 4) and up a total of $3 + 2 = 5$ (y = 5), so her coordinates are $(4, 5)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0e288425-bc92-5281-b471-52b967c65c56',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'medium',
   $q$Point A is at $(1, 2)$. Point B is 5 units to the right of A. What are the coordinates of B?$q$, $q$[{"text":"$(5, 2)$","is_correct":false,"misconception_token":"used-move-as-x"},{"text":"$(1, 7)$","is_correct":false,"misconception_token":"moved-up-instead"},{"text":"$(6, 2)$","is_correct":true},{"text":"$(6, 7)$","is_correct":false,"misconception_token":"added-to-both-coordinates"}]$q$::jsonb, $q$$(6, 2)$$q$, $q$Moving right adds to the x-value: $1 + 5 = 6$, and y stays 2, so B is at $(6, 2)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c904b8ab-09a7-515b-899a-0d382d09e140',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'medium',
   $q$A garden has one corner at $(2, 2)$ and the opposite corner of the same side at $(2, 8)$. How long is that side, in units?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"used-y-coordinate"},{"text":"10","is_correct":false,"misconception_token":"added-y-coordinates"},{"text":"5","is_correct":false,"misconception_token":"off-by-one"},{"text":"6","is_correct":true}]$q$::jsonb, $q$6$q$, $q$The corners share the same x-value, so the side length is the difference of the y-values: $8 - 2 = 6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c00319ed-b2d0-591e-a0c1-d30244d2c3fd',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'medium',
   $q$Which of these points is farthest to the right, $(8, 2)$, $(5, 5)$, $(2, 9)$, or $(6, 1)$?$q$, $q$[{"text":"$(8, 2)$","is_correct":true},{"text":"$(5, 5)$","is_correct":false,"misconception_token":"chose-equal-coordinates"},{"text":"$(6, 1)$","is_correct":false,"misconception_token":"chose-second-largest-x"},{"text":"$(2, 9)$","is_correct":false,"misconception_token":"chose-largest-y"}]$q$::jsonb, $q$$(8, 2)$$q$, $q$Farthest right means the largest x-coordinate, and 8 is the largest, so $(8, 2)$ is farthest right.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3a1778e1-d3d4-587b-94b2-7206717e7621',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'hard',
   $q$A park is drawn on a grid. The entrance is at $(2, 1)$. The fountain is 5 units right and 3 units up from the entrance. What are the fountain's coordinates?$q$, $q$[{"text":"$(7, 1)$","is_correct":false,"misconception_token":"forgot-up-move"},{"text":"$(2, 4)$","is_correct":false,"misconception_token":"forgot-right-move"},{"text":"$(5, 3)$","is_correct":false,"misconception_token":"ignored-starting-point"},{"text":"$(7, 4)$","is_correct":true}]$q$::jsonb, $q$$(7, 4)$$q$, $q$Add the moves to the entrance: x is $2 + 5 = 7$ and y is $1 + 3 = 4$, so the fountain is at $(7, 4)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d593d229-a9d8-524d-8aae-f1b594c64ef5',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'hard',
   $q$A rectangle has corners at $(1, 1)$, $(7, 1)$, $(7, 4)$, and $(1, 4)$. The bottom side is 6 units long and the left side is 3 units long. What is the perimeter of the rectangle?$q$, $q$[{"text":"18","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"added-two-sides-only"},{"text":"24","is_correct":false,"misconception_token":"used-longer-side-four-times"},{"text":"15","is_correct":false,"misconception_token":"forgot-to-double-one-side"}]$q$::jsonb, $q$18$q$, $q$A rectangle has two sides of each length, so the perimeter is $2 \times (6 + 3) = 18$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('70a52dc1-8fb9-57c8-9c14-6947bad33077',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'hard',
   $q$Sam is at $(4, 2)$. Dana is directly above Sam at $(4, 9)$, and Ray is directly right of Sam at $(10, 2)$. How much farther from Sam is Dana than Ray?$q$, $q$[{"text":"13","is_correct":false,"misconception_token":"added-both-distances"},{"text":"7","is_correct":false,"misconception_token":"gave-dana-distance-only"},{"text":"1","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"off-by-one"}]$q$::jsonb, $q$1$q$, $q$Dana is $9 - 2 = 7$ units from Sam and Ray is $10 - 4 = 6$ units from Sam, so Dana is $7 - 6 = 1$ unit farther.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('21908e03-3d6d-5da3-92c9-82d0839b2d2e',
   null,
   (select id from public.skills where slug = 'coordinate-plane'),
   'geometry-trigonometry', 'hard',
   $q$A robot starts at the origin. It moves 3 units right, then 4 units up, then 2 units right, then 1 unit up. What are the robot's final coordinates?$q$, $q$[{"text":"$(5, 5)$","is_correct":true},{"text":"$(3, 5)$","is_correct":false,"misconception_token":"dropped-second-right-move"},{"text":"$(10, 0)$","is_correct":false,"misconception_token":"summed-all-as-x"},{"text":"$(5, 4)$","is_correct":false,"misconception_token":"dropped-last-up-move"}]$q$::jsonb, $q$$(5, 5)$$q$, $q$The right moves total $3 + 2 = 5$ (x = 5) and the up moves total $4 + 1 = 5$ (y = 5), so the robot ends at $(5, 5)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- numerical-expressions (Numerical Expressions, grade 5, CCSS.MATH.CONTENT.5.OA.A.1) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ccafce1b-4161-56ea-b703-7776c44dd72b',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'easy',
   $q$Evaluate $6 \times (5 + 2)$.$q$, $q$[{"text":"60","is_correct":false,"misconception_token":"multiplied-inside-parentheses"},{"text":"42","is_correct":true},{"text":"32","is_correct":false,"misconception_token":"ignored-parentheses"},{"text":"13","is_correct":false,"misconception_token":"added-all-numbers"}]$q$::jsonb, $q$42$q$, $q$Do the parentheses first: $5 + 2 = 7$. Then $6 \times 7 = 42$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9f8440c2-9396-55b9-bc0a-614ea023eac8',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'easy',
   $q$Evaluate $(12 - 4) \div 2$.$q$, $q$[{"text":"4","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"10","is_correct":false,"misconception_token":"ignored-parentheses"},{"text":"2","is_correct":false,"misconception_token":"divided-before-subtracting"}]$q$::jsonb, $q$4$q$, $q$Do the parentheses first: $12 - 4 = 8$. Then $8 \div 2 = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dea263f8-5524-587b-b568-5cd85cd86765',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'easy',
   $q$Evaluate $18 - (3 + 5)$.$q$, $q$[{"text":"26","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"10","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"answered-group-only"},{"text":"20","is_correct":false,"misconception_token":"ignored-parentheses"}]$q$::jsonb, $q$10$q$, $q$Do the parentheses first: $3 + 5 = 8$. Then $18 - 8 = 10$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f9e42b13-d572-5980-a5bd-729324303121',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'easy',
   $q$Evaluate $20 - 3 \times 4$.$q$, $q$[{"text":"8","is_correct":true},{"text":"68","is_correct":false,"misconception_token":"subtracted-before-multiplying"},{"text":"21","is_correct":false,"misconception_token":"replaced-times-with-plus"},{"text":"12","is_correct":false,"misconception_token":"answered-product-only"}]$q$::jsonb, $q$8$q$, $q$Multiply before subtracting: $3 \times 4 = 12$. Then $20 - 12 = 8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d3267641-114b-5900-8c10-d10b1de1a042',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'easy',
   $q$Which expression means: add 8 and 4, then multiply the sum by 3?$q$, $q$[{"text":"$8 + 4 \\times 3$","is_correct":false,"misconception_token":"forgot-parentheses"},{"text":"$(8 \\times 4) + 3$","is_correct":false,"misconception_token":"used-wrong-operations"},{"text":"$8 \\times 3 + 4$","is_correct":false,"misconception_token":"multiplied-wrong-number"},{"text":"$(8 + 4) \\times 3$","is_correct":true}]$q$::jsonb, $q$$(8 + 4) \times 3$$q$, $q$The sum $8 + 4$ must be grouped so it is multiplied by 3: $(8 + 4) \times 3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('38280448-2a09-57e9-b449-933d3f52fc76',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'easy',
   $q$Evaluate $2 \times (9 - 6) + 4$.$q$, $q$[{"text":"6","is_correct":false,"misconception_token":"forgot-to-add-4"},{"text":"14","is_correct":false,"misconception_token":"included-4-inside-parentheses"},{"text":"16","is_correct":false,"misconception_token":"ignored-parentheses"},{"text":"10","is_correct":true}]$q$::jsonb, $q$10$q$, $q$Parentheses first: $9 - 6 = 3$. Then $2 \times 3 = 6$, and $6 + 4 = 10$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9e505127-b2d9-5fe0-aa25-e7d5d68b2b4d',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'easy',
   $q$Evaluate $(7 + 3) \times (6 - 2)$.$q$, $q$[{"text":"14","is_correct":false,"misconception_token":"added-groups-instead-of-multiplying"},{"text":"23","is_correct":false,"misconception_token":"ignored-parentheses"},{"text":"40","is_correct":true},{"text":"58","is_correct":false,"misconception_token":"ignored-second-parentheses"}]$q$::jsonb, $q$40$q$, $q$Each group first: $7 + 3 = 10$ and $6 - 2 = 4$. Then $10 \times 4 = 40$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d91c5f9c-8db1-593e-8f1f-fa7fc0256b80',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'easy',
   $q$Maria buys 3 packs of pens with 4 pens in each pack. She already had 5 pens. Which expression shows how many pens she has now?$q$, $q$[{"text":"$(3 + 4) \\times 5$","is_correct":false,"misconception_token":"added-before-multiplying"},{"text":"$3 \\times (4 + 5)$","is_correct":false,"misconception_token":"grouped-added-extra-pens"},{"text":"$3 \\times 4 + 5$","is_correct":true},{"text":"$3 + 4 \\times 5$","is_correct":false,"misconception_token":"misplaced-operations"}]$q$::jsonb, $q$$3 \times 4 + 5$$q$, $q$The 3 packs of 4 pens are $3 \times 4$, and the 5 she already had are added: $3 \times 4 + 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4475a306-0c6c-5515-bde9-94905b5b45d4',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'medium',
   $q$Evaluate $[15 + 6] \times 2 - 8$.$q$, $q$[{"text":"34","is_correct":true},{"text":"19","is_correct":false,"misconception_token":"ignored-brackets"},{"text":"26","is_correct":false,"misconception_token":"subtracted-before-multiplying"},{"text":"42","is_correct":false,"misconception_token":"forgot-final-subtraction"}]$q$::jsonb, $q$34$q$, $q$Brackets first: $15 + 6 = 21$. Then $21 \times 2 = 42$, and $42 - 8 = 34$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d0e0a64d-7f3c-5978-a08f-995d6f3f208d',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'medium',
   $q$Evaluate $3 \times [8 - (2 + 1)]$.$q$, $q$[{"text":"21","is_correct":false,"misconception_token":"ignored-brackets"},{"text":"5","is_correct":false,"misconception_token":"forgot-to-multiply"},{"text":"15","is_correct":true},{"text":"33","is_correct":false,"misconception_token":"added-instead-of-subtracting"}]$q$::jsonb, $q$15$q$, $q$Innermost first: $2 + 1 = 3$, then $8 - 3 = 5$. Finally $3 \times 5 = 15$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('82ed74e4-e3a5-5e48-9728-3d5303d14190',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'medium',
   $q$A theater has 8 rows with 12 seats each and 5 rows with 10 seats each. Which expression gives the total number of seats?$q$, $q$[{"text":"$(8 + 12) \\times (5 + 10)$","is_correct":false,"misconception_token":"added-within-groups"},{"text":"$8 \\times 12 + 5 + 10$","is_correct":false,"misconception_token":"wrong-operation-for-second-group"},{"text":"$8 \\times 12 + 5 \\times 10$","is_correct":true},{"text":"$8 \\times 5 + 12 \\times 10$","is_correct":false,"misconception_token":"paired-wrong-numbers"}]$q$::jsonb, $q$$8 \times 12 + 5 \times 10$$q$, $q$The first block is $8 \times 12$ seats and the second is $5 \times 10$ seats, added together: $8 \times 12 + 5 \times 10$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e2987516-34db-545a-b7c3-877f21cf71f0',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'medium',
   $q$Evaluate $\{20 - [2 \times (3 + 1)]\} \div 4$.$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"ignored-braces"},{"text":"12","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"8","is_correct":false,"misconception_token":"answered-inner-bracket-only"},{"text":"3","is_correct":true}]$q$::jsonb, $q$3$q$, $q$Work outward: $3 + 1 = 4$, then $2 \times 4 = 8$, then $20 - 8 = 12$. Finally $12 \div 4 = 3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d974e2e0-c8b3-59f2-992c-281403358983',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'medium',
   $q$Sam had 50 dollars. He bought 3 books that cost 8 dollars each. How many dollars does he have left?$q$, $q$[{"text":"24","is_correct":false,"misconception_token":"answered-cost-only"},{"text":"26","is_correct":true},{"text":"376","is_correct":false,"misconception_token":"subtracted-before-multiplying"},{"text":"74","is_correct":false,"misconception_token":"added-instead-of-subtracting"}]$q$::jsonb, $q$26$q$, $q$The books cost $3 \times 8 = 24$ dollars. Subtract from what he had: $50 - 24 = 26$ dollars.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cb8d21a1-36b6-5327-852a-a091fa026dd7',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'medium',
   $q$Evaluate $40 \div 5 + 3 \times 6$.$q$, $q$[{"text":"144","is_correct":false,"misconception_token":"multiplied-parts-instead-of-adding"},{"text":"66","is_correct":false,"misconception_token":"ignored-order-of-operations"},{"text":"26","is_correct":true},{"text":"11","is_correct":false,"misconception_token":"dropped-multiplication-step"}]$q$::jsonb, $q$26$q$, $q$Do multiplication and division first: $40 \div 5 = 8$ and $3 \times 6 = 18$. Then $8 + 18 = 26$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2f1411ac-2512-58f3-a045-390684e82d70',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'medium',
   $q$Which expression means: subtract 7 from 20, then divide the result by the sum of 2 and 3?$q$, $q$[{"text":"$(20 - 7) \\div 2 + 3$","is_correct":false,"misconception_token":"missed-second-grouping"},{"text":"$20 - 7 \\div 2 + 3$","is_correct":false,"misconception_token":"no-grouping"},{"text":"$(7 - 20) \\div (2 + 3)$","is_correct":false,"misconception_token":"reversed-subtraction"},{"text":"$(20 - 7) \\div (2 + 3)$","is_correct":true}]$q$::jsonb, $q$$(20 - 7) \div (2 + 3)$$q$, $q$"Subtract 7 from 20" is $(20 - 7)$, divided by the grouped sum $(2 + 3)$: $(20 - 7) \div (2 + 3)$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3248b680-ead6-504e-ba35-86c2e81e697c',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'medium',
   $q$A baker puts 6 muffins in each of 4 small boxes and 9 muffins in each of 2 large boxes. How many muffins does she pack in all?$q$, $q$[{"text":"42","is_correct":true},{"text":"21","is_correct":false,"misconception_token":"added-all-numbers"},{"text":"24","is_correct":false,"misconception_token":"counted-small-boxes-only"},{"text":"66","is_correct":false,"misconception_token":"misplaced-grouping"}]$q$::jsonb, $q$42$q$, $q$Small boxes hold $6 \times 4 = 24$ and large boxes hold $9 \times 2 = 18$. Total: $24 + 18 = 42$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c930cd70-8da9-5ba0-80a1-279ae0a58a7a',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'hard',
   $q$Evaluate $2 \times \{15 - [3 \times (2 + 2)]\}$.$q$, $q$[{"text":"3","is_correct":false,"misconception_token":"forgot-to-multiply-by-2"},{"text":"14","is_correct":false,"misconception_token":"misapplied-inner-parentheses"},{"text":"18","is_correct":false,"misconception_token":"ignored-outer-grouping"},{"text":"6","is_correct":true}]$q$::jsonb, $q$6$q$, $q$Innermost first: $2 + 2 = 4$, then $3 \times 4 = 12$, then $15 - 12 = 3$. Finally $2 \times 3 = 6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('23ef8682-76e1-506f-90bf-305d03ecf0b7',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'hard',
   $q$A school buys 4 boxes of markers at 6 dollars each and 3 boxes of pencils at 5 dollars each. A coupon takes 8 dollars off the total. What is the final cost in dollars?$q$, $q$[{"text":"31","is_correct":true},{"text":"39","is_correct":false,"misconception_token":"forgot-to-subtract-discount"},{"text":"10","is_correct":false,"misconception_token":"added-all-numbers"},{"text":"47","is_correct":false,"misconception_token":"added-discount-instead-of-subtracting"}]$q$::jsonb, $q$31$q$, $q$Markers cost $4 \times 6 = 24$ and pencils cost $3 \times 5 = 15$, so the total is $24 + 15 = 39$. After the coupon: $39 - 8 = 31$ dollars.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('617aed9f-bb89-55cd-950d-b58cedb3bfbe',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'hard',
   $q$Which expression means: multiply the difference of 30 and 6 by the sum of 4 and 5, then subtract 7?$q$, $q$[{"text":"$30 - 6 \\times (4 + 5) - 7$","is_correct":false,"misconception_token":"no-grouping-on-difference"},{"text":"$(30 - 6) \\times (4 + 5 - 7)$","is_correct":false,"misconception_token":"grouped-subtraction-wrong"},{"text":"$(30 - 6) \\times (4 + 5) - 7$","is_correct":true},{"text":"$30 - (6 \\times 4) + (5 - 7)$","is_correct":false,"misconception_token":"wrong-operations"}]$q$::jsonb, $q$$(30 - 6) \times (4 + 5) - 7$$q$, $q$The difference $(30 - 6)$ times the sum $(4 + 5)$, with 7 subtracted last: $(30 - 6) \times (4 + 5) - 7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d6dcb2c3-481c-5973-a844-56fb4ca3b517',
   null,
   (select id from public.skills where slug = 'numerical-expressions'),
   'algebra', 'hard',
   $q$Evaluate $\{[(18 - 3) \div 5] + 4\} \times 6$.$q$, $q$[{"text":"42","is_correct":true},{"text":"27","is_correct":false,"misconception_token":"ignored-braces"},{"text":"13","is_correct":false,"misconception_token":"added-instead-of-multiplying"},{"text":"7","is_correct":false,"misconception_token":"forgot-to-multiply"}]$q$::jsonb, $q$42$q$, $q$Innermost first: $18 - 3 = 15$, then $15 \div 5 = 3$, then $3 + 4 = 7$. Finally $7 \times 6 = 42$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- integers-rational-numbers (Integers & Rational Numbers, grade 6, CCSS.MATH.CONTENT.6.NS.C) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('446ec58b-04e2-5c61-9c31-6109c78a67b6',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'easy',
   $q$What is the opposite of $-7$?$q$, $q$[{"text":"$0$","is_correct":false,"misconception_token":"used-zero"},{"text":"$7$","is_correct":true},{"text":"$-7$","is_correct":false,"misconception_token":"kept-same-number"},{"text":"$\\frac{1}{7}$","is_correct":false,"misconception_token":"used-reciprocal"}]$q$::jsonb, $q$$7$$q$, $q$The opposite of a number is the same distance from $0$ on the other side, so the opposite of $-7$ is $7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('12d936b6-4710-5712-9119-36bed1b1d9c9',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'easy',
   $q$What is $|-9|$?$q$, $q$[{"text":"$9$","is_correct":true},{"text":"$18$","is_correct":false,"misconception_token":"doubled-the-value"},{"text":"$-9$","is_correct":false,"misconception_token":"kept-negative-sign"},{"text":"$0$","is_correct":false,"misconception_token":"answered-zero"}]$q$::jsonb, $q$$9$$q$, $q$Absolute value is the distance from $0$, which is always non-negative, so $|-9| = 9$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('83261844-352a-5ae9-891e-86264083eac0',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'easy',
   $q$On a number line, which number is farther to the right: $-1$ or $-6$?$q$, $q$[{"text":"They are the same distance","is_correct":false,"misconception_token":"treated-as-equal"},{"text":"$-1$","is_correct":true},{"text":"Cannot tell without a ruler","is_correct":false,"misconception_token":"misread-number-line"},{"text":"$-6$","is_correct":false,"misconception_token":"leftmost-is-greater"}]$q$::jsonb, $q$$-1$$q$, $q$On a number line larger numbers are to the right; since $-1 > -6$, the number $-1$ is farther to the right.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6819b449-55e8-5b9b-85f3-2519b650ddf7',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'easy',
   $q$The temperature is $-3$ degrees. It rises $5$ degrees. What is the new temperature?$q$, $q$[{"text":"$2$ degrees","is_correct":true},{"text":"$-2$ degrees","is_correct":false,"misconception_token":"kept-negative-sign"},{"text":"$-8$ degrees","is_correct":false,"misconception_token":"subtracted-instead"},{"text":"$8$ degrees","is_correct":false,"misconception_token":"ignored-the-negative"}]$q$::jsonb, $q$$2$ degrees$q$, $q$Start at $-3$ and move up $5$: $-3 + 5 = 2$ degrees.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0993f0c8-617f-57e2-828f-4569691aad70',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'easy',
   $q$A submarine is $60$ feet below sea level. Which integer represents its position?$q$, $q$[{"text":"$60$","is_correct":false,"misconception_token":"ignored-below-direction"},{"text":"$\\frac{1}{60}$","is_correct":false,"misconception_token":"used-reciprocal"},{"text":"$0$","is_correct":false,"misconception_token":"used-sea-level"},{"text":"$-60$","is_correct":true}]$q$::jsonb, $q$$-60$$q$, $q$Below sea level is negative, so $60$ feet below sea level is represented by $-60$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9325c5f9-6a23-5994-853c-c0b672dce931',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'easy',
   $q$What is $-(-4)$?$q$, $q$[{"text":"$8$","is_correct":false,"misconception_token":"added-the-numbers"},{"text":"$0$","is_correct":false,"misconception_token":"canceled-to-zero"},{"text":"$-4$","is_correct":false,"misconception_token":"kept-one-negative"},{"text":"$4$","is_correct":true}]$q$::jsonb, $q$$4$$q$, $q$The opposite of $-4$ is $4$, so $-(-4) = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('866ef6ff-a66b-5610-936a-e9f49345fbbf',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'easy',
   $q$Which number has the greater absolute value: $-8$ or $3$?$q$, $q$[{"text":"They are equal in absolute value","is_correct":false,"misconception_token":"treated-as-equal"},{"text":"$3$","is_correct":false,"misconception_token":"compared-actual-values"},{"text":"$-8$","is_correct":true},{"text":"Neither, absolute value has no size","is_correct":false,"misconception_token":"misunderstood-absolute-value"}]$q$::jsonb, $q$$-8$$q$, $q$Since $|-8| = 8$ and $|3| = 3$, and $8 > 3$, the number $-8$ has the greater absolute value.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('97fc8359-1dab-5cb8-bd2a-19e679782ba2',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'easy',
   $q$Order these integers from least to greatest: $-4$, $2$, $-1$.$q$, $q$[{"text":"$-4, 2, -1$","is_correct":false,"misconception_token":"left-in-original-order"},{"text":"$-1, -4, 2$","is_correct":false,"misconception_token":"ordered-by-absolute-value"},{"text":"$-4, -1, 2$","is_correct":true},{"text":"$2, -1, -4$","is_correct":false,"misconception_token":"greatest-to-least"}]$q$::jsonb, $q$$-4, -1, 2$$q$, $q$On a number line $-4$ is leftmost, then $-1$, then $2$, so least to greatest is $-4, -1, 2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d2459ee3-86d7-540a-8123-8d2135b47518',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'medium',
   $q$Which fraction is greater: $-\frac{1}{2}$ or $-\frac{3}{4}$?$q$, $q$[{"text":"$-\\frac{1}{2}$","is_correct":true},{"text":"$-\\frac{3}{4}$","is_correct":false,"misconception_token":"larger-magnitude-is-greater"},{"text":"Negative fractions cannot be compared","is_correct":false,"misconception_token":"cannot-compare-negatives"},{"text":"They are equal","is_correct":false,"misconception_token":"treated-as-equal"}]$q$::jsonb, $q$$-\frac{1}{2}$$q$, $q$As decimals, $-\frac{1}{2} = -0.5$ and $-\frac{3}{4} = -0.75$; since $-0.5 > -0.75$, the greater fraction is $-\frac{1}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f837a612-fa12-58be-80f0-76adab3ad06d',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'medium',
   $q$Order these numbers from least to greatest: $-0.5$, $-0.05$, $-5$.$q$, $q$[{"text":"$-0.05, -0.5, -5$","is_correct":false,"misconception_token":"greatest-to-least"},{"text":"$-5, -0.05, -0.5$","is_correct":false,"misconception_token":"misordered-small-decimals"},{"text":"$-5, -0.5, -0.05$","is_correct":true},{"text":"$-0.5, -0.05, -5$","is_correct":false,"misconception_token":"ordered-ignoring-place-value"}]$q$::jsonb, $q$$-5, -0.5, -0.05$$q$, $q$The most negative value is least: $-5 < -0.5 < -0.05$, so least to greatest is $-5, -0.5, -0.05$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a254f9bb-3347-5c48-ac23-138f3225109f',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'medium',
   $q$Maria owes her brother $15$ dollars and owes her friend $8$ dollars. Which integer represents her total debt?$q$, $q$[{"text":"$-7$","is_correct":false,"misconception_token":"combined-as-difference"},{"text":"$23$","is_correct":false,"misconception_token":"ignored-debt-is-negative"},{"text":"$-23$","is_correct":true},{"text":"$7$","is_correct":false,"misconception_token":"subtracted-and-dropped-sign"}]$q$::jsonb, $q$$-23$$q$, $q$Both amounts are money owed, so they add as negatives: $-15 + (-8) = -23$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7d6344c7-856c-56ea-9b65-fde7c44e8d68',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'medium',
   $q$What is the distance between $-4$ and $3$ on a number line?$q$, $q$[{"text":"$-1$","is_correct":false,"misconception_token":"added-signed-values"},{"text":"$1$","is_correct":false,"misconception_token":"subtracted-absolute-values"},{"text":"$12$","is_correct":false,"misconception_token":"multiplied-the-numbers"},{"text":"$7$","is_correct":true}]$q$::jsonb, $q$$7$$q$, $q$Distance is the absolute difference: $|3 - (-4)| = |7| = 7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('363f07bb-3522-5af8-a3da-557c005257c6',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'medium',
   $q$At midnight the temperature was $-6$ degrees in Denver and $-10$ degrees in Fargo. Which city was colder?$q$, $q$[{"text":"Denver","is_correct":false,"misconception_token":"compared-magnitudes-reversed"},{"text":"Fargo","is_correct":true},{"text":"Not enough information","is_correct":false,"misconception_token":"thought-negatives-incomparable"},{"text":"They were equally cold","is_correct":false,"misconception_token":"treated-as-equal"}]$q$::jsonb, $q$Fargo$q$, $q$Colder means a lower temperature; since $-10 < -6$, Fargo was colder.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b38e85be-7973-510d-8e1a-a0a48ac88dd7',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'medium',
   $q$Evaluate $|3 - 8|$.$q$, $q$[{"text":"$-11$","is_correct":false,"misconception_token":"negated-the-sum"},{"text":"$-5$","is_correct":false,"misconception_token":"ignored-absolute-value"},{"text":"$5$","is_correct":true},{"text":"$11$","is_correct":false,"misconception_token":"added-instead-of-subtracted"}]$q$::jsonb, $q$$5$$q$, $q$First $3 - 8 = -5$, then $|-5| = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('358a80f3-2bce-5559-a754-2d5e863de5e9',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'medium',
   $q$Point A is at $-3$ and point B is at $-7$ on a number line. Which point is closer to $0$?$q$, $q$[{"text":"Point B, because $-7 > -3$","is_correct":false,"misconception_token":"misordered-negatives"},{"text":"Point B","is_correct":false,"misconception_token":"larger-magnitude-is-closer"},{"text":"Both are equally close","is_correct":false,"misconception_token":"treated-as-equal"},{"text":"Point A","is_correct":true}]$q$::jsonb, $q$Point A$q$, $q$Distance from $0$ is the absolute value: $|-3| = 3$ and $|-7| = 7$; since $3 < 7$, point A is closer to $0$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9a720d47-116f-5bb4-b870-cb0850a3edb4',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'medium',
   $q$Order these numbers from least to greatest: $-\frac{1}{2}$, $0.25$, $-1$, $\frac{3}{4}$.$q$, $q$[{"text":"$-1, -\\frac{1}{2}, 0.25, \\frac{3}{4}$","is_correct":true},{"text":"$-1, -\\frac{1}{2}, \\frac{3}{4}, 0.25$","is_correct":false,"misconception_token":"misordered-decimal-and-fraction"},{"text":"$\\frac{3}{4}, 0.25, -\\frac{1}{2}, -1$","is_correct":false,"misconception_token":"greatest-to-least"},{"text":"$-\\frac{1}{2}, -1, 0.25, \\frac{3}{4}$","is_correct":false,"misconception_token":"ordered-negatives-by-magnitude"}]$q$::jsonb, $q$$-1, -\frac{1}{2}, 0.25, \frac{3}{4}$$q$, $q$As decimals these are $-0.5, 0.25, -1, 0.75$, so from least to greatest: $-1, -\frac{1}{2}, 0.25, \frac{3}{4}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('faa3c2b0-9a31-5740-a424-d9e3b5a8ff57',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'hard',
   $q$Devon's bank account is at $-45$ dollars. He deposits $30$ dollars and then is charged a $12$ dollar fee. What is his balance?$q$, $q$[{"text":"$27$","is_correct":false,"misconception_token":"dropped-negative-sign"},{"text":"$-87$","is_correct":false,"misconception_token":"subtracted-the-deposit"},{"text":"$-3$","is_correct":false,"misconception_token":"added-fee-instead-of-subtracting"},{"text":"$-27$","is_correct":true}]$q$::jsonb, $q$$-27$$q$, $q$Start at $-45$, add the deposit, then subtract the fee: $-45 + 30 - 12 = -27$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8d9eb629-5935-5ce3-9877-b3a6aa7d500c',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'hard',
   $q$The peak of a mountain is 1,200 feet above sea level. The bottom of a nearby trench is 850 feet below sea level. What is the difference in elevation between them?$q$, $q$[{"text":"$2050$ feet","is_correct":true},{"text":"$350$ feet","is_correct":false,"misconception_token":"subtracted-instead-of-adding"},{"text":"$1200$ feet","is_correct":false,"misconception_token":"ignored-the-trench"},{"text":"$-2050$ feet","is_correct":false,"misconception_token":"kept-negative-sign"}]$q$::jsonb, $q$$2050$ feet$q$, $q$The trench is at $-850$ feet, so the difference is $1200 - (-850) = 1200 + 850 = 2050$ feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b2f33c22-c36e-55a4-8444-c301bea41e02',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'hard',
   $q$Which statement is true?$q$, $q$[{"text":"$-8 > -3$","is_correct":false,"misconception_token":"larger-magnitude-is-greater"},{"text":"$|-8| < |-3|$","is_correct":false,"misconception_token":"compared-magnitudes-wrong"},{"text":"$-8 < -3$","is_correct":true},{"text":"$-3 < -8$","is_correct":false,"misconception_token":"reversed-inequality"}]$q$::jsonb, $q$$-8 < -3$$q$, $q$On a number line $-8$ is to the left of $-3$, so $-8 < -3$ is the true statement.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('49df4816-01a8-50f5-940b-afd387ac9380',
   null,
   (select id from public.skills where slug = 'integers-rational-numbers'),
   'algebra', 'hard',
   $q$At $6$ a.m. the temperature was $-4$ degrees. It rose $3$ degrees each hour for $3$ hours, then dropped $2$ degrees. What was the final temperature?$q$, $q$[{"text":"$3$ degrees","is_correct":true},{"text":"$11$ degrees","is_correct":false,"misconception_token":"ignored-starting-negative"},{"text":"$-15$ degrees","is_correct":false,"misconception_token":"subtracted-the-rise"},{"text":"$-3$ degrees","is_correct":false,"misconception_token":"applied-rise-once"}]$q$::jsonb, $q$$3$ degrees$q$, $q$The total rise is $3 \times 3 = 9$ degrees, so $-4 + 9 - 2 = 3$ degrees.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- divide-fractions (Dividing Fractions, grade 6, CCSS.MATH.CONTENT.6.NS.A.1) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dd712e86-8d10-5447-b353-6787c7978781',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{2} \div \frac{1}{4}$?$q$, $q$[{"text":"$8$","is_correct":false,"misconception_token":"flipped-both-fractions"},{"text":"$2$","is_correct":true},{"text":"$\\frac{1}{8}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"flipped-dividend"}]$q$::jsonb, $q$$2$$q$, $q$Multiply by the reciprocal: $\frac{1}{2} \div \frac{1}{4} = \frac{1}{2} \times \frac{4}{1} = \frac{4}{2} = 2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2a1eb694-f97e-5c69-b524-1a6e696baf81',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{3}{4} \div \frac{1}{2}$?$q$, $q$[{"text":"$\\frac{3}{2}$","is_correct":true},{"text":"$\\frac{2}{3}$","is_correct":false,"misconception_token":"flipped-dividend"},{"text":"$\\frac{3}{8}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$\\frac{8}{3}$","is_correct":false,"misconception_token":"flipped-both-fractions"}]$q$::jsonb, $q$$\frac{3}{2}$$q$, $q$Multiply by the reciprocal: $\frac{3}{4} \times \frac{2}{1} = \frac{6}{4} = \frac{3}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8edcbe79-03f3-5be3-9c9c-6c8c2107ee19',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{2}{3} \div \frac{4}{5}$?$q$, $q$[{"text":"$\\frac{6}{5}$","is_correct":false,"misconception_token":"flipped-dividend"},{"text":"$\\frac{5}{6}$","is_correct":true},{"text":"$\\frac{15}{8}$","is_correct":false,"misconception_token":"flipped-both-fractions"},{"text":"$\\frac{8}{15}$","is_correct":false,"misconception_token":"multiplied-instead"}]$q$::jsonb, $q$$\frac{5}{6}$$q$, $q$Multiply by the reciprocal: $\frac{2}{3} \times \frac{5}{4} = \frac{10}{12} = \frac{5}{6}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c5d37124-04b4-5b9e-bd54-56b27c2d37e3',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{5}{6} \div \frac{5}{12}$?$q$, $q$[{"text":"$2$","is_correct":true},{"text":"$\\frac{25}{72}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"flipped-dividend"},{"text":"$\\frac{72}{25}$","is_correct":false,"misconception_token":"flipped-both-fractions"}]$q$::jsonb, $q$$2$$q$, $q$Multiply by the reciprocal: $\frac{5}{6} \times \frac{12}{5} = \frac{60}{30} = 2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c6a766ce-a51c-5af8-a660-8084427a42da',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{7}{8} \div \frac{1}{4}$?$q$, $q$[{"text":"$\\frac{7}{32}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$\\frac{32}{7}$","is_correct":false,"misconception_token":"flipped-both-fractions"},{"text":"$\\frac{2}{7}$","is_correct":false,"misconception_token":"flipped-dividend"},{"text":"$\\frac{7}{2}$","is_correct":true}]$q$::jsonb, $q$$\frac{7}{2}$$q$, $q$Multiply by the reciprocal: $\frac{7}{8} \times \frac{4}{1} = \frac{28}{8} = \frac{7}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7da666f8-843f-5bb6-99a7-bbf827a97a2f',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{3}{5} \div \frac{9}{10}$?$q$, $q$[{"text":"$\\frac{50}{27}$","is_correct":false,"misconception_token":"flipped-both-fractions"},{"text":"$\\frac{3}{2}$","is_correct":false,"misconception_token":"flipped-dividend"},{"text":"$\\frac{27}{50}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$\\frac{2}{3}$","is_correct":true}]$q$::jsonb, $q$$\frac{2}{3}$$q$, $q$Multiply by the reciprocal: $\frac{3}{5} \times \frac{10}{9} = \frac{30}{45} = \frac{2}{3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('80a26d25-6c62-5651-a8a1-087f52c13bf9',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$A recipe uses $\frac{1}{3}$ cup of flour for one batch. How many batches can be made with $\frac{2}{3}$ cup of flour?$q$, $q$[{"text":"$\\frac{1}{3}$","is_correct":false,"misconception_token":"subtracted-instead"},{"text":"$\\frac{2}{9}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$2$","is_correct":true},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"flipped-dividend"}]$q$::jsonb, $q$$2$$q$, $q$Divide the total by the amount per batch: $\frac{2}{3} \div \frac{1}{3} = \frac{2}{3} \times \frac{3}{1} = 2$ batches.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7f3453cf-ae10-5f93-ba04-b4ab7b3066ba',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{4}{9} \div \frac{2}{3}$?$q$, $q$[{"text":"$\\frac{27}{8}$","is_correct":false,"misconception_token":"flipped-both-fractions"},{"text":"$\\frac{8}{27}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$\\frac{2}{3}$","is_correct":true},{"text":"$\\frac{3}{2}$","is_correct":false,"misconception_token":"flipped-dividend"}]$q$::jsonb, $q$$\frac{2}{3}$$q$, $q$Multiply by the reciprocal: $\frac{4}{9} \times \frac{3}{2} = \frac{12}{18} = \frac{2}{3}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c0e430a6-ef47-561f-9f00-b74595e66034',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $2\frac{1}{2} \div \frac{1}{4}$?$q$, $q$[{"text":"$10$","is_correct":true},{"text":"$\\frac{5}{8}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$\\frac{8}{5}$","is_correct":false,"misconception_token":"flipped-dividend"},{"text":"$4$","is_correct":false,"misconception_token":"ignored-whole-number"}]$q$::jsonb, $q$$10$$q$, $q$Write the mixed number as $\frac{5}{2}$, then multiply by the reciprocal: $\frac{5}{2} \times \frac{4}{1} = \frac{20}{2} = 10$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9278d950-7a8e-518d-965c-db8e7acdfc9e',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $3\frac{1}{3} \div \frac{5}{6}$?$q$, $q$[{"text":"$\\frac{25}{9}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$\\frac{9}{25}$","is_correct":false,"misconception_token":"flipped-dividend"},{"text":"$4$","is_correct":true},{"text":"$\\frac{1}{4}$","is_correct":false,"misconception_token":"flipped-both-fractions"}]$q$::jsonb, $q$$4$$q$, $q$Write $3\frac{1}{3}$ as $\frac{10}{3}$: $\frac{10}{3} \times \frac{6}{5} = \frac{60}{15} = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fba85a69-11b6-552a-9437-89608a7b7efe',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag holds $\frac{3}{4}$ pound of trail mix. If each serving is $\frac{1}{8}$ pound, how many servings are in the bag?$q$, $q$[{"text":"$\\frac{1}{6}$","is_correct":false,"misconception_token":"flipped-dividend"},{"text":"$\\frac{3}{32}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$6$","is_correct":true},{"text":"$\\frac{5}{8}$","is_correct":false,"misconception_token":"subtracted-instead"}]$q$::jsonb, $q$$6$$q$, $q$Divide the total by the serving size: $\frac{3}{4} \div \frac{1}{8} = \frac{3}{4} \times \frac{8}{1} = 6$ servings.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('92e978fe-dfab-505b-9fca-2f43aa4000db',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{5}{8} \div 2\frac{1}{2}$?$q$, $q$[{"text":"$\\frac{16}{25}$","is_correct":false,"misconception_token":"flipped-dividend"},{"text":"$\\frac{25}{16}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$4$","is_correct":false,"misconception_token":"flipped-both-fractions"},{"text":"$\\frac{1}{4}$","is_correct":true}]$q$::jsonb, $q$$\frac{1}{4}$$q$, $q$Write $2\frac{1}{2}$ as $\frac{5}{2}$: $\frac{5}{8} \times \frac{2}{5} = \frac{10}{40} = \frac{1}{4}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('743ec10d-2493-5bc6-8e99-b6a169399f8a',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$The equation $\frac{3}{4} \div \frac{1}{8} = 6$ correctly describes which situation?$q$, $q$[{"text":"The size of each part when $\\frac{1}{8}$ is split into $6$ equal groups","is_correct":false,"misconception_token":"reversed-dividend-divisor"},{"text":"The number of $\\frac{1}{8}$-sized pieces that fit into $\\frac{3}{4}$","is_correct":true},{"text":"The result of adding $\\frac{3}{4}$ to itself $\\frac{1}{8}$ times","is_correct":false,"misconception_token":"addition-interpretation"},{"text":"The size of each part when $\\frac{3}{4}$ is split into $8$ equal parts","is_correct":false,"misconception_token":"divided-by-denominator"}]$q$::jsonb, $q$The number of $\frac{1}{8}$-sized pieces that fit into $\frac{3}{4}$$q$, $q$Dividing $\frac{3}{4}$ by $\frac{1}{8}$ asks how many $\frac{1}{8}$s are in $\frac{3}{4}$; since $\frac{3}{4} \times \frac{8}{1} = 6$, there are $6$ such pieces.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bf064b87-e166-50dd-8c2e-9c1dd48995f8',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$A ribbon is $4\frac{1}{2}$ feet long. Each bow uses $\frac{3}{4}$ foot of ribbon. How many bows can be made?$q$, $q$[{"text":"$\\frac{1}{6}$","is_correct":false,"misconception_token":"flipped-both-fractions"},{"text":"$\\frac{27}{8}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$6$","is_correct":true},{"text":"$\\frac{8}{27}$","is_correct":false,"misconception_token":"flipped-dividend"}]$q$::jsonb, $q$$6$$q$, $q$Write $4\frac{1}{2}$ as $\frac{9}{2}$: $\frac{9}{2} \div \frac{3}{4} = \frac{9}{2} \times \frac{4}{3} = \frac{36}{6} = 6$ bows.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('59f1d757-9344-5a57-8bcb-3156b22d6d45',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{9}{10} \div \frac{3}{5}$?$q$, $q$[{"text":"$\\frac{2}{3}$","is_correct":false,"misconception_token":"flipped-both-fractions"},{"text":"$\\frac{27}{50}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$\\frac{50}{27}$","is_correct":false,"misconception_token":"flipped-dividend"},{"text":"$\\frac{3}{2}$","is_correct":true}]$q$::jsonb, $q$$\frac{3}{2}$$q$, $q$Multiply by the reciprocal: $\frac{9}{10} \times \frac{5}{3} = \frac{45}{30} = \frac{3}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2b948639-a110-5796-bce0-80cbdd51cabb',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $1\frac{1}{5} \div 2\frac{2}{5}$?$q$, $q$[{"text":"$\\frac{1}{2}$","is_correct":true},{"text":"$\\frac{25}{72}$","is_correct":false,"misconception_token":"flipped-dividend"},{"text":"$2$","is_correct":false,"misconception_token":"flipped-both-fractions"},{"text":"$\\frac{72}{25}$","is_correct":false,"misconception_token":"multiplied-instead"}]$q$::jsonb, $q$$\frac{1}{2}$$q$, $q$Write both as improper fractions: $\frac{6}{5} \div \frac{12}{5} = \frac{6}{5} \times \frac{5}{12} = \frac{30}{60} = \frac{1}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2179f1ff-478f-5379-924e-2c2c8ef97b5c',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$A pitcher holds $7\frac{1}{2}$ cups of juice. Each glass holds $\frac{5}{8}$ cup. How many full glasses can be poured?$q$, $q$[{"text":"$\\frac{16}{75}$","is_correct":false,"misconception_token":"flipped-dividend"},{"text":"$\\frac{1}{12}$","is_correct":false,"misconception_token":"flipped-both-fractions"},{"text":"$\\frac{75}{16}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$12$","is_correct":true}]$q$::jsonb, $q$$12$$q$, $q$Write $7\frac{1}{2}$ as $\frac{15}{2}$: $\frac{15}{2} \div \frac{5}{8} = \frac{15}{2} \times \frac{8}{5} = \frac{120}{10} = 12$ glasses.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c948b87f-986e-5630-9aef-58774f9b47cf',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$What is $5\frac{1}{4} \div 1\frac{3}{4}$?$q$, $q$[{"text":"$3$","is_correct":true},{"text":"$\\frac{147}{16}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$\\frac{1}{3}$","is_correct":false,"misconception_token":"flipped-both-fractions"},{"text":"$\\frac{16}{147}$","is_correct":false,"misconception_token":"flipped-dividend"}]$q$::jsonb, $q$$3$$q$, $q$Write both as improper fractions: $\frac{21}{4} \div \frac{7}{4} = \frac{21}{4} \times \frac{4}{7} = \frac{84}{28} = 3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8fd5fd81-778e-554d-bb22-1c729ca4d67d',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$There is $\frac{7}{8}$ of a pan of cornbread left. Each person is served $\frac{7}{16}$ of a pan. How many people can be served?$q$, $q$[{"text":"$\\frac{49}{128}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$\\frac{128}{49}$","is_correct":false,"misconception_token":"flipped-dividend"},{"text":"$2$","is_correct":true},{"text":"$\\frac{1}{2}$","is_correct":false,"misconception_token":"flipped-both-fractions"}]$q$::jsonb, $q$$2$$q$, $q$Divide the amount left by the serving size: $\frac{7}{8} \div \frac{7}{16} = \frac{7}{8} \times \frac{16}{7} = \frac{112}{56} = 2$ people.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('37abcefd-8964-53ea-9e2e-4986d81c9341',
   null,
   (select id from public.skills where slug = 'divide-fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$A board is $10\frac{1}{2}$ feet long. After $\frac{3}{4}$ foot is trimmed off and discarded, the rest is cut into $\frac{3}{4}$-foot pieces. How many pieces are made?$q$, $q$[{"text":"$13$","is_correct":true},{"text":"$\\frac{117}{16}$","is_correct":false,"misconception_token":"multiplied-instead"},{"text":"$\\frac{16}{117}$","is_correct":false,"misconception_token":"flipped-dividend"},{"text":"$14$","is_correct":false,"misconception_token":"skipped-the-trim-step"}]$q$::jsonb, $q$$13$$q$, $q$First subtract the trim: $10\frac{1}{2} - \frac{3}{4} = \frac{42}{4} - \frac{3}{4} = \frac{39}{4}$. Then $\frac{39}{4} \div \frac{3}{4} = \frac{39}{4} \times \frac{4}{3} = \frac{39}{3} = 13$ pieces.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- one-step-equations (One-Step Equations, grade 6, CCSS.MATH.CONTENT.6.EE.B.7) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('840665a2-6771-5930-9993-25cb0b1f97c6',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $x + 7 = 12$.$q$, $q$[{"text":"84","is_correct":false,"misconception_token":"multiplied-instead-of-subtracting"},{"text":"5","is_correct":true},{"text":"19","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"-5","is_correct":false,"misconception_token":"subtracted-in-wrong-order"}]$q$::jsonb, $q$5$q$, $q$Subtract 7 from both sides: $x = 12 - 7 = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('72ff6ab3-bc84-50ec-9f3d-5d65446be169',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $5x = 40$.$q$, $q$[{"text":"200","is_correct":false,"misconception_token":"multiplied-instead-of-dividing"},{"text":"35","is_correct":false,"misconception_token":"subtracted-instead-of-dividing"},{"text":"8","is_correct":true},{"text":"45","is_correct":false,"misconception_token":"added-instead-of-dividing"}]$q$::jsonb, $q$8$q$, $q$Divide both sides by 5: $x = 40 \div 5 = 8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3eac0120-1eec-5595-a59a-fd9374b8c993',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $3x = 21$.$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"subtracted-instead-of-dividing"},{"text":"7","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"added-instead-of-dividing"},{"text":"63","is_correct":false,"misconception_token":"multiplied-instead-of-dividing"}]$q$::jsonb, $q$7$q$, $q$Divide both sides by 3: $x = 21 \div 3 = 7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8a8753db-e86c-525e-b941-cddd79c0d608',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $x + 12 = 30$.$q$, $q$[{"text":"42","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"-18","is_correct":false,"misconception_token":"subtracted-in-wrong-order"},{"text":"18","is_correct":true},{"text":"360","is_correct":false,"misconception_token":"multiplied-instead-of-subtracting"}]$q$::jsonb, $q$18$q$, $q$Subtract 12 from both sides: $x = 30 - 12 = 18$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5e6c825e-33f2-5cf6-b2bc-f5f7ec005996',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $9x = 72$.$q$, $q$[{"text":"63","is_correct":false,"misconception_token":"subtracted-instead-of-dividing"},{"text":"81","is_correct":false,"misconception_token":"added-instead-of-dividing"},{"text":"8","is_correct":true},{"text":"648","is_correct":false,"misconception_token":"multiplied-instead-of-dividing"}]$q$::jsonb, $q$8$q$, $q$Divide both sides by 9: $x = 72 \div 9 = 8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('60fdb7e0-cf6e-57ab-98cc-0b8446f15774',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $x + 15 = 40$.$q$, $q$[{"text":"600","is_correct":false,"misconception_token":"multiplied-instead-of-subtracting"},{"text":"-25","is_correct":false,"misconception_token":"subtracted-in-wrong-order"},{"text":"55","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"25","is_correct":true}]$q$::jsonb, $q$25$q$, $q$Subtract 15 from both sides: $x = 40 - 15 = 25$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('da53bb26-ecd6-5c11-a691-ffbb93dd14f3',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $6x = 54$.$q$, $q$[{"text":"48","is_correct":false,"misconception_token":"subtracted-instead-of-dividing"},{"text":"9","is_correct":true},{"text":"324","is_correct":false,"misconception_token":"multiplied-instead-of-dividing"},{"text":"60","is_correct":false,"misconception_token":"added-instead-of-dividing"}]$q$::jsonb, $q$9$q$, $q$Divide both sides by 6: $x = 54 \div 6 = 9$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cc9b0ea9-7c51-584e-995b-dccb602a0044',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'easy',
   $q$Solve for $x$: $8x = 64$.$q$, $q$[{"text":"512","is_correct":false,"misconception_token":"multiplied-instead-of-dividing"},{"text":"56","is_correct":false,"misconception_token":"subtracted-instead-of-dividing"},{"text":"72","is_correct":false,"misconception_token":"added-instead-of-dividing"},{"text":"8","is_correct":true}]$q$::jsonb, $q$8$q$, $q$Divide both sides by 8: $x = 64 \div 8 = 8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('44754f65-cb01-5c42-9a0c-8c800692c9f2',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'medium',
   $q$Solve for $x$: $2.5x = 10$.$q$, $q$[{"text":"4","is_correct":true},{"text":"25","is_correct":false,"misconception_token":"multiplied-instead-of-dividing"},{"text":"12.5","is_correct":false,"misconception_token":"added-instead-of-dividing"},{"text":"7.5","is_correct":false,"misconception_token":"subtracted-instead-of-dividing"}]$q$::jsonb, $q$4$q$, $q$Divide both sides by 2.5: $x = 10 \div 2.5 = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9f3a8eb2-9f0d-5b64-b106-20fad7abae6c',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'medium',
   $q$Solve for $x$: $x + \frac{1}{3} = \frac{5}{6}$.$q$, $q$[{"text":"$\\frac{7}{6}$","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"$\\frac{4}{3}$","is_correct":false,"misconception_token":"subtracted-tops-and-bottoms"},{"text":"$\\frac{1}{2}$","is_correct":true},{"text":"$\\frac{2}{3}$","is_correct":false,"misconception_token":"skipped-common-denominator"}]$q$::jsonb, $q$$\frac{1}{2}$$q$, $q$Subtract $\frac{1}{3}$ from both sides: $x = \frac{5}{6} - \frac{2}{6} = \frac{3}{6} = \frac{1}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8481a3e1-434d-5882-aaea-b090bba95c29',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'medium',
   $q$Kevin bought 6 identical notebooks for 18 dollars in all. If $x$ is the cost of one notebook, then $6x = 18$. How much does one notebook cost?$q$, $q$[{"text":"24 dollars","is_correct":false,"misconception_token":"added-instead-of-dividing"},{"text":"108 dollars","is_correct":false,"misconception_token":"multiplied-instead-of-dividing"},{"text":"3 dollars","is_correct":true},{"text":"12 dollars","is_correct":false,"misconception_token":"subtracted-instead-of-dividing"}]$q$::jsonb, $q$3 dollars$q$, $q$Divide both sides by 6: $x = 18 \div 6 = 3$, so one notebook costs 3 dollars.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ac62fb0a-d53b-560f-ba9e-1697346527b5',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'medium',
   $q$After depositing 45 dollars, Ana's account balance is 120 dollars. If $x$ is her starting balance, then $x + 45 = 120$. What was her starting balance?$q$, $q$[{"text":"-75 dollars","is_correct":false,"misconception_token":"subtracted-in-wrong-order"},{"text":"75 dollars","is_correct":true},{"text":"5400 dollars","is_correct":false,"misconception_token":"multiplied-instead-of-subtracting"},{"text":"165 dollars","is_correct":false,"misconception_token":"added-instead-of-subtracting"}]$q$::jsonb, $q$75 dollars$q$, $q$Subtract 45 from both sides: $x = 120 - 45 = 75$, so her starting balance was 75 dollars.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c4ccc878-4079-5a8e-9b93-261a104ed506',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'medium',
   $q$Solve for $x$: $\frac{2}{3}x = 8$.$q$, $q$[{"text":"$\\frac{16}{3}$","is_correct":false,"misconception_token":"multiplied-by-fraction-not-reciprocal"},{"text":"12","is_correct":true},{"text":"4","is_correct":false,"misconception_token":"divided-by-numerator-only"},{"text":"24","is_correct":false,"misconception_token":"multiplied-by-denominator-only"}]$q$::jsonb, $q$12$q$, $q$Multiply both sides by the reciprocal $\frac{3}{2}$: $x = 8 \times \frac{3}{2} = 12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cb02ca23-fe4e-53b6-a9dd-775bba695d71',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'medium',
   $q$Solve for $x$: $x + 6.4 = 10$.$q$, $q$[{"text":"64","is_correct":false,"misconception_token":"multiplied-instead-of-subtracting"},{"text":"3.6","is_correct":true},{"text":"16.4","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"-3.6","is_correct":false,"misconception_token":"subtracted-in-wrong-order"}]$q$::jsonb, $q$3.6$q$, $q$Subtract 6.4 from both sides: $x = 10 - 6.4 = 3.6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9edb61e8-61dc-54f2-8f9a-a9fdd37f1de5',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'medium',
   $q$A car travels at a constant 60 miles per hour and covers 240 miles in $x$ hours, so $60x = 240$. How many hours did it travel?$q$, $q$[{"text":"180","is_correct":false,"misconception_token":"subtracted-instead-of-dividing"},{"text":"14400","is_correct":false,"misconception_token":"multiplied-instead-of-dividing"},{"text":"300","is_correct":false,"misconception_token":"added-instead-of-dividing"},{"text":"4","is_correct":true}]$q$::jsonb, $q$4$q$, $q$Divide both sides by 60: $x = 240 \div 60 = 4$, so the car traveled 4 hours.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d038b0bb-89f1-59b2-9e79-760d526cdf43',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'medium',
   $q$Which equation represents: seven more than a number $n$ is 22?$q$, $q$[{"text":"$n + 7 = 22$","is_correct":true},{"text":"$n - 7 = 22$","is_correct":false,"misconception_token":"subtracted-instead-of-adding"},{"text":"$n + 22 = 7$","is_correct":false,"misconception_token":"reversed-the-equation"},{"text":"$7n = 22$","is_correct":false,"misconception_token":"multiplied-instead-of-adding"}]$q$::jsonb, $q$$n + 7 = 22$$q$, $q$Seven more than $n$ means $n + 7$, and it equals 22, so the equation is $n + 7 = 22$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('969e3f6e-9b7f-50be-927f-e29919855d64',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'hard',
   $q$Solve for $x$: $\frac{3}{4}x = \frac{9}{8}$.$q$, $q$[{"text":"$\\frac{27}{8}$","is_correct":false,"misconception_token":"multiplied-by-numerator-only"},{"text":"$\\frac{3}{8}$","is_correct":false,"misconception_token":"subtracted-the-coefficient"},{"text":"$\\frac{27}{32}$","is_correct":false,"misconception_token":"multiplied-by-fraction-not-reciprocal"},{"text":"$\\frac{3}{2}$","is_correct":true}]$q$::jsonb, $q$$\frac{3}{2}$$q$, $q$Multiply both sides by the reciprocal $\frac{4}{3}$: $x = \frac{9}{8} \times \frac{4}{3} = \frac{36}{24} = \frac{3}{2}$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3c525f78-b888-5030-b124-13919c3f4db2',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'hard',
   $q$A recipe needs 2.75 cups of flour in total. After adding some flour, you add 0.8 cup more to reach the full amount. If $x$ is the amount you added first, then $x + 0.8 = 2.75$. How much did you add first?$q$, $q$[{"text":"1.95 cups","is_correct":true},{"text":"3.55 cups","is_correct":false,"misconception_token":"added-instead-of-subtracting"},{"text":"2.2 cups","is_correct":false,"misconception_token":"multiplied-instead-of-subtracting"},{"text":"-1.95 cups","is_correct":false,"misconception_token":"subtracted-in-wrong-order"}]$q$::jsonb, $q$1.95 cups$q$, $q$Subtract 0.8 from both sides: $x = 2.75 - 0.8 = 1.95$, so you added 1.95 cups first.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b96880b9-0699-5ed6-9b2a-d74661633343',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'hard',
   $q$A trail is divided into equal segments, each $\frac{2}{5}$ of a mile long, and the whole trail is 6 miles. If $x$ is the number of segments, then $\frac{2}{5}x = 6$. How many segments are there?$q$, $q$[{"text":"$\\frac{12}{5}$","is_correct":false,"misconception_token":"multiplied-instead-of-dividing"},{"text":"30","is_correct":false,"misconception_token":"multiplied-by-denominator-only"},{"text":"15","is_correct":true},{"text":"3","is_correct":false,"misconception_token":"divided-by-numerator-only"}]$q$::jsonb, $q$15$q$, $q$Multiply both sides by the reciprocal $\frac{5}{2}$: $x = 6 \times \frac{5}{2} = 15$ segments.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('88f61ae2-7348-52c8-a56a-9bbe3b70301e',
   null,
   (select id from public.skills where slug = 'one-step-equations'),
   'algebra', 'hard',
   $q$Priya bought tickets that cost 2.50 dollars each and spent 17.50 dollars in all. If $x$ is the number of tickets, then $2.5x = 17.5$. How many tickets did she buy?$q$, $q$[{"text":"43.75","is_correct":false,"misconception_token":"multiplied-instead-of-dividing"},{"text":"7","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"subtracted-instead-of-dividing"},{"text":"20","is_correct":false,"misconception_token":"added-instead-of-dividing"}]$q$::jsonb, $q$7$q$, $q$Divide both sides by 2.5: $x = 17.5 \div 2.5 = 7$, so she bought 7 tickets.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- area-surface-volume-6 (Area, Surface Area & Volume, grade 6, CCSS.MATH.CONTENT.6.G.A.1) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('48957bca-eed3-54ba-ac64-eb82c7455f46',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'easy',
   $q$A parallelogram has a base of $8$ cm and a height of $5$ cm. What is its area in square centimeters?$q$, $q$[{"text":"26","is_correct":false,"misconception_token":"used-perimeter"},{"text":"40","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"halved-like-triangle"},{"text":"13","is_correct":false,"misconception_token":"added-base-height"}]$q$::jsonb, $q$40$q$, $q$Area of a parallelogram is base times height: $8 \times 5 = 40$ square centimeters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1202be2e-0a02-5374-a2a3-3426c5886461',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'easy',
   $q$A triangle has a base of $6$ in and a height of $4$ in. What is its area in square inches?$q$, $q$[{"text":"12","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"added-base-height"},{"text":"24","is_correct":false,"misconception_token":"forgot-to-halve"},{"text":"5","is_correct":false,"misconception_token":"halved-sum"}]$q$::jsonb, $q$12$q$, $q$Area of a triangle is $\frac{1}{2} \times 6 \times 4 = 12$ square inches.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c37a2a8c-db74-5b92-afa1-6841224e0095',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'easy',
   $q$A rectangular prism is $3$ cm long, $4$ cm wide, and $5$ cm tall. What is its volume in cubic centimeters?$q$, $q$[{"text":"20","is_correct":false,"misconception_token":"used-two-dimensions"},{"text":"60","is_correct":true},{"text":"94","is_correct":false,"misconception_token":"found-surface-area"},{"text":"12","is_correct":false,"misconception_token":"added-edges"}]$q$::jsonb, $q$60$q$, $q$Volume is length times width times height: $3 \times 4 \times 5 = 60$ cubic centimeters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f970bbc3-e51e-59eb-af2a-5636038c245a',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'easy',
   $q$A triangle has a base of $10$ m and a height of $3$ m. What is its area in square meters?$q$, $q$[{"text":"15","is_correct":true},{"text":"30","is_correct":false,"misconception_token":"forgot-to-halve"},{"text":"13","is_correct":false,"misconception_token":"added-base-height"},{"text":"6.5","is_correct":false,"misconception_token":"halved-sum"}]$q$::jsonb, $q$15$q$, $q$Area of a triangle is $\frac{1}{2} \times 10 \times 3 = 15$ square meters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bc55e172-28ad-5388-ab49-e4b44d27c68f',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'easy',
   $q$A parallelogram has a base of $12$ ft and a height of $7$ ft. What is its area in square feet?$q$, $q$[{"text":"19","is_correct":false,"misconception_token":"added-base-height"},{"text":"42","is_correct":false,"misconception_token":"halved-like-triangle"},{"text":"38","is_correct":false,"misconception_token":"used-perimeter"},{"text":"84","is_correct":true}]$q$::jsonb, $q$84$q$, $q$Area of a parallelogram is base times height: $12 \times 7 = 84$ square feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('648df9ad-f193-5535-8448-e3fe8e78ab0e',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'easy',
   $q$A cube has an edge length of $4$ cm. Using its net, what is the total surface area in square centimeters?$q$, $q$[{"text":"24","is_correct":false,"misconception_token":"multiplied-edge-by-six"},{"text":"64","is_correct":false,"misconception_token":"found-volume"},{"text":"16","is_correct":false,"misconception_token":"one-face-only"},{"text":"96","is_correct":true}]$q$::jsonb, $q$96$q$, $q$A cube's net has $6$ square faces, each $4 \times 4 = 16$, so the surface area is $6 \times 16 = 96$ square centimeters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('396a434a-07b2-5c20-a51c-45f59a2864f0',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'easy',
   $q$A rectangular prism measures $2$ cm by $5$ cm by $6$ cm. What is its volume in cubic centimeters?$q$, $q$[{"text":"30","is_correct":false,"misconception_token":"used-two-dimensions"},{"text":"13","is_correct":false,"misconception_token":"added-edges"},{"text":"60","is_correct":true},{"text":"104","is_correct":false,"misconception_token":"found-surface-area"}]$q$::jsonb, $q$60$q$, $q$Volume is $2 \times 5 \times 6 = 60$ cubic centimeters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2243024b-6702-5ca5-bca0-89776729e140',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'easy',
   $q$A triangle has a base of $8$ cm and a height of $9$ cm. What is its area in square centimeters?$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"halved-sum"},{"text":"72","is_correct":false,"misconception_token":"forgot-to-halve"},{"text":"36","is_correct":true},{"text":"17","is_correct":false,"misconception_token":"added-base-height"}]$q$::jsonb, $q$36$q$, $q$Area of a triangle is $\frac{1}{2} \times 8 \times 9 = 36$ square centimeters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4f7da3cd-34b7-5085-a94b-f63953733ed8',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'medium',
   $q$A triangular garden has a base of $14$ m and a height of $6$ m. How many square meters of soil are needed to cover it?$q$, $q$[{"text":"42","is_correct":true},{"text":"84","is_correct":false,"misconception_token":"forgot-to-halve"},{"text":"10","is_correct":false,"misconception_token":"halved-sum"},{"text":"20","is_correct":false,"misconception_token":"added-base-height"}]$q$::jsonb, $q$42$q$, $q$Area of the triangular garden is $\frac{1}{2} \times 14 \times 6 = 42$ square meters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c3394c40-a6c4-5cc2-9036-45cd6a87b8ff',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'medium',
   $q$A small box has edge lengths of $\frac{1}{2}$ ft, $4$ ft, and $3$ ft. What is its volume in cubic feet?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"ignored-fraction"},{"text":"24","is_correct":false,"misconception_token":"doubled-instead-of-halved"},{"text":"6","is_correct":true},{"text":"7.5","is_correct":false,"misconception_token":"added-edges"}]$q$::jsonb, $q$6$q$, $q$Volume is $\frac{1}{2} \times 4 \times 3 = 6$ cubic feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3b101cb6-3e17-5f45-93d5-0e3fd7d37726',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'medium',
   $q$A house-shaped figure is made of a rectangle that is $8$ cm wide and $5$ cm tall with a triangular roof on top that has a base of $8$ cm and a height of $4$ cm. What is the total area in square centimeters?$q$, $q$[{"text":"40","is_correct":false,"misconception_token":"forgot-triangle"},{"text":"72","is_correct":false,"misconception_token":"triangle-not-halved"},{"text":"56","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"forgot-rectangle"}]$q$::jsonb, $q$56$q$, $q$The rectangle is $8 \times 5 = 40$ and the triangle is $\frac{1}{2} \times 8 \times 4 = 16$, so the total is $40 + 16 = 56$ square centimeters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8c467af6-53a3-5975-a98e-49128fb2d175',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'medium',
   $q$A storage box is $5$ ft long, $3$ ft wide, and $2$ ft tall. How many cubic feet of space does it hold?$q$, $q$[{"text":"15","is_correct":false,"misconception_token":"used-two-dimensions"},{"text":"10","is_correct":false,"misconception_token":"added-edges"},{"text":"62","is_correct":false,"misconception_token":"found-surface-area"},{"text":"30","is_correct":true}]$q$::jsonb, $q$30$q$, $q$Volume is $5 \times 3 \times 2 = 30$ cubic feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('df5ee6cb-7d6f-599a-9076-6d032942d91b',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'medium',
   $q$A gift box shaped like a rectangular prism is $6$ in by $4$ in by $2$ in. Using its net, how many square inches of wrapping paper cover the whole outside?$q$, $q$[{"text":"48","is_correct":false,"misconception_token":"found-volume"},{"text":"88","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"one-face-only"},{"text":"44","is_correct":false,"misconception_token":"forgot-to-double"}]$q$::jsonb, $q$88$q$, $q$Surface area is $2(6 \times 4 + 6 \times 2 + 4 \times 2) = 2(24 + 12 + 8) = 88$ square inches.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f5b8af0a-d3b2-5d90-94ed-bdb76a129798',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'medium',
   $q$A block has edge lengths of $\frac{3}{4}$ in, $2$ in, and $4$ in. What is its volume in cubic inches?$q$, $q$[{"text":"24","is_correct":false,"misconception_token":"used-numerator-only"},{"text":"8","is_correct":false,"misconception_token":"ignored-fraction"},{"text":"6","is_correct":true},{"text":"6.75","is_correct":false,"misconception_token":"added-edges"}]$q$::jsonb, $q$6$q$, $q$Volume is $\frac{3}{4} \times 2 \times 4 = \frac{3}{4} \times 8 = 6$ cubic inches.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('920203fc-d379-5ec7-b0cd-b6fa9690d6f3',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'medium',
   $q$A parking space shaped like a parallelogram has a base of $9$ m and a height of $2.5$ m. What is its area in square meters?$q$, $q$[{"text":"11.25","is_correct":false,"misconception_token":"halved-like-triangle"},{"text":"11.5","is_correct":false,"misconception_token":"added-base-height"},{"text":"23","is_correct":false,"misconception_token":"used-perimeter"},{"text":"22.5","is_correct":true}]$q$::jsonb, $q$22.5$q$, $q$Area of a parallelogram is base times height: $9 \times 2.5 = 22.5$ square meters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e993c363-4cf7-54b6-9157-a6a1b604b67d',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'medium',
   $q$An L-shaped room fits inside a $12$ ft by $9$ ft rectangle, but a $5$ ft by $4$ ft rectangular corner is not part of the room. What is the room's floor area in square feet?$q$, $q$[{"text":"88","is_correct":true},{"text":"128","is_correct":false,"misconception_token":"added-cutout"},{"text":"68","is_correct":false,"misconception_token":"doubled-cutout"},{"text":"108","is_correct":false,"misconception_token":"forgot-cutout"}]$q$::jsonb, $q$88$q$, $q$The full rectangle is $12 \times 9 = 108$ and the missing corner is $5 \times 4 = 20$, so the area is $108 - 20 = 88$ square feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('17a1f6e8-fed9-5855-a958-ad2c6fc5e1e8',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'hard',
   $q$A triangular sign has an area of $54$ square centimeters and a base of $12$ cm. What is its height in centimeters?$q$, $q$[{"text":"108","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"42","is_correct":false,"misconception_token":"subtracted-base"},{"text":"4.5","is_correct":false,"misconception_token":"forgot-double"},{"text":"9","is_correct":true}]$q$::jsonb, $q$9$q$, $q$From $\frac{1}{2} \times 12 \times h = 54$, the height is $h = \frac{2 \times 54}{12} = \frac{108}{12} = 9$ centimeters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9bb51c24-9c95-51a8-a661-319306b04468',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'hard',
   $q$A fish tank is $30$ cm long, $20$ cm wide, and $25$ cm tall. If $1000$ cubic centimeters equals $1$ liter, how many liters does the full tank hold?$q$, $q$[{"text":"15","is_correct":true},{"text":"15000","is_correct":false,"misconception_token":"forgot-conversion"},{"text":"1.5","is_correct":false,"misconception_token":"divided-by-10000"},{"text":"150","is_correct":false,"misconception_token":"divided-by-100"}]$q$::jsonb, $q$15$q$, $q$The volume is $30 \times 20 \times 25 = 15000$ cubic centimeters, and $15000 \div 1000 = 15$ liters.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('adacec47-59e3-56d2-bea9-e608d36f0c34',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'hard',
   $q$A shipping crate shaped like a rectangular prism is $8$ ft by $5$ ft by $3$ ft. How many square feet of cardboard are needed to cover all six faces?$q$, $q$[{"text":"120","is_correct":false,"misconception_token":"found-volume"},{"text":"79","is_correct":false,"misconception_token":"forgot-to-double"},{"text":"158","is_correct":true},{"text":"316","is_correct":false,"misconception_token":"over-doubled"}]$q$::jsonb, $q$158$q$, $q$Surface area is $2(8 \times 5 + 8 \times 3 + 5 \times 3) = 2(40 + 24 + 15) = 2 \times 79 = 158$ square feet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d4225d3b-278a-53c7-9dd8-a1a323ce2e37',
   null,
   (select id from public.skills where slug = 'area-surface-volume-6'),
   'geometry-trigonometry', 'hard',
   $q$A solid concrete block is a $6$ cm by $4$ cm by $2$ cm rectangular prism with a $2$ cm by $2$ cm by $2$ cm cube cut out of one corner. What is the volume of the remaining solid in cubic centimeters?$q$, $q$[{"text":"40","is_correct":true},{"text":"56","is_correct":false,"misconception_token":"added-cutout"},{"text":"32","is_correct":false,"misconception_token":"doubled-cutout"},{"text":"48","is_correct":false,"misconception_token":"forgot-cutout"}]$q$::jsonb, $q$40$q$, $q$The full prism is $6 \times 4 \times 2 = 48$ and the removed cube is $2 \times 2 \times 2 = 8$, so the remaining volume is $48 - 8 = 40$ cubic centimeters.$q$, 'published')
on conflict (id) do update set
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
