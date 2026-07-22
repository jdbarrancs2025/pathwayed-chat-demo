-- PathwayEd — Question Engine: PREP analogies skills + questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-prep-seeds.ts from the curated
-- pools in src/lib/prep/*Templates.ts. HOW TO APPLY (self-contained — creates the
-- isolated prep subject + domain + skills, then the questions):
--   bun run db:seed seeds/0016_prep_analogy_questions.sql
-- Idempotent (deterministic ids). Depends on migration 0004 (generated_questions).
-- Prep subjects are isolated from the K-12 tree; the prep engine reaches these by slug.
--
-- 100% ORIGINAL grade 6-8 items. Every item has 4 choices, one correct, and three
-- distractors that are each a specific wrong path (with a mapped misconception).

begin;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:subj-prep-verbal')::uuid, 'subject', null, 'prep-verbal', 'Test Prep — Verbal', null, null, null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-prep-verbal')::uuid, 'domain', md5('pe-aos:subj-prep-verbal')::uuid, 'prep-verbal', 'Verbal Reasoning', null, null, null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:skill-prep-analogies')::uuid, 'skill', md5('pe-aos:dom-prep-verbal')::uuid, 'prep-verbal', 'Analogies', 'prep-analogies', '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band;

-- prep-analogies (Analogies) — 84 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5879a0e5-76ab-5699-b3d2-7ea7d57aea9b', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$PETAL is to FLOWER as FINGER is to ___$q$, $q$[{"text":"knuckle","is_correct":false,"misconception_token":"analogy-reversed-relation"},{"text":"hand","is_correct":true},{"text":"toe","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"glove","is_correct":false,"misconception_token":"analogy-associated-not-parallel"}]$q$::jsonb, $q$hand$q$, $q$The relationship is part/whole: PETAL is a part of FLOWER, so FINGER is a part of HAND.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5d05ea98-7cc2-53b2-8fff-81ce02ecf72b', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$PAGE is to BOOK as BRICK is to ___$q$, $q$[{"text":"stone","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"mortar","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"wall","is_correct":true},{"text":"builder","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$wall$q$, $q$The relationship is part/whole: PAGE is a part of BOOK, so BRICK is a part of WALL.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e4873c89-b216-5474-9091-7dea202a95d6', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$ROOT is to TREE as FIN is to ___$q$, $q$[{"text":"gill","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"water","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"swim","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"fish","is_correct":true}]$q$::jsonb, $q$fish$q$, $q$The relationship is part/whole: ROOT is a part of TREE, so FIN is a part of FISH.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d1ea91ad-45da-5922-a1a3-1991557f46e8', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$WHEEL is to CAR as WING is to ___$q$, $q$[{"text":"airplane","is_correct":true},{"text":"engine","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"bird","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"fly","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$airplane$q$, $q$The relationship is part/whole: WHEEL is a part of CAR, so WING is a part of AIRPLANE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('245a8f33-57af-573d-bcaf-4960fd7585da', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$BRANCH is to TREE as TRIBUTARY is to ___$q$, $q$[{"text":"stream","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"river","is_correct":true},{"text":"bank","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"flood","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$river$q$, $q$The relationship is part/whole: BRANCH is a part of TREE, so TRIBUTARY is a part of RIVER.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d61fe9bd-c5d6-56ef-a3f3-f1539d9a5150', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$KEYBOARD is to COMPUTER as STRING is to ___$q$, $q$[{"text":"fret","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"music","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"guitar","is_correct":true},{"text":"strum","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$guitar$q$, $q$The relationship is part/whole: KEYBOARD is a part of COMPUTER, so STRING is a part of GUITAR.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('67ce1bc1-be81-5f98-82c6-ee41c081e40c', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$CRUST is to PIE as SHELL is to ___$q$, $q$[{"text":"yolk","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"nest","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"hatch","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"egg","is_correct":true}]$q$::jsonb, $q$egg$q$, $q$The relationship is part/whole: CRUST is a part of PIE, so SHELL is a part of EGG.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('07b3642c-b694-5516-a4e9-5a2575e03171', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$LENS is to CAMERA as SCREEN is to ___$q$, $q$[{"text":"television","is_correct":true},{"text":"speaker","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"remote","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"watch","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$television$q$, $q$The relationship is part/whole: LENS is a part of CAMERA, so SCREEN is a part of TELEVISION.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0ddbce0f-8953-5a22-aec4-d78cadb955bd', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$RUNG is to LADDER as SPOKE is to ___$q$, $q$[{"text":"rim","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"wheel","is_correct":true},{"text":"bicycle","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"roll","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$wheel$q$, $q$The relationship is part/whole: RUNG is a part of LADDER, so SPOKE is a part of WHEEL.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('25e7ee04-5c38-5265-acb6-8f842ce60273', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$VERSE is to POEM as SCENE is to ___$q$, $q$[{"text":"chapter","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"actor","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"play","is_correct":true},{"text":"perform","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$play$q$, $q$The relationship is part/whole: VERSE is a part of POEM, so SCENE is a part of PLAY.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bcf0b0ad-44ce-5fcd-8a8a-62aa396665ed', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$RAIN is to FLOOD as FIRE is to ___$q$, $q$[{"text":"ash","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"heat","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"match","is_correct":false,"misconception_token":"analogy-reversed-relation"},{"text":"smoke","is_correct":true}]$q$::jsonb, $q$smoke$q$, $q$The relationship is cause/effect: RAIN leads to FLOOD, so FIRE leads to SMOKE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3f7fa994-afb6-5b10-8661-2b9eca164047', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$GERM is to ILLNESS as SPARK is to ___$q$, $q$[{"text":"fire","is_correct":true},{"text":"ember","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"smoke","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"flint","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$fire$q$, $q$The relationship is cause/effect: GERM leads to ILLNESS, so SPARK leads to FIRE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9af7cdb7-e9be-57ca-bbaa-84f8c8125439', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$EXERCISE is to FITNESS as STUDY is to ___$q$, $q$[{"text":"reading","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"knowledge","is_correct":true},{"text":"school","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"test","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$knowledge$q$, $q$The relationship is cause/effect: EXERCISE leads to FITNESS, so STUDY leads to KNOWLEDGE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a501b133-9484-5058-9638-b341abd43d50', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$DROUGHT is to FAMINE as VIRUS is to ___$q$, $q$[{"text":"bacteria","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"doctor","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"infection","is_correct":true},{"text":"vaccine","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$infection$q$, $q$The relationship is cause/effect: DROUGHT leads to FAMINE, so VIRUS leads to INFECTION.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('acd092f5-9da9-5d46-bd95-978c855f98f2', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$JOKE is to LAUGHTER as INSULT is to ___$q$, $q$[{"text":"rudeness","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"argument","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"smile","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"anger","is_correct":true}]$q$::jsonb, $q$anger$q$, $q$The relationship is cause/effect: JOKE leads to LAUGHTER, so INSULT leads to ANGER.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f8cca466-5110-594e-961b-d5eecffa8347', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$HEAT is to SWEAT as COLD is to ___$q$, $q$[{"text":"shiver","is_correct":true},{"text":"sneeze","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"winter","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"ice","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$shiver$q$, $q$The relationship is cause/effect: HEAT leads to SWEAT, so COLD leads to SHIVER.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3c6dcb15-3c21-510e-983f-e468d4db0adf', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$PRACTICE is to IMPROVEMENT as REST is to ___$q$, $q$[{"text":"sleep","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"recovery","is_correct":true},{"text":"bed","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"tired","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$recovery$q$, $q$The relationship is cause/effect: PRACTICE leads to IMPROVEMENT, so REST leads to RECOVERY.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b7bd90e5-eb20-5335-98f4-c5cc5588cff8', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$FLOOD is to DAMAGE as EARTHQUAKE is to ___$q$, $q$[{"text":"tremor","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"rescue","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"destruction","is_correct":true},{"text":"fault","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$destruction$q$, $q$The relationship is cause/effect: FLOOD leads to DAMAGE, so EARTHQUAKE leads to DESTRUCTION.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a899d895-b1c1-534b-8390-c08e2823ca4f', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$POLLUTION is to SMOG as OVEREATING is to ___$q$, $q$[{"text":"feast","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"stomach","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"hunger","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"indigestion","is_correct":true}]$q$::jsonb, $q$indigestion$q$, $q$The relationship is cause/effect: POLLUTION leads to SMOG, so OVEREATING leads to INDIGESTION.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ee00e90e-f3dc-500b-aaf8-52cfdaf1083a', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$PAINTER is to BRUSH as WRITER is to ___$q$, $q$[{"text":"pen","is_correct":true},{"text":"author","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"paper","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"book","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$pen$q$, $q$The relationship is worker/tool: PAINTER uses BRUSH, so WRITER uses PEN.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('70bbd42b-ea82-54bb-aff3-9e65e7b8846a', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$CARPENTER is to HAMMER as CHEF is to ___$q$, $q$[{"text":"waiter","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"knife","is_correct":true},{"text":"apron","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"meal","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$knife$q$, $q$The relationship is worker/tool: CARPENTER uses HAMMER, so CHEF uses KNIFE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4485ac06-c3d3-5098-8962-3c764e23e618', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$FARMER is to PLOW as BARBER is to ___$q$, $q$[{"text":"stylist","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"chair","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"scissors","is_correct":true},{"text":"hair","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$scissors$q$, $q$The relationship is worker/tool: FARMER uses PLOW, so BARBER uses SCISSORS.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('58ab0dca-51e4-5b75-8fab-cf73f940fde9', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$SURGEON is to SCALPEL as TAILOR is to ___$q$, $q$[{"text":"seamstress","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"dress","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"fabric","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"needle","is_correct":true}]$q$::jsonb, $q$needle$q$, $q$The relationship is worker/tool: SURGEON uses SCALPEL, so TAILOR uses NEEDLE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('88f41bd0-b981-55d9-9a7b-155ad57c9e3d', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$GARDENER is to RAKE as FISHERMAN is to ___$q$, $q$[{"text":"rod","is_correct":true},{"text":"sailor","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"boat","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"fish","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$rod$q$, $q$The relationship is worker/tool: GARDENER uses RAKE, so FISHERMAN uses ROD.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7a4a6b2a-b5f2-50c3-89fb-e0af0ef79d13', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$SCULPTOR is to CHISEL as BLACKSMITH is to ___$q$, $q$[{"text":"welder","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"anvil","is_correct":true},{"text":"forge","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"iron","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$anvil$q$, $q$The relationship is worker/tool: SCULPTOR uses CHISEL, so BLACKSMITH uses ANVIL.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cf3c698f-4615-51eb-b3f5-312a4fc06d75', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$PHOTOGRAPHER is to CAMERA as ASTRONOMER is to ___$q$, $q$[{"text":"scientist","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"observatory","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"telescope","is_correct":true},{"text":"star","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$telescope$q$, $q$The relationship is worker/tool: PHOTOGRAPHER uses CAMERA, so ASTRONOMER uses TELESCOPE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('60fd7504-415f-5872-a679-27ed98cdc685', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$CONDUCTOR is to BATON as DENTIST is to ___$q$, $q$[{"text":"doctor","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"office","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"tooth","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"drill","is_correct":true}]$q$::jsonb, $q$drill$q$, $q$The relationship is worker/tool: CONDUCTOR uses BATON, so DENTIST uses DRILL.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2efa28a1-ac3f-5c26-b98c-9708033f37d6', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$LUMBERJACK is to AXE as LOCKSMITH is to ___$q$, $q$[{"text":"key","is_correct":true},{"text":"mechanic","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"door","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"lock","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$key$q$, $q$The relationship is worker/tool: LUMBERJACK uses AXE, so LOCKSMITH uses KEY.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dec5ca6f-8183-5737-ac2b-61086b022392', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$WARM is to HOT as COOL is to ___$q$, $q$[{"text":"chilly","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"cold","is_correct":true},{"text":"ice","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"freeze","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$cold$q$, $q$The relationship is degree/intensity: WARM is a milder form of HOT, so COOL is a milder form of COLD.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6b57ef6c-4f0d-5dc3-872d-e302af844327', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$DAMP is to SOAKED as TIRED is to ___$q$, $q$[{"text":"sleepy","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"nap","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"exhausted","is_correct":true},{"text":"rest","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$exhausted$q$, $q$The relationship is degree/intensity: DAMP is a milder form of SOAKED, so TIRED is a milder form of EXHAUSTED.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('86c1707e-ddc5-56b7-95ef-8e272cf00465', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$LIKE is to LOVE as DISLIKE is to ___$q$, $q$[{"text":"annoy","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"anger","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"avoid","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"hate","is_correct":true}]$q$::jsonb, $q$hate$q$, $q$The relationship is degree/intensity: LIKE is a milder form of LOVE, so DISLIKE is a milder form of HATE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ad1f84c8-bb99-595e-a040-113fd27b0f88', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$BIG is to GIGANTIC as SMALL is to ___$q$, $q$[{"text":"tiny","is_correct":true},{"text":"little","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"size","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"shrink","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$tiny$q$, $q$The relationship is degree/intensity: BIG is a milder form of GIGANTIC, so SMALL is a milder form of TINY.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1c8cb41b-2a1f-5e88-90e2-f106fb58aed2', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$HUNGRY is to STARVING as THIRSTY is to ___$q$, $q$[{"text":"dry","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"parched","is_correct":true},{"text":"water","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"drink","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$parched$q$, $q$The relationship is degree/intensity: HUNGRY is a milder form of STARVING, so THIRSTY is a milder form of PARCHED.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('75edf987-5c42-5c50-a13b-db967799f7a5', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$UPSET is to FURIOUS as GLAD is to ___$q$, $q$[{"text":"happy","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"joy","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"ecstatic","is_correct":true},{"text":"smile","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$ecstatic$q$, $q$The relationship is degree/intensity: UPSET is a milder form of FURIOUS, so GLAD is a milder form of ECSTATIC.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9fca8a4f-f35b-577c-8f57-79f8818b2c3e', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$BREEZE is to GALE as DRIZZLE is to ___$q$, $q$[{"text":"sprinkle","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"umbrella","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"wet","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"downpour","is_correct":true}]$q$::jsonb, $q$downpour$q$, $q$The relationship is degree/intensity: BREEZE is a milder form of GALE, so DRIZZLE is a milder form of DOWNPOUR.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0d019dc5-67ab-5a2e-b28c-0c73c796e697', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$TAP is to POUND as WHISPER is to ___$q$, $q$[{"text":"shout","is_correct":true},{"text":"murmur","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"voice","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"talk","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$shout$q$, $q$The relationship is degree/intensity: TAP is a milder form of POUND, so WHISPER is a milder form of SHOUT.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('544be9b6-581c-5bb2-b8cf-800743efaefb', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$GOOD is to EXCELLENT as BAD is to ___$q$, $q$[{"text":"poor","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"terrible","is_correct":true},{"text":"problem","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"fail","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$terrible$q$, $q$The relationship is degree/intensity: GOOD is a milder form of EXCELLENT, so BAD is a milder form of TERRIBLE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('97eab4fe-127f-5649-bb3e-532c78112f52', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$FRUIT is to APPLE as VEGETABLE is to ___$q$, $q$[{"text":"banana","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"garden","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"carrot","is_correct":true},{"text":"food","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$carrot$q$, $q$The relationship is category/member: APPLE is a type of FRUIT, so CARROT is a type of VEGETABLE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('26eb76e9-7515-5f1f-a76a-f3c8f439cd74', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$INSTRUMENT is to VIOLIN as TOOL is to ___$q$, $q$[{"text":"flute","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"toolbox","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"equipment","is_correct":false,"misconception_token":"analogy-reversed-relation"},{"text":"hammer","is_correct":true}]$q$::jsonb, $q$hammer$q$, $q$The relationship is category/member: VIOLIN is a type of INSTRUMENT, so HAMMER is a type of TOOL.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('86d9071a-367a-59d3-a76b-6ed7d60d5f55', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$BIRD is to ROBIN as DOG is to ___$q$, $q$[{"text":"poodle","is_correct":true},{"text":"sparrow","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"bone","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"animal","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$poodle$q$, $q$The relationship is category/member: ROBIN is a type of BIRD, so POODLE is a type of DOG.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8f8dfee4-b52b-5f21-a0b5-b7e2c4e8e2d3', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$METAL is to COPPER as GAS is to ___$q$, $q$[{"text":"iron","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"helium","is_correct":true},{"text":"balloon","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"matter","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$helium$q$, $q$The relationship is category/member: COPPER is a type of METAL, so HELIUM is a type of GAS.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6de09f66-0ee0-541d-b87c-4d7e2f49111d', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$SPORT is to TENNIS as DANCE is to ___$q$, $q$[{"text":"soccer","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"music","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"ballet","is_correct":true},{"text":"art","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$ballet$q$, $q$The relationship is category/member: TENNIS is a type of SPORT, so BALLET is a type of DANCE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f0a943fe-ce07-5edd-9337-3088ea311bd5', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$COLOR is to CRIMSON as SHAPE is to ___$q$, $q$[{"text":"scarlet","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"corner","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"symmetry","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"hexagon","is_correct":true}]$q$::jsonb, $q$hexagon$q$, $q$The relationship is category/member: CRIMSON is a type of COLOR, so HEXAGON is a type of SHAPE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('696b207b-464a-5e77-836f-8584d83d4410', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$TREE is to OAK as FLOWER is to ___$q$, $q$[{"text":"rose","is_correct":true},{"text":"pine","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"vase","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"plant","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$rose$q$, $q$The relationship is category/member: OAK is a type of TREE, so ROSE is a type of FLOWER.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('526ef33d-d0df-5b33-ab76-66bdfe42873d', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$PLANET is to MARS as OCEAN is to ___$q$, $q$[{"text":"venus","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"pacific","is_correct":true},{"text":"wave","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"water","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$pacific$q$, $q$The relationship is category/member: MARS is a type of PLANET, so PACIFIC is a type of OCEAN.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('039963fa-2067-5407-bde3-667fe56e7365', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$LANGUAGE is to SPANISH as CURRENCY is to ___$q$, $q$[{"text":"french","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"bank","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"dollar","is_correct":true},{"text":"money","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$dollar$q$, $q$The relationship is category/member: SPANISH is a type of LANGUAGE, so DOLLAR is a type of CURRENCY.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f05de32f-f66b-50a6-aa29-06d12f7e9927', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$KNIFE is to CUT as BROOM is to ___$q$, $q$[{"text":"mop","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"floor","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"dustpan","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"sweep","is_correct":true}]$q$::jsonb, $q$sweep$q$, $q$The relationship is function: KNIFE is used to CUT, so BROOM is used to SWEEP.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('75ccbb13-a11b-5067-8366-4fd78096d4c8', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$PEN is to WRITE as SCISSORS is to ___$q$, $q$[{"text":"cut","is_correct":true},{"text":"knife","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"paper","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"sharp","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$cut$q$, $q$The relationship is function: PEN is used to WRITE, so SCISSORS is used to CUT.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ea6f82b3-59c2-5707-8b0b-58216a18ec5d', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$OVEN is to BAKE as FREEZER is to ___$q$, $q$[{"text":"refrigerator","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"freeze","is_correct":true},{"text":"kitchen","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"cold","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$freeze$q$, $q$The relationship is function: OVEN is used to BAKE, so FREEZER is used to FREEZE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('484e363d-e0df-5189-9f88-483b8ef326b0', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$KEY is to UNLOCK as MATCH is to ___$q$, $q$[{"text":"lighter","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"candle","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"light","is_correct":true},{"text":"fire","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$light$q$, $q$The relationship is function: KEY is used to UNLOCK, so MATCH is used to LIGHT.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1fd315ce-82fd-523b-aaf5-5b584770e72a', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$UMBRELLA is to SHELTER as FENCE is to ___$q$, $q$[{"text":"wall","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"yard","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"gate","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"enclose","is_correct":true}]$q$::jsonb, $q$enclose$q$, $q$The relationship is function: UMBRELLA is used to SHELTER, so FENCE is used to ENCLOSE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('58d6440f-b4b4-5724-8ba5-fc5d06ffe033', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$SOAP is to CLEAN as GLUE is to ___$q$, $q$[{"text":"stick","is_correct":true},{"text":"tape","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"paper","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"mess","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$stick$q$, $q$The relationship is function: SOAP is used to CLEAN, so GLUE is used to STICK.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6b62ccff-0871-5a4c-bed4-388ed0b4800f', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$LAMP is to ILLUMINATE as HEATER is to ___$q$, $q$[{"text":"furnace","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"warm","is_correct":true},{"text":"room","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"cold","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$warm$q$, $q$The relationship is function: LAMP is used to ILLUMINATE, so HEATER is used to WARM.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0127f63d-2f9b-5d4d-886c-24256cff5259', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$BRAKE is to STOP as ACCELERATOR is to ___$q$, $q$[{"text":"pedal","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"car","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"accelerate","is_correct":true},{"text":"fast","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$accelerate$q$, $q$The relationship is function: BRAKE is used to STOP, so ACCELERATOR is used to ACCELERATE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('85c06460-fe32-5cbd-90b4-a628e6ce2058', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$SHIELD is to PROTECT as SWORD is to ___$q$, $q$[{"text":"spear","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"knight","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"sharp","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"attack","is_correct":true}]$q$::jsonb, $q$attack$q$, $q$The relationship is function: SHIELD is used to PROTECT, so SWORD is used to ATTACK.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('881083c5-ecac-5d41-b64e-b8775be1b1ac', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$HOT is to COLD as UP is to ___$q$, $q$[{"text":"down","is_correct":true},{"text":"north","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"ladder","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"above","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$down$q$, $q$The relationship is antonym: HOT is the opposite of COLD, so UP is the opposite of DOWN.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5de22fff-4917-50f8-bc6a-3175bb9514fb', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$DAY is to NIGHT as LIGHT is to ___$q$, $q$[{"text":"color","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"dark","is_correct":true},{"text":"sun","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"bright","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$dark$q$, $q$The relationship is antonym: DAY is the opposite of NIGHT, so LIGHT is the opposite of DARK.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('70148fc4-2bd3-58e8-9186-7d9da4c4ac4f', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$OPEN is to CLOSE as ENTER is to ___$q$, $q$[{"text":"come","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"doorway","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"exit","is_correct":true},{"text":"arrive","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$exit$q$, $q$The relationship is antonym: OPEN is the opposite of CLOSE, so ENTER is the opposite of EXIT.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3e7e5c9f-43fa-5d3c-98eb-ccfbce86a724', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$WET is to DRY as FULL is to ___$q$, $q$[{"text":"fill","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"stomach","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"complete","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"empty","is_correct":true}]$q$::jsonb, $q$empty$q$, $q$The relationship is antonym: WET is the opposite of DRY, so FULL is the opposite of EMPTY.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('08c1d2a9-e39d-5556-bd35-1adb36d5f56c', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$BRAVE is to COWARDLY as GENEROUS is to ___$q$, $q$[{"text":"stingy","is_correct":true},{"text":"kind","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"money","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"giving","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$stingy$q$, $q$The relationship is antonym: BRAVE is the opposite of COWARDLY, so GENEROUS is the opposite of STINGY.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('82f3d860-f96b-55d2-abf8-50a103d0cc62', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$VICTORY is to DEFEAT as SUCCESS is to ___$q$, $q$[{"text":"goal","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"failure","is_correct":true},{"text":"trophy","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"triumph","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$failure$q$, $q$The relationship is antonym: VICTORY is the opposite of DEFEAT, so SUCCESS is the opposite of FAILURE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('72044d73-0a81-5d7f-9061-bf491c35dec5', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$ANCIENT is to MODERN as EXPAND is to ___$q$, $q$[{"text":"stretch","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"balloon","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"shrink","is_correct":true},{"text":"grow","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$shrink$q$, $q$The relationship is antonym: ANCIENT is the opposite of MODERN, so EXPAND is the opposite of SHRINK.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9a9763f4-1172-5926-a50f-fde9e3b1cb80', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$ACCEPT is to REJECT as PRAISE is to ___$q$, $q$[{"text":"compliment","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"award","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"applaud","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"criticize","is_correct":true}]$q$::jsonb, $q$criticize$q$, $q$The relationship is antonym: ACCEPT is the opposite of REJECT, so PRAISE is the opposite of CRITICIZE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('197c4700-2932-5257-b60f-dcb79ad16d97', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$ROUGH is to SMOOTH as LOUD is to ___$q$, $q$[{"text":"quiet","is_correct":true},{"text":"sound","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"music","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"noisy","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$quiet$q$, $q$The relationship is antonym: ROUGH is the opposite of SMOOTH, so LOUD is the opposite of QUIET.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('77339def-6bcd-549d-b12d-a3e925d0263e', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$GATHER is to SCATTER as BUILD is to ___$q$, $q$[{"text":"create","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"destroy","is_correct":true},{"text":"house","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"construct","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$destroy$q$, $q$The relationship is antonym: GATHER is the opposite of SCATTER, so BUILD is the opposite of DESTROY.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('01944315-2aaf-5ca4-a50e-7e4ee2d23331', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$BIG is to LARGE as SMALL is to ___$q$, $q$[{"text":"size","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"mouse","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"little","is_correct":true},{"text":"big","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$little$q$, $q$The relationship is synonym: BIG means the same as LARGE, so SMALL means the same as LITTLE.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a0480270-110f-59b6-8551-d6824de33bce', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$HAPPY is to GLAD as SAD is to ___$q$, $q$[{"text":"mood","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"tears","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"happy","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"unhappy","is_correct":true}]$q$::jsonb, $q$unhappy$q$, $q$The relationship is synonym: HAPPY means the same as GLAD, so SAD means the same as UNHAPPY.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('46f17f18-59d8-5695-a6c4-e08b9d41bc80', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$BEGIN is to START as END is to ___$q$, $q$[{"text":"finish","is_correct":true},{"text":"pause","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"goal","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"begin","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$finish$q$, $q$The relationship is synonym: BEGIN means the same as START, so END means the same as FINISH.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('152eae0c-0061-59b4-964d-75d4d916b861', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$QUICK is to FAST as SMART is to ___$q$, $q$[{"text":"quick","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"clever","is_correct":true},{"text":"school","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"dumb","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$clever$q$, $q$The relationship is synonym: QUICK means the same as FAST, so SMART means the same as CLEVER.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a4127c86-4b2d-5be1-b76a-8305b8fe834c', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$ANGRY is to MAD as SCARED is to ___$q$, $q$[{"text":"feeling","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"dark","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"afraid","is_correct":true},{"text":"brave","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$afraid$q$, $q$The relationship is synonym: ANGRY means the same as MAD, so SCARED means the same as AFRAID.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('32d12fde-fcad-58a1-baaf-a77888f29995', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$RICH is to WEALTHY as POOR is to ___$q$, $q$[{"text":"money","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"beggar","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"rich","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"needy","is_correct":true}]$q$::jsonb, $q$needy$q$, $q$The relationship is synonym: RICH means the same as WEALTHY, so POOR means the same as NEEDY.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('820749f7-52e8-559b-b875-843f9ddb70d6', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$BRAVE is to COURAGEOUS as HONEST is to ___$q$, $q$[{"text":"truthful","is_correct":true},{"text":"polite","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"lie","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"dishonest","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$truthful$q$, $q$The relationship is synonym: BRAVE means the same as COURAGEOUS, so HONEST means the same as TRUTHFUL.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e8733f99-7272-5a62-95c8-2bffbfe2306a', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$TIRED is to WEARY as CALM is to ___$q$, $q$[{"text":"gentle","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"peaceful","is_correct":true},{"text":"sleep","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"anxious","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$peaceful$q$, $q$The relationship is synonym: TIRED means the same as WEARY, so CALM means the same as PEACEFUL.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('90b75e9a-579a-519b-8af1-233d42e3ee99', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$SMART is to INTELLIGENT as FUNNY is to ___$q$, $q$[{"text":"silly","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"clown","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"humorous","is_correct":true},{"text":"boring","is_correct":false,"misconception_token":"analogy-wrong-relationship"}]$q$::jsonb, $q$humorous$q$, $q$The relationship is synonym: SMART means the same as INTELLIGENT, so FUNNY means the same as HUMOROUS.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d0d7990b-91b0-56b4-bd2c-5f9a1ffc17b9', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$TINY is to MINUSCULE as HUGE is to ___$q$, $q$[{"text":"wide","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"elephant","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"tiny","is_correct":false,"misconception_token":"analogy-wrong-relationship"},{"text":"enormous","is_correct":true}]$q$::jsonb, $q$enormous$q$, $q$The relationship is synonym: TINY means the same as MINUSCULE, so HUGE means the same as ENORMOUS.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f667800f-d9af-51c3-9065-0b2512f6a4cd', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$MONDAY is to TUESDAY as THURSDAY is to ___$q$, $q$[{"text":"friday","is_correct":true},{"text":"month","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"weekend","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"wednesday","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$friday$q$, $q$The relationship is sequence: MONDAY comes right before TUESDAY, so THURSDAY comes right before FRIDAY.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('21fa704a-1d4c-5fd8-b64f-fda4264285c4', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$SPRING is to SUMMER as FALL is to ___$q$, $q$[{"text":"season","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"winter","is_correct":true},{"text":"snow","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"summer","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$winter$q$, $q$The relationship is sequence: SPRING comes right before SUMMER, so FALL comes right before WINTER.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f2e31876-b024-5c47-8a6e-31baf087d2b3', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$JANUARY is to FEBRUARY as JUNE is to ___$q$, $q$[{"text":"calendar","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"summer","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"july","is_correct":true},{"text":"may","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$july$q$, $q$The relationship is sequence: JANUARY comes right before FEBRUARY, so JUNE comes right before JULY.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0b122c35-9ab2-5885-93ec-3bee4c44f381', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$FIRST is to SECOND as THIRD is to ___$q$, $q$[{"text":"number","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"place","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"second","is_correct":false,"misconception_token":"analogy-reversed-relation"},{"text":"fourth","is_correct":true}]$q$::jsonb, $q$fourth$q$, $q$The relationship is sequence: FIRST comes right before SECOND, so THIRD comes right before FOURTH.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5e704a75-713c-5068-8e2b-f05b4b2a58b2', null, (select id from public.skills where slug = 'prep-analogies'), null, 'easy',
   $q$MORNING is to AFTERNOON as EVENING is to ___$q$, $q$[{"text":"night","is_correct":true},{"text":"time","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"dinner","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"afternoon","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$night$q$, $q$The relationship is sequence: MORNING comes right before AFTERNOON, so EVENING comes right before NIGHT.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('63bcb157-b382-5398-93ca-df125937bd85', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$INFANT is to TODDLER as TEENAGER is to ___$q$, $q$[{"text":"person","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"adult","is_correct":true},{"text":"school","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"child","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$adult$q$, $q$The relationship is sequence: INFANT comes right before TODDLER, so TEENAGER comes right before ADULT.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0e4d30a2-4aae-5749-a1fc-6539908ccb6d', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$SEED is to SPROUT as CATERPILLAR is to ___$q$, $q$[{"text":"insect","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"leaf","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"butterfly","is_correct":true},{"text":"egg","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$butterfly$q$, $q$The relationship is sequence: SEED comes right before SPROUT, so CATERPILLAR comes right before BUTTERFLY.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c4a1757d-7f70-577a-8d92-08a61d5f4b4c', null, (select id from public.skills where slug = 'prep-analogies'), null, 'hard',
   $q$DAWN is to NOON as DUSK is to ___$q$, $q$[{"text":"hour","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"sunset","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"noon","is_correct":false,"misconception_token":"analogy-reversed-relation"},{"text":"midnight","is_correct":true}]$q$::jsonb, $q$midnight$q$, $q$The relationship is sequence: DAWN comes right before NOON, so DUSK comes right before MIDNIGHT.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1c899719-8b54-5b05-bfae-9b524b6e1085', null, (select id from public.skills where slug = 'prep-analogies'), null, 'medium',
   $q$APPETIZER is to ENTREE as ENTREE is to ___$q$, $q$[{"text":"dessert","is_correct":true},{"text":"food","is_correct":false,"misconception_token":"analogy-same-category-not-relation"},{"text":"restaurant","is_correct":false,"misconception_token":"analogy-associated-not-parallel"},{"text":"appetizer","is_correct":false,"misconception_token":"analogy-reversed-relation"}]$q$::jsonb, $q$dessert$q$, $q$The relationship is sequence: APPETIZER comes right before ENTREE, so ENTREE comes right before DESSERT.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;

commit;
