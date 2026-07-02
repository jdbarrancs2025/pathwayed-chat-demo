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
   $q$[{"formula":"(p + 5) * n / 100","misconception_token":"overstated-the-percent"},{"formula":"(p - 5) * n / 100","misconception_token":"understated-the-percent"},{"formula":"n - p * n / 100","misconception_token":"complement-instead-of-percent"},{"formula":"(p + 10) * n / 100","misconception_token":"overstated-the-percent"},{"formula":"p","misconception_token":"answered-the-percent"}]$q$::jsonb,
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

insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('division-basic-easy-v1',
   (select id from public.skills where slug = 'division'),
   'problem-solving-data-analysis', 'easy', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"What is ${a} \\div {b}$?","slots":[{"name":"b","min":2,"max":12},{"name":"q","min":2,"max":12}],"derived":[{"name":"a","formula":"b * q"}],"answerFormula":"q","answerFormat":"integer","solutionTemplate":"${a} \\div {b} = {answer}$, because ${b} \\times {answer} = {a}$."}$q$::jsonb,
   $q$[{"formula":"q + 1","misconception_token":"quotient-too-high"},{"formula":"q - 1","misconception_token":"quotient-too-low"},{"formula":"a - b","misconception_token":"subtracted-instead-of-divided"},{"formula":"q + 2","misconception_token":"quotient-too-high"},{"formula":"b","misconception_token":"answered-the-divisor"}]$q$::jsonb,
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
  ('fraction-of-number-easy-v1',
   (select id from public.skills where slug = 'fractions'),
   'problem-solving-data-analysis', 'easy', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"What is $\\frac{{a}}{{b}}$ of ${n}$?","slots":[{"name":"a","min":1,"max":5},{"name":"b","min":2,"max":6},{"name":"k","min":2,"max":12}],"derived":[{"name":"n","formula":"b * k"}],"answerFormula":"a * k","answerFormat":"integer","constraints":["a < b","gcd(a, b) == 1"],"solutionTemplate":"One part is ${n} \\div {b} = {k}$, so $\\frac{{a}}{{b}}$ of ${n}$ is ${a} \\times {k} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"(a + 1) * k","misconception_token":"numerator-too-high"},{"formula":"a * (k - 1)","misconception_token":"part-size-too-small"},{"formula":"(b - a) * k","misconception_token":"used-the-other-part"},{"formula":"a * (k + 1)","misconception_token":"part-size-too-big"},{"formula":"n","misconception_token":"answered-the-whole"}]$q$::jsonb,
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
  ('rectangle-area-easy-v1',
   (select id from public.skills where slug = 'geometry'),
   'geometry-trigonometry', 'easy', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"A rectangle is ${L}$ units long and ${W}$ units wide. What is its area, in square units?","slots":[{"name":"L","min":2,"max":12},{"name":"W","min":2,"max":12}],"answerFormula":"L * W","answerFormat":"integer","solutionTemplate":"Area is length times width: ${L} \\times {W} = {answer}$ square units."}$q$::jsonb,
   $q$[{"formula":"L * W + L","misconception_token":"miscounted-a-row"},{"formula":"L * W - W","misconception_token":"miscounted-a-column"},{"formula":"2 * (L + W)","misconception_token":"confused-area-perimeter"},{"formula":"L + W","misconception_token":"added-instead-of-multiplied"},{"formula":"L * W + W","misconception_token":"miscounted-a-row"}]$q$::jsonb,
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
