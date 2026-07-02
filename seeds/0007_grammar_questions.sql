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

-- grammar-sentence-structure (sentence-structure, standard-english-conventions) — 5 items
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

-- grammar-pronoun-agreement (pronoun-agreement, standard-english-conventions) — 5 items
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

-- grammar-verb-tense-and-form (verb-tense-and-form, standard-english-conventions) — 5 items
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

-- grammar-advanced-punctuation (advanced-punctuation, standard-english-conventions) — 5 items
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

-- grammar-possessives-and-apostrophes (possessives-and-apostrophes, standard-english-conventions) — 5 items
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

-- grammar-modifier-placement (modifier-placement, standard-english-conventions) — 5 items
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

-- grammar-sentence-boundaries (sentence-boundaries, standard-english-conventions) — 5 items
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

commit;
