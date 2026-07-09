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

-- grammar-subject-verb-agreement (subject-verb-agreement, standard-english-conventions) — 20 items
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
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d87149f0-5b14-58aa-aeaf-374069beef6a',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'easy',
   $q$Everyone on the two debate teams ______ expected to research both sides of the topic before the tournament.$q$, $q$[{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"were","is_correct":false,"misconception_token":"plural-verb-for-singular"},{"text":"are","is_correct":false,"misconception_token":"agreed-with-nearby-noun"},{"text":"is","is_correct":true}]$q$::jsonb, $q$is$q$, $q$The subject "Everyone" is always singular, so it takes "is." The nearby "teams" sits inside the phrase and does not change the subject.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('56090830-a239-5b7d-82e2-3ed309836f51',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'easy',
   $q$Beyond the long rows of tall bookshelves ______ a quiet reading nook with two comfortable armchairs.$q$, $q$[{"text":"sitting","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"sit","is_correct":false,"misconception_token":"agreed-with-nearby-noun"},{"text":"sits","is_correct":true},{"text":"have sat","is_correct":false,"misconception_token":"plural-verb-for-singular"}]$q$::jsonb, $q$sits$q$, $q$The subject is the singular "nook," which comes after the verb. "Bookshelves" is part of the opening phrase, so the verb stays singular: "sits."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('73238342-0a62-52f3-8a54-539968f5524e',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'easy',
   $q$The news about the damaged coastal highways ______ posted on the city's website every hour.$q$, $q$[{"text":"to be","is_correct":false,"misconception_token":"used-infinitive"},{"text":"are","is_correct":false,"misconception_token":"plural-verb-for-singular"},{"text":"is","is_correct":true},{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"}]$q$::jsonb, $q$is$q$, $q$Even though it ends in -s, "news" is a singular noun, so it takes "is."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('34c1d12b-9355-5324-b9e0-ae25a4f815f0',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'easy',
   $q$One of the museum's oldest paintings ______ on loan to a gallery in another city this month.$q$, $q$[{"text":"is","is_correct":true},{"text":"are","is_correct":false,"misconception_token":"agreed-with-nearby-noun"},{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"were","is_correct":false,"misconception_token":"plural-verb-for-singular"}]$q$::jsonb, $q$is$q$, $q$The subject is "One" (singular), so the verb is "is." "Paintings" is just part of the "of" phrase that follows.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c4a363ec-6a09-5bbb-85c0-8b9f08ac4f1c',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'easy',
   $q$Collecting rare stamps from distant countries ______ her favorite way to unwind after a long week.$q$, $q$[{"text":"are","is_correct":false,"misconception_token":"agreed-with-nearby-noun"},{"text":"were","is_correct":false,"misconception_token":"plural-verb-for-singular"},{"text":"is","is_correct":true},{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"}]$q$::jsonb, $q$is$q$, $q$The subject is the gerund phrase "Collecting rare stamps …," which names one activity and is singular, so the verb is "is."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('27d49d52-9a44-5652-b905-aa850f872eed',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'easy',
   $q$Macaroni and cheese ______ the dish that sells out fastest at the school fundraiser every year.$q$, $q$[{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"are","is_correct":false,"misconception_token":"treated-unit-as-plural"},{"text":"is","is_correct":true},{"text":"to be","is_correct":false,"misconception_token":"used-infinitive"}]$q$::jsonb, $q$is$q$, $q$"Macaroni and cheese" names a single dish, so it takes the singular "is" even though it is joined by "and."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d7b27f61-d37b-5537-ab9c-95c5a52dfff1',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'medium',
   $q$Neither the coach nor the players ______ satisfied with the referee's final call.$q$, $q$[{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"was","is_correct":false,"misconception_token":"matched-farther-subject"},{"text":"to be","is_correct":false,"misconception_token":"used-infinitive"},{"text":"were","is_correct":true}]$q$::jsonb, $q$were$q$, $q$With "neither … nor," the verb agrees with the nearer subject, "players," which is plural, so "were."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d3771010-c040-5fbb-8fd2-63f03c1ef939',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'medium',
   $q$Either the students or their teacher ______ going to introduce the guest speaker at the assembly.$q$, $q$[{"text":"are","is_correct":false,"misconception_token":"matched-farther-subject"},{"text":"is","is_correct":true},{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"have been","is_correct":false,"misconception_token":"plural-verb-for-singular"}]$q$::jsonb, $q$is$q$, $q$With "either … or," the verb agrees with the nearer subject, "teacher," which is singular, so "is."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2a7af23f-a977-5e9d-ba37-e8c8d201019e',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'medium',
   $q$The number of applicants for the summer scholarship ______ higher this year than ever before.$q$, $q$[{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"are","is_correct":false,"misconception_token":"agreed-with-nearby-noun"},{"text":"is","is_correct":true},{"text":"were","is_correct":false,"misconception_token":"plural-verb-for-singular"}]$q$::jsonb, $q$is$q$, $q$"The number of" refers to one total, so it takes the singular "is." (By contrast, "a number of" means "several" and would be plural.)$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0e5e3f94-7064-51ae-848a-b7460bdf6c67',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'medium',
   $q$Here ______ the results that the research team has been waiting weeks to see.$q$, $q$[{"text":"to be","is_correct":false,"misconception_token":"used-infinitive"},{"text":"is","is_correct":false,"misconception_token":"singular-verb-for-plural"},{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"are","is_correct":true}]$q$::jsonb, $q$are$q$, $q$In "Here ___ the results," the real subject is the plural "results," which follows the verb, so "are."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('99039061-fda1-5645-8874-337f6d2e7e4b',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'medium',
   $q$Fifteen dollars ______ a fair price for a ticket to the student-run play on Friday night.$q$, $q$[{"text":"is","is_correct":true},{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"to be","is_correct":false,"misconception_token":"used-infinitive"},{"text":"are","is_correct":false,"misconception_token":"treated-unit-as-plural"}]$q$::jsonb, $q$is$q$, $q$A sum of money like "fifteen dollars" is treated as one amount, so it takes the singular "is."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5781cb1a-7625-5a01-b8d4-28edddd32333',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'medium',
   $q$The starting quarterback and the head coach ______ reviewing game footage late into the night.$q$, $q$[{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"to be","is_correct":false,"misconception_token":"used-infinitive"},{"text":"is","is_correct":false,"misconception_token":"singular-for-compound-subject"},{"text":"are","is_correct":true}]$q$::jsonb, $q$are$q$, $q$Two subjects joined by "and" form a plural compound subject, so the verb is "are."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0e2fc22f-d73a-5b46-b5e4-c97ebdc8e710',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'hard',
   $q$Neither the senators nor the governor ______ willing to compromise on the proposed budget.$q$, $q$[{"text":"is","is_correct":true},{"text":"are","is_correct":false,"misconception_token":"matched-farther-subject"},{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"have been","is_correct":false,"misconception_token":"plural-verb-for-singular"}]$q$::jsonb, $q$is$q$, $q$With "neither … nor," the verb matches the nearer subject; here that is the singular "governor," so "is." (If "senators" came second, it would be "are.")$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('efd13579-5ce7-5b34-9c04-148464ca1e80',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'hard',
   $q$The lead editor is one of those reviewers who ______ willing to read a manuscript twice before deciding.$q$, $q$[{"text":"is","is_correct":false,"misconception_token":"singular-verb-for-plural"},{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"are","is_correct":true},{"text":"to be","is_correct":false,"misconception_token":"used-infinitive"}]$q$::jsonb, $q$are$q$, $q$In "one of those reviewers who …," the "who" refers to the plural "reviewers," so the verb is "are."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b11f3478-5deb-54c2-be13-4b53f73340df',
   null,
   (select id from public.skills where slug = 'subject-verb-agreement'),
   'standard-english-conventions', 'hard',
   $q$Among the artifacts in the new exhibit ______ a collection of ancient coins that draws large crowds.$q$, $q$[{"text":"is","is_correct":true},{"text":"were","is_correct":false,"misconception_token":"plural-verb-for-singular"},{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"are","is_correct":false,"misconception_token":"agreed-with-nearby-noun"}]$q$::jsonb, $q$is$q$, $q$The subject is the singular "collection," which follows the verb. "Artifacts" and "coins" sit inside phrases, so the verb is "is."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- grammar-punctuation-basics (punctuation-basics, standard-english-conventions) — 20 items
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
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7fb917d1-e659-5d12-b9c5-d4aec0b1990e',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'easy',
   $q$The renovated library features a ______ reading room that overlooks the courtyard.$q$, $q$[{"text":"bright. Airy","is_correct":false,"misconception_token":"period-creates-fragment"},{"text":"bright; airy","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"bright airy","is_correct":false,"misconception_token":"missing-comma"},{"text":"bright, airy","is_correct":true}]$q$::jsonb, $q$bright, airy$q$, $q$Two adjectives that each describe the noun equally are separated by a comma: "a bright, airy reading room."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9d971966-13fd-546b-8668-79b9f044a3e5',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'easy',
   $q$Built entirely from salvaged ______ the community center opened to the public last spring.$q$, $q$[{"text":"materials; the","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"materials the","is_correct":false,"misconception_token":"missing-comma"},{"text":"materials, the","is_correct":true},{"text":"materials. The","is_correct":false,"misconception_token":"period-creates-fragment"}]$q$::jsonb, $q$materials, the$q$, $q$The opening phrase "Built entirely from salvaged materials" is not a complete sentence, so a comma follows it before the main clause.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('74865c2f-356c-5525-a805-8fc1a7886ac7',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'easy',
   $q$The experiment produced unexpected ______ so the team repeated it the following week.$q$, $q$[{"text":"results:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"results","is_correct":false,"misconception_token":"missing-comma"},{"text":"results,","is_correct":true},{"text":"results;","is_correct":false,"misconception_token":"semicolon-misused"}]$q$::jsonb, $q$results,$q$, $q$When a coordinating conjunction like "so" joins two complete sentences, a comma comes before it: "results, so the team…"$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ae8b2454-4ff6-519a-bfa5-60e5d69e61ae',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'easy',
   $q$______ the results were promising enough to justify a larger follow-up study.$q$, $q$[{"text":"Overall,","is_correct":true},{"text":"Overall","is_correct":false,"misconception_token":"missing-comma"},{"text":"Overall:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"Overall;","is_correct":false,"misconception_token":"semicolon-misused"}]$q$::jsonb, $q$Overall,$q$, $q$An introductory transition word like "Overall" is followed by a comma before the main clause.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('471c955a-9dff-5f13-ba8a-7b5b3ea36573',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'easy',
   $q$How many students actually finished the summer reading list before classes ______$q$, $q$[{"text":"began.","is_correct":false,"misconception_token":"missing-question-mark"},{"text":"began!","is_correct":false,"misconception_token":"exclamation-misuse"},{"text":"began?","is_correct":true},{"text":"began","is_correct":false,"misconception_token":"missing-end-punctuation"}]$q$::jsonb, $q$began?$q$, $q$This sentence asks a direct question, so it ends with a question mark.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('61c27f8c-02d1-50dc-906f-eb867e621ff5',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'easy',
   $q$Ms. ______ our school's new principal, previously taught chemistry for fifteen years.$q$, $q$[{"text":"Alvarez;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"Alvarez","is_correct":false,"misconception_token":"missing-comma"},{"text":"Alvarez,","is_correct":true},{"text":"Alvarez:","is_correct":false,"misconception_token":"colon-needs-complete-clause"}]$q$::jsonb, $q$Alvarez,$q$, $q$The appositive "our school's new principal" renames Ms. Alvarez and is set off with commas, so a comma follows her name.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5c39decc-79d0-56cc-a97f-6f7a5aa9d785',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'medium',
   $q$The trail was much steeper than we ______ we reached the summit just before noon.$q$, $q$[{"text":"expected we","is_correct":false,"misconception_token":"run-on"},{"text":"expected, we","is_correct":false,"misconception_token":"comma-splice"},{"text":"expected; and we","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"expected. We","is_correct":true}]$q$::jsonb, $q$expected. We$q$, $q$These are two complete sentences, so a period separates them. A comma alone is a splice, no mark is a run-on, and a semicolon does not precede "and."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('46047fc3-4b5b-5224-b317-40106750eae6',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'medium',
   $q$The novel that our book club chose this ______ turned out to be a surprising favorite.$q$, $q$[{"text":"month,","is_correct":false,"misconception_token":"comma-splits-subject-verb"},{"text":"month","is_correct":true},{"text":"month:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"month;","is_correct":false,"misconception_token":"semicolon-misused"}]$q$::jsonb, $q$month$q$, $q$Nothing should separate the subject ("The novel that our book club chose this month") from its verb ("turned out"), so no punctuation belongs in the blank.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('945f9586-8f24-52f2-9eff-07c2136967a6',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'medium',
   $q$The old ______ which has guided ships for over a century, will finally be restored this year.$q$, $q$[{"text":"lighthouse:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"lighthouse","is_correct":false,"misconception_token":"missing-comma"},{"text":"lighthouse,","is_correct":true},{"text":"lighthouse;","is_correct":false,"misconception_token":"semicolon-misused"}]$q$::jsonb, $q$lighthouse,$q$, $q$The "which" clause adds nonessential information, so it is set off with commas — a comma opens it after "lighthouse."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('209c70ed-d12e-5e18-834c-8a9c687e0eca',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'medium',
   $q$The one ______ who auditioned last will find out the results tomorrow afternoon.$q$, $q$[{"text":"violinist:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"violinist,","is_correct":false,"misconception_token":"unneeded-restrictive-comma"},{"text":"violinist;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"violinist","is_correct":true}]$q$::jsonb, $q$violinist$q$, $q$The clause "who auditioned last" identifies which violinist and is essential, so it is not set off with a comma.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('06dec812-f439-5964-8d28-5585dcd0a1e7',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'medium',
   $q$The museum extended its evening ______ visitors could now stay until nine o'clock.$q$, $q$[{"text":"hours. Visitors","is_correct":true},{"text":"hours visitors","is_correct":false,"misconception_token":"run-on"},{"text":"hours; and visitors","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"hours, visitors","is_correct":false,"misconception_token":"comma-splice"}]$q$::jsonb, $q$hours. Visitors$q$, $q$Two complete sentences need a period between them. A comma alone is a splice, no mark is a run-on, and a semicolon does not precede "and."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c2778701-97e4-5fa8-92af-56bb382b6323',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'medium',
   $q$The city council reviewed the proposal for several weeks ______ approved it unanimously at the spring meeting.$q$, $q$[{"text":"; and","is_correct":false,"misconception_token":"semicolon-misused"},{"text":". And","is_correct":false,"misconception_token":"period-creates-fragment"},{"text":", and","is_correct":false,"misconception_token":"unnecessary-comma"},{"text":"and","is_correct":true}]$q$::jsonb, $q$and$q$, $q$"Reviewed … and approved" is a compound predicate (two verbs, one subject), so no comma comes before "and."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1bd1dcc1-ddfe-5e4b-ab6d-fc8cc761e9f1',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'hard',
   $q$The first prototype failed three safety ______ the second passed every test on the first try.$q$, $q$[{"text":"checks; the","is_correct":true},{"text":"checks, the","is_correct":false,"misconception_token":"comma-splice"},{"text":"checks: the","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"checks the","is_correct":false,"misconception_token":"run-on"}]$q$::jsonb, $q$checks; the$q$, $q$Two closely related complete sentences can be joined by a semicolon. A comma is a splice, no mark is a run-on, and a colon would wrongly signal that the second part explains the first.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bb32f457-6eb2-59f2-adea-48efa02869cf',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'hard',
   $q$The keynote ______ a leading expert on ocean currents, spoke for nearly an hour without notes.$q$, $q$[{"text":"speaker","is_correct":false,"misconception_token":"missing-comma"},{"text":"speaker—","is_correct":false,"misconception_token":"unpaired-dash"},{"text":"speaker,","is_correct":true},{"text":"speaker;","is_correct":false,"misconception_token":"semicolon-misused"}]$q$::jsonb, $q$speaker,$q$, $q$The appositive "a leading expert on ocean currents" is set off by a pair of commas, so a comma follows "speaker." A lone dash would need a matching dash later.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('336d110b-4c63-57fa-a6d4-149d86150f36',
   null,
   (select id from public.skills where slug = 'punctuation-basics'),
   'standard-english-conventions', 'hard',
   $q$The data looked ______ however, the team wanted an independent lab to confirm the findings.$q$, $q$[{"text":"conclusive;","is_correct":true},{"text":"conclusive","is_correct":false,"misconception_token":"run-on"},{"text":"conclusive:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"conclusive,","is_correct":false,"misconception_token":"comma-splice"}]$q$::jsonb, $q$conclusive;$q$, $q$When "however" joins two complete sentences, a semicolon precedes it. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- grammar-sentence-structure (sentence-structure, standard-english-conventions) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9bc0b2dd-52e1-57ed-8088-c2c3dbc2a4fe',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'easy',
   $q$The bakery on the corner, famous for its cinnamon ______ every morning at sunrise.$q$, $q$[{"text":"rolls, to open","is_correct":false,"misconception_token":"used-infinitive"},{"text":"rolls, opens","is_correct":true},{"text":"rolls, opening","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"rolls, which opens","is_correct":false,"misconception_token":"creates-a-fragment"}]$q$::jsonb, $q$rolls, opens$q$, $q$The sentence needs a main verb for its subject "The bakery," so "opens" completes it. The other options leave a fragment.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('da029a68-3eaf-5c9e-b7db-1018e546cae3',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'easy',
   $q$Although the early results looked promising, the research team ______ several more rounds of testing before publishing.$q$, $q$[{"text":"conducted","is_correct":true},{"text":"to conduct","is_correct":false,"misconception_token":"used-infinitive"},{"text":"conducting","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"which conducted","is_correct":false,"misconception_token":"creates-a-fragment"}]$q$::jsonb, $q$conducted$q$, $q$The main clause needs a complete verb ("conducted"). The "-ing," "to," and "which" versions leave the sentence unfinished.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4ecad63e-c6a1-5d39-97e2-b7310f37e430',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'medium',
   $q$The storm knocked out power across the ______ crews worked through the night to restore it.$q$, $q$[{"text":"county the","is_correct":false,"misconception_token":"run-on"},{"text":"county; the","is_correct":true},{"text":"county and the","is_correct":false,"misconception_token":"missing-comma"},{"text":"county, the","is_correct":false,"misconception_token":"comma-splice"}]$q$::jsonb, $q$county; the$q$, $q$Two complete sentences can be joined by a semicolon. A comma alone is a splice, no punctuation is a run-on, and joining with "and" would need a comma before it.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9cb08940-624f-5aa8-8d87-ea1fb767d81a',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'medium',
   $q$The recipe called for fresh ______ we substituted dried ones, and the dish still turned out well.$q$, $q$[{"text":"herbs, but","is_correct":true},{"text":"herbs, we","is_correct":false,"misconception_token":"comma-splice"},{"text":"herbs we","is_correct":false,"misconception_token":"run-on"},{"text":"herbs; but","is_correct":false,"misconception_token":"semicolon-misused"}]$q$::jsonb, $q$herbs, but$q$, $q$A comma plus a joining word like "but" links two complete sentences. A comma alone splices them, no punctuation runs them together, and a semicolon does not go before "but."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('edfd26b3-153f-53bd-aebd-067ed8e8ae82',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'hard',
   $q$The prototype passed every safety ______ however, the engineers wanted one more round of tests.$q$, $q$[{"text":"test,","is_correct":false,"misconception_token":"comma-splice"},{"text":"test:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"test","is_correct":false,"misconception_token":"run-on"},{"text":"test;","is_correct":true}]$q$::jsonb, $q$test;$q$, $q$When "however" joins two complete sentences, a semicolon comes before it. A comma there is a splice, no mark is a run-on, and a colon does not fit between two complete clauses like this.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d2b48800-d6be-5f58-8afc-ef988d36ba23',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'easy',
   $q$The ferry was delayed by dense ______ passengers waited patiently on the dock for over an hour.$q$, $q$[{"text":"fog; and","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"fog","is_correct":false,"misconception_token":"run-on"},{"text":"fog,","is_correct":false,"misconception_token":"comma-splice"},{"text":"fog, so","is_correct":true}]$q$::jsonb, $q$fog, so$q$, $q$A comma plus a coordinating conjunction ("so") joins two complete sentences. A comma alone is a splice, no punctuation is a run-on, and a semicolon does not precede "and."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f7d467ae-5133-5dab-924f-a4db7c4b6a1a',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'easy',
   $q$The old lantern hanging above the workshop bench ______ a warm glow over the cluttered table.$q$, $q$[{"text":"to cast","is_correct":false,"misconception_token":"used-infinitive"},{"text":"casting","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"casts","is_correct":true},{"text":"which casts","is_correct":false,"misconception_token":"creates-a-fragment"}]$q$::jsonb, $q$casts$q$, $q$The subject "lantern" needs a complete main verb, "casts." The "-ing," "to," and "which" forms leave the sentence a fragment.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('625314c5-5b90-53b1-a6bc-620e641ec208',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'easy',
   $q$The first act of the play was slow and ______ the second act won the audience over completely.$q$, $q$[{"text":"quiet: the","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"quiet, the","is_correct":false,"misconception_token":"comma-splice"},{"text":"quiet; the","is_correct":true},{"text":"quiet the","is_correct":false,"misconception_token":"run-on"}]$q$::jsonb, $q$quiet; the$q$, $q$Two complete sentences can be joined by a semicolon. A comma alone splices them, no mark runs them together, and a colon does not join two independent clauses like this.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d99b926b-4789-5573-aa27-cc683acacc2f',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'easy',
   $q$The community garden, a plot that neighbors started five years ______ dozens of families every summer.$q$, $q$[{"text":"ago, feeds","is_correct":true},{"text":"ago, feeding","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"ago, which feeds","is_correct":false,"misconception_token":"creates-a-fragment"},{"text":"ago, to feed","is_correct":false,"misconception_token":"used-infinitive"}]$q$::jsonb, $q$ago, feeds$q$, $q$The subject "garden" needs a main verb ("feeds"). The "-ing," "to," and "which" versions leave the sentence unfinished.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5ffee2b8-36cc-5616-a374-ba46069ed092',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'easy',
   $q$After weeks of intense rehearsal, ______ the entire symphony from memory at the winter concert.$q$, $q$[{"text":"performing","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"the orchestra performing","is_correct":false,"misconception_token":"creates-a-fragment"},{"text":"the orchestra performed","is_correct":true},{"text":"to perform","is_correct":false,"misconception_token":"used-infinitive"}]$q$::jsonb, $q$the orchestra performed$q$, $q$The main clause needs a subject and a complete verb: "the orchestra performed." The "-ing" and "to" forms leave only a fragment.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5281e181-a5ce-5b63-b37d-ff23f3f950f0',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'easy',
   $q$The scholarship, established by a former ______ covers tuition for two students each year.$q$, $q$[{"text":"graduate, which covers","is_correct":false,"misconception_token":"creates-a-fragment"},{"text":"graduate, covering","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"graduate, covers","is_correct":true},{"text":"graduate, to cover","is_correct":false,"misconception_token":"used-infinitive"}]$q$::jsonb, $q$graduate, covers$q$, $q$The subject "scholarship" needs a main verb ("covers"). The "-ing," "which," and "to" forms leave the sentence a fragment.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('576a94f0-62b2-595e-869d-084a405d500c',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'medium',
   $q$The bridge's original design proved too ______ engineers spent another year revising the plans.$q$, $q$[{"text":"costly engineers","is_correct":false,"misconception_token":"run-on"},{"text":"costly, engineers","is_correct":false,"misconception_token":"comma-splice"},{"text":"costly; and engineers","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"costly. Engineers","is_correct":true}]$q$::jsonb, $q$costly. Engineers$q$, $q$These are two complete sentences, so a period separates them. A comma alone is a splice, no mark is a run-on, and a semicolon does not precede "and."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4866bbdb-6c9f-5c5e-9ab4-60a605b24446',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'medium',
   $q$The new filing system saved the office countless ______ moreover, it eliminated most billing errors.$q$, $q$[{"text":"hours,","is_correct":false,"misconception_token":"comma-splice"},{"text":"hours;","is_correct":true},{"text":"hours:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"hours","is_correct":false,"misconception_token":"run-on"}]$q$::jsonb, $q$hours;$q$, $q$When "moreover" joins two complete sentences, a semicolon comes before it. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('177c15ed-2a3d-5eeb-9e9d-463364bd762c',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'medium',
   $q$The proposal to convert the old rail line into a public ______ under review by three separate committees.$q$, $q$[{"text":"trail to remain","is_correct":false,"misconception_token":"used-infinitive"},{"text":"trail, remaining","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"trail remains","is_correct":true},{"text":"trail, which remains","is_correct":false,"misconception_token":"creates-a-fragment"}]$q$::jsonb, $q$trail remains$q$, $q$The subject "proposal" needs a complete verb: "remains." "Remaining," "which remains," and "to remain" each leave a fragment.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6370608a-b0a4-5e0b-b093-e34b740d4a86',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'medium',
   $q$The volunteers had underestimated the size of the ______ they returned the next morning with more supplies.$q$, $q$[{"text":"cleanup; and they","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"cleanup, they","is_correct":false,"misconception_token":"comma-splice"},{"text":"cleanup they","is_correct":false,"misconception_token":"run-on"},{"text":"cleanup. They","is_correct":true}]$q$::jsonb, $q$cleanup. They$q$, $q$Two complete sentences take a period. A comma alone is a splice, no mark is a run-on, and a semicolon does not precede "and."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f835621d-2aa6-5d40-a9f4-e5f63e4bca41',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'medium',
   $q$The design team missed the first ______ but they delivered a far stronger concept a week later.$q$, $q$[{"text":"deadline,","is_correct":true},{"text":"deadline;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"deadline:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"deadline","is_correct":false,"misconception_token":"missing-comma"}]$q$::jsonb, $q$deadline,$q$, $q$Two complete sentences joined by "but" take a comma before the conjunction. No comma runs them together, and a semicolon or colon does not precede a coordinating conjunction like "but."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cb06c0c6-d117-5375-bfa7-9f3fc3258de0',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'medium',
   $q$Although the prototype worked in the ______ it failed repeatedly under real-world conditions.$q$, $q$[{"text":"lab;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"lab. It","is_correct":false,"misconception_token":"period-creates-fragment"},{"text":"lab","is_correct":false,"misconception_token":"missing-comma"},{"text":"lab,","is_correct":true}]$q$::jsonb, $q$lab,$q$, $q$An introductory subordinate clause ("Although the prototype worked in the lab") is followed by a comma. A period leaves that clause a fragment, and a semicolon does not follow a dependent clause here.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3dced9af-0c6d-5764-97a4-a72b1910a401',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'hard',
   $q$The committee's decision to delay the vote until the following ______ many residents who had planned to speak.$q$, $q$[{"text":"week frustrated","is_correct":true},{"text":"week, frustrating","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"week, to frustrate","is_correct":false,"misconception_token":"used-infinitive"},{"text":"week, which frustrated","is_correct":false,"misconception_token":"creates-a-fragment"}]$q$::jsonb, $q$week frustrated$q$, $q$The subject "decision" needs a main verb: "frustrated." The "-ing," "which," and "to" forms leave the long sentence a fragment.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fb8256ba-68db-523e-a01f-c7dc41ce7846',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'hard',
   $q$The novel's plot was intricate and its characters richly ______ still, some readers found the ending abrupt.$q$, $q$[{"text":"drawn,","is_correct":false,"misconception_token":"comma-splice"},{"text":"drawn","is_correct":false,"misconception_token":"run-on"},{"text":"drawn;","is_correct":true},{"text":"drawn:","is_correct":false,"misconception_token":"colon-needs-complete-clause"}]$q$::jsonb, $q$drawn;$q$, $q$When the transition "still" joins two complete sentences, a semicolon comes before it. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9739b270-cd48-52dc-9a8d-d67c9e2a1567',
   null,
   (select id from public.skills where slug = 'sentence-structure'),
   'standard-english-conventions', 'hard',
   $q$The research grant covered the equipment and travel ______ it did not include funding for a full-time assistant.$q$, $q$[{"text":"costs, but","is_correct":true},{"text":"costs, it","is_correct":false,"misconception_token":"comma-splice"},{"text":"costs; but","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"costs but","is_correct":false,"misconception_token":"missing-comma"}]$q$::jsonb, $q$costs, but$q$, $q$Two complete sentences joined by "but" take a comma before the conjunction: "costs, but it did not…" Dropping the comma runs them together, a comma without the conjunction splices them, and a semicolon does not precede "but."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- grammar-pronoun-agreement (pronoun-agreement, standard-english-conventions) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('95810da0-ee65-53f0-b05a-e61603e13604',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'medium',
   $q$The flock of geese circled the pond twice before ______ settled onto the water for the night.$q$, $q$[{"text":"those","is_correct":false,"misconception_token":"wrong-pronoun-type"},{"text":"it","is_correct":true},{"text":"they","is_correct":false,"misconception_token":"pronoun-matches-nearby-noun"},{"text":"them","is_correct":false,"misconception_token":"wrong-pronoun-case"}]$q$::jsonb, $q$it$q$, $q$The pronoun replaces the singular "flock," so it is "it." "They" wrongly matches the nearby "geese"; "them" is an object pronoun; "those" is a demonstrative.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7ef19fd1-cad2-559a-854f-f8bca6ead641',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'medium',
   $q$The prize for the science fair was shared between Maria and ______ after the two of us finished the project together.$q$, $q$[{"text":"me","is_correct":true},{"text":"myself","is_correct":false,"misconception_token":"reflexive-misuse"},{"text":"I","is_correct":false,"misconception_token":"wrong-pronoun-case"},{"text":"mine","is_correct":false,"misconception_token":"wrong-pronoun-type"}]$q$::jsonb, $q$me$q$, $q$After the preposition "between," use the object pronoun "me." "I" is a subject pronoun, "myself" is reflexive, and "mine" is possessive.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6a880dc8-27d9-5712-82e0-08e06abd9b35',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'hard',
   $q$The scientist ______ the committee selected for the grant had studied glaciers for over a decade.$q$, $q$[{"text":"which","is_correct":false,"misconception_token":"which-for-person"},{"text":"whom","is_correct":true},{"text":"what","is_correct":false,"misconception_token":"wrong-pronoun-type"},{"text":"who","is_correct":false,"misconception_token":"wrong-pronoun-case"}]$q$::jsonb, $q$whom$q$, $q$"The committee selected [whom]" — the pronoun is the object of "selected," so "whom" is correct. "Who" is a subject pronoun, and "which"/"what" don't refer to a person.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5138dd35-6678-5d71-8666-4f1a78aa6e2d',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'easy',
   $q$The novelist Jane Ellery revised ______ manuscript three times before finally submitting it.$q$, $q$[{"text":"her","is_correct":true},{"text":"their","is_correct":false,"misconception_token":"pronoun-number-mismatch"},{"text":"they're","is_correct":false,"misconception_token":"contraction-for-possessive"},{"text":"there","is_correct":false,"misconception_token":"wrong-word-homophone"}]$q$::jsonb, $q$her$q$, $q$The antecedent "Jane Ellery" is singular, so the possessive is "her." "Their" is plural, "they're" means "they are," and "there" is a place word.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e842235b-05fe-5ae4-acaf-84cbd3c84339',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'easy',
   $q$The research assistants submitted ______ findings to the lead scientist at the end of each week.$q$, $q$[{"text":"its","is_correct":false,"misconception_token":"pronoun-number-mismatch"},{"text":"there","is_correct":false,"misconception_token":"wrong-word-homophone"},{"text":"they're","is_correct":false,"misconception_token":"contraction-for-possessive"},{"text":"their","is_correct":true}]$q$::jsonb, $q$their$q$, $q$The antecedent "assistants" is plural, so the possessive is "their." "Its" is singular, "they're" means "they are," and "there" is a place word.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('da32826a-76f1-5ae8-bff6-79f8c0d046a6',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'easy',
   $q$The startup celebrated ______ first profitable quarter with a small party for the whole staff.$q$, $q$[{"text":"there","is_correct":false,"misconception_token":"wrong-word-homophone"},{"text":"it's","is_correct":false,"misconception_token":"contraction-for-possessive"},{"text":"their","is_correct":false,"misconception_token":"pronoun-number-mismatch"},{"text":"its","is_correct":true}]$q$::jsonb, $q$its$q$, $q$The antecedent "startup" is singular, so the possessive is "its." "Their" is plural, "it's" means "it is," and "there" is a place word.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9920a578-5a38-53d3-a7e3-e1764de9e731',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'easy',
   $q$______ and the other interns organized the entire fundraiser in under a week.$q$, $q$[{"text":"Herself","is_correct":false,"misconception_token":"reflexive-misuse"},{"text":"Her","is_correct":false,"misconception_token":"wrong-pronoun-case"},{"text":"She","is_correct":true},{"text":"Hers","is_correct":false,"misconception_token":"wrong-pronoun-type"}]$q$::jsonb, $q$She$q$, $q$As part of the subject ("She and the other interns"), use the subject pronoun "She," not "Her," "Herself," or "Hers."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1a2158a3-c5d7-5bf9-ad93-884e026f45cf',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'easy',
   $q$The teachers submitted ______ grade reports before leaving for winter break.$q$, $q$[{"text":"its","is_correct":false,"misconception_token":"pronoun-number-mismatch"},{"text":"there","is_correct":false,"misconception_token":"wrong-word-homophone"},{"text":"their","is_correct":true},{"text":"they're","is_correct":false,"misconception_token":"contraction-for-possessive"}]$q$::jsonb, $q$their$q$, $q$The antecedent "teachers" is plural, so the possessive is "their." "There" is a place, "they're" means "they are," and "its" is singular.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('532668ea-cd85-5ce2-9e0c-618aebd833b2',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'easy',
   $q$After finishing the marathon, the runners treated ______ to a well-earned meal.$q$, $q$[{"text":"themselves","is_correct":true},{"text":"theirselves","is_correct":false,"misconception_token":"wrong-pronoun-type"},{"text":"themself","is_correct":false,"misconception_token":"pronoun-number-mismatch"},{"text":"them","is_correct":false,"misconception_token":"wrong-pronoun-case"}]$q$::jsonb, $q$themselves$q$, $q$The subject "runners" acts on itself, so use the reflexive "themselves." "Theirselves" is nonstandard, "them" is an object pronoun, and "themself" is singular.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a490f72f-9162-5f9d-9b15-c17468c50831',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'easy',
   $q$The scientist ______ discovered the new enzyme will present the findings at the conference.$q$, $q$[{"text":"whom","is_correct":false,"misconception_token":"wrong-pronoun-case"},{"text":"which","is_correct":false,"misconception_token":"which-for-person"},{"text":"who","is_correct":true},{"text":"whose","is_correct":false,"misconception_token":"wrong-pronoun-type"}]$q$::jsonb, $q$who$q$, $q$"Who" is the subject of "discovered," so it is correct. "Whom" is an object form, "whose" shows possession, and "which" is for things, not people.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cebf3e93-5ae7-50b1-aaec-6f13f91eeb57',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'easy',
   $q$The audience rose to ______ feet as the final notes of the symphony faded.$q$, $q$[{"text":"it's","is_correct":false,"misconception_token":"contraction-for-possessive"},{"text":"their","is_correct":false,"misconception_token":"pronoun-number-mismatch"},{"text":"its","is_correct":true},{"text":"there","is_correct":false,"misconception_token":"wrong-word-homophone"}]$q$::jsonb, $q$its$q$, $q$"Audience" acting as one unit is singular, so "its." "Their" is plural, "it's" means "it is," and "there" is a place word.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2c0f9b4f-abd1-5e8b-93de-3dd9d25227ba',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'medium',
   $q$The mentor ______ the students admired most had once been a struggling student herself.$q$, $q$[{"text":"which","is_correct":false,"misconception_token":"which-for-person"},{"text":"who","is_correct":false,"misconception_token":"wrong-pronoun-case"},{"text":"whose","is_correct":false,"misconception_token":"wrong-pronoun-type"},{"text":"whom","is_correct":true}]$q$::jsonb, $q$whom$q$, $q$"The students admired [whom]" — the pronoun is the object of "admired," so "whom." "Who" is a subject form, "which" is for things, and "whose" shows possession.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('06b46920-59ee-5090-8378-2772f17e7fc1',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'medium',
   $q$When Priya set her phone on the glass table, ______ cracked right down the middle.$q$, $q$[{"text":"it","is_correct":false,"misconception_token":"vague-pronoun-reference"},{"text":"the table","is_correct":true},{"text":"them","is_correct":false,"misconception_token":"wrong-pronoun-case"},{"text":"they","is_correct":false,"misconception_token":"pronoun-number-mismatch"}]$q$::jsonb, $q$the table$q$, $q$"It" could mean the phone or the table, so naming "the table" keeps the reference clear. "They" and "them" are plural and match neither singular noun.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0bc0ef12-a80a-5f45-80be-7c71fda4f690',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'medium',
   $q$The nonprofit that runs the shelter recently expanded ______ services to two neighboring towns.$q$, $q$[{"text":"whose","is_correct":false,"misconception_token":"wrong-pronoun-type"},{"text":"their","is_correct":false,"misconception_token":"pronoun-number-mismatch"},{"text":"its","is_correct":true},{"text":"it's","is_correct":false,"misconception_token":"contraction-for-possessive"}]$q$::jsonb, $q$its$q$, $q$The antecedent "nonprofit" is singular, so "its." "Their" is plural, "it's" means "it is," and "whose" is a relative pronoun, not the possessive needed here.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('30776636-c7f1-5a5a-9373-fda8bc23213c',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'medium',
   $q$My younger brother finished the puzzle much faster than ______ did.$q$, $q$[{"text":"mine","is_correct":false,"misconception_token":"wrong-pronoun-type"},{"text":"me","is_correct":false,"misconception_token":"wrong-pronoun-case"},{"text":"myself","is_correct":false,"misconception_token":"reflexive-misuse"},{"text":"I","is_correct":true}]$q$::jsonb, $q$I$q$, $q$The comparison completes as "faster than I did," so the subject pronoun "I" is correct. "Me" is an object form, "myself" is reflexive, and "mine" is possessive.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('347b697b-5012-565f-8824-63d8079ebaa2',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'medium',
   $q$The award for best design went to ______ students who had stayed late every night.$q$, $q$[{"text":"us","is_correct":true},{"text":"ourselves","is_correct":false,"misconception_token":"reflexive-misuse"},{"text":"our","is_correct":false,"misconception_token":"wrong-pronoun-type"},{"text":"we","is_correct":false,"misconception_token":"wrong-pronoun-case"}]$q$::jsonb, $q$us$q$, $q$"To us students" — after the preposition "to," use the object pronoun "us." "We" is a subject form, "ourselves" is reflexive, and "our" is possessive.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('913f3284-2084-50e4-b0b3-8c58a9d70336',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'medium',
   $q$The library lends tablets to students who forget ______ own devices at home.$q$, $q$[{"text":"they're","is_correct":false,"misconception_token":"contraction-for-possessive"},{"text":"his","is_correct":false,"misconception_token":"pronoun-number-mismatch"},{"text":"there","is_correct":false,"misconception_token":"wrong-word-homophone"},{"text":"their","is_correct":true}]$q$::jsonb, $q$their$q$, $q$The antecedent "students" is plural, so "their." "There" is a place, "they're" means "they are," and "his" is singular.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('701190bb-2e87-5334-acd4-0e97db19198b',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'hard',
   $q$The novelist ______ the critics had once dismissed became the most celebrated writer of her generation.$q$, $q$[{"text":"whom","is_correct":true},{"text":"who","is_correct":false,"misconception_token":"wrong-pronoun-case"},{"text":"what","is_correct":false,"misconception_token":"wrong-pronoun-type"},{"text":"which","is_correct":false,"misconception_token":"which-for-person"}]$q$::jsonb, $q$whom$q$, $q$"The critics had once dismissed [whom]" — object of "dismissed," so "whom." "Who" is a subject form, "which" is for things, and "what" does not refer to a person.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('14950c2a-d8b0-5936-a2f7-f20f785ebdcc',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'hard',
   $q$It was ______ who first noticed that the two data sets did not match.$q$, $q$[{"text":"us","is_correct":false,"misconception_token":"wrong-pronoun-case"},{"text":"ourselves","is_correct":false,"misconception_token":"reflexive-misuse"},{"text":"we","is_correct":true},{"text":"our","is_correct":false,"misconception_token":"wrong-pronoun-type"}]$q$::jsonb, $q$we$q$, $q$After the linking verb "was," a predicate pronoun takes the subject form: "It was we who noticed." "Us" is an object form, "ourselves" is reflexive, and "our" is possessive.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c9674cd2-21ec-5510-bc51-3af73293b539',
   null,
   (select id from public.skills where slug = 'pronoun-agreement'),
   'standard-english-conventions', 'hard',
   $q$The manager told the analyst that ______ needed to revise the forecast before noon.$q$, $q$[{"text":"the analyst","is_correct":true},{"text":"they","is_correct":false,"misconception_token":"pronoun-number-mismatch"},{"text":"her","is_correct":false,"misconception_token":"wrong-pronoun-case"},{"text":"she","is_correct":false,"misconception_token":"vague-pronoun-reference"}]$q$::jsonb, $q$the analyst$q$, $q$"She" could mean the manager or the analyst, so naming "the analyst" makes the reference clear. "They" is plural, and "her" is an object pronoun that cannot be the subject.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- grammar-verb-tense-and-form (verb-tense-and-form, standard-english-conventions) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ef4acb59-5e71-518f-ba18-75ae22bf907a',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'easy',
   $q$Last summer, the interns organized the archive and ______ hundreds of fragile documents.$q$, $q$[{"text":"scanning","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"scanned","is_correct":true},{"text":"scan","is_correct":false,"misconception_token":"wrong-tense-for-context"},{"text":"will scan","is_correct":false,"misconception_token":"verb-tense-shift"}]$q$::jsonb, $q$scanned$q$, $q$"Last summer … organized" sets the past tense, so the paired verb is "scanned." Present or future would shift the tense, and "-ing" is not a complete verb.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('613c22dd-161a-5361-a2f4-338714f7a695',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'medium',
   $q$By the time the fire alarm sounded, the technicians had already ______ the building.$q$, $q$[{"text":"left","is_correct":true},{"text":"leave","is_correct":false,"misconception_token":"wrong-tense-for-context"},{"text":"leaved","is_correct":false,"misconception_token":"wrong-past-participle"},{"text":"leaving","is_correct":false,"misconception_token":"nonfinite-verb"}]$q$::jsonb, $q$left$q$, $q$After "had," use the past participle "left." "Leaved" is not a real form, "leave" is present, and "leaving" is not a complete verb.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ed52975d-334c-53b5-836b-62de78756ba9',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'medium',
   $q$The hikers had ______ nearly ten miles before they realized they'd taken a wrong turn.$q$, $q$[{"text":"go","is_correct":false,"misconception_token":"wrong-tense-for-context"},{"text":"gone","is_correct":true},{"text":"going","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"went","is_correct":false,"misconception_token":"wrong-past-participle"}]$q$::jsonb, $q$gone$q$, $q$After "had," the past participle is "gone," not "went." "Go" is present, and "going" is not a complete verb.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('df4c7ce7-bfed-576b-8680-bbf817fc3635',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'easy',
   $q$The museum opens at nine each morning and ______ its doors at five in the evening.$q$, $q$[{"text":"closes","is_correct":true},{"text":"closed","is_correct":false,"misconception_token":"verb-tense-shift"},{"text":"closing","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"to close","is_correct":false,"misconception_token":"used-infinitive"}]$q$::jsonb, $q$closes$q$, $q$The verb should match the present-tense "opens," so it is "closes." "Closed" shifts to the past, and the other forms are not complete verbs.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('13a24bbe-9a0d-5e8e-838c-7d4f584484e3',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'hard',
   $q$The company ______ its profits every year since it launched its new product line.$q$, $q$[{"text":"increased","is_correct":false,"misconception_token":"wrong-tense-for-context"},{"text":"increasing","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"will increase","is_correct":false,"misconception_token":"verb-tense-shift"},{"text":"has increased","is_correct":true}]$q$::jsonb, $q$has increased$q$, $q$"Since it launched …" describes an action continuing into the present, so the present perfect "has increased" fits. Simple past or future does not, and "-ing" is not a complete verb.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('74438e55-4c74-53e4-b982-b84b4e92348a',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'easy',
   $q$Yesterday the crew loaded the truck and ______ the equipment to the new site.$q$, $q$[{"text":"driving","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"will drive","is_correct":false,"misconception_token":"verb-tense-shift"},{"text":"drives","is_correct":false,"misconception_token":"wrong-tense-for-context"},{"text":"drove","is_correct":true}]$q$::jsonb, $q$drove$q$, $q$"Yesterday … loaded" sets the past tense, so the paired verb is "drove." Present or future would shift the tense, and "-ing" is not a complete verb.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1a3d3130-a3df-53cf-94e1-c6c34a4666cf',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'easy',
   $q$The children have ______ the same song at every rehearsal this month.$q$, $q$[{"text":"sing","is_correct":false,"misconception_token":"wrong-tense-for-context"},{"text":"sang","is_correct":false,"misconception_token":"wrong-past-participle"},{"text":"sung","is_correct":true},{"text":"singing","is_correct":false,"misconception_token":"nonfinite-verb"}]$q$::jsonb, $q$sung$q$, $q$After "have," use the past participle "sung," not the simple past "sang." "Sing" is present, and "singing" is not a complete verb.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2d9b0cb1-0816-5ed9-b12e-ef0aa955232d',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'easy',
   $q$The café roasts its beans every morning and ______ them fresh throughout the day.$q$, $q$[{"text":"to sell","is_correct":false,"misconception_token":"used-infinitive"},{"text":"sold","is_correct":false,"misconception_token":"verb-tense-shift"},{"text":"sells","is_correct":true},{"text":"selling","is_correct":false,"misconception_token":"nonfinite-verb"}]$q$::jsonb, $q$sells$q$, $q$The verb should match the present-tense "roasts," so "sells." "Sold" shifts to the past, and the other forms are not complete verbs.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('458eed65-82e7-5205-8285-e5264df773c3',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'easy',
   $q$During the storm last night, a large branch ______ onto the roof of the shed.$q$, $q$[{"text":"fell","is_correct":true},{"text":"falled","is_correct":false,"misconception_token":"nonstandard-past-tense"},{"text":"falling","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"falls","is_correct":false,"misconception_token":"wrong-tense-for-context"}]$q$::jsonb, $q$fell$q$, $q$The standard past tense of "fall" is "fell," not "falled." "Falls" is present, and "falling" is not a complete verb.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7bc3d71a-da41-5438-b36d-e3cf60ebfbac',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'easy',
   $q$The volunteers will sort the donations tomorrow and ______ them to the shelter by evening.$q$, $q$[{"text":"delivered","is_correct":false,"misconception_token":"verb-tense-shift"},{"text":"delivering","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"deliver","is_correct":true},{"text":"to deliver","is_correct":false,"misconception_token":"used-infinitive"}]$q$::jsonb, $q$deliver$q$, $q$Paired with "will sort," the second verb stays in the future: "will … deliver." The past and non-finite forms do not fit.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8bb5e27b-89d0-5b4e-9842-705a3d27ec80',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'easy',
   $q$By the time we arrived, the lake had completely ______ over.$q$, $q$[{"text":"freezed","is_correct":false,"misconception_token":"nonstandard-past-tense"},{"text":"froze","is_correct":false,"misconception_token":"wrong-past-participle"},{"text":"frozen","is_correct":true},{"text":"freezing","is_correct":false,"misconception_token":"nonfinite-verb"}]$q$::jsonb, $q$frozen$q$, $q$After "had," use the past participle "frozen." "Froze" is the simple past, "freezed" is not a real form, and "freezing" is not a complete verb.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4b18365b-b602-5ec6-85d2-cf3abd5ad683',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'medium',
   $q$Scientists ______ this species only twice since the survey began a decade ago.$q$, $q$[{"text":"will observe","is_correct":false,"misconception_token":"verb-tense-shift"},{"text":"observed","is_correct":false,"misconception_token":"wrong-tense-for-context"},{"text":"observing","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"have observed","is_correct":true}]$q$::jsonb, $q$have observed$q$, $q$"Since … began" points to a span reaching the present, so the present perfect "have observed" fits. Simple past or future does not, and "-ing" is not a complete verb.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b76b94f9-3df5-54b3-a021-daac6d8e4576',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'medium',
   $q$By the time the guests arrived, the caterers had already ______ every table in the hall.$q$, $q$[{"text":"sat","is_correct":false,"misconception_token":"wrong-past-participle"},{"text":"set","is_correct":true},{"text":"setting","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"setted","is_correct":false,"misconception_token":"nonstandard-past-tense"}]$q$::jsonb, $q$set$q$, $q$After "had already," use the past participle "set" (its form does not change). "Sat" is the wrong verb, "setted" is not a word, and "setting" is not a complete verb.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c8c28b22-4402-5b37-beab-5b4ab38253a3',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'medium',
   $q$The documentary explains how the glacier formed and how it slowly ______ over thousands of years.$q$, $q$[{"text":"retreating","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"retreats","is_correct":false,"misconception_token":"verb-tense-shift"},{"text":"retreated","is_correct":true},{"text":"will retreat","is_correct":false,"misconception_token":"wrong-tense-for-context"}]$q$::jsonb, $q$retreated$q$, $q$Parallel with "formed," the second verb is the past "retreated." Shifting to present or future breaks the sequence, and "-ing" is not a complete verb.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ddfad2e7-eb6f-5a40-a7b8-11f77f4d1bae',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'medium',
   $q$The engineers promised that they ______ the bridge before the rainy season arrived.$q$, $q$[{"text":"finishing","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"will finish","is_correct":false,"misconception_token":"wrong-tense-for-context"},{"text":"finished","is_correct":false,"misconception_token":"verb-tense-shift"},{"text":"would finish","is_correct":true}]$q$::jsonb, $q$would finish$q$, $q$After the past "promised," the future-in-the-past "would finish" matches. "Will finish" clashes with the past frame, "finished" misstates the sequence, and "-ing" is not complete.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1b0bc804-abe2-5184-92a4-02d5b7fbafb0',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'medium',
   $q$The old ledgers had ______ untouched in the archive for nearly fifty years.$q$, $q$[{"text":"lain","is_correct":true},{"text":"lay","is_correct":false,"misconception_token":"wrong-tense-for-context"},{"text":"laying","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"laid","is_correct":false,"misconception_token":"wrong-past-participle"}]$q$::jsonb, $q$lain$q$, $q$"Lie" (to rest) has the participle "lain," so "had lain." "Laid" is from "lay" (to place), "lay" is the simple past, and "laying" is not a complete verb.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6e8520b7-c9bc-59fb-9fc9-ebc9ff94651f',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'medium',
   $q$The two companies ______ on the project since the previous spring.$q$, $q$[{"text":"collaborate","is_correct":false,"misconception_token":"verb-tense-shift"},{"text":"collaborating","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"collaborated","is_correct":false,"misconception_token":"wrong-tense-for-context"},{"text":"have collaborated","is_correct":true}]$q$::jsonb, $q$have collaborated$q$, $q$"Since the previous spring" signals an action continuing to now, so the present perfect "have collaborated." Simple past or present does not fit, and "-ing" is not complete.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1d7e8ae7-598e-5563-9d74-1d18e0cf30f4',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'hard',
   $q$If the museum ______ open on Mondays, far more school groups could visit during the week.$q$, $q$[{"text":"were","is_correct":true},{"text":"was","is_correct":false,"misconception_token":"subjunctive-error"},{"text":"being","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"is","is_correct":false,"misconception_token":"wrong-tense-for-context"}]$q$::jsonb, $q$were$q$, $q$A hypothetical "if" clause uses the subjunctive "were," not "was." "Is" is the wrong tense for a hypothetical, and "being" is not a complete verb.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bde03b11-ed07-515a-a0b7-ce5fbf514457',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'hard',
   $q$By the end of the ceremony, the old bell had ______ twelve times across the valley.$q$, $q$[{"text":"rang","is_correct":false,"misconception_token":"wrong-past-participle"},{"text":"ringed","is_correct":false,"misconception_token":"nonstandard-past-tense"},{"text":"rung","is_correct":true},{"text":"ringing","is_correct":false,"misconception_token":"nonfinite-verb"}]$q$::jsonb, $q$rung$q$, $q$After "had," use the participle "rung," not the simple past "rang." "Ringed" is not the right form, and "ringing" is not a complete verb.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5c556240-9f4c-5714-b5a0-ddae170a7200',
   null,
   (select id from public.skills where slug = 'verb-tense-and-form'),
   'standard-english-conventions', 'hard',
   $q$The report noted that enrollment had risen sharply in the fall and ______ steady ever since.$q$, $q$[{"text":"had remained","is_correct":true},{"text":"remains","is_correct":false,"misconception_token":"verb-tense-shift"},{"text":"remaining","is_correct":false,"misconception_token":"nonfinite-verb"},{"text":"remained","is_correct":false,"misconception_token":"wrong-tense-for-context"}]$q$::jsonb, $q$had remained$q$, $q$Parallel with "had risen," the verb is "had remained." Dropping to simple past or shifting to present breaks the sequence, and "-ing" is not complete.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- grammar-advanced-punctuation (advanced-punctuation, standard-english-conventions) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d3531a97-145f-5b7d-a551-a4b142ca7546',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'medium',
   $q$The kit contains everything a beginning painter ______ a set of brushes, three colors of paint, and a small canvas.$q$, $q$[{"text":"needs","is_correct":false,"misconception_token":"missing-colon"},{"text":"needs:","is_correct":true},{"text":"needs,","is_correct":false,"misconception_token":"comma-where-colon-needed"},{"text":"needs;","is_correct":false,"misconception_token":"semicolon-misused"}]$q$::jsonb, $q$needs:$q$, $q$A colon introduces a list after a complete clause ("everything a beginning painter needs"). A comma or semicolon can't introduce the list, and it can't run in with no mark.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a13ea13e-c70c-5098-a1b6-df4058e304ca',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'medium',
   $q$The lead ______ a marine biologist with two decades of experience, presented the team's findings to the board.$q$, $q$[{"text":"researcher,","is_correct":true},{"text":"researcher;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"researcher—","is_correct":false,"misconception_token":"unpaired-dash"},{"text":"researcher:","is_correct":false,"misconception_token":"colon-needs-complete-clause"}]$q$::jsonb, $q$researcher,$q$, $q$The aside closes with a comma, so it must open with a comma to match. A lone dash would need a second dash, and a semicolon/colon does not belong here.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('04c0a861-edc2-5e1c-b404-41053270251b',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'medium',
   $q$The conference featured speakers from Paris, ______ London, England; and Tokyo, Japan.$q$, $q$[{"text":"France.","is_correct":false,"misconception_token":"period-creates-fragment"},{"text":"France;","is_correct":true},{"text":"France:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"France,","is_correct":false,"misconception_token":"comma-in-complex-list"}]$q$::jsonb, $q$France;$q$, $q$When list items already contain commas ("Paris, France"), semicolons separate the items so the list stays clear. A comma would blur them, a period breaks the sentence, and a colon does not fit mid-list.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('931d9d3f-a99a-5630-9d0f-009726fe931b',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'hard',
   $q$There is only one task left to ______ decide who will present the findings.$q$, $q$[{"text":"do:","is_correct":true},{"text":"do,","is_correct":false,"misconception_token":"comma-where-colon-needed"},{"text":"do;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"do","is_correct":false,"misconception_token":"missing-colon"}]$q$::jsonb, $q$do:$q$, $q$A colon can follow a complete clause ("only one task left to do") to introduce what it is. A comma or semicolon does not do that job here, and no mark runs the ideas together.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3b6cef10-53eb-52f6-a5b1-c8be71d5b8df',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'easy',
   $q$The assembly instructions were ______ measure twice, cut once, and sand the edges before gluing.$q$, $q$[{"text":"simple,","is_correct":false,"misconception_token":"comma-where-colon-needed"},{"text":"simple","is_correct":false,"misconception_token":"missing-colon"},{"text":"simple;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"simple:","is_correct":true}]$q$::jsonb, $q$simple:$q$, $q$A colon after the complete clause "The assembly instructions were simple" introduces the steps that follow. A comma or semicolon can't introduce them, and no mark runs them together.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2a3272b0-4804-5187-8b98-b370332ab31c',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'easy',
   $q$The camping checklist included three ______ a tent, a sleeping bag, and a headlamp.$q$, $q$[{"text":"essentials","is_correct":false,"misconception_token":"missing-colon"},{"text":"essentials;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"essentials,","is_correct":false,"misconception_token":"comma-where-colon-needed"},{"text":"essentials:","is_correct":true}]$q$::jsonb, $q$essentials:$q$, $q$A complete clause ("The camping checklist included three essentials") can take a colon to introduce the list. A comma or semicolon can't, and it can't run in with no mark.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b0071894-a3d0-5de8-a850-374a6efb6f75',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'easy',
   $q$The reason for the delay was ______ the shipment had been routed to the wrong warehouse.$q$, $q$[{"text":"simple;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"simple,","is_correct":false,"misconception_token":"comma-where-colon-needed"},{"text":"simple:","is_correct":true},{"text":"simple","is_correct":false,"misconception_token":"missing-colon"}]$q$::jsonb, $q$simple:$q$, $q$The colon follows the complete clause to introduce the explanation. A comma or semicolon does not do that job, and no mark runs the ideas together.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a3ac0b54-c631-542a-9305-17f6e5a5fa3b',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'easy',
   $q$The final exhibit ______ by far the most popular—featured artifacts recovered from a shipwreck.$q$, $q$[{"text":"hall:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"hall","is_correct":false,"misconception_token":"unpaired-dash"},{"text":"hall—","is_correct":true},{"text":"hall;","is_correct":false,"misconception_token":"semicolon-misused"}]$q$::jsonb, $q$hall—$q$, $q$An aside set off by a dash needs a matching dash on both sides, so open with a dash to pair with the one before "featured."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7f528d3e-1f06-529b-be59-913c3e921660',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'easy',
   $q$The recipe requires only two uncommon ______ saffron and smoked paprika.$q$, $q$[{"text":"spices:","is_correct":true},{"text":"spices,","is_correct":false,"misconception_token":"comma-where-colon-needed"},{"text":"spices","is_correct":false,"misconception_token":"missing-colon"},{"text":"spices;","is_correct":false,"misconception_token":"semicolon-misused"}]$q$::jsonb, $q$spices:$q$, $q$A complete clause introduces the list with a colon. A comma or semicolon can't, and no mark leaves it run-on.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('58839bac-f0d8-5d65-9abb-dc98102f54c0',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'easy',
   $q$The lecture ran far over ______ several students had to leave before the question period.$q$, $q$[{"text":"time,","is_correct":false,"misconception_token":"comma-splice"},{"text":"time","is_correct":false,"misconception_token":"run-on"},{"text":"time;","is_correct":true},{"text":"time:","is_correct":false,"misconception_token":"colon-needs-complete-clause"}]$q$::jsonb, $q$time;$q$, $q$Two complete sentences can be joined by a semicolon. A comma is a splice, no mark is a run-on, and a colon would wrongly signal an explanation.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e0b30f25-26f2-5ad6-817e-beab8d6ec77b',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'easy',
   $q$The budget was approved without ______ however, the timeline still needed revision.$q$, $q$[{"text":"changes","is_correct":false,"misconception_token":"run-on"},{"text":"changes,","is_correct":false,"misconception_token":"comma-splice"},{"text":"changes;","is_correct":true},{"text":"changes:","is_correct":false,"misconception_token":"colon-needs-complete-clause"}]$q$::jsonb, $q$changes;$q$, $q$"However" joining two complete sentences takes a semicolon before it. A comma is a splice, no mark is a run-on, and a colon does not join clauses this way.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('254807bc-df5f-5a11-b645-b85a58655b4f',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'easy',
   $q$The kit includes basic tools such ______ a screwdriver, pliers, and a small wrench.$q$, $q$[{"text":"as;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"as:","is_correct":false,"misconception_token":"colon-after-incomplete-clause"},{"text":"as,","is_correct":false,"misconception_token":"unnecessary-comma"},{"text":"as","is_correct":true}]$q$::jsonb, $q$as$q$, $q$"Such as" already introduces the examples, and it is not a complete clause, so no colon (or other mark) follows it. A colon needs a complete sentence before it.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cafdc5d4-19db-5a1f-a139-f97b2f175ab9',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'medium',
   $q$The finalists came from Austin, ______ Denver, Colorado; and Portland, Oregon.$q$, $q$[{"text":"Texas,","is_correct":false,"misconception_token":"comma-in-complex-list"},{"text":"Texas;","is_correct":true},{"text":"Texas:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"Texas.","is_correct":false,"misconception_token":"period-creates-fragment"}]$q$::jsonb, $q$Texas;$q$, $q$When list items contain internal commas ("Austin, Texas"), semicolons separate the items. A comma blurs them, a period breaks the sentence, and a colon does not belong mid-list.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9f79c586-7960-5a19-b696-980cbea5e064',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'medium',
   $q$The three lead ______ a biologist, a chemist, and a physicist—shared the prize equally.$q$, $q$[{"text":"researchers;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"researchers,","is_correct":false,"misconception_token":"comma-in-complex-list"},{"text":"researchers—","is_correct":true},{"text":"researchers:","is_correct":false,"misconception_token":"colon-needs-complete-clause"}]$q$::jsonb, $q$researchers—$q$, $q$Because the aside already contains commas, a pair of dashes sets it off clearly, so open with a dash to match the one before "shared." A comma would blur the boundaries.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('47f925e3-833f-54bb-a4cf-762f7889bb93',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'medium',
   $q$The instructions left no room for ______ measure precisely, cut once, and check twice.$q$, $q$[{"text":"error","is_correct":false,"misconception_token":"missing-colon"},{"text":"error;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"error,","is_correct":false,"misconception_token":"comma-where-colon-needed"},{"text":"error:","is_correct":true}]$q$::jsonb, $q$error:$q$, $q$The complete clause introduces the steps with a colon. A semicolon joins independent clauses (not a list), a comma can't introduce it, and no mark runs it together.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('755ed808-2653-5713-a874-e5865d5dd892',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'medium',
   $q$For the experiment, each group will ______ a beaker, a thermometer, and a stopwatch.$q$, $q$[{"text":"need","is_correct":true},{"text":"need;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"need,","is_correct":false,"misconception_token":"unnecessary-comma"},{"text":"need:","is_correct":false,"misconception_token":"colon-after-incomplete-clause"}]$q$::jsonb, $q$need$q$, $q$A colon can't follow a verb like "need" — the words before a colon must form a complete sentence. Here the list is the verb's object, so no mark is needed.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2a343190-abb3-57d3-a4d3-af5b38899819',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'medium',
   $q$Every member of the crew—from the captain to the youngest ______ received a commendation for the rescue.$q$, $q$[{"text":"deckhand;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"deckhand:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"deckhand,","is_correct":false,"misconception_token":"unpaired-dash"},{"text":"deckhand—","is_correct":true}]$q$::jsonb, $q$deckhand—$q$, $q$The aside opened with a dash after "crew," so it must close with a matching dash. A comma would leave the first dash unpaired.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b4ff7fd9-0c6c-57dd-9b50-55176b439764',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'hard',
   $q$The delegates represented three major ______ Lagos, Nigeria; São Paulo, Brazil; and Jakarta, Indonesia.$q$, $q$[{"text":"cities:","is_correct":true},{"text":"cities;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"cities","is_correct":false,"misconception_token":"missing-colon"},{"text":"cities,","is_correct":false,"misconception_token":"comma-where-colon-needed"}]$q$::jsonb, $q$cities:$q$, $q$A complete clause introduces the list with a colon, even though the items themselves are separated by semicolons. A semicolon or comma can't introduce it.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('20017b4e-7e18-53a6-a8d5-ac1388fa2634',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'hard',
   $q$The award recognized her many ______ teaching, mentoring, and community outreach—over a thirty-year career.$q$, $q$[{"text":"contributions,","is_correct":false,"misconception_token":"comma-in-complex-list"},{"text":"contributions:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"contributions—","is_correct":true},{"text":"contributions;","is_correct":false,"misconception_token":"semicolon-misused"}]$q$::jsonb, $q$contributions—$q$, $q$The aside lists items with internal commas, so a pair of dashes sets it off clearly; open with a dash to match the one before "over."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c2ab6027-46e8-53f0-8ea0-60a261fbd63d',
   null,
   (select id from public.skills where slug = 'advanced-punctuation'),
   'standard-english-conventions', 'hard',
   $q$The recipe's success comes down to one ______ the quality of the olive oil.$q$, $q$[{"text":"thing:","is_correct":true},{"text":"thing;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"thing","is_correct":false,"misconception_token":"missing-colon"},{"text":"thing,","is_correct":false,"misconception_token":"comma-where-colon-needed"}]$q$::jsonb, $q$thing:$q$, $q$A colon follows the complete clause to point to the single thing. A comma can't introduce it, a semicolon needs two complete clauses, and no mark leaves it run-on.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- grammar-possessives-and-apostrophes (possessives-and-apostrophes, standard-english-conventions) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2b373fe7-ad44-532a-b0c1-9a834edcd3f9',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'easy',
   $q$The committee published ______ final report, along with a summary of the year's work.$q$, $q$[{"text":"their","is_correct":false,"misconception_token":"pronoun-number-mismatch"},{"text":"its","is_correct":true},{"text":"it's","is_correct":false,"misconception_token":"contraction-for-possessive"},{"text":"its'","is_correct":false,"misconception_token":"wrong-possessive-form"}]$q$::jsonb, $q$its$q$, $q$Possessive "its" has no apostrophe. "It's" means "it is," "its'" is not a word, and "their" is plural (the singular "committee" needs "its").$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9f6754c2-c6b6-5ddc-88d3-16ade2ca5c75',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'easy',
   $q$The ______ locker rooms were completely renovated over the summer break.$q$, $q$[{"text":"players'","is_correct":true},{"text":"player's","is_correct":false,"misconception_token":"wrong-possessive-form"},{"text":"players","is_correct":false,"misconception_token":"possessive-missing-apostrophe"},{"text":"player's's","is_correct":false,"misconception_token":"extra-apostrophe"}]$q$::jsonb, $q$players'$q$, $q$The locker rooms belong to more than one player, so the plural possessive "players'" (apostrophe after the s) is correct.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5088493e-f483-5be4-8570-ad09db3d2220',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'medium',
   $q$The scientist ______ research reshaped the field never sought public recognition.$q$, $q$[{"text":"which","is_correct":false,"misconception_token":"which-for-person"},{"text":"whose","is_correct":true},{"text":"whos'","is_correct":false,"misconception_token":"wrong-possessive-form"},{"text":"who's","is_correct":false,"misconception_token":"whos-whose-confusion"}]$q$::jsonb, $q$whose$q$, $q$Possessive "whose" shows the research belongs to the scientist. "Who's" means "who is," "which" doesn't refer to a person, and "whos'" is not a word.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('522918c8-4d4f-57ff-a402-92474e5da470',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'medium',
   $q$The ______ decision to extend the deadline relieved the entire class.$q$, $q$[{"text":"professor's","is_correct":true},{"text":"professors","is_correct":false,"misconception_token":"possessive-missing-apostrophe"},{"text":"professors'","is_correct":false,"misconception_token":"wrong-possessive-form"},{"text":"professor's's","is_correct":false,"misconception_token":"extra-apostrophe"}]$q$::jsonb, $q$professor's$q$, $q$The decision belongs to one professor, so the singular possessive "professor's" is correct.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ff89bd62-c6bd-5578-8847-dc08fc2b8f24',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'hard',
   $q$The ______ have hosted the neighborhood barbecue every Fourth of July for a decade.$q$, $q$[{"text":"Henderson's","is_correct":false,"misconception_token":"apostrophe-in-plural"},{"text":"Henderson","is_correct":false,"misconception_token":"wrong-number-noun"},{"text":"Hendersons'","is_correct":false,"misconception_token":"wrong-possessive-form"},{"text":"Hendersons","is_correct":true}]$q$::jsonb, $q$Hendersons$q$, $q$To make a family name plural, just add -s with no apostrophe: "the Hendersons." Apostrophes here would wrongly signal possession.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('801e467c-9d10-52b9-ba14-754b239faeec',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'easy',
   $q$The robot returned to ______ charging station as soon as the battery ran low.$q$, $q$[{"text":"their","is_correct":false,"misconception_token":"pronoun-number-mismatch"},{"text":"its'","is_correct":false,"misconception_token":"wrong-possessive-form"},{"text":"it's","is_correct":false,"misconception_token":"contraction-for-possessive"},{"text":"its","is_correct":true}]$q$::jsonb, $q$its$q$, $q$Possessive "its" has no apostrophe. "It's" means "it is," "its'" is not a word, and "their" is plural.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c68a1494-e237-5a7b-92ee-838d2fd4778c',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'easy',
   $q$The ______ speech inspired the entire graduating class to volunteer over the summer.$q$, $q$[{"text":"principals'","is_correct":false,"misconception_token":"wrong-possessive-form"},{"text":"principals","is_correct":false,"misconception_token":"possessive-missing-apostrophe"},{"text":"principal's","is_correct":true},{"text":"principal's's","is_correct":false,"misconception_token":"extra-apostrophe"}]$q$::jsonb, $q$principal's$q$, $q$One principal gives the speech, so the singular possessive "principal's" is correct.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d54134a1-b992-5f19-bd8d-165ea614d12a',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'easy',
   $q$The ______ uniforms were redesigned with brighter colors this season.$q$, $q$[{"text":"athletes's","is_correct":false,"misconception_token":"extra-apostrophe"},{"text":"athletes","is_correct":false,"misconception_token":"possessive-missing-apostrophe"},{"text":"athletes'","is_correct":true},{"text":"athlete's","is_correct":false,"misconception_token":"wrong-possessive-form"}]$q$::jsonb, $q$athletes'$q$, $q$The uniforms belong to many athletes, so the plural possessive "athletes'" (apostrophe after the s) is correct.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e2de7496-b50e-51c8-bf1e-5ba8011f5f83',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'easy',
   $q$Please make sure ______ project is uploaded before the midnight deadline.$q$, $q$[{"text":"your","is_correct":true},{"text":"you're","is_correct":false,"misconception_token":"contraction-for-possessive"},{"text":"youre","is_correct":false,"misconception_token":"wrong-word-homophone"},{"text":"yours","is_correct":false,"misconception_token":"wrong-possessive-form"}]$q$::jsonb, $q$your$q$, $q$Possessive "your" fits before "project." "You're" means "you are," "yours" stands alone without a noun, and "youre" is not a word.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9b3cf3b2-8033-5799-a404-8a88fabcb7c9',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'easy',
   $q$The ______ in the parking lot were all decorated for the homecoming parade.$q$, $q$[{"text":"truck's","is_correct":false,"misconception_token":"apostrophe-in-plural"},{"text":"trucks'","is_correct":false,"misconception_token":"wrong-possessive-form"},{"text":"trucks","is_correct":true},{"text":"trucks's","is_correct":false,"misconception_token":"extra-apostrophe"}]$q$::jsonb, $q$trucks$q$, $q$Here "trucks" is just a plural (more than one), so it takes no apostrophe.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c3072df3-f2c7-53c3-a03f-6f57182fc694',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'easy',
   $q$The volunteer ______ car we borrowed refused to accept any money for gas.$q$, $q$[{"text":"whos'","is_correct":false,"misconception_token":"wrong-possessive-form"},{"text":"who's","is_correct":false,"misconception_token":"whos-whose-confusion"},{"text":"whose","is_correct":true},{"text":"which","is_correct":false,"misconception_token":"which-for-person"}]$q$::jsonb, $q$whose$q$, $q$Possessive "whose" shows the car belongs to the volunteer. "Who's" means "who is," "whos'" is not a word, and "which" is for things, not people.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('56d2d4d5-d7a6-5acf-a574-048dea6b93bd',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'medium',
   $q$The ______ office overlooked the harbor and was always full of visitors.$q$, $q$[{"text":"bosses","is_correct":false,"misconception_token":"possessive-missing-apostrophe"},{"text":"boss'","is_correct":false,"misconception_token":"wrong-possessive-form"},{"text":"boss's's","is_correct":false,"misconception_token":"extra-apostrophe"},{"text":"boss's","is_correct":true}]$q$::jsonb, $q$boss's$q$, $q$A singular noun, even one ending in s, takes 's: "boss's office."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('06ecf9c2-ed56-5baf-82ae-e3ac22a1110a',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'medium',
   $q$The ______ section of the library was moved to the sunny room on the first floor.$q$, $q$[{"text":"childrens","is_correct":false,"misconception_token":"possessive-missing-apostrophe"},{"text":"children's","is_correct":true},{"text":"children","is_correct":false,"misconception_token":"wrong-number-noun"},{"text":"childrens'","is_correct":false,"misconception_token":"wrong-possessive-form"}]$q$::jsonb, $q$children's$q$, $q$"Children" is already plural, so the possessive adds 's: "children's." "Childrens" and "childrens'" treat it as if it were a regular plural.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d41527a2-e02e-581e-9a16-789823fb04af',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'medium',
   $q$The committee postponed the vote because ______ still gathering feedback from residents.$q$, $q$[{"text":"their","is_correct":false,"misconception_token":"pronoun-number-mismatch"},{"text":"its","is_correct":false,"misconception_token":"possessive-for-contraction"},{"text":"it's","is_correct":true},{"text":"its'","is_correct":false,"misconception_token":"wrong-possessive-form"}]$q$::jsonb, $q$it's$q$, $q$Here "it's" means "it is" ("it is still gathering feedback"), so the apostrophe is correct. "Its" is possessive, "its'" is not a word, and "their" is plural.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('14a3381d-a6ae-51b2-9d4b-a0a68e30f1ea',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'medium',
   $q$We spent the holidays at the ______ cabin near the lake.$q$, $q$[{"text":"Garcias's","is_correct":false,"misconception_token":"extra-apostrophe"},{"text":"Garcia's","is_correct":false,"misconception_token":"wrong-possessive-form"},{"text":"Garcias","is_correct":false,"misconception_token":"possessive-missing-apostrophe"},{"text":"Garcias'","is_correct":true}]$q$::jsonb, $q$Garcias'$q$, $q$The cabin belongs to the whole Garcia family (plural "Garcias"), so the possessive is "Garcias'."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cbffac20-c719-5236-a7b5-a6c1d5ded080',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'medium',
   $q$The blue tent is ours, and the green one is ______$q$, $q$[{"text":"theirs.","is_correct":true},{"text":"there's.","is_correct":false,"misconception_token":"contraction-for-possessive"},{"text":"theirs'.","is_correct":false,"misconception_token":"wrong-possessive-form"},{"text":"their's.","is_correct":false,"misconception_token":"extra-apostrophe"}]$q$::jsonb, $q$theirs.$q$, $q$The possessive pronoun "theirs" never takes an apostrophe. "Their's" and "theirs'" add wrong apostrophes, and "there's" means "there is."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('decc3e72-6ed2-5dc2-a228-8f3176e8f257',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'medium',
   $q$The ______ decision to close early surprised the regular customers.$q$, $q$[{"text":"store's manager","is_correct":false,"misconception_token":"wrong-possessive-form"},{"text":"store managers'","is_correct":false,"misconception_token":"wrong-number-noun"},{"text":"store manager","is_correct":false,"misconception_token":"possessive-missing-apostrophe"},{"text":"store manager's","is_correct":true}]$q$::jsonb, $q$store manager's$q$, $q$For a compound like "store manager," the apostrophe goes on the last word: "store manager's decision."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9424670b-4efa-5ab6-bc3f-703df98d8434',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'hard',
   $q$We finally tried ______ new bakery, the shop that the two friends opened together.$q$, $q$[{"text":"Mia and Carlos's","is_correct":true},{"text":"Mia's and Carlos's","is_correct":false,"misconception_token":"wrong-joint-possession"},{"text":"Mia and Carlos","is_correct":false,"misconception_token":"possessive-missing-apostrophe"},{"text":"Mia and Carlos'","is_correct":false,"misconception_token":"wrong-possessive-form"}]$q$::jsonb, $q$Mia and Carlos's$q$, $q$Because Mia and Carlos own the one bakery together, only the last name takes the apostrophe: "Mia and Carlos's." Marking both would show separate ownership.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7a58be6e-f02a-5f5c-b4db-79af88efef76',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'hard',
   $q$The exhibit displayed ______ paintings side by side, though the two artists never met.$q$, $q$[{"text":"Monet and Turner's","is_correct":false,"misconception_token":"wrong-joint-possession"},{"text":"Monets and Turners","is_correct":false,"misconception_token":"possessive-missing-apostrophe"},{"text":"Monet's and Turner's","is_correct":true},{"text":"Monet's and Turners","is_correct":false,"misconception_token":"wrong-possessive-form"}]$q$::jsonb, $q$Monet's and Turner's$q$, $q$The two artists own their paintings separately, so each name takes 's: "Monet's and Turner's."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3f6880e9-f7f5-5f31-a256-8775da744820',
   null,
   (select id from public.skills where slug = 'possessives-and-apostrophes'),
   'standard-english-conventions', 'hard',
   $q$The ______ locker room was renovated to include a larger training area this year.$q$, $q$[{"text":"women's","is_correct":true},{"text":"womens'","is_correct":false,"misconception_token":"wrong-possessive-form"},{"text":"women","is_correct":false,"misconception_token":"wrong-number-noun"},{"text":"womens","is_correct":false,"misconception_token":"possessive-missing-apostrophe"}]$q$::jsonb, $q$women's$q$, $q$"Women" is already plural, so the possessive adds 's: "women's." "Womens" and "womens'" wrongly treat it as a regular plural.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- grammar-modifier-placement (modifier-placement, standard-english-conventions) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b63756a1-35a9-5fc0-a3c2-f72f5d889c29',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'medium',
   $q$Racing to catch the last train, ______$q$, $q$[{"text":"grabbing his coat took only a second.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"},{"text":"Daniel grabbed his coat and dashed out the door.","is_correct":true},{"text":"the platform was already crowded with commuters.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"it was impossible to find an empty seat.","is_correct":false,"misconception_token":"illogical-modifier-subject"}]$q$::jsonb, $q$Daniel grabbed his coat and dashed out the door.$q$, $q$The opening phrase describes who is racing, so the main clause must start with that person: "Daniel." The others make the platform, "it," or "grabbing" do the racing.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5423e488-cf2a-50af-afc3-b8208456e9ad',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'medium',
   $q$After simmering for several hours, ______$q$, $q$[{"text":"the stew developed a rich, complex flavor.","is_correct":true},{"text":"it was finally time to add the salt.","is_correct":false,"misconception_token":"illogical-modifier-subject"},{"text":"the chef ladled the stew into bowls.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"adding more broth improved the texture.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"}]$q$::jsonb, $q$the stew developed a rich, complex flavor.$q$, $q$The stew is what simmered, so the main clause must start with "the stew." The others make the chef, "it," or "adding" do the simmering.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('78af95d8-dd54-555a-83fa-2cec36598602',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'hard',
   $q$Buried for centuries beneath the ash, ______$q$, $q$[{"text":"it took years to excavate the site fully.","is_correct":false,"misconception_token":"illogical-modifier-subject"},{"text":"the ancient city remained remarkably intact.","is_correct":true},{"text":"excavating the site required enormous care.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"},{"text":"archaeologists uncovered the ancient city.","is_correct":false,"misconception_token":"dangling-modifier"}]$q$::jsonb, $q$the ancient city remained remarkably intact.$q$, $q$The city was buried, so the main clause must start with "the ancient city." The others make the archaeologists, "it," or "excavating" the buried thing.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1087a0fb-ed0f-53a9-8085-58cefcc24a6f',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'easy',
   $q$While reviewing the manuscript, ______$q$, $q$[{"text":"the editor noticed several small inconsistencies.","is_correct":true},{"text":"several small inconsistencies were noticed.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"there were several inconsistencies to fix.","is_correct":false,"misconception_token":"illogical-modifier-subject"},{"text":"noticing the inconsistencies took a while.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"}]$q$::jsonb, $q$the editor noticed several small inconsistencies.$q$, $q$The editor is the one reviewing, so the main clause must start with "the editor." The others make the inconsistencies, "there," or "noticing" do the reviewing.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dcc93c49-fbfa-583c-a314-828ac676181b',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'easy',
   $q$Painted in vivid blues and greens, ______$q$, $q$[{"text":"students admired the mural every morning.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"admiring the mural became a daily ritual.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"},{"text":"it brightened the entire school entrance.","is_correct":false,"misconception_token":"illogical-modifier-subject"},{"text":"the mural transformed the dull hallway.","is_correct":true}]$q$::jsonb, $q$the mural transformed the dull hallway.$q$, $q$The mural is what was painted, so the main clause must start with "the mural." The others make the students, "it," or "admiring" the painted thing.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3a399c26-ed24-52b9-a00b-4bd9642f93bf',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'easy',
   $q$Startled by the sudden clap of thunder, ______$q$, $q$[{"text":"calming the animals took the whole evening.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"},{"text":"it was impossible to calm them for an hour.","is_correct":false,"misconception_token":"illogical-modifier-subject"},{"text":"the barn doors rattled loudly on their hinges.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"the young horses bolted across the open field.","is_correct":true}]$q$::jsonb, $q$the young horses bolted across the open field.$q$, $q$The horses are what were startled, so the main clause must start with "the young horses." The others make the barn doors, "it," or "calming" do the being-startled.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('90fa099d-cdf9-5dc2-bcae-32b24132e4bc',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'easy',
   $q$Written in a single afternoon, ______$q$, $q$[{"text":"there was little time to revise it.","is_correct":false,"misconception_token":"illogical-modifier-subject"},{"text":"the writer surprised even herself.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"the letter still captured exactly what she wanted to say.","is_correct":true},{"text":"revising it later felt unnecessary.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"}]$q$::jsonb, $q$the letter still captured exactly what she wanted to say.$q$, $q$The letter is what was written, so the main clause must start with "the letter." The others make the writer, "there," or "revising" the written thing.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f0670536-8ce5-5d71-8b1c-d95b6e21905c',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'easy',
   $q$Hidden behind a false wall for decades, ______$q$, $q$[{"text":"opening the safe required a locksmith.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"},{"text":"the new owners discovered a small safe.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"the small safe held documents no one expected.","is_correct":true},{"text":"it took hours to force the safe open.","is_correct":false,"misconception_token":"illogical-modifier-subject"}]$q$::jsonb, $q$the small safe held documents no one expected.$q$, $q$The safe is what was hidden, so the main clause must start with "the small safe." The others make the owners, "it," or "opening" the hidden thing.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6d111cbd-f4fa-52f7-9023-a379bb24af23',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'easy',
   $q$Eager to impress the visiting judges, ______$q$, $q$[{"text":"the young chef plated every dish with care.","is_correct":true},{"text":"the dishes arrived at the table steaming.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"plating each dish took great patience.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"},{"text":"it was clear the pressure was intense.","is_correct":false,"misconception_token":"illogical-modifier-subject"}]$q$::jsonb, $q$the young chef plated every dish with care.$q$, $q$The chef is the one eager to impress, so the main clause must start with "the young chef." The others make the dishes, "it," or "plating" eager.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6040f53d-87bb-538f-a57e-59824fc0fe1e',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'easy',
   $q$Covered in a thick layer of fresh snow, ______$q$, $q$[{"text":"the skiers admired the slopes below.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"there was no trail visible anywhere.","is_correct":false,"misconception_token":"illogical-modifier-subject"},{"text":"the mountain looked completely untouched at dawn.","is_correct":true},{"text":"climbing it would be dangerous that day.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"}]$q$::jsonb, $q$the mountain looked completely untouched at dawn.$q$, $q$The mountain is what was covered in snow, so the main clause must start with "the mountain." The others make the skiers, "there," or "climbing" the snow-covered thing.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('12ab1853-c81e-532e-a90f-e86ab5c9af68',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'easy',
   $q$Translated into more than a dozen languages, ______$q$, $q$[{"text":"it was a remarkable achievement.","is_correct":false,"misconception_token":"illogical-modifier-subject"},{"text":"the author gained fans around the world.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"the novel reached readers on every continent.","is_correct":true},{"text":"translating it took a team of experts.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"}]$q$::jsonb, $q$the novel reached readers on every continent.$q$, $q$The novel is what was translated, so the main clause must start with "the novel." The others make the author, "it," or "translating" the translated thing.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('149de5e5-98f5-5b26-b701-6b6ea72e6d71',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'medium',
   $q$Having trained together for months, ______$q$, $q$[{"text":"it was time to test their limits.","is_correct":false,"misconception_token":"illogical-modifier-subject"},{"text":"the coach finally announced the lineup.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"training every morning had paid off.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"},{"text":"the swimmers felt ready for the national meet.","is_correct":true}]$q$::jsonb, $q$the swimmers felt ready for the national meet.$q$, $q$The swimmers are the ones who trained, so the main clause must start with "the swimmers." The others make the coach, "it," or "training" do the training.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a024b6c3-9357-5a40-9c30-e46b98ff9f6d',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'medium',
   $q$Left unattended on the hot stove, ______$q$, $q$[{"text":"the cook rushed back to the kitchen.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"the pot of soup slowly boiled over.","is_correct":true},{"text":"watching the soup was clearly necessary.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"},{"text":"there was a mess to clean up.","is_correct":false,"misconception_token":"illogical-modifier-subject"}]$q$::jsonb, $q$the pot of soup slowly boiled over.$q$, $q$The soup is what was left unattended, so the main clause must start with "the pot of soup." The others make the cook, "there," or "watching" the unattended thing.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('26012332-0c99-5544-80d2-9fdd6c2cd540',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'medium',
   $q$To qualify for the national finals, ______$q$, $q$[{"text":"qualifying demanded months of practice.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"},{"text":"the rules required two regional wins.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"each contestant had to win two regional rounds.","is_correct":true},{"text":"it was necessary to place first twice.","is_correct":false,"misconception_token":"illogical-modifier-subject"}]$q$::jsonb, $q$each contestant had to win two regional rounds.$q$, $q$The contestant is the one who must qualify, so the main clause must start with "each contestant." The others make the rules, "it," or "qualifying" do the qualifying.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dbdda2a0-8907-5d97-aa02-9174b4229cbb',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'medium',
   $q$Rushing to finish before the final bell, ______$q$, $q$[{"text":"proofreading felt like a luxury they lacked.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"},{"text":"the essays were full of small errors.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"there was no time left to check anything.","is_correct":false,"misconception_token":"illogical-modifier-subject"},{"text":"the students barely proofread their essays.","is_correct":true}]$q$::jsonb, $q$the students barely proofread their essays.$q$, $q$The students are the ones rushing, so the main clause must start with "the students." The others make the essays, "there," or "proofreading" do the rushing.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ccf70aad-4747-5032-89dc-ed579abd4d3e',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'medium',
   $q$Delighted by the surprise retirement party, ______$q$, $q$[{"text":"the veteran teacher could hardly find words.","is_correct":true},{"text":"it was a moment no one would forget.","is_correct":false,"misconception_token":"illogical-modifier-subject"},{"text":"planning the party had taken weeks.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"},{"text":"the whole room erupted in applause.","is_correct":false,"misconception_token":"dangling-modifier"}]$q$::jsonb, $q$the veteran teacher could hardly find words.$q$, $q$The teacher is the one delighted, so the main clause must start with "the veteran teacher." The others make the room, "it," or "planning" delighted.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('856a873a-5391-5c10-b4db-8a2a8969a34c',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'medium',
   $q$Assembled entirely from mismatched spare parts, ______$q$, $q$[{"text":"it was surprising that anything worked.","is_correct":false,"misconception_token":"illogical-modifier-subject"},{"text":"assembling it had taken all weekend.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"},{"text":"the students cheered at the result.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"the little robot still worked on the first try.","is_correct":true}]$q$::jsonb, $q$the little robot still worked on the first try.$q$, $q$The robot is what was assembled, so the main clause must start with "the little robot." The others make the students, "it," or "assembling" the assembled thing.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3870a4bc-0add-5149-91ca-401c578424a9',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'hard',
   $q$Having been warned about the approaching storm, ______$q$, $q$[{"text":"the campers packed up their tents before dark.","is_correct":true},{"text":"the forecast proved accurate that night.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"warning the group had been the ranger's idea.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"},{"text":"it was wise to leave the ridge early.","is_correct":false,"misconception_token":"illogical-modifier-subject"}]$q$::jsonb, $q$the campers packed up their tents before dark.$q$, $q$The campers are the ones warned, so the main clause must start with "the campers." The others make the forecast, "it," or "warning" the ones warned.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('30c54211-033b-5f7e-8cce-3b2f571bc79e',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'hard',
   $q$Once considered impossible to climb, ______$q$, $q$[{"text":"climbers travel great distances to attempt it.","is_correct":false,"misconception_token":"dangling-modifier"},{"text":"it remains a serious test of skill.","is_correct":false,"misconception_token":"illogical-modifier-subject"},{"text":"the sheer granite cliff now draws experts worldwide.","is_correct":true},{"text":"reaching the summit still takes days.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"}]$q$::jsonb, $q$the sheer granite cliff now draws experts worldwide.$q$, $q$The cliff is what was considered impossible to climb, so the main clause must start with "the sheer granite cliff." The others make the climbers, "it," or "reaching" the thing once thought impossible.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1ef77548-d64d-56b1-8f53-b274b5666377',
   null,
   (select id from public.skills where slug = 'modifier-placement'),
   'standard-english-conventions', 'hard',
   $q$Determined to prove the established theory wrong, ______$q$, $q$[{"text":"the graduate student spent years gathering data.","is_correct":true},{"text":"it would take enormous persistence.","is_correct":false,"misconception_token":"illogical-modifier-subject"},{"text":"disproving it became a lifelong project.","is_correct":false,"misconception_token":"wrong-subject-for-modifier"},{"text":"the experiments produced surprising results.","is_correct":false,"misconception_token":"dangling-modifier"}]$q$::jsonb, $q$the graduate student spent years gathering data.$q$, $q$The student is the one determined, so the main clause must start with "the graduate student." The others make the experiments, "it," or "disproving" determined.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- grammar-sentence-boundaries (sentence-boundaries, standard-english-conventions) — 20 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('308665cb-87fa-5177-8c33-637947f0bd65',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'easy',
   $q$The library renovated its reading ______ it added dozens of new study desks along the windows.$q$, $q$[{"text":"room; and it","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"room. It","is_correct":true},{"text":"room, it","is_correct":false,"misconception_token":"comma-splice"},{"text":"room it","is_correct":false,"misconception_token":"run-on"}]$q$::jsonb, $q$room. It$q$, $q$These are two complete sentences, so a period ends the first. A comma alone is a splice, no mark is a run-on, and a semicolon does not go before "and."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1b45ddaa-3894-5262-8a5e-c075a45c4b99',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'medium',
   $q$The first set of data was ______ therefore, the team scheduled a follow-up study for the spring.$q$, $q$[{"text":"inconclusive;","is_correct":true},{"text":"inconclusive","is_correct":false,"misconception_token":"run-on"},{"text":"inconclusive,","is_correct":false,"misconception_token":"comma-splice"},{"text":"inconclusive:","is_correct":false,"misconception_token":"colon-needs-complete-clause"}]$q$::jsonb, $q$inconclusive;$q$, $q$When "therefore" joins two complete sentences, a semicolon comes before it. A comma is a splice, no mark is a run-on, and a colon does not join two complete clauses this way.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f76014e5-6d11-5cc4-add9-02642ea1cfb0',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'medium',
   $q$Some visitors preferred the guided ______ others chose to explore the exhibits on their own.$q$, $q$[{"text":"tour others","is_correct":false,"misconception_token":"run-on"},{"text":"tour; others","is_correct":true},{"text":"tour and others","is_correct":false,"misconception_token":"missing-comma"},{"text":"tour, others","is_correct":false,"misconception_token":"comma-splice"}]$q$::jsonb, $q$tour; others$q$, $q$Two complete sentences can be joined by a semicolon. A comma alone splices them, no mark runs them together, and joining with "and" would need a comma before it.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7d6d5d29-cdff-5650-8f50-e417d79cbf4a',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'easy',
   $q$The bridge was closed for emergency ______ drivers were forced to take a lengthy detour.$q$, $q$[{"text":"repairs. Drivers","is_correct":true},{"text":"repairs, drivers","is_correct":false,"misconception_token":"comma-splice"},{"text":"repairs drivers","is_correct":false,"misconception_token":"run-on"},{"text":"repairs; and drivers","is_correct":false,"misconception_token":"semicolon-misused"}]$q$::jsonb, $q$repairs. Drivers$q$, $q$Two complete sentences are separated by a period. A comma alone is a splice, no mark is a run-on, and a semicolon does not go before "and."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1f90b483-3f81-588a-9bf9-1c7dc1247784',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'hard',
   $q$The new scheduling policy reduced patient wait ______ moreover, it lowered costs for the entire clinic.$q$, $q$[{"text":"times,","is_correct":false,"misconception_token":"comma-splice"},{"text":"times:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"times","is_correct":false,"misconception_token":"run-on"},{"text":"times;","is_correct":true}]$q$::jsonb, $q$times;$q$, $q$When "moreover" joins two complete sentences, a semicolon comes before it. A comma is a splice, no mark is a run-on, and a colon does not join two complete clauses this way.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3047d2be-33ea-5c2a-b548-7702de24e902',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'easy',
   $q$The bakery sells out of croissants by ______ the regulars arrive before dawn to claim their favorites.$q$, $q$[{"text":"noon; and the","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"noon the","is_correct":false,"misconception_token":"run-on"},{"text":"noon, the","is_correct":false,"misconception_token":"comma-splice"},{"text":"noon. The","is_correct":true}]$q$::jsonb, $q$noon. The$q$, $q$Two complete sentences take a period. A comma alone is a splice, no mark is a run-on, and a semicolon does not go before "and."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('51b0cee3-0823-5eea-9bf4-190438a5e518',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'easy',
   $q$The first draft of the essay was ______ the revision sharpened nearly every paragraph.$q$, $q$[{"text":"rough the","is_correct":false,"misconception_token":"run-on"},{"text":"rough, the","is_correct":false,"misconception_token":"comma-splice"},{"text":"rough; the","is_correct":true},{"text":"rough: the","is_correct":false,"misconception_token":"colon-needs-complete-clause"}]$q$::jsonb, $q$rough; the$q$, $q$Two complete, closely related sentences can be joined by a semicolon. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3ce673f5-ae65-5f6e-b0cb-572f04cc8481',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'easy',
   $q$The museum lowered its ticket ______ attendance rose almost immediately.$q$, $q$[{"text":"prices; and","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"prices and","is_correct":false,"misconception_token":"missing-comma"},{"text":"prices, and","is_correct":true},{"text":"prices, attendance","is_correct":false,"misconception_token":"comma-splice"}]$q$::jsonb, $q$prices, and$q$, $q$Two independent clauses joined by "and" take a comma before the conjunction: "prices, and attendance rose." Without it the sentence runs on, a comma without the conjunction splices them, and a semicolon does not precede "and."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ad633241-aa97-5420-8e95-9d77d918ab0a',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'easy',
   $q$The experiment produced clear ______ the team published its findings within a month.$q$, $q$[{"text":"results. The","is_correct":true},{"text":"results, the","is_correct":false,"misconception_token":"comma-splice"},{"text":"results; and the","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"results the","is_correct":false,"misconception_token":"run-on"}]$q$::jsonb, $q$results. The$q$, $q$Two complete sentences are separated by a period. A comma alone is a splice, no mark is a run-on, and a semicolon does not go before "and."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('40eaff80-e710-5e41-b682-c1701072d200',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'easy',
   $q$Some visitors prefer the morning ______ others would rather come after sunset.$q$, $q$[{"text":"tours, others","is_correct":false,"misconception_token":"comma-splice"},{"text":"tours others","is_correct":false,"misconception_token":"run-on"},{"text":"tours; others","is_correct":true},{"text":"tours and others","is_correct":false,"misconception_token":"missing-comma"}]$q$::jsonb, $q$tours; others$q$, $q$Two complete sentences can be joined by a semicolon. A comma alone splices them, no mark runs them together, and joining with "and" would need a comma before it.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2433d2a9-2915-5d66-87aa-59309c1abb42',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'easy',
   $q$The main road was completely ______ traffic backed up for nearly a mile.$q$, $q$[{"text":"blocked traffic","is_correct":false,"misconception_token":"run-on"},{"text":"blocked, traffic","is_correct":false,"misconception_token":"comma-splice"},{"text":"blocked. Traffic","is_correct":true},{"text":"blocked; and traffic","is_correct":false,"misconception_token":"semicolon-misused"}]$q$::jsonb, $q$blocked. Traffic$q$, $q$Two complete sentences take a period. A comma alone is a splice, no mark is a run-on, and a semicolon does not go before "and."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9f10bec6-dee1-54a4-8b66-abf4c6c22952',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'medium',
   $q$The plan looked promising on ______ however, it proved expensive to carry out.$q$, $q$[{"text":"paper","is_correct":false,"misconception_token":"run-on"},{"text":"paper,","is_correct":false,"misconception_token":"comma-splice"},{"text":"paper:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"paper;","is_correct":true}]$q$::jsonb, $q$paper;$q$, $q$When "however" joins two complete sentences, a semicolon comes before it. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d812ab2e-1079-56f2-bdc2-a694907bb7c4',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'medium',
   $q$The water samples were ______ therefore, the lab repeated the entire test the next day.$q$, $q$[{"text":"contaminated,","is_correct":false,"misconception_token":"comma-splice"},{"text":"contaminated;","is_correct":true},{"text":"contaminated:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"contaminated","is_correct":false,"misconception_token":"run-on"}]$q$::jsonb, $q$contaminated;$q$, $q$When "therefore" joins two complete sentences, a semicolon precedes it. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f5943030-1889-523e-94ac-ed6ea40b161c',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'medium',
   $q$The committee reviewed every ______ yet it still could not reach a decision that night.$q$, $q$[{"text":"proposal:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"proposal","is_correct":false,"misconception_token":"missing-comma"},{"text":"proposal,","is_correct":true},{"text":"proposal;","is_correct":false,"misconception_token":"semicolon-misused"}]$q$::jsonb, $q$proposal,$q$, $q$Two complete sentences joined by "yet" take a comma before the conjunction. No comma runs them together, and a semicolon or colon does not precede a coordinating conjunction like "yet."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1577b6ea-64fb-5a5b-94a8-5e76d0ef7d7c',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'medium',
   $q$The lecture ran long and grew increasingly ______ several attendees quietly slipped out the back.$q$, $q$[{"text":"technical; and several","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"technical, several","is_correct":false,"misconception_token":"comma-splice"},{"text":"technical several","is_correct":false,"misconception_token":"run-on"},{"text":"technical. Several","is_correct":true}]$q$::jsonb, $q$technical. Several$q$, $q$Two complete sentences take a period. A comma alone is a splice, no mark is a run-on, and a semicolon does not go before "and."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bd58fca3-8dda-54a2-914f-f2380079bc48',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'medium',
   $q$The old bridge failed its annual safety ______ consequently, the city closed it to traffic overnight.$q$, $q$[{"text":"inspection;","is_correct":true},{"text":"inspection","is_correct":false,"misconception_token":"run-on"},{"text":"inspection:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"inspection,","is_correct":false,"misconception_token":"comma-splice"}]$q$::jsonb, $q$inspection;$q$, $q$When "consequently" joins two complete sentences, a semicolon comes before it. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c1809a50-d8e7-5ba1-a6cf-817b5f5f9a56',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'medium',
   $q$The forecast called for steady ______ so the organizers moved the concert indoors.$q$, $q$[{"text":"rain;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"rain:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"rain","is_correct":false,"misconception_token":"missing-comma"},{"text":"rain,","is_correct":true}]$q$::jsonb, $q$rain,$q$, $q$Two complete sentences joined by "so" take a comma before the conjunction. No comma runs them together, and a semicolon or colon does not precede a coordinating conjunction like "so."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('22d05936-4b0e-5fca-b4d6-8849c7016a4a',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'hard',
   $q$The odds of success were ______ nevertheless, the small crew pressed on with the launch.$q$, $q$[{"text":"daunting;","is_correct":true},{"text":"daunting,","is_correct":false,"misconception_token":"comma-splice"},{"text":"daunting:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"daunting","is_correct":false,"misconception_token":"run-on"}]$q$::jsonb, $q$daunting;$q$, $q$When "nevertheless" joins two complete sentences, a semicolon precedes it. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f4f3ffb9-9ee4-57ff-ba36-399ea2e943df',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'hard',
   $q$The negotiations stalled for ______ but a compromise finally emerged just before midnight.$q$, $q$[{"text":"weeks","is_correct":false,"misconception_token":"missing-comma"},{"text":"weeks;","is_correct":false,"misconception_token":"semicolon-misused"},{"text":"weeks,","is_correct":true},{"text":"weeks:","is_correct":false,"misconception_token":"colon-needs-complete-clause"}]$q$::jsonb, $q$weeks,$q$, $q$Two complete sentences joined by "but" take a comma before the conjunction. No comma runs them together, and a semicolon or colon does not precede a coordinating conjunction like "but."$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ddf012c6-0581-5729-aae4-11edc60aa7f5',
   null,
   (select id from public.skills where slug = 'sentence-boundaries'),
   'standard-english-conventions', 'hard',
   $q$The renovation uncovered several ______ for example, one wall concealed a mural from the 1800s.$q$, $q$[{"text":"surprises;","is_correct":true},{"text":"surprises","is_correct":false,"misconception_token":"run-on"},{"text":"surprises:","is_correct":false,"misconception_token":"colon-needs-complete-clause"},{"text":"surprises,","is_correct":false,"misconception_token":"comma-splice"}]$q$::jsonb, $q$surprises;$q$, $q$"For example" introducing a second complete sentence follows a semicolon. A comma is a splice, no mark is a run-on, and a colon does not join two independent clauses this way.$q$, 'published')
on conflict (id) do update set
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
