-- PathwayEd — Question Engine: PREP verbal (synonyms/antonyms) skills + questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-prep-verbal-seeds.ts from the
-- curated pool in src/lib/prep/verbalTemplates.ts. HOW TO APPLY (self-contained —
-- creates the isolated prep-verbal subject + domain + skills, then the questions):
--   bun run db:seed seeds/0015_prep_verbal_questions.sql
-- Idempotent (deterministic ids). Depends on migration 0004 (generated_questions).
-- The prep-verbal subject is isolated from the K-12 learning tree; the prep engine
-- reaches these skills by slug (prep-synonyms, prep-antonyms).
--
-- 100% ORIGINAL grade 6-8 items — no published test or workbook copied. Every item
-- has 4 choices, one correct, and three distractors that are each a specific wrong
-- path a real 7th grader takes (with a mapped misconception explanation).

begin;

-- Subject + domain (isolated prep taxonomy).
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:subj-prep-verbal')::uuid, 'subject', null, 'prep-verbal', 'Test Prep — Verbal', null, null, null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-prep-verbal')::uuid, 'domain', md5('pe-aos:subj-prep-verbal')::uuid, 'prep-verbal', 'Verbal Reasoning', null, null, null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:skill-prep-synonyms')::uuid, 'skill', md5('pe-aos:dom-prep-verbal')::uuid, 'prep-verbal', 'Synonyms', 'prep-synonyms', '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:skill-prep-antonyms')::uuid, 'skill', md5('pe-aos:dom-prep-verbal')::uuid, 'prep-verbal', 'Antonyms', 'prep-antonyms', '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band;

