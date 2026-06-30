-- PathwayEd — Question Engine, Stage 2: MATH question templates (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-math-seeds.ts from
-- src/lib/mathTemplates.ts. HOW TO APPLY: paste into the Supabase SQL editor and
-- run (same flow as the other seeds). Idempotent (upsert on code). Depends on
-- migration 0004 (public.question_templates) and the skills taxonomy (seed 0002).
--
-- Original items from the public digital-SAT blueprint; no copyrighted text.

begin;

insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('linear-equation-solve',
   (select id from public.skills where slug = 'linear-thinking'),
   'algebra', 'easy', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"If $\\,{a}x{±b} = {c}$, what is the value of $x$?","slots":[{"name":"a","min":2,"max":9},{"name":"x","min":-9,"max":9,"exclude":[0]},{"name":"b","min":-9,"max":9,"exclude":[0]}],"derived":[{"name":"c","formula":"a*x + b"},{"name":"cMinusB","formula":"c - b"}],"answerFormula":"x","answerFormat":"integer","constraints":["a != 0"],"solutionTemplate":"Start with $\\,{a}x{±b} = {c}$. Subtract the constant from both sides: $\\,{a}x = {cMinusB}$. Divide by ${a}$: $x = {answer}$."}$q$::jsonb,
   $q$[{"formula":"c - b","misconception_token":"forgot-to-divide"},{"formula":"-x","misconception_token":"sign-error"},{"formula":"x + b","misconception_token":"mishandled-constant"}]$q$::jsonb,
   'published', 1)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;

insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('percent-of',
   (select id from public.skills where slug = 'percentages'),
   'problem-solving-data-analysis', 'easy', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"What is ${p}\\%$ of ${n}$?","slots":[{"name":"p","min":5,"max":90,"step":5},{"name":"n","min":20,"max":200,"step":20}],"answerFormula":"p * n / 100","answerFormat":"integer","solutionTemplate":"${p}\\%$ of ${n}$ is $\\frac{{p}}{100} \\times {n} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"p * n / 10","misconception_token":"decimal-place-error"},{"formula":"n - p * n / 100","misconception_token":"complement-instead-of-percent"},{"formula":"p * n / 50","misconception_token":"halved-the-base"},{"formula":"p","misconception_token":"answered-the-percent"}]$q$::jsonb,
   'published', 1)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;

insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('multiplication-basic-easy-v1',
   (select id from public.skills where slug = 'multiplication'),
   'problem-solving-data-analysis', 'easy', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"What is ${a} \\times {b}$?","slots":[{"name":"a","min":2,"max":12},{"name":"b","min":2,"max":12}],"answerFormula":"a * b","answerFormat":"integer","solutionTemplate":"${a} \\times {b} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"a * b - a","misconception_token":"skip-count-error"},{"formula":"a * b + b","misconception_token":"off-by-one-factor"},{"formula":"a + b","misconception_token":"added-instead-of-multiplied"},{"formula":"a * b + a","misconception_token":"skip-count-error"},{"formula":"a * b - b","misconception_token":"off-by-one-factor"}]$q$::jsonb,
   'published', 1)
on conflict (code) do update set
  skill_id        = excluded.skill_id,
  sat_alignment   = excluded.sat_alignment,
  difficulty      = excluded.difficulty,
  kind            = excluded.kind,
  generation_spec = excluded.generation_spec,
  distractor_spec = excluded.distractor_spec,
  status          = excluded.status,
  version         = excluded.version;

commit;
