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
--             ends -v2 and is new, so no deterministic id can collide with the
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
-- multiplication-g3-easy-v2
-- skill: multiplication   tier: easy   items: 16
-- standard: 3.OA.C.7 - multiply within 100 (friendly factors)
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('multiplication-g3-easy-v2',
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"What is ${a} \\times {b}$?","slots":[{"name":"a","min":2,"max":5},{"name":"b","min":2,"max":10}],"answerFormula":"a * b","answerFormat":"integer","constraints":["a * b <= 100"],"solutionTemplate":"${a} \\times {b} = {answer}$."}$q$::jsonb,
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
  ('1abfa0fa-46b8-5470-b49d-714cb99d8f47',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $4 \times 6$?$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"30","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"20","is_correct":false,"misconception_token":"skip-count-error"},{"text":"24","is_correct":true}]$q$::jsonb, '24', $q$$4 \times 6 = 24$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0058b638-8654-5361-84f8-7cce6d7522d5',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $5 \times 6$?$q$, $q$[{"text":"30","is_correct":true},{"text":"36","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"25","is_correct":false,"misconception_token":"skip-count-error"},{"text":"11","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '30', $q$$5 \times 6 = 30$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2c52d463-6110-5bca-a304-d1f91562cec0',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $3 \times 5$?$q$, $q$[{"text":"20","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"15","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"12","is_correct":false,"misconception_token":"skip-count-error"}]$q$::jsonb, '15', $q$$3 \times 5 = 15$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bf8dd796-d83c-5b54-82aa-5b1e86852d19',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $5 \times 8$?$q$, $q$[{"text":"35","is_correct":false,"misconception_token":"skip-count-error"},{"text":"48","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"40","is_correct":true},{"text":"13","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '40', $q$$5 \times 8 = 40$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('048c9b8c-ce1d-5b0d-bdcd-97471017dba6',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $2 \times 9$?$q$, $q$[{"text":"11","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"27","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"18","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"skip-count-error"}]$q$::jsonb, '18', $q$$2 \times 9 = 18$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8a235c9d-83a8-5fb4-aa58-41959ae2705a',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $2 \times 5$?$q$, $q$[{"text":"7","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"8","is_correct":false,"misconception_token":"skip-count-error"},{"text":"10","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '10', $q$$2 \times 5 = 10$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5e998b6b-9148-587f-ab6b-e713156e3371',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $5 \times 2$?$q$, $q$[{"text":"7","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"5","is_correct":false,"misconception_token":"skip-count-error"},{"text":"10","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '10', $q$$5 \times 2 = 10$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cf48fe80-45e8-58cf-bfb7-e8c0b2ead241',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $4 \times 3$?$q$, $q$[{"text":"12","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"8","is_correct":false,"misconception_token":"skip-count-error"},{"text":"7","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '12', $q$$4 \times 3 = 12$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('87302b61-d3ef-5454-b177-8e9759f4cea7',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $4 \times 8$?$q$, $q$[{"text":"32","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"28","is_correct":false,"misconception_token":"skip-count-error"},{"text":"40","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '32', $q$$4 \times 8 = 32$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('acf99761-004f-571b-9624-b1b531a0fdf6',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $5 \times 3$?$q$, $q$[{"text":"15","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"18","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"10","is_correct":false,"misconception_token":"skip-count-error"}]$q$::jsonb, '15', $q$$5 \times 3 = 15$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9f511780-7c0c-5a51-bf04-cfa8592b4973',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $2 \times 4$?$q$, $q$[{"text":"8","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"counted-an-extra-group"},{"text":"6","is_correct":false,"misconception_token":"skip-count-error"},{"text":"12","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '8', $q$$2 \times 4 = 8$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('54062bc1-d005-5c25-93dd-6b9e7d7df331',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $4 \times 4$?$q$, $q$[{"text":"16","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"skip-count-error"},{"text":"20","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"8","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '16', $q$$4 \times 4 = 16$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c21dfe7c-7758-585e-ac7f-fb4afc380b43',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $2 \times 10$?$q$, $q$[{"text":"20","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"18","is_correct":false,"misconception_token":"skip-count-error"},{"text":"30","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '20', $q$$2 \times 10 = 20$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3e5a00d3-db42-53c8-a296-41f248a9fc66',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $3 \times 7$?$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"skip-count-error"},{"text":"28","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"21","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '21', $q$$3 \times 7 = 21$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a57dd405-31e3-578e-b925-3a07be6cc4ed',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $2 \times 6$?$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"skip-count-error"},{"text":"18","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"8","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"12","is_correct":true}]$q$::jsonb, '12', $q$$2 \times 6 = 12$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('64efdda9-6885-50c8-9b79-b318b57581ce',
   (select id from public.question_templates where code = 'multiplication-g3-easy-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $4 \times 9$?$q$, $q$[{"text":"36","is_correct":true},{"text":"32","is_correct":false,"misconception_token":"skip-count-error"},{"text":"13","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"45","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '36', $q$$4 \times 9 = 36$.$q$, 'draft')
on conflict (id) do update set
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
-- multiplication-g3-medium-v2
-- skill: multiplication   tier: medium   items: 20
-- standard: 3.OA.C.7 - multiply within 100 (the harder facts)
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('multiplication-g3-medium-v2',
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"What is ${a} \\times {b}$?","slots":[{"name":"a","min":6,"max":9},{"name":"b","min":3,"max":9}],"answerFormula":"a * b","answerFormat":"integer","constraints":["a * b <= 100"],"solutionTemplate":"${a} \\times {b} = {answer}$."}$q$::jsonb,
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
  ('74930550-c4b8-53f7-a298-37c8bba8e0a5',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $8 \times 6$?$q$, $q$[{"text":"14","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"54","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"40","is_correct":false,"misconception_token":"skip-count-error"},{"text":"48","is_correct":true}]$q$::jsonb, '48', $q$$8 \times 6 = 48$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('91ff3766-5441-5f2a-93da-eecd05b6d2e4',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
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
  ('9f80899b-cdbc-53f5-a5f3-81d1bcc4fcf8',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $7 \times 5$?$q$, $q$[{"text":"40","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"35","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"28","is_correct":false,"misconception_token":"skip-count-error"}]$q$::jsonb, '35', $q$$7 \times 5 = 35$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('30ca0f35-6807-52da-8177-a2888e0f2f62',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $9 \times 8$?$q$, $q$[{"text":"63","is_correct":false,"misconception_token":"skip-count-error"},{"text":"80","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"72","is_correct":true},{"text":"17","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '72', $q$$9 \times 8 = 72$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cb8b391d-c728-5d58-8d31-65f575764e0b',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $6 \times 9$?$q$, $q$[{"text":"15","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"63","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"54","is_correct":true},{"text":"48","is_correct":false,"misconception_token":"skip-count-error"}]$q$::jsonb, '54', $q$$6 \times 9 = 54$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('099348e4-8cb9-5071-b625-baca12d794be',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $6 \times 5$?$q$, $q$[{"text":"11","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"24","is_correct":false,"misconception_token":"skip-count-error"},{"text":"30","is_correct":true},{"text":"35","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '30', $q$$6 \times 5 = 30$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('21c01b59-a4a9-59fb-835a-a3d1e2a7a54e',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $9 \times 3$?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"18","is_correct":false,"misconception_token":"skip-count-error"},{"text":"27","is_correct":true},{"text":"30","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '27', $q$$9 \times 3 = 27$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('95a40a04-464a-5a4c-8dab-31b623b4d52b',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $8 \times 4$?$q$, $q$[{"text":"32","is_correct":true},{"text":"36","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"24","is_correct":false,"misconception_token":"skip-count-error"},{"text":"12","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '32', $q$$8 \times 4 = 32$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('97af18a5-2a08-56fe-89b7-8fa0afc2428c',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $8 \times 8$?$q$, $q$[{"text":"64","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"56","is_correct":false,"misconception_token":"skip-count-error"},{"text":"72","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '64', $q$$8 \times 8 = 64$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4584e7f3-e7c4-59fe-a5db-725298c03659',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $9 \times 4$?$q$, $q$[{"text":"36","is_correct":true},{"text":"13","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"40","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"27","is_correct":false,"misconception_token":"skip-count-error"}]$q$::jsonb, '36', $q$$9 \times 4 = 36$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7938560b-90bb-5367-95b0-cb9118087bbe',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $8 \times 5$?$q$, $q$[{"text":"40","is_correct":true},{"text":"32","is_correct":false,"misconception_token":"skip-count-error"},{"text":"45","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"13","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '40', $q$$8 \times 5 = 40$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f0089d01-b7ae-59f5-bc7f-360f5891e133',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $7 \times 7$?$q$, $q$[{"text":"42","is_correct":false,"misconception_token":"skip-count-error"},{"text":"56","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"49","is_correct":true},{"text":"14","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '49', $q$$7 \times 7 = 49$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fdf2028f-04f7-57d8-a676-5ca1c7670557',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $6 \times 6$?$q$, $q$[{"text":"30","is_correct":false,"misconception_token":"skip-count-error"},{"text":"42","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"12","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"36","is_correct":true}]$q$::jsonb, '36', $q$$6 \times 6 = 36$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0549a5a6-d91e-5f51-9f29-75e2c84eed95',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $7 \times 6$?$q$, $q$[{"text":"42","is_correct":true},{"text":"48","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"35","is_correct":false,"misconception_token":"skip-count-error"},{"text":"13","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '42', $q$$7 \times 6 = 42$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9c6f3bdf-7ee9-5496-8bf1-305cb3427207',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $6 \times 4$?$q$, $q$[{"text":"24","is_correct":true},{"text":"18","is_correct":false,"misconception_token":"skip-count-error"},{"text":"28","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"10","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '24', $q$$6 \times 4 = 24$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('501dd472-5174-5b12-8e87-2e62f1805c16',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $7 \times 9$?$q$, $q$[{"text":"63","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"56","is_correct":false,"misconception_token":"skip-count-error"},{"text":"72","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '63', $q$$7 \times 9 = 63$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('71d5f13e-d1e3-572d-a568-32461385c67c',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $8 \times 3$?$q$, $q$[{"text":"16","is_correct":false,"misconception_token":"skip-count-error"},{"text":"27","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"24","is_correct":true},{"text":"11","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '24', $q$$8 \times 3 = 24$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a23925ee-b262-591c-bf59-7aadff1dc3fb',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $9 \times 5$?$q$, $q$[{"text":"50","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"36","is_correct":false,"misconception_token":"skip-count-error"},{"text":"14","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"45","is_correct":true}]$q$::jsonb, '45', $q$$9 \times 5 = 45$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('02900a0e-330f-5d9b-bdee-d68ca1ad1548',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $7 \times 8$?$q$, $q$[{"text":"49","is_correct":false,"misconception_token":"skip-count-error"},{"text":"64","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"56","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '56', $q$$7 \times 8 = 56$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('33f413e5-21f8-5cfb-b2be-7e4ef2e5bd81',
   (select id from public.question_templates where code = 'multiplication-g3-medium-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'medium',
   $q$What is $7 \times 4$?$q$, $q$[{"text":"21","is_correct":false,"misconception_token":"skip-count-error"},{"text":"11","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"32","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"28","is_correct":true}]$q$::jsonb, '28', $q$$7 \times 4 = 28$.$q$, 'draft')
on conflict (id) do update set
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
-- multiplication-g3-hard-v2
-- skill: multiplication   tier: hard   items: 12
-- standard: 3.OA.A.4 - determine the unknown factor
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('multiplication-g3-hard-v2',
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"What number goes in the box? $\\square \\times {b} = {product}$","slots":[{"name":"a","min":3,"max":9},{"name":"b","min":3,"max":9}],"derived":[{"name":"product","formula":"a * b"}],"answerFormula":"a","answerFormat":"integer","constraints":["a * b <= 100"],"solutionTemplate":"Ask how many ${b}$s make ${product}$: ${product} \\div {b} = {answer}$, and ${answer} \\times {b} = {product}$."}$q$::jsonb,
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
  ('2416c97b-8d11-52e6-abc6-9763913d7b74',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 6 = 36$$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"7","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"30","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"6","is_correct":true}]$q$::jsonb, '6', $q$Ask how many $6$s make $36$: $36 \div 6 = 6$, and $6 \times 6 = 36$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6eadd13b-ae30-5162-b17c-a4f42becd6d5',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 6 = 48$$q$, $q$[{"text":"8","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"42","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"7","is_correct":false,"misconception_token":"quotient-too-low"}]$q$::jsonb, '8', $q$Ask how many $6$s make $48$: $48 \div 6 = 8$, and $8 \times 6 = 48$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f7356c9d-f0e5-55de-b342-8c35a4722d5d',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 5 = 20$$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"4","is_correct":true},{"text":"3","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"15","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '4', $q$Ask how many $5$s make $20$: $20 \div 5 = 4$, and $4 \times 5 = 20$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('98e07175-6cd0-5b23-aaac-ac3da3c1c0e4',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 8 = 64$$q$, $q$[{"text":"56","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"9","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"8","is_correct":true},{"text":"7","is_correct":false,"misconception_token":"quotient-too-low"}]$q$::jsonb, '8', $q$Ask how many $8$s make $64$: $64 \div 8 = 8$, and $8 \times 8 = 64$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('675e4e31-ff7d-550c-96be-c6980b9dd41f',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 9 = 36$$q$, $q$[{"text":"3","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"5","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"4","is_correct":true},{"text":"27","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '4', $q$Ask how many $9$s make $36$: $36 \div 9 = 4$, and $4 \times 9 = 36$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('01506b24-bc7e-5dd9-9a1e-421da01b10c8',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 3 = 27$$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"24","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"9","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"quotient-too-high"}]$q$::jsonb, '9', $q$Ask how many $3$s make $27$: $27 \div 3 = 9$, and $9 \times 3 = 27$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3df24a6f-4404-5ecf-b59b-aaf1989edf4c',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v2'),
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
  ('e1df2000-7552-5dd2-9d49-d9c627241490',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 8 = 56$$q$, $q$[{"text":"7","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"48","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"8","is_correct":false,"misconception_token":"quotient-too-high"}]$q$::jsonb, '7', $q$Ask how many $8$s make $56$: $56 \div 8 = 7$, and $7 \times 8 = 56$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7fb4ccfa-4112-5a0a-ab24-132f1e8befe4',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 4 = 36$$q$, $q$[{"text":"9","is_correct":true},{"text":"32","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"8","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"10","is_correct":false,"misconception_token":"quotient-too-high"}]$q$::jsonb, '9', $q$Ask how many $4$s make $36$: $36 \div 4 = 9$, and $9 \times 4 = 36$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2de4866b-bab8-5bbc-bd85-b639688ba0dc',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 5 = 40$$q$, $q$[{"text":"8","is_correct":true},{"text":"35","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"9","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"7","is_correct":false,"misconception_token":"quotient-too-low"}]$q$::jsonb, '8', $q$Ask how many $5$s make $40$: $40 \div 5 = 8$, and $8 \times 5 = 40$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5d5203b6-9b65-53d1-a3b1-94a7b45ba108',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 9 = 27$$q$, $q$[{"text":"3","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"18","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"4","is_correct":false,"misconception_token":"quotient-too-high"}]$q$::jsonb, '3', $q$Ask how many $9$s make $27$: $27 \div 9 = 3$, and $3 \times 9 = 27$.$q$, 'draft')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6c44c552-ad33-5525-8d2b-848a9e98bf2d',
   (select id from public.question_templates where code = 'multiplication-g3-hard-v2'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'hard',
   $q$What number goes in the box? $\square \times 7 = 42$$q$, $q$[{"text":"35","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"7","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"6","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"quotient-too-low"}]$q$::jsonb, '6', $q$Ask how many $7$s make $42$: $42 \div 7 = 6$, and $6 \times 7 = 42$.$q$, 'draft')
on conflict (id) do update set
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
-- fraction-of-number-g3-easy-v2
-- skill: fractions   tier: easy   items: 16
-- standard: 3.NF.A.1 - one part of b equal parts
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('fraction-of-number-g3-easy-v2',
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
  ('1521d1fe-cda4-5781-af30-74c963a78ea0',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v2'),
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
  ('5defaea7-f89a-5042-b5e7-21b0e271420a',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v2'),
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
  ('07739ad1-da0a-518f-a4d8-7b65d90227b0',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v2'),
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
  ('597bbc86-f040-5f6c-936f-6dc2e5377cde',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v2'),
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
  ('cb837d8f-6411-59b3-aa34-42072db3c326',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v2'),
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
  ('41ce6300-cd97-5d01-81ef-b479dcf4420d',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v2'),
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
  ('e0ae710d-0b1c-52a6-98e5-6fbaf399741f',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v2'),
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
  ('b2aa930b-2ff5-5a31-a6d0-182197013c01',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v2'),
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
  ('bdc8c0b0-e86f-5d18-b8f5-77cfade93778',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v2'),
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
  ('fdaca4b1-0bd3-5e0b-94d1-942039c00c85',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v2'),
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
  ('7df2f9ac-069b-5a2f-8c82-354c63a33c26',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v2'),
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
  ('592114cc-747c-5079-8bd9-bbf7e2a7de7e',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v2'),
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
  ('8f0edac4-48b7-55cc-bae0-68a6e4eef88c',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v2'),
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
  ('0be0cd99-bddb-53f9-b384-3e7e3d2611a4',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v2'),
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
  ('cb921528-c238-5cdf-a8c2-db4f1b0d258a',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v2'),
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
  ('58d542e3-2485-5fef-986e-2fe62d5b8933',
   (select id from public.question_templates where code = 'fraction-of-number-g3-easy-v2'),
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
-- fraction-of-number-g3-medium-v2
-- skill: fractions   tier: medium   items: 20
-- standard: 3.NF.A.1 - a parts of b equal parts
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('fraction-of-number-g3-medium-v2',
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
  ('0cfa239a-92ad-5964-97ad-ce3d6ffdb669',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('51deeab4-a5e3-56c8-b861-1c842e13ee02',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('c4b91221-5b5c-5975-bac1-542c224ea5ae',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('1c402890-5dff-580f-b157-6ccdb0991687',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('926ec7b7-c4e6-584c-a746-fa87e981d554',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('214e351f-0c42-51b1-ab1f-e0ac34d5cc51',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('7f83fcd3-7e13-5439-881c-86819080d93c',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('7be41d03-da86-5e50-8770-fbf4867b7258',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('4285bfb8-a12e-5102-baba-400c0e8202c1',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('13126eb4-8247-5d43-a748-0832f1a0d63b',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('55ea4c74-439a-5c4f-8310-704433859e21',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('b4640ac6-9b96-5a4a-94b7-cfbd1e4208d8',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('a62c2bad-8740-575d-8a2e-f5b8c4e5fb9c',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('6351f70d-0159-56f5-b276-07fa173d264a',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('c003c80f-faf6-5a79-971e-22040014041b',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('cf7726b9-0e5c-5209-9b55-89f7b8018e49',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('587b9150-18a8-5805-a902-9355358e4d84',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('88377b1c-0543-5086-8739-d9641949e7d7',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('0f963c91-c42d-5653-bef7-5d79cff1a325',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
  ('387da5e6-5699-5997-b8fb-b846a32f2d07',
   (select id from public.question_templates where code = 'fraction-of-number-g3-medium-v2'),
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
-- fraction-of-number-g3-hard-v2
-- skill: fractions   tier: hard   items: 12
-- standard: 3.NF.A.1 - recover the whole from a part
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('fraction-of-number-g3-hard-v2',
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
  ('cc94fe71-a076-50ad-baa1-be38eb3b199c',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v2'),
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
  ('bc2bd05b-45df-5da1-b078-c464b0baaa3c',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v2'),
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
  ('3d2aa637-6d87-5959-8e90-a8e78571454b',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v2'),
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
  ('6d34bc01-9033-50fb-9939-387d56bf643a',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v2'),
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
  ('c3a9edc4-26cd-5e1a-a98b-dd9d3a1fd7e1',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v2'),
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
  ('be4ca5e3-183e-594f-b803-5e8c610bb627',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v2'),
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
  ('38bb2ad5-9835-5ab1-aff2-c8c243410e80',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v2'),
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
  ('82438e40-4055-5d76-a4de-75a7881d0c6e',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v2'),
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
  ('f0c06577-4fee-59fe-b67e-7ccd36e52ceb',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v2'),
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
  ('7eac71ee-6f87-5b1c-8cc3-b2ad7e8ac579',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v2'),
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
  ('b74f5136-3dd2-55f9-b820-2836cba01cfa',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v2'),
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
  ('98980d84-643d-56f0-9acd-8c39295f5a59',
   (select id from public.question_templates where code = 'fraction-of-number-g3-hard-v2'),
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
-- percent-of-g6-easy-v2
-- skill: percentages   tier: easy   items: 16
-- standard: 6.RP.A.3.C - a benchmark percent of a quantity
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('percent-of-g6-easy-v2',
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
  ('3c141167-eb26-574c-bac5-25b419a35fed',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v2'),
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
  ('c897cdc7-6eef-5059-91d6-0cae2f1c5b86',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v2'),
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
  ('1242aba7-bf3f-5f5e-a1b6-6409767873e3',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v2'),
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
  ('b62aef55-26b7-5517-b944-7bca4531ac89',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v2'),
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
  ('a1e8ccca-8f85-5c11-99ea-88b5faaa4330',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v2'),
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
  ('550c5218-6bff-559f-9ca3-459d3742c3aa',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v2'),
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
  ('67052962-07a0-5144-969e-6bc4e4f28650',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v2'),
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
  ('40c35b5c-4a8f-5312-b824-84f9d969f16e',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v2'),
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
  ('38af9095-a042-5052-b3f6-9657cef41b15',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v2'),
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
  ('a365a5fe-02fc-5c51-8a1e-f87dc6fc7c33',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v2'),
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
  ('4a831267-e946-5f19-beab-7d34f03827d9',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v2'),
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
  ('3fef1ed6-3718-52d7-9eb9-94754ed4ef09',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v2'),
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
  ('79ba04e2-b0c5-584f-9192-116d60928202',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v2'),
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
  ('edb7b6b9-c1a9-50f8-8e12-722e4be30217',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v2'),
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
  ('7152731a-1db4-5ba6-bfe6-05de86a71bfe',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v2'),
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
  ('2d4a0289-ce57-5e3d-a4dd-a46010dee600',
   (select id from public.question_templates where code = 'percent-of-g6-easy-v2'),
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
-- percent-of-g6-medium-v2
-- skill: percentages   tier: medium   items: 20
-- standard: 6.RP.A.3.C - any percent of a quantity
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('percent-of-g6-medium-v2',
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
  ('0ef945e8-3d14-5396-bbad-8a9ee28aa614',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('fe211ecb-7e05-58c5-8bfd-3b7427785544',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('de0c16cc-ac9e-5d75-b10d-4d613b3c6b3f',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('d9ac6b9e-77ce-5e36-953f-0bc40ab26445',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('6c7aeab2-cb53-50a8-b9e3-a305cb2f5c8b',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('47dd614b-7fba-5ff4-a7d9-2d4b31cdd751',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('12033880-43f2-534c-b8d7-1e9547363d83',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('06c17510-155d-5c64-aca5-11acfcf17eda',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('e2c0d9f5-1b0d-50f2-a7c5-b94274f80bf1',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('d20fe324-5c0a-5ebe-8eff-d510331d0d20',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('11bb977d-c820-51c2-b5e3-b1a62f923650',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('bc034ec4-60a9-5ea8-a398-890baed74171',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('a145e01e-98e6-5b7f-a37d-8c9e0721a8cc',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('8e71b8ea-ba1c-5b0b-914a-8fa517fa5134',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('d4fc480c-fae3-50e2-801b-396d5aebf704',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('a087b459-4b75-5f61-91f1-839536210d43',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('7ede72fc-8da8-5117-b42d-eb80369e664b',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('c2c78152-c910-52f5-b6eb-bf672f6f4c65',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('b839906d-37ed-54dd-9343-abe54ecca8fa',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
  ('91e17f06-3842-5ca3-ae36-b084c429b2f9',
   (select id from public.question_templates where code = 'percent-of-g6-medium-v2'),
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
-- percent-of-g6-hard-v2
-- skill: percentages   tier: hard   items: 12
-- standard: 6.RP.A.3.C - find the whole given a part and the percent
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('percent-of-g6-hard-v2',
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
  ('fe6fee1a-c701-599d-9b5d-9f8ffbde42d6',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v2'),
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
  ('f7b68ca3-2b4f-5559-a3fb-57a2b1eb3ba5',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v2'),
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
  ('c9468515-f14f-5b52-adcc-83380404156f',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v2'),
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
  ('04477c1a-7633-5309-8514-c0501a44db1c',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v2'),
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
  ('24d1c6b7-531b-59d5-b07f-fd7b23964d68',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v2'),
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
  ('c4e92372-1031-559c-bae7-25124fc582aa',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v2'),
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
  ('c1597033-15c7-5386-a605-367ea140fb30',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v2'),
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
  ('7437250a-3a33-5578-a5ff-043d88bd8dc1',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v2'),
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
  ('80bb0ac0-7742-5d1d-bd73-219a05bdb9dc',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v2'),
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
  ('2c82e58a-b136-5b7f-97e8-c5f277b702ec',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v2'),
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
  ('315c1eb5-4cce-5f53-8ae9-dfad1876ba42',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v2'),
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
  ('ab0bc5e9-1127-5f7c-8fc3-b84e057df691',
   (select id from public.question_templates where code = 'percent-of-g6-hard-v2'),
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
-- mean-from-total-g6-easy-v2
-- skill: data-analysis   tier: easy   items: 16
-- standard: 6.SP.B.5.C - the mean of a small dataset
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('mean-from-total-g6-easy-v2',
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
  ('40f5af23-0839-5557-b2c8-d3204edbef78',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v2'),
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
  ('fde9a1b6-5213-5af7-9c7b-0052e116f9a9',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v2'),
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
  ('34347edc-b0c3-5c3b-8b95-3ef20aa31275',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v2'),
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
  ('0fcc791f-e2be-5d9e-b49f-1090a5168912',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v2'),
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
  ('5bfa40ad-fbb7-5b3a-ac7e-de038e10861a',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v2'),
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
  ('4402304b-4757-5d96-9d68-431b946908dd',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v2'),
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
  ('fd349747-bc6b-536f-908f-e221cb294ebe',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v2'),
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
  ('3a793daf-d3fa-5e3c-91a2-6fc525dc13ea',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v2'),
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
  ('f7f3c377-30e3-5b63-ad85-bb21fb9bafc8',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v2'),
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
  ('674d21bb-c722-5941-93d8-530cbc83d8b7',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v2'),
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
  ('0ef30268-5c30-5616-bdbe-eea852707bb9',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v2'),
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
  ('3e81bd4b-2594-5a07-b25d-3bc5fd11bbdd',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v2'),
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
  ('81d4a376-46ad-53da-a072-8d27b7537cdc',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v2'),
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
  ('048a3b61-4100-5c9e-bf31-e46af4227ae4',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v2'),
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
  ('8fe22abd-65e7-51bf-be95-0e2299785b9c',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v2'),
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
  ('3864853b-f521-5022-a043-4529bc22bed0',
   (select id from public.question_templates where code = 'mean-from-total-g6-easy-v2'),
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
-- mean-from-total-g6-medium-v2
-- skill: data-analysis   tier: medium   items: 20
-- standard: 6.SP.B.5.C - the mean of a larger dataset
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('mean-from-total-g6-medium-v2',
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
  ('c29bd584-b1fe-5ad7-9c52-ff55d1868b61',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('8efc4734-258d-5329-a2de-cbaff303ac84',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('a8bf00ff-d51c-5199-b856-18806b1e7bbc',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('a939cf3b-0790-5a04-9475-a7f697ba8c08',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('b40b66ab-db79-55a5-9b1b-7f8e0e2e05d6',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('9a245852-bf66-5d02-9c12-c55ee51789a6',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('d7021ee7-b349-51fe-8a0e-0004cac824a9',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('9aa26951-97b1-534c-8f4a-9c5a9d2ccb21',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('8885d18e-4cfc-5642-807a-5b764d7adcac',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('829aae12-34fe-5d72-a83f-77130817fbfc',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('d9e8f1ea-9888-58ad-8880-e72f19f47e28',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('ff5ed7de-83cd-5d81-bc2e-1697425bf2ea',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('7b74bc81-11cc-5947-a224-dd7863fc717a',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('3451d5b1-883e-5eda-a9a0-08aa9e6e0603',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('7699e347-15c0-5f3f-914b-ff34b17ba046',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('9cadb7d4-0d97-5e09-884c-b2be545d9a36',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('b4540322-0670-5c9e-8b0f-ed08aa82e3a7',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('0166ad6e-fd16-576a-bc77-c2cf88bb6fb5',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('81d21e07-b338-5be7-88a0-c6a1b438898f',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
  ('e5870b89-6fc6-52ca-a1af-1f4655690deb',
   (select id from public.question_templates where code = 'mean-from-total-g6-medium-v2'),
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
-- mean-from-total-g6-hard-v2
-- skill: data-analysis   tier: hard   items: 12
-- standard: 6.SP.B.5 - recover a missing value from the mean
-- =====================================================================
insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('mean-from-total-g6-hard-v2',
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
  ('d091c3a7-ae3f-5f7d-816c-6cde1504b606',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v2'),
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
  ('e56b6290-53ca-5474-b340-28e50b7fb7a1',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v2'),
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
  ('b49bd078-36b6-50d3-98b2-62fc407d1689',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v2'),
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
  ('69984228-8d03-5f02-b791-ee87d9f7bedf',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v2'),
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
  ('6e41e6ed-3efc-58f6-a2f8-52e5c0426912',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v2'),
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
  ('e2872f05-a0f2-50c7-8b3f-ea2babe22947',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v2'),
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
  ('56a90e14-ffd9-545b-9b5a-460711a7f0df',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v2'),
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
  ('4f659287-74ed-537a-aa64-b12fee958741',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v2'),
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
  ('8a8d3168-ce3b-568a-99e7-fbbdf6c881f8',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v2'),
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
  ('f6100e33-5dde-5fc3-9593-6b92bb7d0528',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v2'),
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
  ('f5851dac-e2a1-54df-b119-fbeb7e568270',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v2'),
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
  ('ad5c32ec-4b9e-5c26-8eb1-5068ce203192',
   (select id from public.question_templates where code = 'mean-from-total-g6-hard-v2'),
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