-- prep-synonyms (Synonyms) — 48 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('58c2328d-9a26-5295-a5c8-e7ea4b92131e',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as ABUNDANT?$q$, $q$[{"text":"expensive","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"plentiful","is_correct":true},{"text":"generous","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"scarce","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$plentiful$q$, $q$Abundant means "existing in large amounts; plentiful", so the closest word in meaning is plentiful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e339d8b6-69b4-5b2f-9870-bebb8269fd9e',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as BRAVE?$q$, $q$[{"text":"strong","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"confident","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"courageous","is_correct":true},{"text":"cowardly","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$courageous$q$, $q$Brave means "showing courage in the face of danger", so the closest word in meaning is courageous.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('34374a64-ac51-5f61-8525-bc09b9e6991a',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as CALM?$q$, $q$[{"text":"lazy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"frantic","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"peaceful","is_correct":true}]$q$::jsonb, $q$peaceful$q$, $q$Calm means "free from excitement or disturbance; peaceful", so the closest word in meaning is peaceful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5e99b401-84c9-52a4-b896-98f29d9e1d96',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as BEGIN?$q$, $q$[{"text":"commence","is_correct":true},{"text":"attend","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"prepare","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"finish","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$commence$q$, $q$Begin means "to start doing something", so the closest word in meaning is commence.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('eb108b77-75a8-5341-ac0c-e3438031c830',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as HUGE?$q$, $q$[{"text":"heavy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"enormous","is_correct":true},{"text":"tall","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"tiny","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$enormous$q$, $q$Huge means "extremely large in size", so the closest word in meaning is enormous.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d831cee2-b272-5985-97eb-25db4c2a6292',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as HAPPY?$q$, $q$[{"text":"friendly","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"excited","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"cheerful","is_correct":true},{"text":"miserable","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$cheerful$q$, $q$Happy means "feeling or showing pleasure", so the closest word in meaning is cheerful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0daf6a67-3591-500f-b473-169f8a82ed46',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as QUICK?$q$, $q$[{"text":"busy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"sudden","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"sluggish","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"rapid","is_correct":true}]$q$::jsonb, $q$rapid$q$, $q$Quick means "moving or happening fast", so the closest word in meaning is rapid.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c8b41126-7038-5732-9c67-a15209e926de',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as HONEST?$q$, $q$[{"text":"truthful","is_correct":true},{"text":"polite","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"loyal","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"deceitful","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$truthful$q$, $q$Honest means "truthful and sincere", so the closest word in meaning is truthful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4890e74b-03ad-57d1-bc19-700459ac8ec4',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as ANCIENT?$q$, $q$[{"text":"famous","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"aged","is_correct":true},{"text":"historic","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"modern","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$aged$q$, $q$Ancient means "belonging to the very distant past; very old", so the closest word in meaning is aged.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('223d08e1-e9f4-57cf-a97d-cc0935d389b5',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as BOLD?$q$, $q$[{"text":"proud","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"bright","is_correct":false,"misconception_token":"verbal-other-sense"},{"text":"daring","is_correct":true},{"text":"timid","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$daring$q$, $q$Bold means "willing to take risks; confident and daring", so the closest word in meaning is daring.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cf9085c9-be52-5367-9ee8-19dddbb2f71a',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as GATHER?$q$, $q$[{"text":"clean","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"organize","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"scatter","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"collect","is_correct":true}]$q$::jsonb, $q$collect$q$, $q$Gather means "to bring or come together in one place", so the closest word in meaning is collect.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('49f778ba-d52a-5965-8cba-2fc110cd3135',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as WEALTHY?$q$, $q$[{"text":"affluent","is_correct":true},{"text":"famous","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"generous","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"destitute","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$affluent$q$, $q$Wealthy means "having a great deal of money; rich", so the closest word in meaning is affluent.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f3c08f9e-3203-541b-a1b5-a5530960ff7c',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as SIMPLE?$q$, $q$[{"text":"cheap","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"plain","is_correct":true},{"text":"small","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"complicated","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$plain$q$, $q$Simple means "easily understood; not complicated", so the closest word in meaning is plain.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('302886cc-9888-5b4a-a139-3dc8a7b11cfe',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as REVEAL?$q$, $q$[{"text":"announce","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"discover","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"disclose","is_correct":true},{"text":"conceal","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$disclose$q$, $q$Reveal means "to make something known; to show", so the closest word in meaning is disclose.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a0d49cd4-a7ec-52aa-abf2-353430b0175c',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as STURDY?$q$, $q$[{"text":"heavy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"stiff","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"flimsy","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"robust","is_correct":true}]$q$::jsonb, $q$robust$q$, $q$Sturdy means "strongly built; not easily broken", so the closest word in meaning is robust.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c39a9c13-ea8e-5257-8dc2-2e457d25a8b7',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as PRAISE?$q$, $q$[{"text":"commend","is_correct":true},{"text":"reward","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"thank","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"criticize","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$commend$q$, $q$Praise means "to express approval or admiration", so the closest word in meaning is commend.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0d8b06c2-6fdb-5269-b796-2021f113f0fa',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as RELUCTANT?$q$, $q$[{"text":"quiet","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"hesitant","is_correct":true},{"text":"nervous","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"eager","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$hesitant$q$, $q$Reluctant means "unwilling and hesitant", so the closest word in meaning is hesitant.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a440e552-4967-5a8b-9e08-750c4ed5ce2c',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as DILIGENT?$q$, $q$[{"text":"punctual","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"intelligent","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"industrious","is_correct":true},{"text":"lazy","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$industrious$q$, $q$Diligent means "showing careful, steady effort; hardworking", so the closest word in meaning is industrious.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('969f714b-a58a-59aa-b84c-d00073fa6341',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as HOSTILE?$q$, $q$[{"text":"competitive","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"angry","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"friendly","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"antagonistic","is_correct":true}]$q$::jsonb, $q$antagonistic$q$, $q$Hostile means "unfriendly and aggressive", so the closest word in meaning is antagonistic.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('897022d1-b6b7-5b80-880d-f31ede167682',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as VIVID?$q$, $q$[{"text":"vibrant","is_correct":true},{"text":"loud","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"colorful","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"dull","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$vibrant$q$, $q$Vivid means "producing bright, clear images in the mind", so the closest word in meaning is vibrant.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('94324bdd-6795-58d9-9222-7fa50cd2eda6',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as SCARCE?$q$, $q$[{"text":"expensive","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"sparse","is_correct":true},{"text":"small","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"plentiful","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$sparse$q$, $q$Scarce means "in short supply; hard to find", so the closest word in meaning is sparse.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1b572cfa-f3c7-567f-8bc6-781e88e37851',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as TRANQUIL?$q$, $q$[{"text":"sleepy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"silent","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"serene","is_correct":true},{"text":"turbulent","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$serene$q$, $q$Tranquil means "calm and peaceful", so the closest word in meaning is serene.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2d45a481-fd06-5832-9436-3e7862fc0654',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as CONCISE?$q$, $q$[{"text":"polite","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"clear","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"rambling","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"succinct","is_correct":true}]$q$::jsonb, $q$succinct$q$, $q$Concise means "giving a lot of information in few words", so the closest word in meaning is succinct.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bba28ded-c28e-585e-8ce5-67adccd96aa6',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as ARROGANT?$q$, $q$[{"text":"haughty","is_correct":true},{"text":"famous","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"confident","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"humble","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$haughty$q$, $q$Arrogant means "having an exaggerated sense of one’s own importance", so the closest word in meaning is haughty.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('435825f9-2cd1-59ac-889f-dc9cfcaca919',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as GENUINE?$q$, $q$[{"text":"valuable","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"authentic","is_correct":true},{"text":"honest","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"fake","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$authentic$q$, $q$Genuine means "truly what it is said to be; authentic", so the closest word in meaning is authentic.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dfedf6fb-d57d-54ee-addc-1daafc97cb9b',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as FRAGILE?$q$, $q$[{"text":"valuable","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"thin","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"delicate","is_correct":true},{"text":"durable","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$delicate$q$, $q$Fragile means "easily broken or damaged", so the closest word in meaning is delicate.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5260bc27-e023-58d8-b46b-1e9182235211',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as OBSCURE?$q$, $q$[{"text":"distant","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"secret","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"obvious","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"unclear","is_correct":true}]$q$::jsonb, $q$unclear$q$, $q$Obscure means "not clearly understood or widely known", so the closest word in meaning is unclear.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b07e61e9-f129-5694-83b9-4b6b7582e355',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as LENIENT?$q$, $q$[{"text":"permissive","is_correct":true},{"text":"fair","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"kind","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"strict","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$permissive$q$, $q$Lenient means "more merciful or tolerant than expected; not strict", so the closest word in meaning is permissive.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('649e700a-2a42-5c8b-8d70-2ef0c6c0ccc2',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as NOVEL?$q$, $q$[{"text":"famous","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"original","is_correct":true},{"text":"book","is_correct":false,"misconception_token":"verbal-other-sense"},{"text":"familiar","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$original$q$, $q$Novel means "new and original; not seen before", so the closest word in meaning is original.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('02c7c9b3-b95a-5276-9b0b-7649b060c643',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as MEAGER?$q$, $q$[{"text":"cheap","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"thin","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"scanty","is_correct":true},{"text":"ample","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$scanty$q$, $q$Meager means "lacking in quantity; scanty", so the closest word in meaning is scanty.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b88ce73b-9b14-58d6-86cb-104fe7fc69da',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as CANDID?$q$, $q$[{"text":"polite","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"confident","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"evasive","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"frank","is_correct":true}]$q$::jsonb, $q$frank$q$, $q$Candid means "honest and straightforward in speech", so the closest word in meaning is frank.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('08b4bb5d-8946-561c-bfd2-0078e5a1efd7',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as VIGOROUS?$q$, $q$[{"text":"energetic","is_correct":true},{"text":"muscular","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"healthy","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"feeble","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$energetic$q$, $q$Vigorous means "strong, healthy, and full of energy", so the closest word in meaning is energetic.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5e02e5d9-fc25-59d7-b432-4eaacd2e1dfe',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as AUSTERE?$q$, $q$[{"text":"ancient","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"severe","is_correct":true},{"text":"serious","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"lavish","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$severe$q$, $q$Austere means "severe or strict; plain and without comfort", so the closest word in meaning is severe.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9a0a6cb3-7898-5ab9-a93e-173759ace594',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as BENEVOLENT?$q$, $q$[{"text":"wealthy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"gentle","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"kindhearted","is_correct":true},{"text":"malicious","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$kindhearted$q$, $q$Benevolent means "kind and wishing to do good for others", so the closest word in meaning is kindhearted.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a2bdcc49-c274-5b8a-9abf-c28945e2779a',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as CRYPTIC?$q$, $q$[{"text":"ancient","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"secret","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"plain","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"mysterious","is_correct":true}]$q$::jsonb, $q$mysterious$q$, $q$Cryptic means "having a hidden meaning; mysterious", so the closest word in meaning is mysterious.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9fbc3471-40dc-5a19-be5a-f305f603e57a',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as DEFT?$q$, $q$[{"text":"skillful","is_correct":true},{"text":"strong","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"fast","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"clumsy","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$skillful$q$, $q$Deft means "quick and skillful in movement", so the closest word in meaning is skillful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e5413b19-f978-5818-9004-e98e280a7211',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as ELATED?$q$, $q$[{"text":"surprised","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"overjoyed","is_correct":true},{"text":"proud","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"dejected","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$overjoyed$q$, $q$Elated means "extremely happy and excited", so the closest word in meaning is overjoyed.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('06747c4e-b872-554b-9ab9-b0cac55cc9aa',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as FRUGAL?$q$, $q$[{"text":"cheap","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"poor","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"thrifty","is_correct":true},{"text":"wasteful","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$thrifty$q$, $q$Frugal means "careful and sparing with money", so the closest word in meaning is thrifty.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('df0a7886-b586-50fb-8ae1-3c051e332c3a',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as GREGARIOUS?$q$, $q$[{"text":"talkative","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"popular","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"reclusive","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"sociable","is_correct":true}]$q$::jsonb, $q$sociable$q$, $q$Gregarious means "fond of company; sociable", so the closest word in meaning is sociable.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('80b46fa4-bb05-5d20-96a9-b36d5e6a091a',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as IMPARTIAL?$q$, $q$[{"text":"unbiased","is_correct":true},{"text":"calm","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"honest","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"prejudiced","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$unbiased$q$, $q$Impartial means "treating all sides equally; unbiased", so the closest word in meaning is unbiased.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3cb74367-409c-5da7-a68e-1a6dd4468ac4',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as LACONIC?$q$, $q$[{"text":"rude","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"terse","is_correct":true},{"text":"quiet","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"verbose","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$terse$q$, $q$Laconic means "using very few words", so the closest word in meaning is terse.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bb3c9c64-7f25-507d-a2c4-ed926f016b2f',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as MUNDANE?$q$, $q$[{"text":"worldly","is_correct":false,"misconception_token":"verbal-other-sense"},{"text":"boring","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"ordinary","is_correct":true},{"text":"extraordinary","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$ordinary$q$, $q$Mundane means "lacking interest or excitement; ordinary", so the closest word in meaning is ordinary.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('910b0615-a2e4-5882-912c-baba9c228999',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as OBSTINATE?$q$, $q$[{"text":"strong","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"confident","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"compliant","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"stubborn","is_correct":true}]$q$::jsonb, $q$stubborn$q$, $q$Obstinate means "stubbornly refusing to change one’s mind", so the closest word in meaning is stubborn.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('28f652e6-27f4-5b8d-9b7a-3ffadb831847',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as PLACATE?$q$, $q$[{"text":"appease","is_correct":true},{"text":"ignore","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"praise","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"provoke","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$appease$q$, $q$Placate means "to make someone less angry; to soothe", so the closest word in meaning is appease.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('67505337-7622-50f5-9555-529ab0981a96',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as PRUDENT?$q$, $q$[{"text":"quiet","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"cautious","is_correct":true},{"text":"intelligent","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"reckless","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$cautious$q$, $q$Prudent means "acting with care and thought for the future", so the closest word in meaning is cautious.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f4d14397-8b78-5a61-a0f1-f701b13889bd',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as RESILIENT?$q$, $q$[{"text":"strong","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"flexible","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"hardy","is_correct":true},{"text":"fragile","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$hardy$q$, $q$Resilient means "able to recover quickly from difficulty; tough", so the closest word in meaning is hardy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('41fba480-df2d-5b90-97b5-ff6e2bd09882',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as SQUANDER?$q$, $q$[{"text":"misplace","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"spend","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"conserve","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"waste","is_correct":true}]$q$::jsonb, $q$waste$q$, $q$Squander means "to waste something valuable carelessly", so the closest word in meaning is waste.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d321adf6-81de-574a-a187-411f2540b722',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as WARY?$q$, $q$[{"text":"cautious","is_correct":true},{"text":"weary","is_correct":false,"misconception_token":"verbal-soundalike"},{"text":"nervous","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"trusting","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$cautious$q$, $q$Wary means "feeling caution about possible danger", so the closest word in meaning is cautious.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- prep-antonyms (Antonyms) — 48 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e77de08f-e3cf-561d-bcf4-f02e56fe7e35',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of ABUNDANT?$q$, $q$[{"text":"ample","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"scarce","is_correct":true},{"text":"costly","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"modest","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$scarce$q$, $q$Abundant means "existing in large amounts; plentiful", so the word that means the opposite is scarce.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8db2a860-239d-580e-8f06-ae25b722ad3a',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of BRAVE?$q$, $q$[{"text":"fearless","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"reckless","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"cowardly","is_correct":true},{"text":"timid","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$cowardly$q$, $q$Brave means "showing courage in the face of danger", so the word that means the opposite is cowardly.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e1646d84-539c-5a2d-becb-026a20f3ec71',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of CALM?$q$, $q$[{"text":"serene","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"bored","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"restless","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"frantic","is_correct":true}]$q$::jsonb, $q$frantic$q$, $q$Calm means "free from excitement or disturbance; peaceful", so the word that means the opposite is frantic.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bfca6dea-30cf-59d3-9375-e2eae02d3b0e',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of BEGIN?$q$, $q$[{"text":"conclude","is_correct":true},{"text":"start","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"continue","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"pause","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$conclude$q$, $q$Begin means "to start doing something", so the word that means the opposite is conclude.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b5a0ddf0-0ed8-5728-81c6-07041621d19a',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of HUGE?$q$, $q$[{"text":"massive","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"tiny","is_correct":true},{"text":"wide","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"small","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$tiny$q$, $q$Huge means "extremely large in size", so the word that means the opposite is tiny.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('02e65fb7-bb7d-5fbb-9a42-660e0e9af884',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of HAPPY?$q$, $q$[{"text":"joyful","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"miserable","is_correct":true},{"text":"gloomy","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$miserable$q$, $q$Happy means "feeling or showing pleasure", so the word that means the opposite is miserable.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a0ea4327-4c0d-5c66-ac85-9fb3866d4baf',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of QUICK?$q$, $q$[{"text":"swift","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"early","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"slow","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"sluggish","is_correct":true}]$q$::jsonb, $q$sluggish$q$, $q$Quick means "moving or happening fast", so the word that means the opposite is sluggish.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5d1580aa-1c36-573f-b7f8-10025d0d1ffc',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of HONEST?$q$, $q$[{"text":"deceitful","is_correct":true},{"text":"sincere","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"rude","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"secretive","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$deceitful$q$, $q$Honest means "truthful and sincere", so the word that means the opposite is deceitful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1604f960-1869-53a9-bf34-fef83ff778f2',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of ANCIENT?$q$, $q$[{"text":"antique","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"modern","is_correct":true},{"text":"ruined","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"recent","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$modern$q$, $q$Ancient means "belonging to the very distant past; very old", so the word that means the opposite is modern.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f8071c5f-0567-5c96-bb5d-e5087f29ac11',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of BOLD?$q$, $q$[{"text":"fearless","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"rude","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"timid","is_correct":true},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$timid$q$, $q$Bold means "willing to take risks; confident and daring", so the word that means the opposite is timid.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1de8e352-e285-5785-b25b-b77d168bf23d',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of GATHER?$q$, $q$[{"text":"assemble","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"store","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"spread","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"scatter","is_correct":true}]$q$::jsonb, $q$scatter$q$, $q$Gather means "to bring or come together in one place", so the word that means the opposite is scatter.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('db97276e-28ee-539c-872d-10c6082632e7',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of WEALTHY?$q$, $q$[{"text":"destitute","is_correct":true},{"text":"rich","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"greedy","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"needy","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$destitute$q$, $q$Wealthy means "having a great deal of money; rich", so the word that means the opposite is destitute.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dd2c1987-ac15-5f4a-83d9-2ed1016dc455',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of SIMPLE?$q$, $q$[{"text":"easy","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"complicated","is_correct":true},{"text":"boring","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"confusing","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$complicated$q$, $q$Simple means "easily understood; not complicated", so the word that means the opposite is complicated.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fe903bde-b028-5f30-833c-803960ebee78',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of REVEAL?$q$, $q$[{"text":"expose","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"display","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"conceal","is_correct":true},{"text":"guard","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$conceal$q$, $q$Reveal means "to make something known; to show", so the word that means the opposite is conceal.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('609b839a-6bd1-59bd-bffd-ab738f98f1ce',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of STURDY?$q$, $q$[{"text":"solid","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"bulky","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"weak","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"flimsy","is_correct":true}]$q$::jsonb, $q$flimsy$q$, $q$Sturdy means "strongly built; not easily broken", so the word that means the opposite is flimsy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('57ec2e94-71e4-5764-804c-78fc4e778f6d',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of PRAISE?$q$, $q$[{"text":"criticize","is_correct":true},{"text":"applaud","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"notice","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"blame","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$criticize$q$, $q$Praise means "to express approval or admiration", so the word that means the opposite is criticize.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c811c5c1-7d91-57ed-8765-c0a7134348e9',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of RELUCTANT?$q$, $q$[{"text":"unwilling","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"eager","is_correct":true},{"text":"careful","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"willing","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$eager$q$, $q$Reluctant means "unwilling and hesitant", so the word that means the opposite is eager.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('de8236f3-fae0-5613-a53f-4529f88bd834',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of DILIGENT?$q$, $q$[{"text":"hardworking","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"busy","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"lazy","is_correct":true},{"text":"careless","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$lazy$q$, $q$Diligent means "showing careful, steady effort; hardworking", so the word that means the opposite is lazy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b971f925-4feb-53c6-93a8-13cf939a6990',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of HOSTILE?$q$, $q$[{"text":"aggressive","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"rude","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"neutral","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"friendly","is_correct":true}]$q$::jsonb, $q$friendly$q$, $q$Hostile means "unfriendly and aggressive", so the word that means the opposite is friendly.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('935f7498-51ed-50b8-99e7-8a42a0733ff2',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of VIVID?$q$, $q$[{"text":"dull","is_correct":true},{"text":"bright","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"shiny","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"faint","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$dull$q$, $q$Vivid means "producing bright, clear images in the mind", so the word that means the opposite is dull.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fd9b7e2f-9c77-565f-8099-c0101d2cc9d5',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of SCARCE?$q$, $q$[{"text":"rare","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"plentiful","is_correct":true},{"text":"cheap","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"common","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$plentiful$q$, $q$Scarce means "in short supply; hard to find", so the word that means the opposite is plentiful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f8016bfe-90dd-53f5-973f-c0abdb489ff7',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of TRANQUIL?$q$, $q$[{"text":"peaceful","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"boring","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"turbulent","is_correct":true},{"text":"chaotic","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$turbulent$q$, $q$Tranquil means "calm and peaceful", so the word that means the opposite is turbulent.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('eec9512e-6d6f-5e20-9f3f-a6c15ac441b8',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of CONCISE?$q$, $q$[{"text":"brief","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"simple","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"lengthy","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"rambling","is_correct":true}]$q$::jsonb, $q$rambling$q$, $q$Concise means "giving a lot of information in few words", so the word that means the opposite is rambling.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f5515bd7-3aaa-5bc0-be09-bd7377d30cc7',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of ARROGANT?$q$, $q$[{"text":"humble","is_correct":true},{"text":"conceited","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"rude","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"modest","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$humble$q$, $q$Arrogant means "having an exaggerated sense of one’s own importance", so the word that means the opposite is humble.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1c94a05f-4858-59df-a701-ea3bded4d6e7',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of GENUINE?$q$, $q$[{"text":"real","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"fake","is_correct":true},{"text":"cheap","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"artificial","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$fake$q$, $q$Genuine means "truly what it is said to be; authentic", so the word that means the opposite is fake.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('69b1ec00-8c5f-570b-b2db-87dbaff7357d',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of FRAGILE?$q$, $q$[{"text":"brittle","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"light","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"durable","is_correct":true},{"text":"sturdy","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$durable$q$, $q$Fragile means "easily broken or damaged", so the word that means the opposite is durable.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8d1b1727-01e4-51f6-a509-b2056d8871e9',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of OBSCURE?$q$, $q$[{"text":"vague","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"hidden","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"clear","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"obvious","is_correct":true}]$q$::jsonb, $q$obvious$q$, $q$Obscure means "not clearly understood or widely known", so the word that means the opposite is obvious.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('31c9556c-a140-513e-b1e5-7114a80ccc61',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of LENIENT?$q$, $q$[{"text":"strict","is_correct":true},{"text":"easygoing","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"generous","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"firm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$strict$q$, $q$Lenient means "more merciful or tolerant than expected; not strict", so the word that means the opposite is strict.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('af78619a-2f92-51c7-9409-0e2aaa847156',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of NOVEL?$q$, $q$[{"text":"new","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"familiar","is_correct":true},{"text":"modern","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"ordinary","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$familiar$q$, $q$Novel means "new and original; not seen before", so the word that means the opposite is familiar.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8801a50c-d1a5-5051-9e50-232bb22f24da',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of MEAGER?$q$, $q$[{"text":"scant","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"poor","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"ample","is_correct":true},{"text":"sufficient","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$ample$q$, $q$Meager means "lacking in quantity; scanty", so the word that means the opposite is ample.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ad335256-2432-5e77-9f52-cbd48b71497f',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of CANDID?$q$, $q$[{"text":"honest","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"rude","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"secretive","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"evasive","is_correct":true}]$q$::jsonb, $q$evasive$q$, $q$Candid means "honest and straightforward in speech", so the word that means the opposite is evasive.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('76358bfe-da8e-524c-af73-e2d9d776a3e4',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of VIGOROUS?$q$, $q$[{"text":"feeble","is_correct":true},{"text":"lively","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"athletic","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"weak","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$feeble$q$, $q$Vigorous means "strong, healthy, and full of energy", so the word that means the opposite is feeble.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('abb157e9-fa89-584b-a5be-3f7153fe361b',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of AUSTERE?$q$, $q$[{"text":"strict","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"lavish","is_correct":true},{"text":"gloomy","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"fancy","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$lavish$q$, $q$Austere means "severe or strict; plain and without comfort", so the word that means the opposite is lavish.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('87bd1aa1-dcc7-55d1-ab1f-a6faa9e07fc7',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of BENEVOLENT?$q$, $q$[{"text":"generous","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"polite","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"malicious","is_correct":true},{"text":"cruel","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$malicious$q$, $q$Benevolent means "kind and wishing to do good for others", so the word that means the opposite is malicious.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('24cb9778-623f-5581-bd7f-7508622b3abe',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of CRYPTIC?$q$, $q$[{"text":"puzzling","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"hidden","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"clear","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"plain","is_correct":true}]$q$::jsonb, $q$plain$q$, $q$Cryptic means "having a hidden meaning; mysterious", so the word that means the opposite is plain.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f61559a4-7ac2-5813-a26b-3b0b33a7d55a',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of DEFT?$q$, $q$[{"text":"clumsy","is_correct":true},{"text":"nimble","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"careful","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"awkward","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$clumsy$q$, $q$Deft means "quick and skillful in movement", so the word that means the opposite is clumsy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dc2cf2c5-fbbf-5bdd-8ab5-f7fa39247f22',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of ELATED?$q$, $q$[{"text":"thrilled","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"dejected","is_correct":true},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"gloomy","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$dejected$q$, $q$Elated means "extremely happy and excited", so the word that means the opposite is dejected.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f4804eeb-b1ab-5a49-ad3c-8a917f347abe',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of FRUGAL?$q$, $q$[{"text":"economical","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"greedy","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"wasteful","is_correct":true},{"text":"extravagant","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$wasteful$q$, $q$Frugal means "careful and sparing with money", so the word that means the opposite is wasteful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0f5f7a29-ed61-5409-abfe-da565894c5ca',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of GREGARIOUS?$q$, $q$[{"text":"outgoing","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"friendly","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"shy","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"reclusive","is_correct":true}]$q$::jsonb, $q$reclusive$q$, $q$Gregarious means "fond of company; sociable", so the word that means the opposite is reclusive.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b8c7ea0b-1625-5baa-84fd-0d2ea9acfdce',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of IMPARTIAL?$q$, $q$[{"text":"prejudiced","is_correct":true},{"text":"neutral","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"strict","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"unfair","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$prejudiced$q$, $q$Impartial means "treating all sides equally; unbiased", so the word that means the opposite is prejudiced.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d93e084f-280c-5e85-adfe-52bbf3aa51a0',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of LACONIC?$q$, $q$[{"text":"brief","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"verbose","is_correct":true},{"text":"shy","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"wordy","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$verbose$q$, $q$Laconic means "using very few words", so the word that means the opposite is verbose.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1fbc83e5-ad42-584e-8fe1-cb98201b7047',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of MUNDANE?$q$, $q$[{"text":"commonplace","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"simple","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"extraordinary","is_correct":true},{"text":"remarkable","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$extraordinary$q$, $q$Mundane means "lacking interest or excitement; ordinary", so the word that means the opposite is extraordinary.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e6801ec5-9062-5a3d-a039-f4934e47c84f',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of OBSTINATE?$q$, $q$[{"text":"headstrong","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"rude","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"obedient","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"compliant","is_correct":true}]$q$::jsonb, $q$compliant$q$, $q$Obstinate means "stubbornly refusing to change one’s mind", so the word that means the opposite is compliant.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e56576d4-d177-5733-a6c6-f355014da23e',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of PLACATE?$q$, $q$[{"text":"provoke","is_correct":true},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"please","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"annoy","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$provoke$q$, $q$Placate means "to make someone less angry; to soothe", so the word that means the opposite is provoke.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('39276e57-1cc1-55e6-a2ab-56340571af35',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of PRUDENT?$q$, $q$[{"text":"careful","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"reckless","is_correct":true},{"text":"strict","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"careless","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$reckless$q$, $q$Prudent means "acting with care and thought for the future", so the word that means the opposite is reckless.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ec0a4aef-8238-5185-8b32-6962f527c58a',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of RESILIENT?$q$, $q$[{"text":"tough","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"healthy","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"fragile","is_correct":true},{"text":"delicate","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$fragile$q$, $q$Resilient means "able to recover quickly from difficulty; tough", so the word that means the opposite is fragile.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9bbc8dba-426a-53d7-a141-201eee529ecc',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of SQUANDER?$q$, $q$[{"text":"exhaust","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"donate","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"hoard","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"conserve","is_correct":true}]$q$::jsonb, $q$conserve$q$, $q$Squander means "to waste something valuable carelessly", so the word that means the opposite is conserve.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('af35ac7b-41d8-55d5-bd77-2e82d4097800',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of WARY?$q$, $q$[{"text":"trusting","is_correct":true},{"text":"careful","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"confident","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$trusting$q$, $q$Wary means "feeling caution about possible danger", so the word that means the opposite is trusting.$q$, 'published')
on conflict (id) do update set
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
