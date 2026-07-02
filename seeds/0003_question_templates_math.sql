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

insert into public.question_templates
  (code, skill_id, sat_alignment, difficulty, kind, generation_spec, distractor_spec, status, version)
values
  ('ratio-scale-medium-v1',
   (select id from public.skills where slug = 'ratios'),
   'problem-solving-data-analysis', 'medium', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"A bag has red and blue marbles in the ratio ${p} : {q}$. If there are ${red}$ red marbles, how many blue marbles are there?","slots":[{"name":"p","min":1,"max":6},{"name":"q","min":1,"max":6},{"name":"m","min":2,"max":10}],"derived":[{"name":"red","formula":"p * m"}],"answerFormula":"q * m","answerFormat":"integer","constraints":["gcd(p, q) == 1","p != q"],"solutionTemplate":"There are ${red} \\div {p} = {m}$ equal groups, so the blue marbles are ${q} \\times {m} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"p * m","misconception_token":"inverted-the-ratio"},{"formula":"q * (m + 1)","misconception_token":"ratio-scaled-too-far"},{"formula":"q * (m - 1)","misconception_token":"ratio-scaled-too-short"},{"formula":"p * m + (q - p)","misconception_token":"added-instead-of-scaled"},{"formula":"q","misconception_token":"answered-the-ratio-part"}]$q$::jsonb,
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
  ('proportion-scale-medium-v1',
   (select id from public.skills where slug = 'proportional-reasoning'),
   'problem-solving-data-analysis', 'medium', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"${a}$ identical boxes hold ${total}$ books in all. How many books do ${b}$ boxes hold?","slots":[{"name":"u","min":2,"max":9},{"name":"a","min":2,"max":8},{"name":"b","min":2,"max":12}],"derived":[{"name":"total","formula":"u * a"}],"answerFormula":"u * b","answerFormat":"integer","constraints":["a != b"],"solutionTemplate":"Each box holds ${total} \\div {a} = {u}$ books, so ${b}$ boxes hold ${u} \\times {b} = {answer}$ books."}$q$::jsonb,
   $q$[{"formula":"u * (b + 1)","misconception_token":"rate-scaled-too-far"},{"formula":"u * (b - 1)","misconception_token":"rate-scaled-too-short"},{"formula":"total","misconception_token":"answered-the-total"},{"formula":"total + (b - a)","misconception_token":"added-instead-of-scaled"},{"formula":"u","misconception_token":"answered-the-unit-rate"}]$q$::jsonb,
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
  ('mean-from-total-medium-v1',
   (select id from public.skills where slug = 'data-analysis'),
   'problem-solving-data-analysis', 'medium', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"A team scored ${total}$ points in ${n}$ games. What was the mean (average) number of points per game?","slots":[{"name":"n","min":3,"max":8},{"name":"q","min":5,"max":30}],"derived":[{"name":"total","formula":"n * q"}],"answerFormula":"q","answerFormat":"integer","solutionTemplate":"The mean is the total shared equally: ${total} \\div {n} = {answer}$ points per game."}$q$::jsonb,
   $q$[{"formula":"q + 1","misconception_token":"mean-too-high"},{"formula":"q - 1","misconception_token":"mean-too-low"},{"formula":"total","misconception_token":"forgot-to-divide-total"},{"formula":"total - n","misconception_token":"subtracted-instead-of-divided"},{"formula":"n","misconception_token":"answered-the-count"}]$q$::jsonb,
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
  ('evaluate-expression-medium-v1',
   (select id from public.skills where slug = 'expressions'),
   'algebra', 'medium', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"If $x = {x}$, what is the value of $\\,{a}x + {b}$?","slots":[{"name":"a","min":2,"max":9},{"name":"x","min":2,"max":9},{"name":"b","min":1,"max":9}],"answerFormula":"a * x + b","answerFormat":"integer","solutionTemplate":"Multiply first, then add: $\\,{a} \\times {x} + {b} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"a * (x + b)","misconception_token":"wrong-order-of-operations"},{"formula":"a * x","misconception_token":"dropped-the-constant"},{"formula":"(a + 1) * x + b","misconception_token":"coefficient-too-high"},{"formula":"a + x + b","misconception_token":"added-the-coefficient"},{"formula":"a * x + b + b","misconception_token":"doubled-the-constant"}]$q$::jsonb,
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
  ('evaluate-two-variable-medium-v1',
   (select id from public.skills where slug = 'algebra-1-concepts'),
   'algebra', 'medium', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"If $x = {x}$ and $y = {y}$, what is $\\,{a}x + {b}y$?","slots":[{"name":"a","min":2,"max":6},{"name":"b","min":2,"max":6},{"name":"x","min":2,"max":6},{"name":"y","min":2,"max":6}],"answerFormula":"a * x + b * y","answerFormat":"integer","constraints":["a != b","x != y"],"solutionTemplate":"Substitute, then add the products: $\\,{a}\\times{x} + {b}\\times{y} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"a * y + b * x","misconception_token":"swapped-the-variables"},{"formula":"a * x","misconception_token":"dropped-a-term"},{"formula":"(a + 1) * x + b * y","misconception_token":"coefficient-too-high"},{"formula":"a + x + b + y","misconception_token":"added-everything"},{"formula":"a * x + b * y - x","misconception_token":"coefficient-too-low"}]$q$::jsonb,
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
  ('evaluate-quadratic-function-medium-v1',
   (select id from public.skills where slug = 'functions'),
   'advanced-math', 'medium', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"If $f(x) = x^2 + {b}$, what is $f({x})$?","slots":[{"name":"x","min":2,"max":9},{"name":"b","min":1,"max":9}],"answerFormula":"x * x + b","answerFormat":"integer","solutionTemplate":"Square first, then add: ${x}^2 + {b} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"2 * x + b","misconception_token":"multiplied-instead-of-squared"},{"formula":"x * x","misconception_token":"dropped-the-constant"},{"formula":"(x + 1) * (x + 1) + b","misconception_token":"base-too-high"},{"formula":"x * x + b + b","misconception_token":"doubled-the-constant"},{"formula":"(x - 1) * (x - 1) + b","misconception_token":"base-too-low"}]$q$::jsonb,
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
  ('triangle-area-hard-v1',
   (select id from public.skills where slug = 'hs-geometry'),
   'geometry-trigonometry', 'hard', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"A triangle has base ${base}$ and height ${height}$. What is its area, in square units?","slots":[{"name":"base","min":4,"max":20,"step":2},{"name":"height","min":2,"max":12}],"answerFormula":"base * height / 2","answerFormat":"integer","solutionTemplate":"Area is half of base times height: $({base} \\times {height}) \\div 2 = {answer}$ square units."}$q$::jsonb,
   $q$[{"formula":"(base - 2) * height / 2","misconception_token":"base-too-short"},{"formula":"(base + 2) * height / 2","misconception_token":"base-too-long"},{"formula":"base * height","misconception_token":"forgot-to-halve"},{"formula":"base * (height + 1) / 2","misconception_token":"height-too-tall"},{"formula":"base + height","misconception_token":"added-instead-of-multiplied"}]$q$::jsonb,
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
  ('solve-square-hard-v1',
   (select id from public.skills where slug = 'algebra-2'),
   'advanced-math', 'hard', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"What is the positive solution to $x^2 = {k}$?","slots":[{"name":"x","min":2,"max":25}],"derived":[{"name":"k","formula":"x * x"}],"answerFormula":"x","answerFormat":"integer","solutionTemplate":"The positive number whose square is ${k}$ is ${answer}$ (since ${answer}^2 = {k}$)."}$q$::jsonb,
   $q$[{"formula":"k","misconception_token":"answered-the-square"},{"formula":"x + 1","misconception_token":"root-too-high"},{"formula":"x - 1","misconception_token":"root-too-low"},{"formula":"2 * x","misconception_token":"doubled-the-root"},{"formula":"x + 2","misconception_token":"root-way-too-high"}]$q$::jsonb,
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
  ('evaluate-quadratic-coeff-hard-v1',
   (select id from public.skills where slug = 'advanced-functions'),
   'advanced-math', 'hard', 'template_math',
   $q${"kind":"template_math","schemaVersion":1,"responseType":"multiple_choice","stemTemplate":"If $f(x) = {a}x^2 + {c}$, what is $f({x})$?","slots":[{"name":"a","min":2,"max":5},{"name":"x","min":2,"max":7},{"name":"c","min":1,"max":12}],"answerFormula":"a * x * x + c","answerFormat":"integer","solutionTemplate":"Square first, then multiply, then add: ${a} \\times {x}^2 + {c} = {answer}$."}$q$::jsonb,
   $q$[{"formula":"a * x * x","misconception_token":"dropped-the-constant"},{"formula":"a * (x + 1) * (x + 1) + c","misconception_token":"base-too-high"},{"formula":"2 * a * x + c","misconception_token":"multiplied-instead-of-squared"},{"formula":"(a * x) * (a * x) + c","misconception_token":"squared-the-coefficient"},{"formula":"a * x * x + c + c","misconception_token":"doubled-the-constant"}]$q$::jsonb,
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
