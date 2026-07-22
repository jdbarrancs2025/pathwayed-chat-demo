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

-- prep-synonyms (Synonyms) — 152 items
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
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ce71dfeb-198c-50ac-bdfc-8f6937151172',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as COURTEOUS?$q$, $q$[{"text":"formal","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"polite","is_correct":true},{"text":"gentle","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"rude","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$polite$q$, $q$Courteous means "polite and respectful in manner", so the closest word in meaning is polite.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1be3ad24-1cb1-5115-a7fb-33537d880591',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as WEARY?$q$, $q$[{"text":"bored","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"sleepy","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"tired","is_correct":true},{"text":"lively","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$tired$q$, $q$Weary means "feeling very tired", so the closest word in meaning is tired.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fe9f81be-ecbb-596d-82b2-a07c3074ac7d',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as VACANT?$q$, $q$[{"text":"open","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"bare","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"occupied","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"empty","is_correct":true}]$q$::jsonb, $q$empty$q$, $q$Vacant means "empty; not occupied", so the closest word in meaning is empty.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('df3548bf-ec27-5484-a80a-04cff6a651de',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as RIGID?$q$, $q$[{"text":"stiff","is_correct":true},{"text":"straight","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"firm","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"flexible","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$stiff$q$, $q$Rigid means "stiff and not able to bend", so the closest word in meaning is stiff.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7e90808c-b6d4-5b14-96e5-61668806ce73',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as PERMIT?$q$, $q$[{"text":"offer","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"allow","is_correct":true},{"text":"approve","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"forbid","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$allow$q$, $q$Permit means "to allow something to happen", so the closest word in meaning is allow.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cb1c2ff6-b37d-52d4-a203-4d9d8480957e',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as JOLLY?$q$, $q$[{"text":"funny","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"pleasant","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"merry","is_correct":true},{"text":"gloomy","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$merry$q$, $q$Jolly means "happy and cheerful", so the closest word in meaning is merry.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('281a8ea2-3555-56e3-9aac-cfb7901a910a',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as DROWSY?$q$, $q$[{"text":"lazy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"calm","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"alert","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"sleepy","is_correct":true}]$q$::jsonb, $q$sleepy$q$, $q$Drowsy means "sleepy and dull", so the closest word in meaning is sleepy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('66aa3435-7d93-56b6-9571-5cf59f26f283',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as MEND?$q$, $q$[{"text":"repair","is_correct":true},{"text":"build","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"patch","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"break","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$repair$q$, $q$Mend means "to fix something that is broken", so the closest word in meaning is repair.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fc58dd00-e9fa-56fe-b5de-836572640f47',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as ODD?$q$, $q$[{"text":"funny","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"strange","is_correct":true},{"text":"rare","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"ordinary","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$strange$q$, $q$Odd means "strange or unusual", so the closest word in meaning is strange.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('86ad956c-85e2-5d92-a24b-df36b5f9794c',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as BRISK?$q$, $q$[{"text":"busy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"sudden","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"lively","is_correct":true},{"text":"cold","is_correct":false,"misconception_token":"verbal-other-sense"}]$q$::jsonb, $q$lively$q$, $q$Brisk means "quick and lively", so the closest word in meaning is lively.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ab554c71-3ccf-58ee-b14d-3f2f49c5214c',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as STERN?$q$, $q$[{"text":"quiet","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"serious","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"lenient","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"strict","is_correct":true}]$q$::jsonb, $q$strict$q$, $q$Stern means "strict and serious", so the closest word in meaning is strict.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('49f28353-fc0e-56c4-8801-754ea50961dd',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as AMPLE?$q$, $q$[{"text":"plentiful","is_correct":true},{"text":"wide","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"large","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"scarce","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$plentiful$q$, $q$Ample means "more than enough; plentiful", so the closest word in meaning is plentiful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('204e4dbd-5b70-5a58-a157-e618ebe68513',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as SWIFT?$q$, $q$[{"text":"busy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"rapid","is_correct":true},{"text":"sudden","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"slow","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$rapid$q$, $q$Swift means "moving very fast", so the closest word in meaning is rapid.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2503d7c2-e56a-5436-b07c-ee1ab6bf1009',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as EARNEST?$q$, $q$[{"text":"polite","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"serious","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"sincere","is_correct":true},{"text":"insincere","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$sincere$q$, $q$Earnest means "serious and sincere", so the closest word in meaning is sincere.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c15d78cd-373a-5018-9e9a-e1d6b35263e3',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as RADIANT?$q$, $q$[{"text":"warm","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"bright","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"dull","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"glowing","is_correct":true}]$q$::jsonb, $q$glowing$q$, $q$Radiant means "shining brightly", so the closest word in meaning is glowing.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('958efb87-74e7-582c-8b60-f575f4b945ef',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as FEROCIOUS?$q$, $q$[{"text":"fierce","is_correct":true},{"text":"loud","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"wild","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"gentle","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$fierce$q$, $q$Ferocious means "savage and fierce", so the closest word in meaning is fierce.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cc6e8b29-997f-5389-8925-9e62baeed3fc',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as QUAINT?$q$, $q$[{"text":"rural","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"old-fashioned","is_correct":true},{"text":"charming","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"modern","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$old-fashioned$q$, $q$Quaint means "attractively old-fashioned", so the closest word in meaning is old-fashioned.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('02d0e910-91e4-5c38-8eab-c62c884337ba',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as WITHER?$q$, $q$[{"text":"fade","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"dry","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"shrivel","is_correct":true},{"text":"flourish","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$shrivel$q$, $q$Wither means "to dry up and shrivel", so the closest word in meaning is shrivel.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a78f905c-334f-5f0a-851f-40ada20349fc',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as TENACIOUS?$q$, $q$[{"text":"strong","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"firm","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"yielding","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"persistent","is_correct":true}]$q$::jsonb, $q$persistent$q$, $q$Tenacious means "holding on firmly; persistent", so the closest word in meaning is persistent.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('343bd0af-4af9-5979-9af7-34f67bcfbcca',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as VERBOSE?$q$, $q$[{"text":"wordy","is_correct":true},{"text":"loud","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"talkative","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"concise","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$wordy$q$, $q$Verbose means "using more words than needed", so the closest word in meaning is wordy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('28c17b6d-77d1-5a8a-a19e-1efd8963fbef',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as AMIABLE?$q$, $q$[{"text":"popular","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"friendly","is_correct":true},{"text":"pleasant","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"unfriendly","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$friendly$q$, $q$Amiable means "friendly and pleasant", so the closest word in meaning is friendly.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f0cc2a76-8b2e-55c5-8187-a7096641b812',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as METICULOUS?$q$, $q$[{"text":"slow","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"neat","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"careful","is_correct":true},{"text":"careless","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$careful$q$, $q$Meticulous means "very careful about small details", so the closest word in meaning is careful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ef53fb8a-7fa1-53a8-a7bf-081b72d2b5f6',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as SOMBER?$q$, $q$[{"text":"quiet","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"dark","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"cheerful","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"gloomy","is_correct":true}]$q$::jsonb, $q$gloomy$q$, $q$Somber means "dark and gloomy in mood", so the closest word in meaning is gloomy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('889ce776-6b66-5bd5-869e-cd141d1c1b71',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as DIMINISH?$q$, $q$[{"text":"decrease","is_correct":true},{"text":"weaken","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"shrink","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"increase","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$decrease$q$, $q$Diminish means "to make or become smaller", so the closest word in meaning is decrease.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2852cb86-36d6-554b-96c7-179e671a4893',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as BRAZEN?$q$, $q$[{"text":"loud","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"shameless","is_correct":true},{"text":"daring","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"timid","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$shameless$q$, $q$Brazen means "boldly disrespectful; shameless", so the closest word in meaning is shameless.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ba182bc7-a10f-5684-b833-de135eb3a3f3',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as TIDY?$q$, $q$[{"text":"organized","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"clean","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"neat","is_correct":true},{"text":"messy","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$neat$q$, $q$Tidy means "neat and in order", so the closest word in meaning is neat.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ef5b1b8d-78f1-5af8-bf1b-7c872e2caf2f',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as DAMP?$q$, $q$[{"text":"cold","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"wet","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"dry","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"moist","is_correct":true}]$q$::jsonb, $q$moist$q$, $q$Damp means "slightly wet", so the closest word in meaning is moist.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d9ba8e2d-222c-505c-8570-331b140c7d98',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as GIGANTIC?$q$, $q$[{"text":"enormous","is_correct":true},{"text":"heavy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"tall","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"tiny","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$enormous$q$, $q$Gigantic means "extremely large", so the closest word in meaning is enormous.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8b1f369f-7fc3-5035-b92d-b1df55fef212',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as FEEBLE?$q$, $q$[{"text":"sick","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"weak","is_correct":true},{"text":"faint","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"strong","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$weak$q$, $q$Feeble means "lacking strength; weak", so the closest word in meaning is weak.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('00c14819-a454-5bb0-abec-03dabc4e0a0b',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as WICKED?$q$, $q$[{"text":"cruel","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"mean","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"evil","is_correct":true},{"text":"good","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$evil$q$, $q$Wicked means "evil or morally wrong", so the closest word in meaning is evil.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('de15b3cf-9e3c-50a0-999f-18c9b140267e',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as GRUMPY?$q$, $q$[{"text":"tired","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"angry","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"cheerful","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"irritable","is_correct":true}]$q$::jsonb, $q$irritable$q$, $q$Grumpy means "bad-tempered and irritable", so the closest word in meaning is irritable.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1532751b-985c-543b-b81e-5b9c01fd8c6c',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as LOYAL?$q$, $q$[{"text":"faithful","is_correct":true},{"text":"honest","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"devoted","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"disloyal","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$faithful$q$, $q$Loyal means "faithful and devoted", so the closest word in meaning is faithful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4fae91e8-99dd-5cc9-a1f2-c1c7a5a97359',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as CLUMSY?$q$, $q$[{"text":"slow","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"awkward","is_correct":true},{"text":"careless","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"graceful","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$awkward$q$, $q$Clumsy means "awkward in movement", so the closest word in meaning is awkward.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a3768426-b17b-5987-8782-004cae113b30',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as VAST?$q$, $q$[{"text":"heavy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"wide","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"immense","is_correct":true},{"text":"tiny","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$immense$q$, $q$Vast means "extremely large in area", so the closest word in meaning is immense.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('91eab9ce-df00-5304-b8a7-6d19f9c16329',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as SERENE?$q$, $q$[{"text":"sleepy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"turbulent","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"peaceful","is_correct":true}]$q$::jsonb, $q$peaceful$q$, $q$Serene means "calm and peaceful", so the closest word in meaning is peaceful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3617efcc-7ffd-5c89-8d2c-28c1331e292f',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as GRIM?$q$, $q$[{"text":"stern","is_correct":true},{"text":"serious","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"dark","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"cheerful","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$stern$q$, $q$Grim means "stern, forbidding, and gloomy", so the closest word in meaning is stern.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('726b2823-9136-5c6e-a8af-4d43cb7c2198',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as SLY?$q$, $q$[{"text":"quiet","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"cunning","is_correct":true},{"text":"clever","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"honest","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$cunning$q$, $q$Sly means "cunning and deceitful", so the closest word in meaning is cunning.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fd7938bd-30f8-5c7c-aac6-81aeba63c1fb',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as KEEN?$q$, $q$[{"text":"busy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"interested","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"eager","is_correct":true},{"text":"sharp","is_correct":false,"misconception_token":"verbal-other-sense"}]$q$::jsonb, $q$eager$q$, $q$Keen means "eager and enthusiastic", so the closest word in meaning is eager.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f82d0a7a-77e2-5d1c-b3f0-fe4905fc9194',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as DREARY?$q$, $q$[{"text":"gray","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"dull","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"cheerful","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"dismal","is_correct":true}]$q$::jsonb, $q$dismal$q$, $q$Dreary means "dull, bleak, and depressing", so the closest word in meaning is dismal.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('134fcdf6-80a6-572f-bcaf-8eaa9968828b',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as NIMBLE?$q$, $q$[{"text":"agile","is_correct":true},{"text":"thin","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"quick","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"clumsy","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$agile$q$, $q$Nimble means "quick and light in movement", so the closest word in meaning is agile.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5ea5443c-6eb1-5799-9b28-c798d8a5b15f',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as POTENT?$q$, $q$[{"text":"large","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"powerful","is_correct":true},{"text":"strong","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"weak","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$powerful$q$, $q$Potent means "having great power or strength", so the closest word in meaning is powerful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('75d256a4-5762-5dee-ab50-84444460a619',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as HOLLOW?$q$, $q$[{"text":"deep","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"bare","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"empty","is_correct":true},{"text":"solid","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$empty$q$, $q$Hollow means "having an empty space inside", so the closest word in meaning is empty.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dbd7c3a2-d87a-5564-a86c-c54a4c207af7',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as DWINDLE?$q$, $q$[{"text":"weaken","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"fade","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"grow","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"shrink","is_correct":true}]$q$::jsonb, $q$shrink$q$, $q$Dwindle means "to gradually grow smaller", so the closest word in meaning is shrink.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f11cc5a4-9f7b-5cee-8c75-1bea88b0e3d5',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as ELOQUENT?$q$, $q$[{"text":"articulate","is_correct":true},{"text":"loud","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"fluent","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"inarticulate","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$articulate$q$, $q$Eloquent means "fluent and persuasive in speech", so the closest word in meaning is articulate.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('35db3a26-c6f5-5e3b-8be8-41de4a23500d',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as ALOOF?$q$, $q$[{"text":"quiet","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"distant","is_correct":true},{"text":"cold","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"friendly","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$distant$q$, $q$Aloof means "distant and unfriendly", so the closest word in meaning is distant.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('630decfa-fe58-56b4-8954-009ec399c1ec',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as ZEALOUS?$q$, $q$[{"text":"busy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"eager","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"enthusiastic","is_correct":true},{"text":"indifferent","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$enthusiastic$q$, $q$Zealous means "full of eager enthusiasm", so the closest word in meaning is enthusiastic.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fb9f515e-025b-5804-a989-65f079ee01ce',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as SPARSE?$q$, $q$[{"text":"small","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"thin","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"dense","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"scanty","is_correct":true}]$q$::jsonb, $q$scanty$q$, $q$Sparse means "thinly spread; scanty", so the closest word in meaning is scanty.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ae8c5665-326c-53aa-a33b-8804a3bb39c1',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as ROBUST?$q$, $q$[{"text":"sturdy","is_correct":true},{"text":"large","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"healthy","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"frail","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$sturdy$q$, $q$Robust means "strong and healthy", so the closest word in meaning is sturdy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('00addc8a-c1fd-58ff-96e2-e0b26282792e',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as WILT?$q$, $q$[{"text":"bend","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"droop","is_correct":true},{"text":"fade","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"revive","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$droop$q$, $q$Wilt means "to droop and lose freshness", so the closest word in meaning is droop.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fea09fc4-059c-5fab-a16b-e732fb6a7672',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as SHREWD?$q$, $q$[{"text":"quiet","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"clever","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"astute","is_correct":true},{"text":"foolish","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$astute$q$, $q$Shrewd means "sharp in judgment; clever", so the closest word in meaning is astute.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ae5ab083-4658-5452-a0aa-2e6a55fee021',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as CLEVER?$q$, $q$[{"text":"quick","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"wise","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"foolish","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"smart","is_correct":true}]$q$::jsonb, $q$smart$q$, $q$Clever means "quick to understand; smart", so the closest word in meaning is smart.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('aab746e2-2137-5da7-a817-2f283a8c6f09',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as FILTHY?$q$, $q$[{"text":"dirty","is_correct":true},{"text":"smelly","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"muddy","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"clean","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$dirty$q$, $q$Filthy means "extremely dirty", so the closest word in meaning is dirty.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c9534a74-7a55-52cc-90ed-38d6a4061a88',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as BITTER?$q$, $q$[{"text":"spicy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"sour","is_correct":true},{"text":"sharp","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"sweet","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$sour$q$, $q$Bitter means "having a sharp, unpleasant taste", so the closest word in meaning is sour.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fc9d9594-9b3b-5fda-a307-8f19ca7ff61f',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as SHINY?$q$, $q$[{"text":"smooth","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"bright","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"glossy","is_correct":true},{"text":"dull","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$glossy$q$, $q$Shiny means "reflecting light; glossy", so the closest word in meaning is glossy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dc9199b4-7f2e-5899-8f98-e29f9bce3281',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as LOFTY?$q$, $q$[{"text":"wide","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"grand","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"low","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"high","is_correct":true}]$q$::jsonb, $q$high$q$, $q$Lofty means "very high or tall", so the closest word in meaning is high.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b3c67d01-f236-5eb7-90bf-80c8a5438e6f',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as ABSENT?$q$, $q$[{"text":"missing","is_correct":true},{"text":"late","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"gone","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"present","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$missing$q$, $q$Absent means "not present; missing", so the closest word in meaning is missing.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e843093a-420a-50ce-875b-9383dad02ba6',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as DENSE?$q$, $q$[{"text":"heavy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"thick","is_correct":true},{"text":"packed","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"sparse","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$thick$q$, $q$Dense means "closely packed together; thick", so the closest word in meaning is thick.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d1ddf546-53ff-5b8c-bdea-8636d079bcf7',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as FAIR?$q$, $q$[{"text":"kind","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"equal","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"just","is_correct":true},{"text":"unfair","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$just$q$, $q$Fair means "treating people equally; just", so the closest word in meaning is just.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3a95eaaa-811c-5d9c-93cb-a7cfae658b5e',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as GENTLE?$q$, $q$[{"text":"kind","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"soft","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"harsh","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"mild","is_correct":true}]$q$::jsonb, $q$mild$q$, $q$Gentle means "mild and kind; not harsh", so the closest word in meaning is mild.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('21a535e7-f240-58da-9c05-3fd98aff368b',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as VIBRANT?$q$, $q$[{"text":"lively","is_correct":true},{"text":"loud","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"bright","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"dull","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$lively$q$, $q$Vibrant means "full of energy and bright color", so the closest word in meaning is lively.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('70666d43-291a-516d-834e-259e2c579b00',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as CAUTIOUS?$q$, $q$[{"text":"slow","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"careful","is_correct":true},{"text":"alert","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"reckless","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$careful$q$, $q$Cautious means "careful to avoid danger", so the closest word in meaning is careful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('991fd927-f6db-5533-a432-00062231b5a9',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as BARREN?$q$, $q$[{"text":"dry","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"empty","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"bare","is_correct":true},{"text":"fertile","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$bare$q$, $q$Barren means "empty and unable to grow plants", so the closest word in meaning is bare.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('966a49dd-db98-5f83-bd48-973efc63194b',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as PONDER?$q$, $q$[{"text":"study","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"reflect","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"ignore","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"consider","is_correct":true}]$q$::jsonb, $q$consider$q$, $q$Ponder means "to think about carefully", so the closest word in meaning is consider.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('02957c74-9de5-5c16-b225-191011e4ebf7',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as VAGUE?$q$, $q$[{"text":"unclear","is_correct":true},{"text":"dim","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"fuzzy","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"clear","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$unclear$q$, $q$Vague means "not clearly expressed or understood", so the closest word in meaning is unclear.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1e708736-bce5-5076-8dd2-0fed9f2ff34c',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as RASH?$q$, $q$[{"text":"quick","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"reckless","is_correct":true},{"text":"bold","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"cautious","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$reckless$q$, $q$Rash means "acting without careful thought", so the closest word in meaning is reckless.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('15e0bc97-4fdb-513c-bc65-ca6aa20aa670',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as HUMBLE?$q$, $q$[{"text":"quiet","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"gentle","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"modest","is_correct":true},{"text":"arrogant","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$modest$q$, $q$Humble means "modest; not proud", so the closest word in meaning is modest.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fd00b84e-f330-5295-b877-e07161bf50cf',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as STOUT?$q$, $q$[{"text":"strong","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"heavy","is_correct":false,"misconception_token":"verbal-other-sense"},{"text":"frail","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"sturdy","is_correct":true}]$q$::jsonb, $q$sturdy$q$, $q$Stout means "strong and solidly built", so the closest word in meaning is sturdy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('84a080ee-abf9-5d02-9dd1-e53898504a50',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as GAUNT?$q$, $q$[{"text":"bony","is_correct":true},{"text":"pale","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"thin","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"plump","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$bony$q$, $q$Gaunt means "thin and bony, as from hunger", so the closest word in meaning is bony.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b3977907-0657-505a-b335-42169f941234',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as OMINOUS?$q$, $q$[{"text":"cloudy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"threatening","is_correct":true},{"text":"dark","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"reassuring","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$threatening$q$, $q$Ominous means "suggesting that trouble is coming", so the closest word in meaning is threatening.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('72fc30bf-8cb6-5c1d-90c3-af8722477bb2',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as FERVENT?$q$, $q$[{"text":"loud","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"warm","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"passionate","is_correct":true},{"text":"indifferent","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$passionate$q$, $q$Fervent means "having intense, passionate feeling", so the closest word in meaning is passionate.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('143cb1d8-557e-5aa1-bbb5-4805e296eb82',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as PALLID?$q$, $q$[{"text":"sick","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"faint","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"rosy","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"pale","is_correct":true}]$q$::jsonb, $q$pale$q$, $q$Pallid means "pale, especially from illness", so the closest word in meaning is pale.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a864a30d-9654-50e2-8f9a-5b3bc296665e',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as OPULENT?$q$, $q$[{"text":"lavish","is_correct":true},{"text":"large","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"fancy","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"plain","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$lavish$q$, $q$Opulent means "rich and luxurious", so the closest word in meaning is lavish.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('249a7764-58c5-5f32-85e6-95c907a89d2a',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as SCORN?$q$, $q$[{"text":"mock","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"despise","is_correct":true},{"text":"dislike","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"admire","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$despise$q$, $q$Scorn means "to look down on with contempt", so the closest word in meaning is despise.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d6ba5268-127f-5286-978b-d50e0e0860c9',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as FICKLE?$q$, $q$[{"text":"quick","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"moody","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"changeable","is_correct":true},{"text":"steady","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$changeable$q$, $q$Fickle means "changing often; not constant", so the closest word in meaning is changeable.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ef0e9202-917a-5c8c-b167-7139e7e94f16',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as ADEPT?$q$, $q$[{"text":"smart","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"quick","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"inept","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"skilled","is_correct":true}]$q$::jsonb, $q$skilled$q$, $q$Adept means "very skilled at something", so the closest word in meaning is skilled.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7bf2ba27-a538-53c1-a7a0-031fe671cac1',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as COPIOUS?$q$, $q$[{"text":"abundant","is_correct":true},{"text":"wide","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"large","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"scarce","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$abundant$q$, $q$Copious means "present in large amounts; abundant", so the closest word in meaning is abundant.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5a7f2e48-dad8-5ccf-82f0-ecaaffda528d',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as ROUGH?$q$, $q$[{"text":"hard","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"coarse","is_correct":true},{"text":"bumpy","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"smooth","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$coarse$q$, $q$Rough means "having an uneven surface; coarse", so the closest word in meaning is coarse.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3732b0fe-5d8e-506e-acab-ecd7a9773130',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as RARE?$q$, $q$[{"text":"valuable","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"special","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"uncommon","is_correct":true},{"text":"common","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$uncommon$q$, $q$Rare means "not found often; uncommon", so the closest word in meaning is uncommon.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1a0a89b7-8d6d-5e7e-a1a7-5c3fb8e76af2',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as BRIEF?$q$, $q$[{"text":"small","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"quick","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"lengthy","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"short","is_correct":true}]$q$::jsonb, $q$short$q$, $q$Brief means "lasting only a short time", so the closest word in meaning is short.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ac515484-e44c-5872-86ab-5bc9b9f9c56c',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as MIGHTY?$q$, $q$[{"text":"powerful","is_correct":true},{"text":"large","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"strong","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"weak","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$powerful$q$, $q$Mighty means "having great power or strength", so the closest word in meaning is powerful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dc8c625e-9405-5aeb-8d28-43d113834183',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as NARROW?$q$, $q$[{"text":"long","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"thin","is_correct":true},{"text":"tight","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"wide","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$thin$q$, $q$Narrow means "small in width", so the closest word in meaning is thin.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('68517771-9bbf-573d-8857-aa8a064651aa',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as SHY?$q$, $q$[{"text":"quiet","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"nervous","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"timid","is_correct":true},{"text":"bold","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$timid$q$, $q$Shy means "nervous in the company of others; timid", so the closest word in meaning is timid.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('643172bd-a1e6-5e65-b118-4f1a9222a070',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as FRESH?$q$, $q$[{"text":"cool","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"clean","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"stale","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"new","is_correct":true}]$q$::jsonb, $q$new$q$, $q$Fresh means "recently made or obtained; not stale", so the closest word in meaning is new.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ed237e46-fcdd-5529-acf0-51ea931bd28d',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as STEEP?$q$, $q$[{"text":"sheer","is_correct":true},{"text":"tall","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"high","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"gentle","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$sheer$q$, $q$Steep means "rising or falling sharply", so the closest word in meaning is sheer.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ba1f5952-7af7-5cda-9071-2de30805e33f',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'easy',
   $q$Which word means most nearly the SAME as LOUD?$q$, $q$[{"text":"busy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"noisy","is_correct":true},{"text":"harsh","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$noisy$q$, $q$Loud means "making a lot of noise", so the closest word in meaning is noisy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7e1eff49-fbb3-5843-8e6b-70bb92476217',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as SOLEMN?$q$, $q$[{"text":"quiet","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"grave","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"serious","is_correct":true},{"text":"cheerful","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$serious$q$, $q$Solemn means "formal and serious", so the closest word in meaning is serious.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('508f0e7c-867c-555a-8999-e5b3cb223aa1',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as ABSURD?$q$, $q$[{"text":"funny","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"silly","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"sensible","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"ridiculous","is_correct":true}]$q$::jsonb, $q$ridiculous$q$, $q$Absurd means "wildly unreasonable; ridiculous", so the closest word in meaning is ridiculous.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bcb6c768-bd6e-55e1-b43a-ffa79c7cfe4e',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as CRAFTY?$q$, $q$[{"text":"cunning","is_correct":true},{"text":"quiet","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"clever","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"honest","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$cunning$q$, $q$Crafty means "clever in a sly way", so the closest word in meaning is cunning.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5d87a62b-8f24-5e15-a45d-3db9f14b3c49',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as DAINTY?$q$, $q$[{"text":"pretty","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"delicate","is_correct":true},{"text":"small","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"clumsy","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$delicate$q$, $q$Dainty means "small and delicately pretty", so the closest word in meaning is delicate.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('23c33da2-cba3-5ec3-a31e-3b23432376a1',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as GRUFF?$q$, $q$[{"text":"loud","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"blunt","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"rude","is_correct":true},{"text":"gentle","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$rude$q$, $q$Gruff means "rough and abrupt in manner", so the closest word in meaning is rude.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3e7d26d7-b16e-56c8-a02f-fd602d3b3381',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as PLACID?$q$, $q$[{"text":"sleepy","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"stormy","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"calm","is_correct":true}]$q$::jsonb, $q$calm$q$, $q$Placid means "calm and peaceful", so the closest word in meaning is calm.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('addbbf12-291b-5b66-b510-c1f6189d5e08',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as RUGGED?$q$, $q$[{"text":"rocky","is_correct":true},{"text":"strong","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"harsh","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"smooth","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$rocky$q$, $q$Rugged means "rough and uneven; rocky", so the closest word in meaning is rocky.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e80b7378-0eff-5ee5-9fdb-43ac14f0ea14',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as WITTY?$q$, $q$[{"text":"quick","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"clever","is_correct":true},{"text":"funny","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"dull","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$clever$q$, $q$Witty means "clever and amusing with words", so the closest word in meaning is clever.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e8a86c21-2d49-5860-be88-01445b96a212',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as MEEK?$q$, $q$[{"text":"quiet","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"gentle","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"submissive","is_correct":true},{"text":"bold","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$submissive$q$, $q$Meek means "quiet, gentle, and easily led", so the closest word in meaning is submissive.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2cb448a7-dad0-5100-a691-d647530c39ba',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'medium',
   $q$Which word means most nearly the SAME as JOVIAL?$q$, $q$[{"text":"funny","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"merry","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"gloomy","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"cheerful","is_correct":true}]$q$::jsonb, $q$cheerful$q$, $q$Jovial means "cheerful and good-humored", so the closest word in meaning is cheerful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('88692b10-6bcd-5e6b-8407-46cab0bf6f8e',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as PRODIGAL?$q$, $q$[{"text":"wasteful","is_correct":true},{"text":"rich","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"lavish","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"thrifty","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$wasteful$q$, $q$Prodigal means "wastefully extravagant", so the closest word in meaning is wasteful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f8e529a2-e8da-5a1f-8dd6-d7ec436a8163',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as NEFARIOUS?$q$, $q$[{"text":"sneaky","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"wicked","is_correct":true},{"text":"evil","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"virtuous","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$wicked$q$, $q$Nefarious means "extremely wicked or evil", so the closest word in meaning is wicked.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('34ad7886-af63-5745-a990-5d2b1f2a9979',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as AFFABLE?$q$, $q$[{"text":"popular","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"pleasant","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"friendly","is_correct":true},{"text":"unfriendly","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$friendly$q$, $q$Affable means "good-natured and easy to talk to", so the closest word in meaning is friendly.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1a4c9ce2-e7c8-5c16-a227-40a34327896f',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as SUCCINCT?$q$, $q$[{"text":"polite","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"clear","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"wordy","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"concise","is_correct":true}]$q$::jsonb, $q$concise$q$, $q$Succinct means "briefly and clearly expressed", so the closest word in meaning is concise.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cefc3eae-0a67-5867-a09a-7ecfe4dfbbe6',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as INDOLENT?$q$, $q$[{"text":"lazy","is_correct":true},{"text":"slow","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"idle","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"diligent","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$lazy$q$, $q$Indolent means "wanting to avoid work; lazy", so the closest word in meaning is lazy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('eed60d08-89a1-5e56-85c1-a697746d0097',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as CORDIAL?$q$, $q$[{"text":"formal","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"warm","is_correct":true},{"text":"polite","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"cold","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$warm$q$, $q$Cordial means "warm and friendly", so the closest word in meaning is warm.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2ed54f47-60d6-5b9a-8acb-a35ff6ed16f7',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as RESOLUTE?$q$, $q$[{"text":"strong","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"firm","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"determined","is_correct":true},{"text":"hesitant","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$determined$q$, $q$Resolute means "firmly determined", so the closest word in meaning is determined.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2b862867-52e4-5e7a-8dc7-a15a66457c5d',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as VEX?$q$, $q$[{"text":"tease","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"bother","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"soothe","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"},{"text":"annoy","is_correct":true}]$q$::jsonb, $q$annoy$q$, $q$Vex means "to annoy or irritate", so the closest word in meaning is annoy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a0bd3103-75cb-5571-b32c-e0a4dc8334ba',
   null,
   (select id from public.skills where slug = 'prep-synonyms'),
   null, 'hard',
   $q$Which word means most nearly the SAME as AUDACIOUS?$q$, $q$[{"text":"daring","is_correct":true},{"text":"loud","is_correct":false,"misconception_token":"verbal-same-topic-not-meaning"},{"text":"brave","is_correct":false,"misconception_token":"verbal-near-miss-shade"},{"text":"timid","is_correct":false,"misconception_token":"verbal-opposite-not-synonym"}]$q$::jsonb, $q$daring$q$, $q$Audacious means "showing a bold willingness to take risks", so the closest word in meaning is daring.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;

-- prep-antonyms (Antonyms) — 152 items
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
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4746cd2f-581b-58ee-a5c8-cd5ea91e3435',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of COURTEOUS?$q$, $q$[{"text":"gracious","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"rude","is_correct":true},{"text":"shy","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"blunt","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$rude$q$, $q$Courteous means "polite and respectful in manner", so the word that means the opposite is rude.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('107e2845-4b94-57ab-bbb1-eb52958277f5',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of WEARY?$q$, $q$[{"text":"exhausted","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"busy","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"energetic","is_correct":true},{"text":"awake","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$energetic$q$, $q$Weary means "feeling very tired", so the word that means the opposite is energetic.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7620e97c-298d-5d99-bfe2-1e6ca89d8030',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of VACANT?$q$, $q$[{"text":"unfilled","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"used","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"occupied","is_correct":true}]$q$::jsonb, $q$occupied$q$, $q$Vacant means "empty; not occupied", so the word that means the opposite is occupied.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('397982c1-724f-5954-b3b3-ae9678a3a44a',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of RIGID?$q$, $q$[{"text":"flexible","is_correct":true},{"text":"inflexible","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"hard","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"loose","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$flexible$q$, $q$Rigid means "stiff and not able to bend", so the word that means the opposite is flexible.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('75dc6b65-7fdc-53d6-b170-6087217792ed',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of PERMIT?$q$, $q$[{"text":"let","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"forbid","is_correct":true},{"text":"invite","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"limit","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$forbid$q$, $q$Permit means "to allow something to happen", so the word that means the opposite is forbid.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('01792a0c-38a7-5d4b-8e69-4a7da7f4855e',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of JOLLY?$q$, $q$[{"text":"cheerful","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"loud","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"gloomy","is_correct":true},{"text":"serious","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$gloomy$q$, $q$Jolly means "happy and cheerful", so the word that means the opposite is gloomy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f5624d1a-5b4a-5b3f-befa-e0a073ccd1c0',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of DROWSY?$q$, $q$[{"text":"tired","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"bored","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"slow","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"alert","is_correct":true}]$q$::jsonb, $q$alert$q$, $q$Drowsy means "sleepy and dull", so the word that means the opposite is alert.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2a2d4f6e-7927-593e-ad47-44e79c0f4865',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of MEND?$q$, $q$[{"text":"break","is_correct":true},{"text":"fix","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"clean","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"bend","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$break$q$, $q$Mend means "to fix something that is broken", so the word that means the opposite is break.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6c642870-f39d-5a26-8a05-8695f85226cd',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of ODD?$q$, $q$[{"text":"unusual","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"ordinary","is_correct":true},{"text":"wrong","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"plain","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$ordinary$q$, $q$Odd means "strange or unusual", so the word that means the opposite is ordinary.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('05b73fd0-73c0-5d5c-9ee6-12c27e84e06e',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of BRISK?$q$, $q$[{"text":"swift","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"sharp","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"sluggish","is_correct":true},{"text":"gentle","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$sluggish$q$, $q$Brisk means "quick and lively", so the word that means the opposite is sluggish.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('060a9e27-522f-5459-8318-1ff110780cdb',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of STERN?$q$, $q$[{"text":"harsh","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"formal","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"gentle","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"lenient","is_correct":true}]$q$::jsonb, $q$lenient$q$, $q$Stern means "strict and serious", so the word that means the opposite is lenient.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e8edbc44-d854-51e4-9f70-f6da50cc27ba',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of AMPLE?$q$, $q$[{"text":"scarce","is_correct":true},{"text":"abundant","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"big","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"modest","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$scarce$q$, $q$Ample means "more than enough; plentiful", so the word that means the opposite is scarce.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a3de352f-4a20-532e-896a-455675947aa2',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of SWIFT?$q$, $q$[{"text":"quick","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"slow","is_correct":true},{"text":"early","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"steady","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$slow$q$, $q$Swift means "moving very fast", so the word that means the opposite is slow.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c1c5058d-992d-525a-acc4-9827cc292222',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of EARNEST?$q$, $q$[{"text":"genuine","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"insincere","is_correct":true},{"text":"playful","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$insincere$q$, $q$Earnest means "serious and sincere", so the word that means the opposite is insincere.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('332a47ff-e042-56a0-9cb2-78596575b870',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of RADIANT?$q$, $q$[{"text":"shining","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"sunny","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"faded","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"dull","is_correct":true}]$q$::jsonb, $q$dull$q$, $q$Radiant means "shining brightly", so the word that means the opposite is dull.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5643e00c-32b1-5c10-9718-be08542d0ce2',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of FEROCIOUS?$q$, $q$[{"text":"gentle","is_correct":true},{"text":"savage","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"angry","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$gentle$q$, $q$Ferocious means "savage and fierce", so the word that means the opposite is gentle.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bac0a612-cb05-5b54-b034-5db5781bce38',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of QUAINT?$q$, $q$[{"text":"antique","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"modern","is_correct":true},{"text":"cozy","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"stylish","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$modern$q$, $q$Quaint means "attractively old-fashioned", so the word that means the opposite is modern.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('42fbe8b7-e5b3-5f01-89ff-777e098984f3',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of WITHER?$q$, $q$[{"text":"shrink","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"droop","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"flourish","is_correct":true},{"text":"sprout","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$flourish$q$, $q$Wither means "to dry up and shrivel", so the word that means the opposite is flourish.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('15cee570-8ec0-5646-b798-c819cfeec002',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of TENACIOUS?$q$, $q$[{"text":"determined","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"harsh","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"gentle","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"yielding","is_correct":true}]$q$::jsonb, $q$yielding$q$, $q$Tenacious means "holding on firmly; persistent", so the word that means the opposite is yielding.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('07d4825e-0bcf-5b9d-8f33-d67d0a422ac4',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of VERBOSE?$q$, $q$[{"text":"concise","is_correct":true},{"text":"rambling","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"dull","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$concise$q$, $q$Verbose means "using more words than needed", so the word that means the opposite is concise.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c2234366-9922-5e85-808d-c13a085f8b9e',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of AMIABLE?$q$, $q$[{"text":"agreeable","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"unfriendly","is_correct":true},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"distant","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$unfriendly$q$, $q$Amiable means "friendly and pleasant", so the word that means the opposite is unfriendly.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9903830d-0725-5e25-9dd3-cb9a48f4312a',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of METICULOUS?$q$, $q$[{"text":"precise","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"busy","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"careless","is_correct":true},{"text":"relaxed","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$careless$q$, $q$Meticulous means "very careful about small details", so the word that means the opposite is careless.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('62639c88-db65-5597-b2bd-c8ea597991ab',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of SOMBER?$q$, $q$[{"text":"grim","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"serious","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"cheerful","is_correct":true}]$q$::jsonb, $q$cheerful$q$, $q$Somber means "dark and gloomy in mood", so the word that means the opposite is cheerful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b4c5e385-7832-5166-a110-72243d407315',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of DIMINISH?$q$, $q$[{"text":"increase","is_correct":true},{"text":"reduce","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"fade","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"steady","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$increase$q$, $q$Diminish means "to make or become smaller", so the word that means the opposite is increase.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('91143528-85ba-57ca-9a65-702c3e6f4db4',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of BRAZEN?$q$, $q$[{"text":"bold","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"timid","is_correct":true},{"text":"rude","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"cautious","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$timid$q$, $q$Brazen means "boldly disrespectful; shameless", so the word that means the opposite is timid.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('43a31aaa-45e7-5650-9619-81107db969bb',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of TIDY?$q$, $q$[{"text":"orderly","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"plain","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"messy","is_correct":true},{"text":"dusty","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$messy$q$, $q$Tidy means "neat and in order", so the word that means the opposite is messy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b895ae37-186f-56dd-80cd-fd5f951af29a',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of DAMP?$q$, $q$[{"text":"soggy","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"cool","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"fresh","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"dry","is_correct":true}]$q$::jsonb, $q$dry$q$, $q$Damp means "slightly wet", so the word that means the opposite is dry.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7459bd5e-69b9-5f40-9b5d-da3e9ee8142d',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of GIGANTIC?$q$, $q$[{"text":"tiny","is_correct":true},{"text":"huge","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"wide","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"small","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$tiny$q$, $q$Gigantic means "extremely large", so the word that means the opposite is tiny.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5b4a371a-a1e5-5f79-ab60-3b61c81019f9',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of FEEBLE?$q$, $q$[{"text":"frail","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"strong","is_correct":true},{"text":"tired","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"gentle","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$strong$q$, $q$Feeble means "lacking strength; weak", so the word that means the opposite is strong.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('98ad38e7-de12-54d1-b967-d436d82d545c',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of WICKED?$q$, $q$[{"text":"sinful","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"angry","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"good","is_correct":true},{"text":"strict","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$good$q$, $q$Wicked means "evil or morally wrong", so the word that means the opposite is good.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('46a29b0d-1285-5f35-a1c4-5e9d5c31e74f',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of GRUMPY?$q$, $q$[{"text":"cranky","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"cheerful","is_correct":true}]$q$::jsonb, $q$cheerful$q$, $q$Grumpy means "bad-tempered and irritable", so the word that means the opposite is cheerful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e89f1312-4b1f-5416-9a26-74bceeacdd3e',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of LOYAL?$q$, $q$[{"text":"disloyal","is_correct":true},{"text":"true","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"kind","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"distant","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$disloyal$q$, $q$Loyal means "faithful and devoted", so the word that means the opposite is disloyal.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('66724c6a-374b-5c2d-b023-e192bd82b3c1',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of CLUMSY?$q$, $q$[{"text":"bumbling","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"graceful","is_correct":true},{"text":"weak","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"stiff","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$graceful$q$, $q$Clumsy means "awkward in movement", so the word that means the opposite is graceful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6665ef2d-7f9a-555f-bb78-ded64b7dbb03',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of VAST?$q$, $q$[{"text":"huge","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"broad","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"tiny","is_correct":true},{"text":"small","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$tiny$q$, $q$Vast means "extremely large in area", so the word that means the opposite is tiny.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9f5b7217-33d7-5ed6-a2b2-d824c84250d0',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of SERENE?$q$, $q$[{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"silent","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"restless","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"turbulent","is_correct":true}]$q$::jsonb, $q$turbulent$q$, $q$Serene means "calm and peaceful", so the word that means the opposite is turbulent.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('69c651b6-be48-534f-b635-6e121c0eb997',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of GRIM?$q$, $q$[{"text":"cheerful","is_correct":true},{"text":"harsh","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$cheerful$q$, $q$Grim means "stern, forbidding, and gloomy", so the word that means the opposite is cheerful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3c1f73fb-1462-5329-aa0a-d8024b98315a',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of SLY?$q$, $q$[{"text":"sneaky","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"honest","is_correct":true},{"text":"shy","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"careless","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$honest$q$, $q$Sly means "cunning and deceitful", so the word that means the opposite is honest.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fb769aef-4237-5d10-904b-978ae0fa07b4',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of KEEN?$q$, $q$[{"text":"enthusiastic","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"indifferent","is_correct":true},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$indifferent$q$, $q$Keen means "eager and enthusiastic", so the word that means the opposite is indifferent.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('eb0a490a-701a-5148-9e4e-eb7c5bf7f99e',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of DREARY?$q$, $q$[{"text":"gloomy","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"rainy","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"cheerful","is_correct":true}]$q$::jsonb, $q$cheerful$q$, $q$Dreary means "dull, bleak, and depressing", so the word that means the opposite is cheerful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cfe96bb3-604c-54fa-9e2b-d856bcb9fb15',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of NIMBLE?$q$, $q$[{"text":"clumsy","is_correct":true},{"text":"spry","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"slow","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"stiff","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$clumsy$q$, $q$Nimble means "quick and light in movement", so the word that means the opposite is clumsy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ac2d0639-055f-5bbf-a499-b4b015031f23',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of POTENT?$q$, $q$[{"text":"mighty","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"weak","is_correct":true},{"text":"big","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"mild","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$weak$q$, $q$Potent means "having great power or strength", so the word that means the opposite is weak.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('45466d1d-4ee5-5f37-b061-00c98105a9e5',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of HOLLOW?$q$, $q$[{"text":"vacant","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"open","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"solid","is_correct":true},{"text":"thick","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$solid$q$, $q$Hollow means "having an empty space inside", so the word that means the opposite is solid.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3db63803-4928-5bad-bdd6-77d1141151df',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of DWINDLE?$q$, $q$[{"text":"decrease","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"drop","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"hold","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"grow","is_correct":true}]$q$::jsonb, $q$grow$q$, $q$Dwindle means "to gradually grow smaller", so the word that means the opposite is grow.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3380038c-6d1f-53a6-a1cf-668c16ff19de',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of ELOQUENT?$q$, $q$[{"text":"inarticulate","is_correct":true},{"text":"expressive","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"plain","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$inarticulate$q$, $q$Eloquent means "fluent and persuasive in speech", so the word that means the opposite is inarticulate.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('16cea6a7-c491-5800-9364-05fcfc65f06a',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of ALOOF?$q$, $q$[{"text":"detached","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"friendly","is_correct":true},{"text":"rude","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$friendly$q$, $q$Aloof means "distant and unfriendly", so the word that means the opposite is friendly.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('260f9f58-1282-5a71-acb2-a27a8a9baa76',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of ZEALOUS?$q$, $q$[{"text":"passionate","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"angry","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"indifferent","is_correct":true},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$indifferent$q$, $q$Zealous means "full of eager enthusiasm", so the word that means the opposite is indifferent.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2c2194a6-c7ed-5a7d-bd83-76271064e53d',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of SPARSE?$q$, $q$[{"text":"meager","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"light","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"wide","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"dense","is_correct":true}]$q$::jsonb, $q$dense$q$, $q$Sparse means "thinly spread; scanty", so the word that means the opposite is dense.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c592e7b9-b0c8-5ff4-ba70-df42b6322b10',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of ROBUST?$q$, $q$[{"text":"frail","is_correct":true},{"text":"hardy","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"big","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"gentle","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$frail$q$, $q$Robust means "strong and healthy", so the word that means the opposite is frail.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7e9e5ed7-40e0-53aa-831b-39bc40879d66',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of WILT?$q$, $q$[{"text":"sag","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"revive","is_correct":true},{"text":"dry","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"rest","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$revive$q$, $q$Wilt means "to droop and lose freshness", so the word that means the opposite is revive.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c7e23eab-396c-58ff-9b89-7f6762cae8db',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of SHREWD?$q$, $q$[{"text":"cunning","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"foolish","is_correct":true},{"text":"careless","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$foolish$q$, $q$Shrewd means "sharp in judgment; clever", so the word that means the opposite is foolish.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9a20f3ba-5851-50fd-87fc-85d61c4d9eb6',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of CLEVER?$q$, $q$[{"text":"bright","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"curious","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"careless","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"foolish","is_correct":true}]$q$::jsonb, $q$foolish$q$, $q$Clever means "quick to understand; smart", so the word that means the opposite is foolish.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('47168b83-3335-5e32-8195-277898d3e2a4',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of FILTHY?$q$, $q$[{"text":"clean","is_correct":true},{"text":"grimy","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"messy","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"tidy","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$clean$q$, $q$Filthy means "extremely dirty", so the word that means the opposite is clean.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('128ed172-d59c-54ad-aa19-0ab7e7a2eaac',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of BITTER?$q$, $q$[{"text":"tart","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"sweet","is_correct":true},{"text":"salty","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"mild","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$sweet$q$, $q$Bitter means "having a sharp, unpleasant taste", so the word that means the opposite is sweet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3177110a-3a0d-577d-a683-40e9b29d48a4',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of SHINY?$q$, $q$[{"text":"gleaming","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"wet","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"dull","is_correct":true},{"text":"faded","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$dull$q$, $q$Shiny means "reflecting light; glossy", so the word that means the opposite is dull.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1550029d-a9da-5ee2-81a0-9484d0afd12d',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of LOFTY?$q$, $q$[{"text":"tall","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"steep","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"level","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"low","is_correct":true}]$q$::jsonb, $q$low$q$, $q$Lofty means "very high or tall", so the word that means the opposite is low.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3aefa755-3a49-52b6-aef5-cb23d69f64db',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of ABSENT?$q$, $q$[{"text":"present","is_correct":true},{"text":"away","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"empty","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"nearby","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$present$q$, $q$Absent means "not present; missing", so the word that means the opposite is present.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('46334433-2d48-52ab-91ea-81615ea48613',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of DENSE?$q$, $q$[{"text":"crowded","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"sparse","is_correct":true},{"text":"wide","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"thin","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$sparse$q$, $q$Dense means "closely packed together; thick", so the word that means the opposite is sparse.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c0dca811-36b2-5979-b874-c46aa43a5e96',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of FAIR?$q$, $q$[{"text":"honest","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"unfair","is_correct":true},{"text":"harsh","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$unfair$q$, $q$Fair means "treating people equally; just", so the word that means the opposite is unfair.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('62e9e634-1c82-53ef-a4b9-8f7510e61bd1',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of GENTLE?$q$, $q$[{"text":"tender","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"firm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"harsh","is_correct":true}]$q$::jsonb, $q$harsh$q$, $q$Gentle means "mild and kind; not harsh", so the word that means the opposite is harsh.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('59ec5625-4742-51c8-b5ae-425d134aefc4',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of VIBRANT?$q$, $q$[{"text":"dull","is_correct":true},{"text":"energetic","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"warm","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"faded","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$dull$q$, $q$Vibrant means "full of energy and bright color", so the word that means the opposite is dull.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2192fa33-5a0b-52e0-bbae-92d5fd142e70',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of CAUTIOUS?$q$, $q$[{"text":"wary","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"reckless","is_correct":true},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"hasty","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$reckless$q$, $q$Cautious means "careful to avoid danger", so the word that means the opposite is reckless.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5707e4e5-beaf-5032-a45d-3f52ed54872e',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of BARREN?$q$, $q$[{"text":"bleak","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"rocky","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"fertile","is_correct":true},{"text":"green","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$fertile$q$, $q$Barren means "empty and unable to grow plants", so the word that means the opposite is fertile.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8ce1c5cc-45a6-5c47-a77d-6e2a9e358360',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of PONDER?$q$, $q$[{"text":"contemplate","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"read","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"glance","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"ignore","is_correct":true}]$q$::jsonb, $q$ignore$q$, $q$Ponder means "to think about carefully", so the word that means the opposite is ignore.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1110efdb-ca98-5a2a-a7b9-937108c67682',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of VAGUE?$q$, $q$[{"text":"clear","is_correct":true},{"text":"obscure","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"faint","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$clear$q$, $q$Vague means "not clearly expressed or understood", so the word that means the opposite is clear.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('df4cb72a-e578-58f4-8a1a-64cb7ee6d9af',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of RASH?$q$, $q$[{"text":"hasty","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"cautious","is_correct":true},{"text":"rude","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$cautious$q$, $q$Rash means "acting without careful thought", so the word that means the opposite is cautious.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('061240fa-bd44-55ee-a6ff-0c8a4d8e329e',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of HUMBLE?$q$, $q$[{"text":"meek","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"poor","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"arrogant","is_correct":true},{"text":"proud","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$arrogant$q$, $q$Humble means "modest; not proud", so the word that means the opposite is arrogant.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bd0017ec-aa51-5f65-ace2-fd1b4239d3a4',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of STOUT?$q$, $q$[{"text":"robust","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"wide","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"slim","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"frail","is_correct":true}]$q$::jsonb, $q$frail$q$, $q$Stout means "strong and solidly built", so the word that means the opposite is frail.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('10f60f00-118d-513e-bcc6-c673f4cc06fa',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of GAUNT?$q$, $q$[{"text":"plump","is_correct":true},{"text":"scrawny","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"tall","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"sturdy","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$plump$q$, $q$Gaunt means "thin and bony, as from hunger", so the word that means the opposite is plump.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cec81d54-23d8-5dca-823d-ccd815226a14',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of OMINOUS?$q$, $q$[{"text":"menacing","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"reassuring","is_correct":true},{"text":"angry","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$reassuring$q$, $q$Ominous means "suggesting that trouble is coming", so the word that means the opposite is reassuring.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b8ab688a-9518-52e2-b81e-cb631ba9b0a5',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of FERVENT?$q$, $q$[{"text":"ardent","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"angry","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"indifferent","is_correct":true},{"text":"mild","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$indifferent$q$, $q$Fervent means "having intense, passionate feeling", so the word that means the opposite is indifferent.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('00a331b2-6188-5892-8cdf-696225631124',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of PALLID?$q$, $q$[{"text":"wan","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"gray","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"tan","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"rosy","is_correct":true}]$q$::jsonb, $q$rosy$q$, $q$Pallid means "pale, especially from illness", so the word that means the opposite is rosy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('82ce9151-00ac-55d2-b52b-617e90c1c728',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of OPULENT?$q$, $q$[{"text":"plain","is_correct":true},{"text":"luxurious","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"shiny","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"modest","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$plain$q$, $q$Opulent means "rich and luxurious", so the word that means the opposite is plain.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1d68bef5-bfc6-5f36-b724-f6226976e932',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of SCORN?$q$, $q$[{"text":"disdain","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"admire","is_correct":true},{"text":"ignore","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"tolerate","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$admire$q$, $q$Scorn means "to look down on with contempt", so the word that means the opposite is admire.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3591a81e-9412-5bf5-b323-f5ac54a1aae5',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of FICKLE?$q$, $q$[{"text":"inconsistent","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"silly","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"steady","is_correct":true},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$steady$q$, $q$Fickle means "changing often; not constant", so the word that means the opposite is steady.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8366bf29-f19d-58b7-b89b-5d6ec1dcfcf5',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of ADEPT?$q$, $q$[{"text":"expert","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"strong","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"average","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"inept","is_correct":true}]$q$::jsonb, $q$inept$q$, $q$Adept means "very skilled at something", so the word that means the opposite is inept.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3667f208-87c8-530b-81cf-d19ea343d3c6',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of COPIOUS?$q$, $q$[{"text":"scarce","is_correct":true},{"text":"ample","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"big","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"modest","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$scarce$q$, $q$Copious means "present in large amounts; abundant", so the word that means the opposite is scarce.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('21a33ed3-f911-5b63-86e3-4abd6a8cce87',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of ROUGH?$q$, $q$[{"text":"jagged","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"smooth","is_correct":true},{"text":"dry","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"soft","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$smooth$q$, $q$Rough means "having an uneven surface; coarse", so the word that means the opposite is smooth.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d0845771-ccb9-5489-b15c-72f6df69c897',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of RARE?$q$, $q$[{"text":"scarce","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"old","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"common","is_correct":true},{"text":"plain","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$common$q$, $q$Rare means "not found often; uncommon", so the word that means the opposite is common.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3df31312-fc0a-51e3-8e9f-8dcec2f58669',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of BRIEF?$q$, $q$[{"text":"concise","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"rushed","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"slow","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"lengthy","is_correct":true}]$q$::jsonb, $q$lengthy$q$, $q$Brief means "lasting only a short time", so the word that means the opposite is lengthy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dff61e65-b491-5758-9f01-7663462511b7',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of MIGHTY?$q$, $q$[{"text":"weak","is_correct":true},{"text":"potent","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"big","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"mild","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$weak$q$, $q$Mighty means "having great power or strength", so the word that means the opposite is weak.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4553196b-3d98-5e8d-8854-6b1f6745e9dc',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of NARROW?$q$, $q$[{"text":"slim","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"wide","is_correct":true},{"text":"small","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"open","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$wide$q$, $q$Narrow means "small in width", so the word that means the opposite is wide.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d4e7edba-346c-5ff1-9f38-db375d45a633',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of SHY?$q$, $q$[{"text":"bashful","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"bold","is_correct":true},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$bold$q$, $q$Shy means "nervous in the company of others; timid", so the word that means the opposite is bold.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4267aad4-46ba-5856-a08a-5c5c0000d6f3',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of FRESH?$q$, $q$[{"text":"crisp","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"cold","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"old","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"stale","is_correct":true}]$q$::jsonb, $q$stale$q$, $q$Fresh means "recently made or obtained; not stale", so the word that means the opposite is stale.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5523abc9-cc75-5f70-8670-e39c49e604c3',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of STEEP?$q$, $q$[{"text":"gentle","is_correct":true},{"text":"sharp","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"rocky","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"flat","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$gentle$q$, $q$Steep means "rising or falling sharply", so the word that means the opposite is gentle.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ef07830b-1c4b-5084-933b-2d48fd35774f',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'easy',
   $q$Which word means most nearly the OPPOSITE of LOUD?$q$, $q$[{"text":"booming","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"quiet","is_correct":true},{"text":"bright","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$quiet$q$, $q$Loud means "making a lot of noise", so the word that means the opposite is quiet.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d2b99237-3919-5055-a1d9-a5558a9b8b84',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of SOLEMN?$q$, $q$[{"text":"somber","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"formal","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"cheerful","is_correct":true},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$cheerful$q$, $q$Solemn means "formal and serious", so the word that means the opposite is cheerful.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d1632fcc-f6a8-500b-a32f-541770a0d0bd',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of ABSURD?$q$, $q$[{"text":"foolish","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"strange","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"serious","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"sensible","is_correct":true}]$q$::jsonb, $q$sensible$q$, $q$Absurd means "wildly unreasonable; ridiculous", so the word that means the opposite is sensible.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c4b58282-596b-55c9-bc1f-c87a68473aa7',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of CRAFTY?$q$, $q$[{"text":"honest","is_correct":true},{"text":"sly","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"careless","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$honest$q$, $q$Crafty means "clever in a sly way", so the word that means the opposite is honest.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6d5a5492-5c18-5285-af29-b1d1ee0d486a',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of DAINTY?$q$, $q$[{"text":"graceful","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"clumsy","is_correct":true},{"text":"weak","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"rough","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$clumsy$q$, $q$Dainty means "small and delicately pretty", so the word that means the opposite is clumsy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5fdfd896-c8a1-528a-bcf1-d79f1174c804',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of GRUFF?$q$, $q$[{"text":"harsh","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"gentle","is_correct":true},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$gentle$q$, $q$Gruff means "rough and abrupt in manner", so the word that means the opposite is gentle.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3c8e8c9c-25fe-5269-8fa6-744a6180fe48',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of PLACID?$q$, $q$[{"text":"serene","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"dull","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"restless","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"stormy","is_correct":true}]$q$::jsonb, $q$stormy$q$, $q$Placid means "calm and peaceful", so the word that means the opposite is stormy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('52f3147b-1da4-5ca6-bcf7-999e31074883',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of RUGGED?$q$, $q$[{"text":"smooth","is_correct":true},{"text":"jagged","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"hard","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"soft","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$smooth$q$, $q$Rugged means "rough and uneven; rocky", so the word that means the opposite is smooth.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9b8c40fd-4285-5300-ae96-88f5ba9cd9a7',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of WITTY?$q$, $q$[{"text":"amusing","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"dull","is_correct":true},{"text":"smart","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"serious","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$dull$q$, $q$Witty means "clever and amusing with words", so the word that means the opposite is dull.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1262d9a5-8f7a-5d71-842c-3ac613583171',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of MEEK?$q$, $q$[{"text":"timid","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"shy","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"bold","is_correct":true},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$bold$q$, $q$Meek means "quiet, gentle, and easily led", so the word that means the opposite is bold.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a7ccfcae-5358-500b-b50f-be26928014d8',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'medium',
   $q$Which word means most nearly the OPPOSITE of JOVIAL?$q$, $q$[{"text":"jolly","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"loud","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"serious","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"gloomy","is_correct":true}]$q$::jsonb, $q$gloomy$q$, $q$Jovial means "cheerful and good-humored", so the word that means the opposite is gloomy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ca74c7f2-ebb2-58aa-b8a1-be944f81f396',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of PRODIGAL?$q$, $q$[{"text":"thrifty","is_correct":true},{"text":"extravagant","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"greedy","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"careful","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$thrifty$q$, $q$Prodigal means "wastefully extravagant", so the word that means the opposite is thrifty.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8ed63906-ebd3-5cfc-9052-c3c8ac31d325',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of NEFARIOUS?$q$, $q$[{"text":"villainous","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"virtuous","is_correct":true},{"text":"angry","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"kind","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$virtuous$q$, $q$Nefarious means "extremely wicked or evil", so the word that means the opposite is virtuous.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7f11fb70-672c-5a96-921e-3acb17fb78b5',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of AFFABLE?$q$, $q$[{"text":"genial","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"quiet","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"unfriendly","is_correct":true},{"text":"distant","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$unfriendly$q$, $q$Affable means "good-natured and easy to talk to", so the word that means the opposite is unfriendly.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7c5f6883-6a09-5327-9499-0f4eb77cf973',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of SUCCINCT?$q$, $q$[{"text":"brief","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"simple","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"vague","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"wordy","is_correct":true}]$q$::jsonb, $q$wordy$q$, $q$Succinct means "briefly and clearly expressed", so the word that means the opposite is wordy.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fd95cd65-92a5-5053-b9c3-59cf869cd544',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of INDOLENT?$q$, $q$[{"text":"diligent","is_correct":true},{"text":"lethargic","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"tired","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"busy","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$diligent$q$, $q$Indolent means "wanting to avoid work; lazy", so the word that means the opposite is diligent.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e6fedfc2-9585-5b93-b692-37615588233b',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of CORDIAL?$q$, $q$[{"text":"friendly","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"cold","is_correct":true},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"distant","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$cold$q$, $q$Cordial means "warm and friendly", so the word that means the opposite is cold.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('eb40ddaa-f43f-58fb-95aa-1609756d3f91',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of RESOLUTE?$q$, $q$[{"text":"steadfast","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"harsh","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"hesitant","is_correct":true},{"text":"calm","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$hesitant$q$, $q$Resolute means "firmly determined", so the word that means the opposite is hesitant.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8f6d06fc-6737-5be9-a2e6-841665a89af2',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of VEX?$q$, $q$[{"text":"irritate","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"scold","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"please","is_correct":false,"misconception_token":"verbal-opposite-near-miss"},{"text":"soothe","is_correct":true}]$q$::jsonb, $q$soothe$q$, $q$Vex means "to annoy or irritate", so the word that means the opposite is soothe.$q$, 'published')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('34bd11ec-e1df-5262-abf4-723df4b1a45b',
   null,
   (select id from public.skills where slug = 'prep-antonyms'),
   null, 'hard',
   $q$Which word means most nearly the OPPOSITE of AUDACIOUS?$q$, $q$[{"text":"timid","is_correct":true},{"text":"fearless","is_correct":false,"misconception_token":"verbal-opposite-picked-synonym"},{"text":"rude","is_correct":false,"misconception_token":"verbal-opposite-same-topic"},{"text":"cautious","is_correct":false,"misconception_token":"verbal-opposite-near-miss"}]$q$::jsonb, $q$timid$q$, $q$Audacious means "showing a bold willingness to take risks", so the word that means the opposite is timid.$q$, 'published')
on conflict (id) do update set
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
