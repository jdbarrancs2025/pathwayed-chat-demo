-- PathwayEd — Question Engine, Stage 2: cached MATH questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-math-seeds.ts from the
-- templates + the deterministic generator. HOW TO APPLY: paste into the Supabase
-- SQL editor and run. Idempotent (upsert on a deterministic id derived from
-- template_code + seed). Depends on migration 0004 (public.generated_questions)
-- and seed 0003 (templates).

begin;

-- linear-equation-solve (algebra, easy) — questions 1..20
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3913d769-b675-5562-847a-41a1ef4f667e',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,6x + 4 = 52$, what is the value of $x$?$q$, $q$[{"text":"8","is_correct":true},{"text":"-8","is_correct":false,"misconception_token":"sign-error"},{"text":"12","is_correct":false,"misconception_token":"mishandled-constant"},{"text":"48","is_correct":false,"misconception_token":"forgot-to-divide"}]$q$::jsonb, '8', $q$Start with $\,6x + 4 = 52$. Subtract the constant from both sides: $\,6x = 48$. Divide by $6$: $x = 8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('897ac317-8caa-5d40-93cf-09932cdfef23',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,8x + 5 = 13$, what is the value of $x$?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"1","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"mishandled-constant"},{"text":"-1","is_correct":false,"misconception_token":"sign-error"}]$q$::jsonb, '1', $q$Start with $\,8x + 5 = 13$. Subtract the constant from both sides: $\,8x = 8$. Divide by $8$: $x = 1$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cf8af86c-0bf4-50aa-bd5c-5c4257880d31',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,4x - 1 = -9$, what is the value of $x$?$q$, $q$[{"text":"-3","is_correct":false,"misconception_token":"mishandled-constant"},{"text":"2","is_correct":false,"misconception_token":"sign-error"},{"text":"-2","is_correct":true},{"text":"-8","is_correct":false,"misconception_token":"forgot-to-divide"}]$q$::jsonb, '-2', $q$Start with $\,4x - 1 = -9$. Subtract the constant from both sides: $\,4x = -8$. Divide by $4$: $x = -2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1869f90c-1503-57ce-aa91-079943e71df1',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,8x + 9 = 49$, what is the value of $x$?$q$, $q$[{"text":"-5","is_correct":false,"misconception_token":"sign-error"},{"text":"40","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"14","is_correct":false,"misconception_token":"mishandled-constant"},{"text":"5","is_correct":true}]$q$::jsonb, '5', $q$Start with $\,8x + 9 = 49$. Subtract the constant from both sides: $\,8x = 40$. Divide by $8$: $x = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0855054f-9139-5df9-86d4-51220566558a',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,3x - 3 = 18$, what is the value of $x$?$q$, $q$[{"text":"21","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"-7","is_correct":false,"misconception_token":"sign-error"},{"text":"4","is_correct":false,"misconception_token":"mishandled-constant"},{"text":"7","is_correct":true}]$q$::jsonb, '7', $q$Start with $\,3x - 3 = 18$. Subtract the constant from both sides: $\,3x = 21$. Divide by $3$: $x = 7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('33a9ebc5-be03-5820-bcfa-ce48e0d88698',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,3x + 3 = -3$, what is the value of $x$?$q$, $q$[{"text":"-6","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"1","is_correct":false,"misconception_token":"mishandled-constant"},{"text":"2","is_correct":false,"misconception_token":"sign-error"},{"text":"-2","is_correct":true}]$q$::jsonb, '-2', $q$Start with $\,3x + 3 = -3$. Subtract the constant from both sides: $\,3x = -6$. Divide by $3$: $x = -2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('02b377ce-76a9-5c7d-a224-a4a81daf72c5',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,9x + 1 = -80$, what is the value of $x$?$q$, $q$[{"text":"-81","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"-8","is_correct":false,"misconception_token":"mishandled-constant"},{"text":"9","is_correct":false,"misconception_token":"sign-error"},{"text":"-9","is_correct":true}]$q$::jsonb, '-9', $q$Start with $\,9x + 1 = -80$. Subtract the constant from both sides: $\,9x = -81$. Divide by $9$: $x = -9$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8f2b9d73-8002-5cff-bb48-df3d20bc036c',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,7x + 5 = -44$, what is the value of $x$?$q$, $q$[{"text":"-7","is_correct":true},{"text":"-49","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"-2","is_correct":false,"misconception_token":"mishandled-constant"},{"text":"7","is_correct":false,"misconception_token":"sign-error"}]$q$::jsonb, '-7', $q$Start with $\,7x + 5 = -44$. Subtract the constant from both sides: $\,7x = -49$. Divide by $7$: $x = -7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8f15abe4-b84f-5b6b-a923-ddfb9a5a29c4',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,7x + 4 = 39$, what is the value of $x$?$q$, $q$[{"text":"35","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"5","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"mishandled-constant"},{"text":"-5","is_correct":false,"misconception_token":"sign-error"}]$q$::jsonb, '5', $q$Start with $\,7x + 4 = 39$. Subtract the constant from both sides: $\,7x = 35$. Divide by $7$: $x = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9943b4b6-c920-50ba-b904-493be6d787a0',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,8x - 4 = -60$, what is the value of $x$?$q$, $q$[{"text":"-7","is_correct":true},{"text":"-56","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"7","is_correct":false,"misconception_token":"sign-error"},{"text":"-11","is_correct":false,"misconception_token":"mishandled-constant"}]$q$::jsonb, '-7', $q$Start with $\,8x - 4 = -60$. Subtract the constant from both sides: $\,8x = -56$. Divide by $8$: $x = -7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('91d1c1d7-788e-5e6b-83dc-7fd38c15f385',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,9x + 2 = -52$, what is the value of $x$?$q$, $q$[{"text":"-54","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"-6","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"sign-error"},{"text":"-4","is_correct":false,"misconception_token":"mishandled-constant"}]$q$::jsonb, '-6', $q$Start with $\,9x + 2 = -52$. Subtract the constant from both sides: $\,9x = -54$. Divide by $9$: $x = -6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('287a4cca-3066-5e11-8719-784038f0cfac',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,3x + 1 = -11$, what is the value of $x$?$q$, $q$[{"text":"-3","is_correct":false,"misconception_token":"mishandled-constant"},{"text":"-4","is_correct":true},{"text":"-12","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"4","is_correct":false,"misconception_token":"sign-error"}]$q$::jsonb, '-4', $q$Start with $\,3x + 1 = -11$. Subtract the constant from both sides: $\,3x = -12$. Divide by $3$: $x = -4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9ccf0f1d-7cb8-5b73-ac6b-c5008da68d86',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,6x - 8 = 22$, what is the value of $x$?$q$, $q$[{"text":"30","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"5","is_correct":true},{"text":"-3","is_correct":false,"misconception_token":"mishandled-constant"},{"text":"-5","is_correct":false,"misconception_token":"sign-error"}]$q$::jsonb, '5', $q$Start with $\,6x - 8 = 22$. Subtract the constant from both sides: $\,6x = 30$. Divide by $6$: $x = 5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a039e8c9-1796-5f73-ab42-957a0879cb38',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,7x + 6 = -22$, what is the value of $x$?$q$, $q$[{"text":"-28","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"-4","is_correct":true},{"text":"4","is_correct":false,"misconception_token":"sign-error"},{"text":"2","is_correct":false,"misconception_token":"mishandled-constant"}]$q$::jsonb, '-4', $q$Start with $\,7x + 6 = -22$. Subtract the constant from both sides: $\,7x = -28$. Divide by $7$: $x = -4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('df9b5463-b4fc-56d9-bd75-a250658cfc27',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,2x + 4 = 20$, what is the value of $x$?$q$, $q$[{"text":"8","is_correct":true},{"text":"-8","is_correct":false,"misconception_token":"sign-error"},{"text":"12","is_correct":false,"misconception_token":"mishandled-constant"},{"text":"16","is_correct":false,"misconception_token":"forgot-to-divide"}]$q$::jsonb, '8', $q$Start with $\,2x + 4 = 20$. Subtract the constant from both sides: $\,2x = 16$. Divide by $2$: $x = 8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('856c25a0-1b19-502a-b790-585170975696',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,5x + 8 = 23$, what is the value of $x$?$q$, $q$[{"text":"-3","is_correct":false,"misconception_token":"sign-error"},{"text":"3","is_correct":true},{"text":"11","is_correct":false,"misconception_token":"mishandled-constant"},{"text":"15","is_correct":false,"misconception_token":"forgot-to-divide"}]$q$::jsonb, '3', $q$Start with $\,5x + 8 = 23$. Subtract the constant from both sides: $\,5x = 15$. Divide by $5$: $x = 3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('20aeede9-8af3-5495-a2fd-08d4df4641f4',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,3x - 7 = -10$, what is the value of $x$?$q$, $q$[{"text":"-1","is_correct":true},{"text":"1","is_correct":false,"misconception_token":"sign-error"},{"text":"-8","is_correct":false,"misconception_token":"mishandled-constant"},{"text":"-3","is_correct":false,"misconception_token":"forgot-to-divide"}]$q$::jsonb, '-1', $q$Start with $\,3x - 7 = -10$. Subtract the constant from both sides: $\,3x = -3$. Divide by $3$: $x = -1$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7d7dc179-2ac4-5647-840c-1c98beca4ba1',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,7x + 4 = 53$, what is the value of $x$?$q$, $q$[{"text":"49","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"7","is_correct":true},{"text":"-7","is_correct":false,"misconception_token":"sign-error"},{"text":"11","is_correct":false,"misconception_token":"mishandled-constant"}]$q$::jsonb, '7', $q$Start with $\,7x + 4 = 53$. Subtract the constant from both sides: $\,7x = 49$. Divide by $7$: $x = 7$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b401f095-938e-5cc2-b30e-16bd4ccd74ca',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,9x - 7 = -52$, what is the value of $x$?$q$, $q$[{"text":"-45","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"5","is_correct":false,"misconception_token":"sign-error"},{"text":"-5","is_correct":true},{"text":"-12","is_correct":false,"misconception_token":"mishandled-constant"}]$q$::jsonb, '-5', $q$Start with $\,9x - 7 = -52$. Subtract the constant from both sides: $\,9x = -45$. Divide by $9$: $x = -5$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e257e412-5a1f-56aa-ac01-aee0b559f685',
   (select id from public.question_templates where code = 'linear-equation-solve'),
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy',
   $q$If $\,4x + 8 = 12$, what is the value of $x$?$q$, $q$[{"text":"4","is_correct":false,"misconception_token":"forgot-to-divide"},{"text":"1","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"mishandled-constant"},{"text":"-1","is_correct":false,"misconception_token":"sign-error"}]$q$::jsonb, '1', $q$Start with $\,4x + 8 = 12$. Subtract the constant from both sides: $\,4x = 4$. Divide by $4$: $x = 1$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- percent-of (problem-solving-data-analysis, easy) — questions 1..20
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('991e07f6-b8a7-51ac-9be4-fe4f6f1420be',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $50\%$ of $100$?$q$, $q$[{"text":"60","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"45","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"55","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"50","is_correct":true}]$q$::jsonb, '50', $q$$50\%$ of $100$ is $\frac{50}{100} \times 100 = 50$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6d75ad10-27ef-5fe4-84f7-98147f24ae04',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $80\%$ of $120$?$q$, $q$[{"text":"96","is_correct":true},{"text":"90","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"102","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"24","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '96', $q$$80\%$ of $120$ is $\frac{80}{100} \times 120 = 96$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8442ff81-7fc8-52e9-bc98-cf5272f07af4',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $25\%$ of $100$?$q$, $q$[{"text":"20","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"25","is_correct":true},{"text":"75","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"30","is_correct":false,"misconception_token":"overstated-the-percent"}]$q$::jsonb, '25', $q$$25\%$ of $100$ is $\frac{25}{100} \times 100 = 25$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('79df4cbb-3fdc-55c0-938a-53572d096f76',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $70\%$ of $160$?$q$, $q$[{"text":"120","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"104","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"112","is_correct":true},{"text":"48","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '112', $q$$70\%$ of $160$ is $\frac{70}{100} \times 160 = 112$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('adbe834f-a09c-523f-8826-d34b43b13112',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $20\%$ of $180$?$q$, $q$[{"text":"144","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"27","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"36","is_correct":true},{"text":"45","is_correct":false,"misconception_token":"overstated-the-percent"}]$q$::jsonb, '36', $q$$20\%$ of $180$ is $\frac{20}{100} \times 180 = 36$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('36718e91-ccb3-50fd-abae-5dbc82fc4fc8',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $20\%$ of $100$?$q$, $q$[{"text":"80","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"25","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"20","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '20', $q$$20\%$ of $100$ is $\frac{20}{100} \times 100 = 20$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a6855e1b-50f6-5241-ba09-265ef8aabaff',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $85\%$ of $20$?$q$, $q$[{"text":"3","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"18","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"17","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '17', $q$$85\%$ of $20$ is $\frac{85}{100} \times 20 = 17$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6cacfb4f-ee22-5e4a-878b-0add2b10bdae',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $65\%$ of $40$?$q$, $q$[{"text":"26","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"28","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"14","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '26', $q$$65\%$ of $40$ is $\frac{65}{100} \times 40 = 26$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('51db4ccf-517e-5ee0-b946-a451b4e98606',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $65\%$ of $160$?$q$, $q$[{"text":"104","is_correct":true},{"text":"56","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"112","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"96","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '104', $q$$65\%$ of $160$ is $\frac{65}{100} \times 160 = 104$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ebdedace-8526-594b-b6ce-fa44d6284160',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $70\%$ of $40$?$q$, $q$[{"text":"28","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"26","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"30","is_correct":false,"misconception_token":"overstated-the-percent"}]$q$::jsonb, '28', $q$$70\%$ of $40$ is $\frac{70}{100} \times 40 = 28$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9cf43b1a-53ff-5822-8543-bc2a0d617dfa',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $85\%$ of $60$?$q$, $q$[{"text":"51","is_correct":true},{"text":"54","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"9","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"48","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '51', $q$$85\%$ of $60$ is $\frac{85}{100} \times 60 = 51$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('db0a5b15-ef04-5b41-a45b-03356148612c',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $25\%$ of $60$?$q$, $q$[{"text":"15","is_correct":true},{"text":"45","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"18","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"12","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '15', $q$$25\%$ of $60$ is $\frac{25}{100} \times 60 = 15$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7d576440-de2b-5f60-9beb-c977ae3c3afc',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $55\%$ of $160$?$q$, $q$[{"text":"72","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"80","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"96","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"88","is_correct":true}]$q$::jsonb, '88', $q$$55\%$ of $160$ is $\frac{55}{100} \times 160 = 88$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('45a93f44-9ff2-580c-9843-c68651b9e68e',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $70\%$ of $80$?$q$, $q$[{"text":"56","is_correct":true},{"text":"60","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"52","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"24","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '56', $q$$70\%$ of $80$ is $\frac{70}{100} \times 80 = 56$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4e817fb5-9606-514a-81b5-3a2fa4c87b6e',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $5\%$ of $200$?$q$, $q$[{"text":"10","is_correct":true},{"text":"190","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"20","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"0","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '10', $q$$5\%$ of $200$ is $\frac{5}{100} \times 200 = 10$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3fa271e6-f378-5727-a486-b27e2d4e2268',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $45\%$ of $140$?$q$, $q$[{"text":"70","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"56","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"63","is_correct":true},{"text":"77","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '63', $q$$45\%$ of $140$ is $\frac{45}{100} \times 140 = 63$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('51786790-6640-5087-9ca4-3bd2f1eb0d73',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $15\%$ of $100$?$q$, $q$[{"text":"20","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"10","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"85","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"15","is_correct":true}]$q$::jsonb, '15', $q$$15\%$ of $100$ is $\frac{15}{100} \times 100 = 15$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('345acf7d-f2c4-57f7-bfea-f35b4fac8905',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $70\%$ of $180$?$q$, $q$[{"text":"126","is_correct":true},{"text":"135","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"54","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"117","is_correct":false,"misconception_token":"understated-the-percent"}]$q$::jsonb, '126', $q$$70\%$ of $180$ is $\frac{70}{100} \times 180 = 126$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('55d21593-47bc-5d34-a980-2ee12e490be7',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $90\%$ of $60$?$q$, $q$[{"text":"57","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"6","is_correct":false,"misconception_token":"complement-instead-of-percent"},{"text":"51","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"54","is_correct":true}]$q$::jsonb, '54', $q$$90\%$ of $60$ is $\frac{90}{100} \times 60 = 54$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0619b675-c64e-561b-9708-4d90375f9b19',
   (select id from public.question_templates where code = 'percent-of'),
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $25\%$ of $120$?$q$, $q$[{"text":"30","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"understated-the-percent"},{"text":"36","is_correct":false,"misconception_token":"overstated-the-percent"},{"text":"90","is_correct":false,"misconception_token":"complement-instead-of-percent"}]$q$::jsonb, '30', $q$$25\%$ of $120$ is $\frac{25}{100} \times 120 = 30$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- multiplication-basic-easy-v1 (problem-solving-data-analysis, easy) — questions 1..20
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

-- division-basic-easy-v1 (problem-solving-data-analysis, easy) — questions 1..20
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('69d95301-464f-58ce-8dae-1a50bf0f5a45',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $56 \div 8$?$q$, $q$[{"text":"48","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"6","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"8","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"7","is_correct":true}]$q$::jsonb, '7', $q$$56 \div 8 = 7$, because $8 \times 7 = 56$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0f7e2326-a46b-5847-aa9f-36e52a91b180',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $88 \div 11$?$q$, $q$[{"text":"8","is_correct":true},{"text":"7","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"9","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"77","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '8', $q$$88 \div 11 = 8$, because $11 \times 8 = 88$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8be9ba6b-4450-52fd-ae4a-65fb2fdc7328',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $24 \div 4$?$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"6","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"7","is_correct":false,"misconception_token":"quotient-too-high"}]$q$::jsonb, '6', $q$$24 \div 4 = 6$, because $4 \times 6 = 24$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2c9e2d28-1061-51d0-9879-193f0dc28cd2',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $100 \div 10$?$q$, $q$[{"text":"11","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"9","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"10","is_correct":true},{"text":"90","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '10', $q$$100 \div 10 = 10$, because $10 \times 10 = 100$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c6025b2f-d84d-5d67-891d-ec2bb19fec81',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $44 \div 4$?$q$, $q$[{"text":"40","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"10","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"11","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"quotient-too-high"}]$q$::jsonb, '11', $q$$44 \div 4 = 11$, because $4 \times 11 = 44$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3c24245d-883c-5f64-9387-8a3c40177cb1',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $22 \div 11$?$q$, $q$[{"text":"11","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"3","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"2","is_correct":true},{"text":"1","is_correct":false,"misconception_token":"quotient-too-low"}]$q$::jsonb, '2', $q$$22 \div 11 = 2$, because $11 \times 2 = 22$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8c657e03-ac11-5c43-97f5-e41f10cb31c2',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $27 \div 9$?$q$, $q$[{"text":"3","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"4","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"18","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '3', $q$$27 \div 9 = 3$, because $9 \times 3 = 27$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('964f3a9c-7fb2-5495-a089-a51c073047a2',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $90 \div 9$?$q$, $q$[{"text":"10","is_correct":true},{"text":"81","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"11","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"9","is_correct":false,"misconception_token":"quotient-too-low"}]$q$::jsonb, '10', $q$$90 \div 9 = 10$, because $9 \times 10 = 90$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b8b71d2f-7de3-5053-a12c-d311f3ada2fe',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $30 \div 10$?$q$, $q$[{"text":"3","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"2","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"4","is_correct":false,"misconception_token":"quotient-too-high"}]$q$::jsonb, '3', $q$$30 \div 10 = 3$, because $10 \times 3 = 30$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('adcac9ec-e8b9-54e7-a8b9-58aa25e246ee',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $44 \div 11$?$q$, $q$[{"text":"4","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"33","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"3","is_correct":false,"misconception_token":"quotient-too-low"}]$q$::jsonb, '4', $q$$44 \div 11 = 4$, because $11 \times 4 = 44$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('661e3310-4e2c-5902-8ebf-e62f79bc8e26',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $20 \div 4$?$q$, $q$[{"text":"5","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"6","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"4","is_correct":false,"misconception_token":"quotient-too-low"}]$q$::jsonb, '5', $q$$20 \div 4 = 5$, because $4 \times 5 = 20$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ca00b161-997f-51d2-8695-6f5ae2993c06',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $80 \div 8$?$q$, $q$[{"text":"72","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"9","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"11","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"10","is_correct":true}]$q$::jsonb, '10', $q$$80 \div 8 = 10$, because $8 \times 10 = 80$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c8989f58-c109-5355-952a-ea1b208504d2',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $50 \div 10$?$q$, $q$[{"text":"5","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"4","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"40","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '5', $q$$50 \div 10 = 5$, because $10 \times 5 = 50$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0add043d-888e-5e93-9e59-0a68c0af3e62',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $24 \div 2$?$q$, $q$[{"text":"12","is_correct":true},{"text":"22","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"13","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"11","is_correct":false,"misconception_token":"quotient-too-low"}]$q$::jsonb, '12', $q$$24 \div 2 = 12$, because $2 \times 12 = 24$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9ea3532a-2ee0-5a9c-a8ae-6fdd44d4fdf7',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $54 \div 6$?$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"8","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"9","is_correct":true},{"text":"48","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '9', $q$$54 \div 6 = 9$, because $6 \times 9 = 54$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9dd9df72-b031-5554-828b-39b8103c1387',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $21 \div 3$?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"6","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"18","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"7","is_correct":true}]$q$::jsonb, '7', $q$$21 \div 3 = 7$, because $3 \times 7 = 21$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('51dc4172-6a85-59a6-9142-7d1ed79a1e26',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $110 \div 10$?$q$, $q$[{"text":"11","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"100","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"10","is_correct":false,"misconception_token":"quotient-too-low"}]$q$::jsonb, '11', $q$$110 \div 10 = 11$, because $10 \times 11 = 110$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3345da97-6a2f-5194-8a3d-cfa9324b2b0f',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $48 \div 12$?$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"36","is_correct":false,"misconception_token":"subtracted-instead-of-divided"},{"text":"3","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"4","is_correct":true}]$q$::jsonb, '4', $q$$48 \div 12 = 4$, because $12 \times 4 = 48$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('57101c96-a75e-5e72-9c0d-d278545b3bff',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $28 \div 4$?$q$, $q$[{"text":"7","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"8","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"24","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '7', $q$$28 \div 4 = 7$, because $4 \times 7 = 28$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dc8b0fc7-8e32-5eec-b0e6-57f5d4ba8f28',
   (select id from public.question_templates where code = 'division-basic-easy-v1'),
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $16 \div 4$?$q$, $q$[{"text":"4","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"quotient-too-high"},{"text":"3","is_correct":false,"misconception_token":"quotient-too-low"},{"text":"12","is_correct":false,"misconception_token":"subtracted-instead-of-divided"}]$q$::jsonb, '4', $q$$16 \div 4 = 4$, because $4 \times 4 = 16$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- fraction-of-number-easy-v1 (problem-solving-data-analysis, easy) — questions 1..20
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ca2af15c-c923-5105-af74-c5c0eac382e4',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{3}{4}$ of $16$?$q$, $q$[{"text":"12","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"4","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"9","is_correct":false,"misconception_token":"part-size-too-small"}]$q$::jsonb, '12', $q$One part is $16 \div 4 = 4$, so $\frac{3}{4}$ of $16$ is $3 \times 4 = 12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b05680b7-ba2c-5a8d-bac0-9e476faacfa2',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{3}{5}$ of $30$?$q$, $q$[{"text":"15","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"18","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"24","is_correct":false,"misconception_token":"numerator-too-high"}]$q$::jsonb, '18', $q$One part is $30 \div 5 = 6$, so $\frac{3}{5}$ of $30$ is $3 \times 6 = 18$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ee447c75-1583-5cae-8235-ed7b6d3f9816',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{3}{5}$ of $25$?$q$, $q$[{"text":"15","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"20","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"12","is_correct":false,"misconception_token":"part-size-too-small"}]$q$::jsonb, '15', $q$One part is $25 \div 5 = 5$, so $\frac{3}{5}$ of $25$ is $3 \times 5 = 15$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9fa968cb-dcf8-5e94-a14c-86543b29406e',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{4}{5}$ of $60$?$q$, $q$[{"text":"44","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"60","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"12","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"48","is_correct":true}]$q$::jsonb, '48', $q$One part is $60 \div 5 = 12$, so $\frac{4}{5}$ of $60$ is $4 \times 12 = 48$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9acb6005-7a74-52e4-84b6-0a75708527db',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{2}$ of $4$?$q$, $q$[{"text":"1","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"3","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"2","is_correct":true},{"text":"4","is_correct":false,"misconception_token":"numerator-too-high"}]$q$::jsonb, '2', $q$One part is $4 \div 2 = 2$, so $\frac{1}{2}$ of $4$ is $1 \times 2 = 2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fc904f7c-744f-5c9c-bcf5-a0785b8a3b9c',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{4}$ of $32$?$q$, $q$[{"text":"16","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"24","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"7","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"8","is_correct":true}]$q$::jsonb, '8', $q$One part is $32 \div 4 = 8$, so $\frac{1}{4}$ of $32$ is $1 \times 8 = 8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9c0f1425-3ccd-58ff-8beb-2262380928fa',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{4}$ of $8$?$q$, $q$[{"text":"4","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"1","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"2","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"used-the-other-part"}]$q$::jsonb, '2', $q$One part is $8 \div 4 = 2$, so $\frac{1}{4}$ of $8$ is $1 \times 2 = 2$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c6305fa6-499e-5895-ae18-5c42291dbaaf',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{6}$ of $24$?$q$, $q$[{"text":"4","is_correct":true},{"text":"3","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"8","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"20","is_correct":false,"misconception_token":"used-the-other-part"}]$q$::jsonb, '4', $q$One part is $24 \div 6 = 4$, so $\frac{1}{6}$ of $24$ is $1 \times 4 = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('de9b9cc3-5327-5428-82b9-667da6594d01',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{4}{5}$ of $45$?$q$, $q$[{"text":"45","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"36","is_correct":true},{"text":"9","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"32","is_correct":false,"misconception_token":"part-size-too-small"}]$q$::jsonb, '36', $q$One part is $45 \div 5 = 9$, so $\frac{4}{5}$ of $45$ is $4 \times 9 = 36$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('84d41252-4cbd-508c-87bd-71a44b213960',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{5}{6}$ of $72$?$q$, $q$[{"text":"72","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"55","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"12","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"60","is_correct":true}]$q$::jsonb, '60', $q$One part is $72 \div 6 = 12$, so $\frac{5}{6}$ of $72$ is $5 \times 12 = 60$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('506b9ae6-bb19-5d89-9c97-f85e8ec86b6b',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{3}$ of $12$?$q$, $q$[{"text":"5","is_correct":false,"misconception_token":"part-size-too-big"},{"text":"8","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"4","is_correct":true},{"text":"3","is_correct":false,"misconception_token":"part-size-too-small"}]$q$::jsonb, '4', $q$One part is $12 \div 3 = 4$, so $\frac{1}{3}$ of $12$ is $1 \times 4 = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4a417092-a549-545d-9703-092ab5056bd3',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{2}{3}$ of $21$?$q$, $q$[{"text":"7","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"14","is_correct":true},{"text":"21","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"12","is_correct":false,"misconception_token":"part-size-too-small"}]$q$::jsonb, '14', $q$One part is $21 \div 3 = 7$, so $\frac{2}{3}$ of $21$ is $2 \times 7 = 14$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0bc6efd6-b43f-5479-8ac5-bda19ccb7885',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{3}{5}$ of $15$?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"9","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"answered-the-whole"},{"text":"6","is_correct":false,"misconception_token":"part-size-too-small"}]$q$::jsonb, '9', $q$One part is $15 \div 5 = 3$, so $\frac{3}{5}$ of $15$ is $3 \times 3 = 9$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8e029139-ab5a-5bc1-bada-aaf253ae1d3a',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{4}{5}$ of $25$?$q$, $q$[{"text":"25","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"20","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"16","is_correct":false,"misconception_token":"part-size-too-small"}]$q$::jsonb, '20', $q$One part is $25 \div 5 = 5$, so $\frac{4}{5}$ of $25$ is $4 \times 5 = 20$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9297dd2a-c30b-5376-83e2-f22e7944ba5e',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{6}$ of $54$?$q$, $q$[{"text":"9","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"45","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"18","is_correct":false,"misconception_token":"numerator-too-high"}]$q$::jsonb, '9', $q$One part is $54 \div 6 = 9$, so $\frac{1}{6}$ of $54$ is $1 \times 9 = 9$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0ac3f969-bc61-58bb-800b-80dc88f62ea9',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{3}{5}$ of $55$?$q$, $q$[{"text":"30","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"33","is_correct":true},{"text":"22","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"44","is_correct":false,"misconception_token":"numerator-too-high"}]$q$::jsonb, '33', $q$One part is $55 \div 5 = 11$, so $\frac{3}{5}$ of $55$ is $3 \times 11 = 33$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f8878341-4897-56dd-a086-6c2a6531fb5a',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{4}$ of $12$?$q$, $q$[{"text":"3","is_correct":true},{"text":"2","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"9","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"6","is_correct":false,"misconception_token":"numerator-too-high"}]$q$::jsonb, '3', $q$One part is $12 \div 4 = 3$, so $\frac{1}{4}$ of $12$ is $1 \times 3 = 3$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9014a542-c21a-58c4-b847-866c8f9225d3',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{4}{5}$ of $30$?$q$, $q$[{"text":"24","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"30","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"6","is_correct":false,"misconception_token":"used-the-other-part"}]$q$::jsonb, '24', $q$One part is $30 \div 5 = 6$, so $\frac{4}{5}$ of $30$ is $4 \times 6 = 24$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('69c2e9b0-95ef-5e1c-825f-27f7d54fd055',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{5}$ of $55$?$q$, $q$[{"text":"10","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"44","is_correct":false,"misconception_token":"used-the-other-part"},{"text":"11","is_correct":true},{"text":"22","is_correct":false,"misconception_token":"numerator-too-high"}]$q$::jsonb, '11', $q$One part is $55 \div 5 = 11$, so $\frac{1}{5}$ of $55$ is $1 \times 11 = 11$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('262881fa-ca05-574f-972d-266cc61bae66',
   (select id from public.question_templates where code = 'fraction-of-number-easy-v1'),
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy',
   $q$What is $\frac{1}{2}$ of $24$?$q$, $q$[{"text":"11","is_correct":false,"misconception_token":"part-size-too-small"},{"text":"12","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"numerator-too-high"},{"text":"13","is_correct":false,"misconception_token":"part-size-too-big"}]$q$::jsonb, '12', $q$One part is $24 \div 2 = 12$, so $\frac{1}{2}$ of $24$ is $1 \times 12 = 12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- rectangle-area-easy-v1 (geometry-trigonometry, easy) — questions 1..20
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4b49e22f-4c1a-505e-95bd-6080c1193eca',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $8$ units long and $7$ units wide. What is its area, in square units?$q$, $q$[{"text":"30","is_correct":false,"misconception_token":"confused-area-perimeter"},{"text":"49","is_correct":false,"misconception_token":"miscounted-a-column"},{"text":"64","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"56","is_correct":true}]$q$::jsonb, '56', $q$Area is length times width: $8 \times 7 = 56$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('03977d61-5912-5c0f-95f4-e47280dacb5f',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $11$ units long and $8$ units wide. What is its area, in square units?$q$, $q$[{"text":"88","is_correct":true},{"text":"80","is_correct":false,"misconception_token":"miscounted-a-column"},{"text":"99","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"38","is_correct":false,"misconception_token":"confused-area-perimeter"}]$q$::jsonb, '88', $q$Area is length times width: $11 \times 8 = 88$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('af334cd9-92c3-5866-af1b-01da18dd0103',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $4$ units long and $6$ units wide. What is its area, in square units?$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"miscounted-a-column"},{"text":"24","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"confused-area-perimeter"},{"text":"28","is_correct":false,"misconception_token":"miscounted-a-row"}]$q$::jsonb, '24', $q$Area is length times width: $4 \times 6 = 24$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('df4dd114-8364-56ef-9b43-7b46312c810a',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $10$ units long and $10$ units wide. What is its area, in square units?$q$, $q$[{"text":"110","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"90","is_correct":false,"misconception_token":"miscounted-a-column"},{"text":"100","is_correct":true},{"text":"40","is_correct":false,"misconception_token":"confused-area-perimeter"}]$q$::jsonb, '100', $q$Area is length times width: $10 \times 10 = 100$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('34157491-df0b-5abb-898a-a98a65550610',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $4$ units long and $11$ units wide. What is its area, in square units?$q$, $q$[{"text":"30","is_correct":false,"misconception_token":"confused-area-perimeter"},{"text":"33","is_correct":false,"misconception_token":"miscounted-a-column"},{"text":"44","is_correct":true},{"text":"48","is_correct":false,"misconception_token":"miscounted-a-row"}]$q$::jsonb, '44', $q$Area is length times width: $4 \times 11 = 44$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('62463e0f-b6df-566d-b7bb-b1a74ad01948',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $11$ units long and $2$ units wide. What is its area, in square units?$q$, $q$[{"text":"26","is_correct":false,"misconception_token":"confused-area-perimeter"},{"text":"33","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"22","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"miscounted-a-column"}]$q$::jsonb, '22', $q$Area is length times width: $11 \times 2 = 22$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('51716c2a-8c75-5cf1-a191-a15c77ae2eac',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $9$ units long and $3$ units wide. What is its area, in square units?$q$, $q$[{"text":"27","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"miscounted-a-column"},{"text":"36","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"12","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '27', $q$Area is length times width: $9 \times 3 = 27$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b5a85eef-60b9-5a1d-b11c-e16fab64505a',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $9$ units long and $10$ units wide. What is its area, in square units?$q$, $q$[{"text":"90","is_correct":true},{"text":"38","is_correct":false,"misconception_token":"confused-area-perimeter"},{"text":"99","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"80","is_correct":false,"misconception_token":"miscounted-a-column"}]$q$::jsonb, '90', $q$Area is length times width: $9 \times 10 = 90$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('36685a2d-190b-5f8f-bbbf-8aa2b1164225',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $10$ units long and $3$ units wide. What is its area, in square units?$q$, $q$[{"text":"30","is_correct":true},{"text":"26","is_correct":false,"misconception_token":"confused-area-perimeter"},{"text":"27","is_correct":false,"misconception_token":"miscounted-a-column"},{"text":"40","is_correct":false,"misconception_token":"miscounted-a-row"}]$q$::jsonb, '30', $q$Area is length times width: $10 \times 3 = 30$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('481773c0-e19b-59c3-86c4-054c6c4d59a5',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $11$ units long and $4$ units wide. What is its area, in square units?$q$, $q$[{"text":"44","is_correct":true},{"text":"55","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"30","is_correct":false,"misconception_token":"confused-area-perimeter"},{"text":"40","is_correct":false,"misconception_token":"miscounted-a-column"}]$q$::jsonb, '44', $q$Area is length times width: $11 \times 4 = 44$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1d9f897d-27bb-53ff-acef-70d8bdf2fcf2',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $4$ units long and $5$ units wide. What is its area, in square units?$q$, $q$[{"text":"20","is_correct":true},{"text":"18","is_correct":false,"misconception_token":"confused-area-perimeter"},{"text":"24","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"15","is_correct":false,"misconception_token":"miscounted-a-column"}]$q$::jsonb, '20', $q$Area is length times width: $4 \times 5 = 20$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('692ff8f9-9dd8-576d-a422-077314e7b4c0',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $8$ units long and $10$ units wide. What is its area, in square units?$q$, $q$[{"text":"36","is_correct":false,"misconception_token":"confused-area-perimeter"},{"text":"70","is_correct":false,"misconception_token":"miscounted-a-column"},{"text":"88","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"80","is_correct":true}]$q$::jsonb, '80', $q$Area is length times width: $8 \times 10 = 80$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c43d9a6f-62e6-5f23-87bc-b4025c2bd6a2',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $10$ units long and $5$ units wide. What is its area, in square units?$q$, $q$[{"text":"50","is_correct":true},{"text":"60","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"45","is_correct":false,"misconception_token":"miscounted-a-column"},{"text":"30","is_correct":false,"misconception_token":"confused-area-perimeter"}]$q$::jsonb, '50', $q$Area is length times width: $10 \times 5 = 50$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('02d4b528-55b3-590e-aa68-0015f1124220',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $2$ units long and $12$ units wide. What is its area, in square units?$q$, $q$[{"text":"24","is_correct":true},{"text":"28","is_correct":false,"misconception_token":"confused-area-perimeter"},{"text":"26","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"12","is_correct":false,"misconception_token":"miscounted-a-column"}]$q$::jsonb, '24', $q$Area is length times width: $2 \times 12 = 24$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5a799ed0-b4f1-5b19-89b0-b21cb8553da5',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $6$ units long and $9$ units wide. What is its area, in square units?$q$, $q$[{"text":"60","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"45","is_correct":false,"misconception_token":"miscounted-a-column"},{"text":"54","is_correct":true},{"text":"30","is_correct":false,"misconception_token":"confused-area-perimeter"}]$q$::jsonb, '54', $q$Area is length times width: $6 \times 9 = 54$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f8a39449-86ce-5136-8a2e-269c5fdddafb',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $3$ units long and $7$ units wide. What is its area, in square units?$q$, $q$[{"text":"24","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"14","is_correct":false,"misconception_token":"miscounted-a-column"},{"text":"20","is_correct":false,"misconception_token":"confused-area-perimeter"},{"text":"21","is_correct":true}]$q$::jsonb, '21', $q$Area is length times width: $3 \times 7 = 21$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bfa603bb-b4ee-5dcc-899f-a2dc3a5491c7',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $10$ units long and $11$ units wide. What is its area, in square units?$q$, $q$[{"text":"110","is_correct":true},{"text":"120","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"42","is_correct":false,"misconception_token":"confused-area-perimeter"},{"text":"99","is_correct":false,"misconception_token":"miscounted-a-column"}]$q$::jsonb, '110', $q$Area is length times width: $10 \times 11 = 110$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('09f009da-45ce-5ccb-ac94-68285fc0373b',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $12$ units long and $4$ units wide. What is its area, in square units?$q$, $q$[{"text":"60","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"32","is_correct":false,"misconception_token":"confused-area-perimeter"},{"text":"44","is_correct":false,"misconception_token":"miscounted-a-column"},{"text":"48","is_correct":true}]$q$::jsonb, '48', $q$Area is length times width: $12 \times 4 = 48$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9533d1c2-164a-518c-b397-826f5e911455',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $4$ units long and $7$ units wide. What is its area, in square units?$q$, $q$[{"text":"28","is_correct":true},{"text":"21","is_correct":false,"misconception_token":"miscounted-a-column"},{"text":"32","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"22","is_correct":false,"misconception_token":"confused-area-perimeter"}]$q$::jsonb, '28', $q$Area is length times width: $4 \times 7 = 28$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('50b9d92e-51b7-5df7-ba15-9ecd8780abc8',
   (select id from public.question_templates where code = 'rectangle-area-easy-v1'),
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy',
   $q$A rectangle is $4$ units long and $4$ units wide. What is its area, in square units?$q$, $q$[{"text":"16","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"miscounted-a-row"},{"text":"12","is_correct":false,"misconception_token":"miscounted-a-column"},{"text":"8","is_correct":false,"misconception_token":"added-instead-of-multiplied"}]$q$::jsonb, '16', $q$Area is length times width: $4 \times 4 = 16$ square units.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- ratio-scale-medium-v1 (problem-solving-data-analysis, medium) — questions 1..20
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('843d50cb-ef57-591d-9d3e-1dea144a6ba0',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $4 : 3$. If there are $16$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"12","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"inverted-the-ratio"},{"text":"9","is_correct":false,"misconception_token":"ratio-scaled-too-short"},{"text":"15","is_correct":false,"misconception_token":"ratio-scaled-too-far"}]$q$::jsonb, '12', $q$There are $16 \div 4 = 4$ equal groups, so the blue marbles are $3 \times 4 = 12$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cec25c1f-3ca9-5c1a-b5cb-95961c420316',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $4 : 5$. If there are $20$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"30","is_correct":false,"misconception_token":"ratio-scaled-too-far"},{"text":"25","is_correct":true},{"text":"21","is_correct":false,"misconception_token":"added-instead-of-scaled"},{"text":"20","is_correct":false,"misconception_token":"inverted-the-ratio"}]$q$::jsonb, '25', $q$There are $20 \div 4 = 5$ equal groups, so the blue marbles are $5 \times 5 = 25$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b073cc00-26e9-5bba-8a45-339b6e9901e1',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $2 : 3$. If there are $12$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"15","is_correct":false,"misconception_token":"ratio-scaled-too-short"},{"text":"21","is_correct":false,"misconception_token":"ratio-scaled-too-far"},{"text":"18","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"inverted-the-ratio"}]$q$::jsonb, '18', $q$There are $12 \div 2 = 6$ equal groups, so the blue marbles are $3 \times 6 = 18$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c0cdaf7a-3fe0-5042-a9ce-19df5ccba59c',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $5 : 6$. If there are $30$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"36","is_correct":true},{"text":"31","is_correct":false,"misconception_token":"added-instead-of-scaled"},{"text":"30","is_correct":false,"misconception_token":"inverted-the-ratio"},{"text":"42","is_correct":false,"misconception_token":"ratio-scaled-too-far"}]$q$::jsonb, '36', $q$There are $30 \div 5 = 6$ equal groups, so the blue marbles are $6 \times 6 = 36$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d4cb33d1-0fe3-54a4-8caf-143bc1f45d61',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $2 : 1$. If there are $16$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"8","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"inverted-the-ratio"},{"text":"9","is_correct":false,"misconception_token":"ratio-scaled-too-far"},{"text":"7","is_correct":false,"misconception_token":"ratio-scaled-too-short"}]$q$::jsonb, '8', $q$There are $16 \div 2 = 8$ equal groups, so the blue marbles are $1 \times 8 = 8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('57fd6665-6fd9-5202-83c1-7318059274f7',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $2 : 3$. If there are $14$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"14","is_correct":false,"misconception_token":"inverted-the-ratio"},{"text":"18","is_correct":false,"misconception_token":"ratio-scaled-too-short"},{"text":"24","is_correct":false,"misconception_token":"ratio-scaled-too-far"},{"text":"21","is_correct":true}]$q$::jsonb, '21', $q$There are $14 \div 2 = 7$ equal groups, so the blue marbles are $3 \times 7 = 21$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('07f02338-7e3f-567a-a32f-a9c4ade1295b',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $6 : 1$. If there are $36$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"36","is_correct":false,"misconception_token":"inverted-the-ratio"},{"text":"5","is_correct":false,"misconception_token":"ratio-scaled-too-short"},{"text":"7","is_correct":false,"misconception_token":"ratio-scaled-too-far"},{"text":"6","is_correct":true}]$q$::jsonb, '6', $q$There are $36 \div 6 = 6$ equal groups, so the blue marbles are $1 \times 6 = 6$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c10105fb-b335-5379-9b27-2926aed89c2d',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $5 : 1$. If there are $40$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"8","is_correct":true},{"text":"40","is_correct":false,"misconception_token":"inverted-the-ratio"},{"text":"7","is_correct":false,"misconception_token":"ratio-scaled-too-short"},{"text":"9","is_correct":false,"misconception_token":"ratio-scaled-too-far"}]$q$::jsonb, '8', $q$There are $40 \div 5 = 8$ equal groups, so the blue marbles are $1 \times 8 = 8$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2165eb85-9d1a-5317-864d-edfdc5481bc9',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $5 : 6$. If there are $45$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"54","is_correct":true},{"text":"45","is_correct":false,"misconception_token":"inverted-the-ratio"},{"text":"48","is_correct":false,"misconception_token":"ratio-scaled-too-short"},{"text":"60","is_correct":false,"misconception_token":"ratio-scaled-too-far"}]$q$::jsonb, '54', $q$There are $45 \div 5 = 9$ equal groups, so the blue marbles are $6 \times 9 = 54$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('677b6edd-494f-54a7-b1b5-08acd83bbdef',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $5 : 1$. If there are $20$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"4","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"inverted-the-ratio"},{"text":"5","is_correct":false,"misconception_token":"ratio-scaled-too-far"},{"text":"3","is_correct":false,"misconception_token":"ratio-scaled-too-short"}]$q$::jsonb, '4', $q$There are $20 \div 5 = 4$ equal groups, so the blue marbles are $1 \times 4 = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fa8cdfaa-f3d8-5926-a15a-9b69c4bb7ccb',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $6 : 5$. If there are $24$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"25","is_correct":false,"misconception_token":"ratio-scaled-too-far"},{"text":"24","is_correct":false,"misconception_token":"inverted-the-ratio"},{"text":"20","is_correct":true},{"text":"15","is_correct":false,"misconception_token":"ratio-scaled-too-short"}]$q$::jsonb, '20', $q$There are $24 \div 6 = 4$ equal groups, so the blue marbles are $5 \times 4 = 20$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ab995eae-b343-58dc-a076-451b2ae1d1e6',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $6 : 5$. If there are $30$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"25","is_correct":true},{"text":"29","is_correct":false,"misconception_token":"added-instead-of-scaled"},{"text":"30","is_correct":false,"misconception_token":"inverted-the-ratio"},{"text":"20","is_correct":false,"misconception_token":"ratio-scaled-too-short"}]$q$::jsonb, '25', $q$There are $30 \div 6 = 5$ equal groups, so the blue marbles are $5 \times 5 = 25$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8bc40246-ff0f-59b8-9577-25c5edebe677',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $4 : 5$. If there are $8$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"8","is_correct":false,"misconception_token":"inverted-the-ratio"},{"text":"10","is_correct":true},{"text":"5","is_correct":false,"misconception_token":"ratio-scaled-too-short"},{"text":"15","is_correct":false,"misconception_token":"ratio-scaled-too-far"}]$q$::jsonb, '10', $q$There are $8 \div 4 = 2$ equal groups, so the blue marbles are $5 \times 2 = 10$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b4fa4c7b-c02f-57e0-86ed-a90ea681d488',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $5 : 2$. If there are $45$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"45","is_correct":false,"misconception_token":"inverted-the-ratio"},{"text":"18","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"ratio-scaled-too-far"},{"text":"16","is_correct":false,"misconception_token":"ratio-scaled-too-short"}]$q$::jsonb, '18', $q$There are $45 \div 5 = 9$ equal groups, so the blue marbles are $2 \times 9 = 18$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f7e3ce3a-5b8b-5d87-a489-eb43dc6908d5',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $1 : 6$. If there are $8$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"48","is_correct":true},{"text":"54","is_correct":false,"misconception_token":"ratio-scaled-too-far"},{"text":"42","is_correct":false,"misconception_token":"ratio-scaled-too-short"},{"text":"8","is_correct":false,"misconception_token":"inverted-the-ratio"}]$q$::jsonb, '48', $q$There are $8 \div 1 = 8$ equal groups, so the blue marbles are $6 \times 8 = 48$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('85751629-0f83-5365-ba9c-c7c01edb5e7e',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $3 : 4$. If there are $30$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"44","is_correct":false,"misconception_token":"ratio-scaled-too-far"},{"text":"40","is_correct":true},{"text":"36","is_correct":false,"misconception_token":"ratio-scaled-too-short"},{"text":"30","is_correct":false,"misconception_token":"inverted-the-ratio"}]$q$::jsonb, '40', $q$There are $30 \div 3 = 10$ equal groups, so the blue marbles are $4 \times 10 = 40$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ab49ed4c-d032-51bf-b2f3-e0a80a1cd204',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $1 : 3$. If there are $3$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"9","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"ratio-scaled-too-far"},{"text":"6","is_correct":false,"misconception_token":"ratio-scaled-too-short"},{"text":"3","is_correct":false,"misconception_token":"inverted-the-ratio"}]$q$::jsonb, '9', $q$There are $3 \div 1 = 3$ equal groups, so the blue marbles are $3 \times 3 = 9$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b00f695a-1c35-5818-b72a-54fa97544ffb',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $5 : 6$. If there are $40$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"40","is_correct":false,"misconception_token":"inverted-the-ratio"},{"text":"48","is_correct":true},{"text":"54","is_correct":false,"misconception_token":"ratio-scaled-too-far"},{"text":"42","is_correct":false,"misconception_token":"ratio-scaled-too-short"}]$q$::jsonb, '48', $q$There are $40 \div 5 = 8$ equal groups, so the blue marbles are $6 \times 8 = 48$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ba39d8e0-c199-5b76-bd0b-1dd31a9e1128',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $3 : 1$. If there are $12$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"3","is_correct":false,"misconception_token":"ratio-scaled-too-short"},{"text":"5","is_correct":false,"misconception_token":"ratio-scaled-too-far"},{"text":"4","is_correct":true},{"text":"12","is_correct":false,"misconception_token":"inverted-the-ratio"}]$q$::jsonb, '4', $q$There are $12 \div 3 = 4$ equal groups, so the blue marbles are $1 \times 4 = 4$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2683598d-90df-5bad-9d59-961576c6aa46',
   (select id from public.question_templates where code = 'ratio-scale-medium-v1'),
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium',
   $q$A bag has red and blue marbles in the ratio $5 : 2$. If there are $40$ red marbles, how many blue marbles are there?$q$, $q$[{"text":"14","is_correct":false,"misconception_token":"ratio-scaled-too-short"},{"text":"40","is_correct":false,"misconception_token":"inverted-the-ratio"},{"text":"18","is_correct":false,"misconception_token":"ratio-scaled-too-far"},{"text":"16","is_correct":true}]$q$::jsonb, '16', $q$There are $40 \div 5 = 8$ equal groups, so the blue marbles are $2 \times 8 = 16$.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- proportion-scale-medium-v1 (problem-solving-data-analysis, medium) — questions 1..20
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('72b38cb5-74c8-5c0f-b69c-1fe0c7614709',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$5$ identical boxes hold $30$ books in all. How many books do $4$ boxes hold?$q$, $q$[{"text":"24","is_correct":true},{"text":"30","is_correct":false,"misconception_token":"rate-scaled-too-far"},{"text":"29","is_correct":false,"misconception_token":"added-instead-of-scaled"},{"text":"18","is_correct":false,"misconception_token":"rate-scaled-too-short"}]$q$::jsonb, '24', $q$Each box holds $30 \div 5 = 6$ books, so $4$ boxes hold $6 \times 4 = 24$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ab1261d7-4308-5700-a586-cef96b4bc7b9',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$5$ identical boxes hold $40$ books in all. How many books do $10$ boxes hold?$q$, $q$[{"text":"88","is_correct":false,"misconception_token":"rate-scaled-too-far"},{"text":"80","is_correct":true},{"text":"40","is_correct":false,"misconception_token":"answered-the-total"},{"text":"72","is_correct":false,"misconception_token":"rate-scaled-too-short"}]$q$::jsonb, '80', $q$Each box holds $40 \div 5 = 8$ books, so $10$ boxes hold $8 \times 10 = 80$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7ff2dd8d-c978-55ce-9d55-619a3e2d6ffd',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$4$ identical boxes hold $16$ books in all. How many books do $7$ boxes hold?$q$, $q$[{"text":"16","is_correct":false,"misconception_token":"answered-the-total"},{"text":"24","is_correct":false,"misconception_token":"rate-scaled-too-short"},{"text":"28","is_correct":true},{"text":"32","is_correct":false,"misconception_token":"rate-scaled-too-far"}]$q$::jsonb, '28', $q$Each box holds $16 \div 4 = 4$ books, so $7$ boxes hold $4 \times 7 = 28$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ab655309-490e-5586-a27a-bf883be1499f',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$7$ identical boxes hold $56$ books in all. How many books do $12$ boxes hold?$q$, $q$[{"text":"88","is_correct":false,"misconception_token":"rate-scaled-too-short"},{"text":"104","is_correct":false,"misconception_token":"rate-scaled-too-far"},{"text":"56","is_correct":false,"misconception_token":"answered-the-total"},{"text":"96","is_correct":true}]$q$::jsonb, '96', $q$Each box holds $56 \div 7 = 8$ books, so $12$ boxes hold $8 \times 12 = 96$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('40208373-81e9-5b14-b13a-308b699bd015',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$8$ identical boxes hold $24$ books in all. How many books do $5$ boxes hold?$q$, $q$[{"text":"18","is_correct":false,"misconception_token":"rate-scaled-too-far"},{"text":"12","is_correct":false,"misconception_token":"rate-scaled-too-short"},{"text":"24","is_correct":false,"misconception_token":"answered-the-total"},{"text":"15","is_correct":true}]$q$::jsonb, '15', $q$Each box holds $24 \div 8 = 3$ books, so $5$ boxes hold $3 \times 5 = 15$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8ee27fad-b900-519c-8022-6458835c6afd',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$4$ identical boxes hold $12$ books in all. How many books do $8$ boxes hold?$q$, $q$[{"text":"27","is_correct":false,"misconception_token":"rate-scaled-too-far"},{"text":"12","is_correct":false,"misconception_token":"answered-the-total"},{"text":"21","is_correct":false,"misconception_token":"rate-scaled-too-short"},{"text":"24","is_correct":true}]$q$::jsonb, '24', $q$Each box holds $12 \div 4 = 3$ books, so $8$ boxes hold $3 \times 8 = 24$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('69111f1b-2133-56f6-9481-074d147db8f2',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$2$ identical boxes hold $18$ books in all. How many books do $7$ boxes hold?$q$, $q$[{"text":"72","is_correct":false,"misconception_token":"rate-scaled-too-far"},{"text":"18","is_correct":false,"misconception_token":"answered-the-total"},{"text":"54","is_correct":false,"misconception_token":"rate-scaled-too-short"},{"text":"63","is_correct":true}]$q$::jsonb, '63', $q$Each box holds $18 \div 2 = 9$ books, so $7$ boxes hold $9 \times 7 = 63$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a1253d8e-055e-5dab-b1bd-67404e6646cf',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$3$ identical boxes hold $21$ books in all. How many books do $10$ boxes hold?$q$, $q$[{"text":"70","is_correct":true},{"text":"77","is_correct":false,"misconception_token":"rate-scaled-too-far"},{"text":"21","is_correct":false,"misconception_token":"answered-the-total"},{"text":"63","is_correct":false,"misconception_token":"rate-scaled-too-short"}]$q$::jsonb, '70', $q$Each box holds $21 \div 3 = 7$ books, so $10$ boxes hold $7 \times 10 = 70$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3d47de9a-4d10-5639-a1e6-f97960b99f10',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$7$ identical boxes hold $49$ books in all. How many books do $9$ boxes hold?$q$, $q$[{"text":"70","is_correct":false,"misconception_token":"rate-scaled-too-far"},{"text":"63","is_correct":true},{"text":"49","is_correct":false,"misconception_token":"answered-the-total"},{"text":"56","is_correct":false,"misconception_token":"rate-scaled-too-short"}]$q$::jsonb, '63', $q$Each box holds $49 \div 7 = 7$ books, so $9$ boxes hold $7 \times 9 = 63$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a6f49e97-419d-5909-bdbe-4699d08db9c3',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$3$ identical boxes hold $24$ books in all. How many books do $5$ boxes hold?$q$, $q$[{"text":"40","is_correct":true},{"text":"48","is_correct":false,"misconception_token":"rate-scaled-too-far"},{"text":"32","is_correct":false,"misconception_token":"rate-scaled-too-short"},{"text":"24","is_correct":false,"misconception_token":"answered-the-total"}]$q$::jsonb, '40', $q$Each box holds $24 \div 3 = 8$ books, so $5$ boxes hold $8 \times 5 = 40$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('334a8a5d-0b99-5c3f-96a4-12429d0512fc',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$3$ identical boxes hold $27$ books in all. How many books do $8$ boxes hold?$q$, $q$[{"text":"81","is_correct":false,"misconception_token":"rate-scaled-too-far"},{"text":"72","is_correct":true},{"text":"63","is_correct":false,"misconception_token":"rate-scaled-too-short"},{"text":"27","is_correct":false,"misconception_token":"answered-the-total"}]$q$::jsonb, '72', $q$Each box holds $27 \div 3 = 9$ books, so $8$ boxes hold $9 \times 8 = 72$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7b7927f9-b2c8-5373-8b55-31d75fd3f231',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$4$ identical boxes hold $12$ books in all. How many books do $7$ boxes hold?$q$, $q$[{"text":"12","is_correct":false,"misconception_token":"answered-the-total"},{"text":"21","is_correct":true},{"text":"24","is_correct":false,"misconception_token":"rate-scaled-too-far"},{"text":"18","is_correct":false,"misconception_token":"rate-scaled-too-short"}]$q$::jsonb, '21', $q$Each box holds $12 \div 4 = 3$ books, so $7$ boxes hold $3 \times 7 = 21$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e3491945-e00a-56e2-93da-9074fcc9b35a',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$7$ identical boxes hold $42$ books in all. How many books do $3$ boxes hold?$q$, $q$[{"text":"24","is_correct":false,"misconception_token":"rate-scaled-too-far"},{"text":"18","is_correct":true},{"text":"42","is_correct":false,"misconception_token":"answered-the-total"},{"text":"12","is_correct":false,"misconception_token":"rate-scaled-too-short"}]$q$::jsonb, '18', $q$Each box holds $42 \div 7 = 6$ books, so $3$ boxes hold $6 \times 3 = 18$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2ad47402-a358-5798-a9bd-a0b57bd6ad46',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$4$ identical boxes hold $28$ books in all. How many books do $10$ boxes hold?$q$, $q$[{"text":"77","is_correct":false,"misconception_token":"rate-scaled-too-far"},{"text":"70","is_correct":true},{"text":"63","is_correct":false,"misconception_token":"rate-scaled-too-short"},{"text":"28","is_correct":false,"misconception_token":"answered-the-total"}]$q$::jsonb, '70', $q$Each box holds $28 \div 4 = 7$ books, so $10$ boxes hold $7 \times 10 = 70$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('259d49fd-39ce-5972-9e5f-300bc5a03bf4',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$8$ identical boxes hold $16$ books in all. How many books do $9$ boxes hold?$q$, $q$[{"text":"18","is_correct":true},{"text":"16","is_correct":false,"misconception_token":"rate-scaled-too-short"},{"text":"17","is_correct":false,"misconception_token":"added-instead-of-scaled"},{"text":"20","is_correct":false,"misconception_token":"rate-scaled-too-far"}]$q$::jsonb, '18', $q$Each box holds $16 \div 8 = 2$ books, so $9$ boxes hold $2 \times 9 = 18$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f2386959-ac94-516c-ba42-18989626aae9',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$6$ identical boxes hold $30$ books in all. How many books do $11$ boxes hold?$q$, $q$[{"text":"50","is_correct":false,"misconception_token":"rate-scaled-too-short"},{"text":"55","is_correct":true},{"text":"30","is_correct":false,"misconception_token":"answered-the-total"},{"text":"60","is_correct":false,"misconception_token":"rate-scaled-too-far"}]$q$::jsonb, '55', $q$Each box holds $30 \div 6 = 5$ books, so $11$ boxes hold $5 \times 11 = 55$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e61d32db-2a71-5c3b-a971-6c2df0dc3242',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$5$ identical boxes hold $15$ books in all. How many books do $3$ boxes hold?$q$, $q$[{"text":"9","is_correct":true},{"text":"6","is_correct":false,"misconception_token":"rate-scaled-too-short"},{"text":"15","is_correct":false,"misconception_token":"answered-the-total"},{"text":"12","is_correct":false,"misconception_token":"rate-scaled-too-far"}]$q$::jsonb, '9', $q$Each box holds $15 \div 5 = 3$ books, so $3$ boxes hold $3 \times 3 = 9$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('425e2d9d-329d-5399-8c66-a691ec23372f',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$3$ identical boxes hold $27$ books in all. How many books do $6$ boxes hold?$q$, $q$[{"text":"27","is_correct":false,"misconception_token":"answered-the-total"},{"text":"45","is_correct":false,"misconception_token":"rate-scaled-too-short"},{"text":"54","is_correct":true},{"text":"63","is_correct":false,"misconception_token":"rate-scaled-too-far"}]$q$::jsonb, '54', $q$Each box holds $27 \div 3 = 9$ books, so $6$ boxes hold $9 \times 6 = 54$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7b3ea8fc-1d46-59d1-a7f5-e2ef079372c5',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$5$ identical boxes hold $20$ books in all. How many books do $12$ boxes hold?$q$, $q$[{"text":"52","is_correct":false,"misconception_token":"rate-scaled-too-far"},{"text":"48","is_correct":true},{"text":"20","is_correct":false,"misconception_token":"answered-the-total"},{"text":"44","is_correct":false,"misconception_token":"rate-scaled-too-short"}]$q$::jsonb, '48', $q$Each box holds $20 \div 5 = 4$ books, so $12$ boxes hold $4 \times 12 = 48$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('34b8c6db-6ba5-5877-9683-1b419e6856d3',
   (select id from public.question_templates where code = 'proportion-scale-medium-v1'),
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium',
   $q$$3$ identical boxes hold $9$ books in all. How many books do $12$ boxes hold?$q$, $q$[{"text":"33","is_correct":false,"misconception_token":"rate-scaled-too-short"},{"text":"36","is_correct":true},{"text":"39","is_correct":false,"misconception_token":"rate-scaled-too-far"},{"text":"9","is_correct":false,"misconception_token":"answered-the-total"}]$q$::jsonb, '36', $q$Each box holds $9 \div 3 = 3$ books, so $12$ boxes hold $3 \times 12 = 36$ books.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- mean-from-total-medium-v1 (problem-solving-data-analysis, medium) — questions 1..20
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('42b7c49c-4c6d-5a8b-9c02-11a6b1cd7290',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $96$ points in $6$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"96","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"15","is_correct":false,"misconception_token":"mean-too-low"},{"text":"17","is_correct":false,"misconception_token":"mean-too-high"},{"text":"16","is_correct":true}]$q$::jsonb, '16', $q$The mean is the total shared equally: $96 \div 6 = 16$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('88c6bc54-dcec-5bbf-b647-df9be9306d53',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $152$ points in $8$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"19","is_correct":true},{"text":"18","is_correct":false,"misconception_token":"mean-too-low"},{"text":"20","is_correct":false,"misconception_token":"mean-too-high"},{"text":"152","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '19', $q$The mean is the total shared equally: $152 \div 8 = 19$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dc3d18af-81d0-5395-b03d-30d249675b47',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $60$ points in $4$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"14","is_correct":false,"misconception_token":"mean-too-low"},{"text":"15","is_correct":true},{"text":"60","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"16","is_correct":false,"misconception_token":"mean-too-high"}]$q$::jsonb, '15', $q$The mean is the total shared equally: $60 \div 4 = 15$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('20ff4898-8bd4-5b5b-886f-327a834090b6',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $168$ points in $7$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"25","is_correct":false,"misconception_token":"mean-too-high"},{"text":"23","is_correct":false,"misconception_token":"mean-too-low"},{"text":"24","is_correct":true},{"text":"168","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '24', $q$The mean is the total shared equally: $168 \div 7 = 24$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bb541335-0c83-516d-bf5e-7c9befbe6a63',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $108$ points in $4$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"108","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"26","is_correct":false,"misconception_token":"mean-too-low"},{"text":"27","is_correct":true},{"text":"28","is_correct":false,"misconception_token":"mean-too-high"}]$q$::jsonb, '27', $q$The mean is the total shared equally: $108 \div 4 = 27$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c7c8cae9-4916-54e4-880e-2ad5c5b0a9fa',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $40$ points in $8$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"40","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"6","is_correct":false,"misconception_token":"mean-too-high"},{"text":"5","is_correct":true},{"text":"4","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '5', $q$The mean is the total shared equally: $40 \div 8 = 5$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2fefb191-3792-583c-a968-9308ee310e83',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $63$ points in $7$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"9","is_correct":true},{"text":"8","is_correct":false,"misconception_token":"mean-too-low"},{"text":"10","is_correct":false,"misconception_token":"mean-too-high"},{"text":"63","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '9', $q$The mean is the total shared equally: $63 \div 7 = 9$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ebfec3ff-f610-54fd-ad3b-78356997dfbe',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $56$ points in $7$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"8","is_correct":true},{"text":"56","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"7","is_correct":false,"misconception_token":"mean-too-low"},{"text":"9","is_correct":false,"misconception_token":"mean-too-high"}]$q$::jsonb, '8', $q$The mean is the total shared equally: $56 \div 7 = 8$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c90a83ce-9a45-511c-b915-5fab712b29cd',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $80$ points in $8$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"10","is_correct":true},{"text":"11","is_correct":false,"misconception_token":"mean-too-high"},{"text":"80","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"9","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '10', $q$The mean is the total shared equally: $80 \div 8 = 10$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('17cec151-9236-5718-b7c3-9a56c2ef0771',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $48$ points in $4$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"12","is_correct":true},{"text":"48","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"13","is_correct":false,"misconception_token":"mean-too-high"},{"text":"11","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '12', $q$The mean is the total shared equally: $48 \div 4 = 12$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6f01b32f-18c6-5b2d-ba09-bf485e49893d',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $144$ points in $6$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"144","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"23","is_correct":false,"misconception_token":"mean-too-low"},{"text":"25","is_correct":false,"misconception_token":"mean-too-high"},{"text":"24","is_correct":true}]$q$::jsonb, '24', $q$The mean is the total shared equally: $144 \div 6 = 24$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c6bca56f-9ee4-53a1-bd3b-a8a23f757d12',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $91$ points in $7$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"13","is_correct":true},{"text":"14","is_correct":false,"misconception_token":"mean-too-high"},{"text":"12","is_correct":false,"misconception_token":"mean-too-low"},{"text":"91","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '13', $q$The mean is the total shared equally: $91 \div 7 = 13$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('561e9b8e-cc42-5076-b3c2-98eb09ee05f9',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $84$ points in $3$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"28","is_correct":true},{"text":"84","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"29","is_correct":false,"misconception_token":"mean-too-high"},{"text":"27","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '28', $q$The mean is the total shared equally: $84 \div 3 = 28$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('066ccfed-a573-5834-9f5c-aba2fcb3d1e3',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $105$ points in $5$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"22","is_correct":false,"misconception_token":"mean-too-high"},{"text":"20","is_correct":false,"misconception_token":"mean-too-low"},{"text":"21","is_correct":true},{"text":"105","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '21', $q$The mean is the total shared equally: $105 \div 5 = 21$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('32763092-47f2-5633-8e85-91026ed251f3',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $48$ points in $3$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"17","is_correct":false,"misconception_token":"mean-too-high"},{"text":"15","is_correct":false,"misconception_token":"mean-too-low"},{"text":"48","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"16","is_correct":true}]$q$::jsonb, '16', $q$The mean is the total shared equally: $48 \div 3 = 16$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('69757d0a-2943-5b92-8d65-ffa9992c6be2',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $182$ points in $7$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"26","is_correct":true},{"text":"27","is_correct":false,"misconception_token":"mean-too-high"},{"text":"182","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"25","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '26', $q$The mean is the total shared equally: $182 \div 7 = 26$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e27d31f9-04ef-5fb8-abc9-682766c5c76c',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $72$ points in $4$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"18","is_correct":true},{"text":"17","is_correct":false,"misconception_token":"mean-too-low"},{"text":"19","is_correct":false,"misconception_token":"mean-too-high"},{"text":"72","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '18', $q$The mean is the total shared equally: $72 \div 4 = 18$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b9dc1001-885a-530d-8259-0b2ab26a75ef',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $36$ points in $4$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"9","is_correct":true},{"text":"10","is_correct":false,"misconception_token":"mean-too-high"},{"text":"8","is_correct":false,"misconception_token":"mean-too-low"},{"text":"36","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '9', $q$The mean is the total shared equally: $36 \div 4 = 9$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9db8d68f-0f25-554a-a9ab-da80b7f3dde6',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $150$ points in $6$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"26","is_correct":false,"misconception_token":"mean-too-high"},{"text":"24","is_correct":false,"misconception_token":"mean-too-low"},{"text":"25","is_correct":true},{"text":"150","is_correct":false,"misconception_token":"forgot-to-divide-total"}]$q$::jsonb, '25', $q$The mean is the total shared equally: $150 \div 6 = 25$ points per game.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b8bcc336-08a2-5a82-9f2d-f93874e3c3cd',
   (select id from public.question_templates where code = 'mean-from-total-medium-v1'),
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium',
   $q$A team scored $112$ points in $4$ games. What was the mean (average) number of points per game?$q$, $q$[{"text":"28","is_correct":true},{"text":"112","is_correct":false,"misconception_token":"forgot-to-divide-total"},{"text":"29","is_correct":false,"misconception_token":"mean-too-high"},{"text":"27","is_correct":false,"misconception_token":"mean-too-low"}]$q$::jsonb, '28', $q$The mean is the total shared equally: $112 \div 4 = 28$ points per game.$q$, 'published')
on conflict (id) do update set
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
