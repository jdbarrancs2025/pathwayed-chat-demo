-- PathwayEd — Question Engine, Stage 2: multiplication questions (standalone).
--
-- The 20 generated_questions for template code "multiplication-basic-easy-v1",
-- extracted verbatim from seeds/0004_generated_questions_math.sql so they can be
-- run in a single paste. Idempotent: each upserts on its deterministic id, and
-- template_id resolves via code = 'multiplication-basic-easy-v1' (run seed 0003
-- first so that template row exists). Depends on migration 0004 + skills seed 0001.

begin;

insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('48fc346a-44e7-5ad0-80ff-64ffd8962a1e',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $8 \times 7$?$q$, $q$[{"text":"15","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"63","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"48","is_correct":false,"misconception_token":"skip-count-error"},{"text":"56","is_correct":true}]$q$::jsonb, '56', $q$$8 \times 7 = 56$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a1f807f7-fe8f-5230-ab57-3cc12e352a26',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $11 \times 8$?$q$, $q$[{"text":"88","is_correct":true},{"text":"96","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"77","is_correct":false,"misconception_token":"skip-count-error"},{"text":"19","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '88', $q$$11 \times 8 = 88$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d261bbeb-c35c-5814-ac2c-8119d7b105ae',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $4 \times 6$?$q$, $q$[{"text":"30","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"24","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"20","is_correct":false,"misconception_token":"skip-count-error"}]$q$::jsonb, '24', $q$$4 \times 6 = 24$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('536ad54c-1375-503b-ac19-6a4f34dcdea4',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $10 \times 10$?$q$, $q$[{"text":"90","is_correct":false,"misconception_token":"skip-count-error"},{"text":"110","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"100","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '100', $q$$10 \times 10 = 100$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('00c437b9-6392-51bc-8178-2e536394bbf0',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $4 \times 11$?$q$, $q$[{"text":"15","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"55","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"44","is_correct":true},{"text":"40","is_correct":false,"misconception_token":"skip-count-error"}]$q$::jsonb, '44', $q$$4 \times 11 = 44$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a15ba0aa-c6fc-5dfa-93cf-28330f9bd4c3',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $11 \times 2$?$q$, $q$[{"text":"13","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"11","is_correct":false,"misconception_token":"skip-count-error"},{"text":"22","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '22', $q$$11 \times 2 = 22$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('490a6767-1b5b-5b50-abf5-ac70f8860795',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $9 \times 3$?$q$, $q$[{"text":"27","is_correct":true},{"text":"30","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"18","is_correct":false,"misconception_token":"skip-count-error"},{"text":"12","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '27', $q$$9 \times 3 = 27$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6e5eeaa7-fea5-595b-9951-bcb2446f6bf5',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $9 \times 10$?$q$, $q$[{"text":"90","is_correct":true},{"text":"19","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"81","is_correct":false,"misconception_token":"skip-count-error"},{"text":"100","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '90', $q$$9 \times 10 = 90$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dfa8014a-6a80-50fd-a54e-6d0d198f8379',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $10 \times 3$?$q$, $q$[{"text":"30","is_correct":true},{"text":"13","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"33","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"20","is_correct":false,"misconception_token":"skip-count-error"}]$q$::jsonb, '30', $q$$10 \times 3 = 30$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7b512bae-103d-5d61-9903-20b349acbf48',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $11 \times 4$?$q$, $q$[{"text":"44","is_correct":true},{"text":"33","is_correct":false,"misconception_token":"skip-count-error"},{"text":"15","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"48","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '44', $q$$11 \times 4 = 44$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c797c4fb-6058-53e6-82fb-7ff9123ee3f6',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $4 \times 5$?$q$, $q$[{"text":"20","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"16","is_correct":false,"misconception_token":"skip-count-error"},{"text":"25","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '20', $q$$4 \times 5 = 20$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a5476b89-dbfc-565e-b8f7-a3716236147e',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $8 \times 10$?$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"90","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"72","is_correct":false,"misconception_token":"skip-count-error"},{"text":"80","is_correct":true}]$q$::jsonb, '80', $q$$8 \times 10 = 80$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bcffc6a8-af20-588c-a1e5-4cb246e57a8b',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $10 \times 5$?$q$, $q$[{"text":"50","is_correct":true},{"text":"40","is_correct":false,"misconception_token":"skip-count-error"},{"text":"55","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"15","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '50', $q$$10 \times 5 = 50$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ddab5e78-9013-5fc9-9755-533e205455f1',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $2 \times 12$?$q$, $q$[{"text":"24","is_correct":true},{"text":"14","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"22","is_correct":false,"misconception_token":"skip-count-error"},{"text":"36","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '24', $q$$2 \times 12 = 24$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f4439efa-074c-5fcf-be3e-d997f2b9ded2',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $6 \times 9$?$q$, $q$[{"text":"48","is_correct":false,"misconception_token":"skip-count-error"},{"text":"63","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"54","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '54', $q$$6 \times 9 = 54$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('34828b0f-bb6a-5cdb-9d99-3d95f30960b2',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $3 \times 7$?$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"skip-count-error"},{"text":"28","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"10","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"21","is_correct":true}]$q$::jsonb, '21', $q$$3 \times 7 = 21$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e804928d-a655-576e-a104-c96aca277a19',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $10 \times 11$?$q$, $q$[{"text":"110","is_correct":true},{"text":"100","is_correct":false,"misconception_token":"skip-count-error"},{"text":"21","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"121","is_correct":false,"misconception_token":"off-by-one-factor"}]$q$::jsonb, '110', $q$$10 \times 11 = 110$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d9c5d2b8-900e-557c-b66c-ff21c1e6e2f2',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $12 \times 4$?$q$, $q$[{"text":"36","is_correct":false,"misconception_token":"skip-count-error"},{"text":"16","is_correct":false,"misconception_token":"added-instead-of-multiplied"},{"text":"52","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"48","is_correct":true}]$q$::jsonb, '48', $q$$12 \times 4 = 48$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('710b3f71-8f51-5b51-b5d8-eb1a4e2b660c',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $4 \times 7$?$q$, $q$[{"text":"28","is_correct":true},{"text":"35","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"24","is_correct":false,"misconception_token":"skip-count-error"},{"text":"11","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '28', $q$$4 \times 7 = 28$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('18c8a79c-9e04-5c29-90b6-2cd0247adb29',
   (select id from public.question_templates where code = 'multiplication-basic-easy-v1'),
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $4 \times 4$?$q$, $q$[{"text":"16","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"skip-count-error"},{"text":"20","is_correct":false,"misconception_token":"off-by-one-factor"},{"text":"8","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '16', $q$$4 \times 4 = 16$.$q$, 'published')
on conflict (id) do update set
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
