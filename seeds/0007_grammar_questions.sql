-- PathwayEd — Question Engine: curated GRAMMAR questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-grammar-seeds.ts from the
-- curated pool in src/lib/grammarTemplates.ts. HOW TO APPLY:
--   bun run db:seed seeds/0007_grammar_questions.sql
-- Idempotent (upsert on a deterministic id from code + slot). Depends on
-- migration 0004 (public.generated_questions) and seed 0005 (grammar skills).
--
-- 100% ORIGINAL items written to the public SAT Standard English Conventions
-- format/skill spec — no real SAT or prep-company text is copied or paraphrased.

begin;

-- grammar-subject-verb-agreement (subject-verb-agreement, standard-english-conventions) — 5 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f121ccf0-38c8-5567-aaac-2c2dce418a0b',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'medium',
   $q$Dr. Elena Ruiz, along with her team of graduate students, ______ the coral reefs off the coast every summer.$q$, $q$[{"text":"have surveyed","is_correct":false,"misconception_token":"plural-verb-for-singular"},{"text":"surveys","is_correct":true},{"text":"survey","is_correct":false,"misconception_token":"agreed-with-nearby-noun"},{"text":"surveying","is_correct":false,"misconception_token":"nonfinite-verb"}]$q$::jsonb, $q$surveys$q$, $q$The subject is the singular "Dr. Elena Ruiz." The phrase "along with her team of graduate students" does not change the subject, so the verb stays singular: "surveys."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('acfb56cf-8a9c-513d-a723-46e561601118',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'easy',
   $q$The committee ______ its final recommendations to the school board on Friday.$q$, $q$[{"text":"presents","is_correct":true},{"text":"presenting","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"present","is_correct":false,"misconception_token":"treated-collective-as-plural"},{"text":"to present","is_correct":false,"misconception_token":"used-infinitive"}]$q$::jsonb, $q$presents$q$, $q$A collective noun like "committee" acting as one unit takes a singular verb — and "its" confirms it — so "presents" is correct.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0b163467-ccb8-515f-b863-d6a170630566',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'medium',
   $q$Each of the volunteers ______ responsible for setting up one section of the exhibit.$q$, $q$[{"text":"were","is_correct":false,"misconception_token":"plural-verb-for-singular"},{"text":"is","is_correct":true},{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"are","is_correct":false,"misconception_token":"agreed-with-nearby-noun"}]$q$::jsonb, $q$is$q$, $q$The subject is "Each," which is always singular, so it takes "is." The plural "volunteers" is just part of the phrase after it.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2a195920-4179-598a-81a6-b462599d03fa',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'hard',
   $q$Both the lead actor and the director ______ scheduled to attend the premiere on Saturday.$q$, $q$[{"text":"are","is_correct":true},{"text":"is","is_correct":false,"misconception_token":"singular-for-compound-subject"},{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"to be","is_correct":false,"misconception_token":"used-infinitive"}]$q$::jsonb, $q$are$q$, $q$Two subjects joined by "both … and" form a compound (plural) subject, so the verb is the plural "are."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('226aeeaf-5fda-5be3-b6c5-e66851435a9e',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'easy',
   $q$The stack of documents on the professor's desk ______ taller every week as new submissions arrive.$q$, $q$[{"text":"grow","is_correct":false,"misconception_token":"agreed-with-nearby-noun"},{"text":"have grown","is_correct":false,"misconception_token":"plural-verb-for-singular"},{"text":"growing","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"grows","is_correct":true}]$q$::jsonb, $q$grows$q$, $q$The subject is the singular "stack," not "documents," so the verb is singular: "grows."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- grammar-punctuation-basics (punctuation-basics, standard-english-conventions) — 5 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('66fa9621-01e6-503d-b8fd-5d6f4597e38a',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'easy',
   $q$After the storm finally ______ volunteers began clearing fallen branches from the trail.$q$, $q$[{"text":"passed. The","is_correct":false,"misconception_token":"period-creates-fragment"},{"text":"passed, the","is_correct":true},{"text":"passed the","is_correct":false,"misconception_token":"missing-comma"},{"text":"passed; the","is_correct":false,"misconception_token":"semicolon-misused"}]$q$::jsonb, $q$passed, the$q$, $q$An introductory clause ("After the storm finally passed") is followed by a comma before the main clause.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8317b709-493e-551d-915e-7569f93d517d',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'medium',
   $q$The museum's new wing opened last ______ has already welcomed thousands of visitors.$q$, $q$[{"text":"month. It","is_correct":true},{"text":"month it","is_correct":false,"misconception_token":"run-on"},{"text":"month, it","is_correct":false,"misconception_token":"comma-splice"},{"text":"month; and it","is_correct":false,"misconception_token":"semicolon-misused"}]$q$::jsonb, $q$month. It$q$, $q$These are two complete sentences, so a period separates them. A comma alone (comma splice) or no punctuation (run-on) would be incorrect.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('698dc6fa-369a-58c9-8ebb-0d9e9aba4523',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'easy',
   $q$For the field trip, students should bring a ______ a water bottle, and comfortable walking shoes.$q$, $q$[{"text":"notebook;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"notebook,","is_correct":true},{"text":"notebook.","is_correct":false,"misconception_token":"period-creates-fragment"},{"text":"notebook","is_correct":false,"misconception_token":"missing-comma"}]$q$::jsonb, $q$notebook,$q$, $q$Items in a simple list are separated by commas, so a comma follows "notebook."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ca1f1521-f6a1-5c61-93c0-e944e386515f',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'medium',
   $q$The marine biologist carefully recorded each ______ entered the data into her laptop that evening.$q$, $q$[{"text":"measurement and","is_correct":true},{"text":"measurement, and","is_correct":false,"misconception_token":"unnecessary-comma"},{"text":"measurement; and","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"measurement. And","is_correct":false,"misconception_token":"period-creates-fragment"}]$q$::jsonb, $q$measurement and$q$, $q$"Recorded … and entered" is a compound predicate (two verbs, one subject), so no punctuation goes before "and."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d8406592-02f9-5edc-a346-0d64bb49926e',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'hard',
   $q$The students wondered whether the experiment would produce the same results a second ______$q$, $q$[{"text":"time?","is_correct":false,"misconception_token":"question-mark-for-indirect-question"},{"text":"time","is_correct":false,"misconception_token":"missing-end-punctuation"},{"text":"time!","is_correct":false,"misconception_token":"exclamation-misuse"},{"text":"time.","is_correct":true}]$q$::jsonb, $q$time.$q$, $q$This sentence reports a question indirectly ("wondered whether …"); it is a statement, so it ends with a period, not a question mark.$q$, 'published')
on conflict (id) do update set
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
