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

commit;
