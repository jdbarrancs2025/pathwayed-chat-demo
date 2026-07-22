-- PathwayEd — Question Engine: PREP sentence completions skills + questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-prep-seeds.ts from the curated
-- pools in src/lib/prep/*Templates.ts. HOW TO APPLY (self-contained — creates the
-- isolated prep subject + domain + skills, then the questions):
--   bun run db:seed seeds/0017_prep_sentence_completion_questions.sql
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
values (md5('pe-aos:skill-prep-sentence-completion')::uuid, 'skill', md5('pe-aos:dom-prep-verbal')::uuid, 'prep-verbal', 'Sentence Completion', 'prep-sentence-completion', '6-8', null, '{}')
on conflict (id) do update set level=excluded.level, parent_id=excluded.parent_id, subject=excluded.subject, name=excluded.name, slug=excluded.slug, grade_band=excluded.grade_band;

-- prep-sentence-completion (Sentence Completion) — 66 items
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('78d04d09-767c-5edd-b18b-ce40798718f3', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$Although the morning began sunny and warm, by afternoon the sky turned dark and ___.$q$, $q$[{"text":"sunny","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"stormy","is_correct":true},{"text":"lovely","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"distant","is_correct":false,"misconception_token":"sc-off-topic"}]$q$::jsonb, $q$stormy$q$, $q$The word "Although" signals CONTRAST with "sunny and warm," so the blank needs an opposite weather word: stormy.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('9068b74c-af97-5c16-90ee-80cfb3672f19', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$The puppy was usually gentle, but when the stranger approached it became surprisingly ___.$q$, $q$[{"text":"friendly","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"playful","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"fierce","is_correct":true},{"text":"furry","is_correct":false,"misconception_token":"sc-off-topic"}]$q$::jsonb, $q$fierce$q$, $q$The word "but" signals CONTRAST with "gentle," so the blank needs the opposite: fierce.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('13390a72-4446-5ed4-a080-c9a55e46363e', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$Unlike his messy older brother, Sam kept his room perfectly ___.$q$, $q$[{"text":"cluttered","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"dusty","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"spacious","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"tidy","is_correct":true}]$q$::jsonb, $q$tidy$q$, $q$The word "Unlike" signals CONTRAST with "messy," so the blank must oppose it: tidy.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dd5c25a7-c3eb-50f8-b45b-8d324f1329c2', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$The first draft was dull, however the final version was lively and ___.$q$, $q$[{"text":"engaging","is_correct":true},{"text":"boring","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"lengthy","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"gloomy","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$engaging$q$, $q$The word "however" signals CONTRAST with "dull," so the blank matches "lively": engaging.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('38ce48b9-c721-5997-8dde-db1f2909231e', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$The soup was supposed to be spicy, but to everyone's surprise it tasted rather ___.$q$, $q$[{"text":"fiery","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"bland","is_correct":true},{"text":"lovely","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"warm","is_correct":false,"misconception_token":"sc-off-topic"}]$q$::jsonb, $q$bland$q$, $q$The word "but" signals CONTRAST with "spicy," so the blank needs the opposite: bland.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2d5bebc8-3a6d-5dd0-8b21-04fd65bc32c2', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$My grandmother is quiet and reserved, while my grandfather is loud and ___.$q$, $q$[{"text":"shy","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"grumpy","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"bold","is_correct":true},{"text":"elderly","is_correct":false,"misconception_token":"sc-off-topic"}]$q$::jsonb, $q$bold$q$, $q$The word "while" signals CONTRAST with "quiet and reserved," so the blank matches "loud": bold.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('84badcaa-064e-5951-8b7e-a6f76b702b3a', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$Because Maria had studied every night, she felt completely ___ for the big exam.$q$, $q$[{"text":"nervous","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"unready","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"hungry","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"prepared","is_correct":true}]$q$::jsonb, $q$prepared$q$, $q$The word "Because" signals CAUSE and effect: studying every night makes her prepared.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('41771785-9743-5992-ad17-c0207b324314', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$Since it had not rained for weeks, the once-green fields turned dry and ___.$q$, $q$[{"text":"brown","is_correct":true},{"text":"lush","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"muddy","is_correct":false,"misconception_token":"sc-reversed-causation"},{"text":"fenced","is_correct":false,"misconception_token":"sc-off-topic"}]$q$::jsonb, $q$brown$q$, $q$The word "Since" signals CAUSE and effect: no rain makes the fields dry and brown.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('654f549b-d3ce-5840-82b4-a7b1fa2b960c', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$The team practiced hard all season, so they easily ___ the championship game.$q$, $q$[{"text":"lost","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"won","is_correct":true},{"text":"quit","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"forgot","is_correct":false,"misconception_token":"sc-off-topic"}]$q$::jsonb, $q$won$q$, $q$The word "so" signals CAUSE and effect: hard practice leads them to have won.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e0e1cb94-6584-5172-a620-a8ad92ab646e', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$Because Jonah forgot to set his alarm, he was ___ for the first class.$q$, $q$[{"text":"early","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"eager","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"late","is_correct":true},{"text":"seated","is_correct":false,"misconception_token":"sc-off-topic"}]$q$::jsonb, $q$late$q$, $q$The word "Because" signals CAUSE and effect: a missed alarm makes him late.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a63baba4-0ba5-5fb1-ac23-d02574764d95', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$Since the store was having a huge sale, the shelves were quickly left nearly ___.$q$, $q$[{"text":"full","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"crowded","is_correct":false,"misconception_token":"sc-reversed-causation"},{"text":"sturdy","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"empty","is_correct":true}]$q$::jsonb, $q$empty$q$, $q$The word "Since" signals CAUSE and effect: a huge sale leaves the shelves empty.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('33bf5562-5743-50fc-8455-555ec79a7d67', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$Because the movie was so boring, several people ___ before it ended.$q$, $q$[{"text":"left","is_correct":true},{"text":"applauded","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"stayed","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"arrived","is_correct":false,"misconception_token":"sc-off-topic"}]$q$::jsonb, $q$left$q$, $q$The word "Because" signals CAUSE and effect: a boring movie makes people leave, so they left.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('51d08a55-473b-56ba-86f1-4fe9bed7cd5a', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$The old bridge was unstable; in other words, it was too ___ to cross safely.$q$, $q$[{"text":"sturdy","is_correct":false,"misconception_token":"sc-ignored-restatement"},{"text":"shaky","is_correct":true},{"text":"reliable","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"wooden","is_correct":false,"misconception_token":"sc-off-topic"}]$q$::jsonb, $q$shaky$q$, $q$The phrase "in other words" signals RESTATEMENT, so the blank must match "unstable": shaky.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('38294d83-93ac-5c2a-ad98-c68b404ab224', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$The instructions were brief; that is, they were short and ___.$q$, $q$[{"text":"complicated","is_correct":false,"misconception_token":"sc-ignored-restatement"},{"text":"colorful","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"simple","is_correct":true},{"text":"tedious","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$simple$q$, $q$The phrase "that is" signals RESTATEMENT of "brief," so the blank matches "short": simple.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5cbd1c7f-29cd-5939-82dc-90b03ce226d0', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$Ms. Lee is generous, or in other words, very ___ with her time and money.$q$, $q$[{"text":"stingy","is_correct":false,"misconception_token":"sc-ignored-restatement"},{"text":"busy","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"wealthy","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"giving","is_correct":true}]$q$::jsonb, $q$giving$q$, $q$The phrase "in other words" signals RESTATEMENT of "generous," so the blank matches it: giving.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('60fabfd8-ec9d-5cb1-a97e-b4854da2e6a7', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$The lake was tranquil, that is, completely ___ and still.$q$, $q$[{"text":"calm","is_correct":true},{"text":"choppy","is_correct":false,"misconception_token":"sc-ignored-restatement"},{"text":"murky","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"chilly","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$calm$q$, $q$The phrase "that is" signals RESTATEMENT of "tranquil," so the blank matches it: calm.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('01513f03-f6be-5309-80a5-bea1b10f8773', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$The directions were clear, or in other words, easy to ___.$q$, $q$[{"text":"misunderstand","is_correct":false,"misconception_token":"sc-ignored-restatement"},{"text":"follow","is_correct":true},{"text":"ignore","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"rewrite","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$follow$q$, $q$The phrase "in other words" signals RESTATEMENT of "clear," so the blank fits "easy to": follow.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ccd2fc99-92f6-561b-a077-5cf334a2ca10', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$The scientist was meticulous, that is, extremely ___ about every detail.$q$, $q$[{"text":"careless","is_correct":false,"misconception_token":"sc-ignored-restatement"},{"text":"curious","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"careful","is_correct":true},{"text":"famous","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$careful$q$, $q$The phrase "that is" signals RESTATEMENT of "meticulous," so the blank matches it: careful.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('5a7c149a-ac74-5acf-891e-1c607092c916', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$The critic ___ the film's acting, but she ___ its confusing plot.$q$, $q$[{"text":"praised . . . admired","is_correct":false,"misconception_token":"sc-second-blank-mismatch"},{"text":"mocked . . . faulted","is_correct":false,"misconception_token":"sc-first-blank-mismatch"},{"text":"enjoyed . . . praised","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"praised . . . faulted","is_correct":true}]$q$::jsonb, $q$praised . . . faulted$q$, $q$The word "but" signals CONTRAST between the blanks: she liked the acting (praised) but disliked the plot (faulted).$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('701de9e2-bd4e-5c3e-a4d6-06ca9b93870e', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$Because the road was ___, the drivers had to slow down and proceed with ___.$q$, $q$[{"text":"icy . . . caution","is_correct":true},{"text":"icy . . . speed","is_correct":false,"misconception_token":"sc-second-blank-mismatch"},{"text":"clear . . . caution","is_correct":false,"misconception_token":"sc-first-blank-mismatch"},{"text":"dry . . . confidence","is_correct":false,"misconception_token":"sc-ignored-causation"}]$q$::jsonb, $q$icy . . . caution$q$, $q$The word "Because" signals CAUSE and effect: an icy road (cause) makes drivers use caution (effect).$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('053d4e70-ca66-5877-a3d2-371c2dd6c81e', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$The morning was ___, but by noon the weather had become warm and ___.$q$, $q$[{"text":"warm . . . pleasant","is_correct":false,"misconception_token":"sc-first-blank-mismatch"},{"text":"chilly . . . pleasant","is_correct":true},{"text":"chilly . . . freezing","is_correct":false,"misconception_token":"sc-second-blank-mismatch"},{"text":"cold . . . harsh","is_correct":false,"misconception_token":"sc-ignored-contrast"}]$q$::jsonb, $q$chilly . . . pleasant$q$, $q$The word "but" signals CONTRAST: a chilly morning turns into a warm, pleasant afternoon.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('1f6519b0-58bd-5a44-8270-0efa9f8894f2', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'easy',
   $q$The guide was ___; that is, he was ___ and eager to help everyone.$q$, $q$[{"text":"kind . . . unhelpful","is_correct":false,"misconception_token":"sc-second-blank-mismatch"},{"text":"mean . . . helpful","is_correct":false,"misconception_token":"sc-first-blank-mismatch"},{"text":"kind . . . helpful","is_correct":true},{"text":"harsh . . . cold","is_correct":false,"misconception_token":"sc-ignored-restatement"}]$q$::jsonb, $q$kind . . . helpful$q$, $q$The phrase "that is" signals RESTATEMENT: both blanks must describe a friendly guide — kind and helpful.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('51b0e126-7c94-5ba8-a0b9-d6383503f057', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$The senator's speech was expected to be inspiring, but it turned out to be tedious and ___.$q$, $q$[{"text":"rousing","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"brief","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"formal","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"dull","is_correct":true}]$q$::jsonb, $q$dull$q$, $q$The word "but" signals CONTRAST with "inspiring," so the blank matches "tedious": dull.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('2deac763-efce-50d5-97ac-56d568d71463', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$Although the plan seemed foolproof, a single overlooked detail made it utterly ___.$q$, $q$[{"text":"flawed","is_correct":true},{"text":"perfect","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"complex","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"costly","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$flawed$q$, $q$The word "Although" signals CONTRAST with "foolproof," so the blank needs the opposite: flawed.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('66478a13-cccf-55c0-94c7-eafc2a8b2006', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$Ordinarily punctual, Devon was uncharacteristically ___ to the meeting this morning.$q$, $q$[{"text":"prompt","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"tardy","is_correct":true},{"text":"polite","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"weary","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$tardy$q$, $q$The word "uncharacteristically" signals CONTRAST with "punctual," so the blank needs the opposite: tardy.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d812b62c-7fd1-5495-83c0-6438bbecd341', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$The critic praised the actor's talent but ___ his poor choice of roles.$q$, $q$[{"text":"admired","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"noticed","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"lamented","is_correct":true},{"text":"applauded","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$lamented$q$, $q$The word "but" signals CONTRAST with "praised," so the blank must be negative: lamented.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('c118eab0-3255-5d38-ad31-85a8ee55b16c', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$While the first experiment yielded clear results, the second produced data that was hopelessly ___.$q$, $q$[{"text":"obvious","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"useful","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"lengthy","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"muddled","is_correct":true}]$q$::jsonb, $q$muddled$q$, $q$The word "While" signals CONTRAST with "clear," so the blank needs the opposite: muddled.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('90eef0ab-075b-5767-a7ed-bc06014c4eef', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$Though normally frugal, Aunt Rosa was surprisingly ___ during the holidays.$q$, $q$[{"text":"lavish","is_correct":true},{"text":"thrifty","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"cheerful","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"grumpy","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$lavish$q$, $q$The word "Though" signals CONTRAST with "frugal," so the blank needs the opposite: lavish.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d56921c1-6dba-5825-b12d-7ba04a204723', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$The first witness seemed credible, but the second was clearly ___.$q$, $q$[{"text":"believable","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"dishonest","is_correct":true},{"text":"nervous","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"elderly","is_correct":false,"misconception_token":"sc-off-topic"}]$q$::jsonb, $q$dishonest$q$, $q$The word "but" signals CONTRAST with "credible," so the blank needs the opposite: dishonest.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3b11e2ed-369e-52b5-8606-f192b45547c8', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$Since the evidence was overwhelming, the jury reached a ___ verdict without much debate.$q$, $q$[{"text":"hesitant","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"lengthy","is_correct":false,"misconception_token":"sc-reversed-causation"},{"text":"swift","is_correct":true},{"text":"harsh","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$swift$q$, $q$The word "Since" signals CAUSE and effect: overwhelming evidence leads to a swift verdict.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('586c2775-5b4e-5a9b-bf84-d9f52ef96e0e', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$Because the coach demanded discipline, the once-chaotic team became remarkably ___.$q$, $q$[{"text":"unruly","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"talented","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"exhausted","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"orderly","is_correct":true}]$q$::jsonb, $q$orderly$q$, $q$The word "Because" signals CAUSE and effect: demanding discipline makes the team orderly.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('13da06c7-3d88-52a8-b0f4-a197d4c68541', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$Since the directions were ambiguous, many hikers grew ___ about which trail to take.$q$, $q$[{"text":"confused","is_correct":true},{"text":"certain","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"excited","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"thirsty","is_correct":false,"misconception_token":"sc-off-topic"}]$q$::jsonb, $q$confused$q$, $q$The word "Since" signals CAUSE and effect: ambiguous directions make the hikers confused.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('7711ec4e-1903-52b1-999d-e60c7f346bd1', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$Because she rehearsed for months, the pianist performed with effortless ___.$q$, $q$[{"text":"fear","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"grace","is_correct":true},{"text":"boredom","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"volume","is_correct":false,"misconception_token":"sc-off-topic"}]$q$::jsonb, $q$grace$q$, $q$The word "Because" signals CAUSE and effect: months of rehearsal produce effortless grace.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('06476be2-3e54-51c6-9235-887c9e6bb758', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$Since no one maintained the garden, it soon became ___ with weeds.$q$, $q$[{"text":"manicured","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"fragrant","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"overgrown","is_correct":true},{"text":"blooming","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$overgrown$q$, $q$The word "Since" signals CAUSE and effect: a neglected garden becomes overgrown.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('59c4eee4-b30e-5954-860b-91c7f5ef02f5', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$Because the ice was dangerously thin, the skaters were warned to be ___.$q$, $q$[{"text":"reckless","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"joyful","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"swift","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"cautious","is_correct":true}]$q$::jsonb, $q$cautious$q$, $q$The word "Because" signals CAUSE and effect: thin, dangerous ice means the skaters should be cautious.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3eedb678-f75a-5590-b29a-9ceaa421b1f4', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$Since the recipe called for precise measurements, careless cooks often ___ the dish.$q$, $q$[{"text":"ruined","is_correct":true},{"text":"perfected","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"garnished","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"praised","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$ruined$q$, $q$The word "Since" signals CAUSE and effect: precise measurements plus carelessness lead cooks to have ruined the dish.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('74ef7a82-3212-53de-b193-0be3db4add65', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$The professor was renowned; that is, she was widely ___ in her field.$q$, $q$[{"text":"unknown","is_correct":false,"misconception_token":"sc-ignored-restatement"},{"text":"celebrated","is_correct":true},{"text":"criticized","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"employed","is_correct":false,"misconception_token":"sc-off-topic"}]$q$::jsonb, $q$celebrated$q$, $q$The phrase "that is" signals RESTATEMENT of "renowned," so the blank matches it: celebrated.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('68baafc4-f0c7-5619-b478-c71886deeb0e', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$His excuse was unconvincing; that is, it seemed ___.$q$, $q$[{"text":"truthful","is_correct":false,"misconception_token":"sc-ignored-restatement"},{"text":"lengthy","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"false","is_correct":true},{"text":"amusing","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$false$q$, $q$The phrase "that is" signals RESTATEMENT of "unconvincing," so the blank matches it: false.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('66aefcc7-6a08-584b-8e1e-91cd517959ea', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$The room was immaculate; in other words, absolutely ___.$q$, $q$[{"text":"filthy","is_correct":false,"misconception_token":"sc-ignored-restatement"},{"text":"spacious","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"gloomy","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"spotless","is_correct":true}]$q$::jsonb, $q$spotless$q$, $q$The phrase "in other words" signals RESTATEMENT of "immaculate," so the blank matches it: spotless.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('456bb72e-71b0-5294-946f-d157900007c4', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$The old contract is now obsolete; in other words, completely ___.$q$, $q$[{"text":"outdated","is_correct":true},{"text":"current","is_correct":false,"misconception_token":"sc-ignored-restatement"},{"text":"binding","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"costly","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$outdated$q$, $q$The phrase "in other words" signals RESTATEMENT of "obsolete," so the blank matches it: outdated.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('fd603006-3a23-581b-b4f8-a05ed8b891ca', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$The general was resolute; that is, absolutely ___ in his decision.$q$, $q$[{"text":"unsure","is_correct":false,"misconception_token":"sc-ignored-restatement"},{"text":"firm","is_correct":true},{"text":"tired","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"kindly","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$firm$q$, $q$The phrase "that is" signals RESTATEMENT of "resolute," so the blank matches it: firm.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('8ea38e5c-14db-5a2d-a169-8be4152b4144', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$The novel's opening was ___, yet its ending felt rushed and ___.$q$, $q$[{"text":"gripping . . . thrilling","is_correct":false,"misconception_token":"sc-second-blank-mismatch"},{"text":"boring . . . flat","is_correct":false,"misconception_token":"sc-first-blank-mismatch"},{"text":"gripping . . . flat","is_correct":true},{"text":"dull . . . weak","is_correct":false,"misconception_token":"sc-ignored-contrast"}]$q$::jsonb, $q$gripping . . . flat$q$, $q$The word "yet" signals CONTRAST: a gripping opening set against a flat, rushed ending.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f807470c-43ea-5c35-a052-6a46d1695300', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$Because the funding was ___, the researchers were forced to ___ their ambitious project.$q$, $q$[{"text":"cut . . . expand","is_correct":false,"misconception_token":"sc-second-blank-mismatch"},{"text":"secured . . . abandon","is_correct":false,"misconception_token":"sc-first-blank-mismatch"},{"text":"increased . . . fund","is_correct":false,"misconception_token":"sc-reversed-causation"},{"text":"cut . . . abandon","is_correct":true}]$q$::jsonb, $q$cut . . . abandon$q$, $q$The word "Because" signals CAUSE and effect: funding that was cut (cause) forces them to abandon the project (effect).$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d8392c04-cda1-5132-bb5e-47d721ba63f7', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'medium',
   $q$The witness gave a ___ account; that is, a report that was ___ and easy to follow.$q$, $q$[{"text":"coherent . . . clear","is_correct":true},{"text":"coherent . . . muddled","is_correct":false,"misconception_token":"sc-second-blank-mismatch"},{"text":"rambling . . . clear","is_correct":false,"misconception_token":"sc-first-blank-mismatch"},{"text":"confusing . . . vague","is_correct":false,"misconception_token":"sc-ignored-restatement"}]$q$::jsonb, $q$coherent . . . clear$q$, $q$The phrase "that is" signals RESTATEMENT: both blanks describe an easy-to-follow account — coherent and clear.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a7c72911-3bde-5585-9176-7e62aeafb7f5', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$Although the diplomat's tone was conciliatory, his actual demands remained utterly ___.$q$, $q$[{"text":"agreeable","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"rigid","is_correct":true},{"text":"eloquent","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"courteous","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$rigid$q$, $q$The word "Although" signals CONTRAST with "conciliatory," so the blank needs the opposite: rigid.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('3763c32a-97b2-5c79-9a93-ebe926a2171e', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$Far from being a novice, the young chess player displayed the poise of a seasoned ___.$q$, $q$[{"text":"beginner","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"spectator","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"veteran","is_correct":true},{"text":"gambler","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$veteran$q$, $q$The phrase "Far from being a novice" signals CONTRAST, so the blank needs the opposite of novice: veteran.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ef984921-7ce5-5ed3-bd0d-d7aae607de30', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$Whereas his early paintings were somber, his later works burst with ___ color.$q$, $q$[{"text":"dull","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"costly","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"faded","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"bold","is_correct":true}]$q$::jsonb, $q$bold$q$, $q$The word "Whereas" signals CONTRAST with "somber," so the blank needs a lively opposite: bold.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6478921e-31dc-531f-abbd-56362ee1b674', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$Although the report appeared exhaustive, experts noted that its analysis was strangely ___.$q$, $q$[{"text":"shallow","is_correct":true},{"text":"thorough","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"lengthy","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"tedious","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$shallow$q$, $q$The word "Although" signals CONTRAST with "exhaustive," so the blank needs the opposite: shallow.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('db6411a6-b37e-5a12-8c17-4bcdc78b8c31', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$Though touted as revolutionary, the gadget was in fact quite ___.$q$, $q$[{"text":"groundbreaking","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"ordinary","is_correct":true},{"text":"expensive","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"fragile","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$ordinary$q$, $q$The word "Though" signals CONTRAST with "revolutionary," so the blank needs the opposite: ordinary.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('759bd022-57ea-5ae2-8459-b71a922b39f3', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$Unlike her candid sister, Priya tended to be evasive and ___ about her plans.$q$, $q$[{"text":"forthright","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"cheerful","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"secretive","is_correct":true},{"text":"anxious","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$secretive$q$, $q$The word "Unlike" signals CONTRAST with "candid," so the blank matches "evasive": secretive.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('21f64222-8a38-5ff1-9a0b-6f63c9b9d023', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$The essay's argument was cogent, yet its conclusion felt oddly ___.$q$, $q$[{"text":"convincing","is_correct":false,"misconception_token":"sc-ignored-contrast"},{"text":"lengthy","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"formal","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"weak","is_correct":true}]$q$::jsonb, $q$weak$q$, $q$The word "yet" signals CONTRAST with "cogent," so the blank needs the opposite: weak.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f4395435-6897-59bd-90b5-c98300216a1a', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$Because the theory rested on flawed assumptions, its conclusions were inevitably ___.$q$, $q$[{"text":"unsound","is_correct":true},{"text":"valid","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"intricate","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"elegant","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$unsound$q$, $q$The word "Because" signals CAUSE and effect: flawed assumptions make the conclusions unsound.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('69c191b6-bb3f-5805-b859-0247ef6558a3', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$Since the manager delegated tasks so effectively, the department ran with unusual ___.$q$, $q$[{"text":"turmoil","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"ease","is_correct":true},{"text":"secrecy","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"tension","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$ease$q$, $q$The word "Since" signals CAUSE and effect: effective delegation lets the department run with ease.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('de32f0e7-59a7-5d5d-84cd-fa6b9e41163b', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$Because the audience found the lecture ___, attendance dwindled with each passing week.$q$, $q$[{"text":"captivating","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"affordable","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"tiresome","is_correct":true},{"text":"scholarly","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$tiresome$q$, $q$The word "Because" signals CAUSE and effect: a tiresome lecture makes attendance dwindle.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('96ae6ab7-9ebf-579d-9248-598f93f86388', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$Since the negotiations had reached an impasse, both sides reluctantly agreed to ___.$q$, $q$[{"text":"persist","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"rejoice","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"depart","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"yield","is_correct":true}]$q$::jsonb, $q$yield$q$, $q$The word "Since" signals CAUSE and effect: an impasse forces both sides to yield.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('f7d1740c-1996-5053-a367-298f881057b8', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$Because the soil was so ___, the farmers harvested an unusually bountiful crop.$q$, $q$[{"text":"fertile","is_correct":true},{"text":"barren","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"rocky","is_correct":false,"misconception_token":"sc-reversed-causation"},{"text":"distant","is_correct":false,"misconception_token":"sc-off-topic"}]$q$::jsonb, $q$fertile$q$, $q$The word "Because" signals CAUSE and effect: a bountiful crop means the soil must be fertile.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('90fd59be-e9e7-5173-9b25-8a1ae9547490', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$Since the medicine was administered promptly, the patient's recovery was remarkably ___.$q$, $q$[{"text":"sluggish","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"swift","is_correct":true},{"text":"painful","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"costly","is_correct":false,"misconception_token":"sc-off-topic"}]$q$::jsonb, $q$swift$q$, $q$The word "Since" signals CAUSE and effect: prompt medicine makes the recovery swift.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('35e5ea90-ee7d-5c0f-b3c1-b4aa8d0e1583', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$Since the witness's testimony was corroborated by others, the judge deemed it ___.$q$, $q$[{"text":"dubious","is_correct":false,"misconception_token":"sc-ignored-causation"},{"text":"lengthy","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"credible","is_correct":true},{"text":"hostile","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$credible$q$, $q$The word "Since" signals CAUSE and effect: corroborated testimony is judged credible.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('dd8e6fd2-3119-5a56-9886-83233b3d0fe9', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$The manuscript was replete with errors; that is, it was thoroughly ___.$q$, $q$[{"text":"polished","is_correct":false,"misconception_token":"sc-ignored-restatement"},{"text":"lengthy","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"elegant","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"flawed","is_correct":true}]$q$::jsonb, $q$flawed$q$, $q$The phrase "that is" signals RESTATEMENT of "replete with errors," so the blank matches it: flawed.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ae3519c4-c29e-527e-b633-8ca533357c86', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$Her prose was verbose; in other words, unnecessarily ___.$q$, $q$[{"text":"wordy","is_correct":true},{"text":"concise","is_correct":false,"misconception_token":"sc-ignored-restatement"},{"text":"elegant","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"factual","is_correct":false,"misconception_token":"sc-off-topic"}]$q$::jsonb, $q$wordy$q$, $q$The phrase "in other words" signals RESTATEMENT of "verbose," so the blank matches it: wordy.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('b5235535-bf4c-523c-98d5-8600df8672de', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$The old miser was notoriously parsimonious; that is, extremely ___ with money.$q$, $q$[{"text":"generous","is_correct":false,"misconception_token":"sc-ignored-restatement"},{"text":"stingy","is_correct":true},{"text":"reckless","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"anxious","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$stingy$q$, $q$The phrase "that is" signals RESTATEMENT of "parsimonious," so the blank matches it: stingy.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('6798ddbf-ec6e-5349-a48e-bffb02529cdf', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$The instructions were unequivocal; in other words, perfectly ___.$q$, $q$[{"text":"ambiguous","is_correct":false,"misconception_token":"sc-ignored-restatement"},{"text":"tedious","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"clear","is_correct":true},{"text":"forceful","is_correct":false,"misconception_token":"sc-wrong-tone"}]$q$::jsonb, $q$clear$q$, $q$The phrase "in other words" signals RESTATEMENT of "unequivocal," so the blank matches it: clear.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('e4f53d62-10c9-57be-925d-797892de54f5', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$The tycoon was ostentatious; that is, he loved to ___ his wealth.$q$, $q$[{"text":"conceal","is_correct":false,"misconception_token":"sc-ignored-restatement"},{"text":"donate","is_correct":false,"misconception_token":"sc-off-topic"},{"text":"squander","is_correct":false,"misconception_token":"sc-wrong-tone"},{"text":"flaunt","is_correct":true}]$q$::jsonb, $q$flaunt$q$, $q$The phrase "that is" signals RESTATEMENT of "ostentatious," so the blank matches showing off: flaunt.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('a30ae127-ae72-512d-bc87-2b670e47429c', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$The scholar was ___; that is, she was ___ and reluctant to boast of her many achievements.$q$, $q$[{"text":"modest . . . humble","is_correct":true},{"text":"modest . . . boastful","is_correct":false,"misconception_token":"sc-second-blank-mismatch"},{"text":"arrogant . . . humble","is_correct":false,"misconception_token":"sc-first-blank-mismatch"},{"text":"vain . . . proud","is_correct":false,"misconception_token":"sc-ignored-restatement"}]$q$::jsonb, $q$modest . . . humble$q$, $q$The phrase "that is" signals RESTATEMENT: both blanks describe someone who will not boast — modest and humble.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('d70963ae-2a13-558b-bdda-4b2b30a03512', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$The senator's public image was ___, but her private conduct proved deeply ___.$q$, $q$[{"text":"pristine . . . noble","is_correct":false,"misconception_token":"sc-second-blank-mismatch"},{"text":"pristine . . . corrupt","is_correct":true},{"text":"tainted . . . corrupt","is_correct":false,"misconception_token":"sc-first-blank-mismatch"},{"text":"flawless . . . honest","is_correct":false,"misconception_token":"sc-ignored-contrast"}]$q$::jsonb, $q$pristine . . . corrupt$q$, $q$The word "but" signals CONTRAST: a pristine public image against deeply corrupt private conduct.$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status)
values
  ('ac85bb57-471e-5933-a59f-2b633d51b7e2', null, (select id from public.skills where slug = 'prep-sentence-completion'), null, 'hard',
   $q$Because the terms were so ___, even the company's allies were ___ to sign the agreement.$q$, $q$[{"text":"onerous . . . eager","is_correct":false,"misconception_token":"sc-second-blank-mismatch"},{"text":"generous . . . reluctant","is_correct":false,"misconception_token":"sc-first-blank-mismatch"},{"text":"onerous . . . reluctant","is_correct":true},{"text":"favorable . . . unwilling","is_correct":false,"misconception_token":"sc-reversed-causation"}]$q$::jsonb, $q$onerous . . . reluctant$q$, $q$The word "Because" signals CAUSE and effect: onerous terms (cause) make even allies reluctant to sign (effect).$q$, 'published')
on conflict (id) do update set
  template_id=excluded.template_id, skill_id=excluded.skill_id, sat_alignment=excluded.sat_alignment,
  difficulty=excluded.difficulty, stem=excluded.stem, choices=excluded.choices,
  correct_answer=excluded.correct_answer, solution=excluded.solution, status=excluded.status;

commit;
