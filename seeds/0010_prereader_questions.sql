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

-- counting (Counting, grade K, CCSS.MATH.CONTENT.K.CC.B.5) — 18 audio-picture items
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

insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, prerequisite_skills)
values (md5('pe-aos:dom-reading-foundational')::uuid, 'domain', md5('pe-aos:subj-reading')::uuid, 'reading', 'Reading Foundational Skills', null, 'k-2', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, grade_band=excluded.grade_band;
insert into public.skills (id, level, parent_id, subject, name, slug, grade_band, sat_alignment, ccss_grade, ccss_grade_num, ccss_code, prerequisite_skills)
values (md5('pe-aos:skill-letter-sounds')::uuid, 'skill', md5('pe-aos:dom-reading-foundational')::uuid, 'reading', 'Letter Sounds', 'letter-sounds', 'k-2', 'information-and-ideas', 'K', 0, 'CCSS.ELA-LITERACY.RF.K.3.A', '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band, sat_alignment=excluded.sat_alignment, ccss_grade=excluded.ccss_grade, ccss_grade_num=excluded.ccss_grade_num, ccss_code=excluded.ccss_code;

-- letter-sounds (Letter Sounds, grade K, CCSS.ELA-LITERACY.RF.K.3.A) — 15 audio-picture items
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

commit;
