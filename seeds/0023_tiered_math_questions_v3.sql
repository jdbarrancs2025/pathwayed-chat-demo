-- PathwayEd — Phase 3 step 1: TIERED math questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-tiered-math-seeds.ts from
-- src/lib/tieredMathTemplates.ts.
--
-- HOW TO APPLY: paste into the Supabase SQL editor and run against
-- papiowjjoyhnbyhgtbxq. Idempotent: templates upsert on (code), questions upsert on
-- a deterministic id derived from "{template_code}:{slot}".
--
-- WHAT THIS DOES AND DOES NOT DO.
--   DOES:     insert 12 NEW templates and 192 NEW questions, all status='draft'.
--   DOES NOT: update, re-tag, or delete a single existing row. Every template code
--             ends -v3 and is new, so no deterministic id can collide with the
--             live v1 pool, and every existing question_attempts row stays joinable
--             with its per-question time median intact.
--
-- NOTHING IS SERVED BY THIS FILE. Questions land as 'draft'; the client only ever
-- selects status='published'. Publishing is a separate, deliberate step.
--
-- Grade anchoring: each tier's standard is quoted above its block. Harder means a
-- harder task AT THE SAME GRADE, never a bigger number borrowed from a later grade.

begin;

-- =====================================================================
-- multiplication-g3-easy-v3
-- skill: multiplication   tier: easy   items: 16
-- standard: 3.OA.C.7 - multiply within 100 (friendly factors)
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('multiplication-g3-easy-v3',
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"What is ${a} \\times {b}$?","slots":[{"name":"a","min":2,"max":10},{"name":"b","min":2,"max":10}],"answerFormula":"a * b","answerFormat":"integer","constraints":["a * b <= 28"],"solutionTemplate":"${a} \\times {b} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"a * b - a","misconception_token":"skip-count-error"},{"formula":"a * b + b","misconception_token":"off-by-one-factor"},{"formula":"a + b","misconception_token":"added-instead-of-multiplied"},{"formula":"a * b + a","misconception_token":"counted-an-extra-group"},{"formula":"a * b - b","misconception_token":"missed-a-group"}]$q$::jsonb,
   'draft', 2)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('baf0915f-59ad-5b83-a707-57aa32182c23',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $4 \times 6$?$q$, $q$[{"text":"20","is_correct":false,"misconception_token":"skip-count-error"},{"text":"24","is_correct":true},{"text":"30","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"10","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '24', $q$$4 \times 6 = 24$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f7018306-ed8a-5894-821b-d4387b06e5a8',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $5 \times 5$?$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"30","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"20","is_correct":false,"misconception_token":"skip-count-error"},{"text":"25","is_correct":true}]$q$::jsonb, '25', $q$$5 \times 5 = 25$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('14fac916-7a4a-5e25-b4e6-6c283a5ae10d',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $4 \times 5$?$q$, $q$[{"text":"25","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"20","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"16","is_correct":false,"misconception_token":"skip-count-error"}]$q$::jsonb, '20', $q$$4 \times 5 = 20$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ccb0a6bb-0813-5049-b1de-2210924b38e0',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $3 \times 9$?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"36","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"27","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"skip-count-error"}]$q$::jsonb, '27', $q$$3 \times 9 = 27$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('44670e5e-2ab7-589f-87e5-bf30cb6f3eeb',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $3 \times 5$?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"12","is_correct":false,"misconception_token":"skip-count-error"},{"text":"15","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '15', $q$$3 \times 5 = 15$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('10bd48b4-bdfd-5db7-b61c-fd5526ab3b9b',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $10 \times 2$?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"10","is_correct":false,"misconception_token":"skip-count-error"},{"text":"20","is_correct":true},{"text":"22","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '20', $q$$10 \times 2 = 20$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f41bf034-060a-5d64-9bd1-107964893328',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $8 \times 3$?$q$, $q$[{"text":"24","is_correct":true},{"text":"27","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"16","is_correct":false,"misconception_token":"skip-count-error"},{"text":"11","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '24', $q$$8 \times 3 = 24$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5691f49c-56db-5050-ae13-e0eb820abdf1',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $4 \times 4$?$q$, $q$[{"text":"16","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"12","is_correct":false,"misconception_token":"skip-count-error"},{"text":"20","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '16', $q$$4 \times 4 = 16$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8a0bd0d7-6570-547f-9b48-02dd9e0d909a',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $2 \times 7$?$q$, $q$[{"text":"14","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"12","is_correct":false,"misconception_token":"skip-count-error"},{"text":"21","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '14', $q$$2 \times 7 = 14$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c7e13f2a-e857-5f7d-9360-b5110ef84f86',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $4 \times 7$?$q$, $q$[{"text":"35","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"24","is_correct":false,"misconception_token":"skip-count-error"},{"text":"11","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"28","is_correct":true}]$q$::jsonb, '28', $q$$4 \times 7 = 28$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c3f0bfdf-9c66-5c25-af72-98189679e53b',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $3 \times 6$?$q$, $q$[{"text":"15","is_correct":false,"misconception_token":"skip-count-error"},{"text":"24","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"9","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"18","is_correct":true}]$q$::jsonb, '18', $q$$3 \times 6 = 18$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('aa04a825-bea7-5f90-acf7-7e3e0bc2d6ff',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $8 \times 2$?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"skip-count-error"},{"text":"16","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"18","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '16', $q$$8 \times 2 = 16$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e4650f21-6690-52be-8201-c5da95e38bc0',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $9 \times 2$?$q$, $q$[{"text":"18","is_correct":true},{"text":"11","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"20","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"9","is_correct":false,"misconception_token":"skip-count-error"}]$q$::jsonb, '18', $q$$9 \times 2 = 18$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('92224a63-5aa6-515d-a947-e34629b2f9cc',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $2 \times 4$?$q$, $q$[{"text":"8","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"skip-count-error"},{"text":"10","is_correct":false,"misconception_token":"counted-an-extra-group"},{"text":"12","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '8', $q$$2 \times 4 = 8$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('00bfd376-7e67-5423-8042-5d3b4b0dc66f',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $7 \times 3$?$q$, $q$[{"text":"21","is_correct":true},{"text":"14","is_correct":false,"misconception_token":"skip-count-error"},{"text":"10","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"24","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '21', $q$$7 \times 3 = 21$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ababdeb3-da50-505e-8928-0e91bfc8f116',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $2 \times 6$?$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"skip-count-error"},{"text":"12","is_correct":true},{"text":"18","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"8","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '12', $q$$2 \times 6 = 12$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- =====================================================================
-- multiplication-g3-medium-v3
-- skill: multiplication   tier: medium   items: 20
-- standard: 3.OA.C.7 - multiply within 100 (the harder facts)
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('multiplication-g3-medium-v3',
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"What is ${a} \\times {b}$?","slots":[{"name":"a","min":2,"max":10},{"name":"b","min":2,"max":10}],"answerFormula":"a * b","answerFormat":"integer","constraints":["a * b > 28","a * b <= 100"],"solutionTemplate":"${a} \\times {b} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"a * b - a","misconception_token":"skip-count-error"},{"formula":"a * b + b","misconception_token":"off-by-one-factor"},{"formula":"a + b","misconception_token":"added-instead-of-multiplied"},{"formula":"a * b + a","misconception_token":"counted-an-extra-group"},{"formula":"a * b - b","misconception_token":"missed-a-group"}]$q$::jsonb,
   'draft', 2)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e709b518-62e2-59f1-96cc-5fab0669c84e',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $6 \times 6$?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"42","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"30","is_correct":false,"misconception_token":"skip-count-error"},{"text":"36","is_correct":true}]$q$::jsonb, '36', $q$$6 \times 6 = 36$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bfbb4d2d-f4d2-5c83-aca1-afec55bdfd96',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $9 \times 6$?$q$, $q$[{"text":"54","is_correct":true},{"text":"60","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"45","is_correct":false,"misconception_token":"skip-count-error"},{"text":"15","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '54', $q$$9 \times 6 = 54$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7358218f-d6ce-5ac8-91ed-6ed3a3030210',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $8 \times 8$?$q$, $q$[{"text":"56","is_correct":false,"misconception_token":"skip-count-error"},{"text":"72","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"64","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '64', $q$$8 \times 8 = 64$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('57293a2b-52ef-5970-b28e-3a902b2fad22',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $8 \times 9$?$q$, $q$[{"text":"72","is_correct":true},{"text":"64","is_correct":false,"misconception_token":"skip-count-error"},{"text":"81","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"17","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '72', $q$$8 \times 9 = 72$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8aecaf3e-3ced-5eeb-a487-f37f17aca029',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $7 \times 10$?$q$, $q$[{"text":"70","is_correct":true},{"text":"63","is_correct":false,"misconception_token":"skip-count-error"},{"text":"80","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"17","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '70', $q$$7 \times 10 = 70$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('37f36d30-5306-5fb4-a7f1-7c58a365d1ba',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $9 \times 5$?$q$, $q$[{"text":"14","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"36","is_correct":false,"misconception_token":"skip-count-error"},{"text":"50","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"45","is_correct":true}]$q$::jsonb, '45', $q$$9 \times 5 = 45$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f76705df-1b94-5951-bf8b-66fdb0bd5bfc',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $8 \times 6$?$q$, $q$[{"text":"40","is_correct":false,"misconception_token":"skip-count-error"},{"text":"48","is_correct":true},{"text":"54","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"14","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '48', $q$$8 \times 6 = 48$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0761d8e1-61e4-5d80-ba6c-67a83a2e9551',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $4 \times 10$?$q$, $q$[{"text":"40","is_correct":true},{"text":"36","is_correct":false,"misconception_token":"skip-count-error"},{"text":"50","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"14","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '40', $q$$4 \times 10 = 40$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('af5a548a-fbd4-5cc5-b2d4-de6fbad450ee',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $10 \times 3$?$q$, $q$[{"text":"30","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"skip-count-error"},{"text":"13","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"33","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '30', $q$$10 \times 3 = 30$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('68cc9717-b83d-5c09-b466-2d799ddc6ec8',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $7 \times 8$?$q$, $q$[{"text":"15","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"64","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"49","is_correct":false,"misconception_token":"skip-count-error"},{"text":"56","is_correct":true}]$q$::jsonb, '56', $q$$7 \times 8 = 56$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('828a3373-f378-523d-945c-e171471e0809',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $8 \times 4$?$q$, $q$[{"text":"32","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"skip-count-error"},{"text":"36","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"12","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '32', $q$$8 \times 4 = 32$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b5fb1fb7-2adb-512e-ab4f-63935f70c223',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $6 \times 7$?$q$, $q$[{"text":"36","is_correct":false,"misconception_token":"skip-count-error"},{"text":"49","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"42","is_correct":true},{"text":"13","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '42', $q$$6 \times 7 = 42$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5b87f3d8-d58e-565b-9dbb-43c5520c7389',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $5 \times 8$?$q$, $q$[{"text":"40","is_correct":true},{"text":"48","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"13","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"35","is_correct":false,"misconception_token":"skip-count-error"}]$q$::jsonb, '40', $q$$5 \times 8 = 40$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f12f6048-1df5-582b-ab9e-4f63c2b99443',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $10 \times 6$?$q$, $q$[{"text":"66","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"50","is_correct":false,"misconception_token":"skip-count-error"},{"text":"60","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '60', $q$$10 \times 6 = 60$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3e35af72-78d3-5db8-88e6-2ead94a6730c',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $10 \times 10$?$q$, $q$[{"text":"20","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"90","is_correct":false,"misconception_token":"skip-count-error"},{"text":"100","is_correct":true},{"text":"110","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '100', $q$$10 \times 10 = 100$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e63498e0-72b0-5b10-87ed-2785a7e9b1e7',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $6 \times 5$?$q$, $q$[{"text":"35","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"11","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"24","is_correct":false,"misconception_token":"skip-count-error"},{"text":"30","is_correct":true}]$q$::jsonb, '30', $q$$6 \times 5 = 30$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('da6da472-f4ae-5288-a9de-03d94bf4997c',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $9 \times 4$?$q$, $q$[{"text":"13","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"27","is_correct":false,"misconception_token":"skip-count-error"},{"text":"40","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"36","is_correct":true}]$q$::jsonb, '36', $q$$9 \times 4 = 36$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('859a6fba-97d4-51a7-a836-944dfbca4077',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $10 \times 5$?$q$, $q$[{"text":"55","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"40","is_correct":false,"misconception_token":"skip-count-error"},{"text":"15","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"50","is_correct":true}]$q$::jsonb, '50', $q$$10 \times 5 = 50$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d668461c-9fae-528a-910a-403a9e4c1acd',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $5 \times 7$?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"30","is_correct":false,"misconception_token":"skip-count-error"},{"text":"42","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"35","is_correct":true}]$q$::jsonb, '35', $q$$5 \times 7 = 35$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('949719be-b8e9-5255-9e2b-791388ce7f8f',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $10 \times 9$?$q$, $q$[{"text":"80","is_correct":false,"misconception_token":"skip-count-error"},{"text":"90","is_correct":true},{"text":"99","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"19","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '90', $q$$10 \times 9 = 90$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- =====================================================================
-- multiplication-g3-hard-v3
-- skill: multiplication   tier: hard   items: 12
-- standard: 3.OA.A.4 - determine the unknown factor
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('multiplication-g3-hard-v3',
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"What number goes in the box? $\\square \\times {b} = {product}$","slots":[{"name":"a","min":3,"max":10},{"name":"b","min":3,"max":10}],"derived":[{"name":"product","formula":"a * b"}],"answerFormula":"a","answerFormat":"integer","constraints":["a * b <= 100"],"solutionTemplate":"Ask how many ${b}$s make ${product}$: ${product} \\div {b} = {answer}$, and ${answer} \\times {b} = {product}$."}$q$::jsonb,
   $q$[{"formula":"product - b","misconception_token":"subtracted-instead-of-divided"},{"formula":"a + 1","misconception_token":"quotient-too-high"},{"formula":"a - 1","misconception_token":"quotient-too-low"},{"formula":"product","misconception_token":"answered-the-product"},{"formula":"b","misconception_token":"answered-the-known-factor"}]$q$::jsonb,
   'draft', 2)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('90186726-10ec-5c62-86f9-ca37f6fb924b',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 6 = 42$$q$, $q$[{"text":"6","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"8","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"36","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"7","is_correct":true}]$q$::jsonb, '7', $q$Ask how many $6$s make $42$: $42 \div 6 = 7$, and $7 \times 6 = 42$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d17ed4d6-4c9d-55d2-b461-2d579057ee30',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 7 = 63$$q$, $q$[{"text":"9","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"56","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"8","is_correct":false,"misconception_token":"quotient-too-low"}]$q$::jsonb, '9', $q$Ask how many $7$s make $63$: $63 \div 7 = 9$, and $9 \times 7 = 63$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('eb42b3b4-0c0d-5b04-b7b5-2996e89a4b27',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 6 = 30$$q$, $q$[{"text":"6","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"5","is_correct":true},{"text":"4","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"24","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '5', $q$Ask how many $6$s make $30$: $30 \div 6 = 5$, and $5 \times 6 = 30$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c399c21b-b35d-580d-a652-27af4cb97cae',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 9 = 81$$q$, $q$[{"text":"72","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"10","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"9","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"quotient-too-low"}]$q$::jsonb, '9', $q$Ask how many $9$s make $81$: $81 \div 9 = 9$, and $9 \times 9 = 81$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e61374df-fd09-5c4a-b2a8-c7baf831cfc0',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 10 = 40$$q$, $q$[{"text":"3","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"5","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"4","is_correct":true},{"text":"30","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '4', $q$Ask how many $10$s make $40$: $40 \div 10 = 4$, and $4 \times 10 = 40$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ab002f6a-6e3d-574f-93db-84f9c5124c0f',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 6 = 24$$q$, $q$[{"text":"3","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"18","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"4","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"quotient-too-high"}]$q$::jsonb, '4', $q$Ask how many $6$s make $24$: $24 \div 6 = 4$, and $4 \times 6 = 24$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7c16ef96-a1bd-5566-85e4-a9fc195a8644',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 3 = 30$$q$, $q$[{"text":"9","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"27","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"10","is_correct":true},{"text":"11","is_correct":false,"misconception_token":"quotient-too-high"}]$q$::jsonb, '10', $q$Ask how many $3$s make $30$: $30 \div 3 = 10$, and $10 \times 3 = 30$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a8f277da-88c0-595b-b76e-8005770e376a',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 4 = 32$$q$, $q$[{"text":"8","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"28","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"7","is_correct":false,"misconception_token":"quotient-too-low"}]$q$::jsonb, '8', $q$Ask how many $4$s make $32$: $32 \div 4 = 8$, and $8 \times 4 = 32$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('62e6adc2-5f6b-5026-83aa-118943df58e2',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 8 = 64$$q$, $q$[{"text":"8","is_correct":true},{"text":"7","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"56","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"9","is_correct":false,"misconception_token":"quotient-too-high"}]$q$::jsonb, '8', $q$Ask how many $8$s make $64$: $64 \div 8 = 8$, and $8 \times 8 = 64$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('896e95b5-fe50-5e79-a745-0d2c0470e797',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 4 = 36$$q$, $q$[{"text":"9","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"10","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"32","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '9', $q$Ask how many $4$s make $36$: $36 \div 4 = 9$, and $9 \times 4 = 36$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('49ff72da-9f56-571b-a697-cd5a1d51b569',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 5 = 20$$q$, $q$[{"text":"4","is_correct":true},{"text":"3","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"15","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"5","is_correct":false,"misconception_token":"quotient-too-high"}]$q$::jsonb, '4', $q$Ask how many $5$s make $20$: $20 \div 5 = 4$, and $4 \times 5 = 20$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fce8cbea-a0dc-5e8a-a898-2a79a71de0c2',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v3'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 8 = 56$$q$, $q$[{"text":"6","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"8","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"48","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"7","is_correct":true}]$q$::jsonb, '7', $q$Ask how many $8$s make $56$: $56 \div 8 = 7$, and $7 \times 8 = 56$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- =====================================================================
-- fraction-of-number-g3-easy-v3
-- skill: fractions   tier: easy   items: 16
-- standard: 3.NF.A.1 - one part of b equal parts
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('fraction-of-number-g3-easy-v3',
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"What is $\\frac{1}{{b}}$ of ${n}$?","slots":[{"name":"b","min":2,"max":4},{"name":"k","min":2,"max":8}],"derived":[{"name":"n","formula":"b * k"}],"answerFormula":"k","answerFormat":"integer","solutionTemplate":"Split ${n}$ into ${b}$ equal parts: ${n} \\div {b} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"k + 1","misconception_token":"part-size-too-big"},{"formula":"k - 1","misconception_token":"part-size-too-small"},{"formula":"n - b","misconception_token":"subtracted-instead-of-divided"},{"formula":"n","misconception_token":"answered-the-whole"},{"formula":"b","misconception_token":"answered-the-denominator"}]$q$::jsonb,
   'draft', 2)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b7213d5e-3212-5ba8-95e9-daed23f140a0',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{3}$ of $15$?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"4","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"6","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"5","is_correct":true}]$q$::jsonb, '5', $q$Split $15$ into $3$ equal parts: $15 \div 3 = 5$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('20b9f1f6-427e-5fa5-bfef-9101e82b6168',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{4}$ of $20$?$q$, $q$[{"text":"5","is_correct":true},{"text":"4","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"6","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"16","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '5', $q$Split $20$ into $4$ equal parts: $20 \div 4 = 5$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('01a9bca1-9684-57ed-af19-b93b9cb61d24',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{2}$ of $8$?$q$, $q$[{"text":"3","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"4","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"5","is_correct":false,"misconception_token":"part-size-too-big"}]$q$::jsonb, '4', $q$Split $8$ into $2$ equal parts: $8 \div 2 = 4$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1eb500f5-0398-5286-bff1-ccbd84a2c8d4',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{4}$ of $28$?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"6","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"7","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '7', $q$Split $28$ into $4$ equal parts: $28 \div 4 = 7$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('be415adc-ff2f-54c5-9c9f-caab0f431f6c',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{2}$ of $16$?$q$, $q$[{"text":"14","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"7","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"8","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"part-size-too-big"}]$q$::jsonb, '8', $q$Split $16$ into $2$ equal parts: $16 \div 2 = 8$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c70d19cd-2bac-5705-b781-2f5eb68efef4',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{4}$ of $8$?$q$, $q$[{"text":"4","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"3","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"2","is_correct":true},{"text":"1","is_correct":false,"misconception_token":"part-size-too-small"}]$q$::jsonb, '2', $q$Split $8$ into $4$ equal parts: $8 \div 4 = 2$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('937645bf-f639-50e7-8f69-3b0da76d3c97',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{4}$ of $12$?$q$, $q$[{"text":"3","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"4","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"8","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '3', $q$Split $12$ into $4$ equal parts: $12 \div 4 = 3$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0cc54fbb-f503-50f5-9ad7-72346c98643e',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{3}$ of $21$?$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"6","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"8","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"7","is_correct":true}]$q$::jsonb, '7', $q$Split $21$ into $3$ equal parts: $21 \div 3 = 7$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e4b77da9-c963-55a3-bab5-9396c70bd8e3',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{4}$ of $16$?$q$, $q$[{"text":"4","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"3","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"12","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '4', $q$Split $16$ into $4$ equal parts: $16 \div 4 = 4$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6bf6beb9-1cff-586a-81c3-6f016068958b',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{3}$ of $18$?$q$, $q$[{"text":"7","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"5","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"6","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '6', $q$Split $18$ into $3$ equal parts: $18 \div 3 = 6$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ee9d528b-4eab-50e2-85c5-7476de31abf8',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{2}$ of $10$?$q$, $q$[{"text":"6","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"4","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"8","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"5","is_correct":true}]$q$::jsonb, '5', $q$Split $10$ into $2$ equal parts: $10 \div 2 = 5$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('54867ad8-63dd-5a81-b106-78191a7b91f2',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{2}$ of $6$?$q$, $q$[{"text":"3","is_correct":true},{"text":"4","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"2","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"6","is_correct":false,"misconception_token":"answered-the-whole"}]$q$::jsonb, '3', $q$Split $6$ into $2$ equal parts: $6 \div 2 = 3$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7c3bd43d-8a17-5626-9fe9-bdf44b254538',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{3}$ of $12$?$q$, $q$[{"text":"3","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"9","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"5","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"4","is_correct":true}]$q$::jsonb, '4', $q$Split $12$ into $3$ equal parts: $12 \div 3 = 4$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fd357645-dbd6-595a-9624-6f34d18213bc',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{2}$ of $14$?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"6","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"7","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '7', $q$Split $14$ into $2$ equal parts: $14 \div 2 = 7$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bf94bfe0-9c18-5449-b7e8-608f87e048e5',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{3}$ of $24$?$q$, $q$[{"text":"21","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"7","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"9","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"8","is_correct":true}]$q$::jsonb, '8', $q$Split $24$ into $3$ equal parts: $24 \div 3 = 8$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bb929d83-fc87-5c03-be02-249090e4584b',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{3}$ of $9$?$q$, $q$[{"text":"4","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"6","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"2","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"3","is_correct":true}]$q$::jsonb, '3', $q$Split $9$ into $3$ equal parts: $9 \div 3 = 3$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- =====================================================================
-- fraction-of-number-g3-medium-v3
-- skill: fractions   tier: medium   items: 20
-- standard: 3.NF.A.1 - a parts of b equal parts
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('fraction-of-number-g3-medium-v3',
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"What is $\\frac{{a}}{{b}}$ of ${n}$?","slots":[{"name":"a","min":2,"max":5},{"name":"b","min":3,"max":6},{"name":"k","min":2,"max":10}],"derived":[{"name":"n","formula":"b * k"}],"answerFormula":"a * k","answerFormat":"integer","constraints":["a < b","gcd(a, b) == 1"],"solutionTemplate":"One part is ${n} \\div {b} = {k}$, so $\\frac{{a}}{{b}}$ of ${n}$ is ${a} \\times {k} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"(a + 1) * k","misconception_token":"numerator-too-high"},{"formula":"a * (k - 1)","misconception_token":"part-size-too-small"},{"formula":"(b - a) * k","misconception_token":"used-the-other-part"},{"formula":"a * (k + 1)","misconception_token":"part-size-too-big"},{"formula":"n","misconception_token":"answered-the-whole"}]$q$::jsonb,
   'draft', 2)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bbae1f3f-8b65-568f-8c8e-6b859e4e487f',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{3}{4}$ of $32$?$q$, $q$[{"text":"21","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"8","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"24","is_correct":true},{"text":"32","is_correct":false,"misconception_token":"numerator-too-high"}]$q$::jsonb, '24', $q$One part is $32 \div 4 = 8$, so $\frac{3}{4}$ of $32$ is $3 \times 8 = 24$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fbb1f575-fe97-541d-80a4-024548546970',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{4}{5}$ of $25$?$q$, $q$[{"text":"16","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"20","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"25","is_correct":false,"misconception_token":"numerator-too-high"}]$q$::jsonb, '20', $q$One part is $25 \div 5 = 5$, so $\frac{4}{5}$ of $25$ is $4 \times 5 = 20$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('82b03d7d-e732-5b9a-834d-1a549cbc9979',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{3}{4}$ of $24$?$q$, $q$[{"text":"6","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"15","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"18","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"numerator-too-high"}]$q$::jsonb, '18', $q$One part is $24 \div 4 = 6$, so $\frac{3}{4}$ of $24$ is $3 \times 6 = 18$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('93fa90ef-10ca-53b4-91d2-334a58402fd6',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{5}{6}$ of $60$?$q$, $q$[{"text":"45","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"60","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"10","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"50","is_correct":true}]$q$::jsonb, '50', $q$One part is $60 \div 6 = 10$, so $\frac{5}{6}$ of $60$ is $5 \times 10 = 50$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b3dea9a3-f5cc-506c-891f-41b84a7ac5ed',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{5}{6}$ of $54$?$q$, $q$[{"text":"54","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"40","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"45","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"used-the-other-part"}]$q$::jsonb, '45', $q$One part is $54 \div 6 = 9$, so $\frac{5}{6}$ of $54$ is $5 \times 9 = 45$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('759a5f57-6b31-5442-8bea-db412bc4cc5e',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{3}{5}$ of $30$?$q$, $q$[{"text":"18","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"12","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"24","is_correct":false,"misconception_token":"numerator-too-high"}]$q$::jsonb, '18', $q$One part is $30 \div 5 = 6$, so $\frac{3}{5}$ of $30$ is $3 \times 6 = 18$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8a7a47ef-35fc-57e9-82d7-0dec6698755a',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{3}{4}$ of $36$?$q$, $q$[{"text":"36","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"9","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"24","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"27","is_correct":true}]$q$::jsonb, '27', $q$One part is $36 \div 4 = 9$, so $\frac{3}{4}$ of $36$ is $3 \times 9 = 27$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ccd7e5cd-a229-5646-a2ba-8827e199f7d8',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{4}{5}$ of $40$?$q$, $q$[{"text":"40","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"32","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"28","is_correct":false,"misconception_token":"part-size-too-small"}]$q$::jsonb, '32', $q$One part is $40 \div 5 = 8$, so $\frac{4}{5}$ of $40$ is $4 \times 8 = 32$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fdbaa00f-173a-5062-9af7-abf83099b7d6',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{5}{6}$ of $48$?$q$, $q$[{"text":"40","is_correct":true},{"text":"48","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"35","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"8","is_correct":false,"misconception_token":"used-the-other-part"}]$q$::jsonb, '40', $q$One part is $48 \div 6 = 8$, so $\frac{5}{6}$ of $48$ is $5 \times 8 = 40$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bf5b5458-4ea4-5d40-9a5d-5926ab3425d5',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{5}{6}$ of $24$?$q$, $q$[{"text":"15","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"24","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"20","is_correct":true},{"text":"4","is_correct":false,"misconception_token":"used-the-other-part"}]$q$::jsonb, '20', $q$One part is $24 \div 6 = 4$, so $\frac{5}{6}$ of $24$ is $5 \times 4 = 20$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f7631375-baa7-5ce5-a44b-8935b3200abd',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{4}{5}$ of $30$?$q$, $q$[{"text":"30","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"24","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"6","is_correct":false,"misconception_token":"used-the-other-part"}]$q$::jsonb, '24', $q$One part is $30 \div 5 = 6$, so $\frac{4}{5}$ of $30$ is $4 \times 6 = 24$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cb48e9db-d11b-532e-a7fc-faddf504700d',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{4}{5}$ of $10$?$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"8","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"4","is_correct":false,"misconception_token":"part-size-too-small"}]$q$::jsonb, '8', $q$One part is $10 \div 5 = 2$, so $\frac{4}{5}$ of $10$ is $4 \times 2 = 8$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4e30dd20-a457-5838-a760-445ce7e006c0',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{3}{5}$ of $45$?$q$, $q$[{"text":"36","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"24","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"27","is_correct":true},{"text":"18","is_correct":false,"misconception_token":"used-the-other-part"}]$q$::jsonb, '27', $q$One part is $45 \div 5 = 9$, so $\frac{3}{5}$ of $45$ is $3 \times 9 = 27$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('68c49e49-a471-5818-aaaa-6acb14669491',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{3}{5}$ of $50$?$q$, $q$[{"text":"27","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"30","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"40","is_correct":false,"misconception_token":"numerator-too-high"}]$q$::jsonb, '30', $q$One part is $50 \div 5 = 10$, so $\frac{3}{5}$ of $50$ is $3 \times 10 = 30$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('79d324f7-153d-5f97-b751-cb5ea9b10a9b',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{2}{3}$ of $30$?$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"20","is_correct":true},{"text":"30","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"10","is_correct":false,"misconception_token":"used-the-other-part"}]$q$::jsonb, '20', $q$One part is $30 \div 3 = 10$, so $\frac{2}{3}$ of $30$ is $2 \times 10 = 20$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ad370d66-22c7-5bf2-87b1-986cc99df28b',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{5}{6}$ of $12$?$q$, $q$[{"text":"10","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"5","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"12","is_correct":false,"misconception_token":"numerator-too-high"}]$q$::jsonb, '10', $q$One part is $12 \div 6 = 2$, so $\frac{5}{6}$ of $12$ is $5 \times 2 = 10$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cc92f7ac-3319-54c2-b677-dc36a6e61f22',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{3}{5}$ of $15$?$q$, $q$[{"text":"9","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"15","is_correct":false,"misconception_token":"answered-the-whole"},{"text":"6","is_correct":false,"misconception_token":"part-size-too-small"}]$q$::jsonb, '9', $q$One part is $15 \div 5 = 3$, so $\frac{3}{5}$ of $15$ is $3 \times 3 = 9$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e649ebd8-c17e-5921-acf5-376a308f4880',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{2}{5}$ of $20$?$q$, $q$[{"text":"6","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"8","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"10","is_correct":false,"misconception_token":"part-size-too-big"}]$q$::jsonb, '8', $q$One part is $20 \div 5 = 4$, so $\frac{2}{5}$ of $20$ is $2 \times 4 = 8$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('90017dd4-4141-54d9-99a5-2b4b6ba51ca0',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{4}{5}$ of $35$?$q$, $q$[{"text":"7","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"24","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"35","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"28","is_correct":true}]$q$::jsonb, '28', $q$One part is $35 \div 5 = 7$, so $\frac{4}{5}$ of $35$ is $4 \times 7 = 28$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2944af32-0b3a-557b-a047-bb17130dbe1f',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $\frac{2}{3}$ of $9$?$q$, $q$[{"text":"4","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"3","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"9","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"6","is_correct":true}]$q$::jsonb, '6', $q$One part is $9 \div 3 = 3$, so $\frac{2}{3}$ of $9$ is $2 \times 3 = 6$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- =====================================================================
-- fraction-of-number-g3-hard-v3
-- skill: fractions   tier: hard   items: 12
-- standard: 3.NF.A.1 - recover the whole from a part
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('fraction-of-number-g3-hard-v3',
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'hard', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"$\\frac{{a}}{{b}}$ of a number is ${part}$. What is the number?","slots":[{"name":"a","min":2,"max":5},{"name":"b","min":3,"max":6},{"name":"k","min":2,"max":10}],"derived":[{"name":"n","formula":"b * k"},{"name":"part","formula":"a * k"}],"answerFormula":"n","answerFormat":"integer","constraints":["a < b","gcd(a, b) == 1"],"solutionTemplate":"If ${a}$ parts are ${part}$, one part is ${part} \\div {a} = {k}$. The whole is ${b}$ parts: ${b} \\times {k} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"part * b","misconception_token":"scaled-the-part-not-the-unit"},{"formula":"k","misconception_token":"answered-one-part"},{"formula":"part","misconception_token":"answered-the-part"},{"formula":"part + b","misconception_token":"added-instead-of-scaled"},{"formula":"n + k","misconception_token":"part-size-too-big"}]$q$::jsonb,
   'draft', 2)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('634040fc-0fd2-5ee8-adc7-2345d1b4eab1',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$$\frac{3}{4}$ of a number is $24$. What is the number?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"answered-one-part"},{"text":"24","is_correct":false,"misconception_token":"answered-the-part"},{"text":"32","is_correct":true},{"text":"96","is_correct":false,"misconception_token":"scaled-the-part-not-the-unit"}]$q$::jsonb, '32', $q$If $3$ parts are $24$, one part is $24 \div 3 = 8$. The whole is $4$ parts: $4 \times 8 = 32$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a1b8e2ac-eb6d-5c88-b93b-cb4246084d76',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$$\frac{4}{5}$ of a number is $20$. What is the number?$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"answered-one-part"},{"text":"25","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"answered-the-part"},{"text":"100","is_correct":false,"misconception_token":"scaled-the-part-not-the-unit"}]$q$::jsonb, '25', $q$If $4$ parts are $20$, one part is $20 \div 4 = 5$. The whole is $5$ parts: $5 \times 5 = 25$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('855d96d9-1a19-5211-ac2a-8d3d747701a0',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$$\frac{3}{4}$ of a number is $18$. What is the number?$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"answered-the-part"},{"text":"6","is_correct":false,"misconception_token":"answered-one-part"},{"text":"24","is_correct":true},{"text":"72","is_correct":false,"misconception_token":"scaled-the-part-not-the-unit"}]$q$::jsonb, '24', $q$If $3$ parts are $18$, one part is $18 \div 3 = 6$. The whole is $4$ parts: $4 \times 6 = 24$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9436c24f-8c64-5416-a44f-03ab00197db1',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$$\frac{5}{6}$ of a number is $50$. What is the number?$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"answered-one-part"},{"text":"300","is_correct":false,"misconception_token":"scaled-the-part-not-the-unit"},{"text":"50","is_correct":false,"misconception_token":"answered-the-part"},{"text":"60","is_correct":true}]$q$::jsonb, '60', $q$If $5$ parts are $50$, one part is $50 \div 5 = 10$. The whole is $6$ parts: $6 \times 10 = 60$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6786cc2c-e929-5bcb-bce3-87339631081b',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$$\frac{2}{3}$ of a number is $4$. What is the number?$q$, $q$[{"text":"2","is_correct":false,"misconception_token":"answered-one-part"},{"text":"4","is_correct":false,"misconception_token":"answered-the-part"},{"text":"6","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"scaled-the-part-not-the-unit"}]$q$::jsonb, '6', $q$If $2$ parts are $4$, one part is $4 \div 2 = 2$. The whole is $3$ parts: $3 \times 2 = 6$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e0582b19-6e31-5ebf-b304-585c43d2db88',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$$\frac{5}{6}$ of a number is $45$. What is the number?$q$, $q$[{"text":"270","is_correct":false,"misconception_token":"scaled-the-part-not-the-unit"},{"text":"9","is_correct":false,"misconception_token":"answered-one-part"},{"text":"54","is_correct":true},{"text":"45","is_correct":false,"misconception_token":"answered-the-part"}]$q$::jsonb, '54', $q$If $5$ parts are $45$, one part is $45 \div 5 = 9$. The whole is $6$ parts: $6 \times 9 = 54$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('56cbecdc-e47e-5781-9ce8-be83e7e04fc9',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$$\frac{3}{5}$ of a number is $18$. What is the number?$q$, $q$[{"text":"30","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"answered-one-part"},{"text":"18","is_correct":false,"misconception_token":"answered-the-part"},{"text":"90","is_correct":false,"misconception_token":"scaled-the-part-not-the-unit"}]$q$::jsonb, '30', $q$If $3$ parts are $18$, one part is $18 \div 3 = 6$. The whole is $5$ parts: $5 \times 6 = 30$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('db8a1043-3cb7-5d8e-87e4-d18196998be6',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$$\frac{3}{4}$ of a number is $27$. What is the number?$q$, $q$[{"text":"108","is_correct":false,"misconception_token":"scaled-the-part-not-the-unit"},{"text":"27","is_correct":false,"misconception_token":"answered-the-part"},{"text":"9","is_correct":false,"misconception_token":"answered-one-part"},{"text":"36","is_correct":true}]$q$::jsonb, '36', $q$If $3$ parts are $27$, one part is $27 \div 3 = 9$. The whole is $4$ parts: $4 \times 9 = 36$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d074fafe-b61f-561a-bdab-310a4f623bc3',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$$\frac{4}{5}$ of a number is $32$. What is the number?$q$, $q$[{"text":"160","is_correct":false,"misconception_token":"scaled-the-part-not-the-unit"},{"text":"40","is_correct":true},{"text":"32","is_correct":false,"misconception_token":"answered-the-part"},{"text":"8","is_correct":false,"misconception_token":"answered-one-part"}]$q$::jsonb, '40', $q$If $4$ parts are $32$, one part is $32 \div 4 = 8$. The whole is $5$ parts: $5 \times 8 = 40$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('332adcfd-c574-5d70-b295-b09db152be6d',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$$\frac{5}{6}$ of a number is $40$. What is the number?$q$, $q$[{"text":"48","is_correct":true},{"text":"240","is_correct":false,"misconception_token":"scaled-the-part-not-the-unit"},{"text":"8","is_correct":false,"misconception_token":"answered-one-part"},{"text":"40","is_correct":false,"misconception_token":"answered-the-part"}]$q$::jsonb, '48', $q$If $5$ parts are $40$, one part is $40 \div 5 = 8$. The whole is $6$ parts: $6 \times 8 = 48$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8d2f89bc-c605-5103-94f9-271c16012f63',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$$\frac{5}{6}$ of a number is $20$. What is the number?$q$, $q$[{"text":"4","is_correct":false,"misconception_token":"answered-one-part"},{"text":"120","is_correct":false,"misconception_token":"scaled-the-part-not-the-unit"},{"text":"24","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"answered-the-part"}]$q$::jsonb, '24', $q$If $5$ parts are $20$, one part is $20 \div 5 = 4$. The whole is $6$ parts: $6 \times 4 = 24$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9faf8afe-b911-5f1b-9cc1-c0baaae7cd59',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v3'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'hard',
   $q$$\frac{4}{5}$ of a number is $24$. What is the number?$q$, $q$[{"text":"120","is_correct":false,"misconception_token":"scaled-the-part-not-the-unit"},{"text":"30","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"answered-one-part"},{"text":"24","is_correct":false,"misconception_token":"answered-the-part"}]$q$::jsonb, '30', $q$If $4$ parts are $24$, one part is $24 \div 4 = 6$. The whole is $5$ parts: $5 \times 6 = 30$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- =====================================================================
-- percent-of-g6-easy-v3
-- skill: percentages   tier: easy   items: 16
-- standard: 6.RP.A.3.C - a benchmark percent of a quantity
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('percent-of-g6-easy-v3',
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"What is ${p}\\%$ of ${n}$?","slots":[{"name":"p","min":25,"max":75,"step":25},{"name":"n","min":20,"max":200,"step":20}],"answerFormula":"p * n / 100","answerFormat":"integer","solutionTemplate":"${p}\\%$ of ${n}$ is $\\frac{{p}}{100} \\times {n} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"(p + 10) * n / 100","misconception_token":"overstated-the-percent"},{"formula":"(p - 10) * n / 100","misconception_token":"understated-the-percent"},{"formula":"n - p * n / 100","misconception_token":"complement-instead-of-percent"},{"formula":"p","misconception_token":"answered-the-percent"},{"formula":"n","misconception_token":"answered-the-whole"}]$q$::jsonb,
   'draft', 2)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0ef456b9-ee0e-5331-8be0-d1815ae06a23',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $50\%$ of $100$?$q$, $q$[{"text":"100","is_correct":false,"misconception_token":"answered-the-whole"},{"text":"40","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"60","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"50","is_correct":true}]$q$::jsonb, '50', $q$$50\%$ of $100$ is $\frac{50}{100} \times 100 = 50$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1684673b-1921-5d18-ad23-479d3acbe9d3',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $75\%$ of $120$?$q$, $q$[{"text":"90","is_correct":true},{"text":"78","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"102","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"30","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '90', $q$$75\%$ of $120$ is $\frac{75}{100} \times 120 = 90$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d9c6d3bd-4435-56e9-922f-1fa7dc84baa7',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $25\%$ of $100$?$q$, $q$[{"text":"15","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"25","is_correct":true},{"text":"75","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"35","is_correct":false,"misconception_token":"overstated-the-percent"}]$q$::jsonb, '25', $q$$25\%$ of $100$ is $\frac{25}{100} \times 100 = 25$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a4831619-70bb-568b-afc8-fc6cd8671a07',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $75\%$ of $160$?$q$, $q$[{"text":"136","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"104","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"120","is_correct":true},{"text":"40","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '120', $q$$75\%$ of $160$ is $\frac{75}{100} \times 160 = 120$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bdfdbf53-5f7f-5dbf-9f40-d1fa96136757',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $25\%$ of $180$?$q$, $q$[{"text":"135","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"27","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"45","is_correct":true},{"text":"63","is_correct":false,"misconception_token":"overstated-the-percent"}]$q$::jsonb, '45', $q$$25\%$ of $180$ is $\frac{25}{100} \times 180 = 45$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0f68cfba-cde6-5aa4-b18e-003d0cfcd5ae',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $75\%$ of $20$?$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"17","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"15","is_correct":true},{"text":"13","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '15', $q$$75\%$ of $20$ is $\frac{75}{100} \times 20 = 15$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6100f513-e652-52da-8ab2-6d618f0299fc',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $75\%$ of $40$?$q$, $q$[{"text":"30","is_correct":true},{"text":"26","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"34","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"10","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '30', $q$$75\%$ of $40$ is $\frac{75}{100} \times 40 = 30$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('209f3a4c-9407-5699-bd2c-54bba19c1a37',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $75\%$ of $60$?$q$, $q$[{"text":"45","is_correct":true},{"text":"51","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"15","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"39","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '45', $q$$75\%$ of $60$ is $\frac{75}{100} \times 60 = 45$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('79b6e623-4163-5551-9a29-aa69e63f049b',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $25\%$ of $60$?$q$, $q$[{"text":"15","is_correct":true},{"text":"45","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"21","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"9","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '15', $q$$25\%$ of $60$ is $\frac{25}{100} \times 60 = 15$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4e32d8dc-b877-511d-bea8-422f3cd0fb53',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $50\%$ of $160$?$q$, $q$[{"text":"50","is_correct":false,"misconception_token":"answered-the-percent"},{"text":"64","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"96","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"80","is_correct":true}]$q$::jsonb, '80', $q$$50\%$ of $160$ is $\frac{50}{100} \times 160 = 80$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2e85ee91-a967-5162-8674-8227127081ea',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $75\%$ of $80$?$q$, $q$[{"text":"60","is_correct":true},{"text":"68","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"52","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"20","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '60', $q$$75\%$ of $80$ is $\frac{75}{100} \times 80 = 60$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('499595c4-3ee2-53fc-95d3-b7bf407d49e3',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $25\%$ of $200$?$q$, $q$[{"text":"50","is_correct":true},{"text":"150","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"70","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"30","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '50', $q$$25\%$ of $200$ is $\frac{25}{100} \times 200 = 50$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('881643dd-9f74-5f4f-bd78-4d7c59b3f73b',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $50\%$ of $140$?$q$, $q$[{"text":"84","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"56","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"70","is_correct":true},{"text":"50","is_correct":false,"misconception_token":"answered-the-percent"}]$q$::jsonb, '70', $q$$50\%$ of $140$ is $\frac{50}{100} \times 140 = 70$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2d0f3cdf-7fc7-5566-a09b-d71d3439d172',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $75\%$ of $180$?$q$, $q$[{"text":"135","is_correct":true},{"text":"153","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"45","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"117","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '135', $q$$75\%$ of $180$ is $\frac{75}{100} \times 180 = 135$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dc6d1951-c139-55cd-b605-d88927770b77',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $25\%$ of $120$?$q$, $q$[{"text":"30","is_correct":true},{"text":"18","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"42","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"90","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '30', $q$$25\%$ of $120$ is $\frac{25}{100} \times 120 = 30$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('27fc8127-9c3e-5192-b3aa-b6191d791d13',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $25\%$ of $40$?$q$, $q$[{"text":"10","is_correct":true},{"text":"14","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"6","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"30","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '10', $q$$25\%$ of $40$ is $\frac{25}{100} \times 40 = 10$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- =====================================================================
-- percent-of-g6-medium-v3
-- skill: percentages   tier: medium   items: 20
-- standard: 6.RP.A.3.C - any percent of a quantity
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('percent-of-g6-medium-v3',
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"What is ${p}\\%$ of ${n}$?","slots":[{"name":"p","min":10,"max":95,"step":5},{"name":"n","min":20,"max":200,"step":20}],"answerFormula":"p * n / 100","answerFormat":"integer","constraints":["p != 50"],"solutionTemplate":"${p}\\%$ of ${n}$ is $\\frac{{p}}{100} \\times {n} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"(p + 5) * n / 100","misconception_token":"overstated-the-percent"},{"formula":"(p - 5) * n / 100","misconception_token":"understated-the-percent"},{"formula":"n - p * n / 100","misconception_token":"complement-instead-of-percent"},{"formula":"(p + 10) * n / 100","misconception_token":"overstated-the-percent"},{"formula":"p","misconception_token":"answered-the-percent"}]$q$::jsonb,
   'draft', 2)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('265e5c20-92b3-5a66-9846-1a05347f3843',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $55\%$ of $100$?$q$, $q$[{"text":"45","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"50","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"60","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"55","is_correct":true}]$q$::jsonb, '55', $q$$55\%$ of $100$ is $\frac{55}{100} \times 100 = 55$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1d2a705d-b4e9-58fc-b8dc-811f779d799b',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $85\%$ of $120$?$q$, $q$[{"text":"102","is_correct":true},{"text":"96","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"108","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"18","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '102', $q$$85\%$ of $120$ is $\frac{85}{100} \times 120 = 102$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5eb7a56e-4da6-56cc-9ed3-082fa85f5a59',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $30\%$ of $100$?$q$, $q$[{"text":"25","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"30","is_correct":true},{"text":"70","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"35","is_correct":false,"misconception_token":"overstated-the-percent"}]$q$::jsonb, '30', $q$$30\%$ of $100$ is $\frac{30}{100} \times 100 = 30$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3943f911-e0d8-57e5-ab37-f358a60da81b',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $75\%$ of $160$?$q$, $q$[{"text":"128","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"112","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"120","is_correct":true},{"text":"40","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '120', $q$$75\%$ of $160$ is $\frac{75}{100} \times 160 = 120$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ac79324f-1cdc-524b-888b-d2134d06deb4',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $25\%$ of $180$?$q$, $q$[{"text":"135","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"36","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"45","is_correct":true},{"text":"54","is_correct":false,"misconception_token":"overstated-the-percent"}]$q$::jsonb, '45', $q$$25\%$ of $180$ is $\frac{25}{100} \times 180 = 45$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2cedebaa-00b2-5b98-b85c-38fe5a9a41fa',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $25\%$ of $100$?$q$, $q$[{"text":"75","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"30","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"25","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '25', $q$$25\%$ of $100$ is $\frac{25}{100} \times 100 = 25$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e9326c0e-f457-54d4-9099-f315c446a85c',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $90\%$ of $20$?$q$, $q$[{"text":"2","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"19","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"18","is_correct":true},{"text":"17","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '18', $q$$90\%$ of $20$ is $\frac{90}{100} \times 20 = 18$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1c45e168-1d85-5bce-83f2-7b2c00563323',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $70\%$ of $40$?$q$, $q$[{"text":"28","is_correct":true},{"text":"26","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"30","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"12","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '28', $q$$70\%$ of $40$ is $\frac{70}{100} \times 40 = 28$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('22dfb069-b3cd-5ab3-b888-b49928b5385e',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $70\%$ of $160$?$q$, $q$[{"text":"112","is_correct":true},{"text":"48","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"120","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"104","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '112', $q$$70\%$ of $160$ is $\frac{70}{100} \times 160 = 112$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f0dc14a8-46ca-5230-8155-d09dc5392b01',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $75\%$ of $40$?$q$, $q$[{"text":"30","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"28","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"32","is_correct":false,"misconception_token":"overstated-the-percent"}]$q$::jsonb, '30', $q$$75\%$ of $40$ is $\frac{75}{100} \times 40 = 30$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f115a5ea-d141-571e-b2a6-fd07f96d3cdc',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $90\%$ of $60$?$q$, $q$[{"text":"54","is_correct":true},{"text":"57","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"6","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"51","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '54', $q$$90\%$ of $60$ is $\frac{90}{100} \times 60 = 54$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ef29309f-8c93-50a1-8b75-968b0e76c03b',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $30\%$ of $60$?$q$, $q$[{"text":"18","is_correct":true},{"text":"42","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"21","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"15","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '18', $q$$30\%$ of $60$ is $\frac{30}{100} \times 60 = 18$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('07acb424-5d83-53c1-b35e-6da3a393b285',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $60\%$ of $160$?$q$, $q$[{"text":"64","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"88","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"104","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"96","is_correct":true}]$q$::jsonb, '96', $q$$60\%$ of $160$ is $\frac{60}{100} \times 160 = 96$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0a6f52bc-e33a-56cb-947c-674211adee9b',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $75\%$ of $80$?$q$, $q$[{"text":"60","is_correct":true},{"text":"64","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"56","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"20","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '60', $q$$75\%$ of $80$ is $\frac{75}{100} \times 80 = 60$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5a993d66-8d1c-5ed7-80e4-23b69fdd7cfe',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $10\%$ of $200$?$q$, $q$[{"text":"20","is_correct":true},{"text":"180","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"30","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"10","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '20', $q$$10\%$ of $200$ is $\frac{10}{100} \times 200 = 20$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d53b7daa-fc07-5420-9890-5ab2eccacd96',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $90\%$ of $80$?$q$, $q$[{"text":"68","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"8","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"72","is_correct":true},{"text":"76","is_correct":false,"misconception_token":"overstated-the-percent"}]$q$::jsonb, '72', $q$$90\%$ of $80$ is $\frac{90}{100} \times 80 = 72$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('de8c66ec-bdf5-5b90-9800-0932e3ca27e1',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $20\%$ of $100$?$q$, $q$[{"text":"25","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"15","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"80","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"20","is_correct":true}]$q$::jsonb, '20', $q$$20\%$ of $100$ is $\frac{20}{100} \times 100 = 20$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fb482676-f294-51c1-9e09-d27d4f61a99b',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $75\%$ of $180$?$q$, $q$[{"text":"135","is_correct":true},{"text":"144","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"45","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"126","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '135', $q$$75\%$ of $180$ is $\frac{75}{100} \times 180 = 135$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('88961a17-d37c-5217-8a92-5c96a54e72ff',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $95\%$ of $60$?$q$, $q$[{"text":"60","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"3","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"54","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"57","is_correct":true}]$q$::jsonb, '57', $q$$95\%$ of $60$ is $\frac{95}{100} \times 60 = 57$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fcbf5803-6ab2-5a58-95cc-8322e5eef078',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $30\%$ of $120$?$q$, $q$[{"text":"36","is_correct":true},{"text":"30","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"42","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"84","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '36', $q$$30\%$ of $120$ is $\frac{30}{100} \times 120 = 36$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- =====================================================================
-- percent-of-g6-hard-v3
-- skill: percentages   tier: hard   items: 12
-- standard: 6.RP.A.3.C - find the whole given a part and the percent
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('percent-of-g6-hard-v3',
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'hard', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"${part}$ is ${p}\\%$ of what number?","slots":[{"name":"p","min":10,"max":80,"step":10},{"name":"n","min":20,"max":200,"step":20}],"derived":[{"name":"part","formula":"p * n / 100"}],"answerFormula":"n","answerFormat":"integer","constraints":["p != 100"],"solutionTemplate":"${p}\\%$ is $\\frac{{p}}{100}$ of the number, so the number is ${part} \\div \\frac{{p}}{100} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"part * p / 100","misconception_token":"took-the-percent-again"},{"formula":"part + p","misconception_token":"added-instead-of-scaled"},{"formula":"part","misconception_token":"answered-the-part"},{"formula":"n - part","misconception_token":"complement-instead-of-percent"},{"formula":"n + part","misconception_token":"overstated-the-percent"}]$q$::jsonb,
   'draft', 2)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f20acaec-a335-5d94-8a42-f8940f14f2d6',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'hard',
   $q$$50$ is $50\%$ of what number?$q$, $q$[{"text":"150","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"50","is_correct":false,"misconception_token":"answered-the-part"},{"text":"25","is_correct":false,"misconception_token":"took-the-percent-again"},{"text":"100","is_correct":true}]$q$::jsonb, '100', $q$$50\%$ is $\frac{50}{100}$ of the number, so the number is $50 \div \frac{50}{100} = 100$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('03eb8051-9866-5ec2-a4b1-744d108cce1e',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'hard',
   $q$$84$ is $70\%$ of what number?$q$, $q$[{"text":"120","is_correct":true},{"text":"84","is_correct":false,"misconception_token":"answered-the-part"},{"text":"154","is_correct":false,"misconception_token":"added-instead-of-scaled"},{"text":"36","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '120', $q$$70\%$ is $\frac{70}{100}$ of the number, so the number is $84 \div \frac{70}{100} = 120$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3ffcdc0c-f886-5b42-b999-ea580c31c65c',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'hard',
   $q$$30$ is $30\%$ of what number?$q$, $q$[{"text":"60","is_correct":false,"misconception_token":"added-instead-of-scaled"},{"text":"100","is_correct":true},{"text":"30","is_correct":false,"misconception_token":"answered-the-part"},{"text":"9","is_correct":false,"misconception_token":"took-the-percent-again"}]$q$::jsonb, '100', $q$$30\%$ is $\frac{30}{100}$ of the number, so the number is $30 \div \frac{30}{100} = 100$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6ac05d6c-1bd5-5176-996e-a61a41b76758',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'hard',
   $q$$112$ is $70\%$ of what number?$q$, $q$[{"text":"182","is_correct":false,"misconception_token":"added-instead-of-scaled"},{"text":"112","is_correct":false,"misconception_token":"answered-the-part"},{"text":"160","is_correct":true},{"text":"48","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '160', $q$$70\%$ is $\frac{70}{100}$ of the number, so the number is $112 \div \frac{70}{100} = 160$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ab2dccf4-f342-5270-90de-25b7b24c1332',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'hard',
   $q$$36$ is $20\%$ of what number?$q$, $q$[{"text":"144","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"36","is_correct":false,"misconception_token":"answered-the-part"},{"text":"180","is_correct":true},{"text":"56","is_correct":false,"misconception_token":"added-instead-of-scaled"}]$q$::jsonb, '180', $q$$20\%$ is $\frac{20}{100}$ of the number, so the number is $36 \div \frac{20}{100} = 180$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5435bfa3-818e-57e7-88ca-1fad1c59c5f4',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'hard',
   $q$$20$ is $20\%$ of what number?$q$, $q$[{"text":"20","is_correct":false,"misconception_token":"answered-the-part"},{"text":"4","is_correct":false,"misconception_token":"took-the-percent-again"},{"text":"100","is_correct":true},{"text":"40","is_correct":false,"misconception_token":"added-instead-of-scaled"}]$q$::jsonb, '100', $q$$20\%$ is $\frac{20}{100}$ of the number, so the number is $20 \div \frac{20}{100} = 100$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('243e9fd6-7caf-5f19-b889-01f73737ef4b',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'hard',
   $q$$16$ is $80\%$ of what number?$q$, $q$[{"text":"4","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"96","is_correct":false,"misconception_token":"added-instead-of-scaled"},{"text":"20","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"answered-the-part"}]$q$::jsonb, '20', $q$$80\%$ is $\frac{80}{100}$ of the number, so the number is $16 \div \frac{80}{100} = 20$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('76a94daa-dc0a-5274-9abf-ad19542b8072',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'hard',
   $q$$24$ is $60\%$ of what number?$q$, $q$[{"text":"40","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"answered-the-part"},{"text":"84","is_correct":false,"misconception_token":"added-instead-of-scaled"},{"text":"16","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '40', $q$$60\%$ is $\frac{60}{100}$ of the number, so the number is $24 \div \frac{60}{100} = 40$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('777770fd-5ad1-5fd3-8c72-a91aa54dc517',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'hard',
   $q$$96$ is $60\%$ of what number?$q$, $q$[{"text":"160","is_correct":true},{"text":"64","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"156","is_correct":false,"misconception_token":"added-instead-of-scaled"},{"text":"96","is_correct":false,"misconception_token":"answered-the-part"}]$q$::jsonb, '160', $q$$60\%$ is $\frac{60}{100}$ of the number, so the number is $96 \div \frac{60}{100} = 160$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ce48f6b7-ffdc-53d2-8337-0b756508c5d3',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'hard',
   $q$$28$ is $70\%$ of what number?$q$, $q$[{"text":"40","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"28","is_correct":false,"misconception_token":"answered-the-part"},{"text":"98","is_correct":false,"misconception_token":"added-instead-of-scaled"}]$q$::jsonb, '40', $q$$70\%$ is $\frac{70}{100}$ of the number, so the number is $28 \div \frac{70}{100} = 40$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('34225f4b-c9c8-597c-bbaf-fa669ef7fbb2',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'hard',
   $q$$48$ is $80\%$ of what number?$q$, $q$[{"text":"60","is_correct":true},{"text":"128","is_correct":false,"misconception_token":"added-instead-of-scaled"},{"text":"12","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"48","is_correct":false,"misconception_token":"answered-the-part"}]$q$::jsonb, '60', $q$$80\%$ is $\frac{80}{100}$ of the number, so the number is $48 \div \frac{80}{100} = 60$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2f5c696b-941b-5eac-bdef-6a6f31bde6b2',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v3'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'hard',
   $q$$12$ is $20\%$ of what number?$q$, $q$[{"text":"60","is_correct":true},{"text":"48","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"32","is_correct":false,"misconception_token":"added-instead-of-scaled"},{"text":"12","is_correct":false,"misconception_token":"answered-the-part"}]$q$::jsonb, '60', $q$$20\%$ is $\frac{20}{100}$ of the number, so the number is $12 \div \frac{20}{100} = 60$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- =====================================================================
-- mean-from-total-g6-easy-v3
-- skill: data-analysis   tier: easy   items: 16
-- standard: 6.SP.B.5.C - the mean of a small dataset
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('mean-from-total-g6-easy-v3',
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"A team scored ${total}$ points in ${n}$ games. What was the mean (average) number of points per game?","slots":[{"name":"n","min":3,"max":7},{"name":"q","min":10,"max":30,"step":5}],"derived":[{"name":"total","formula":"n * q"}],"answerFormula":"q","answerFormat":"integer","solutionTemplate":"The mean is the total shared equally: ${total} \\div {n} = {answer}$ points per game."}$q$::jsonb,
   $q$[{"formula":"q + 5","misconception_token":"mean-too-high"},{"formula":"q - 5","misconception_token":"mean-too-low"},{"formula":"total","misconception_token":"forgot-to-divide-total"},{"formula":"total - n","misconception_token":"subtracted-instead-of-divided"},{"formula":"n","misconception_token":"answered-the-count"}]$q$::jsonb,
   'draft', 2)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ac51b288-177c-53a7-963f-f68e7a1917c0',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy',
   $q$A team scored $100$ points in $5$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"100","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"15","is_correct":false,"misconception_token":"mean-too-low"},{"text":"25","is_correct":false,"misconception_token":"mean-too-high"},{"text":"20","is_correct":true}]$q$::jsonb, '20', $q$The mean is the total shared equally: $100 \div 5 = 20$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c94711de-6716-54e9-9531-e2a1b06d9075',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy',
   $q$A team scored $140$ points in $7$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"20","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"mean-too-low"},{"text":"25","is_correct":false,"misconception_token":"mean-too-high"},{"text":"140","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '20', $q$The mean is the total shared equally: $140 \div 7 = 20$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2db727ab-9a7b-593e-8969-2fe6d845c6b0',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy',
   $q$A team scored $80$ points in $4$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"15","is_correct":false,"misconception_token":"mean-too-low"},{"text":"20","is_correct":true},{"text":"80","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"25","is_correct":false,"misconception_token":"mean-too-high"}]$q$::jsonb, '20', $q$The mean is the total shared equally: $80 \div 4 = 20$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2cbfe9c5-ed4c-5eee-a3e5-75add60ac02c',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy',
   $q$A team scored $150$ points in $6$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"30","is_correct":false,"misconception_token":"mean-too-high"},{"text":"20","is_correct":false,"misconception_token":"mean-too-low"},{"text":"25","is_correct":true},{"text":"150","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '25', $q$The mean is the total shared equally: $150 \div 6 = 25$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b70107cf-a083-534d-807b-ec84d7be20f6',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy',
   $q$A team scored $120$ points in $4$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"120","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"25","is_correct":false,"misconception_token":"mean-too-low"},{"text":"30","is_correct":true},{"text":"35","is_correct":false,"misconception_token":"mean-too-high"}]$q$::jsonb, '30', $q$The mean is the total shared equally: $120 \div 4 = 30$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5b675068-1179-5f5f-97be-ef9423724f55',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy',
   $q$A team scored $60$ points in $3$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"60","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"25","is_correct":false,"misconception_token":"mean-too-high"},{"text":"20","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '20', $q$The mean is the total shared equally: $60 \div 3 = 20$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a47b3380-8d57-5318-86e6-b0a32fae7f12',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy',
   $q$A team scored $70$ points in $7$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"70","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"15","is_correct":false,"misconception_token":"mean-too-high"},{"text":"10","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '10', $q$The mean is the total shared equally: $70 \div 7 = 10$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('43b671c6-0875-5e72-aa87-3e71c6eafac0',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy',
   $q$A team scored $60$ points in $6$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"10","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"mean-too-low"},{"text":"15","is_correct":false,"misconception_token":"mean-too-high"},{"text":"60","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '10', $q$The mean is the total shared equally: $60 \div 6 = 10$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cdfd880e-073d-54ab-a8ff-597aaf325590',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy',
   $q$A team scored $105$ points in $7$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"15","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"mean-too-high"},{"text":"105","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"10","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '15', $q$The mean is the total shared equally: $105 \div 7 = 15$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bb71cf42-a96f-5d75-9409-2a0a4a8b65a2',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy',
   $q$A team scored $60$ points in $4$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"15","is_correct":true},{"text":"60","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"20","is_correct":false,"misconception_token":"mean-too-high"},{"text":"10","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '15', $q$The mean is the total shared equally: $60 \div 4 = 15$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ee75e3b7-9c84-5f5f-81c5-5204d3c77cb4',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy',
   $q$A team scored $125$ points in $5$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"125","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"20","is_correct":false,"misconception_token":"mean-too-low"},{"text":"30","is_correct":false,"misconception_token":"mean-too-high"},{"text":"25","is_correct":true}]$q$::jsonb, '25', $q$The mean is the total shared equally: $125 \div 5 = 25$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6565de77-9919-53ab-9833-3c5910ccf686',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy',
   $q$A team scored $90$ points in $6$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"15","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"mean-too-high"},{"text":"10","is_correct":false,"misconception_token":"mean-too-low"},{"text":"90","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '15', $q$The mean is the total shared equally: $90 \div 6 = 15$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('38d20944-7b3b-5259-bfdb-808d52a0fec1',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy',
   $q$A team scored $90$ points in $3$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"30","is_correct":true},{"text":"90","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"35","is_correct":false,"misconception_token":"mean-too-high"},{"text":"25","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '30', $q$The mean is the total shared equally: $90 \div 3 = 30$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b32f26cf-6b64-5113-bfa4-d066e249eb16',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy',
   $q$A team scored $180$ points in $6$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"30","is_correct":true},{"text":"35","is_correct":false,"misconception_token":"mean-too-high"},{"text":"180","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"25","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '30', $q$The mean is the total shared equally: $180 \div 6 = 30$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d0c396e5-b1b6-5b84-a890-96a573ef7e47',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy',
   $q$A team scored $30$ points in $3$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"10","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"mean-too-high"},{"text":"5","is_correct":false,"misconception_token":"mean-too-low"},{"text":"30","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '10', $q$The mean is the total shared equally: $30 \div 3 = 10$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1e9d4d8c-4b1a-59b2-88ce-681ef7197244',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'easy',
   $q$A team scored $120$ points in $6$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"20","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"mean-too-low"},{"text":"25","is_correct":false,"misconception_token":"mean-too-high"},{"text":"120","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '20', $q$The mean is the total shared equally: $120 \div 6 = 20$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- =====================================================================
-- mean-from-total-g6-medium-v3
-- skill: data-analysis   tier: medium   items: 20
-- standard: 6.SP.B.5.C - the mean of a larger dataset
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('mean-from-total-g6-medium-v3',
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"A team scored ${total}$ points in ${n}$ games. What was the mean (average) number of points per game?","slots":[{"name":"n","min":4,"max":9},{"name":"q","min":7,"max":34}],"derived":[{"name":"total","formula":"n * q"}],"answerFormula":"q","answerFormat":"integer","solutionTemplate":"The mean is the total shared equally: ${total} \\div {n} = {answer}$ points per game."}$q$::jsonb,
   $q$[{"formula":"q + 1","misconception_token":"mean-too-high"},{"formula":"q - 1","misconception_token":"mean-too-low"},{"formula":"total","misconception_token":"forgot-to-divide-total"},{"formula":"total - n","misconception_token":"subtracted-instead-of-divided"},{"formula":"n","misconception_token":"answered-the-count"}]$q$::jsonb,
   'draft', 2)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9881130a-c603-5ca3-9b55-c0e8d049c0c4',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $133$ points in $7$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"133","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"18","is_correct":false,"misconception_token":"mean-too-low"},{"text":"20","is_correct":false,"misconception_token":"mean-too-high"},{"text":"19","is_correct":true}]$q$::jsonb, '19', $q$The mean is the total shared equally: $133 \div 7 = 19$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fb6613e9-accd-549a-bb23-7d143c649c82',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $198$ points in $9$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"22","is_correct":true},{"text":"21","is_correct":false,"misconception_token":"mean-too-low"},{"text":"23","is_correct":false,"misconception_token":"mean-too-high"},{"text":"198","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '22', $q$The mean is the total shared equally: $198 \div 9 = 22$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3894f3d8-9c49-5ac0-b17a-007a5b7c7d0b',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $90$ points in $5$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"17","is_correct":false,"misconception_token":"mean-too-low"},{"text":"18","is_correct":true},{"text":"90","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"19","is_correct":false,"misconception_token":"mean-too-high"}]$q$::jsonb, '18', $q$The mean is the total shared equally: $90 \div 5 = 18$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('43111d55-23fd-5351-8162-119b7bd0d261',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $224$ points in $8$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"29","is_correct":false,"misconception_token":"mean-too-high"},{"text":"27","is_correct":false,"misconception_token":"mean-too-low"},{"text":"28","is_correct":true},{"text":"224","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '28', $q$The mean is the total shared equally: $224 \div 8 = 28$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f2b9ece8-befe-57bb-9b0d-01573c4069bd',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $155$ points in $5$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"155","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"30","is_correct":false,"misconception_token":"mean-too-low"},{"text":"31","is_correct":true},{"text":"32","is_correct":false,"misconception_token":"mean-too-high"}]$q$::jsonb, '31', $q$The mean is the total shared equally: $155 \div 5 = 31$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a7ad5045-9d62-5919-9d38-36f232d3b010',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $63$ points in $9$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"63","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"8","is_correct":false,"misconception_token":"mean-too-high"},{"text":"7","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '7', $q$The mean is the total shared equally: $63 \div 9 = 7$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ee27e271-881e-5bcc-a438-a68adb217962',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $88$ points in $8$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"11","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"mean-too-low"},{"text":"12","is_correct":false,"misconception_token":"mean-too-high"},{"text":"88","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '11', $q$The mean is the total shared equally: $88 \div 8 = 11$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a82ca634-0b2f-573d-98e4-a7aec90accb7',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $216$ points in $8$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"27","is_correct":true},{"text":"216","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"28","is_correct":false,"misconception_token":"mean-too-high"},{"text":"26","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '27', $q$The mean is the total shared equally: $216 \div 8 = 27$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fdff352e-e4f5-5654-bb3e-6c99127f09d8',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $108$ points in $9$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"12","is_correct":true},{"text":"13","is_correct":false,"misconception_token":"mean-too-high"},{"text":"108","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"11","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '12', $q$The mean is the total shared equally: $108 \div 9 = 12$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3ae79dd9-d683-576b-9bce-0b11d386e26b',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $75$ points in $5$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"15","is_correct":true},{"text":"75","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"16","is_correct":false,"misconception_token":"mean-too-high"},{"text":"14","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '15', $q$The mean is the total shared equally: $75 \div 5 = 15$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c3aaa1b4-c1bd-5152-8a2b-173314fdf69b',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $189$ points in $7$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"189","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"26","is_correct":false,"misconception_token":"mean-too-low"},{"text":"28","is_correct":false,"misconception_token":"mean-too-high"},{"text":"27","is_correct":true}]$q$::jsonb, '27', $q$The mean is the total shared equally: $189 \div 7 = 27$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ff5c6ab7-68af-532e-8ed7-8312df4bb977',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $128$ points in $8$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"16","is_correct":true},{"text":"17","is_correct":false,"misconception_token":"mean-too-high"},{"text":"15","is_correct":false,"misconception_token":"mean-too-low"},{"text":"128","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '16', $q$The mean is the total shared equally: $128 \div 8 = 16$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a19ebae8-fb11-5e3b-940b-e588bf58dc05',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $128$ points in $4$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"32","is_correct":true},{"text":"128","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"33","is_correct":false,"misconception_token":"mean-too-high"},{"text":"31","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '32', $q$The mean is the total shared equally: $128 \div 4 = 32$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b23fd074-d900-514b-bab8-41257e2d51d9',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $144$ points in $6$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"25","is_correct":false,"misconception_token":"mean-too-high"},{"text":"23","is_correct":false,"misconception_token":"mean-too-low"},{"text":"24","is_correct":true},{"text":"144","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '24', $q$The mean is the total shared equally: $144 \div 6 = 24$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4cd03fce-e500-5bf5-8a2f-6b56a229720d',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $76$ points in $4$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"20","is_correct":false,"misconception_token":"mean-too-high"},{"text":"18","is_correct":false,"misconception_token":"mean-too-low"},{"text":"76","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"19","is_correct":true}]$q$::jsonb, '19', $q$The mean is the total shared equally: $76 \div 4 = 19$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('65972843-3375-5265-880d-5e184cfc57c8',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $240$ points in $8$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"30","is_correct":true},{"text":"31","is_correct":false,"misconception_token":"mean-too-high"},{"text":"240","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"29","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '30', $q$The mean is the total shared equally: $240 \div 8 = 30$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('016d18cc-68df-53fe-8347-1e2614da0aac',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $117$ points in $9$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"14","is_correct":false,"misconception_token":"mean-too-high"},{"text":"117","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"12","is_correct":false,"misconception_token":"mean-too-low"},{"text":"13","is_correct":true}]$q$::jsonb, '13', $q$The mean is the total shared equally: $117 \div 9 = 13$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e6e85198-3192-521c-a247-d7ac18d33465',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $105$ points in $5$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"21","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"mean-too-low"},{"text":"22","is_correct":false,"misconception_token":"mean-too-high"},{"text":"105","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '21', $q$The mean is the total shared equally: $105 \div 5 = 21$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7dff7e17-9b71-5907-a75e-c3e41280741a',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $60$ points in $5$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"12","is_correct":true},{"text":"13","is_correct":false,"misconception_token":"mean-too-high"},{"text":"11","is_correct":false,"misconception_token":"mean-too-low"},{"text":"60","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '12', $q$The mean is the total shared equally: $60 \div 5 = 12$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7614fcbb-2751-56b7-974f-c9ae0b5315a6',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $232$ points in $8$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"29","is_correct":true},{"text":"30","is_correct":false,"misconception_token":"mean-too-high"},{"text":"232","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"28","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '29', $q$The mean is the total shared equally: $232 \div 8 = 29$ points per game.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- =====================================================================
-- mean-from-total-g6-hard-v3
-- skill: data-analysis   tier: hard   items: 12
-- standard: 6.SP.B.5 - recover a missing value from the mean
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('mean-from-total-g6-hard-v3',
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'hard', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"Over ${n}$ games a team averaged ${q}$ points per game. In the first ${nMinus1}$ games they scored ${soFar}$ points in total. How many points did they score in the last game?","slots":[{"name":"n","min":4,"max":8},{"name":"q","min":8,"max":30},{"name":"last","min":2,"max":40}],"derived":[{"name":"total","formula":"n * q"},{"name":"nMinus1","formula":"n - 1"},{"name":"soFar","formula":"n * q - last"}],"answerFormula":"last","answerFormat":"integer","constraints":["soFar > 0","last != q","soFar > last"],"solutionTemplate":"The whole season is ${n} \\times {q} = {total}$ points. Take away the first ${nMinus1}$ games: ${total} - {soFar} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"q","misconception_token":"answered-the-mean"},{"formula":"total","misconception_token":"forgot-to-divide-total"},{"formula":"soFar - q","misconception_token":"subtracted-the-mean-instead"},{"formula":"last + q","misconception_token":"mean-too-high"},{"formula":"total - q","misconception_token":"dropped-one-game"}]$q$::jsonb,
   'draft', 2)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6bb5c26b-5d70-5e59-bd2f-56d2acc4a888',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'hard',
   $q$Over $6$ games a team averaged $18$ points per game. In the first $5$ games they scored $97$ points in total. How many points did they score in the last game?$q$, $q$[{"text":"11","is_correct":true},{"text":"18","is_correct":false,"misconception_token":"answered-the-mean"},{"text":"79","is_correct":false,"misconception_token":"subtracted-the-mean-instead"},{"text":"108","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '11', $q$The whole season is $6 \times 18 = 108$ points. Take away the first $5$ games: $108 - 97 = 11$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bc92d5d2-f287-595d-873c-fd82927128db',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'hard',
   $q$Over $8$ games a team averaged $20$ points per game. In the first $7$ games they scored $129$ points in total. How many points did they score in the last game?$q$, $q$[{"text":"20","is_correct":false,"misconception_token":"answered-the-mean"},{"text":"31","is_correct":true},{"text":"109","is_correct":false,"misconception_token":"subtracted-the-mean-instead"},{"text":"160","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '31', $q$The whole season is $8 \times 20 = 160$ points. Take away the first $7$ games: $160 - 129 = 31$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('649dce7c-94f2-5915-ac99-e262bef90141',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'hard',
   $q$Over $5$ games a team averaged $17$ points per game. In the first $4$ games they scored $65$ points in total. How many points did they score in the last game?$q$, $q$[{"text":"48","is_correct":false,"misconception_token":"subtracted-the-mean-instead"},{"text":"85","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"20","is_correct":true},{"text":"17","is_correct":false,"misconception_token":"answered-the-mean"}]$q$::jsonb, '20', $q$The whole season is $5 \times 17 = 85$ points. Take away the first $4$ games: $85 - 65 = 20$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('93c2f0e8-5a5d-50db-91c6-bada163c772e',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'hard',
   $q$Over $7$ games a team averaged $25$ points per game. In the first $6$ games they scored $135$ points in total. How many points did they score in the last game?$q$, $q$[{"text":"175","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"25","is_correct":false,"misconception_token":"answered-the-mean"},{"text":"110","is_correct":false,"misconception_token":"subtracted-the-mean-instead"},{"text":"40","is_correct":true}]$q$::jsonb, '40', $q$The whole season is $7 \times 25 = 175$ points. Take away the first $6$ games: $175 - 135 = 40$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0958d817-0f5e-5789-b60b-700d83e316d1',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'hard',
   $q$Over $5$ games a team averaged $28$ points per game. In the first $4$ games they scored $125$ points in total. How many points did they score in the last game?$q$, $q$[{"text":"28","is_correct":false,"misconception_token":"answered-the-mean"},{"text":"140","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"97","is_correct":false,"misconception_token":"subtracted-the-mean-instead"},{"text":"15","is_correct":true}]$q$::jsonb, '15', $q$The whole season is $5 \times 28 = 140$ points. Take away the first $4$ games: $140 - 125 = 15$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8171046f-02bb-5b42-ace3-eb6ed94a6bb3',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'hard',
   $q$Over $4$ games a team averaged $17$ points per game. In the first $3$ games they scored $42$ points in total. How many points did they score in the last game?$q$, $q$[{"text":"17","is_correct":false,"misconception_token":"answered-the-mean"},{"text":"25","is_correct":false,"misconception_token":"subtracted-the-mean-instead"},{"text":"68","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"26","is_correct":true}]$q$::jsonb, '26', $q$The whole season is $4 \times 17 = 68$ points. Take away the first $3$ games: $68 - 42 = 26$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('da488ba4-54ce-5f90-ae97-f8c7fc8f0f6b',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'hard',
   $q$Over $8$ games a team averaged $8$ points per game. In the first $7$ games they scored $42$ points in total. How many points did they score in the last game?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"answered-the-mean"},{"text":"34","is_correct":false,"misconception_token":"subtracted-the-mean-instead"},{"text":"64","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"22","is_correct":true}]$q$::jsonb, '22', $q$The whole season is $8 \times 8 = 64$ points. Take away the first $7$ games: $64 - 42 = 22$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('50eb20a4-4a35-5cbf-b8b0-a48a65c05279',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'hard',
   $q$Over $7$ games a team averaged $11$ points per game. In the first $6$ games they scored $45$ points in total. How many points did they score in the last game?$q$, $q$[{"text":"32","is_correct":true},{"text":"11","is_correct":false,"misconception_token":"answered-the-mean"},{"text":"34","is_correct":false,"misconception_token":"subtracted-the-mean-instead"},{"text":"77","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '32', $q$The whole season is $7 \times 11 = 77$ points. Take away the first $6$ games: $77 - 45 = 32$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e51f8705-6ece-5560-91a1-c009b28f7a4b',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'hard',
   $q$Over $7$ games a team averaged $25$ points per game. In the first $6$ games they scored $147$ points in total. How many points did they score in the last game?$q$, $q$[{"text":"25","is_correct":false,"misconception_token":"answered-the-mean"},{"text":"28","is_correct":true},{"text":"122","is_correct":false,"misconception_token":"subtracted-the-mean-instead"},{"text":"175","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '28', $q$The whole season is $7 \times 25 = 175$ points. Take away the first $6$ games: $175 - 147 = 28$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('94eefe8c-8866-5325-925d-cbff7d2f30db',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'hard',
   $q$Over $7$ games a team averaged $11$ points per game. In the first $6$ games they scored $63$ points in total. How many points did they score in the last game?$q$, $q$[{"text":"14","is_correct":true},{"text":"11","is_correct":false,"misconception_token":"answered-the-mean"},{"text":"77","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"52","is_correct":false,"misconception_token":"subtracted-the-mean-instead"}]$q$::jsonb, '14', $q$The whole season is $7 \times 11 = 77$ points. Take away the first $6$ games: $77 - 63 = 14$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2daf5506-a522-5bd1-822c-1372437bd4d2',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'hard',
   $q$Over $8$ games a team averaged $12$ points per game. In the first $7$ games they scored $71$ points in total. How many points did they score in the last game?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"answered-the-mean"},{"text":"25","is_correct":true},{"text":"96","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"59","is_correct":false,"misconception_token":"subtracted-the-mean-instead"}]$q$::jsonb, '25', $q$The whole season is $8 \times 12 = 96$ points. Take away the first $7$ games: $96 - 71 = 25$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('677e656c-8971-5190-828e-35072d0ebbfb',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v3'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'hard',
   $q$Over $5$ games a team averaged $14$ points per game. In the first $4$ games they scored $49$ points in total. How many points did they score in the last game?$q$, $q$[{"text":"35","is_correct":false,"misconception_token":"subtracted-the-mean-instead"},{"text":"21","is_correct":true},{"text":"14","is_correct":false,"misconception_token":"answered-the-mean"},{"text":"70","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '21', $q$The whole season is $5 \times 14 = 70$ points. Take away the first $4$ games: $70 - 49 = 21$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- Report what landed, so applying this is verifiable at a glance.
select sk.slug, gq.difficulty, count(*) as drafted
from public.generated_questions gq
join public.skills sk on sk.id = gq.skill_id
where gq.status = 'draft'
group by 1, 2 order by 1, 2;

commit;
