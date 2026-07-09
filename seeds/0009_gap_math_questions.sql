-- PathwayEd — Question Engine: elementary math GAP-FILL skills + questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-gap-math-seeds.ts from the
-- curated pool in src/lib/gapMathTemplates.ts. HOW TO APPLY (self-contained —
-- creates the domains + skills with their CCSS tags, then the questions):
--   bun run db:seed seeds/0009_gap_math_questions.sql
-- Idempotent (deterministic ids). Depends on migration 0004 (generated_questions),
-- the re-level migration (skills.ccss_grade/ccss_grade_num/ccss_code), and seed
-- 0001 (public.skills root subject rows).
--
-- 100% ORIGINAL items written to a single exact Common Core grade standard, in
-- grade-appropriate language — no published curriculum, workbook, or test copied.

begin;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-nbt')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Number & Operations in Base Ten', null, '3-5', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-place-value')::uuid, 'skill', md5('pe-aos:dom-math-nbt')::uuid, 'math', 'Place Value', 'place-value', '3-5', 'problem-solving-data-analysis', '3', 3, 'CCSS.MATH.CONTENT.3.NBT.A', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-rounding')::uuid, 'skill', md5('pe-aos:dom-math-nbt')::uuid, 'math', 'Rounding', 'rounding', '3-5', 'problem-solving-data-analysis', '3', 3, 'CCSS.MATH.CONTENT.3.NBT.A.1', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-multi-digit-add-subtract')::uuid, 'skill', md5('pe-aos:dom-math-nbt')::uuid, 'math', 'Adding & Subtracting Within 1,000', 'multi-digit-add-subtract', '3-5', 'problem-solving-data-analysis', '3', 3, 'CCSS.MATH.CONTENT.3.NBT.A.2', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-md')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Measurement & Data', null, '3-5', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-measurement-and-data')::uuid, 'skill', md5('pe-aos:dom-math-md')::uuid, 'math', 'Measurement & Data', 'measurement-and-data', '3-5', 'problem-solving-data-analysis', '3', 3, 'CCSS.MATH.CONTENT.3.MD.A', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-geo')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Geometry', null, '3-5', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-early-geometry')::uuid, 'skill', md5('pe-aos:dom-math-geo')::uuid, 'math', 'Shapes & Their Attributes', 'early-geometry', '3-5', 'geometry-trigonometry', '3', 3, 'CCSS.MATH.CONTENT.3.G.A', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-volume')::uuid, 'skill', md5('pe-aos:dom-math-md')::uuid, 'math', 'Volume', 'volume', '3-5', 'geometry-trigonometry', '5', 5, 'CCSS.MATH.CONTENT.5.MD.C.5', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- place-value (Place Value, grade 3, CCSS.MATH.CONTENT.3.NBT.A) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('969f705b-4c69-5079-bae7-a32d0f4760f5',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'easy',
   $q$In the number 372, what is the value of the digit 7?$q$, $q$[{"text":"2","is_correct":false,"misconception_token":"read-wrong-digit"},{"text":"70","is_correct":true},{"text":"7","is_correct":false,"misconception_token":"used-digit-not-value"},{"text":"700","is_correct":false,"misconception_token":"place-value-off-by-one"}]$q$::jsonb, $q$70$q$, $q$The 7 is in the tens place, so its value is 7 tens, which is 70. The digit by itself is 7, 700 would be the hundreds place, and 2 is the ones digit.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e9e8de05-a1f8-507f-a2e6-4c58850be6aa',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'easy',
   $q$In the number 845, which digit is in the hundreds place?$q$, $q$[{"text":"8","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"miscounted-place"},{"text":"4","is_correct":false,"misconception_token":"wrong-place-named"},{"text":"800","is_correct":false,"misconception_token":"used-value-not-digit"}]$q$::jsonb, $q$8$q$, $q$Reading from the left, 8 is in the hundreds place, 4 in the tens, 5 in the ones. The question asks for the digit, which is 8 (800 is its value, not the digit).$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8e563225-d5e8-54a1-8c8d-a617e2c53353',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'easy',
   $q$What is 3 times 40?$q$, $q$[{"text":"43","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"120","is_correct":true},{"text":"1,200","is_correct":false,"misconception_token":"extra-zero"},{"text":"12","is_correct":false,"misconception_token":"forgot-the-zero"}]$q$::jsonb, $q$120$q$, $q$3 times 40 is 3 times 4 tens, which is 12 tens, or 120. 12 forgets the ten, 43 adds instead of multiplying, and 1,200 has an extra zero.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7539f1e6-4d8d-5c02-b2ea-3bd438ca38c8',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'easy',
   $q$What is 100 more than 623?$q$, $q$[{"text":"723","is_correct":true},{"text":"633","is_correct":false,"misconception_token":"added-to-wrong-place"},{"text":"624","is_correct":false,"misconception_token":"wrong-amount-changed"},{"text":"523","is_correct":false,"misconception_token":"subtracted-instead"}]$q$::jsonb, $q$723$q$, $q$100 more changes the hundreds digit: 6 hundreds plus 1 hundred is 7 hundreds, so 723. 633 adds to the tens, 624 adds only one, and 523 is 100 less.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0351efff-2cf5-50b8-8cb7-ab4d7102120d',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'easy',
   $q$What number is 400 + 30 + 8?$q$, $q$[{"text":"4,308","is_correct":false,"misconception_token":"kept-the-zeros"},{"text":"15","is_correct":false,"misconception_token":"added-the-parts"},{"text":"483","is_correct":false,"misconception_token":"digits-reversed"},{"text":"438","is_correct":true}]$q$::jsonb, $q$438$q$, $q$400 + 30 + 8 combines to 438 — 4 hundreds, 3 tens, 8 ones. 4,308 keeps the zeros, 483 swaps the tens and ones, and 15 just adds the digits.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('27799956-38c4-586e-9209-bd7a2018f1ea',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'easy',
   $q$Which number is greater, 528 or 582?$q$, $q$[{"text":"285","is_correct":false,"misconception_token":"digits-reversed"},{"text":"They are equal","is_correct":false,"misconception_token":"thought-equal"},{"text":"528","is_correct":false,"misconception_token":"compared-wrong-place"},{"text":"582","is_correct":true}]$q$::jsonb, $q$582$q$, $q$Both have 5 hundreds, so compare the tens: 8 tens (582) beats 2 tens (528), so 582 is greater. They are not equal, and reversing the digits makes a different number.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0aa1ecfd-48c8-5144-868b-f73a1bb90f5e',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'easy',
   $q$How many tens are in the number 60?$q$, $q$[{"text":"0","is_correct":false,"misconception_token":"read-wrong-digit"},{"text":"60","is_correct":false,"misconception_token":"no-change"},{"text":"6","is_correct":true},{"text":"600","is_correct":false,"misconception_token":"extra-zero"}]$q$::jsonb, $q$6$q$, $q$60 is 6 tens. The number itself is 60, 0 is just the ones digit, and 600 is ten times too big.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('448084de-e08c-5252-a042-499593f26a47',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'easy',
   $q$In the number 405, what is the value of the digit 0?$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"read-wrong-digit"},{"text":"10","is_correct":false,"misconception_token":"zero-place-misread"},{"text":"0","is_correct":true},{"text":"45","is_correct":false,"misconception_token":"ignored-zero-placeholder"}]$q$::jsonb, $q$0$q$, $q$The 0 is in the tens place, so its value is 0 — it holds the spot so the 4 stays in the hundreds and 5 in the ones. It is not 10, you cannot skip it (that would make 45), and 5 is the ones digit.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f90464cf-953e-5708-99dd-418888838dd0',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'medium',
   $q$In the number 7,214, what is the value of the digit 2?$q$, $q$[{"text":"200","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"used-digit-not-value"},{"text":"2,000","is_correct":false,"misconception_token":"wrong-place-named"},{"text":"20","is_correct":false,"misconception_token":"place-value-off-by-one"}]$q$::jsonb, $q$200$q$, $q$In 7,214 the 2 is in the hundreds place, so its value is 200. Alone it is 2, the tens place would be 20, and the thousands place would be 2,000.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b3175e66-7958-537f-92fe-346d5e159953',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'medium',
   $q$What is 8 times 50?$q$, $q$[{"text":"40","is_correct":false,"misconception_token":"forgot-the-zero"},{"text":"58","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"400","is_correct":true},{"text":"4,000","is_correct":false,"misconception_token":"extra-zero"}]$q$::jsonb, $q$400$q$, $q$8 times 50 is 8 times 5 tens, which is 40 tens, or 400. 40 drops the ten, 58 adds instead of multiplying, and 4,000 has an extra zero.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('14de1971-9e73-596e-b552-3ef3912d3932',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'medium',
   $q$What is 10 more than 495?$q$, $q$[{"text":"595","is_correct":false,"misconception_token":"added-to-wrong-place"},{"text":"496","is_correct":false,"misconception_token":"wrong-amount-changed"},{"text":"505","is_correct":true},{"text":"485","is_correct":false,"misconception_token":"subtracted-instead"}]$q$::jsonb, $q$505$q$, $q$495 + 10 = 505 — the 9 tens and the new ten make a whole new hundred. 496 adds only one, 595 adds a hundred, and 485 is ten less.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f142ee63-ef0d-5f35-a443-9d6d3c245ae7',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'medium',
   $q$Which shows 306 in expanded form?$q$, $q$[{"text":"3 + 0 + 6","is_correct":false,"misconception_token":"used-digit-not-value"},{"text":"300 + 60","is_correct":false,"misconception_token":"place-value-off-by-one"},{"text":"30 + 6","is_correct":false,"misconception_token":"wrong-place-named"},{"text":"300 + 6","is_correct":true}]$q$::jsonb, $q$300 + 6$q$, $q$306 is 3 hundreds, 0 tens, 6 ones, so 300 + 6. Putting the 6 in the tens gives 300 + 60, using the digits gives 3 + 0 + 6, and 30 + 6 treats the 3 as tens.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('eb3f7b38-d196-59a5-a48f-77dd22dd790a',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'medium',
   $q$Which of these numbers is the greatest: 519, 591, or 195?$q$, $q$[{"text":"519","is_correct":false,"misconception_token":"compared-wrong-place"},{"text":"591","is_correct":true},{"text":"They are all equal","is_correct":false,"misconception_token":"thought-equal"},{"text":"195","is_correct":false,"misconception_token":"picked-smallest"}]$q$::jsonb, $q$591$q$, $q$591 has 5 hundreds and 9 tens — the most. 519 has only 1 ten, 195 has just 1 hundred (the smallest), and the same digits in different places are not equal.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('25169a45-036f-5a58-b5d0-d8341bf394ed',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'medium',
   $q$How many tens are in the number 240?$q$, $q$[{"text":"240","is_correct":false,"misconception_token":"no-change"},{"text":"4","is_correct":false,"misconception_token":"read-wrong-digit"},{"text":"24","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"miscounted-place"}]$q$::jsonb, $q$24$q$, $q$240 is 24 tens (240 ÷ 10 = 24). The 4 is only the tens digit, 2 is the hundreds digit, and 240 is the whole number.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('138fc39f-5246-5c9a-9075-577bef4b081a',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'medium',
   $q$Maria has 3 boxes of 100 crayons, 5 boxes of 10 crayons, and 7 single crayons. How many crayons does she have in all?$q$, $q$[{"text":"15","is_correct":false,"misconception_token":"added-the-parts"},{"text":"3,057","is_correct":false,"misconception_token":"kept-the-zeros"},{"text":"375","is_correct":false,"misconception_token":"digits-reversed"},{"text":"357","is_correct":true}]$q$::jsonb, $q$357$q$, $q$3 hundreds + 5 tens + 7 ones = 357. 3,057 keeps the zeros, 375 swaps the tens and ones, and 15 just adds the group counts (3 + 5 + 7).$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('29c7b2de-3d14-56cd-8aad-dae2feb61833',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'medium',
   $q$The pattern counts by hundreds: 218, 318, ___, 518. Which number goes in the blank?$q$, $q$[{"text":"418","is_correct":true},{"text":"419","is_correct":false,"misconception_token":"wrong-amount-changed"},{"text":"428","is_correct":false,"misconception_token":"miscounted-place"},{"text":"328","is_correct":false,"misconception_token":"counted-by-tens"}]$q$::jsonb, $q$418$q$, $q$Counting by hundreds, the hundreds digit goes up by 1 each time: 218, 318, 418, 518. 328 counts by tens, 419 adds one, and 428 jumps too far.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5c656c70-72f1-53c1-858d-eb66bdb41d8f',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'hard',
   $q$In the number 52,608, what is the value of the digit 2?$q$, $q$[{"text":"200","is_correct":false,"misconception_token":"place-value-off-by-one"},{"text":"20,000","is_correct":false,"misconception_token":"wrong-place-named"},{"text":"2","is_correct":false,"misconception_token":"used-digit-not-value"},{"text":"2,000","is_correct":true}]$q$::jsonb, $q$2,000$q$, $q$In 52,608 the 2 is in the thousands place, so its value is 2,000. Alone it is 2, the hundreds place would be 200, and the ten-thousands place would be 20,000.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('885bc618-7cb5-5644-b565-15956b3ea181',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'hard',
   $q$I am a 3-digit number. I have 4 hundreds, 0 tens, and my ones digit is 4 plus 3. What number am I?$q$, $q$[{"text":"407","is_correct":true},{"text":"470","is_correct":false,"misconception_token":"ignored-zero-placeholder"},{"text":"704","is_correct":false,"misconception_token":"digits-reversed"},{"text":"47","is_correct":false,"misconception_token":"miscounted-place"}]$q$::jsonb, $q$407$q$, $q$4 hundreds, 0 tens, and ones = 4 + 3 = 7, so the number is 407. 470 puts the zero in the wrong place, 47 drops the hundreds, and 704 reverses the digits.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5dcef54f-f9d7-5efc-b0b1-9aa4a3bea010',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'hard',
   $q$How many hundreds are in the number 1,500?$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"read-wrong-digit"},{"text":"150","is_correct":false,"misconception_token":"place-value-off-by-one"},{"text":"15","is_correct":true},{"text":"1","is_correct":false,"misconception_token":"miscounted-place"}]$q$::jsonb, $q$15$q$, $q$1,500 is 15 hundreds (1,500 ÷ 100 = 15). The 5 is only the hundreds digit, 150 counts tens (one place too small), and 1 is the thousands digit.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d082d84e-9e98-5e73-9243-d71702d126af',
   null,
   (select id from public.skills where slug = 'place-value'),
   'problem-solving-data-analysis', 'hard',
   $q$Ben says that 4 hundreds and 12 tens is the same as 520. Is he right, and what is the number?$q$, $q$[{"text":"Yes, it is 520","is_correct":true},{"text":"No, it is 52","is_correct":false,"misconception_token":"place-value-off-by-one"},{"text":"Yes, it is 4,120","is_correct":false,"misconception_token":"kept-the-zeros"},{"text":"No, it is 412","is_correct":false,"misconception_token":"treated-extra-tens-as-digits"}]$q$::jsonb, $q$Yes, it is 520$q$, $q$12 tens is 120, and 400 + 120 = 520, so Ben is right. Writing 412 treats the 12 like two separate digits, 52 is ten times too small, and 4,120 just strings the numbers together.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- rounding (Rounding, grade 3, CCSS.MATH.CONTENT.3.NBT.A.1) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cb3bb5ba-9cfc-5478-b285-2094f1ce604b',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'easy',
   $q$Round 47 to the nearest ten.$q$, $q$[{"text":"400","is_correct":false,"misconception_token":"rounded-to-wrong-place"},{"text":"50","is_correct":true},{"text":"40","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"47","is_correct":false,"misconception_token":"kept-original-number"}]$q$::jsonb, $q$50$q$, $q$The ones digit is 7, which is 5 or more, so round up to 50. 40 rounds down, 47 is the original number, and 400 rounds to the wrong place.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ff9d5c05-b4f9-5ba1-9370-2154ee380654',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'easy',
   $q$Round 62 to the nearest ten.$q$, $q$[{"text":"60","is_correct":true},{"text":"62","is_correct":false,"misconception_token":"kept-original-number"},{"text":"70","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"600","is_correct":false,"misconception_token":"rounded-to-wrong-place"}]$q$::jsonb, $q$60$q$, $q$The ones digit is 2, which is less than 5, so round down to 60.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('464eda44-10e2-5c9f-9bbc-6aa1cf3efad3',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'easy',
   $q$Round 85 to the nearest ten.$q$, $q$[{"text":"85","is_correct":false,"misconception_token":"kept-original-number"},{"text":"90","is_correct":true},{"text":"100","is_correct":false,"misconception_token":"rounded-to-wrong-place"},{"text":"80","is_correct":false,"misconception_token":"rounded-wrong-way"}]$q$::jsonb, $q$90$q$, $q$The ones digit is 5, so round up: 85 becomes 90. 100 would be rounding to the nearest hundred instead.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1edeb830-18a0-5315-87d1-138a034cb7d0',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'easy',
   $q$Round 31 to the nearest ten.$q$, $q$[{"text":"30","is_correct":true},{"text":"40","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"31","is_correct":false,"misconception_token":"kept-original-number"},{"text":"300","is_correct":false,"misconception_token":"rounded-to-wrong-place"}]$q$::jsonb, $q$30$q$, $q$The ones digit is 1, less than 5, so round down to 30.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5b31ea83-1884-57d3-8def-c1d13bdce9ab',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'easy',
   $q$Round 78 to the nearest ten.$q$, $q$[{"text":"70","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"800","is_correct":false,"misconception_token":"rounded-to-wrong-place"},{"text":"78","is_correct":false,"misconception_token":"kept-original-number"},{"text":"80","is_correct":true}]$q$::jsonb, $q$80$q$, $q$The ones digit is 8, which is 5 or more, so round up to 80.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('59ef92b7-d456-5dbf-8239-4da01d65ce64',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'easy',
   $q$Round 24 to the nearest ten.$q$, $q$[{"text":"200","is_correct":false,"misconception_token":"rounded-to-wrong-place"},{"text":"24","is_correct":false,"misconception_token":"kept-original-number"},{"text":"30","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"20","is_correct":true}]$q$::jsonb, $q$20$q$, $q$The ones digit is 4, less than 5, so round down to 20.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('383a4e26-68ec-5719-8d51-60ac3ecd8198',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'easy',
   $q$Round 56 to the nearest ten.$q$, $q$[{"text":"56","is_correct":false,"misconception_token":"kept-original-number"},{"text":"50","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"60","is_correct":true},{"text":"500","is_correct":false,"misconception_token":"rounded-to-wrong-place"}]$q$::jsonb, $q$60$q$, $q$The ones digit is 6, which is 5 or more, so round up to 60.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5578c941-cfba-5f9f-81ee-f6e7c44e0437',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'easy',
   $q$Round 93 to the nearest ten.$q$, $q$[{"text":"900","is_correct":false,"misconception_token":"rounded-to-wrong-place"},{"text":"100","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"90","is_correct":true},{"text":"93","is_correct":false,"misconception_token":"kept-original-number"}]$q$::jsonb, $q$90$q$, $q$The ones digit is 3, less than 5, so round down to 90.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('061907ef-3a7f-5567-9965-3cdc9b2aa22f',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'medium',
   $q$Round 340 to the nearest hundred.$q$, $q$[{"text":"300","is_correct":true},{"text":"400","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"350","is_correct":false,"misconception_token":"rounded-to-wrong-place"},{"text":"340","is_correct":false,"misconception_token":"kept-original-number"}]$q$::jsonb, $q$300$q$, $q$To round to the nearest hundred, look at the tens digit: 4 is less than 5, so round down to 300. 350 is rounded to the nearest ten instead.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1a834acb-98e3-54c2-9dd8-e14bab787947',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'medium',
   $q$Round 472 to the nearest hundred.$q$, $q$[{"text":"400","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"472","is_correct":false,"misconception_token":"kept-original-number"},{"text":"500","is_correct":true},{"text":"470","is_correct":false,"misconception_token":"rounded-to-wrong-place"}]$q$::jsonb, $q$500$q$, $q$The tens digit is 7, which is 5 or more, so round up to 500. 470 is rounded to the nearest ten, not hundred.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('15738c24-3822-535c-a709-08d99256f16f',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'medium',
   $q$Round 618 to the nearest hundred.$q$, $q$[{"text":"618","is_correct":false,"misconception_token":"kept-original-number"},{"text":"700","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"600","is_correct":true},{"text":"620","is_correct":false,"misconception_token":"rounded-to-wrong-place"}]$q$::jsonb, $q$600$q$, $q$The tens digit is 1, less than 5, so round down to 600.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b64b8a00-515d-5950-a78f-131035236411',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'medium',
   $q$Round 750 to the nearest hundred.$q$, $q$[{"text":"750","is_correct":false,"misconception_token":"kept-original-number"},{"text":"700","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"760","is_correct":false,"misconception_token":"rounded-to-wrong-place"},{"text":"800","is_correct":true}]$q$::jsonb, $q$800$q$, $q$The tens digit is 5, so round up: 750 becomes 800.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('193a42ed-3629-5a3b-ad5c-a350153a809c',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'medium',
   $q$Round 349 to the nearest ten.$q$, $q$[{"text":"340","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"350","is_correct":true},{"text":"300","is_correct":false,"misconception_token":"rounded-to-wrong-place"},{"text":"349","is_correct":false,"misconception_token":"kept-original-number"}]$q$::jsonb, $q$350$q$, $q$The ones digit is 9, so round up: 349 becomes 350. 300 rounds to the nearest hundred instead.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('555e19f0-04e8-5d2e-ba98-0bcc8bc7f117',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'medium',
   $q$Round 812 to the nearest ten.$q$, $q$[{"text":"800","is_correct":false,"misconception_token":"rounded-to-wrong-place"},{"text":"820","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"810","is_correct":true},{"text":"812","is_correct":false,"misconception_token":"kept-original-number"}]$q$::jsonb, $q$810$q$, $q$The ones digit is 2, less than 5, so round down to 810.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('33a9170f-8c9c-5350-9f49-594b4dbbd023',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'medium',
   $q$Round 265 to the nearest hundred.$q$, $q$[{"text":"270","is_correct":false,"misconception_token":"rounded-to-wrong-place"},{"text":"200","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"265","is_correct":false,"misconception_token":"kept-original-number"},{"text":"300","is_correct":true}]$q$::jsonb, $q$300$q$, $q$The tens digit is 6, which is 5 or more, so round up to 300.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cdd4ddb6-92c8-513a-958b-7aea58f738bf',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'medium',
   $q$A stadium holds 483 people. Rounded to the nearest hundred, about how many is that?$q$, $q$[{"text":"500","is_correct":true},{"text":"483","is_correct":false,"misconception_token":"kept-original-number"},{"text":"480","is_correct":false,"misconception_token":"rounded-to-wrong-place"},{"text":"400","is_correct":false,"misconception_token":"rounded-wrong-way"}]$q$::jsonb, $q$500$q$, $q$The tens digit is 8, so round up to 500. 480 is rounded to the nearest ten.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0871e1e6-581d-568a-8d66-6ae880bbd7ff',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'hard',
   $q$Round 950 to the nearest hundred.$q$, $q$[{"text":"950","is_correct":false,"misconception_token":"kept-original-number"},{"text":"960","is_correct":false,"misconception_token":"rounded-to-wrong-place"},{"text":"900","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"1,000","is_correct":true}]$q$::jsonb, $q$1,000$q$, $q$The tens digit is 5, so round up: 9 hundreds plus 1 more is 10 hundreds, which is 1,000.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('31536047-235f-557d-8070-1b3e6c7e08b6',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'hard',
   $q$Round 4,650 to the nearest hundred.$q$, $q$[{"text":"4,700","is_correct":true},{"text":"4,600","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"5,000","is_correct":false,"misconception_token":"rounded-to-wrong-place"},{"text":"4,650","is_correct":false,"misconception_token":"kept-original-number"}]$q$::jsonb, $q$4,700$q$, $q$The tens digit is 5, so round up: 46 hundreds becomes 47 hundreds, which is 4,700. 5,000 rounds to the nearest thousand.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('82e0abdf-0d44-55e5-a0a3-2efb73c4c867',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'hard',
   $q$Round 2,970 to the nearest hundred.$q$, $q$[{"text":"2,900","is_correct":false,"misconception_token":"rounded-wrong-way"},{"text":"2,970","is_correct":false,"misconception_token":"kept-original-number"},{"text":"3,000","is_correct":true},{"text":"2,980","is_correct":false,"misconception_token":"rounded-to-wrong-place"}]$q$::jsonb, $q$3,000$q$, $q$The tens digit is 7, so round up: 29 hundreds plus 1 is 30 hundreds, which is 3,000.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ff2e20c5-a731-5833-bfac-ba2fefcc8a7b',
   null,
   (select id from public.skills where slug = 'rounding'),
   'problem-solving-data-analysis', 'hard',
   $q$A school has 6,148 books. Rounded to the nearest hundred, about how many books is that?$q$, $q$[{"text":"6,100","is_correct":true},{"text":"6,148","is_correct":false,"misconception_token":"kept-original-number"},{"text":"6,000","is_correct":false,"misconception_token":"rounded-to-wrong-place"},{"text":"6,200","is_correct":false,"misconception_token":"rounded-wrong-way"}]$q$::jsonb, $q$6,100$q$, $q$The tens digit is 4, less than 5, so round down to 6,100. 6,000 rounds to the nearest thousand.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- multi-digit-add-subtract (Adding & Subtracting Within 1,000, grade 3, CCSS.MATH.CONTENT.3.NBT.A.2) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b6856841-71d7-5c35-8951-7155d4160289',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'easy',
   $q$What is 341 + 236?$q$, $q$[{"text":"677","is_correct":false,"misconception_token":"place-value-off-by-one"},{"text":"577","is_correct":true},{"text":"105","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"587","is_correct":false,"misconception_token":"regrouped-wrong"}]$q$::jsonb, $q$577$q$, $q$Add each place: 1 + 6 = 7 ones, 4 + 3 = 7 tens, 3 + 2 = 5 hundreds, so 577. 105 subtracts, and the others mis-add a column.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6b31235b-2cf2-51c4-9de2-a2e496a82e44',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'easy',
   $q$What is 452 - 236?$q$, $q$[{"text":"216","is_correct":true},{"text":"226","is_correct":false,"misconception_token":"regrouped-wrong"},{"text":"688","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"116","is_correct":false,"misconception_token":"place-value-off-by-one"}]$q$::jsonb, $q$216$q$, $q$452 - 236 = 216. Adding gives 688; the others mis-handle a column.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f7327626-c1c2-565c-bdf7-4773eaffb99b',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'easy',
   $q$What is 517 + 271?$q$, $q$[{"text":"798","is_correct":false,"misconception_token":"regrouped-wrong"},{"text":"788","is_correct":true},{"text":"888","is_correct":false,"misconception_token":"place-value-off-by-one"},{"text":"246","is_correct":false,"misconception_token":"subtracted-instead-of-added"}]$q$::jsonb, $q$788$q$, $q$7 + 1 = 8 ones, 1 + 7 = 8 tens, 5 + 2 = 7 hundreds, so 788.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5ed78786-a351-59b6-b473-1443839937de',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'easy',
   $q$What is 628 - 405?$q$, $q$[{"text":"223","is_correct":true},{"text":"1,033","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"233","is_correct":false,"misconception_token":"regrouped-wrong"},{"text":"123","is_correct":false,"misconception_token":"place-value-off-by-one"}]$q$::jsonb, $q$223$q$, $q$628 - 405 = 223. Adding gives 1,033.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('efb0d918-ae9b-56d2-b2b2-9c062e07bbe1',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'easy',
   $q$What is 759 - 321?$q$, $q$[{"text":"1,080","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"338","is_correct":false,"misconception_token":"place-value-off-by-one"},{"text":"448","is_correct":false,"misconception_token":"regrouped-wrong"},{"text":"438","is_correct":true}]$q$::jsonb, $q$438$q$, $q$759 - 321 = 438. Adding gives 1,080.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e6e874d2-cc4a-5657-9b81-e778631209d3',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'easy',
   $q$What is 486 - 263?$q$, $q$[{"text":"123","is_correct":false,"misconception_token":"place-value-off-by-one"},{"text":"233","is_correct":false,"misconception_token":"regrouped-wrong"},{"text":"749","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"223","is_correct":true}]$q$::jsonb, $q$223$q$, $q$486 - 263 = 223. Adding gives 749.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c21814db-34cd-5683-b169-27f221c715c8',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'easy',
   $q$What is 235 + 143?$q$, $q$[{"text":"388","is_correct":false,"misconception_token":"regrouped-wrong"},{"text":"92","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"378","is_correct":true},{"text":"478","is_correct":false,"misconception_token":"place-value-off-by-one"}]$q$::jsonb, $q$378$q$, $q$5 + 3 = 8 ones, 3 + 4 = 7 tens, 2 + 1 = 3 hundreds, so 378.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f2c7ec3f-7d4d-566e-a0b5-5b49b68051dc',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'easy',
   $q$What is 674 - 152?$q$, $q$[{"text":"422","is_correct":false,"misconception_token":"place-value-off-by-one"},{"text":"826","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"522","is_correct":true},{"text":"532","is_correct":false,"misconception_token":"regrouped-wrong"}]$q$::jsonb, $q$522$q$, $q$674 - 152 = 522. Adding gives 826.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('836882ff-19a2-556a-a82d-bb0e7a036b11',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'medium',
   $q$What is 356 + 128?$q$, $q$[{"text":"484","is_correct":true},{"text":"228","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"494","is_correct":false,"misconception_token":"regrouped-wrong"},{"text":"474","is_correct":false,"misconception_token":"forgot-to-regroup"}]$q$::jsonb, $q$484$q$, $q$6 + 8 = 14, so write 4 and carry 1 ten. Tens: 5 + 2 + 1 = 8. Hundreds: 3 + 1 = 4. Answer 484. 474 forgets the carry.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('78090cf3-aae1-5293-87a1-9e9e96bdc11d',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'medium',
   $q$What is 267 + 185?$q$, $q$[{"text":"82","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"352","is_correct":false,"misconception_token":"forgot-to-regroup"},{"text":"452","is_correct":true},{"text":"462","is_correct":false,"misconception_token":"regrouped-wrong"}]$q$::jsonb, $q$452$q$, $q$7 + 5 = 12 (carry 1). Tens: 6 + 8 + 1 = 15 (carry 1). Hundreds: 2 + 1 + 1 = 4. Answer 452. 352 drops a carry.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('44a0eda1-b343-5dce-a07f-7e13704070c1',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'medium',
   $q$What is 403 - 176?$q$, $q$[{"text":"373","is_correct":false,"misconception_token":"subtracted-smaller-from-larger"},{"text":"579","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"227","is_correct":true},{"text":"237","is_correct":false,"misconception_token":"regrouped-wrong"}]$q$::jsonb, $q$227$q$, $q$Borrow to subtract: 403 - 176 = 227. 373 wrongly takes the smaller digit from the larger in each column.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ad1577c1-6e09-5e41-bb5f-a13187e90c48',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'medium',
   $q$What is 500 - 247?$q$, $q$[{"text":"347","is_correct":false,"misconception_token":"subtracted-smaller-from-larger"},{"text":"747","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"263","is_correct":false,"misconception_token":"regrouped-wrong"},{"text":"253","is_correct":true}]$q$::jsonb, $q$253$q$, $q$Borrow across the zeros: 500 - 247 = 253. 347 subtracts each smaller digit from the larger.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c3c6a6cf-5d71-586b-8eda-a7beeb6ed4c7',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'medium',
   $q$What is 318 + 254?$q$, $q$[{"text":"64","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"572","is_correct":true},{"text":"582","is_correct":false,"misconception_token":"regrouped-wrong"},{"text":"562","is_correct":false,"misconception_token":"forgot-to-regroup"}]$q$::jsonb, $q$572$q$, $q$8 + 4 = 12 (carry 1). Tens: 1 + 5 + 1 = 7. Hundreds: 3 + 2 = 5. Answer 572. 562 forgets the carry.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6090cad9-9a5b-59f6-af73-f9ac29c0e75e',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'medium',
   $q$What is 645 - 278?$q$, $q$[{"text":"357","is_correct":false,"misconception_token":"regrouped-wrong"},{"text":"923","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"367","is_correct":true},{"text":"433","is_correct":false,"misconception_token":"subtracted-smaller-from-larger"}]$q$::jsonb, $q$367$q$, $q$Borrow twice: 645 - 278 = 367. 433 takes the smaller digit from the larger each time.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('592d001b-46cd-50ef-a345-3af47f8246b9',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'medium',
   $q$A library had 428 books and received 176 more. How many books are there now?$q$, $q$[{"text":"614","is_correct":false,"misconception_token":"regrouped-wrong"},{"text":"252","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"594","is_correct":false,"misconception_token":"forgot-to-regroup"},{"text":"604","is_correct":true}]$q$::jsonb, $q$604$q$, $q$428 + 176 = 604. "Received more" means add. 594 forgets a carry.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3a86727a-3a64-5ef1-82de-07f470f299ac',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'medium',
   $q$A theater has 750 seats. 384 are filled. How many are empty?$q$, $q$[{"text":"366","is_correct":true},{"text":"434","is_correct":false,"misconception_token":"subtracted-smaller-from-larger"},{"text":"376","is_correct":false,"misconception_token":"regrouped-wrong"},{"text":"1,134","is_correct":false,"misconception_token":"added-instead-of-subtracted"}]$q$::jsonb, $q$366$q$, $q$750 - 384 = 366 empty seats. 434 subtracts each smaller digit from the larger.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0af65dff-f527-5bf9-8f47-994ab1d17dd1',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'hard',
   $q$What is 802 - 457?$q$, $q$[{"text":"455","is_correct":false,"misconception_token":"subtracted-smaller-from-larger"},{"text":"355","is_correct":false,"misconception_token":"regrouped-wrong"},{"text":"1,259","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"345","is_correct":true}]$q$::jsonb, $q$345$q$, $q$Borrow across the zero: 802 - 457 = 345. 455 subtracts each smaller digit from the larger.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2d030c2d-8f1c-5206-8e1b-506552b80d4d',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'hard',
   $q$What is 567 + 368?$q$, $q$[{"text":"935","is_correct":true},{"text":"199","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"925","is_correct":false,"misconception_token":"regrouped-wrong"},{"text":"835","is_correct":false,"misconception_token":"forgot-to-regroup"}]$q$::jsonb, $q$935$q$, $q$7 + 8 = 15 (carry 1). Tens: 6 + 6 + 1 = 13 (carry 1). Hundreds: 5 + 3 + 1 = 9. Answer 935. 835 drops a carry.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5f3f99dc-384b-5e70-b4eb-29b079bd9c12',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'hard',
   $q$Maya had 615 stickers. She gave away 148 and then earned 90 more. How many does she have now?$q$, $q$[{"text":"853","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"377","is_correct":false,"misconception_token":"subtracted-instead-of-added"},{"text":"557","is_correct":true},{"text":"467","is_correct":false,"misconception_token":"kept-original-number"}]$q$::jsonb, $q$557$q$, $q$Two steps: 615 - 148 = 467, then 467 + 90 = 557. 467 stops after the first step, and the others use the wrong operation.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0ace7701-ecc4-52ef-9ccb-6c7bf26e3420',
   null,
   (select id from public.skills where slug = 'multi-digit-add-subtract'),
   'problem-solving-data-analysis', 'hard',
   $q$What is 906 - 429?$q$, $q$[{"text":"477","is_correct":true},{"text":"523","is_correct":false,"misconception_token":"subtracted-smaller-from-larger"},{"text":"487","is_correct":false,"misconception_token":"regrouped-wrong"},{"text":"1,335","is_correct":false,"misconception_token":"added-instead-of-subtracted"}]$q$::jsonb, $q$477$q$, $q$Borrow across the zero: 906 - 429 = 477. 523 subtracts each smaller digit from the larger.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- measurement-and-data (Measurement & Data, grade 3, CCSS.MATH.CONTENT.3.MD.A) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f62594ec-b75d-5c0d-afaa-039ec53b7d9a',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'easy',
   $q$Recess starts at 10:15 and lasts 30 minutes. What time does it end?$q$, $q$[{"text":"10:15","is_correct":false,"misconception_token":"kept-original-number"},{"text":"10:45","is_correct":true},{"text":"10:30","is_correct":false,"misconception_token":"elapsed-time-miscount"},{"text":"9:45","is_correct":false,"misconception_token":"subtracted-instead"}]$q$::jsonb, $q$10:45$q$, $q$10:15 plus 30 minutes is 10:45. 10:30 only adds 15, 9:45 subtracts, and 10:15 is the start time.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('373daea8-d4ad-58a9-8890-42fd4959a460',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'easy',
   $q$A movie starts at 4:00 and lasts 2 hours. When does it end?$q$, $q$[{"text":"6:00","is_correct":true},{"text":"2:00","is_correct":false,"misconception_token":"subtracted-instead"},{"text":"4:02","is_correct":false,"misconception_token":"wrong-measure-unit"},{"text":"4:00","is_correct":false,"misconception_token":"kept-original-number"}]$q$::jsonb, $q$6:00$q$, $q$4:00 plus 2 hours is 6:00. 4:02 added 2 minutes instead of 2 hours.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d8a5acb4-52dc-5b48-a974-51a6c884e16f',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'easy',
   $q$A picture graph shows books read: Ana 5, Ben 3, Cara 6. How many books did Ana and Ben read together?$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"misread-the-graph"},{"text":"8","is_correct":true},{"text":"14","is_correct":false,"misconception_token":"added-the-parts"},{"text":"2","is_correct":false,"misconception_token":"subtracted-instead"}]$q$::jsonb, $q$8$q$, $q$Ana 5 + Ben 3 = 8. 2 subtracts, 5 uses only Ana, and 14 adds in Cara too.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f137efd5-c740-54b1-86f9-f1a69d8e7dd6',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'easy',
   $q$A graph shows stars earned: Monday 4, Tuesday 7, Wednesday 5. How many MORE stars were earned on Tuesday than Monday?$q$, $q$[{"text":"3","is_correct":true},{"text":"11","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"7","is_correct":false,"misconception_token":"misread-the-graph"},{"text":"16","is_correct":false,"misconception_token":"added-the-parts"}]$q$::jsonb, $q$3$q$, $q$"How many more" means subtract: 7 - 4 = 3. 11 adds, 7 reads only Tuesday, 16 adds all three days.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cee2ccc1-6325-5bbf-a714-406826996c7a',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'easy',
   $q$It is 2:00 now. What time was it 1 hour ago?$q$, $q$[{"text":"3:00","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"2:00","is_correct":false,"misconception_token":"kept-original-number"},{"text":"2:01","is_correct":false,"misconception_token":"wrong-measure-unit"},{"text":"1:00","is_correct":true}]$q$::jsonb, $q$1:00$q$, $q$"Ago" means go back: 2:00 minus 1 hour is 1:00. 3:00 goes forward, 2:01 uses minutes.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('034ccb8c-fdaf-5769-9fbf-1cc6eb9b6cee',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'easy',
   $q$On a graph, each star stands for 2 books. A row has 4 stars. How many books is that?$q$, $q$[{"text":"2","is_correct":false,"misconception_token":"misread-the-graph"},{"text":"6","is_correct":false,"misconception_token":"added-the-parts"},{"text":"4","is_correct":false,"misconception_token":"wrong-scale"},{"text":"8","is_correct":true}]$q$::jsonb, $q$8$q$, $q$Each star is 2 books, so 4 stars is 4 times 2 = 8. 4 counts stars, 6 adds 2 + 4, and 2 reads only one star.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e125397d-e724-56df-9ff4-06f63dba09b2',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'easy',
   $q$A ribbon is 24 cm long. You cut off 9 cm. How long is the ribbon now?$q$, $q$[{"text":"24 cm","is_correct":false,"misconception_token":"kept-original-number"},{"text":"33 cm","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"15 cm","is_correct":true},{"text":"16 cm","is_correct":false,"misconception_token":"regrouped-wrong"}]$q$::jsonb, $q$15 cm$q$, $q$Cutting off means subtract: 24 - 9 = 15 cm. 33 adds, 24 is the original length.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f708db9f-ca06-5af3-84dd-e4482c7ac3ef',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'easy',
   $q$A bar graph shows votes: red 10, blue 20, green 15. How many votes were there in all?$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"subtracted-instead"},{"text":"35","is_correct":false,"misconception_token":"misread-the-graph"},{"text":"45","is_correct":true},{"text":"450","is_correct":false,"misconception_token":"wrong-scale"}]$q$::jsonb, $q$45$q$, $q$10 + 20 + 15 = 45. 35 drops one bar, 450 misreads the scale, and 5 subtracts.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ce891f18-361f-593b-abc9-3369a97c1866',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'medium',
   $q$Soccer practice runs from 3:30 to 5:00. How long is practice?$q$, $q$[{"text":"1 hour 30 minutes","is_correct":true},{"text":"2 hours","is_correct":false,"misconception_token":"elapsed-time-miscount"},{"text":"3 hours 30 minutes","is_correct":false,"misconception_token":"read-clock-wrong"},{"text":"8 hours 30 minutes","is_correct":false,"misconception_token":"added-instead-of-subtracted"}]$q$::jsonb, $q$1 hour 30 minutes$q$, $q$From 3:30 to 5:00 is 1 hour 30 minutes. 8:30 adds the two times together.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9a999872-6626-5fc9-9175-a217fc6fb3ed',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'medium',
   $q$A line plot shows shoe lengths: 3 shoes are 8 in, 2 shoes are 9 in, 4 shoes are 10 in. How many shoes are shown in all?$q$, $q$[{"text":"27","is_correct":false,"misconception_token":"added-the-parts"},{"text":"3","is_correct":false,"misconception_token":"misread-the-graph"},{"text":"9","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"subtracted-instead"}]$q$::jsonb, $q$9$q$, $q$Count the shoes: 3 + 2 + 4 = 9. 27 adds the lengths (8 + 9 + 10), and 3 reads only one group.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dd471a45-66bb-52ec-84b2-8e58b78c3baa',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'medium',
   $q$A movie starts at 1:45 and lasts 1 hour and 30 minutes. When does it end?$q$, $q$[{"text":"3:75","is_correct":false,"misconception_token":"wrong-measure-unit"},{"text":"2:15","is_correct":false,"misconception_token":"elapsed-time-miscount"},{"text":"3:15","is_correct":true},{"text":"1:15","is_correct":false,"misconception_token":"subtracted-instead"}]$q$::jsonb, $q$3:15$q$, $q$1:45 plus 1 hour is 2:45, plus 30 minutes is 3:15. 3:75 forgets that 60 minutes makes a new hour.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5ff6e9e2-5de7-597d-a485-5bc2a7539405',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'medium',
   $q$Each square on a graph stands for 5 minutes of reading. Sam's row has 6 squares. How many minutes did Sam read?$q$, $q$[{"text":"11","is_correct":false,"misconception_token":"added-the-parts"},{"text":"6","is_correct":false,"misconception_token":"wrong-scale"},{"text":"5","is_correct":false,"misconception_token":"misread-the-graph"},{"text":"30","is_correct":true}]$q$::jsonb, $q$30$q$, $q$Each square is 5 minutes, so 6 squares is 6 times 5 = 30 minutes. 6 counts squares, 11 adds 5 + 6.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7d6c9acb-74d3-588c-b8f3-a77ccbe2c106',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'medium',
   $q$A bottle holds 2 liters of water. How many milliliters is that? (1 liter = 1,000 milliliters)$q$, $q$[{"text":"200","is_correct":false,"misconception_token":"place-value-off-by-one"},{"text":"2,000","is_correct":true},{"text":"4,000","is_correct":false,"misconception_token":"wrong-scale"},{"text":"2","is_correct":false,"misconception_token":"wrong-measure-unit"}]$q$::jsonb, $q$2,000$q$, $q$2 liters times 1,000 = 2,000 milliliters. 200 is ten times too small, and 2 forgets to convert.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ca499cff-8d82-5240-8c8f-cab42a234b80',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'medium',
   $q$A graph shows pets: dogs 8, cats 5, fish 3, birds 2. How many more dogs are there than fish?$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"added-the-parts"},{"text":"11","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"5","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"misread-the-graph"}]$q$::jsonb, $q$5$q$, $q$8 dogs minus 3 fish = 5. 11 adds, 8 reads only dogs, 18 adds all the pets.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('04dc68fc-4560-5eaa-b14d-607f9d8c5e2c',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'medium',
   $q$It is 11:40. What time will it be in 45 minutes?$q$, $q$[{"text":"11:25","is_correct":false,"misconception_token":"subtracted-instead"},{"text":"11:85","is_correct":false,"misconception_token":"wrong-measure-unit"},{"text":"12:85","is_correct":false,"misconception_token":"elapsed-time-miscount"},{"text":"12:25","is_correct":true}]$q$::jsonb, $q$12:25$q$, $q$11:40 plus 20 minutes is 12:00, plus 25 more is 12:25. 11:85 forgets that 60 minutes makes an hour.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('73d5c7fa-9150-55b8-9b7a-8e1254e91120',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'medium',
   $q$On a bar graph, each grid line is worth 10. A bar reaches the third line. How many does the bar show?$q$, $q$[{"text":"30","is_correct":true},{"text":"13","is_correct":false,"misconception_token":"added-the-parts"},{"text":"300","is_correct":false,"misconception_token":"place-value-off-by-one"},{"text":"3","is_correct":false,"misconception_token":"wrong-scale"}]$q$::jsonb, $q$30$q$, $q$Three lines, 10 each: 3 times 10 = 30. 3 counts lines, and 13 adds 10 + 3.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('837badb9-a606-581c-a172-e4e135839b31',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'hard',
   $q$A field trip bus leaves at 9:20 in the morning and returns at 2:05 in the afternoon. How long was the trip?$q$, $q$[{"text":"7 hours 25 minutes","is_correct":false,"misconception_token":"added-instead-of-subtracted"},{"text":"5 hours 45 minutes","is_correct":false,"misconception_token":"read-clock-wrong"},{"text":"4 hours 15 minutes","is_correct":false,"misconception_token":"elapsed-time-miscount"},{"text":"4 hours 45 minutes","is_correct":true}]$q$::jsonb, $q$4 hours 45 minutes$q$, $q$From 9:20 to 2:20 is 5 hours, but the return is 2:05, which is 15 minutes less: 4 hours 45 minutes.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f3a08385-e735-5ca8-aca2-d628e6936715',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'hard',
   $q$A line plot shows: 4 pencils at 6 cm, 3 pencils at 7 cm, and 5 pencils at 8 cm. What is the total length of just the 7-cm pencils?$q$, $q$[{"text":"21 cm","is_correct":true},{"text":"7 cm","is_correct":false,"misconception_token":"misread-the-graph"},{"text":"10 cm","is_correct":false,"misconception_token":"added-the-parts"},{"text":"3 cm","is_correct":false,"misconception_token":"wrong-scale"}]$q$::jsonb, $q$21 cm$q$, $q$There are 3 pencils that are 7 cm each: 3 times 7 = 21 cm. 3 gives just the count, and 10 adds 7 + 3.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7512ddf2-f35b-5608-b10e-ac42e7045364',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'hard',
   $q$A store opens at 8:15 in the morning and closes at 6:45 in the evening. How long is it open?$q$, $q$[{"text":"10 hours","is_correct":false,"misconception_token":"elapsed-time-miscount"},{"text":"2 hours 30 minutes","is_correct":false,"misconception_token":"subtracted-instead"},{"text":"10 hours 30 minutes","is_correct":true},{"text":"14 hours 60 minutes","is_correct":false,"misconception_token":"added-instead-of-subtracted"}]$q$::jsonb, $q$10 hours 30 minutes$q$, $q$From 8:15 to 6:15 in the evening is 10 hours, plus 30 more minutes to 6:45 is 10 hours 30 minutes.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('268bcbd9-cbcc-54a5-a8a2-7f5a0916ed41',
   null,
   (select id from public.skills where slug = 'measurement-and-data'),
   'problem-solving-data-analysis', 'hard',
   $q$On a graph, each book symbol stands for 4 books. Maria's row shows 5 and a half symbols. How many books did Maria read?$q$, $q$[{"text":"22","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"added-the-parts"},{"text":"5","is_correct":false,"misconception_token":"misread-the-graph"},{"text":"20","is_correct":false,"misconception_token":"wrong-scale"}]$q$::jsonb, $q$22$q$, $q$5 and a half symbols, 4 books each: 5.5 times 4 = 22. 20 ignores the half symbol, and 9 adds 4 + 5.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- early-geometry (Shapes & Their Attributes, grade 3, CCSS.MATH.CONTENT.3.G.A) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('239fc9ee-7c9d-51f6-a2ef-2ab6970a7044',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'easy',
   $q$How many sides does a hexagon have?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"wrong-attribute"},{"text":"6","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"miscounted-sides"},{"text":"4","is_correct":false,"misconception_token":"wrong-shape-name"}]$q$::jsonb, $q$6$q$, $q$A hexagon has 6 sides. 4 sides would be a quadrilateral, and 12 counts sides and corners together.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e7d37104-0dd4-5352-99d6-7092c8113fc1',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'easy',
   $q$Which shape is a quadrilateral (a shape with exactly 4 sides)?$q$, $q$[{"text":"A rectangle","is_correct":true},{"text":"A pentagon","is_correct":false,"misconception_token":"miscounted-sides"},{"text":"A triangle","is_correct":false,"misconception_token":"wrong-shape-name"},{"text":"A circle","is_correct":false,"misconception_token":"wrong-attribute"}]$q$::jsonb, $q$A rectangle$q$, $q$A rectangle has 4 sides. A triangle has 3, a pentagon has 5, and a circle has no straight sides.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3288ef4f-a38b-518b-b1ce-773130af2fc7',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'easy',
   $q$A shape has 4 equal sides and 4 square corners. What is it?$q$, $q$[{"text":"A triangle","is_correct":false,"misconception_token":"miscounted-sides"},{"text":"A square","is_correct":true},{"text":"A rhombus","is_correct":false,"misconception_token":"not-a-right-angle"},{"text":"A rectangle","is_correct":false,"misconception_token":"wrong-attribute"}]$q$::jsonb, $q$A square$q$, $q$A square has 4 equal sides AND square corners. A rectangle's sides are not all equal, and a rhombus has equal sides but not square corners.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8a620750-49d1-5b8b-be3b-bdc7db3c025c',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'easy',
   $q$How many sides does a triangle have?$q$, $q$[{"text":"3","is_correct":true},{"text":"4","is_correct":false,"misconception_token":"wrong-shape-name"},{"text":"2","is_correct":false,"misconception_token":"miscounted-sides"},{"text":"6","is_correct":false,"misconception_token":"wrong-attribute"}]$q$::jsonb, $q$3$q$, $q$A triangle has 3 sides. 4 would be a quadrilateral.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2e38d56c-a20e-591f-9387-a9556bda224c',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is divided into 4 equal parts. What fraction is 1 part?$q$, $q$[{"text":"1/3","is_correct":false,"misconception_token":"miscounted-sides"},{"text":"4/4","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"3/4","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"1/4","is_correct":true}]$q$::jsonb, $q$1/4$q$, $q$1 of 4 equal parts is 1/4. 3/4 is the other three parts, and 4/4 is the whole thing.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2a42a1cc-3eab-59d0-b6b7-17f85e98a7e4',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'easy',
   $q$Which shape has MORE than 4 sides?$q$, $q$[{"text":"A triangle","is_correct":false,"misconception_token":"miscounted-sides"},{"text":"A rhombus","is_correct":false,"misconception_token":"wrong-attribute"},{"text":"A square","is_correct":false,"misconception_token":"wrong-shape-name"},{"text":"A hexagon","is_correct":true}]$q$::jsonb, $q$A hexagon$q$, $q$A hexagon has 6 sides. A square and rhombus have 4, and a triangle has 3.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0e96a8bc-c7ec-53b7-a5f5-d72f3a1718f9',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'easy',
   $q$A stop sign has 8 sides. What is that shape called?$q$, $q$[{"text":"A pentagon","is_correct":false,"misconception_token":"miscounted-sides"},{"text":"A hexagon","is_correct":false,"misconception_token":"wrong-shape-name"},{"text":"An octagon","is_correct":true},{"text":"A quadrilateral","is_correct":false,"misconception_token":"wrong-attribute"}]$q$::jsonb, $q$An octagon$q$, $q$An 8-sided shape is an octagon. A hexagon has 6 and a pentagon has 5.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8565f4c0-6de5-5b10-91fa-c1784b6dcdd7',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'easy',
   $q$How many corners (vertices) does a square have?$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"wrong-shape-name"},{"text":"8","is_correct":false,"misconception_token":"wrong-attribute"},{"text":"4","is_correct":true},{"text":"3","is_correct":false,"misconception_token":"miscounted-sides"}]$q$::jsonb, $q$4$q$, $q$A square has 4 corners. 8 counts sides and corners together.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a717ecee-93ca-5451-a76c-ff083bea71f9',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'medium',
   $q$Which statement is TRUE about every rectangle?$q$, $q$[{"text":"It has 4 right angles","is_correct":true},{"text":"All 4 sides are equal","is_correct":false,"misconception_token":"wrong-attribute"},{"text":"It has no right angles","is_correct":false,"misconception_token":"not-a-right-angle"},{"text":"It has 3 sides","is_correct":false,"misconception_token":"miscounted-sides"}]$q$::jsonb, $q$It has 4 right angles$q$, $q$Every rectangle has 4 right angles. Only a square has all 4 sides equal.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('39464037-8e3c-5597-a4ac-deddc0f5d1c3',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'medium',
   $q$A square and a rhombus are both quadrilaterals. What makes a square special?$q$, $q$[{"text":"It has 4 sides","is_correct":false,"misconception_token":"wrong-attribute"},{"text":"It has 3 sides","is_correct":false,"misconception_token":"miscounted-sides"},{"text":"All of its angles are right angles","is_correct":true},{"text":"It has curved sides","is_correct":false,"misconception_token":"wrong-shape-name"}]$q$::jsonb, $q$All of its angles are right angles$q$, $q$A square has right angles; a rhombus has equal sides but its angles are usually not right angles. Both have 4 sides, so that is not what makes a square special.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d0628cdb-c6b1-5ae3-bbc3-242620705281',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'medium',
   $q$A circle is cut into 6 equal slices. You eat 2 of them. What fraction of the circle did you eat?$q$, $q$[{"text":"6/2","is_correct":false,"misconception_token":"digits-reversed"},{"text":"4/6","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"2/6","is_correct":true},{"text":"2/8","is_correct":false,"misconception_token":"miscounted-sides"}]$q$::jsonb, $q$2/6$q$, $q$2 of 6 equal slices is 2/6. 4/6 is what is left, and 2/8 uses the wrong number of total slices.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('63f1ac46-80dd-5780-b886-404fab02cb89',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'medium',
   $q$Which shape is NOT a quadrilateral?$q$, $q$[{"text":"A rectangle","is_correct":false,"misconception_token":"wrong-attribute"},{"text":"A square","is_correct":false,"misconception_token":"wrong-shape-name"},{"text":"A rhombus","is_correct":false,"misconception_token":"miscounted-sides"},{"text":"A triangle","is_correct":true}]$q$::jsonb, $q$A triangle$q$, $q$A triangle has 3 sides, so it is not a quadrilateral. Squares, rectangles, and rhombuses all have 4 sides.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('12aa92ab-526e-553c-bb56-0c1ff9782b84',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'medium',
   $q$A shape has 4 sides and exactly one pair of parallel sides. What is it?$q$, $q$[{"text":"A square","is_correct":false,"misconception_token":"wrong-attribute"},{"text":"A trapezoid","is_correct":true},{"text":"A pentagon","is_correct":false,"misconception_token":"wrong-shape-name"},{"text":"A triangle","is_correct":false,"misconception_token":"miscounted-sides"}]$q$::jsonb, $q$A trapezoid$q$, $q$A trapezoid has exactly one pair of parallel sides. A square has two pairs.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('df15c51f-2827-564c-801b-c9390146d12c',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'medium',
   $q$A rectangle is split into 4 parts that are NOT the same size. Can one part be called 1/4?$q$, $q$[{"text":"Yes — each part is 1/2","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"Yes — any 4 parts make fourths","is_correct":false,"misconception_token":"wrong-attribute"},{"text":"No — the parts must be equal to be fourths","is_correct":true},{"text":"No — it must be split into halves","is_correct":false,"misconception_token":"miscounted-sides"}]$q$::jsonb, $q$No — the parts must be equal to be fourths$q$, $q$A fraction like 1/4 means one of 4 EQUAL parts. Unequal parts cannot be called fourths.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5900074b-967c-5449-aa59-21161f1e837e',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'medium',
   $q$How many vertices (corners) does a hexagon have?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"wrong-shape-name"},{"text":"12","is_correct":false,"misconception_token":"wrong-attribute"},{"text":"5","is_correct":false,"misconception_token":"miscounted-sides"},{"text":"6","is_correct":true}]$q$::jsonb, $q$6$q$, $q$A hexagon has 6 corners (one at each of its 6 sides). 12 counts sides and corners together.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9f88db3e-532c-5dd9-8c82-51bccddbfc89',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'medium',
   $q$Which pair are BOTH quadrilaterals?$q$, $q$[{"text":"A square and a trapezoid","is_correct":true},{"text":"A triangle and a pentagon","is_correct":false,"misconception_token":"wrong-shape-name"},{"text":"A circle and a square","is_correct":false,"misconception_token":"wrong-attribute"},{"text":"A square and a triangle","is_correct":false,"misconception_token":"miscounted-sides"}]$q$::jsonb, $q$A square and a trapezoid$q$, $q$A square and a trapezoid both have 4 sides. Triangles (3), pentagons (5), and circles (no straight sides) are not quadrilaterals.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('46a3c19f-854c-5466-8e41-daa01a57a63e',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'hard',
   $q$All squares are rectangles, but not all rectangles are squares. Why?$q$, $q$[{"text":"A square has no right angles","is_correct":false,"misconception_token":"not-a-right-angle"},{"text":"They are completely different shapes","is_correct":false,"misconception_token":"wrong-attribute"},{"text":"A rectangle has more sides than a square","is_correct":false,"misconception_token":"miscounted-sides"},{"text":"A square needs all 4 sides equal, but a rectangle does not","is_correct":true}]$q$::jsonb, $q$A square needs all 4 sides equal, but a rectangle does not$q$, $q$A square is a special rectangle with all sides equal. Both have 4 sides and 4 right angles, so a square fits the rectangle rule, but a rectangle need not have equal sides.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('47b180b3-e99f-55ea-a096-dcb223efdb6a',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'hard',
   $q$A pizza is cut into 8 equal slices. Three friends each eat 2 slices. What fraction of the pizza is LEFT?$q$, $q$[{"text":"2/8","is_correct":true},{"text":"6/8","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"8/2","is_correct":false,"misconception_token":"digits-reversed"},{"text":"2/6","is_correct":false,"misconception_token":"miscounted-sides"}]$q$::jsonb, $q$2/8$q$, $q$3 friends times 2 slices = 6 eaten, so 8 - 6 = 2 left, which is 2/8. 6/8 is what was eaten.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8dd96fe1-fad7-5f18-a9c7-df17ec2d9cb6',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'hard',
   $q$A shape has 4 right angles and 4 sides, but its sides are NOT all equal. What is the best name for it?$q$, $q$[{"text":"A square","is_correct":false,"misconception_token":"wrong-attribute"},{"text":"A rhombus","is_correct":false,"misconception_token":"not-a-right-angle"},{"text":"A rectangle","is_correct":true},{"text":"A trapezoid","is_correct":false,"misconception_token":"wrong-shape-name"}]$q$::jsonb, $q$A rectangle$q$, $q$A rectangle has 4 right angles with opposite sides equal (but not all four). A square needs all sides equal.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('92e6da98-7001-569e-9da2-ff053737e399',
   null,
   (select id from public.skills where slug = 'early-geometry'),
   'geometry-trigonometry', 'hard',
   $q$A hexagon is divided into 6 equal triangles. What fraction of the hexagon is 4 of the triangles?$q$, $q$[{"text":"4/6","is_correct":true},{"text":"6/4","is_correct":false,"misconception_token":"digits-reversed"},{"text":"4/8","is_correct":false,"misconception_token":"miscounted-sides"},{"text":"2/6","is_correct":false,"misconception_token":"used-the-other-part"}]$q$::jsonb, $q$4/6$q$, $q$4 of 6 equal triangles is 4/6. 2/6 is the leftover part, and 4/8 uses the wrong total.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- volume (Volume, grade 5, CCSS.MATH.CONTENT.5.MD.C.5) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6d695a71-4fcc-599b-96ef-31a775a3f690',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'easy',
   $q$A box is 2 units long, 3 units wide, and 4 units tall. What is its volume in cubic units?$q$, $q$[{"text":"20","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"24","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"added-the-dimensions"},{"text":"6","is_correct":false,"misconception_token":"confused-volume-with-area"}]$q$::jsonb, $q$24$q$, $q$Volume is length times width times height: 2 times 3 times 4 = 24. 9 adds the sides, and 6 is only the base (2 times 3).$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('99ff6074-e21c-54af-b721-c756f2c60e71',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'easy',
   $q$A box is 3 units long, 3 units wide, and 2 units tall. What is its volume?$q$, $q$[{"text":"18","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"confused-volume-with-area"},{"text":"8","is_correct":false,"misconception_token":"added-the-dimensions"},{"text":"6","is_correct":false,"misconception_token":"used-only-two-dimensions"}]$q$::jsonb, $q$18$q$, $q$3 times 3 times 2 = 18. 9 is only the base (3 times 3), and 8 adds the sides.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2a36157f-73a4-5557-9d2d-20aa8ef4bea9',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'easy',
   $q$How many unit cubes fill a box that is 5 long, 2 wide, and 2 tall?$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"confused-volume-with-area"},{"text":"20","is_correct":true},{"text":"4","is_correct":false,"misconception_token":"used-only-two-dimensions"},{"text":"9","is_correct":false,"misconception_token":"added-the-dimensions"}]$q$::jsonb, $q$20$q$, $q$5 times 2 times 2 = 20 cubes. 10 is only the base (5 times 2), and 4 uses just two of the dimensions.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('582bf2f6-9a96-5c56-a3e4-fca6f47e03fc',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'easy',
   $q$A cube has edges that are all 4 units long. What is its volume?$q$, $q$[{"text":"64","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"added-the-dimensions"},{"text":"16","is_correct":false,"misconception_token":"confused-volume-with-area"},{"text":"48","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, $q$64$q$, $q$4 times 4 times 4 = 64. 16 is only one face (4 times 4), and 12 adds the three edges.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('20644b8e-77d9-5b42-8ba4-25b61d92d619',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'easy',
   $q$A box is 6 units long, 1 unit wide, and 2 units tall. What is its volume?$q$, $q$[{"text":"9","is_correct":false,"misconception_token":"added-the-dimensions"},{"text":"2","is_correct":false,"misconception_token":"used-only-two-dimensions"},{"text":"6","is_correct":false,"misconception_token":"confused-volume-with-area"},{"text":"12","is_correct":true}]$q$::jsonb, $q$12$q$, $q$6 times 1 times 2 = 12. 6 is only the base (6 times 1), and 2 uses just two dimensions.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d62c7c64-ec41-5422-b73f-9bb5f856f925',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'easy',
   $q$A box is 2 units long, 2 units wide, and 5 units tall. What is its volume?$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"used-only-two-dimensions"},{"text":"4","is_correct":false,"misconception_token":"confused-volume-with-area"},{"text":"9","is_correct":false,"misconception_token":"added-the-dimensions"},{"text":"20","is_correct":true}]$q$::jsonb, $q$20$q$, $q$2 times 2 times 5 = 20. 4 is only the base (2 times 2), and 10 uses only two dimensions (2 times 5).$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0e8d4fb9-cdc6-5634-ac13-efe8fc37dcbc',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'easy',
   $q$A box is 4 units long, 2 units wide, and 3 units tall. What is its volume?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"confused-volume-with-area"},{"text":"9","is_correct":false,"misconception_token":"added-the-dimensions"},{"text":"24","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"used-only-two-dimensions"}]$q$::jsonb, $q$24$q$, $q$4 times 2 times 3 = 24. 8 is only the base (4 times 2), and 6 uses two dimensions (2 times 3).$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('67237750-8a17-57cf-9bad-09cb99472dbb',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'easy',
   $q$A rectangular prism is 5 units long, 3 units wide, and 2 units tall. What is its volume?$q$, $q$[{"text":"6","is_correct":false,"misconception_token":"used-only-two-dimensions"},{"text":"10","is_correct":false,"misconception_token":"added-the-dimensions"},{"text":"30","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"confused-volume-with-area"}]$q$::jsonb, $q$30$q$, $q$5 times 3 times 2 = 30. 15 is only the base (5 times 3), and 6 uses two dimensions (3 times 2).$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e2fa8671-b55c-5861-b55a-88f8a8163c08',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'medium',
   $q$A box holds 2 layers of unit cubes. Each layer has 12 cubes. What is the volume?$q$, $q$[{"text":"24","is_correct":true},{"text":"14","is_correct":false,"misconception_token":"added-the-dimensions"},{"text":"10","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"12","is_correct":false,"misconception_token":"used-only-two-dimensions"}]$q$::jsonb, $q$24$q$, $q$2 layers of 12 cubes: 12 times 2 = 24. 12 counts only one layer, and 14 adds 12 + 2.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('99c992c8-f5b9-54aa-a05e-a2b6468a9fc8',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'medium',
   $q$A box is 4 units long, 3 units wide, and 5 units tall. What is its volume?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"added-the-dimensions"},{"text":"20","is_correct":false,"misconception_token":"confused-volume-with-area"},{"text":"60","is_correct":true},{"text":"48","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, $q$60$q$, $q$4 times 3 times 5 = 60. 20 is only two dimensions (4 times 5), and 12 adds the sides.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3c3db0d4-dfe1-50e4-932c-6fd5415f99e4',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'medium',
   $q$A fish tank is 10 inches long, 4 inches wide, and 6 inches tall. What is its volume in cubic inches?$q$, $q$[{"text":"40","is_correct":false,"misconception_token":"confused-volume-with-area"},{"text":"20","is_correct":false,"misconception_token":"added-the-dimensions"},{"text":"240","is_correct":true},{"text":"60","is_correct":false,"misconception_token":"used-only-two-dimensions"}]$q$::jsonb, $q$240$q$, $q$10 times 4 times 6 = 240. 40 is only the base (10 times 4), and 60 uses two dimensions (10 times 6).$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('931e83b4-c913-5071-bf61-da0f6106d0ba',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'medium',
   $q$A box has a base of 12 square units and a height of 3 units. What is its volume?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"confused-volume-with-area"},{"text":"15","is_correct":false,"misconception_token":"added-the-dimensions"},{"text":"39","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"36","is_correct":true}]$q$::jsonb, $q$36$q$, $q$Volume is base area times height: 12 times 3 = 36. 12 is only the base area, and 15 adds instead of multiplying.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('842704a9-c549-5fc0-a6cb-8a7671c53c4c',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'medium',
   $q$A box is 5 units long, 5 units wide, and 2 units tall. What is its volume?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"added-the-dimensions"},{"text":"50","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"used-only-two-dimensions"},{"text":"25","is_correct":false,"misconception_token":"confused-volume-with-area"}]$q$::jsonb, $q$50$q$, $q$5 times 5 times 2 = 50. 25 is only the base (5 times 5), and 10 uses two dimensions (5 times 2).$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f46b8a5b-f760-51c6-8c4b-2bfb6f1c1a22',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'medium',
   $q$Box A is 3 by 3 by 3. Box B is 2 by 2 by 6. Which box has the greater volume?$q$, $q$[{"text":"Box B (26) is greater than Box A (25)","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"Box B, because it is taller","is_correct":false,"misconception_token":"used-only-two-dimensions"},{"text":"Box A (27) is greater than Box B (24)","is_correct":true},{"text":"They are equal","is_correct":false,"misconception_token":"confused-volume-with-area"}]$q$::jsonb, $q$Box A (27) is greater than Box B (24)$q$, $q$Box A: 3 times 3 times 3 = 27. Box B: 2 times 2 times 6 = 24. Box A is greater. Being taller does not make the volume bigger by itself.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4febbc97-1858-5d39-af19-ee20f35c80a8',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'medium',
   $q$A box is 8 units long, 2 units wide, and 3 units tall. What is its volume?$q$, $q$[{"text":"6","is_correct":false,"misconception_token":"used-only-two-dimensions"},{"text":"13","is_correct":false,"misconception_token":"added-the-dimensions"},{"text":"16","is_correct":false,"misconception_token":"confused-volume-with-area"},{"text":"48","is_correct":true}]$q$::jsonb, $q$48$q$, $q$8 times 2 times 3 = 48. 16 is only the base (8 times 2), and 6 uses two dimensions (2 times 3).$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6a738ff5-c233-5ae1-948e-01c83e638ffe',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'medium',
   $q$A cube has edges of 5 units. What is its volume?$q$, $q$[{"text":"125","is_correct":true},{"text":"25","is_correct":false,"misconception_token":"confused-volume-with-area"},{"text":"100","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"15","is_correct":false,"misconception_token":"added-the-dimensions"}]$q$::jsonb, $q$125$q$, $q$5 times 5 times 5 = 125. 25 is only one face, and 15 adds the three edges.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('57dced71-b173-5689-ae04-ad6211968ec4',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'hard',
   $q$A box is 6 units long, 4 units wide, and 5 units tall. What is its volume?$q$, $q$[{"text":"24","is_correct":false,"misconception_token":"confused-volume-with-area"},{"text":"96","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"15","is_correct":false,"misconception_token":"added-the-dimensions"},{"text":"120","is_correct":true}]$q$::jsonb, $q$120$q$, $q$6 times 4 times 5 = 120. 24 is only the base (6 times 4), and 15 adds the sides.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7126396e-dcfb-5d33-8313-b2777f047e17',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'hard',
   $q$A solid is made of two blocks joined together: a 4 by 2 by 2 block and a 2 by 2 by 2 block. What is the total volume?$q$, $q$[{"text":"24","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"used-only-two-dimensions"},{"text":"32","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"12","is_correct":false,"misconception_token":"added-the-dimensions"}]$q$::jsonb, $q$24$q$, $q$First block: 4 times 2 times 2 = 16. Second block: 2 times 2 times 2 = 8. Total 16 + 8 = 24. 16 counts only the first block.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('80386769-ec5f-5ed8-92a6-c3552bce713d',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'hard',
   $q$A box has a volume of 48 cubic units and a base area of 8 square units. How tall is it?$q$, $q$[{"text":"40","is_correct":false,"misconception_token":"subtracted-instead"},{"text":"384","is_correct":false,"misconception_token":"multiplied-instead-of-divided"},{"text":"6","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"confused-volume-with-area"}]$q$::jsonb, $q$6$q$, $q$Volume is base times height, so height is volume divided by base: 48 divided by 8 = 6. 384 multiplies, and 40 subtracts.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5ab45e9f-c2bc-5141-a363-d295b7f4c1b0',
   null,
   (select id from public.skills where slug = 'volume'),
   'geometry-trigonometry', 'hard',
   $q$How many 1-inch cubes fit in a box that is 10 inches long, 10 inches wide, and 10 inches tall?$q$, $q$[{"text":"1,000","is_correct":true},{"text":"100","is_correct":false,"misconception_token":"confused-volume-with-area"},{"text":"300","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"30","is_correct":false,"misconception_token":"added-the-dimensions"}]$q$::jsonb, $q$1,000$q$, $q$10 times 10 times 10 = 1,000 cubes. 100 is only one face (10 times 10), and 30 adds the three edges.$q$, 'published')
on conflict (id) do update set
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
