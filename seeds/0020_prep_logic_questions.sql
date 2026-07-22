-- PathwayEd — Question Engine: PREP logic + verbal classification skills + questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-prep-seeds.ts from the curated
-- pools in src/lib/prep/*Templates.ts. HOW TO APPLY (self-contained — creates the
-- isolated prep subject + domain + skills, then the questions):
--   bun run db:seed seeds/0020_prep_logic_questions.sql
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
values (md5('pe-aos:skill-prep-logic')::uuid, 'skill', md5('pe-aos:dom-prep-verbal')::uuid, 'prep-verbal', 'Logic', 'prep-logic', '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:skill-prep-verbal-classification')::uuid, 'skill', md5('pe-aos:dom-prep-verbal')::uuid, 'prep-verbal', 'Verbal Classification', 'prep-verbal-classification', '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band;

-- prep-logic (Logic) — 42 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5d789b81-cb68-5be8-b4be-55d033700da9', null, (select id from public.skills where slug = 'prep-logic'), null, 'easy',
   $q$Sara is taller than Tom. Tom is taller than Bea. Who is the SHORTEST?$q$, $q$[{"text":"Sara","is_correct":false,"misconception_token":"logic-wrong-order"},{"text":"Bea","is_correct":true},{"text":"Tom","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"They are all the same height","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$Bea$q$, $q$Line them up: Sara > Tom > Bea. Bea is at the bottom, so Bea is the shortest.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7ba3a1d8-124d-5ed1-950a-e344a83a1640', null, (select id from public.skills where slug = 'prep-logic'), null, 'easy',
   $q$All robins are birds. All birds are animals. So all robins are definitely ___?$q$, $q$[{"text":"the only birds there are","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"the same as \"all animals are robins\"","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"animals","is_correct":true},{"text":"also fish","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$animals$q$, $q$Robins are birds, and every bird is an animal, so every robin must be an animal.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8d2c9817-e0bc-5462-a3ce-87b2100f11cf', null, (select id from public.skills where slug = 'prep-logic'), null, 'easy',
   $q$Maya is older than Leo. Leo is older than Kim. Who is the OLDEST?$q$, $q$[{"text":"Kim","is_correct":false,"misconception_token":"logic-wrong-order"},{"text":"Leo","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"It cannot be known","is_correct":false,"misconception_token":"logic-unstated-assumption"},{"text":"Maya","is_correct":true}]$q$::jsonb, $q$Maya$q$, $q$In age order it is Maya > Leo > Kim, so Maya is the oldest.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c71d0b36-9f0d-5d07-a915-4624ed225e87', null, (select id from public.skills where slug = 'prep-logic'), null, 'easy',
   $q$All Bloops are Razzies. All Razzies are Lazzies. So all Bloops are definitely ___?$q$, $q$[{"text":"Lazzies","is_correct":true},{"text":"all Razzies (and nothing more)","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"the same as \"all Lazzies are Bloops\"","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"also Wuzzies","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$Lazzies$q$, $q$Every Bloop is a Razzie, and every Razzie is a Lazzie, so every Bloop must be a Lazzie.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('234c904e-45c8-5565-a4a7-7a9f5edce12c', null, (select id from public.skills where slug = 'prep-logic'), null, 'easy',
   $q$The store is closer than the school. The school is closer than the park. Which is FARTHEST away?$q$, $q$[{"text":"the store","is_correct":false,"misconception_token":"logic-wrong-order"},{"text":"the park","is_correct":true},{"text":"the school","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"they are all the same distance","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$the park$q$, $q$By distance it is store < school < park, so the park is the farthest.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9aa505f3-9256-510e-b308-21750ff0837a', null, (select id from public.skills where slug = 'prep-logic'), null, 'easy',
   $q$Every dog at the shelter has a collar. Rex is a dog at the shelter. So Rex definitely ___?$q$, $q$[{"text":"is the only dog with a collar","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"is proof that anything with a collar is Rex","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"has a collar","is_correct":true},{"text":"also has a leash","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$has a collar$q$, $q$Every dog there has a collar, and Rex is one of those dogs, so Rex has a collar.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('37d52c03-75db-5f52-b302-06356ccf7cd1', null, (select id from public.skills where slug = 'prep-logic'), null, 'easy',
   $q$Ann runs faster than Bea. Bea runs faster than Cara. Who is the SLOWEST runner?$q$, $q$[{"text":"Ann","is_correct":false,"misconception_token":"logic-wrong-order"},{"text":"Bea","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"They all tie","is_correct":false,"misconception_token":"logic-unstated-assumption"},{"text":"Cara","is_correct":true}]$q$::jsonb, $q$Cara$q$, $q$By speed it is Ann > Bea > Cara, so Cara is the slowest.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('4f1d053b-2f56-51f3-b5e0-e5fce1ecfbdf', null, (select id from public.skills where slug = 'prep-logic'), null, 'easy',
   $q$All squares are rectangles. All rectangles have four sides. So every square definitely ___?$q$, $q$[{"text":"has four sides","is_correct":true},{"text":"is the only kind of rectangle","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"means every four-sided shape is a square","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"has four sides that are all equal","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$has four sides$q$, $q$A square is a rectangle, and every rectangle has four sides, so every square has four sides.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e7f4f6cd-c2d6-5e8e-82b4-262cab95ba9d', null, (select id from public.skills where slug = 'prep-logic'), null, 'easy',
   $q$The cat weighs more than the rabbit. The rabbit weighs more than the mouse. Which is the LIGHTEST?$q$, $q$[{"text":"the cat","is_correct":false,"misconception_token":"logic-wrong-order"},{"text":"the mouse","is_correct":true},{"text":"the rabbit","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"cannot tell","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$the mouse$q$, $q$By weight it is cat > rabbit > mouse, so the mouse is the lightest.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0fd9a87d-cd35-5281-87e2-d877f2b52c21', null, (select id from public.skills where slug = 'prep-logic'), null, 'easy',
   $q$Everyone in the chess club can play chess. Tom can play chess. Is Tom definitely in the chess club?$q$, $q$[{"text":"Yes, he must be a member","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"Yes, everyone who can play is a member","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"No — playing chess does not prove he is a member","is_correct":true},{"text":"Yes, the club made him learn","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$No — playing chess does not prove he is a member$q$, $q$Members can all play, but the rule does not say only members can play, so Tom might not be in the club.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('400c8d02-9748-5c5b-8895-ec6e1e63d850', null, (select id from public.skills where slug = 'prep-logic'), null, 'easy',
   $q$Book A is thicker than Book B. Book C is thinner than Book B. Which book is the THICKEST?$q$, $q$[{"text":"Book C","is_correct":false,"misconception_token":"logic-wrong-order"},{"text":"Book B","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"they are equal","is_correct":false,"misconception_token":"logic-unstated-assumption"},{"text":"Book A","is_correct":true}]$q$::jsonb, $q$Book A$q$, $q$From the clues, Book A > Book B > Book C, so Book A is the thickest.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e796fad8-ecda-5414-9e8f-694260aac129', null, (select id from public.skills where slug = 'prep-logic'), null, 'easy',
   $q$All roses are flowers. This plant is a flower. Is it definitely a rose?$q$, $q$[{"text":"No","is_correct":true},{"text":"Yes, all flowers are roses","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"Yes, it has to be a rose","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Yes, it smells like a rose","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$No$q$, $q$Roses are flowers, but many other plants are flowers too, so a flower is not always a rose.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a7261411-5989-5a53-b1e0-6c393990d413', null, (select id from public.skills where slug = 'prep-logic'), null, 'easy',
   $q$Monday was warmer than Tuesday. Tuesday was warmer than Wednesday. Which day was the COLDEST?$q$, $q$[{"text":"Monday","is_correct":false,"misconception_token":"logic-wrong-order"},{"text":"Wednesday","is_correct":true},{"text":"Tuesday","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"all the same","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$Wednesday$q$, $q$By warmth it is Monday > Tuesday > Wednesday, so Wednesday was the coldest.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a901f5d6-8600-55ef-8c5d-19552b075403', null, (select id from public.skills where slug = 'prep-logic'), null, 'easy',
   $q$All Zibs are Zabs. All Zabs are Zubs. So every Zib is definitely a ___?$q$, $q$[{"text":"Zab and only a Zab","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"proof that every Zub is a Zib","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"Zub","is_correct":true},{"text":"Zeb","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$Zub$q$, $q$Every Zib is a Zab, and every Zab is a Zub, so every Zib must be a Zub.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0b2463af-4fb2-5965-87be-8ce414855e5f', null, (select id from public.skills where slug = 'prep-logic'), null, 'medium',
   $q$All sharks are fish. Some fish live in rivers. Can we be sure all sharks live in rivers?$q$, $q$[{"text":"Yes, all sharks live in rivers","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Yes, since all river fish are sharks","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"Yes, sharks need river water","is_correct":false,"misconception_token":"logic-unstated-assumption"},{"text":"No","is_correct":true}]$q$::jsonb, $q$No$q$, $q$Only SOME fish live in rivers, so we cannot say every shark does — the word "some" does not cover all.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c6d2bb97-76c0-54f3-ab11-d312f181a486', null, (select id from public.skills where slug = 'prep-logic'), null, 'medium',
   $q$If a number is even, it can be divided by 2. The number 14 is even. So 14 definitely ___?$q$, $q$[{"text":"can be divided by 2","is_correct":true},{"text":"is the only even number","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"means anything divisible by 2 equals 14","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"can also be divided by 4","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$can be divided by 2$q$, $q$14 is even, and every even number can be divided by 2, so 14 can be divided by 2.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d02b90af-f9a8-554d-9a9f-be7a3afd6498', null, (select id from public.skills where slug = 'prep-logic'), null, 'medium',
   $q$Jo is taller than Kay. Kay is taller than Lee. Lee is taller than Moe. Who is the SHORTEST?$q$, $q$[{"text":"Jo","is_correct":false,"misconception_token":"logic-wrong-order"},{"text":"Moe","is_correct":true},{"text":"Lee","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"cannot be determined","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$Moe$q$, $q$The order is Jo > Kay > Lee > Moe, so Moe is the shortest.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c531c362-212f-5daf-9a38-6b22bc976e5e', null, (select id from public.skills where slug = 'prep-logic'), null, 'medium',
   $q$No reptiles have fur. A snake is a reptile. So a snake definitely ___?$q$, $q$[{"text":"is the only reptile","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"means anything without fur is a snake","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"does not have fur","is_correct":true},{"text":"lives underground","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$does not have fur$q$, $q$No reptile has fur, and a snake is a reptile, so a snake has no fur.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6b67bb92-42a7-52ac-9b28-08e5d5b7979e', null, (select id from public.skills where slug = 'prep-logic'), null, 'medium',
   $q$All athletes on the team train daily. Priya trains daily. Is Priya definitely on the team?$q$, $q$[{"text":"Yes, she must be on the team","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"Yes, everyone who trains is on the team","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Yes, the coach requires it","is_correct":false,"misconception_token":"logic-unstated-assumption"},{"text":"No, not necessarily","is_correct":true}]$q$::jsonb, $q$No, not necessarily$q$, $q$Team athletes all train daily, but others can train daily too, so training does not prove Priya is on the team.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('96e76c47-0af6-5c41-b27b-444391e4f14c', null, (select id from public.skills where slug = 'prep-logic'), null, 'medium',
   $q$Rosa scored higher than Sam. Sam scored higher than Tia. Tia scored higher than Uma. Who scored the HIGHEST?$q$, $q$[{"text":"Rosa","is_correct":true},{"text":"Uma","is_correct":false,"misconception_token":"logic-wrong-order"},{"text":"Sam","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"it was a tie","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$Rosa$q$, $q$Scores run Rosa > Sam > Tia > Uma, so Rosa scored the highest.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('04890d32-b021-52ac-a829-c0d1633ca291', null, (select id from public.skills where slug = 'prep-logic'), null, 'medium',
   $q$If the alarm rings, everyone must leave. The alarm did NOT ring. What must happen?$q$, $q$[{"text":"Everyone must leave anyway","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Nothing is required — they may stay","is_correct":true},{"text":"The alarm rang because they left","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"They must leave a little later","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$Nothing is required — they may stay$q$, $q$The rule only says what happens WHEN the alarm rings. It did not ring, so nothing is required.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f63cc4d2-d18b-5898-8b4f-2ac7ea509e89', null, (select id from public.skills where slug = 'prep-logic'), null, 'medium',
   $q$Some students play soccer. All soccer players wear cleats. Does every student wear cleats?$q$, $q$[{"text":"Yes, all students wear cleats","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Yes, since all cleat-wearers are students","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"No","is_correct":true},{"text":"Yes, the school hands them out","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$No$q$, $q$Only SOME students play soccer, so only those students must wear cleats — not every student.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('979bceeb-bc35-5ca4-8d7a-7054f35dfb2f', null, (select id from public.skills where slug = 'prep-logic'), null, 'medium',
   $q$All maple trees drop their leaves in fall. This tree drops its leaves in fall. Is it definitely a maple?$q$, $q$[{"text":"Yes, it must be a maple","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"Yes, only maples drop leaves","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Yes, it is tall like a maple","is_correct":false,"misconception_token":"logic-unstated-assumption"},{"text":"No","is_correct":true}]$q$::jsonb, $q$No$q$, $q$Maples drop their leaves, but so do many other trees, so dropping leaves does not prove it is a maple.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6f75ce43-f122-53e6-919b-7ea897d246f1', null, (select id from public.skills where slug = 'prep-logic'), null, 'medium',
   $q$Ben is younger than Cal. Cal is younger than Dan. Who is the OLDEST?$q$, $q$[{"text":"Dan","is_correct":true},{"text":"Ben","is_correct":false,"misconception_token":"logic-wrong-order"},{"text":"Cal","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"unknown","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$Dan$q$, $q$From youngest to oldest it is Ben, Cal, Dan, so Dan is the oldest.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d71b26b3-82e9-5ea3-922b-ffbfb0f76631', null, (select id from public.skills where slug = 'prep-logic'), null, 'medium',
   $q$All poodles are dogs. All dogs are mammals. All mammals are warm-blooded. So every poodle is definitely ___?$q$, $q$[{"text":"the only mammal","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"warm-blooded","is_correct":true},{"text":"proof that every warm-blooded animal is a poodle","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"a strong swimmer","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$warm-blooded$q$, $q$Follow the chain: poodle -> dog -> mammal -> warm-blooded, so every poodle is warm-blooded.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('73c02046-14ef-5a93-8a23-17896e0b5eae', null, (select id from public.skills where slug = 'prep-logic'), null, 'medium',
   $q$If Ada studies, she passes. Ada passed the test. Can we be sure she studied?$q$, $q$[{"text":"Yes, she must have studied","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"Yes, passing always means studying","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"No","is_correct":true},{"text":"Yes, a tutor helped her","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$No$q$, $q$Studying leads to passing, but the rule does not say passing only happens after studying, so she might have passed another way.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7c6a8dad-d5fe-5065-ba5d-1d22cfafc394', null, (select id from public.skills where slug = 'prep-logic'), null, 'medium',
   $q$Town P is north of Town Q. Town Q is north of Town R. Which town is FARTHEST south?$q$, $q$[{"text":"Town P","is_correct":false,"misconception_token":"logic-wrong-order"},{"text":"Town Q","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"they are level","is_correct":false,"misconception_token":"logic-unstated-assumption"},{"text":"Town R","is_correct":true}]$q$::jsonb, $q$Town R$q$, $q$From north to south the order is P, Q, R, so Town R is the farthest south.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7f9587ed-59ac-5cbe-99de-8dfb9972c2ec', null, (select id from public.skills where slug = 'prep-logic'), null, 'medium',
   $q$No Glorks are Plinks. Every Snib is a Glork. So no Snib is a ___?$q$, $q$[{"text":"Plink","is_correct":true},{"text":"proof that every Plink is a Snib","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"the only Glork","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Trib","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$Plink$q$, $q$Every Snib is a Glork, and no Glork is a Plink, so no Snib can be a Plink.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c7d8f766-7016-5e13-853b-195feb899553', null, (select id from public.skills where slug = 'prep-logic'), null, 'hard',
   $q$All A are B. No B are C. Can something be both an A and a C?$q$, $q$[{"text":"Yes, some A are C","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"No","is_correct":true},{"text":"Yes, if some C turn out to be A","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"Yes, if a group D links them","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$No$q$, $q$Every A is a B, and no B is a C, so an A (being a B) can never also be a C.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c64509b8-04fe-5019-afa0-80ac7d2c9bc9', null, (select id from public.skills where slug = 'prep-logic'), null, 'hard',
   $q$Only members can enter the library. Sara entered the library. What can we conclude?$q$, $q$[{"text":"Every member entered today","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Anyone who is a member entered","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"Sara is a member","is_correct":true},{"text":"Sara left her card at home","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$Sara is a member$q$, $q$"Only members can enter" means anyone inside must be a member, and Sara entered, so Sara is a member.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b1f68d75-474e-528e-98ae-813adb70685d', null, (select id from public.skills where slug = 'prep-logic'), null, 'hard',
   $q$No fish can survive without water. A goldfish is a fish. What must be true?$q$, $q$[{"text":"A goldfish is the only kind of fish","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Anything that needs water is a fish","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"A goldfish also needs sunlight","is_correct":false,"misconception_token":"logic-unstated-assumption"},{"text":"A goldfish cannot survive without water","is_correct":true}]$q$::jsonb, $q$A goldfish cannot survive without water$q$, $q$No fish survives without water, and a goldfish is a fish, so a goldfish cannot survive without water.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5a5ed8aa-3470-5ab9-949c-394a57a2420a', null, (select id from public.skills where slug = 'prep-logic'), null, 'hard',
   $q$All J are K. All K are L. Some L are M. Is every J definitely an M?$q$, $q$[{"text":"No","is_correct":true},{"text":"Yes, all J are M","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Yes, since some M are J","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"Yes, J reaches M through L","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$No$q$, $q$Every J is an L, but only SOME L are M, so we cannot be sure any given J is an M.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0fa78edc-521c-561a-bfd9-e61cd8093f18', null, (select id from public.skills where slug = 'prep-logic'), null, 'hard',
   $q$W is heavier than X. Y is heavier than W. Z is lighter than X. Which is the HEAVIEST?$q$, $q$[{"text":"Z","is_correct":false,"misconception_token":"logic-wrong-order"},{"text":"Y","is_correct":true},{"text":"W","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"cannot be determined","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$Y$q$, $q$Ordering the clues gives Y > W > X > Z, so Y is the heaviest.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('bc9aba04-b9bf-5ea4-98c8-becdae1aaa5f', null, (select id from public.skills where slug = 'prep-logic'), null, 'hard',
   $q$The shop closes if and ONLY if it is a weekend. Today the shop is open. Is today a weekend?$q$, $q$[{"text":"Yes, it might still be a weekend","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Yes, being open means it is a weekend","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"No","is_correct":true},{"text":"Yes, it is a holiday weekend","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$No$q$, $q$"Closes only on weekends" means open days are NOT weekends, and the shop is open, so today is not a weekend.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ad433094-7ec8-5b76-b80a-6ffc04278341', null, (select id from public.skills where slug = 'prep-logic'), null, 'hard',
   $q$All experts passed the exam. Some who passed are teenagers. Are all experts teenagers?$q$, $q$[{"text":"Yes, all experts are teenagers","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Yes, all teenagers are experts","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"Yes, the exam was easy for them","is_correct":false,"misconception_token":"logic-unstated-assumption"},{"text":"No","is_correct":true}]$q$::jsonb, $q$No$q$, $q$Only SOME who passed are teenagers, so we cannot say every expert is a teenager.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('42d63180-209d-54e0-8297-9561ca48186c', null, (select id from public.skills where slug = 'prep-logic'), null, 'hard',
   $q$No reptiles are warm-blooded. All snakes are reptiles. All warm-blooded animals have a fast heartbeat. From this, do snakes definitely have a fast heartbeat?$q$, $q$[{"text":"No","is_correct":true},{"text":"Yes, all snakes have fast heartbeats","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Yes, a fast heartbeat means a warm-blooded snake","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"Yes, snakes move quickly","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$No$q$, $q$Snakes are reptiles and therefore NOT warm-blooded, so the fast-heartbeat rule (which is about warm-blooded animals) tells us nothing about them.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6de64965-0cc8-58c7-84c7-5fced802a1a7', null, (select id from public.skills where slug = 'prep-logic'), null, 'hard',
   $q$In the race, Rae finished ahead of Sy. Sy finished ahead of Ty. Vic finished ahead of Rae. Who came in LAST?$q$, $q$[{"text":"Vic","is_correct":false,"misconception_token":"logic-wrong-order"},{"text":"Ty","is_correct":true},{"text":"Sy","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"it ended in a tie","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$Ty$q$, $q$The finish order is Vic, Rae, Sy, Ty, so Ty came in last.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c18dd057-fb38-5c61-8b53-a5212f27aaff', null, (select id from public.skills where slug = 'prep-logic'), null, 'hard',
   $q$Every G is an H. No H is an I. Some I are J. Can a G ever be an I?$q$, $q$[{"text":"Yes, some G are I","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Yes, if some I are G","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"No","is_correct":true},{"text":"Yes, through the J group","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$No$q$, $q$Every G is an H, and no H is an I, so no G can be an I. The "some I are J" clue is a distraction.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8384e781-2396-5de0-a6fc-10f77cc21c0c', null, (select id from public.skills where slug = 'prep-logic'), null, 'hard',
   $q$Some birds cannot fly. A penguin is a bird. From this fact ALONE, can we be sure a penguin cannot fly?$q$, $q$[{"text":"Yes, penguins are the birds that cannot fly","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Yes, all flightless birds are penguins","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"Yes, penguins are too heavy to fly","is_correct":false,"misconception_token":"logic-unstated-assumption"},{"text":"No, this alone does not prove it","is_correct":true}]$q$::jsonb, $q$No, this alone does not prove it$q$, $q$"Some birds cannot fly" does not tell us WHICH ones, so being a bird alone does not prove a penguin cannot fly.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fd940846-ed4c-5272-85b9-69b9c437d21f', null, (select id from public.skills where slug = 'prep-logic'), null, 'hard',
   $q$If a plant is a cactus, it stores water. This plant stores water. Must it be a cactus?$q$, $q$[{"text":"No","is_correct":true},{"text":"Yes, it must be a cactus","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"Yes, all water-storing plants are cacti","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Yes, it grows in a desert","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$No$q$, $q$Cacti store water, but other plants store water too, so storing water does not prove it is a cactus.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0bd69652-0228-548b-8f87-38194faf8e77', null, (select id from public.skills where slug = 'prep-logic'), null, 'hard',
   $q$Card 1 is worth more than Card 2. Card 3 is worth more than Card 1. Card 2 is worth more than Card 4. Which card is worth the LEAST?$q$, $q$[{"text":"Card 3","is_correct":false,"misconception_token":"logic-wrong-order"},{"text":"Card 4","is_correct":true},{"text":"Card 2","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"cannot be determined","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$Card 4$q$, $q$Putting it in order: Card 3 > Card 1 > Card 2 > Card 4, so Card 4 is worth the least.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6b930948-d220-5e1e-81d2-14c702a58ec8', null, (select id from public.skills where slug = 'prep-logic'), null, 'hard',
   $q$All chefs can cook. All who can cook can boil water. Some who boil water are kids. Are all chefs kids?$q$, $q$[{"text":"Yes, all chefs are kids","is_correct":false,"misconception_token":"logic-overgeneralized"},{"text":"Yes, all kids are chefs","is_correct":false,"misconception_token":"logic-reversed-implication"},{"text":"No","is_correct":true},{"text":"Yes, kids help the chefs","is_correct":false,"misconception_token":"logic-unstated-assumption"}]$q$::jsonb, $q$No$q$, $q$Chefs can boil water, but only SOME water-boilers are kids, so we cannot say chefs are kids.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;

-- prep-verbal-classification (Verbal Classification) — 42 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7b88eaf8-c87f-5a09-b531-7a65cd6b0793', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'easy',
   $q$Which word belongs in the same group as: rose, tulip, daisy?$q$, $q$[{"text":"ruby","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"lily","is_correct":true},{"text":"vase","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"plant","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$lily$q$, $q$Rose, tulip, and daisy are all FLOWERS, and a lily is a flower, so it belongs. ("Ruby" is just red like a rose, a vase only holds flowers, and "plant" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6a9afd12-0482-537f-803f-357428902c9b', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'easy',
   $q$Which word belongs in the same group as: apple, banana, grape?$q$, $q$[{"text":"basketball","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"juice","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"orange","is_correct":true},{"text":"food","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$orange$q$, $q$Apple, banana, and grape are FRUITS, and an orange is a fruit. ("Basketball" is just round and orange-colored, juice is made from fruit, and "food" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7fd69c30-452d-5c2a-b5ed-bd12c558cba3', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'easy',
   $q$Which word belongs in the same group as: poodle, beagle, boxer?$q$, $q$[{"text":"cat","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"leash","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"animal","is_correct":false,"misconception_token":"class-too-broad-category"},{"text":"collie","is_correct":true}]$q$::jsonb, $q$collie$q$, $q$Poodle, beagle, and boxer are all DOG BREEDS, and a collie is a dog breed. ("Cat" is a pet but a different animal, a leash is just used on dogs, and "animal" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('52b9a73c-1c2d-56fd-b827-b17d32ebf480', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'easy',
   $q$Which word belongs in the same group as: red, blue, green?$q$, $q$[{"text":"yellow","is_correct":true},{"text":"ruby","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"crayon","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"shade","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$yellow$q$, $q$Red, blue, and green are COLORS, and yellow is a color. ("Ruby" is a red gem, a crayon only makes colors, and "shade" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8fac2ef5-7cd1-5c37-8af9-e75e422241b0', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'easy',
   $q$Which word belongs in the same group as: arm, leg, hand?$q$, $q$[{"text":"table","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"foot","is_correct":true},{"text":"sock","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"body","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$foot$q$, $q$Arm, leg, and hand are BODY PARTS, and a foot is a body part. ("Table" only shares the word "leg," a sock just goes on a foot, and "body" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b8be79be-b3da-50d6-8d7d-134d07a9f55f', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'easy',
   $q$Which word belongs in the same group as: Mars, Venus, Jupiter?$q$, $q$[{"text":"Sun","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"telescope","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"Saturn","is_correct":true},{"text":"space","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$Saturn$q$, $q$Mars, Venus, and Jupiter are PLANETS, and Saturn is a planet. (The Sun is in the sky but is a star, a telescope only looks at planets, and "space" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c4e0ca21-9ff4-51f5-8ecb-5add83151abe', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'easy',
   $q$Which word belongs in the same group as: guitar, piano, drums?$q$, $q$[{"text":"radio","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"concert","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"object","is_correct":false,"misconception_token":"class-too-broad-category"},{"text":"violin","is_correct":true}]$q$::jsonb, $q$violin$q$, $q$Guitar, piano, and drums are MUSICAL INSTRUMENTS, and a violin is one. (A radio only plays music, a concert is where instruments are used, and "object" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dc573adf-1e75-5990-a22a-4ea57651cf43', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'easy',
   $q$Which word belongs in the same group as: carrot, potato, onion?$q$, $q$[{"text":"broccoli","is_correct":true},{"text":"apple","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"salad","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"food","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$broccoli$q$, $q$Carrot, potato, and onion are VEGETABLES, and broccoli is a vegetable. (An apple is produce but a fruit, salad is made from vegetables, and "food" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c5848cb0-6333-5412-9188-440973b502cb', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'medium',
   $q$Which word belongs in the same group as: sparrow, robin, eagle?$q$, $q$[{"text":"bat","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"falcon","is_correct":true},{"text":"nest","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"animal","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$falcon$q$, $q$Sparrow, robin, and eagle are BIRDS, and a falcon is a bird. (A bat flies but is a mammal, a nest is where birds live, and "animal" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5293fb0f-90e5-591e-8113-6904ec6fbea2', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'medium',
   $q$Which word belongs in the same group as: iron, copper, gold?$q$, $q$[{"text":"wood","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"ring","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"silver","is_correct":true},{"text":"element","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$silver$q$, $q$Iron, copper, and gold are METALS, and silver is a metal. (Wood is a material but not a metal, a ring can be made of metal, and "element" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9c7906e5-74c9-599c-bda3-4545d73f9edc', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'medium',
   $q$Which word belongs in the same group as: soccer, tennis, hockey?$q$, $q$[{"text":"chess","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"trophy","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"activity","is_correct":false,"misconception_token":"class-too-broad-category"},{"text":"baseball","is_correct":true}]$q$::jsonb, $q$baseball$q$, $q$Soccer, tennis, and hockey are SPORTS, and baseball is a sport. (Chess is a game but not a physical sport, a trophy is a prize for sports, and "activity" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('cd34e292-fcd5-5cb9-ae8d-fe2f071400ea', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'medium',
   $q$Which word belongs in the same group as: Texas, Ohio, Nevada?$q$, $q$[{"text":"Florida","is_correct":true},{"text":"Paris","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"flag","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"place","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$Florida$q$, $q$Texas, Ohio, and Nevada are U.S. STATES, and Florida is a state. (Paris is a place but a city, a flag represents a state, and "place" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ddc1d012-5057-521a-9dc9-83dbad024eaf', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'medium',
   $q$Which word belongs in the same group as: ant, bee, beetle?$q$, $q$[{"text":"spider","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"grasshopper","is_correct":true},{"text":"hive","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"creature","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$grasshopper$q$, $q$Ant, bee, and beetle are INSECTS (six legs), and a grasshopper is an insect. (A spider is a small crawler but has eight legs, a hive is where bees live, and "creature" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b04b38ea-5cec-5e27-84c0-76a3093ec1a1', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'medium',
   $q$Which word belongs in the same group as: triangle, square, circle?$q$, $q$[{"text":"cube","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"ruler","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"pentagon","is_correct":true},{"text":"figure","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$pentagon$q$, $q$Triangle, square, and circle are flat SHAPES, and a pentagon is a flat shape. (A cube has square faces but is 3-D, a ruler is used to draw shapes, and "figure" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f3ab5dfb-07b9-54df-bbc6-3db0d81204a3', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'medium',
   $q$Which word belongs in the same group as: oak, pine, maple?$q$, $q$[{"text":"bush","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"acorn","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"plant","is_correct":false,"misconception_token":"class-too-broad-category"},{"text":"birch","is_correct":true}]$q$::jsonb, $q$birch$q$, $q$Oak, pine, and maple are TREES, and a birch is a tree. (A bush is leafy but not a tree, an acorn comes from an oak, and "plant" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2e355546-1b92-5d74-9ee7-5cf29f1c24bc', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'medium',
   $q$Which word belongs in the same group as: water, milk, juice?$q$, $q$[{"text":"oil","is_correct":true},{"text":"ice","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"cup","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"substance","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$oil$q$, $q$Water, milk, and juice are LIQUIDS, and oil is a liquid. (Ice is made of water but is solid, a cup holds liquid, and "substance" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6de2f240-1824-59b8-859b-a7592d959f7f', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'hard',
   $q$Which word belongs in the same group as: whale, tiger, bat?$q$, $q$[{"text":"shark","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"dolphin","is_correct":true},{"text":"ocean","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"animal","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$dolphin$q$, $q$Whale, tiger, and bat are MAMMALS, and a dolphin is a mammal. (A shark swims in the sea but is a fish, the ocean is where whales live, and "animal" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b8479794-201e-5a57-a681-fe2b517127c9', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'hard',
   $q$Which word belongs in the same group as: diamond, ruby, emerald?$q$, $q$[{"text":"glass","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"ring","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"sapphire","is_correct":true},{"text":"rock","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$sapphire$q$, $q$Diamond, ruby, and emerald are GEMSTONES, and a sapphire is a gemstone. (Glass sparkles but is not a gem, a ring holds gems, and "rock" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('0acaaf90-0d31-5a99-ad8d-605389d6b6c9', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'hard',
   $q$Which word belongs in the same group as: basil, mint, thyme?$q$, $q$[{"text":"lettuce","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"garden","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"plant","is_correct":false,"misconception_token":"class-too-broad-category"},{"text":"parsley","is_correct":true}]$q$::jsonb, $q$parsley$q$, $q$Basil, mint, and thyme are HERBS, and parsley is an herb. (Lettuce is green and leafy but a salad green, a garden is where herbs grow, and "plant" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('72182c51-9191-5ad8-99b5-604eb4b4f15e', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'hard',
   $q$Which word belongs in the same group as: Africa, Asia, Europe?$q$, $q$[{"text":"Australia","is_correct":true},{"text":"Atlantic","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"map","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"landmass","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$Australia$q$, $q$Africa, Asia, and Europe are CONTINENTS, and Australia is a continent. (The Atlantic is a huge geographic name but an ocean, a map shows continents, and "landmass" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('60c8f87f-5f68-5bc9-9bb4-5a17d6e3dd1e', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'hard',
   $q$Which word belongs in the same group as: dollar, euro, yen?$q$, $q$[{"text":"gold","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"peso","is_correct":true},{"text":"wallet","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"money","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$peso$q$, $q$Dollar, euro, and yen are CURRENCIES, and the peso is a currency. (Gold is valuable but not a currency, a wallet holds money, and "money" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8e3a85dc-5f31-5dfa-8475-6e5c5ae95e13', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'hard',
   $q$Which word belongs in the same group as: lizard, snake, turtle?$q$, $q$[{"text":"frog","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"scales","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"crocodile","is_correct":true},{"text":"animal","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$crocodile$q$, $q$Lizard, snake, and turtle are REPTILES, and a crocodile is a reptile. (A frog is a cold-blooded pond animal but an amphibian, scales cover reptiles, and "animal" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b6da8e36-5e38-5df0-a7c9-9bc617fd7b22', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'hard',
   $q$Which word belongs in the same group as: wheat, rice, oats?$q$, $q$[{"text":"bean","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"bread","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"food","is_correct":false,"misconception_token":"class-too-broad-category"},{"text":"barley","is_correct":true}]$q$::jsonb, $q$barley$q$, $q$Wheat, rice, and oats are GRAINS, and barley is a grain. (A bean is a crop seed but a legume, bread is made from grain, and "food" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('26e31613-fdfb-5e38-be2d-ceeed51dba01', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'hard',
   $q$Which word belongs in the same group as: whisper, shout, mumble?$q$, $q$[{"text":"yell","is_correct":true},{"text":"listen","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"voice","is_correct":false,"misconception_token":"class-associated-not-member"},{"text":"speak","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$yell$q$, $q$Whisper, shout, and mumble are all WAYS OF SAYING something, and "yell" is one too. (Listen is about the ears, not talking; a voice is what you use to talk; and "speak" is too broad.)$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a4401210-820d-5b6b-9a1d-dba5c7f3580e', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'easy',
   $q$Which word does NOT belong with the others: apple, banana, carrot, grape?$q$, $q$[{"text":"apple","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"carrot","is_correct":true},{"text":"grape","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"banana","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$carrot$q$, $q$Apple, banana, and grape are all FRUITS, but a carrot is a vegetable, so the carrot does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('02c1f120-4130-5956-8205-baed01fbdcae', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'easy',
   $q$Which word does NOT belong with the others: car, truck, bus, boat?$q$, $q$[{"text":"car","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"bus","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"boat","is_correct":true},{"text":"truck","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$boat$q$, $q$Car, truck, and bus all travel on ROADS, but a boat travels on water, so the boat does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3b27d8b9-e42f-5c4f-8aa2-d1cb1fec069f', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'easy',
   $q$Which word does NOT belong with the others: red, green, blue, tall?$q$, $q$[{"text":"red","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"blue","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"green","is_correct":false,"misconception_token":"class-too-broad-category"},{"text":"tall","is_correct":true}]$q$::jsonb, $q$tall$q$, $q$Red, green, and blue are all COLORS, but "tall" describes size, so "tall" does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7f1e2c3e-7b8f-5ee2-ad5d-4af83de5976f', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'easy',
   $q$Which word does NOT belong with the others: dog, cat, rabbit, oak?$q$, $q$[{"text":"oak","is_correct":true},{"text":"dog","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"rabbit","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"cat","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$oak$q$, $q$Dog, cat, and rabbit are all ANIMALS, but an oak is a tree, so "oak" does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5e559988-8d82-5c2a-a07a-1f4c8c3cd9a8', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'easy',
   $q$Which word does NOT belong with the others: circle, square, triangle, red?$q$, $q$[{"text":"circle","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"red","is_correct":true},{"text":"triangle","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"square","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$red$q$, $q$Circle, square, and triangle are all SHAPES, but "red" is a color, so "red" does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('efd45072-4c26-5784-adf4-b99250ef66be', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'easy',
   $q$Which word does NOT belong with the others: spoon, fork, knife, plate?$q$, $q$[{"text":"spoon","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"knife","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"plate","is_correct":true},{"text":"fork","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$plate$q$, $q$Spoon, fork, and knife are UTENSILS you hold to eat, but a plate is a dish, so the plate does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ab4105ed-82fb-5c8b-bcfa-d5d9f16422d0', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'medium',
   $q$Which word does NOT belong with the others: robin, sparrow, eagle, bat?$q$, $q$[{"text":"robin","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"eagle","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"sparrow","is_correct":false,"misconception_token":"class-too-broad-category"},{"text":"bat","is_correct":true}]$q$::jsonb, $q$bat$q$, $q$Robin, sparrow, and eagle are all BIRDS, but a bat is a mammal that flies, so the bat does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5bc6e6f1-7670-5a09-9b80-4bcb15e9bcd1', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'medium',
   $q$Which word does NOT belong with the others: rose, tulip, daisy, oak?$q$, $q$[{"text":"oak","is_correct":true},{"text":"rose","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"daisy","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"tulip","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$oak$q$, $q$Rose, tulip, and daisy are all FLOWERS, but an oak is a tree, so "oak" does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9417b32f-d013-5780-86b4-844fde221caa', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'medium',
   $q$Which word does NOT belong with the others: copper, iron, gold, wood?$q$, $q$[{"text":"copper","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"wood","is_correct":true},{"text":"gold","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"iron","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$wood$q$, $q$Copper, iron, and gold are all METALS, but wood is not a metal, so "wood" does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('72ad214a-f80a-5dd0-a293-9bb3c0194586', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'medium',
   $q$Which word does NOT belong with the others: shark, whale, tuna, salmon?$q$, $q$[{"text":"tuna","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"shark","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"whale","is_correct":true},{"text":"salmon","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$whale$q$, $q$Shark, tuna, and salmon are all FISH, but a whale is a mammal that lives in the sea, so the whale does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f7fefc0f-0090-5c2c-bd3b-3b806437fc15', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'medium',
   $q$Which word does NOT belong with the others: Mercury, Venus, Mars, Moon?$q$, $q$[{"text":"Mercury","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"Mars","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"Venus","is_correct":false,"misconception_token":"class-too-broad-category"},{"text":"Moon","is_correct":true}]$q$::jsonb, $q$Moon$q$, $q$Mercury, Venus, and Mars are all PLANETS, but the Moon orbits Earth and is not a planet, so the Moon does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6802d8d9-db3c-5765-9799-8fcb19077980', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'medium',
   $q$Which word does NOT belong with the others: guitar, violin, drum, singer?$q$, $q$[{"text":"singer","is_correct":true},{"text":"guitar","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"drum","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"violin","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$singer$q$, $q$Guitar, violin, and drum are INSTRUMENTS, but a singer is a person, so "singer" does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('248e1e24-2712-5954-b64b-af4e2cbc0eb5', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'hard',
   $q$Which word does NOT belong with the others: python, cobra, lizard, frog?$q$, $q$[{"text":"python","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"frog","is_correct":true},{"text":"lizard","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"cobra","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$frog$q$, $q$Python, cobra, and lizard are all REPTILES, but a frog is an amphibian, so the frog does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e01141a6-64c8-5baf-ab8f-d3c88397f434', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'hard',
   $q$Which word does NOT belong with the others: square, rectangle, rhombus, triangle?$q$, $q$[{"text":"square","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"rhombus","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"triangle","is_correct":true},{"text":"rectangle","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$triangle$q$, $q$Square, rectangle, and rhombus all have FOUR sides, but a triangle has three sides, so the triangle does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c251ab9f-f98f-5ddb-b0fe-a23a5dd89651', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'hard',
   $q$Which word does NOT belong with the others: violet, indigo, crimson, canvas?$q$, $q$[{"text":"violet","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"crimson","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"indigo","is_correct":false,"misconception_token":"class-too-broad-category"},{"text":"canvas","is_correct":true}]$q$::jsonb, $q$canvas$q$, $q$Violet, indigo, and crimson are all COLORS, but canvas is a cloth you paint on, so "canvas" does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a24dd24a-cba1-5d5e-a40a-1e5595fc8c18', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'hard',
   $q$Which word does NOT belong with the others: sonnet, haiku, limerick, novel?$q$, $q$[{"text":"novel","is_correct":true},{"text":"sonnet","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"limerick","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"haiku","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$novel$q$, $q$Sonnet, haiku, and limerick are all kinds of POEMS, but a novel is a long prose story, so "novel" does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d8859f0d-70f3-5fe8-b7b2-2d7a07997033', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'hard',
   $q$Which word does NOT belong with the others: oxygen, hydrogen, helium, water?$q$, $q$[{"text":"oxygen","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"water","is_correct":true},{"text":"helium","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"hydrogen","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$water$q$, $q$Oxygen, hydrogen, and helium are all ELEMENTS, but water is a compound made of two elements, so "water" does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2c77ca67-0a71-5007-a8bc-e6f5b654f563', null, (select id from public.skills where slug = 'prep-verbal-classification'), null, 'hard',
   $q$Which word does NOT belong with the others: addition, subtraction, division, equation?$q$, $q$[{"text":"addition","is_correct":false,"misconception_token":"class-picked-a-member"},{"text":"division","is_correct":false,"misconception_token":"class-wrong-attribute"},{"text":"equation","is_correct":true},{"text":"subtraction","is_correct":false,"misconception_token":"class-too-broad-category"}]$q$::jsonb, $q$equation$q$, $q$Addition, subtraction, and division are all OPERATIONS, but an equation is a full math statement, so "equation" does not belong.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;

commit;
