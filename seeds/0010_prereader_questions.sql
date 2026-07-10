-- PathwayEd — Question Engine: K-2 PRE-READER (audio-picture) items (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-prereader-seeds.ts from the
-- curated pool in src/lib/preReaderTemplates.ts. Self-contained (creates each K
-- domain + skill with CCSS tags, then the audio-picture questions).
-- HOW TO APPLY (needs the audio-picture schema + re-level migration first):
--   bun run db:seed seeds/0010_prereader_questions.sql
-- Idempotent (deterministic ids). 100% ORIGINAL, authored to CCSS K.CC / RF.K.

begin;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-cc')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Counting & Cardinality', null, 'k-2', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-counting')::uuid, 'skill', md5('pe-aos:dom-math-cc')::uuid, 'math', 'Counting', 'counting', 'k-2', 'problem-solving-data-analysis', 'K', 0, 'CCSS.MATH.CONTENT.K.CC.B.5', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- counting (Counting, grade K, CCSS.MATH.CONTENT.K.CC.B.5) — 28 audio-picture items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('fa403660-7cd4-5242-9e9d-8deb738f6b0b', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'easy', $q$How many apples do you see? Tap the number.$q$, $q$[{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"3","is_correct":true,"tile":{"kind":"number","value":"3"}},{"text":"2","is_correct":false,"tile":{"kind":"number","value":"2"}}]$q$::jsonb, $q$3$q$, $q$Let's count the apples together: one, two, three. There are 3 apples!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"apple","count":3}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('ebc180c1-d2a8-523f-bcd5-461b6cb4a64d', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'easy', $q$How many stars do you see? Tap the number.$q$, $q$[{"text":"5","is_correct":true,"tile":{"kind":"number","value":"5"}},{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}}]$q$::jsonb, $q$5$q$, $q$Let's count the stars: one, two, three, four, five. There are 5 stars!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"star","count":5}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('4e8a201d-7a45-5740-9b73-7be83e99c460', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'easy', $q$How many balls do you see? Tap the number.$q$, $q$[{"text":"1","is_correct":false,"tile":{"kind":"number","value":"1"}},{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}},{"text":"2","is_correct":true,"tile":{"kind":"number","value":"2"}}]$q$::jsonb, $q$2$q$, $q$Let's count the balls: one, two. There are 2 balls!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"ball","count":2}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('18c7d144-ce07-590c-971b-700a027b3b5c', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'medium', $q$How many flowers do you see? Tap the number.$q$, $q$[{"text":"7","is_correct":true,"tile":{"kind":"number","value":"7"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}}]$q$::jsonb, $q$7$q$, $q$Let's touch each flower and count: one, two, three, four, five, six, seven. There are 7 flowers!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"flower","count":7}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('f969cfe8-06fb-5b99-9736-24386fc80a28', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'medium', $q$How many ducks do you see? Tap the number.$q$, $q$[{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"4","is_correct":true,"tile":{"kind":"number","value":"4"}}]$q$::jsonb, $q$4$q$, $q$Let's count the ducks: one, two, three, four. There are 4 ducks!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"duck","count":4}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c9129883-6ffa-5ea6-94ee-2bada94c8ac0', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'medium', $q$How many fish do you see? Tap the number.$q$, $q$[{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"6","is_correct":true,"tile":{"kind":"number","value":"6"}}]$q$::jsonb, $q$6$q$, $q$Let's count the fish: one, two, three, four, five, six. There are 6 fish!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"fish","count":6}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('de089fd5-0c9d-5de7-ad09-5af418a0f7fe', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'hard', $q$How many apples do you see? Tap the number.$q$, $q$[{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"9","is_correct":true,"tile":{"kind":"number","value":"9"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}}]$q$::jsonb, $q$9$q$, $q$Let's touch each apple and count all the way to nine. There are 9 apples!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"apple","count":9}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('789e617b-d9d9-59d3-9c73-c146f4f1a6a3', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'easy', $q$How many stars do you see? Tap the number.$q$, $q$[{"text":"2","is_correct":false,"tile":{"kind":"number","value":"2"}},{"text":"1","is_correct":true,"tile":{"kind":"number","value":"1"}},{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}}]$q$::jsonb, $q$1$q$, $q$There is just one star. The answer is 1!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"star","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('02cb6fc8-fdb1-5df5-a373-bfd19e67245c', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'medium', $q$How many balls do you see? Tap the number.$q$, $q$[{"text":"8","is_correct":true,"tile":{"kind":"number","value":"8"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}}]$q$::jsonb, $q$8$q$, $q$Let's count the balls all the way to eight. There are 8 balls!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"ball","count":8}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('ed91c523-8921-5cbe-8f18-417e2049de9c', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'easy', $q$Tap the group that shows 3.$q$, $q$[{"text":"2","is_correct":false,"tile":{"kind":"object_group","image":"star","count":2}},{"text":"3","is_correct":true,"tile":{"kind":"object_group","image":"star","count":3}},{"text":"4","is_correct":false,"tile":{"kind":"object_group","image":"star","count":4}}]$q$::jsonb, $q$3$q$, $q$Let's count each group. One, two, three — this group shows 3!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('203eb671-e0bd-5643-8d39-ef6eb38902af', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'easy', $q$Tap the group that shows 4.$q$, $q$[{"text":"3","is_correct":false,"tile":{"kind":"object_group","image":"apple","count":3}},{"text":"4","is_correct":true,"tile":{"kind":"object_group","image":"apple","count":4}},{"text":"5","is_correct":false,"tile":{"kind":"object_group","image":"apple","count":5}}]$q$::jsonb, $q$4$q$, $q$Let's count each group. The group with four apples is the one that shows 4!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('33610dde-d1f2-5c02-a1a8-d2647f0ed437', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'easy', $q$Tap the group that shows 2.$q$, $q$[{"text":"1","is_correct":false,"tile":{"kind":"object_group","image":"duck","count":1}},{"text":"3","is_correct":false,"tile":{"kind":"object_group","image":"duck","count":3}},{"text":"2","is_correct":true,"tile":{"kind":"object_group","image":"duck","count":2}}]$q$::jsonb, $q$2$q$, $q$Let's count. The group with two ducks shows 2!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('f14f2ddb-c24c-50d7-a68a-c222cd09fbc2', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'medium', $q$Tap the group that shows 6.$q$, $q$[{"text":"5","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":5}},{"text":"6","is_correct":true,"tile":{"kind":"object_group","image":"ball","count":6}},{"text":"4","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":4}},{"text":"7","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":7}}]$q$::jsonb, $q$6$q$, $q$Let's count each group carefully. The group with six balls shows 6!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('5d9b5415-09fb-5870-a2a8-21e69fce2c10', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'medium', $q$Tap the group that shows 5.$q$, $q$[{"text":"7","is_correct":false,"tile":{"kind":"object_group","image":"flower","count":7}},{"text":"4","is_correct":false,"tile":{"kind":"object_group","image":"flower","count":4}},{"text":"5","is_correct":true,"tile":{"kind":"object_group","image":"flower","count":5}},{"text":"6","is_correct":false,"tile":{"kind":"object_group","image":"flower","count":6}}]$q$::jsonb, $q$5$q$, $q$Let's count. The group with five flowers shows 5!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('d5588902-ba11-5faf-9b52-78ccf498d033', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'medium', $q$Tap the group that shows 8.$q$, $q$[{"text":"6","is_correct":false,"tile":{"kind":"object_group","image":"fish","count":6}},{"text":"7","is_correct":false,"tile":{"kind":"object_group","image":"fish","count":7}},{"text":"9","is_correct":false,"tile":{"kind":"object_group","image":"fish","count":9}},{"text":"8","is_correct":true,"tile":{"kind":"object_group","image":"fish","count":8}}]$q$::jsonb, $q$8$q$, $q$Let's count each group all the way. The group with eight fish shows 8!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c3b86a3e-faee-52c3-9d25-be2de00a49ee', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'hard', $q$Tap the group that shows 10.$q$, $q$[{"text":"10","is_correct":true,"tile":{"kind":"object_group","image":"star","count":10}},{"text":"11","is_correct":false,"tile":{"kind":"object_group","image":"star","count":11}},{"text":"8","is_correct":false,"tile":{"kind":"object_group","image":"star","count":8}},{"text":"9","is_correct":false,"tile":{"kind":"object_group","image":"star","count":9}}]$q$::jsonb, $q$10$q$, $q$Let's count each group of stars all the way to ten. The group of 10 is the answer!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('927888c9-f1fa-5aef-984f-ad5b84351b33', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'easy', $q$Tap the group that shows 1.$q$, $q$[{"text":"2","is_correct":false,"tile":{"kind":"object_group","image":"apple","count":2}},{"text":"3","is_correct":false,"tile":{"kind":"object_group","image":"apple","count":3}},{"text":"1","is_correct":true,"tile":{"kind":"object_group","image":"apple","count":1}}]$q$::jsonb, $q$1$q$, $q$The group with just one apple shows 1!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('e3a5791d-7d69-5c87-bdd5-40fc2085224b', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'medium', $q$Tap the group that shows 7.$q$, $q$[{"text":"7","is_correct":true,"tile":{"kind":"object_group","image":"duck","count":7}},{"text":"6","is_correct":false,"tile":{"kind":"object_group","image":"duck","count":6}},{"text":"5","is_correct":false,"tile":{"kind":"object_group","image":"duck","count":5}},{"text":"8","is_correct":false,"tile":{"kind":"object_group","image":"duck","count":8}}]$q$::jsonb, $q$7$q$, $q$Let's count each group. The group with seven ducks shows 7!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('ad173963-ae90-55f3-ab0e-b4f1b28aa78b', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'easy', $q$How many cats do you see? Tap the number.$q$, $q$[{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}},{"text":"4","is_correct":true,"tile":{"kind":"number","value":"4"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}}]$q$::jsonb, $q$4$q$, $q$Let's count the cats: one, two, three, four. There are 4 cats!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"cat","count":4}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('9bf22865-0524-5239-856b-f1c739cb035b', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'medium', $q$How many hats do you see? Tap the number.$q$, $q$[{"text":"6","is_correct":true,"tile":{"kind":"number","value":"6"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}}]$q$::jsonb, $q$6$q$, $q$Let's count the hats: one, two, three, four, five, six. There are 6 hats!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"hat","count":6}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('83e062aa-48aa-5fc5-8ce6-4908be2b5c08', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'easy', $q$How many keys do you see? Tap the number.$q$, $q$[{"text":"2","is_correct":false,"tile":{"kind":"number","value":"2"}},{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"3","is_correct":true,"tile":{"kind":"number","value":"3"}}]$q$::jsonb, $q$3$q$, $q$Let's count the keys: one, two, three. There are 3 keys!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"key","count":3}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('258b5200-d60b-596c-9f2e-26a6a59cbc7e', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'medium', $q$How many leaves do you see? Tap the number.$q$, $q$[{"text":"8","is_correct":true,"tile":{"kind":"number","value":"8"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}}]$q$::jsonb, $q$8$q$, $q$Let's touch each leaf and count all the way to eight. There are 8 leaves!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"leaf","count":8}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('051859e7-e13a-5b70-b7bd-744da6d24154', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'medium', $q$How many pigs do you see? Tap the number.$q$, $q$[{"text":"5","is_correct":true,"tile":{"kind":"number","value":"5"}},{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}}]$q$::jsonb, $q$5$q$, $q$Let's count the pigs: one, two, three, four, five. There are 5 pigs!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"pig","count":5}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('df1c0142-dc84-50fb-a137-7e6da2c10030', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'easy', $q$Tap the group that shows 5.$q$, $q$[{"text":"5","is_correct":true,"tile":{"kind":"object_group","image":"cat","count":5}},{"text":"4","is_correct":false,"tile":{"kind":"object_group","image":"cat","count":4}},{"text":"6","is_correct":false,"tile":{"kind":"object_group","image":"cat","count":6}}]$q$::jsonb, $q$5$q$, $q$Let's count each group. The group with five cats shows 5!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('fd135798-ecbd-580e-827b-8cb2027a994c', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'hard', $q$Tap the group that shows 9.$q$, $q$[{"text":"9","is_correct":true,"tile":{"kind":"object_group","image":"ring","count":9}},{"text":"7","is_correct":false,"tile":{"kind":"object_group","image":"ring","count":7}},{"text":"10","is_correct":false,"tile":{"kind":"object_group","image":"ring","count":10}},{"text":"8","is_correct":false,"tile":{"kind":"object_group","image":"ring","count":8}}]$q$::jsonb, $q$9$q$, $q$Let's count carefully. The group with nine rings shows 9!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('aa0d6cd3-8094-5d77-8fcb-57ebf3234ef4', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'easy', $q$Tap the group that shows 2.$q$, $q$[{"text":"1","is_correct":false,"tile":{"kind":"object_group","image":"sun","count":1}},{"text":"2","is_correct":true,"tile":{"kind":"object_group","image":"sun","count":2}},{"text":"3","is_correct":false,"tile":{"kind":"object_group","image":"sun","count":3}}]$q$::jsonb, $q$2$q$, $q$Let's count. The group with two suns shows 2!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('313f936e-eb87-51d7-b395-9bd7b9715137', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'medium', $q$Tap the group that shows 6.$q$, $q$[{"text":"6","is_correct":true,"tile":{"kind":"object_group","image":"tree","count":6}},{"text":"7","is_correct":false,"tile":{"kind":"object_group","image":"tree","count":7}},{"text":"5","is_correct":false,"tile":{"kind":"object_group","image":"tree","count":5}},{"text":"4","is_correct":false,"tile":{"kind":"object_group","image":"tree","count":4}}]$q$::jsonb, $q$6$q$, $q$Let's count each group. The group with six trees shows 6!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('00ee6aa0-5fb8-580b-ba8a-c1384cce32c7', null, (select id from public.skills where slug = 'counting'),
   'problem-solving-data-analysis', 'hard', $q$Tap the group that shows 10.$q$, $q$[{"text":"8","is_correct":false,"tile":{"kind":"object_group","image":"van","count":8}},{"text":"10","is_correct":true,"tile":{"kind":"object_group","image":"van","count":10}},{"text":"9","is_correct":false,"tile":{"kind":"object_group","image":"van","count":9}},{"text":"11","is_correct":false,"tile":{"kind":"object_group","image":"van","count":11}}]$q$::jsonb, $q$10$q$, $q$Let's count all the way to ten. The group with ten vans shows 10!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-reading-foundational')::uuid, 'domain', md5('pe-aos:subj-reading')::uuid, 'reading', 'Reading Foundational Skills', null, 'k-2', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-letter-sounds')::uuid, 'skill', md5('pe-aos:dom-reading-foundational')::uuid, 'reading', 'Letter Sounds', 'letter-sounds', 'k-2', 'information-and-ideas', 'K', 0, 'CCSS.ELA-LITERACY.RF.K.3.A', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- letter-sounds (Letter Sounds, grade K, CCSS.ELA-LITERACY.RF.K.3.A) — 28 audio-picture items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('904df15a-724a-5574-a290-5a3114e353bf', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'easy', $q$Listen: ball. Which letter does ball start with?$q$, $q$[{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"B","is_correct":true,"tile":{"kind":"letter","value":"B"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}}]$q$::jsonb, $q$B$q$, $q$Ball starts with buh… B! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"ball","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('13cf7853-a8e9-5d98-888e-447f09ae2665', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'easy', $q$Listen: cat. Which letter does cat start with?$q$, $q$[{"text":"C","is_correct":true,"tile":{"kind":"letter","value":"C"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}}]$q$::jsonb, $q$C$q$, $q$Cat starts with kuh… C! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"cat","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('5dbb6561-f57b-5bc2-b80e-7833de7ed794', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'easy', $q$Listen: duck. Which letter does duck start with?$q$, $q$[{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"D","is_correct":true,"tile":{"kind":"letter","value":"D"}}]$q$::jsonb, $q$D$q$, $q$Duck starts with duh… D! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"duck","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('7d519a0b-56c6-5195-bbd3-403d1578bf5f', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'easy', $q$Listen: fish. Which letter does fish start with?$q$, $q$[{"text":"F","is_correct":true,"tile":{"kind":"letter","value":"F"}},{"text":"L","is_correct":false,"tile":{"kind":"letter","value":"L"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}}]$q$::jsonb, $q$F$q$, $q$Fish starts with fff… F! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"fish","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('0b5db5ca-815b-5d41-ae5b-2c9f8554d05e', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'easy', $q$Listen: moon. Which letter does moon start with?$q$, $q$[{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"M","is_correct":true,"tile":{"kind":"letter","value":"M"}}]$q$::jsonb, $q$M$q$, $q$Moon starts with mmm… M! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"moon","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('b8e7a377-1f26-5a0d-86fc-0ed8b3023d2c', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'easy', $q$Listen: sun. Which letter does sun start with?$q$, $q$[{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"B","is_correct":false,"tile":{"kind":"letter","value":"B"}},{"text":"S","is_correct":true,"tile":{"kind":"letter","value":"S"}}]$q$::jsonb, $q$S$q$, $q$Sun starts with sss… S! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"sun","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('63cc0ddb-e590-5822-9857-414017ff86f3', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'easy', $q$Listen: tree. Which letter does tree start with?$q$, $q$[{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"T","is_correct":true,"tile":{"kind":"letter","value":"T"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}}]$q$::jsonb, $q$T$q$, $q$Tree starts with tuh… T! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"tree","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('489d38b1-0ccd-56e3-90e7-55fabbce3d07', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'medium', $q$Listen: leaf. Which letter does leaf start with?$q$, $q$[{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"L","is_correct":true,"tile":{"kind":"letter","value":"L"}},{"text":"F","is_correct":false,"tile":{"kind":"letter","value":"F"}}]$q$::jsonb, $q$L$q$, $q$Leaf starts with lll… L! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"leaf","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('abf92ea7-c44f-5377-a8b3-b1b7360bae6f', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'medium', $q$Listen: pig. Which letter does pig start with?$q$, $q$[{"text":"P","is_correct":true,"tile":{"kind":"letter","value":"P"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}}]$q$::jsonb, $q$P$q$, $q$Pig starts with puh… P! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"pig","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c6bda05f-ed22-57c2-9056-95b4666e9de1', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'medium', $q$Listen: ring. Which letter does ring start with?$q$, $q$[{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"R","is_correct":true,"tile":{"kind":"letter","value":"R"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}}]$q$::jsonb, $q$R$q$, $q$Ring starts with rrr… R! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"ring","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('854cc072-9017-590c-be9a-2367c010518d', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'medium', $q$Listen: hat. Which letter does hat start with?$q$, $q$[{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"H","is_correct":true,"tile":{"kind":"letter","value":"H"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}}]$q$::jsonb, $q$H$q$, $q$Hat starts with hhh… H! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"hat","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('583736ed-e04b-5b0e-bb52-72cd1a4137bd', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'medium', $q$Listen: key. Which letter does key start with?$q$, $q$[{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"K","is_correct":true,"tile":{"kind":"letter","value":"K"}}]$q$::jsonb, $q$K$q$, $q$Key starts with kuh… K! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"key","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('e8dfa0e0-4dd7-5ac6-bdf0-ee252eaaced2', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'medium', $q$Listen: gift. Which letter does gift start with?$q$, $q$[{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"G","is_correct":true,"tile":{"kind":"letter","value":"G"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}}]$q$::jsonb, $q$G$q$, $q$Gift starts with guh… G! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"gift","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('638252e6-a33e-5322-9eac-60bf74d9ddd6', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'hard', $q$Listen: van. Which letter does van start with?$q$, $q$[{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"V","is_correct":true,"tile":{"kind":"letter","value":"V"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}}]$q$::jsonb, $q$V$q$, $q$Van starts with vvv… V! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"van","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c2e8b678-2aee-5f5f-b6b0-92e6e1558551', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'hard', $q$Listen: apple. Which letter does apple start with?$q$, $q$[{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"E","is_correct":false,"tile":{"kind":"letter","value":"E"}},{"text":"O","is_correct":false,"tile":{"kind":"letter","value":"O"}},{"text":"A","is_correct":true,"tile":{"kind":"letter","value":"A"}}]$q$::jsonb, $q$A$q$, $q$Apple starts with A… aaa, apple! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"apple","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c0f4cdbc-c341-52c5-bcce-22f53b1b3d19', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'medium', $q$Listen: house. Which letter does house start with?$q$, $q$[{"text":"H","is_correct":true,"tile":{"kind":"letter","value":"H"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}}]$q$::jsonb, $q$H$q$, $q$House starts with hhh… H! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"house","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('b160b54b-15e0-5dcb-9338-63b3c5005a1a', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'medium', $q$Listen: cap. Which letter does cap start with?$q$, $q$[{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"C","is_correct":true,"tile":{"kind":"letter","value":"C"}}]$q$::jsonb, $q$C$q$, $q$Cap starts with kuh… C! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"cap","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('97ee16b3-f1b2-5132-9882-93fae020d074', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'easy', $q$Listen: bus. Which letter does bus start with?$q$, $q$[{"text":"B","is_correct":true,"tile":{"kind":"letter","value":"B"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}}]$q$::jsonb, $q$B$q$, $q$Bus starts with buh… B! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"bus","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('21b815de-adf0-5996-b0c8-ce0d475f3b1f', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'medium', $q$Listen: door. Which letter does door start with?$q$, $q$[{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"D","is_correct":true,"tile":{"kind":"letter","value":"D"}},{"text":"F","is_correct":false,"tile":{"kind":"letter","value":"F"}}]$q$::jsonb, $q$D$q$, $q$Door starts with duh… D! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"door","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('87720d9a-fdd7-579a-81e9-f558e6235025', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'medium', $q$Listen: jet. Which letter does jet start with?$q$, $q$[{"text":"J","is_correct":true,"tile":{"kind":"letter","value":"J"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}}]$q$::jsonb, $q$J$q$, $q$Jet starts with juh… J! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"jet","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('45f7ab53-c421-5743-81e2-725d46746976', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'medium', $q$Listen: net. Which letter does net start with?$q$, $q$[{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"N","is_correct":true,"tile":{"kind":"letter","value":"N"}}]$q$::jsonb, $q$N$q$, $q$Net starts with nnn… N! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"net","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('ab1b9d85-2c36-56ee-aaca-003d0f6016a8', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'hard', $q$Listen: web. Which letter does web start with?$q$, $q$[{"text":"W","is_correct":true,"tile":{"kind":"letter","value":"W"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}}]$q$::jsonb, $q$W$q$, $q$Web starts with wuh… W! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"web","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('7429f144-ae5c-527f-881b-a0ba828b8b0b', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'hard', $q$Listen: yo-yo. Which letter does yo-yo start with?$q$, $q$[{"text":"Y","is_correct":true,"tile":{"kind":"letter","value":"Y"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}}]$q$::jsonb, $q$Y$q$, $q$Yo-yo starts with yuh… Y! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"yoyo","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('60c2ab36-a75c-5131-af42-42ed49b8bc1c', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'easy', $q$Listen: sock. Which letter does sock start with?$q$, $q$[{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"S","is_correct":true,"tile":{"kind":"letter","value":"S"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"B","is_correct":false,"tile":{"kind":"letter","value":"B"}}]$q$::jsonb, $q$S$q$, $q$Sock starts with sss… S! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"sock","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('59aaef58-08ce-5f9a-b896-2e6b2a38ffd5', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'easy', $q$Listen: mug. Which letter does mug start with?$q$, $q$[{"text":"M","is_correct":true,"tile":{"kind":"letter","value":"M"}},{"text":"B","is_correct":false,"tile":{"kind":"letter","value":"B"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}}]$q$::jsonb, $q$M$q$, $q$Mug starts with mmm… M! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"mug","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('bd17905c-1e0b-5935-a5e6-cdfa21665bb9', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'medium', $q$Listen: pot. Which letter does pot start with?$q$, $q$[{"text":"P","is_correct":true,"tile":{"kind":"letter","value":"P"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}}]$q$::jsonb, $q$P$q$, $q$Pot starts with puh… P! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"pot","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('63d214d9-a340-55e6-9860-e145a4079589', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'medium', $q$Listen: kite. Which letter does kite start with?$q$, $q$[{"text":"K","is_correct":true,"tile":{"kind":"letter","value":"K"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}}]$q$::jsonb, $q$K$q$, $q$Kite starts with kuh… K! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"kite","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('b73a5306-fdab-57af-b12a-a4e865b4b83a', null, (select id from public.skills where slug = 'letter-sounds'),
   'information-and-ideas', 'medium', $q$Listen: tent. Which letter does tent start with?$q$, $q$[{"text":"B","is_correct":false,"tile":{"kind":"letter","value":"B"}},{"text":"T","is_correct":true,"tile":{"kind":"letter","value":"T"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}}]$q$::jsonb, $q$T$q$, $q$Tent starts with tuh… T! Nice listening!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"tent","count":1}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-letter-naming')::uuid, 'skill', md5('pe-aos:dom-reading-foundational')::uuid, 'reading', 'Letter Naming', 'letter-naming', 'k-2', 'information-and-ideas', 'K', 0, 'CCSS.ELA-LITERACY.RF.K.1.D', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- letter-naming (Letter Naming, grade K, CCSS.ELA-LITERACY.RF.K.1.D) — 26 audio-picture items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('909e8627-fcf8-5b87-b3e3-92ea2303a919', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'easy', $q$Can you find the letter A? Tap it.$q$, $q$[{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"A","is_correct":true,"tile":{"kind":"letter","value":"A"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}}]$q$::jsonb, $q$A$q$, $q$That's A! Great finding!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('8ac2ca7f-05a5-5fbb-85af-b06d6792239a', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'easy', $q$Can you find the letter B? Tap it.$q$, $q$[{"text":"B","is_correct":true,"tile":{"kind":"letter","value":"B"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}}]$q$::jsonb, $q$B$q$, $q$That's B! Nice work!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('3a4aaf0b-587e-5e13-875f-ae3b1deb4833', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'easy', $q$Can you find the letter C? Tap it.$q$, $q$[{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"C","is_correct":true,"tile":{"kind":"letter","value":"C"}}]$q$::jsonb, $q$C$q$, $q$That's C! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('223248c0-b385-5812-ac0c-80aa133c8cac', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'easy', $q$Can you find the letter E? Tap it.$q$, $q$[{"text":"E","is_correct":true,"tile":{"kind":"letter","value":"E"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}}]$q$::jsonb, $q$E$q$, $q$That's E! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('8ff2959f-d738-50cc-859b-66e4e75c6825', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'medium', $q$Can you find the letter F? Tap it.$q$, $q$[{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"F","is_correct":true,"tile":{"kind":"letter","value":"F"}}]$q$::jsonb, $q$F$q$, $q$That's F! Nice finding!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('03066060-8491-5c29-bd39-3442c0764e4c', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'medium', $q$Can you find the letter H? Tap it.$q$, $q$[{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"H","is_correct":true,"tile":{"kind":"letter","value":"H"}}]$q$::jsonb, $q$H$q$, $q$That's H! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('bd16af21-10a7-5a58-8040-dbcc20ce60af', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'medium', $q$Can you find the letter K? Tap it.$q$, $q$[{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"K","is_correct":true,"tile":{"kind":"letter","value":"K"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}}]$q$::jsonb, $q$K$q$, $q$That's K! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('d50d1519-3f1d-5f61-b85e-fd6f70f06bf8', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'medium', $q$Can you find the letter L? Tap it.$q$, $q$[{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"L","is_correct":true,"tile":{"kind":"letter","value":"L"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}}]$q$::jsonb, $q$L$q$, $q$That's L! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('451a97eb-270f-59e6-856a-351bd32f9ed8', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'easy', $q$Can you find the letter O? Tap it.$q$, $q$[{"text":"O","is_correct":true,"tile":{"kind":"letter","value":"O"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}}]$q$::jsonb, $q$O$q$, $q$That's O — the round one! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('ba6d88e9-143f-55ed-8b8c-f72083b1cc8f', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'medium', $q$Can you find the letter R? Tap it.$q$, $q$[{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"R","is_correct":true,"tile":{"kind":"letter","value":"R"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}}]$q$::jsonb, $q$R$q$, $q$That's R! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('6d176fa6-c510-5119-b222-6c650bf61077', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'easy', $q$Can you find the letter S? Tap it.$q$, $q$[{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"S","is_correct":true,"tile":{"kind":"letter","value":"S"}},{"text":"B","is_correct":false,"tile":{"kind":"letter","value":"B"}}]$q$::jsonb, $q$S$q$, $q$That's S! Nice finding!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('8a6621fe-a233-564f-afbd-46a17a23dcf3', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'easy', $q$Can you find the letter T? Tap it.$q$, $q$[{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"B","is_correct":false,"tile":{"kind":"letter","value":"B"}},{"text":"T","is_correct":true,"tile":{"kind":"letter","value":"T"}}]$q$::jsonb, $q$T$q$, $q$That's T! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('34ac4077-470f-59e6-af63-904255f70b47', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'medium', $q$Can you find the letter W? Tap it.$q$, $q$[{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"W","is_correct":true,"tile":{"kind":"letter","value":"W"}},{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}}]$q$::jsonb, $q$W$q$, $q$That's W! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('fef69164-4772-5e21-a811-d0ec67df5504', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'hard', $q$Can you find the letter Z? Tap it.$q$, $q$[{"text":"T","is_correct":false,"tile":{"kind":"letter","value":"T"}},{"text":"S","is_correct":false,"tile":{"kind":"letter","value":"S"}},{"text":"Z","is_correct":true,"tile":{"kind":"letter","value":"Z"}},{"text":"M","is_correct":false,"tile":{"kind":"letter","value":"M"}}]$q$::jsonb, $q$Z$q$, $q$That's Z — the very last letter! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('e7d7fe8f-63c9-56c9-bb99-aee653451a81', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'medium', $q$Tap the little letter a.$q$, $q$[{"text":"m","is_correct":false,"tile":{"kind":"letter","value":"m"}},{"text":"s","is_correct":false,"tile":{"kind":"letter","value":"s"}},{"text":"a","is_correct":true,"tile":{"kind":"letter","value":"a"}}]$q$::jsonb, $q$a$q$, $q$Yes — that's little a! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('1ba654da-02c2-5bad-9026-7a299bea01b5', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'medium', $q$Tap the little letter c.$q$, $q$[{"text":"c","is_correct":true,"tile":{"kind":"letter","value":"c"}},{"text":"m","is_correct":false,"tile":{"kind":"letter","value":"m"}},{"text":"s","is_correct":false,"tile":{"kind":"letter","value":"s"}}]$q$::jsonb, $q$c$q$, $q$Yes — little c! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('f41546b7-7d6f-5985-87a6-fbed777e1753', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'medium', $q$Tap the little letter e.$q$, $q$[{"text":"m","is_correct":false,"tile":{"kind":"letter","value":"m"}},{"text":"t","is_correct":false,"tile":{"kind":"letter","value":"t"}},{"text":"s","is_correct":false,"tile":{"kind":"letter","value":"s"}},{"text":"e","is_correct":true,"tile":{"kind":"letter","value":"e"}}]$q$::jsonb, $q$e$q$, $q$That's little e! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c888f749-bf6e-5367-94ff-f636241f9ea6', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'medium', $q$Tap the little letter f.$q$, $q$[{"text":"f","is_correct":true,"tile":{"kind":"letter","value":"f"}},{"text":"s","is_correct":false,"tile":{"kind":"letter","value":"s"}},{"text":"t","is_correct":false,"tile":{"kind":"letter","value":"t"}},{"text":"m","is_correct":false,"tile":{"kind":"letter","value":"m"}}]$q$::jsonb, $q$f$q$, $q$That's little f! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('60de5db2-b369-5f68-95dc-8ebde0142e37', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'medium', $q$Tap the little letter h.$q$, $q$[{"text":"s","is_correct":false,"tile":{"kind":"letter","value":"s"}},{"text":"m","is_correct":false,"tile":{"kind":"letter","value":"m"}},{"text":"h","is_correct":true,"tile":{"kind":"letter","value":"h"}},{"text":"t","is_correct":false,"tile":{"kind":"letter","value":"t"}}]$q$::jsonb, $q$h$q$, $q$That's little h! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('ec86c0bb-1b89-5dde-95ee-7b4b1e202c00', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'hard', $q$Tap the little letter k.$q$, $q$[{"text":"k","is_correct":true,"tile":{"kind":"letter","value":"k"}},{"text":"m","is_correct":false,"tile":{"kind":"letter","value":"m"}},{"text":"t","is_correct":false,"tile":{"kind":"letter","value":"t"}},{"text":"s","is_correct":false,"tile":{"kind":"letter","value":"s"}}]$q$::jsonb, $q$k$q$, $q$That's little k! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('eb72e5d2-096b-5284-90ac-6d062234c014', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'medium', $q$Tap the little letter l.$q$, $q$[{"text":"m","is_correct":false,"tile":{"kind":"letter","value":"m"}},{"text":"s","is_correct":false,"tile":{"kind":"letter","value":"s"}},{"text":"a","is_correct":false,"tile":{"kind":"letter","value":"a"}},{"text":"l","is_correct":true,"tile":{"kind":"letter","value":"l"}}]$q$::jsonb, $q$l$q$, $q$That's little l! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('2e1b1e5c-44e6-573a-bb20-839d731bd61d', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'medium', $q$Tap the little letter m.$q$, $q$[{"text":"m","is_correct":true,"tile":{"kind":"letter","value":"m"}},{"text":"s","is_correct":false,"tile":{"kind":"letter","value":"s"}},{"text":"a","is_correct":false,"tile":{"kind":"letter","value":"a"}},{"text":"t","is_correct":false,"tile":{"kind":"letter","value":"t"}}]$q$::jsonb, $q$m$q$, $q$That's little m! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('59b6a979-e532-52af-a04e-b5e5f84ce067', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'easy', $q$Tap the little letter o.$q$, $q$[{"text":"o","is_correct":true,"tile":{"kind":"letter","value":"o"}},{"text":"s","is_correct":false,"tile":{"kind":"letter","value":"s"}},{"text":"t","is_correct":false,"tile":{"kind":"letter","value":"t"}},{"text":"m","is_correct":false,"tile":{"kind":"letter","value":"m"}}]$q$::jsonb, $q$o$q$, $q$That's little o — nice and round! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('2ab67b1c-d09b-5f83-9d27-62b7d23f8a2d', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'medium', $q$Tap the little letter r.$q$, $q$[{"text":"m","is_correct":false,"tile":{"kind":"letter","value":"m"}},{"text":"r","is_correct":true,"tile":{"kind":"letter","value":"r"}},{"text":"s","is_correct":false,"tile":{"kind":"letter","value":"s"}},{"text":"t","is_correct":false,"tile":{"kind":"letter","value":"t"}}]$q$::jsonb, $q$r$q$, $q$That's little r! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('9f545263-ff79-5f60-bddc-817b57fac245', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'easy', $q$Tap the little letter s.$q$, $q$[{"text":"s","is_correct":true,"tile":{"kind":"letter","value":"s"}},{"text":"a","is_correct":false,"tile":{"kind":"letter","value":"a"}},{"text":"t","is_correct":false,"tile":{"kind":"letter","value":"t"}},{"text":"m","is_correct":false,"tile":{"kind":"letter","value":"m"}}]$q$::jsonb, $q$s$q$, $q$That's little s! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('a406a226-fa62-5b7a-a5c9-57a98ccc056a', null, (select id from public.skills where slug = 'letter-naming'),
   'information-and-ideas', 'medium', $q$Tap the little letter t.$q$, $q$[{"text":"t","is_correct":true,"tile":{"kind":"letter","value":"t"}},{"text":"m","is_correct":false,"tile":{"kind":"letter","value":"m"}},{"text":"s","is_correct":false,"tile":{"kind":"letter","value":"s"}},{"text":"a","is_correct":false,"tile":{"kind":"letter","value":"a"}}]$q$::jsonb, $q$t$q$, $q$That's little t! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-geo')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Geometry', null, 'k-2', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-shapes')::uuid, 'skill', md5('pe-aos:dom-math-geo')::uuid, 'math', 'Shapes', 'shapes', 'k-2', 'problem-solving-data-analysis', 'K', 0, 'CCSS.MATH.CONTENT.K.G.A.2', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- shapes (Shapes, grade K, CCSS.MATH.CONTENT.K.G.A.2) — 26 audio-picture items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('5bbdd273-c1dd-54b2-ad7a-2be19600d638', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'easy', $q$Can you find the circle? Tap it.$q$, $q$[{"text":"triangle","is_correct":false,"tile":{"kind":"object_group","image":"triangle","count":1}},{"text":"circle","is_correct":true,"tile":{"kind":"object_group","image":"circle","count":1}},{"text":"square","is_correct":false,"tile":{"kind":"object_group","image":"square","count":1}}]$q$::jsonb, $q$circle$q$, $q$Yes! That round shape is a circle. Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('44eaa01a-a044-5a03-8c87-2fb03bdc3015', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'easy', $q$Can you find the square? Tap it.$q$, $q$[{"text":"square","is_correct":true,"tile":{"kind":"object_group","image":"square","count":1}},{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}},{"text":"triangle","is_correct":false,"tile":{"kind":"object_group","image":"triangle","count":1}}]$q$::jsonb, $q$square$q$, $q$Yes! A square has four equal sides. Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('0aa1a233-4fb6-56d3-9537-3aa879a35808', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'easy', $q$Can you find the triangle? Tap it.$q$, $q$[{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}},{"text":"square","is_correct":false,"tile":{"kind":"object_group","image":"square","count":1}},{"text":"triangle","is_correct":true,"tile":{"kind":"object_group","image":"triangle","count":1}}]$q$::jsonb, $q$triangle$q$, $q$Yes! A triangle has three sides. Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('3daa7a56-9ab4-565b-9586-860e2be9fbcf', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'medium', $q$Can you find the rectangle? Tap it.$q$, $q$[{"text":"rectangle","is_correct":true,"tile":{"kind":"object_group","image":"rectangle","count":1}},{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}},{"text":"triangle","is_correct":false,"tile":{"kind":"object_group","image":"triangle","count":1}}]$q$::jsonb, $q$rectangle$q$, $q$Yes! A rectangle is like a long box. Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('d424c8bb-87b0-5dbf-9a13-dcb24b4fb0c0', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'medium', $q$Can you find the oval? Tap it.$q$, $q$[{"text":"triangle","is_correct":false,"tile":{"kind":"object_group","image":"triangle","count":1}},{"text":"square","is_correct":false,"tile":{"kind":"object_group","image":"square","count":1}},{"text":"oval","is_correct":true,"tile":{"kind":"object_group","image":"oval","count":1}}]$q$::jsonb, $q$oval$q$, $q$Yes! An oval is like a stretched circle. Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('33e590a3-bca6-5fb8-b39c-565b509249f4', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'medium', $q$Can you find the diamond? Tap it.$q$, $q$[{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}},{"text":"triangle","is_correct":false,"tile":{"kind":"object_group","image":"triangle","count":1}},{"text":"diamond","is_correct":true,"tile":{"kind":"object_group","image":"diamond","count":1}}]$q$::jsonb, $q$diamond$q$, $q$Yes! That's a diamond. Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('d3727cf5-729a-5550-bca2-30fe79dcd61e', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'hard', $q$Can you find the hexagon? Tap it.$q$, $q$[{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}},{"text":"hexagon","is_correct":true,"tile":{"kind":"object_group","image":"hexagon","count":1}},{"text":"square","is_correct":false,"tile":{"kind":"object_group","image":"square","count":1}}]$q$::jsonb, $q$hexagon$q$, $q$Yes! A hexagon has six sides. Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('a6059f1c-fde6-5a41-936c-9dee016199e2', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'easy', $q$Can you find the star? Tap it.$q$, $q$[{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}},{"text":"star","is_correct":true,"tile":{"kind":"object_group","image":"star","count":1}},{"text":"square","is_correct":false,"tile":{"kind":"object_group","image":"square","count":1}}]$q$::jsonb, $q$star$q$, $q$Yes! That's a star. Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('f7748c42-6193-567b-84e5-78dd3dc4cd5c', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'easy', $q$Can you find the heart? Tap it.$q$, $q$[{"text":"heart","is_correct":true,"tile":{"kind":"object_group","image":"heart","count":1}},{"text":"square","is_correct":false,"tile":{"kind":"object_group","image":"square","count":1}},{"text":"triangle","is_correct":false,"tile":{"kind":"object_group","image":"triangle","count":1}}]$q$::jsonb, $q$heart$q$, $q$Yes! That's a heart. Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('5abe6f36-ba87-5918-99db-2b7ac750be57', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'medium', $q$Can you find the circle? Tap it.$q$, $q$[{"text":"triangle","is_correct":false,"tile":{"kind":"object_group","image":"triangle","count":1}},{"text":"star","is_correct":false,"tile":{"kind":"object_group","image":"star","count":1}},{"text":"circle","is_correct":true,"tile":{"kind":"object_group","image":"circle","count":1}},{"text":"heart","is_correct":false,"tile":{"kind":"object_group","image":"heart","count":1}}]$q$::jsonb, $q$circle$q$, $q$That round shape is the circle! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('17cd028c-8d3d-50ed-81e2-9ca3f5e30c37', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'medium', $q$Can you find the square? Tap it.$q$, $q$[{"text":"star","is_correct":false,"tile":{"kind":"object_group","image":"star","count":1}},{"text":"triangle","is_correct":false,"tile":{"kind":"object_group","image":"triangle","count":1}},{"text":"square","is_correct":true,"tile":{"kind":"object_group","image":"square","count":1}},{"text":"heart","is_correct":false,"tile":{"kind":"object_group","image":"heart","count":1}}]$q$::jsonb, $q$square$q$, $q$The square has four equal sides! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('cc643032-4c8a-5ba9-b0df-a2ec22814ff6', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'medium', $q$Can you find the triangle? Tap it.$q$, $q$[{"text":"star","is_correct":false,"tile":{"kind":"object_group","image":"star","count":1}},{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}},{"text":"heart","is_correct":false,"tile":{"kind":"object_group","image":"heart","count":1}},{"text":"triangle","is_correct":true,"tile":{"kind":"object_group","image":"triangle","count":1}}]$q$::jsonb, $q$triangle$q$, $q$The triangle has three corners! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('e63bd904-4738-59b0-9675-3281c8a9d2b5', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'medium', $q$Can you find the rectangle? Tap it.$q$, $q$[{"text":"triangle","is_correct":false,"tile":{"kind":"object_group","image":"triangle","count":1}},{"text":"rectangle","is_correct":true,"tile":{"kind":"object_group","image":"rectangle","count":1}},{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}},{"text":"star","is_correct":false,"tile":{"kind":"object_group","image":"star","count":1}}]$q$::jsonb, $q$rectangle$q$, $q$That's the rectangle! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('4f13891e-bf94-51e4-908f-ad58e79d8e38', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'medium', $q$Can you find the oval? Tap it.$q$, $q$[{"text":"square","is_correct":false,"tile":{"kind":"object_group","image":"square","count":1}},{"text":"triangle","is_correct":false,"tile":{"kind":"object_group","image":"triangle","count":1}},{"text":"oval","is_correct":true,"tile":{"kind":"object_group","image":"oval","count":1}},{"text":"star","is_correct":false,"tile":{"kind":"object_group","image":"star","count":1}}]$q$::jsonb, $q$oval$q$, $q$That's the oval! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c5bcc324-1cd8-55e6-a0d3-5636036ccd96', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'medium', $q$Can you find the diamond? Tap it.$q$, $q$[{"text":"heart","is_correct":false,"tile":{"kind":"object_group","image":"heart","count":1}},{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}},{"text":"star","is_correct":false,"tile":{"kind":"object_group","image":"star","count":1}},{"text":"diamond","is_correct":true,"tile":{"kind":"object_group","image":"diamond","count":1}}]$q$::jsonb, $q$diamond$q$, $q$That's the diamond! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('0e8fdd11-6508-5023-807a-7665ce92f091', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'hard', $q$Can you find the hexagon? Tap it.$q$, $q$[{"text":"hexagon","is_correct":true,"tile":{"kind":"object_group","image":"hexagon","count":1}},{"text":"triangle","is_correct":false,"tile":{"kind":"object_group","image":"triangle","count":1}},{"text":"heart","is_correct":false,"tile":{"kind":"object_group","image":"heart","count":1}},{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}}]$q$::jsonb, $q$hexagon$q$, $q$The hexagon has six sides! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('693883bf-50bf-5ebf-8a81-1002fa2d3ef5', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'easy', $q$Can you find the star? Tap it.$q$, $q$[{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}},{"text":"square","is_correct":false,"tile":{"kind":"object_group","image":"square","count":1}},{"text":"heart","is_correct":false,"tile":{"kind":"object_group","image":"heart","count":1}},{"text":"star","is_correct":true,"tile":{"kind":"object_group","image":"star","count":1}}]$q$::jsonb, $q$star$q$, $q$That's the star! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('2f8c2176-053f-5dcd-a234-63ec0256dfa1', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'easy', $q$Can you find the heart? Tap it.$q$, $q$[{"text":"heart","is_correct":true,"tile":{"kind":"object_group","image":"heart","count":1}},{"text":"star","is_correct":false,"tile":{"kind":"object_group","image":"star","count":1}},{"text":"triangle","is_correct":false,"tile":{"kind":"object_group","image":"triangle","count":1}},{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}}]$q$::jsonb, $q$heart$q$, $q$That's the heart! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('b5f5e878-db23-53cc-923f-27680753f5c4', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'medium', $q$Can you find the triangle? Tap it.$q$, $q$[{"text":"rectangle","is_correct":false,"tile":{"kind":"object_group","image":"rectangle","count":1}},{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}},{"text":"triangle","is_correct":true,"tile":{"kind":"object_group","image":"triangle","count":1}},{"text":"star","is_correct":false,"tile":{"kind":"object_group","image":"star","count":1}}]$q$::jsonb, $q$triangle$q$, $q$The triangle has three sides! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('24713976-313b-56a5-8654-47acaeff3555', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'easy', $q$Can you find the square? Tap it.$q$, $q$[{"text":"square","is_correct":true,"tile":{"kind":"object_group","image":"square","count":1}},{"text":"heart","is_correct":false,"tile":{"kind":"object_group","image":"heart","count":1}},{"text":"star","is_correct":false,"tile":{"kind":"object_group","image":"star","count":1}},{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}}]$q$::jsonb, $q$square$q$, $q$That's the square! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('7137c9c9-3416-5f28-b487-d194f78ca583', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'easy', $q$Tap the round shape.$q$, $q$[{"text":"square","is_correct":false,"tile":{"kind":"object_group","image":"square","count":1}},{"text":"triangle","is_correct":false,"tile":{"kind":"object_group","image":"triangle","count":1}},{"text":"circle","is_correct":true,"tile":{"kind":"object_group","image":"circle","count":1}}]$q$::jsonb, $q$circle$q$, $q$A circle is perfectly round! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('d41254db-7dfc-5541-9b66-62b7a7dd2dc8', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'medium', $q$Tap the shape with three corners.$q$, $q$[{"text":"triangle","is_correct":true,"tile":{"kind":"object_group","image":"triangle","count":1}},{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}},{"text":"square","is_correct":false,"tile":{"kind":"object_group","image":"square","count":1}}]$q$::jsonb, $q$triangle$q$, $q$A triangle has three corners! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('19ce25dd-93d0-5c05-972a-b62bfb8122b7', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'hard', $q$Tap the shape with six sides.$q$, $q$[{"text":"hexagon","is_correct":true,"tile":{"kind":"object_group","image":"hexagon","count":1}},{"text":"square","is_correct":false,"tile":{"kind":"object_group","image":"square","count":1}},{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}}]$q$::jsonb, $q$hexagon$q$, $q$A hexagon has six sides! Nice counting!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c3d1cbb3-8fc5-5439-8523-89c9a4dac952', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'medium', $q$Tap the shape that looks like a long box.$q$, $q$[{"text":"rectangle","is_correct":true,"tile":{"kind":"object_group","image":"rectangle","count":1}},{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}},{"text":"triangle","is_correct":false,"tile":{"kind":"object_group","image":"triangle","count":1}}]$q$::jsonb, $q$rectangle$q$, $q$A rectangle is like a long box! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('a1fe3031-f22e-517c-a8bc-d7e5df26014d', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'medium', $q$Tap the shape that is stretched like an egg.$q$, $q$[{"text":"triangle","is_correct":false,"tile":{"kind":"object_group","image":"triangle","count":1}},{"text":"square","is_correct":false,"tile":{"kind":"object_group","image":"square","count":1}},{"text":"oval","is_correct":true,"tile":{"kind":"object_group","image":"oval","count":1}}]$q$::jsonb, $q$oval$q$, $q$An oval is like a stretched circle! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('b8c22f83-264c-5c42-8bb6-6d553093926e', null, (select id from public.skills where slug = 'shapes'),
   'problem-solving-data-analysis', 'easy', $q$Can you find the heart? Tap it.$q$, $q$[{"text":"star","is_correct":false,"tile":{"kind":"object_group","image":"star","count":1}},{"text":"heart","is_correct":true,"tile":{"kind":"object_group","image":"heart","count":1}},{"text":"circle","is_correct":false,"tile":{"kind":"object_group","image":"circle","count":1}}]$q$::jsonb, $q$heart$q$, $q$That's the heart! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-comparing-numbers')::uuid, 'skill', md5('pe-aos:dom-math-cc')::uuid, 'math', 'Comparing Numbers', 'comparing-numbers', 'k-2', 'problem-solving-data-analysis', 'K', 0, 'CCSS.MATH.CONTENT.K.CC.C.6', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- comparing-numbers (Comparing Numbers, grade K, CCSS.MATH.CONTENT.K.CC.C.6) — 26 audio-picture items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('5fd6daa1-a1ca-5b22-9efd-8dff924ae46f', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'easy', $q$Which group has more? Tap the group with more.$q$, $q$[{"text":"5","is_correct":true,"tile":{"kind":"object_group","image":"apple","count":5}},{"text":"2","is_correct":false,"tile":{"kind":"object_group","image":"apple","count":2}}]$q$::jsonb, $q$5$q$, $q$This group has 5 and this one has 2. Five is more! Great looking!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('135f9181-1d81-550a-b061-e6b561ea5510', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'easy', $q$Which group has more? Tap the group with more.$q$, $q$[{"text":"6","is_correct":true,"tile":{"kind":"object_group","image":"star","count":6}},{"text":"3","is_correct":false,"tile":{"kind":"object_group","image":"star","count":3}}]$q$::jsonb, $q$6$q$, $q$Six is more than three! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('00c64f34-4d5a-53f5-8fb8-83b3f2af6bde', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'easy', $q$Which group has fewer? Tap the group with fewer.$q$, $q$[{"text":"7","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":7}},{"text":"2","is_correct":true,"tile":{"kind":"object_group","image":"ball","count":2}}]$q$::jsonb, $q$2$q$, $q$Two is fewer than seven! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('1897af5b-6af3-5c4b-98f0-85594d676b81', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'easy', $q$Which group has more? Tap the group with more.$q$, $q$[{"text":"4","is_correct":true,"tile":{"kind":"object_group","image":"duck","count":4}},{"text":"1","is_correct":false,"tile":{"kind":"object_group","image":"duck","count":1}}]$q$::jsonb, $q$4$q$, $q$Four is more than one! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('3c03e3fa-8d2a-5a3a-b7d7-79ee11df42cf', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'medium', $q$Which group has fewer? Tap the group with fewer.$q$, $q$[{"text":"8","is_correct":false,"tile":{"kind":"object_group","image":"fish","count":8}},{"text":"3","is_correct":true,"tile":{"kind":"object_group","image":"fish","count":3}}]$q$::jsonb, $q$3$q$, $q$Three is fewer than eight! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('28f439ca-4650-595a-af03-4ef779fd37e4', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'medium', $q$Which group has more? Tap the group with more.$q$, $q$[{"text":"5","is_correct":false,"tile":{"kind":"object_group","image":"cat","count":5}},{"text":"8","is_correct":true,"tile":{"kind":"object_group","image":"cat","count":8}}]$q$::jsonb, $q$8$q$, $q$Eight is more than five! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('36d7f93f-ce67-5e7b-8d2f-5b26e6595512', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'medium', $q$Which group has fewer? Tap the group with fewer.$q$, $q$[{"text":"2","is_correct":true,"tile":{"kind":"object_group","image":"hat","count":2}},{"text":"6","is_correct":false,"tile":{"kind":"object_group","image":"hat","count":6}}]$q$::jsonb, $q$2$q$, $q$Two is fewer than six! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('123a1af8-dae9-5f11-9e3a-7cc3d836b87f', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'medium', $q$Which group has more? Tap the group with more.$q$, $q$[{"text":"7","is_correct":true,"tile":{"kind":"object_group","image":"flower","count":7}},{"text":"4","is_correct":false,"tile":{"kind":"object_group","image":"flower","count":4}}]$q$::jsonb, $q$7$q$, $q$Seven is more than four! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('5fa09e00-f9da-50ba-9d01-6779b5dface8', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'medium', $q$Which group has more? Tap the group with more.$q$, $q$[{"text":"6","is_correct":true,"tile":{"kind":"object_group","image":"sun","count":6}},{"text":"3","is_correct":false,"tile":{"kind":"object_group","image":"sun","count":3}}]$q$::jsonb, $q$6$q$, $q$Six is more than three! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('9858a336-a25d-5ca9-904e-cd4956910e83', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'easy', $q$Which group has fewer? Tap the group with fewer.$q$, $q$[{"text":"1","is_correct":true,"tile":{"kind":"object_group","image":"tree","count":1}},{"text":"5","is_correct":false,"tile":{"kind":"object_group","image":"tree","count":5}}]$q$::jsonb, $q$1$q$, $q$One is the fewest! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('b419508a-ba93-581f-ba06-772cee1d18a6', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'medium', $q$Which group has more? Tap the group with more.$q$, $q$[{"text":"9","is_correct":true,"tile":{"kind":"object_group","image":"pig","count":9}},{"text":"6","is_correct":false,"tile":{"kind":"object_group","image":"pig","count":6}}]$q$::jsonb, $q$9$q$, $q$Nine is more than six! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('bede3ba7-5268-5ac0-ba2e-5707b8f25d36', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'medium', $q$Which group has fewer? Tap the group with fewer.$q$, $q$[{"text":"9","is_correct":false,"tile":{"kind":"object_group","image":"ring","count":9}},{"text":"4","is_correct":true,"tile":{"kind":"object_group","image":"ring","count":4}}]$q$::jsonb, $q$4$q$, $q$Four is fewer than nine! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('1423d490-51c4-5241-97a5-c43c02821aea', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'hard', $q$Which group has the most? Tap it.$q$, $q$[{"text":"8","is_correct":true,"tile":{"kind":"object_group","image":"apple","count":8}},{"text":"2","is_correct":false,"tile":{"kind":"object_group","image":"apple","count":2}},{"text":"5","is_correct":false,"tile":{"kind":"object_group","image":"apple","count":5}}]$q$::jsonb, $q$8$q$, $q$Eight is the most! Great counting!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('d5316548-671d-5963-95a7-29de278e597a', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'easy', $q$Which number is bigger? Tap it.$q$, $q$[{"text":"7","is_correct":true,"tile":{"kind":"number","value":"7"}},{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}}]$q$::jsonb, $q$7$q$, $q$7 is bigger than 3! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('dc552392-88ec-5491-a8e7-4f6a89fe9319', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'easy', $q$Which number is bigger? Tap it.$q$, $q$[{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"9","is_correct":true,"tile":{"kind":"number","value":"9"}}]$q$::jsonb, $q$9$q$, $q$9 is bigger than 5! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('ed9bb3fe-b90a-5be1-96d1-eda428309829', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'easy', $q$Which number is smaller? Tap it.$q$, $q$[{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"2","is_correct":true,"tile":{"kind":"number","value":"2"}}]$q$::jsonb, $q$2$q$, $q$2 is smaller than 8! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('b2abfb20-a59d-5e57-a1d6-27b931b58128', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'medium', $q$Which number is bigger? Tap it.$q$, $q$[{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"6","is_correct":true,"tile":{"kind":"number","value":"6"}}]$q$::jsonb, $q$6$q$, $q$6 is bigger than 4! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('3e866c91-c789-5614-a491-03416a26da53', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'medium', $q$Which number is smaller? Tap it.$q$, $q$[{"text":"3","is_correct":true,"tile":{"kind":"number","value":"3"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}}]$q$::jsonb, $q$3$q$, $q$3 is smaller than 7! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('9008b0be-9a06-59d4-8772-4b579029c935', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'medium', $q$Which number is bigger? Tap it.$q$, $q$[{"text":"10","is_correct":true,"tile":{"kind":"number","value":"10"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}}]$q$::jsonb, $q$10$q$, $q$10 is bigger than 6! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('d668f9bd-9f18-5846-a038-4d73b963a847', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'easy', $q$Which number is smaller? Tap it.$q$, $q$[{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"1","is_correct":true,"tile":{"kind":"number","value":"1"}}]$q$::jsonb, $q$1$q$, $q$1 is the smallest! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('62d1e5a6-9d52-5afd-9ece-af47e85eb9f6', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'medium', $q$Which number is bigger? Tap it.$q$, $q$[{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"8","is_correct":true,"tile":{"kind":"number","value":"8"}}]$q$::jsonb, $q$8$q$, $q$8 is bigger than 5! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('400b6201-1ed5-575f-b495-60688d24ba8a', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'medium', $q$Which number is smaller? Tap it.$q$, $q$[{"text":"4","is_correct":true,"tile":{"kind":"number","value":"4"}},{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}}]$q$::jsonb, $q$4$q$, $q$4 is smaller than 9! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('241a834d-897a-5d6d-9bb5-2bc5e799c2dc', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'easy', $q$Which number is bigger? Tap it.$q$, $q$[{"text":"9","is_correct":true,"tile":{"kind":"number","value":"9"}},{"text":"2","is_correct":false,"tile":{"kind":"number","value":"2"}}]$q$::jsonb, $q$9$q$, $q$9 is bigger than 2! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('85e861ee-ac7d-5ff3-97ff-7d9eff2332c0', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'hard', $q$Which number is the biggest? Tap it.$q$, $q$[{"text":"9","is_correct":true,"tile":{"kind":"number","value":"9"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}}]$q$::jsonb, $q$9$q$, $q$9 is the biggest! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('ed8f070a-51f0-5b64-a382-c643cb3ad5d0', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'medium', $q$Which number is smaller? Tap it.$q$, $q$[{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"6","is_correct":true,"tile":{"kind":"number","value":"6"}}]$q$::jsonb, $q$6$q$, $q$6 is smaller than 10! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('553ea53b-298f-5104-a2a3-03b02721f5e4', null, (select id from public.skills where slug = 'comparing-numbers'),
   'problem-solving-data-analysis', 'medium', $q$Which number is bigger? Tap it.$q$, $q$[{"text":"7","is_correct":true,"tile":{"kind":"number","value":"7"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}}]$q$::jsonb, $q$7$q$, $q$7 is bigger than 5! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-oa')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Operations & Algebraic Thinking', null, 'k-2', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-addition-within-20')::uuid, 'skill', md5('pe-aos:dom-math-oa')::uuid, 'math', 'Addition within 20', 'addition-within-20', 'k-2', 'problem-solving-data-analysis', '1', 1, 'CCSS.MATH.CONTENT.1.OA.C.6', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- addition-within-20 (Addition within 20, grade 1, CCSS.MATH.CONTENT.1.OA.C.6) — 26 audio-picture items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('8828796c-2e13-5acd-a067-91f9891e3e54', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'easy', $q$Here are 2 apples. Add 1 more. How many in all? Tap the answer.$q$, $q$[{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"3","is_correct":true,"tile":{"kind":"number","value":"3"}},{"text":"2","is_correct":false,"tile":{"kind":"number","value":"2"}}]$q$::jsonb, $q$3$q$, $q$2 and 1 more is 3! Nice adding!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"apple","count":2}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('2059ed1e-75d0-5118-98c0-37081589bb04', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'easy', $q$What is 3 plus 2? Tap the answer.$q$, $q$[{"text":"5","is_correct":true,"tile":{"kind":"number","value":"5"}},{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}}]$q$::jsonb, $q$5$q$, $q$3 plus 2 is 5! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('9dda5856-533a-5bc0-a50a-3934502f012d', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'easy', $q$Here are 4 stars. Add 3 more. How many in all? Tap the answer.$q$, $q$[{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"7","is_correct":true,"tile":{"kind":"number","value":"7"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}}]$q$::jsonb, $q$7$q$, $q$4 and 3 more is 7! Nice counting on!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"star","count":4}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('6f5b36a5-8707-5334-a3d6-421e3c1df24c', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'easy', $q$What is 5 plus 2? Tap the answer.$q$, $q$[{"text":"7","is_correct":true,"tile":{"kind":"number","value":"7"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}}]$q$::jsonb, $q$7$q$, $q$5 plus 2 is 7! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('0629682d-3d01-574f-bbf3-935508a56332', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'easy', $q$Here are 3 balls. Add 3 more. How many in all? Tap the answer.$q$, $q$[{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"6","is_correct":true,"tile":{"kind":"number","value":"6"}}]$q$::jsonb, $q$6$q$, $q$3 and 3 more is 6! Great!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"ball","count":3}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('a043bfa5-e40e-57fc-86d1-e024d8aefec7', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 6 plus 2? Tap the answer.$q$, $q$[{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"8","is_correct":true,"tile":{"kind":"number","value":"8"}}]$q$::jsonb, $q$8$q$, $q$6 plus 2 is 8! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('076596e3-2fdf-5a58-9df3-4a78ef4eab69', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 4 plus 4? Tap the answer.$q$, $q$[{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"8","is_correct":true,"tile":{"kind":"number","value":"8"}},{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}}]$q$::jsonb, $q$8$q$, $q$4 plus 4 is 8! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('e05543df-f1c6-5533-874e-630b6ba97e84', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 5 plus 5? Tap the answer.$q$, $q$[{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}},{"text":"10","is_correct":true,"tile":{"kind":"number","value":"10"}},{"text":"11","is_correct":false,"tile":{"kind":"number","value":"11"}}]$q$::jsonb, $q$10$q$, $q$5 plus 5 is 10! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('61e87ac2-c604-5c03-a7af-97478814c9d7', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 7 plus 2? Tap the answer.$q$, $q$[{"text":"9","is_correct":true,"tile":{"kind":"number","value":"9"}},{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}}]$q$::jsonb, $q$9$q$, $q$7 plus 2 is 9! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('f08e43dc-af25-5eaa-a08d-0f74f1799f56', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 6 plus 3? Tap the answer.$q$, $q$[{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"9","is_correct":true,"tile":{"kind":"number","value":"9"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}}]$q$::jsonb, $q$9$q$, $q$6 plus 3 is 9! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('662591d2-ec4a-5be0-981e-3784ef4a9037', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 8 plus 2? Tap the answer.$q$, $q$[{"text":"11","is_correct":false,"tile":{"kind":"number","value":"11"}},{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}},{"text":"10","is_correct":true,"tile":{"kind":"number","value":"10"}},{"text":"12","is_correct":false,"tile":{"kind":"number","value":"12"}}]$q$::jsonb, $q$10$q$, $q$8 plus 2 is 10! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('4d2452ce-e25c-5024-b7e4-c7a4af322702', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 5 plus 4? Tap the answer.$q$, $q$[{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"9","is_correct":true,"tile":{"kind":"number","value":"9"}}]$q$::jsonb, $q$9$q$, $q$5 plus 4 is 9! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('66935b73-7061-5f44-bb80-926071287164', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 7 plus 3? Tap the answer.$q$, $q$[{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}},{"text":"10","is_correct":true,"tile":{"kind":"number","value":"10"}},{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"11","is_correct":false,"tile":{"kind":"number","value":"11"}}]$q$::jsonb, $q$10$q$, $q$7 plus 3 is 10! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('cdc76b65-a1c0-56de-b967-7a5f58f60e7a', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 8 plus 4? Tap the answer.$q$, $q$[{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"11","is_correct":false,"tile":{"kind":"number","value":"11"}},{"text":"12","is_correct":true,"tile":{"kind":"number","value":"12"}},{"text":"13","is_correct":false,"tile":{"kind":"number","value":"13"}}]$q$::jsonb, $q$12$q$, $q$8 plus 4 is 12! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c7f3a930-9175-5126-8994-f4381a11bf57', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 9 plus 3? Tap the answer.$q$, $q$[{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"11","is_correct":false,"tile":{"kind":"number","value":"11"}},{"text":"13","is_correct":false,"tile":{"kind":"number","value":"13"}},{"text":"12","is_correct":true,"tile":{"kind":"number","value":"12"}}]$q$::jsonb, $q$12$q$, $q$9 plus 3 is 12! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('b89e03e4-0e52-5730-964d-348da8c803d4', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 7 plus 5? Tap the answer.$q$, $q$[{"text":"12","is_correct":true,"tile":{"kind":"number","value":"12"}},{"text":"13","is_correct":false,"tile":{"kind":"number","value":"13"}},{"text":"14","is_correct":false,"tile":{"kind":"number","value":"14"}},{"text":"11","is_correct":false,"tile":{"kind":"number","value":"11"}}]$q$::jsonb, $q$12$q$, $q$7 plus 5 is 12! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('4de5cdd9-abd1-5eaf-ac94-fffebbd0eabf', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 6 plus 6? Tap the answer.$q$, $q$[{"text":"13","is_correct":false,"tile":{"kind":"number","value":"13"}},{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"11","is_correct":false,"tile":{"kind":"number","value":"11"}},{"text":"12","is_correct":true,"tile":{"kind":"number","value":"12"}}]$q$::jsonb, $q$12$q$, $q$6 plus 6 is 12! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('776a0b83-237d-5369-b059-43511a0742db', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 8 plus 5? Tap the answer.$q$, $q$[{"text":"13","is_correct":true,"tile":{"kind":"number","value":"13"}},{"text":"12","is_correct":false,"tile":{"kind":"number","value":"12"}},{"text":"11","is_correct":false,"tile":{"kind":"number","value":"11"}},{"text":"14","is_correct":false,"tile":{"kind":"number","value":"14"}}]$q$::jsonb, $q$13$q$, $q$8 plus 5 is 13! Nice adding!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('4b103b3f-6a2e-5fc5-b508-0e79c20b92a1', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 9 plus 4? Tap the answer.$q$, $q$[{"text":"12","is_correct":false,"tile":{"kind":"number","value":"12"}},{"text":"14","is_correct":false,"tile":{"kind":"number","value":"14"}},{"text":"13","is_correct":true,"tile":{"kind":"number","value":"13"}},{"text":"11","is_correct":false,"tile":{"kind":"number","value":"11"}}]$q$::jsonb, $q$13$q$, $q$9 plus 4 is 13! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('01d70ce5-fe5f-59f3-a930-3f5f0c32e3e9', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 7 plus 7? Tap the answer.$q$, $q$[{"text":"14","is_correct":true,"tile":{"kind":"number","value":"14"}},{"text":"15","is_correct":false,"tile":{"kind":"number","value":"15"}},{"text":"12","is_correct":false,"tile":{"kind":"number","value":"12"}},{"text":"13","is_correct":false,"tile":{"kind":"number","value":"13"}}]$q$::jsonb, $q$14$q$, $q$7 plus 7 is 14! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('a634f3be-d8df-5353-b81e-21817bea5a4d', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 8 plus 6? Tap the answer.$q$, $q$[{"text":"15","is_correct":false,"tile":{"kind":"number","value":"15"}},{"text":"13","is_correct":false,"tile":{"kind":"number","value":"13"}},{"text":"12","is_correct":false,"tile":{"kind":"number","value":"12"}},{"text":"14","is_correct":true,"tile":{"kind":"number","value":"14"}}]$q$::jsonb, $q$14$q$, $q$8 plus 6 is 14! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('f6b5be8e-aa44-5ec2-a80e-25e2bfefe92b', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 9 plus 6? Tap the answer.$q$, $q$[{"text":"15","is_correct":true,"tile":{"kind":"number","value":"15"}},{"text":"14","is_correct":false,"tile":{"kind":"number","value":"14"}},{"text":"13","is_correct":false,"tile":{"kind":"number","value":"13"}},{"text":"16","is_correct":false,"tile":{"kind":"number","value":"16"}}]$q$::jsonb, $q$15$q$, $q$9 plus 6 is 15! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('08bca523-218c-5bcb-a4fd-dd0dd63123c5', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 8 plus 8? Tap the answer.$q$, $q$[{"text":"16","is_correct":true,"tile":{"kind":"number","value":"16"}},{"text":"15","is_correct":false,"tile":{"kind":"number","value":"15"}},{"text":"14","is_correct":false,"tile":{"kind":"number","value":"14"}},{"text":"17","is_correct":false,"tile":{"kind":"number","value":"17"}}]$q$::jsonb, $q$16$q$, $q$8 plus 8 is 16! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('0ee21f82-1c69-551b-b34c-1cc3dc4c5e4a', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 9 plus 7? Tap the answer.$q$, $q$[{"text":"17","is_correct":false,"tile":{"kind":"number","value":"17"}},{"text":"16","is_correct":true,"tile":{"kind":"number","value":"16"}},{"text":"15","is_correct":false,"tile":{"kind":"number","value":"15"}},{"text":"14","is_correct":false,"tile":{"kind":"number","value":"14"}}]$q$::jsonb, $q$16$q$, $q$9 plus 7 is 16! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('b1b6100f-9cde-5d7a-9064-64a73dcffb6a', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 9 plus 8? Tap the answer.$q$, $q$[{"text":"17","is_correct":true,"tile":{"kind":"number","value":"17"}},{"text":"15","is_correct":false,"tile":{"kind":"number","value":"15"}},{"text":"18","is_correct":false,"tile":{"kind":"number","value":"18"}},{"text":"16","is_correct":false,"tile":{"kind":"number","value":"16"}}]$q$::jsonb, $q$17$q$, $q$9 plus 8 is 17! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('75f0ff45-f255-51ee-a697-afd8ad02b402', null, (select id from public.skills where slug = 'addition-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 9 plus 9? Tap the answer.$q$, $q$[{"text":"18","is_correct":true,"tile":{"kind":"number","value":"18"}},{"text":"19","is_correct":false,"tile":{"kind":"number","value":"19"}},{"text":"17","is_correct":false,"tile":{"kind":"number","value":"17"}},{"text":"16","is_correct":false,"tile":{"kind":"number","value":"16"}}]$q$::jsonb, $q$18$q$, $q$9 plus 9 is 18! Great adding!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-subtraction-within-20')::uuid, 'skill', md5('pe-aos:dom-math-oa')::uuid, 'math', 'Subtraction within 20', 'subtraction-within-20', 'k-2', 'problem-solving-data-analysis', '1', 1, 'CCSS.MATH.CONTENT.1.OA.C.6', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- subtraction-within-20 (Subtraction within 20, grade 1, CCSS.MATH.CONTENT.1.OA.C.6) — 26 audio-picture items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c54f48fc-f8ca-5044-ba4d-108cd26cc2ed', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'easy', $q$Here are 5 apples. Take away 2. How many are left? Tap the answer.$q$, $q$[{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"3","is_correct":true,"tile":{"kind":"number","value":"3"}},{"text":"2","is_correct":false,"tile":{"kind":"number","value":"2"}}]$q$::jsonb, $q$3$q$, $q$5 take away 2 is 3! Nice!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"apple","count":5}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('3f635a6d-aa17-5b71-b931-ec6e122d91dd', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'easy', $q$What is 4 minus 1? Tap the answer.$q$, $q$[{"text":"3","is_correct":true,"tile":{"kind":"number","value":"3"}},{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"2","is_correct":false,"tile":{"kind":"number","value":"2"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}}]$q$::jsonb, $q$3$q$, $q$4 minus 1 is 3! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c00b4411-7ae5-5940-a380-49b45cea8fc2', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'easy', $q$Here are 6 balls. Take away 2. How many are left? Tap the answer.$q$, $q$[{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"4","is_correct":true,"tile":{"kind":"number","value":"4"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}}]$q$::jsonb, $q$4$q$, $q$6 take away 2 is 4! Well done!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"ball","count":6}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('9042e38d-d264-50a0-9269-d4be839a1edc', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'easy', $q$What is 5 minus 1? Tap the answer.$q$, $q$[{"text":"4","is_correct":true,"tile":{"kind":"number","value":"4"}},{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}}]$q$::jsonb, $q$4$q$, $q$5 minus 1 is 4! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('8bc81653-3629-5537-973c-bf6a090f5ee3', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'easy', $q$What is 3 minus 1? Tap the answer.$q$, $q$[{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}},{"text":"1","is_correct":false,"tile":{"kind":"number","value":"1"}},{"text":"2","is_correct":true,"tile":{"kind":"number","value":"2"}}]$q$::jsonb, $q$2$q$, $q$3 minus 1 is 2! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('801d1e91-50a9-5365-8dfb-edebdfb29242', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 7 minus 3? Tap the answer.$q$, $q$[{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}},{"text":"4","is_correct":true,"tile":{"kind":"number","value":"4"}}]$q$::jsonb, $q$4$q$, $q$7 minus 3 is 4! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('6ec0cfbd-528a-5557-a8ce-aa350a918904', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 8 minus 2? Tap the answer.$q$, $q$[{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"6","is_correct":true,"tile":{"kind":"number","value":"6"}},{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}}]$q$::jsonb, $q$6$q$, $q$8 minus 2 is 6! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('31493eda-a6cc-5786-bb2d-01df25724381', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 6 minus 3? Tap the answer.$q$, $q$[{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"2","is_correct":false,"tile":{"kind":"number","value":"2"}},{"text":"3","is_correct":true,"tile":{"kind":"number","value":"3"}},{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}}]$q$::jsonb, $q$3$q$, $q$6 minus 3 is 3! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('dcfb7c77-6908-581c-945c-138597c5c13b', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 9 minus 4? Tap the answer.$q$, $q$[{"text":"5","is_correct":true,"tile":{"kind":"number","value":"5"}},{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}}]$q$::jsonb, $q$5$q$, $q$9 minus 4 is 5! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('a41d0f8a-0396-5525-8109-33c07eb0c3dd', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 7 minus 2? Tap the answer.$q$, $q$[{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"5","is_correct":true,"tile":{"kind":"number","value":"5"}},{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}}]$q$::jsonb, $q$5$q$, $q$7 minus 2 is 5! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('32b5f71a-341c-5880-8dc1-87c83adff1fe', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 10 minus 4? Tap the answer.$q$, $q$[{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"6","is_correct":true,"tile":{"kind":"number","value":"6"}},{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}}]$q$::jsonb, $q$6$q$, $q$10 minus 4 is 6! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('475146dd-7a33-58e6-9ca8-e853c256ffeb', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 8 minus 5? Tap the answer.$q$, $q$[{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"2","is_correct":false,"tile":{"kind":"number","value":"2"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"3","is_correct":true,"tile":{"kind":"number","value":"3"}}]$q$::jsonb, $q$3$q$, $q$8 minus 5 is 3! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('059f4369-b85c-5fcf-9bbc-9f370962c875', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 9 minus 3? Tap the answer.$q$, $q$[{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"6","is_correct":true,"tile":{"kind":"number","value":"6"}},{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}}]$q$::jsonb, $q$6$q$, $q$9 minus 3 is 6! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('04ed1acf-6f8f-5e3f-ab7f-6c2b0e34811e', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 10 minus 3? Tap the answer.$q$, $q$[{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"7","is_correct":true,"tile":{"kind":"number","value":"7"}},{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}}]$q$::jsonb, $q$7$q$, $q$10 minus 3 is 7! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('b7369737-39d6-5dcd-a905-80ba1ee9cf44', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 12 minus 4? Tap the answer.$q$, $q$[{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}},{"text":"8","is_correct":true,"tile":{"kind":"number","value":"8"}}]$q$::jsonb, $q$8$q$, $q$12 minus 4 is 8! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('4c589fae-7443-5c1a-8d51-2035949c463b', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 11 minus 5? Tap the answer.$q$, $q$[{"text":"6","is_correct":true,"tile":{"kind":"number","value":"6"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}}]$q$::jsonb, $q$6$q$, $q$11 minus 5 is 6! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('a58e49cb-59a9-5fa0-9f53-4e4175e246c9', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 13 minus 4? Tap the answer.$q$, $q$[{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"9","is_correct":true,"tile":{"kind":"number","value":"9"}}]$q$::jsonb, $q$9$q$, $q$13 minus 4 is 9! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('f8cdf0af-b625-518b-a786-9e290f8bdfd8', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 12 minus 5? Tap the answer.$q$, $q$[{"text":"7","is_correct":true,"tile":{"kind":"number","value":"7"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}},{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}}]$q$::jsonb, $q$7$q$, $q$12 minus 5 is 7! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('4393e70e-e998-5315-9d5f-06cce13122cd', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 14 minus 6? Tap the answer.$q$, $q$[{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}},{"text":"8","is_correct":true,"tile":{"kind":"number","value":"8"}},{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}}]$q$::jsonb, $q$8$q$, $q$14 minus 6 is 8! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c2d3566e-5214-5407-a40f-7a4674a6f494', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 15 minus 7? Tap the answer.$q$, $q$[{"text":"8","is_correct":true,"tile":{"kind":"number","value":"8"}},{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}}]$q$::jsonb, $q$8$q$, $q$15 minus 7 is 8! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('504c4f4f-f1e6-50b7-a246-9ac2c94aa26e', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 11 minus 4? Tap the answer.$q$, $q$[{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}},{"text":"7","is_correct":true,"tile":{"kind":"number","value":"7"}}]$q$::jsonb, $q$7$q$, $q$11 minus 4 is 7! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('74de75ee-4fad-5a35-8184-ab3524a11ede', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 13 minus 6? Tap the answer.$q$, $q$[{"text":"7","is_correct":true,"tile":{"kind":"number","value":"7"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}},{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}}]$q$::jsonb, $q$7$q$, $q$13 minus 6 is 7! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('bfdaa3b2-e857-5ab4-ba2c-d46ebbba02f7', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 16 minus 8? Tap the answer.$q$, $q$[{"text":"8","is_correct":true,"tile":{"kind":"number","value":"8"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}}]$q$::jsonb, $q$8$q$, $q$16 minus 8 is 8! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('8f416d86-53f5-5685-bd19-32a38ca21a32', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'medium', $q$What is 10 minus 6? Tap the answer.$q$, $q$[{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"4","is_correct":true,"tile":{"kind":"number","value":"4"}},{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}}]$q$::jsonb, $q$4$q$, $q$10 minus 6 is 4! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('34cd9044-fee3-5a0b-8c05-bce9020c280c', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 14 minus 5? Tap the answer.$q$, $q$[{"text":"9","is_correct":true,"tile":{"kind":"number","value":"9"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}}]$q$::jsonb, $q$9$q$, $q$14 minus 5 is 9! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('1241d35d-c7b6-54fd-ba87-8b36ff755ed4', null, (select id from public.skills where slug = 'subtraction-within-20'),
   'problem-solving-data-analysis', 'hard', $q$What is 18 minus 9? Tap the answer.$q$, $q$[{"text":"9","is_correct":true,"tile":{"kind":"number","value":"9"}},{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}}]$q$::jsonb, $q$9$q$, $q$18 minus 9 is 9! Great subtracting!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-nbt')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Number & Operations in Base Ten', null, 'k-2', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-place-value-to-100')::uuid, 'skill', md5('pe-aos:dom-math-nbt')::uuid, 'math', 'Place Value to 100', 'place-value-to-100', 'k-2', 'problem-solving-data-analysis', '1', 1, 'CCSS.MATH.CONTENT.1.NBT.B.2', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- place-value-to-100 (Place Value to 100, grade 1, CCSS.MATH.CONTENT.1.NBT.B.2) — 26 audio-picture items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('7e2c75a3-3fd7-5b01-91f8-4b3f0aeff281', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'easy', $q$What number is 2 tens and 3 ones? Tap it.$q$, $q$[{"text":"25","is_correct":false,"tile":{"kind":"number","value":"25"}},{"text":"23","is_correct":true,"tile":{"kind":"number","value":"23"}},{"text":"32","is_correct":false,"tile":{"kind":"number","value":"32"}},{"text":"20","is_correct":false,"tile":{"kind":"number","value":"20"}}]$q$::jsonb, $q$23$q$, $q$2 tens and 3 ones make 23! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('835643cd-c4ac-5ee3-93f5-ffa7228e4c4c', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$What number is 3 tens and 4 ones? Tap it.$q$, $q$[{"text":"34","is_correct":true,"tile":{"kind":"number","value":"34"}},{"text":"30","is_correct":false,"tile":{"kind":"number","value":"30"}},{"text":"43","is_correct":false,"tile":{"kind":"number","value":"43"}},{"text":"35","is_correct":false,"tile":{"kind":"number","value":"35"}}]$q$::jsonb, $q$34$q$, $q$3 tens and 4 ones make 34! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('8e385059-d08a-5c0a-bd95-673104847adc', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$What number is 4 tens and 1 one? Tap it.$q$, $q$[{"text":"40","is_correct":false,"tile":{"kind":"number","value":"40"}},{"text":"41","is_correct":true,"tile":{"kind":"number","value":"41"}},{"text":"44","is_correct":false,"tile":{"kind":"number","value":"44"}},{"text":"14","is_correct":false,"tile":{"kind":"number","value":"14"}}]$q$::jsonb, $q$41$q$, $q$4 tens and 1 one make 41! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('42f335e7-55aa-5714-8b46-6b9ccef8982e', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$What number is 5 tens and 6 ones? Tap it.$q$, $q$[{"text":"56","is_correct":true,"tile":{"kind":"number","value":"56"}},{"text":"65","is_correct":false,"tile":{"kind":"number","value":"65"}},{"text":"50","is_correct":false,"tile":{"kind":"number","value":"50"}},{"text":"55","is_correct":false,"tile":{"kind":"number","value":"55"}}]$q$::jsonb, $q$56$q$, $q$5 tens and 6 ones make 56! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('376c2ec1-e759-5ad7-8b7d-cdb3d1c5a02d', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$What number is 1 ten and 7 ones? Tap it.$q$, $q$[{"text":"71","is_correct":false,"tile":{"kind":"number","value":"71"}},{"text":"18","is_correct":false,"tile":{"kind":"number","value":"18"}},{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"17","is_correct":true,"tile":{"kind":"number","value":"17"}}]$q$::jsonb, $q$17$q$, $q$1 ten and 7 ones make 17! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('2b55c591-e6cb-5309-a13d-868e71edd4bd', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$What number is 6 tens and 0 ones? Tap it.$q$, $q$[{"text":"50","is_correct":false,"tile":{"kind":"number","value":"50"}},{"text":"16","is_correct":false,"tile":{"kind":"number","value":"16"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"60","is_correct":true,"tile":{"kind":"number","value":"60"}}]$q$::jsonb, $q$60$q$, $q$6 tens and no ones make 60! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('8889e524-2731-5ff5-8d68-163c20f778e2', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$What number is 7 tens and 2 ones? Tap it.$q$, $q$[{"text":"70","is_correct":false,"tile":{"kind":"number","value":"70"}},{"text":"27","is_correct":false,"tile":{"kind":"number","value":"27"}},{"text":"72","is_correct":true,"tile":{"kind":"number","value":"72"}},{"text":"73","is_correct":false,"tile":{"kind":"number","value":"73"}}]$q$::jsonb, $q$72$q$, $q$7 tens and 2 ones make 72! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('dd2c9c56-fa7d-54ef-84dd-24a3ff4dc4b3', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'hard', $q$What number is 8 tens and 5 ones? Tap it.$q$, $q$[{"text":"88","is_correct":false,"tile":{"kind":"number","value":"88"}},{"text":"58","is_correct":false,"tile":{"kind":"number","value":"58"}},{"text":"85","is_correct":true,"tile":{"kind":"number","value":"85"}},{"text":"80","is_correct":false,"tile":{"kind":"number","value":"80"}}]$q$::jsonb, $q$85$q$, $q$8 tens and 5 ones make 85! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('d9a35f04-477a-57e1-9de2-3cf35ce098ec', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'hard', $q$What number is 9 tens and 9 ones? Tap it.$q$, $q$[{"text":"99","is_correct":true,"tile":{"kind":"number","value":"99"}},{"text":"90","is_correct":false,"tile":{"kind":"number","value":"90"}},{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}},{"text":"89","is_correct":false,"tile":{"kind":"number","value":"89"}}]$q$::jsonb, $q$99$q$, $q$9 tens and 9 ones make 99! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('86e4819f-6d35-53b8-bd54-a9e80a728b46', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'easy', $q$How many tens are in 30? Tap the number.$q$, $q$[{"text":"2","is_correct":false,"tile":{"kind":"number","value":"2"}},{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"3","is_correct":true,"tile":{"kind":"number","value":"3"}},{"text":"30","is_correct":false,"tile":{"kind":"number","value":"30"}}]$q$::jsonb, $q$3$q$, $q$There are 3 tens in 30! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('149ddcf6-119c-5c1c-9abf-48688330195d', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'easy', $q$How many tens are in 50? Tap the number.$q$, $q$[{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"5","is_correct":true,"tile":{"kind":"number","value":"5"}},{"text":"50","is_correct":false,"tile":{"kind":"number","value":"50"}}]$q$::jsonb, $q$5$q$, $q$There are 5 tens in 50! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('7db8ed2f-8844-57be-af60-504ff25f68a5', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$How many tens are in 70? Tap the number.$q$, $q$[{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"70","is_correct":false,"tile":{"kind":"number","value":"70"}},{"text":"7","is_correct":true,"tile":{"kind":"number","value":"7"}}]$q$::jsonb, $q$7$q$, $q$There are 7 tens in 70! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('4940d686-d0fa-5ebd-ba25-07b3e24b04e6', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$How many tens are in 24? Tap the number.$q$, $q$[{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"2","is_correct":true,"tile":{"kind":"number","value":"2"}},{"text":"24","is_correct":false,"tile":{"kind":"number","value":"24"}},{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}}]$q$::jsonb, $q$2$q$, $q$24 has 2 tens! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('b732ae0c-914a-5733-b0a4-3ad94cc30d58', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$How many ones are in 46? Tap the number.$q$, $q$[{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"6","is_correct":true,"tile":{"kind":"number","value":"6"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}}]$q$::jsonb, $q$6$q$, $q$46 has 6 ones! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('4d645a02-c5be-55b8-8a0d-78436b98d698', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$How many ones are in 38? Tap the number.$q$, $q$[{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}},{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}},{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}},{"text":"8","is_correct":true,"tile":{"kind":"number","value":"8"}}]$q$::jsonb, $q$8$q$, $q$38 has 8 ones! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('08a8ad8c-9014-526f-870e-e56bee8a0c4e', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$How many ones are in 51? Tap the number.$q$, $q$[{"text":"1","is_correct":true,"tile":{"kind":"number","value":"1"}},{"text":"2","is_correct":false,"tile":{"kind":"number","value":"2"}},{"text":"0","is_correct":false,"tile":{"kind":"number","value":"0"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}}]$q$::jsonb, $q$1$q$, $q$51 has 1 one! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c623fdf4-e96f-53c0-9bd7-20254895e8cb', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'easy', $q$What is 4 tens? Tap the number.$q$, $q$[{"text":"14","is_correct":false,"tile":{"kind":"number","value":"14"}},{"text":"44","is_correct":false,"tile":{"kind":"number","value":"44"}},{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}},{"text":"40","is_correct":true,"tile":{"kind":"number","value":"40"}}]$q$::jsonb, $q$40$q$, $q$4 tens is 40! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('75590fb9-ba4b-5589-bc34-bb3976aa566e', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$What is 8 tens? Tap the number.$q$, $q$[{"text":"80","is_correct":true,"tile":{"kind":"number","value":"80"}},{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"88","is_correct":false,"tile":{"kind":"number","value":"88"}},{"text":"18","is_correct":false,"tile":{"kind":"number","value":"18"}}]$q$::jsonb, $q$80$q$, $q$8 tens is 80! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('43426cd6-59b3-5858-8910-27ca2bbf4cdc', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$What is 10 more than 30? Tap the number.$q$, $q$[{"text":"20","is_correct":false,"tile":{"kind":"number","value":"20"}},{"text":"31","is_correct":false,"tile":{"kind":"number","value":"31"}},{"text":"40","is_correct":true,"tile":{"kind":"number","value":"40"}},{"text":"50","is_correct":false,"tile":{"kind":"number","value":"50"}}]$q$::jsonb, $q$40$q$, $q$10 more than 30 is 40! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c7103b69-3293-57e0-9ecb-cf9293156fb1', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$What is 10 more than 45? Tap the number.$q$, $q$[{"text":"55","is_correct":true,"tile":{"kind":"number","value":"55"}},{"text":"46","is_correct":false,"tile":{"kind":"number","value":"46"}},{"text":"44","is_correct":false,"tile":{"kind":"number","value":"44"}},{"text":"35","is_correct":false,"tile":{"kind":"number","value":"35"}}]$q$::jsonb, $q$55$q$, $q$10 more than 45 is 55! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('e7b8e0b8-9abd-5ba2-a954-cba6beaaaf62', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$What is 10 less than 60? Tap the number.$q$, $q$[{"text":"59","is_correct":false,"tile":{"kind":"number","value":"59"}},{"text":"70","is_correct":false,"tile":{"kind":"number","value":"70"}},{"text":"40","is_correct":false,"tile":{"kind":"number","value":"40"}},{"text":"50","is_correct":true,"tile":{"kind":"number","value":"50"}}]$q$::jsonb, $q$50$q$, $q$10 less than 60 is 50! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('33e51dcd-2dda-57e3-9242-2ab7ca361dfd', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'hard', $q$What is 10 less than 28? Tap the number.$q$, $q$[{"text":"18","is_correct":true,"tile":{"kind":"number","value":"18"}},{"text":"38","is_correct":false,"tile":{"kind":"number","value":"38"}},{"text":"8","is_correct":false,"tile":{"kind":"number","value":"8"}},{"text":"27","is_correct":false,"tile":{"kind":"number","value":"27"}}]$q$::jsonb, $q$18$q$, $q$10 less than 28 is 18! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('0d5b43a4-0c43-5421-b92b-72551a474666', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$What number comes right after 49? Tap it.$q$, $q$[{"text":"50","is_correct":true,"tile":{"kind":"number","value":"50"}},{"text":"48","is_correct":false,"tile":{"kind":"number","value":"48"}},{"text":"59","is_correct":false,"tile":{"kind":"number","value":"59"}},{"text":"40","is_correct":false,"tile":{"kind":"number","value":"40"}}]$q$::jsonb, $q$50$q$, $q$After 49 comes 50! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('abd25e4a-5986-5c79-a45a-9e79b43d1274', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$What number comes right after 79? Tap it.$q$, $q$[{"text":"70","is_correct":false,"tile":{"kind":"number","value":"70"}},{"text":"80","is_correct":true,"tile":{"kind":"number","value":"80"}},{"text":"78","is_correct":false,"tile":{"kind":"number","value":"78"}},{"text":"89","is_correct":false,"tile":{"kind":"number","value":"89"}}]$q$::jsonb, $q$80$q$, $q$After 79 comes 80! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('852b8aa9-5baf-59a2-bf0c-4904f084ce03', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'medium', $q$What number comes right before 30? Tap it.$q$, $q$[{"text":"29","is_correct":true,"tile":{"kind":"number","value":"29"}},{"text":"20","is_correct":false,"tile":{"kind":"number","value":"20"}},{"text":"28","is_correct":false,"tile":{"kind":"number","value":"28"}},{"text":"31","is_correct":false,"tile":{"kind":"number","value":"31"}}]$q$::jsonb, $q$29$q$, $q$Before 30 comes 29! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('8e27d5f6-d538-5130-ac2e-e5aac76f98ec', null, (select id from public.skills where slug = 'place-value-to-100'),
   'problem-solving-data-analysis', 'hard', $q$What number is 3 tens and 8 ones? Tap it.$q$, $q$[{"text":"38","is_correct":true,"tile":{"kind":"number","value":"38"}},{"text":"30","is_correct":false,"tile":{"kind":"number","value":"30"}},{"text":"83","is_correct":false,"tile":{"kind":"number","value":"83"}},{"text":"28","is_correct":false,"tile":{"kind":"number","value":"28"}}]$q$::jsonb, $q$38$q$, $q$3 tens and 8 ones make 38! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-reading-ri')::uuid, 'domain', md5('pe-aos:subj-reading')::uuid, 'reading', 'Reading: Informational Text', null, 'k-2', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-main-idea-1')::uuid, 'skill', md5('pe-aos:dom-reading-ri')::uuid, 'reading', 'Main Idea (Grade 1)', 'main-idea-1', 'k-2', 'information-and-ideas', '1', 1, 'CCSS.ELA-LITERACY.RI.1.2', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- main-idea-1 (Main Idea (Grade 1), grade 1, CCSS.ELA-LITERACY.RI.1.2) — 26 audio-picture items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('ff4954b2-4475-5217-9be8-581dd26fef04', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'easy', $q$Listen to the story. Meg has a red ball. She bounces it up and down all day. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"tree","is_correct":false,"tile":{"kind":"object_group","image":"tree","count":1}},{"text":"ball","is_correct":true,"tile":{"kind":"object_group","image":"ball","count":1}},{"text":"cat","is_correct":false,"tile":{"kind":"object_group","image":"cat","count":1}}]$q$::jsonb, $q$ball$q$, $q$This story is all about the ball! Great listening!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('346161e7-8122-52ca-aa06-7079bea27986', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'easy', $q$Listen. A little duck swims in the pond. It says quack, quack. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"duck","is_correct":true,"tile":{"kind":"object_group","image":"duck","count":1}},{"text":"ball","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":1}},{"text":"sun","is_correct":false,"tile":{"kind":"object_group","image":"sun","count":1}}]$q$::jsonb, $q$duck$q$, $q$The story is all about the duck! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('0e89a81b-8dfc-5c69-ad57-08575da5d237', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'easy', $q$Listen. The sun is bright today. It makes the sky warm and yellow. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"fish","is_correct":false,"tile":{"kind":"object_group","image":"fish","count":1}},{"text":"hat","is_correct":false,"tile":{"kind":"object_group","image":"hat","count":1}},{"text":"sun","is_correct":true,"tile":{"kind":"object_group","image":"sun","count":1}}]$q$::jsonb, $q$sun$q$, $q$The story is all about the sun! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('f1848308-6aae-5d64-87c0-41b29cdef47a', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'easy', $q$Listen. Sam plants a tree. He gives it water so it can grow tall. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"tree","is_correct":true,"tile":{"kind":"object_group","image":"tree","count":1}},{"text":"ball","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":1}},{"text":"duck","is_correct":false,"tile":{"kind":"object_group","image":"duck","count":1}}]$q$::jsonb, $q$tree$q$, $q$The story is all about the tree! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('628a0071-fa7f-53d7-ba97-268c5c30c92e', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'easy', $q$Listen. The cat naps on the mat. It is soft and warm. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"star","is_correct":false,"tile":{"kind":"object_group","image":"star","count":1}},{"text":"bus","is_correct":false,"tile":{"kind":"object_group","image":"bus","count":1}},{"text":"cat","is_correct":true,"tile":{"kind":"object_group","image":"cat","count":1}}]$q$::jsonb, $q$cat$q$, $q$The story is all about the cat! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('710118fe-cf52-5924-a76a-37c12774bcd6', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'easy', $q$Listen. A pig rolls in the mud. It is happy and messy. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"kite","is_correct":false,"tile":{"kind":"object_group","image":"kite","count":1}},{"text":"moon","is_correct":false,"tile":{"kind":"object_group","image":"moon","count":1}},{"text":"pig","is_correct":true,"tile":{"kind":"object_group","image":"pig","count":1}}]$q$::jsonb, $q$pig$q$, $q$The story is all about the pig! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('6c8eb26e-af51-5bbf-aae0-3ad25c02601e', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'medium', $q$Listen. Ana flies a kite. It goes high up in the wind. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"apple","is_correct":false,"tile":{"kind":"object_group","image":"apple","count":1}},{"text":"kite","is_correct":true,"tile":{"kind":"object_group","image":"kite","count":1}},{"text":"fish","is_correct":false,"tile":{"kind":"object_group","image":"fish","count":1}}]$q$::jsonb, $q$kite$q$, $q$The story is all about the kite! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('5ed42aff-9a8b-5cab-98b8-e58c263c13c3', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'medium', $q$Listen. The fish swims in the tank. It blows tiny bubbles. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"tree","is_correct":false,"tile":{"kind":"object_group","image":"tree","count":1}},{"text":"fish","is_correct":true,"tile":{"kind":"object_group","image":"fish","count":1}},{"text":"van","is_correct":false,"tile":{"kind":"object_group","image":"van","count":1}}]$q$::jsonb, $q$fish$q$, $q$The story is all about the fish! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c9a434d4-5475-53d1-a5be-7b67c89b36e4', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'medium', $q$Listen. Ben gets a gift. He opens the box and smiles big. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"gift","is_correct":true,"tile":{"kind":"object_group","image":"gift","count":1}},{"text":"sun","is_correct":false,"tile":{"kind":"object_group","image":"sun","count":1}},{"text":"duck","is_correct":false,"tile":{"kind":"object_group","image":"duck","count":1}}]$q$::jsonb, $q$gift$q$, $q$The story is all about the gift! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('ac29c6bf-da11-50e8-af3e-6a9dfc297799', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'medium', $q$Listen. An apple grows on the tree. It turns red and sweet. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"ball","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":1}},{"text":"apple","is_correct":true,"tile":{"kind":"object_group","image":"apple","count":1}},{"text":"cat","is_correct":false,"tile":{"kind":"object_group","image":"cat","count":1}}]$q$::jsonb, $q$apple$q$, $q$The story is all about the apple! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('30229263-6d53-541c-8fc8-3ea5a1b1714e', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'medium', $q$Listen. The bus takes the kids to school. It is big and yellow. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"pig","is_correct":false,"tile":{"kind":"object_group","image":"pig","count":1}},{"text":"bus","is_correct":true,"tile":{"kind":"object_group","image":"bus","count":1}},{"text":"star","is_correct":false,"tile":{"kind":"object_group","image":"star","count":1}}]$q$::jsonb, $q$bus$q$, $q$The story is all about the bus! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('4ab4f346-a803-5bbf-b165-50ee2bd521ec', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'medium', $q$Listen. A flower opens in the garden. Bees come to say hello. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"sock","is_correct":false,"tile":{"kind":"object_group","image":"sock","count":1}},{"text":"moon","is_correct":false,"tile":{"kind":"object_group","image":"moon","count":1}},{"text":"flower","is_correct":true,"tile":{"kind":"object_group","image":"flower","count":1}}]$q$::jsonb, $q$flower$q$, $q$The story is all about the flower! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('e24aa5a3-22f6-52a9-99b0-63c2e708e0b8', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'medium', $q$Listen. The moon shines at night. It is round and white. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"moon","is_correct":true,"tile":{"kind":"object_group","image":"moon","count":1}},{"text":"cat","is_correct":false,"tile":{"kind":"object_group","image":"cat","count":1}},{"text":"ball","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":1}}]$q$::jsonb, $q$moon$q$, $q$The story is all about the moon! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('4b5b801e-222e-522c-a8a0-5874b1041d70', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'medium', $q$Listen. Tim wears his hat. It keeps the sun off his head. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"duck","is_correct":false,"tile":{"kind":"object_group","image":"duck","count":1}},{"text":"hat","is_correct":true,"tile":{"kind":"object_group","image":"hat","count":1}},{"text":"tree","is_correct":false,"tile":{"kind":"object_group","image":"tree","count":1}}]$q$::jsonb, $q$hat$q$, $q$The story is all about the hat! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('15320d94-abf3-53a6-9bbe-d152b861dcf8', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'medium', $q$Listen. A van drives down the road. It carries lots of boxes. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"sun","is_correct":false,"tile":{"kind":"object_group","image":"sun","count":1}},{"text":"fish","is_correct":false,"tile":{"kind":"object_group","image":"fish","count":1}},{"text":"van","is_correct":true,"tile":{"kind":"object_group","image":"van","count":1}}]$q$::jsonb, $q$van$q$, $q$The story is all about the van! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('fec469f3-1489-5cbc-8058-78ef6cd054b2', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'medium', $q$Listen. The star twinkles in the dark sky. It is far, far away. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"star","is_correct":true,"tile":{"kind":"object_group","image":"star","count":1}},{"text":"kite","is_correct":false,"tile":{"kind":"object_group","image":"kite","count":1}},{"text":"pig","is_correct":false,"tile":{"kind":"object_group","image":"pig","count":1}}]$q$::jsonb, $q$star$q$, $q$The story is all about the star! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('355f7cd5-02ef-5e1b-902f-479cd14c7698', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'hard', $q$Listen. Lily builds a house with blocks. It has a door and a roof. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"ball","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":1}},{"text":"fish","is_correct":false,"tile":{"kind":"object_group","image":"fish","count":1}},{"text":"house","is_correct":true,"tile":{"kind":"object_group","image":"house","count":1}}]$q$::jsonb, $q$house$q$, $q$The story is all about the house! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('0655551b-038b-5d64-9bdc-fdd1221bff64', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'hard', $q$Listen. A ring sparkles on Mom’s hand. It is shiny and gold. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"ring","is_correct":true,"tile":{"kind":"object_group","image":"ring","count":1}},{"text":"bus","is_correct":false,"tile":{"kind":"object_group","image":"bus","count":1}},{"text":"apple","is_correct":false,"tile":{"kind":"object_group","image":"apple","count":1}}]$q$::jsonb, $q$ring$q$, $q$The story is all about the ring! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('8973d4b9-fa48-5692-851c-b3e3e0dbd7f7', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'hard', $q$Listen. A leaf falls from the tree. It floats down to the ground. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"ball","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":1}},{"text":"leaf","is_correct":true,"tile":{"kind":"object_group","image":"leaf","count":1}},{"text":"duck","is_correct":false,"tile":{"kind":"object_group","image":"duck","count":1}}]$q$::jsonb, $q$leaf$q$, $q$The story is all about the leaf! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('cfed7006-6a4b-5712-98a9-b373c185dfdd', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'hard', $q$Listen. A sock is missing! Ravi looks under the bed for it. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"sun","is_correct":false,"tile":{"kind":"object_group","image":"sun","count":1}},{"text":"fish","is_correct":false,"tile":{"kind":"object_group","image":"fish","count":1}},{"text":"sock","is_correct":true,"tile":{"kind":"object_group","image":"sock","count":1}}]$q$::jsonb, $q$sock$q$, $q$The story is all about the sock! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('9e04491f-fba2-5be8-a483-f553edfa54c4', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'medium', $q$Listen. The mug is full of warm milk. It keeps Nia cozy. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"ball","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":1}},{"text":"tree","is_correct":false,"tile":{"kind":"object_group","image":"tree","count":1}},{"text":"mug","is_correct":true,"tile":{"kind":"object_group","image":"mug","count":1}}]$q$::jsonb, $q$mug$q$, $q$The story is all about the mug! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('833db85d-d6ea-5876-935c-34cf707395ad', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'hard', $q$Listen. A tent stands in the yard. The kids camp inside it. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"tent","is_correct":true,"tile":{"kind":"object_group","image":"tent","count":1}},{"text":"duck","is_correct":false,"tile":{"kind":"object_group","image":"duck","count":1}},{"text":"apple","is_correct":false,"tile":{"kind":"object_group","image":"apple","count":1}}]$q$::jsonb, $q$tent$q$, $q$The story is all about the tent! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('0e04cb74-c8a0-54e8-b7f0-4bafa43738eb', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'hard', $q$Listen. The key opens the little box. Inside is a surprise! What is the story mostly about? Tap the picture.$q$, $q$[{"text":"key","is_correct":true,"tile":{"kind":"object_group","image":"key","count":1}},{"text":"sun","is_correct":false,"tile":{"kind":"object_group","image":"sun","count":1}},{"text":"pig","is_correct":false,"tile":{"kind":"object_group","image":"pig","count":1}}]$q$::jsonb, $q$key$q$, $q$The story is all about the key! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('20938188-19ff-5e09-b6f9-273393933a72', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'hard', $q$Listen. A jet flies across the sky. It leaves a long white trail. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"jet","is_correct":true,"tile":{"kind":"object_group","image":"jet","count":1}},{"text":"cat","is_correct":false,"tile":{"kind":"object_group","image":"cat","count":1}},{"text":"ball","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":1}}]$q$::jsonb, $q$jet$q$, $q$The story is all about the jet! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('0c56d008-c34c-5b31-bd64-39e9e75aefdb', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'medium', $q$Listen. A pot of soup cooks on the stove. It smells so good. What is the story mostly about? Tap the picture.$q$, $q$[{"text":"duck","is_correct":false,"tile":{"kind":"object_group","image":"duck","count":1}},{"text":"star","is_correct":false,"tile":{"kind":"object_group","image":"star","count":1}},{"text":"pot","is_correct":true,"tile":{"kind":"object_group","image":"pot","count":1}}]$q$::jsonb, $q$pot$q$, $q$The story is all about the pot! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('935dcade-20ea-57e5-8322-907078078610', null, (select id from public.skills where slug = 'main-idea-1'),
   'information-and-ideas', 'medium', $q$Listen. The yo-yo goes down and up on its string. Round and round! What is the story mostly about? Tap the picture.$q$, $q$[{"text":"fish","is_correct":false,"tile":{"kind":"object_group","image":"fish","count":1}},{"text":"yoyo","is_correct":true,"tile":{"kind":"object_group","image":"yoyo","count":1}},{"text":"tree","is_correct":false,"tile":{"kind":"object_group","image":"tree","count":1}}]$q$::jsonb, $q$yoyo$q$, $q$The story is all about the yo-yo! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-addition-within-100')::uuid, 'skill', md5('pe-aos:dom-math-nbt')::uuid, 'math', 'Addition within 100', 'addition-within-100', 'k-2', 'problem-solving-data-analysis', '2', 2, 'CCSS.MATH.CONTENT.2.NBT.B.5', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- addition-within-100 (Addition within 100, grade 2, CCSS.MATH.CONTENT.2.NBT.B.5) — 26 audio-picture items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('8cd8792f-b4bd-57de-9bb4-ff71619161ef', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'easy', $q$What is 24 plus 13? Tap the answer.$q$, $q$[{"text":"27","is_correct":false,"tile":{"kind":"number","value":"27"}},{"text":"37","is_correct":true,"tile":{"kind":"number","value":"37"}},{"text":"36","is_correct":false,"tile":{"kind":"number","value":"36"}},{"text":"47","is_correct":false,"tile":{"kind":"number","value":"47"}}]$q$::jsonb, $q$37$q$, $q$24 plus 13 is 37! Nice adding!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('a927b21a-bf8e-5dd1-bf62-85c42013c21e', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'easy', $q$What is 31 plus 25? Tap the answer.$q$, $q$[{"text":"56","is_correct":true,"tile":{"kind":"number","value":"56"}},{"text":"66","is_correct":false,"tile":{"kind":"number","value":"66"}},{"text":"55","is_correct":false,"tile":{"kind":"number","value":"55"}},{"text":"46","is_correct":false,"tile":{"kind":"number","value":"46"}}]$q$::jsonb, $q$56$q$, $q$31 plus 25 is 56! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('7f5ee9ce-3481-58a6-86e2-8a51ad7ee00b', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'easy', $q$What is 42 plus 16? Tap the answer.$q$, $q$[{"text":"68","is_correct":false,"tile":{"kind":"number","value":"68"}},{"text":"58","is_correct":true,"tile":{"kind":"number","value":"58"}},{"text":"48","is_correct":false,"tile":{"kind":"number","value":"48"}},{"text":"57","is_correct":false,"tile":{"kind":"number","value":"57"}}]$q$::jsonb, $q$58$q$, $q$42 plus 16 is 58! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('29b54bbf-7af2-5c54-af97-942101b40de4', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'easy', $q$What is 53 plus 24? Tap the answer.$q$, $q$[{"text":"77","is_correct":true,"tile":{"kind":"number","value":"77"}},{"text":"76","is_correct":false,"tile":{"kind":"number","value":"76"}},{"text":"87","is_correct":false,"tile":{"kind":"number","value":"87"}},{"text":"67","is_correct":false,"tile":{"kind":"number","value":"67"}}]$q$::jsonb, $q$77$q$, $q$53 plus 24 is 77! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('a624ddb5-7c43-55d6-abd8-0c719a524403', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'easy', $q$What is 20 plus 30? Tap the answer.$q$, $q$[{"text":"40","is_correct":false,"tile":{"kind":"number","value":"40"}},{"text":"51","is_correct":false,"tile":{"kind":"number","value":"51"}},{"text":"60","is_correct":false,"tile":{"kind":"number","value":"60"}},{"text":"50","is_correct":true,"tile":{"kind":"number","value":"50"}}]$q$::jsonb, $q$50$q$, $q$20 plus 30 is 50! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('7d1b811f-902e-5d13-ab5f-55c65f251980', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'easy', $q$What is 45 plus 14? Tap the answer.$q$, $q$[{"text":"49","is_correct":false,"tile":{"kind":"number","value":"49"}},{"text":"69","is_correct":false,"tile":{"kind":"number","value":"69"}},{"text":"58","is_correct":false,"tile":{"kind":"number","value":"58"}},{"text":"59","is_correct":true,"tile":{"kind":"number","value":"59"}}]$q$::jsonb, $q$59$q$, $q$45 plus 14 is 59! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('1eb2d4db-0daa-57b2-8000-d724a55893ee', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'medium', $q$What is 27 plus 12? Tap the answer.$q$, $q$[{"text":"49","is_correct":false,"tile":{"kind":"number","value":"49"}},{"text":"38","is_correct":false,"tile":{"kind":"number","value":"38"}},{"text":"39","is_correct":true,"tile":{"kind":"number","value":"39"}},{"text":"29","is_correct":false,"tile":{"kind":"number","value":"29"}}]$q$::jsonb, $q$39$q$, $q$27 plus 12 is 39! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('86e0390d-1dce-5978-bd0d-d8ae83e0a816', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'medium', $q$What is 34 plus 23? Tap the answer.$q$, $q$[{"text":"47","is_correct":false,"tile":{"kind":"number","value":"47"}},{"text":"56","is_correct":false,"tile":{"kind":"number","value":"56"}},{"text":"57","is_correct":true,"tile":{"kind":"number","value":"57"}},{"text":"67","is_correct":false,"tile":{"kind":"number","value":"67"}}]$q$::jsonb, $q$57$q$, $q$34 plus 23 is 57! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('9cd47af5-62e6-57e0-bbf4-797b8adc412b', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'medium', $q$What is 16 plus 22? Tap the answer.$q$, $q$[{"text":"38","is_correct":true,"tile":{"kind":"number","value":"38"}},{"text":"37","is_correct":false,"tile":{"kind":"number","value":"37"}},{"text":"28","is_correct":false,"tile":{"kind":"number","value":"28"}},{"text":"48","is_correct":false,"tile":{"kind":"number","value":"48"}}]$q$::jsonb, $q$38$q$, $q$16 plus 22 is 38! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('825405e6-2ceb-594f-a1e6-48338bdb1cda', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'medium', $q$What is 50 plus 25? Tap the answer.$q$, $q$[{"text":"74","is_correct":false,"tile":{"kind":"number","value":"74"}},{"text":"85","is_correct":false,"tile":{"kind":"number","value":"85"}},{"text":"75","is_correct":true,"tile":{"kind":"number","value":"75"}},{"text":"65","is_correct":false,"tile":{"kind":"number","value":"65"}}]$q$::jsonb, $q$75$q$, $q$50 plus 25 is 75! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('34418548-3505-5179-87ff-3f9c48458769', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'medium', $q$What is 25 plus 25? Tap the answer.$q$, $q$[{"text":"60","is_correct":false,"tile":{"kind":"number","value":"60"}},{"text":"49","is_correct":false,"tile":{"kind":"number","value":"49"}},{"text":"50","is_correct":true,"tile":{"kind":"number","value":"50"}},{"text":"40","is_correct":false,"tile":{"kind":"number","value":"40"}}]$q$::jsonb, $q$50$q$, $q$25 plus 25 is 50! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('886bc358-61a6-5867-b8f8-258527584ff0', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'medium', $q$What is 33 plus 33? Tap the answer.$q$, $q$[{"text":"76","is_correct":false,"tile":{"kind":"number","value":"76"}},{"text":"65","is_correct":false,"tile":{"kind":"number","value":"65"}},{"text":"56","is_correct":false,"tile":{"kind":"number","value":"56"}},{"text":"66","is_correct":true,"tile":{"kind":"number","value":"66"}}]$q$::jsonb, $q$66$q$, $q$33 plus 33 is 66! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('ecfaf607-3705-593c-9960-14d0eacbeba9', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'medium', $q$What is 40 plus 40? Tap the answer.$q$, $q$[{"text":"70","is_correct":false,"tile":{"kind":"number","value":"70"}},{"text":"80","is_correct":true,"tile":{"kind":"number","value":"80"}},{"text":"81","is_correct":false,"tile":{"kind":"number","value":"81"}},{"text":"90","is_correct":false,"tile":{"kind":"number","value":"90"}}]$q$::jsonb, $q$80$q$, $q$40 plus 40 is 80! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('106e3826-6073-5955-9ed6-6fb883d0795e', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'hard', $q$What is 28 plus 15? Tap the answer.$q$, $q$[{"text":"44","is_correct":false,"tile":{"kind":"number","value":"44"}},{"text":"33","is_correct":false,"tile":{"kind":"number","value":"33"}},{"text":"43","is_correct":true,"tile":{"kind":"number","value":"43"}},{"text":"42","is_correct":false,"tile":{"kind":"number","value":"42"}}]$q$::jsonb, $q$43$q$, $q$28 plus 15 is 43! Great regrouping!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('5a8dffc8-fa68-5a60-96e0-793612ae8c36', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'hard', $q$What is 37 plus 18? Tap the answer.$q$, $q$[{"text":"56","is_correct":false,"tile":{"kind":"number","value":"56"}},{"text":"45","is_correct":false,"tile":{"kind":"number","value":"45"}},{"text":"54","is_correct":false,"tile":{"kind":"number","value":"54"}},{"text":"55","is_correct":true,"tile":{"kind":"number","value":"55"}}]$q$::jsonb, $q$55$q$, $q$37 plus 18 is 55! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('077be90d-3427-5902-b0e8-534ebe281f02', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'hard', $q$What is 46 plus 27? Tap the answer.$q$, $q$[{"text":"73","is_correct":true,"tile":{"kind":"number","value":"73"}},{"text":"72","is_correct":false,"tile":{"kind":"number","value":"72"}},{"text":"74","is_correct":false,"tile":{"kind":"number","value":"74"}},{"text":"63","is_correct":false,"tile":{"kind":"number","value":"63"}}]$q$::jsonb, $q$73$q$, $q$46 plus 27 is 73! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('e7c654ec-ab3a-585e-8d45-1a88c2f376f7', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'hard', $q$What is 29 plus 26? Tap the answer.$q$, $q$[{"text":"54","is_correct":false,"tile":{"kind":"number","value":"54"}},{"text":"56","is_correct":false,"tile":{"kind":"number","value":"56"}},{"text":"45","is_correct":false,"tile":{"kind":"number","value":"45"}},{"text":"55","is_correct":true,"tile":{"kind":"number","value":"55"}}]$q$::jsonb, $q$55$q$, $q$29 plus 26 is 55! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('240269b9-b421-5434-a574-07952e1f0781', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'hard', $q$What is 58 plus 14? Tap the answer.$q$, $q$[{"text":"72","is_correct":true,"tile":{"kind":"number","value":"72"}},{"text":"62","is_correct":false,"tile":{"kind":"number","value":"62"}},{"text":"73","is_correct":false,"tile":{"kind":"number","value":"73"}},{"text":"71","is_correct":false,"tile":{"kind":"number","value":"71"}}]$q$::jsonb, $q$72$q$, $q$58 plus 14 is 72! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('3acb5395-97e3-593a-bc9c-7faaa1fb3d3b', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'hard', $q$What is 35 plus 29? Tap the answer.$q$, $q$[{"text":"54","is_correct":false,"tile":{"kind":"number","value":"54"}},{"text":"63","is_correct":false,"tile":{"kind":"number","value":"63"}},{"text":"64","is_correct":true,"tile":{"kind":"number","value":"64"}},{"text":"65","is_correct":false,"tile":{"kind":"number","value":"65"}}]$q$::jsonb, $q$64$q$, $q$35 plus 29 is 64! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('a8e0de8d-96a4-5d75-a6a0-11aa0da72605', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'hard', $q$What is 47 plus 38? Tap the answer.$q$, $q$[{"text":"85","is_correct":true,"tile":{"kind":"number","value":"85"}},{"text":"84","is_correct":false,"tile":{"kind":"number","value":"84"}},{"text":"86","is_correct":false,"tile":{"kind":"number","value":"86"}},{"text":"75","is_correct":false,"tile":{"kind":"number","value":"75"}}]$q$::jsonb, $q$85$q$, $q$47 plus 38 is 85! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('2e03fb98-dbf7-58de-9fca-e0866d1df1d4', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'hard', $q$What is 26 plus 49? Tap the answer.$q$, $q$[{"text":"74","is_correct":false,"tile":{"kind":"number","value":"74"}},{"text":"65","is_correct":false,"tile":{"kind":"number","value":"65"}},{"text":"76","is_correct":false,"tile":{"kind":"number","value":"76"}},{"text":"75","is_correct":true,"tile":{"kind":"number","value":"75"}}]$q$::jsonb, $q$75$q$, $q$26 plus 49 is 75! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('a28d4934-12f8-57bc-8e8f-8ac23b56a56b', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'hard', $q$What is 55 plus 27? Tap the answer.$q$, $q$[{"text":"82","is_correct":true,"tile":{"kind":"number","value":"82"}},{"text":"72","is_correct":false,"tile":{"kind":"number","value":"72"}},{"text":"83","is_correct":false,"tile":{"kind":"number","value":"83"}},{"text":"81","is_correct":false,"tile":{"kind":"number","value":"81"}}]$q$::jsonb, $q$82$q$, $q$55 plus 27 is 82! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('b781418d-5ad5-519f-aedf-10a8cefacb09', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'hard', $q$What is 39 plus 43? Tap the answer.$q$, $q$[{"text":"82","is_correct":true,"tile":{"kind":"number","value":"82"}},{"text":"72","is_correct":false,"tile":{"kind":"number","value":"72"}},{"text":"83","is_correct":false,"tile":{"kind":"number","value":"83"}},{"text":"81","is_correct":false,"tile":{"kind":"number","value":"81"}}]$q$::jsonb, $q$82$q$, $q$39 plus 43 is 82! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('7283cf8b-19ca-5271-bb88-73c25402726b', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'hard', $q$What is 64 plus 28? Tap the answer.$q$, $q$[{"text":"91","is_correct":false,"tile":{"kind":"number","value":"91"}},{"text":"92","is_correct":true,"tile":{"kind":"number","value":"92"}},{"text":"82","is_correct":false,"tile":{"kind":"number","value":"82"}},{"text":"93","is_correct":false,"tile":{"kind":"number","value":"93"}}]$q$::jsonb, $q$92$q$, $q$64 plus 28 is 92! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('5e79f6d2-0f66-52b6-9c82-e4f2a224cd3a', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'medium', $q$What is 18 plus 18? Tap the answer.$q$, $q$[{"text":"36","is_correct":true,"tile":{"kind":"number","value":"36"}},{"text":"37","is_correct":false,"tile":{"kind":"number","value":"37"}},{"text":"35","is_correct":false,"tile":{"kind":"number","value":"35"}},{"text":"26","is_correct":false,"tile":{"kind":"number","value":"26"}}]$q$::jsonb, $q$36$q$, $q$18 plus 18 is 36! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('ccf7b176-01c4-5a29-9d59-39575e3135af', null, (select id from public.skills where slug = 'addition-within-100'),
   'problem-solving-data-analysis', 'medium', $q$What is 60 plus 35? Tap the answer.$q$, $q$[{"text":"95","is_correct":true,"tile":{"kind":"number","value":"95"}},{"text":"94","is_correct":false,"tile":{"kind":"number","value":"94"}},{"text":"85","is_correct":false,"tile":{"kind":"number","value":"85"}},{"text":"96","is_correct":false,"tile":{"kind":"number","value":"96"}}]$q$::jsonb, $q$95$q$, $q$60 plus 35 is 95! Great adding!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-math-md')::uuid, 'domain', md5('pe-aos:subj-math')::uuid, 'math', 'Measurement & Data', null, 'k-2', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-money-place-value')::uuid, 'skill', md5('pe-aos:dom-math-md')::uuid, 'math', 'Money & Place Value', 'money-place-value', 'k-2', 'problem-solving-data-analysis', '2', 2, 'CCSS.MATH.CONTENT.2.MD.C.8', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- money-place-value (Money & Place Value, grade 2, CCSS.MATH.CONTENT.2.MD.C.8) — 26 audio-picture items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('dfb82122-bd12-5d33-bacf-7e6c6dbd5a89', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'easy', $q$How many cents is a penny worth? Tap the number.$q$, $q$[{"text":"25","is_correct":false,"tile":{"kind":"number","value":"25"}},{"text":"1","is_correct":true,"tile":{"kind":"number","value":"1"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}}]$q$::jsonb, $q$1$q$, $q$A penny is 1 cent! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('b71b41d7-018b-5323-baf0-b06967296b08', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'easy', $q$How many cents is a nickel worth? Tap the number.$q$, $q$[{"text":"5","is_correct":true,"tile":{"kind":"number","value":"5"}},{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"1","is_correct":false,"tile":{"kind":"number","value":"1"}},{"text":"25","is_correct":false,"tile":{"kind":"number","value":"25"}}]$q$::jsonb, $q$5$q$, $q$A nickel is 5 cents! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('f817e3a9-42fa-56f8-b24d-c45b8ec10561', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'easy', $q$How many cents is a dime worth? Tap the number.$q$, $q$[{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"10","is_correct":true,"tile":{"kind":"number","value":"10"}},{"text":"25","is_correct":false,"tile":{"kind":"number","value":"25"}},{"text":"1","is_correct":false,"tile":{"kind":"number","value":"1"}}]$q$::jsonb, $q$10$q$, $q$A dime is 10 cents! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('09df0422-e01f-5176-a9e5-471d45d0e17e', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'easy', $q$How many cents is a quarter worth? Tap the number.$q$, $q$[{"text":"25","is_correct":true,"tile":{"kind":"number","value":"25"}},{"text":"1","is_correct":false,"tile":{"kind":"number","value":"1"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}}]$q$::jsonb, $q$25$q$, $q$A quarter is 25 cents! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('5e1a0aa7-8dff-5359-ac4b-80ad6b9bf50c', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'easy', $q$Which coin is worth 10 cents? Tap it.$q$, $q$[{"text":"nickel","is_correct":false,"tile":{"kind":"object_group","image":"nickel","count":1}},{"text":"penny","is_correct":false,"tile":{"kind":"object_group","image":"penny","count":1}},{"text":"dime","is_correct":true,"tile":{"kind":"object_group","image":"dime","count":1}}]$q$::jsonb, $q$dime$q$, $q$The dime is worth 10 cents! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('9a6a982d-fe8d-57bb-8417-7aeeccdc4e6a', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'easy', $q$Which coin is worth 5 cents? Tap it.$q$, $q$[{"text":"penny","is_correct":false,"tile":{"kind":"object_group","image":"penny","count":1}},{"text":"dime","is_correct":false,"tile":{"kind":"object_group","image":"dime","count":1}},{"text":"nickel","is_correct":true,"tile":{"kind":"object_group","image":"nickel","count":1}}]$q$::jsonb, $q$nickel$q$, $q$The nickel is worth 5 cents! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('b1bfe031-a8b0-50dd-9608-9f18f7f25dfa', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'medium', $q$Which coin is worth 25 cents? Tap it.$q$, $q$[{"text":"dime","is_correct":false,"tile":{"kind":"object_group","image":"dime","count":1}},{"text":"quarter","is_correct":true,"tile":{"kind":"object_group","image":"quarter","count":1}},{"text":"nickel","is_correct":false,"tile":{"kind":"object_group","image":"nickel","count":1}}]$q$::jsonb, $q$quarter$q$, $q$The quarter is worth 25 cents! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('84ecf226-9ece-55c2-92fa-105c81abdcc8', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'easy', $q$Which coin is worth 1 cent? Tap it.$q$, $q$[{"text":"nickel","is_correct":false,"tile":{"kind":"object_group","image":"nickel","count":1}},{"text":"penny","is_correct":true,"tile":{"kind":"object_group","image":"penny","count":1}},{"text":"dime","is_correct":false,"tile":{"kind":"object_group","image":"dime","count":1}}]$q$::jsonb, $q$penny$q$, $q$The penny is worth 1 cent! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('5b53c093-17c8-5b4f-b449-4252f4744ece', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'medium', $q$Here are 2 dimes. How many cents in all? Tap the number.$q$, $q$[{"text":"20","is_correct":true,"tile":{"kind":"number","value":"20"}},{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"2","is_correct":false,"tile":{"kind":"number","value":"2"}},{"text":"25","is_correct":false,"tile":{"kind":"number","value":"25"}}]$q$::jsonb, $q$20$q$, $q$2 dimes is 20 cents! Well done!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"dime","count":2}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('cf231d99-4c8e-59e4-bf81-00636e9d3a12', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'medium', $q$Here are 3 nickels. How many cents in all? Tap the number.$q$, $q$[{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"20","is_correct":false,"tile":{"kind":"number","value":"20"}},{"text":"15","is_correct":true,"tile":{"kind":"number","value":"15"}},{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}}]$q$::jsonb, $q$15$q$, $q$3 nickels is 15 cents! Nice!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"nickel","count":3}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('a6c97c96-0cb6-5a9c-bf5e-26b3ca9e6294', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'medium', $q$Here are 2 nickels. How many cents in all? Tap the number.$q$, $q$[{"text":"15","is_correct":false,"tile":{"kind":"number","value":"15"}},{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"10","is_correct":true,"tile":{"kind":"number","value":"10"}},{"text":"2","is_correct":false,"tile":{"kind":"number","value":"2"}}]$q$::jsonb, $q$10$q$, $q$2 nickels is 10 cents! Great!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"nickel","count":2}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('59063cb1-7646-5a1e-b277-f3b60c47de90', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'medium', $q$Here are 4 pennies. How many cents in all? Tap the number.$q$, $q$[{"text":"5","is_correct":false,"tile":{"kind":"number","value":"5"}},{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}},{"text":"40","is_correct":false,"tile":{"kind":"number","value":"40"}},{"text":"4","is_correct":true,"tile":{"kind":"number","value":"4"}}]$q$::jsonb, $q$4$q$, $q$4 pennies is 4 cents! Well done!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"penny","count":4}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('847bb43d-6064-5ad3-a223-6400b2b0792a', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'hard', $q$Here are 2 quarters. How many cents in all? Tap the number.$q$, $q$[{"text":"25","is_correct":false,"tile":{"kind":"number","value":"25"}},{"text":"50","is_correct":true,"tile":{"kind":"number","value":"50"}},{"text":"20","is_correct":false,"tile":{"kind":"number","value":"20"}},{"text":"75","is_correct":false,"tile":{"kind":"number","value":"75"}}]$q$::jsonb, $q$50$q$, $q$2 quarters is 50 cents! Nice!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"quarter","count":2}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('ea61ab1a-77a5-57d9-9c07-dff0b518d562', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'hard', $q$Here are 3 dimes. How many cents in all? Tap the number.$q$, $q$[{"text":"3","is_correct":false,"tile":{"kind":"number","value":"3"}},{"text":"20","is_correct":false,"tile":{"kind":"number","value":"20"}},{"text":"30","is_correct":true,"tile":{"kind":"number","value":"30"}},{"text":"40","is_correct":false,"tile":{"kind":"number","value":"40"}}]$q$::jsonb, $q$30$q$, $q$3 dimes is 30 cents! Great counting!$q$,
   'published', 'audio_picture', $q${"kind":"object_group","image":"dime","count":3}$q$::jsonb)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('109ee3a0-9015-5c7c-a62b-df5a0e1a61c8', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'easy', $q$Which coin is worth the most? Tap it.$q$, $q$[{"text":"penny","is_correct":false,"tile":{"kind":"object_group","image":"penny","count":1}},{"text":"dime","is_correct":false,"tile":{"kind":"object_group","image":"dime","count":1}},{"text":"quarter","is_correct":true,"tile":{"kind":"object_group","image":"quarter","count":1}}]$q$::jsonb, $q$quarter$q$, $q$The quarter is worth the most! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('43706284-ae55-5d45-8004-175080303660', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'easy', $q$Which coin is worth the least? Tap it.$q$, $q$[{"text":"penny","is_correct":true,"tile":{"kind":"object_group","image":"penny","count":1}},{"text":"dime","is_correct":false,"tile":{"kind":"object_group","image":"dime","count":1}},{"text":"quarter","is_correct":false,"tile":{"kind":"object_group","image":"quarter","count":1}}]$q$::jsonb, $q$penny$q$, $q$The penny is worth the least! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('196570d0-4491-56da-9543-25aea390b5c9', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'medium', $q$What number is 1 hundred, 2 tens, and 3 ones? Tap it.$q$, $q$[{"text":"132","is_correct":false,"tile":{"kind":"number","value":"132"}},{"text":"120","is_correct":false,"tile":{"kind":"number","value":"120"}},{"text":"321","is_correct":false,"tile":{"kind":"number","value":"321"}},{"text":"123","is_correct":true,"tile":{"kind":"number","value":"123"}}]$q$::jsonb, $q$123$q$, $q$1 hundred, 2 tens, 3 ones make 123! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('31803c58-615f-539d-87bc-01cc07eb504a', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'hard', $q$What number is 2 hundreds, 0 tens, and 5 ones? Tap it.$q$, $q$[{"text":"205","is_correct":true,"tile":{"kind":"number","value":"205"}},{"text":"250","is_correct":false,"tile":{"kind":"number","value":"250"}},{"text":"502","is_correct":false,"tile":{"kind":"number","value":"502"}},{"text":"25","is_correct":false,"tile":{"kind":"number","value":"25"}}]$q$::jsonb, $q$205$q$, $q$2 hundreds and 5 ones make 205! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('e5bc9b49-fba3-58ac-81dd-e145741780f8', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'hard', $q$What number is 3 hundreds, 4 tens, and 0 ones? Tap it.$q$, $q$[{"text":"304","is_correct":false,"tile":{"kind":"number","value":"304"}},{"text":"34","is_correct":false,"tile":{"kind":"number","value":"34"}},{"text":"340","is_correct":true,"tile":{"kind":"number","value":"340"}},{"text":"430","is_correct":false,"tile":{"kind":"number","value":"430"}}]$q$::jsonb, $q$340$q$, $q$3 hundreds and 4 tens make 340! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('fe672a27-ccdf-5d23-97bf-6eec39c89653', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'medium', $q$How many hundreds are in 500? Tap the number.$q$, $q$[{"text":"5","is_correct":true,"tile":{"kind":"number","value":"5"}},{"text":"6","is_correct":false,"tile":{"kind":"number","value":"6"}},{"text":"500","is_correct":false,"tile":{"kind":"number","value":"500"}},{"text":"4","is_correct":false,"tile":{"kind":"number","value":"4"}}]$q$::jsonb, $q$5$q$, $q$There are 5 hundreds in 500! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('276a962b-6c43-5c3a-ba59-c7d0487e4ef1', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'medium', $q$What is 100 more than 300? Tap the number.$q$, $q$[{"text":"301","is_correct":false,"tile":{"kind":"number","value":"301"}},{"text":"200","is_correct":false,"tile":{"kind":"number","value":"200"}},{"text":"500","is_correct":false,"tile":{"kind":"number","value":"500"}},{"text":"400","is_correct":true,"tile":{"kind":"number","value":"400"}}]$q$::jsonb, $q$400$q$, $q$100 more than 300 is 400! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('f91a0625-fd7c-55f3-a69a-736831c6aa85', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'medium', $q$What is 10 more than 240? Tap the number.$q$, $q$[{"text":"250","is_correct":true,"tile":{"kind":"number","value":"250"}},{"text":"230","is_correct":false,"tile":{"kind":"number","value":"230"}},{"text":"340","is_correct":false,"tile":{"kind":"number","value":"340"}},{"text":"241","is_correct":false,"tile":{"kind":"number","value":"241"}}]$q$::jsonb, $q$250$q$, $q$10 more than 240 is 250! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('230ab6f2-f78b-52a3-9de4-e33840cc33f5', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'medium', $q$Skip count by 5: 5, 10, 15, and then? Tap the next number.$q$, $q$[{"text":"20","is_correct":true,"tile":{"kind":"number","value":"20"}},{"text":"16","is_correct":false,"tile":{"kind":"number","value":"16"}},{"text":"30","is_correct":false,"tile":{"kind":"number","value":"30"}},{"text":"25","is_correct":false,"tile":{"kind":"number","value":"25"}}]$q$::jsonb, $q$20$q$, $q$After 15 comes 20! Great skip counting!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('0df4d15b-9b5b-53e3-a84e-8e422a371d88', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'medium', $q$Skip count by 10: 10, 20, 30, and then? Tap the next number.$q$, $q$[{"text":"35","is_correct":false,"tile":{"kind":"number","value":"35"}},{"text":"40","is_correct":true,"tile":{"kind":"number","value":"40"}},{"text":"31","is_correct":false,"tile":{"kind":"number","value":"31"}},{"text":"50","is_correct":false,"tile":{"kind":"number","value":"50"}}]$q$::jsonb, $q$40$q$, $q$After 30 comes 40! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('0779be3a-3ef6-5e2d-87da-cbec3053fd2f', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'easy', $q$Skip count by 2: 2, 4, 6, and then? Tap the next number.$q$, $q$[{"text":"8","is_correct":true,"tile":{"kind":"number","value":"8"}},{"text":"9","is_correct":false,"tile":{"kind":"number","value":"9"}},{"text":"10","is_correct":false,"tile":{"kind":"number","value":"10"}},{"text":"7","is_correct":false,"tile":{"kind":"number","value":"7"}}]$q$::jsonb, $q$8$q$, $q$After 6 comes 8! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('89e47a40-9550-5173-a3a3-d12568551c4a', null, (select id from public.skills where slug = 'money-place-value'),
   'problem-solving-data-analysis', 'hard', $q$What number is 4 hundreds, 5 tens, and 6 ones? Tap it.$q$, $q$[{"text":"456","is_correct":true,"tile":{"kind":"number","value":"456"}},{"text":"465","is_correct":false,"tile":{"kind":"number","value":"465"}},{"text":"654","is_correct":false,"tile":{"kind":"number","value":"654"}},{"text":"450","is_correct":false,"tile":{"kind":"number","value":"450"}}]$q$::jsonb, $q$456$q$, $q$4 hundreds, 5 tens, 6 ones make 456! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-reading-comprehension-2')::uuid, 'skill', md5('pe-aos:dom-reading-ri')::uuid, 'reading', 'Reading Comprehension (Grade 2)', 'reading-comprehension-2', 'k-2', 'information-and-ideas', '2', 2, 'CCSS.ELA-LITERACY.RI.2.1', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- reading-comprehension-2 (Reading Comprehension (Grade 2), grade 2, CCSS.ELA-LITERACY.RI.2.1) — 26 audio-picture items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('0676cda2-3655-5cb5-bfef-89863b1b6bb9', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'easy', $q$Listen. A cat and a duck went to the pond. The duck jumped in and swam. The cat sat by the water and watched. Who swam in the pond? Tap the picture.$q$, $q$[{"text":"pig","is_correct":false,"tile":{"kind":"object_group","image":"pig","count":1}},{"text":"duck","is_correct":true,"tile":{"kind":"object_group","image":"duck","count":1}},{"text":"cat","is_correct":false,"tile":{"kind":"object_group","image":"cat","count":1}}]$q$::jsonb, $q$duck$q$, $q$The duck swam in the pond! Great listening!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('1e05d21e-da22-5d77-83d5-196e8287d893', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'easy', $q$Listen. Ben had an apple and a ball. He ate the apple for a snack. Then he played with the ball. What did Ben eat? Tap the picture.$q$, $q$[{"text":"apple","is_correct":true,"tile":{"kind":"object_group","image":"apple","count":1}},{"text":"ball","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":1}},{"text":"fish","is_correct":false,"tile":{"kind":"object_group","image":"fish","count":1}}]$q$::jsonb, $q$apple$q$, $q$Ben ate the apple! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('345e9636-ea04-5404-ab06-5359640a984e', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'easy', $q$Listen. The kids went to the park. They flew a kite up high. Then it rained, so they ran home. What did the kids fly? Tap the picture.$q$, $q$[{"text":"ball","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":1}},{"text":"duck","is_correct":false,"tile":{"kind":"object_group","image":"duck","count":1}},{"text":"kite","is_correct":true,"tile":{"kind":"object_group","image":"kite","count":1}}]$q$::jsonb, $q$kite$q$, $q$The kids flew a kite! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('0172bf36-c01f-5192-94ef-1d8486ee5686', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'easy', $q$Listen. Mom drove the van to the store. She bought a big pot for soup. At home she made dinner. What did Mom buy? Tap the picture.$q$, $q$[{"text":"pot","is_correct":true,"tile":{"kind":"object_group","image":"pot","count":1}},{"text":"van","is_correct":false,"tile":{"kind":"object_group","image":"van","count":1}},{"text":"hat","is_correct":false,"tile":{"kind":"object_group","image":"hat","count":1}}]$q$::jsonb, $q$pot$q$, $q$Mom bought a pot! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('27700151-0317-587e-88b7-965388c9b32f', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'easy', $q$Listen. A pig and a duck are friends. The pig likes the mud. The duck likes the water. Who likes the mud? Tap the picture.$q$, $q$[{"text":"cat","is_correct":false,"tile":{"kind":"object_group","image":"cat","count":1}},{"text":"duck","is_correct":false,"tile":{"kind":"object_group","image":"duck","count":1}},{"text":"pig","is_correct":true,"tile":{"kind":"object_group","image":"pig","count":1}}]$q$::jsonb, $q$pig$q$, $q$The pig likes the mud! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('fccd756b-08f4-5bca-a9b7-e9f1376f02f0', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'medium', $q$Listen. Lin got a gift in a box. Inside was a soft hat. She put it on her head. What was inside the gift box? Tap the picture.$q$, $q$[{"text":"gift","is_correct":false,"tile":{"kind":"object_group","image":"gift","count":1}},{"text":"ball","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":1}},{"text":"hat","is_correct":true,"tile":{"kind":"object_group","image":"hat","count":1}}]$q$::jsonb, $q$hat$q$, $q$A hat was inside! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('6c6a5919-5c89-5bdd-9018-ef5fc97f31e0', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'medium', $q$Listen. The cat was cold. It found a warm house and went inside. It slept by the door. Where did the cat go? Tap the picture.$q$, $q$[{"text":"tree","is_correct":false,"tile":{"kind":"object_group","image":"tree","count":1}},{"text":"house","is_correct":true,"tile":{"kind":"object_group","image":"house","count":1}},{"text":"bus","is_correct":false,"tile":{"kind":"object_group","image":"bus","count":1}}]$q$::jsonb, $q$house$q$, $q$The cat went into the house! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c1568e2c-d1f0-5653-92b6-37d2847bbc15', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'medium', $q$Listen. A duck made a nest under the tree. It kept its eggs warm there. Where did the duck make its nest? Tap the picture.$q$, $q$[{"text":"house","is_correct":false,"tile":{"kind":"object_group","image":"house","count":1}},{"text":"tree","is_correct":true,"tile":{"kind":"object_group","image":"tree","count":1}},{"text":"tent","is_correct":false,"tile":{"kind":"object_group","image":"tent","count":1}}]$q$::jsonb, $q$tree$q$, $q$Under the tree! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('cc1de10d-13c1-5ce1-a44a-c6cac153acb3', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'medium', $q$Listen. The family went camping. They set up a tent in the woods. They slept inside it. Where did the family sleep? Tap the picture.$q$, $q$[{"text":"tent","is_correct":true,"tile":{"kind":"object_group","image":"tent","count":1}},{"text":"house","is_correct":false,"tile":{"kind":"object_group","image":"house","count":1}},{"text":"van","is_correct":false,"tile":{"kind":"object_group","image":"van","count":1}}]$q$::jsonb, $q$tent$q$, $q$They slept in the tent! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('3765518b-45bc-5228-bd06-21bdd4286236', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'medium', $q$Listen. Sam has a red ball and a blue kite. On windy days he flies the kite. On sunny days he kicks the ball. What does Sam fly on windy days? Tap the picture.$q$, $q$[{"text":"ball","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":1}},{"text":"kite","is_correct":true,"tile":{"kind":"object_group","image":"kite","count":1}},{"text":"sun","is_correct":false,"tile":{"kind":"object_group","image":"sun","count":1}}]$q$::jsonb, $q$kite$q$, $q$Sam flies the kite on windy days! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('cd5b2e28-eba6-5d1f-8aa8-5b9b30db0ba1', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'medium', $q$Listen. A cat chased a ball across the room. The ball rolled under the bed. What did the cat chase? Tap the picture.$q$, $q$[{"text":"fish","is_correct":false,"tile":{"kind":"object_group","image":"fish","count":1}},{"text":"ball","is_correct":true,"tile":{"kind":"object_group","image":"ball","count":1}},{"text":"duck","is_correct":false,"tile":{"kind":"object_group","image":"duck","count":1}}]$q$::jsonb, $q$ball$q$, $q$The cat chased the ball! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('51aaa119-315d-5a0a-bd5d-c37567807088', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'medium', $q$Listen. Ana picked a flower and a leaf in the garden. She gave the flower to her mom. What did Ana give to her mom? Tap the picture.$q$, $q$[{"text":"leaf","is_correct":false,"tile":{"kind":"object_group","image":"leaf","count":1}},{"text":"apple","is_correct":false,"tile":{"kind":"object_group","image":"apple","count":1}},{"text":"flower","is_correct":true,"tile":{"kind":"object_group","image":"flower","count":1}}]$q$::jsonb, $q$flower$q$, $q$Ana gave the flower! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('8ac41bb7-a9e3-5a05-a9bc-a986c3fa7dbb', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'medium', $q$Listen. It was dark out. Ravi looked up at the round, white moon in the sky. What did Ravi look at? Tap the picture.$q$, $q$[{"text":"moon","is_correct":true,"tile":{"kind":"object_group","image":"moon","count":1}},{"text":"ball","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":1}},{"text":"sun","is_correct":false,"tile":{"kind":"object_group","image":"sun","count":1}}]$q$::jsonb, $q$moon$q$, $q$Ravi looked at the moon! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('c0c52b39-b5da-5f9f-91a5-a447df2782a0', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'medium', $q$Listen. The bus was full of kids. It stopped at the school. The kids got off and went inside. What was full of kids? Tap the picture.$q$, $q$[{"text":"van","is_correct":false,"tile":{"kind":"object_group","image":"van","count":1}},{"text":"bus","is_correct":true,"tile":{"kind":"object_group","image":"bus","count":1}},{"text":"house","is_correct":false,"tile":{"kind":"object_group","image":"house","count":1}}]$q$::jsonb, $q$bus$q$, $q$The bus was full of kids! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('93519954-bd6c-55a2-bfb2-26da893fae5f', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'hard', $q$Listen. A pig sat in the sun. It got too hot, so it went to sit under a tree. Where did the pig go to cool off? Tap the picture.$q$, $q$[{"text":"tent","is_correct":false,"tile":{"kind":"object_group","image":"tent","count":1}},{"text":"house","is_correct":false,"tile":{"kind":"object_group","image":"house","count":1}},{"text":"tree","is_correct":true,"tile":{"kind":"object_group","image":"tree","count":1}}]$q$::jsonb, $q$tree$q$, $q$The pig went under the tree! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('d92c97f4-a310-5d65-87c3-1e24bfcadec4', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'hard', $q$Listen. Nia lost her sock. She looked in the box and under the mug. She found it in her shoe. What did Nia lose? Tap the picture.$q$, $q$[{"text":"sock","is_correct":true,"tile":{"kind":"object_group","image":"sock","count":1}},{"text":"hat","is_correct":false,"tile":{"kind":"object_group","image":"hat","count":1}},{"text":"mug","is_correct":false,"tile":{"kind":"object_group","image":"mug","count":1}}]$q$::jsonb, $q$sock$q$, $q$Nia lost her sock! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('ae612a39-54ab-5359-aa1d-a27f5e19b734', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'hard', $q$Listen. The key was tiny and gold. It opened the little door on the toy house. What did the key open? Tap the picture.$q$, $q$[{"text":"gift","is_correct":false,"tile":{"kind":"object_group","image":"gift","count":1}},{"text":"tent","is_correct":false,"tile":{"kind":"object_group","image":"tent","count":1}},{"text":"door","is_correct":true,"tile":{"kind":"object_group","image":"door","count":1}}]$q$::jsonb, $q$door$q$, $q$The key opened the door! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('fb504df0-0e4e-5078-a65c-903e82df67c0', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'hard', $q$Listen. A jet flew over the house. It was loud and fast. The cat hid under the bed. What flew over the house? Tap the picture.$q$, $q$[{"text":"jet","is_correct":true,"tile":{"kind":"object_group","image":"jet","count":1}},{"text":"bus","is_correct":false,"tile":{"kind":"object_group","image":"bus","count":1}},{"text":"kite","is_correct":false,"tile":{"kind":"object_group","image":"kite","count":1}}]$q$::jsonb, $q$jet$q$, $q$A jet flew over! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('7df9c110-1907-5fc4-9638-0309f1207c32', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'medium', $q$Listen. Meg made soup in a big pot. She added carrots and beans. It smelled great. What did Meg make the soup in? Tap the picture.$q$, $q$[{"text":"mug","is_correct":false,"tile":{"kind":"object_group","image":"mug","count":1}},{"text":"pot","is_correct":true,"tile":{"kind":"object_group","image":"pot","count":1}},{"text":"hat","is_correct":false,"tile":{"kind":"object_group","image":"hat","count":1}}]$q$::jsonb, $q$pot$q$, $q$Meg made soup in the pot! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('b6c3960b-c109-553d-a038-9b4c2d7c00b6', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'medium', $q$Listen. The duck and the fish live in the pond. The duck swims on top. The fish swims down deep. Who swims down deep? Tap the picture.$q$, $q$[{"text":"pig","is_correct":false,"tile":{"kind":"object_group","image":"pig","count":1}},{"text":"duck","is_correct":false,"tile":{"kind":"object_group","image":"duck","count":1}},{"text":"fish","is_correct":true,"tile":{"kind":"object_group","image":"fish","count":1}}]$q$::jsonb, $q$fish$q$, $q$The fish swims down deep! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('e82270af-a016-5b6a-ad44-af21c675e13a', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'medium', $q$Listen. Tom wore a warm cap and a scarf. The cap kept his ears warm. What kept Tom’s ears warm? Tap the picture.$q$, $q$[{"text":"sock","is_correct":false,"tile":{"kind":"object_group","image":"sock","count":1}},{"text":"mug","is_correct":false,"tile":{"kind":"object_group","image":"mug","count":1}},{"text":"cap","is_correct":true,"tile":{"kind":"object_group","image":"cap","count":1}}]$q$::jsonb, $q$cap$q$, $q$The cap kept his ears warm! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('d0ec12c8-6baf-5043-a5ea-3ba359a51c0c', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'hard', $q$Listen. A yo-yo spun down the string and back up again. The kids clapped. What spun down the string? Tap the picture.$q$, $q$[{"text":"yoyo","is_correct":true,"tile":{"kind":"object_group","image":"yoyo","count":1}},{"text":"ball","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":1}},{"text":"ring","is_correct":false,"tile":{"kind":"object_group","image":"ring","count":1}}]$q$::jsonb, $q$yoyo$q$, $q$The yo-yo spun down the string! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('7db1bdcc-cf6a-5c17-896a-ab312311b8b8', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'medium', $q$Listen. The tree had red apples. Ben climbed up and picked one. Then he took a big bite. What did Ben pick from the tree? Tap the picture.$q$, $q$[{"text":"apple","is_correct":true,"tile":{"kind":"object_group","image":"apple","count":1}},{"text":"flower","is_correct":false,"tile":{"kind":"object_group","image":"flower","count":1}},{"text":"leaf","is_correct":false,"tile":{"kind":"object_group","image":"leaf","count":1}}]$q$::jsonb, $q$apple$q$, $q$Ben picked an apple! Great!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('86a61e76-4b76-528a-8462-4c09d0f409dc', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'hard', $q$Listen. A ring rolled off the table. It rolled under the door. Dad found it there. What rolled under the door? Tap the picture.$q$, $q$[{"text":"ring","is_correct":true,"tile":{"kind":"object_group","image":"ring","count":1}},{"text":"ball","is_correct":false,"tile":{"kind":"object_group","image":"ball","count":1}},{"text":"key","is_correct":false,"tile":{"kind":"object_group","image":"key","count":1}}]$q$::jsonb, $q$ring$q$, $q$The ring rolled under the door! Well done!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('eb677fef-8a97-5a6f-98dc-01ee9f599efa', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'hard', $q$Listen. The kite got stuck in the tall tree. Dad reached up and got it down. Where did the kite get stuck? Tap the picture.$q$, $q$[{"text":"tent","is_correct":false,"tile":{"kind":"object_group","image":"tent","count":1}},{"text":"house","is_correct":false,"tile":{"kind":"object_group","image":"house","count":1}},{"text":"tree","is_correct":true,"tile":{"kind":"object_group","image":"tree","count":1}}]$q$::jsonb, $q$tree$q$, $q$The kite got stuck in the tree! Nice!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, render_mode, prompt)
values
  ('526a39ab-a7fa-5a7e-a348-c0ed763ae316', null, (select id from public.skills where slug = 'reading-comprehension-2'),
   'information-and-ideas', 'easy', $q$Listen. The sun came up in the morning. It was bright and warm. The flowers opened up. What came up in the morning? Tap the picture.$q$, $q$[{"text":"moon","is_correct":false,"tile":{"kind":"object_group","image":"moon","count":1}},{"text":"sun","is_correct":true,"tile":{"kind":"object_group","image":"sun","count":1}},{"text":"star","is_correct":false,"tile":{"kind":"object_group","image":"star","count":1}}]$q$::jsonb, $q$sun$q$, $q$The sun came up! Great listening!$q$,
   'published', 'audio_picture', null)
on conflict (id) do update set
  skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment, difficulty=excluded.difficulty,
  stem=excluded.stem, choices=excluded.choices, correct_answer=excluded.correct_answer, solution=excluded.solution,
  status=excluded.status, render_mode=excluded.render_mode, prompt=excluded.prompt;

commit;
