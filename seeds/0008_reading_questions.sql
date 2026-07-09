-- PathwayEd — Question Engine: curated READING questions (GENERATED).
--
-- DO NOT EDIT BY HAND — produced by scripts/build-reading-seeds.ts from the
-- curated passage pool in src/lib/readingTemplates.ts. HOW TO APPLY:
--   bun run db:seed seeds/0008_reading_questions.sql
-- Idempotent (passages upsert on a deterministic id from the passage code;
-- questions upsert on a deterministic id from code + slot). Depends on migration
-- 0007 (public.passages + generated_questions.passage_id) and 0002 (reading skills).
--
-- The reading-set model: each passage is stored ONCE and its questions link to it
-- via passage_id. 100% ORIGINAL items written to the public SAT Reading & Writing
-- format/skill spec — no real SAT or prep-company passage or item is copied or
-- paraphrased.

begin;

-- read-ebr-p01 (evidence-based-reading, information-and-ideas, 9-12) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('906d192f-e4c8-5561-bb2b-54d81126f719',
   'read-ebr-p01',
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', '9-12', null, $q$Honeybees communicate the location of food through a movement scientists call the waggle dance. The direction a bee moves during the dance points its hivemates toward the food, and the length of the dance signals how far away it is. In this way, a single scout can direct many bees to a flower patch it has found.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('5ca4ebd1-b219-55f1-aeea-0a80441899c0',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'easy',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"A bee's dance shows other bees how much food a patch contains.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"The waggle dance lets one bee tell others where food is located.","is_correct":true},{"text":"Honeybees prefer flowers that grow close to the hive.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"The waggle dance is the only way bees can ever find food.","is_correct":false,"misconception_token":"too-broad"}]$q$::jsonb, $q$The waggle dance lets one bee tell others where food is located.$q$, $q$The passage explains that the dance's direction and length tell other bees where the food is — that is its main point. It never says bees prefer nearby flowers, that the dance is the only method, or that it signals how much food there is.$q$, 'published',
   '906d192f-e4c8-5561-bb2b-54d81126f719')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-ebr-p02 (evidence-based-reading, information-and-ideas, 9-12) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('3fd21501-2cc9-5dfd-b569-ac6a15574b83',
   'read-ebr-p02',
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', '9-12', null, $q$When a city adds a protected bike lane to a busy street, the number of people who bike to work along that street usually rises within a year. Planners have found that many residents already own bicycles but avoid riding in traffic. A lane separated from cars removes the main reason they hesitate.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('929e9465-8689-5751-a2c9-60c0a9674b40',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'easy',
   $q$Which choice best states the conclusion the planners reached?$q$, $q$[{"text":"Safety concerns, more than a lack of bicycles, keep many residents from biking to work.","is_correct":true},{"text":"Protected bike lanes reduce traffic congestion for cars.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"Most residents do not own bicycles.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Cities should replace all of their car lanes with bike lanes.","is_correct":false,"misconception_token":"too-broad"}]$q$::jsonb, $q$Safety concerns, more than a lack of bicycles, keep many residents from biking to work.$q$, $q$The passage says residents already own bikes but avoid traffic, and a separated lane removes that reason — so safety, not a lack of bikes, is the barrier. It never claims most lack bikes, discusses car traffic, or calls for replacing all car lanes.$q$, 'published',
   '3fd21501-2cc9-5dfd-b569-ac6a15574b83')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-ebr-p03 (evidence-based-reading, information-and-ideas, 9-12) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('9516d664-59dc-519b-88b9-7ed54065d794',
   'read-ebr-p03',
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', '9-12', null, $q$For decades, biologists assumed that the tuatara, a reptile found only in New Zealand, was a kind of lizard. Recent genetic studies, however, show that the tuatara belongs to a separate branch of reptiles whose other members died out long ago. The animal is therefore not a lizard but the last survivor of an ancient lineage.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('8d4616ee-17d8-579a-9ee0-d95c131f9079',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'easy',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"Biologists have always known that the tuatara was not a lizard.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"New genetic evidence shows the tuatara is not a lizard but the sole survivor of an ancient reptile group.","is_correct":true},{"text":"Genetic studies are the only valid way to classify any reptile.","is_correct":false,"misconception_token":"too-broad"},{"text":"The tuatara is the most common reptile in New Zealand.","is_correct":false,"misconception_token":"plausible-but-unstated"}]$q$::jsonb, $q$New genetic evidence shows the tuatara is not a lizard but the sole survivor of an ancient reptile group.$q$, $q$The passage's point is that genetic evidence reclassifies the tuatara as the last of an ancient line, not a lizard. It doesn't say the tuatara is the most common reptile, that biologists always knew this (they assumed the opposite), or that genetics is the only classification method.$q$, 'published',
   '9516d664-59dc-519b-88b9-7ed54065d794')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('ffa51dce-367e-56fb-bba9-8d8b6f4021c8',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'medium',
   $q$Which statement, if true, would most strengthen the conclusion that the tuatara is not a lizard?$q$, $q$[{"text":"The tuatara's genes differ from those of all living lizards as much as lizards' genes differ from snakes'.","is_correct":true},{"text":"The tuatara lives only in New Zealand and nowhere else on Earth.","is_correct":false,"misconception_token":"wrong-evidence"},{"text":"The tuatara can live for more than a century.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"The tuatara closely resembles some lizards in its overall body shape.","is_correct":false,"misconception_token":"reverses-relationship"}]$q$::jsonb, $q$The tuatara's genes differ from those of all living lizards as much as lizards' genes differ from snakes'.$q$, $q$A genetic gap as large as the one between different reptile groups directly supports the claim that the tuatara is not a lizard. Its location and lifespan are irrelevant to classification, and resembling lizards in body shape would point the other way.$q$, 'published',
   '9516d664-59dc-519b-88b9-7ed54065d794')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-ebr-p04 (evidence-based-reading, information-and-ideas, 9-12) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('ebbb3195-8984-540f-b58a-6f307cf47f40',
   'read-ebr-p04',
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', '9-12', null, $q$Mara had rehearsed her lines for weeks, but as she stepped onto the stage the bright lights erased every word from her mind. For a moment she stood frozen. Then she looked out, found her younger brother grinning in the front row, and the opening line came back to her as easily as breathing.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('ee51cb12-58e5-5971-9873-6b539817a323',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'easy',
   $q$Which choice best describes what helps Mara recover?$q$, $q$[{"text":"She decides to make up new lines instead of the ones she rehearsed.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Her brother calls out the opening line to remind her of it.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"The stage lights dim so that she can finally see the audience.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"Seeing a familiar, encouraging face calms her enough to remember her line.","is_correct":true}]$q$::jsonb, $q$Seeing a familiar, encouraging face calms her enough to remember her line.$q$, $q$The rehearsed line returns the moment she sees her brother's encouraging grin, so a familiar face steadies her. She doesn't invent new lines, the lights don't change, and her brother only grins — he doesn't feed her the line.$q$, 'published',
   'ebbb3195-8984-540f-b58a-6f307cf47f40')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-ebr-p05 (evidence-based-reading, information-and-ideas, 9-12) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('974f2ace-fd2e-55c4-b183-bb68ae79fb8f',
   'read-ebr-p05',
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', '9-12', null, $q$Sea otters eat large numbers of sea urchins. Where otters are plentiful, urchin populations stay low, and the kelp forests that urchins feed on grow thick and tall. Where otters have disappeared, urchins multiply and strip the kelp bare, leaving barren stretches of seafloor.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('9a9cf70c-4fb7-5d1e-8260-63fa9eb9dceb',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'easy',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"Sea otters prefer kelp forests to every other habitat.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"Kelp forests survive by feeding on the local sea urchins.","is_correct":false,"misconception_token":"reverses-relationship"},{"text":"Kelp forests grow best in places where sea otters have disappeared.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"By keeping urchins in check, sea otters help kelp forests thrive.","is_correct":true}]$q$::jsonb, $q$By keeping urchins in check, sea otters help kelp forests thrive.$q$, $q$The passage shows that otters eating urchins keeps urchin numbers down so kelp can thrive — otters protect the kelp indirectly. Kelp does worse without otters, urchins eat kelp (not the reverse), and the passage never says otters prefer kelp habitats.$q$, 'published',
   '974f2ace-fd2e-55c4-b183-bb68ae79fb8f')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-ebr-p06 (evidence-based-reading, information-and-ideas, 9-12) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('984fe3e0-708d-558d-b63d-1633c797a9b8',
   'read-ebr-p06',
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', '9-12', null, $q$In the 1850s, many American towns had no public libraries; books were expensive and mostly owned by the wealthy. Reformers argued that a democracy depended on an informed public, and that ordinary citizens could not govern wisely without access to books. Free town libraries, they insisted, were not a luxury but a civic necessity.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('47da8a3e-65ae-5660-babf-fa6b8a00b6cd',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'easy',
   $q$Which choice best states the reformers' main argument?$q$, $q$[{"text":"The reformers cared more about helping the wealthy than ordinary citizens.","is_correct":false,"misconception_token":"reverses-relationship"},{"text":"Books in the 1850s were cheap and already widely owned.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Free public libraries are essential to a functioning democracy, not a mere luxury.","is_correct":true},{"text":"Public libraries mainly helped towns attract new businesses.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$Free public libraries are essential to a functioning democracy, not a mere luxury.$q$, $q$The reformers held that libraries were a civic necessity for democracy. The passage says books were expensive (not cheap), that reformers championed ordinary citizens (not the wealthy), and never mentions attracting businesses.$q$, 'published',
   '984fe3e0-708d-558d-b63d-1633c797a9b8')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('e5d31f57-5449-5965-ba76-a02f3e6aff01',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'easy',
   $q$According to the text, why did few ordinary citizens own books in the 1850s?$q$, $q$[{"text":"Books were treated as a civic necessity.","is_correct":false,"misconception_token":"partly-right"},{"text":"Most towns had banned the sale of books.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"Books were expensive and were held mostly by wealthy people.","is_correct":true},{"text":"Reformers actively discouraged citizens from reading.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$Books were expensive and were held mostly by wealthy people.$q$, $q$The text states books were expensive and owned mainly by the wealthy. No ban is mentioned, reformers encouraged reading, and 'civic necessity' describes the reformers' view of libraries — not the reason books were scarce.$q$, 'published',
   '984fe3e0-708d-558d-b63d-1633c797a9b8')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-ebr-p07 (evidence-based-reading, information-and-ideas, 9-12) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('7d085716-e3ba-5e9f-99e0-1ee104b60c43',
   'read-ebr-p07',
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', '9-12', null, $q$Some desert plants open the tiny pores in their leaves only at night. During the cool darkness, they take in the carbon dioxide they need and store it until morning. By keeping their pores closed through the hot day, these plants lose far less water than plants that open their pores in sunlight.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('b74bf5cd-3b6d-5d33-9f19-746e5366e7a0',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'easy',
   $q$Which choice best explains why opening pores at night helps these desert plants?$q$, $q$[{"text":"Cooler nighttime air means the plants lose less water while taking in carbon dioxide.","is_correct":true},{"text":"Plants can absorb carbon dioxide only in complete darkness.","is_correct":false,"misconception_token":"too-broad"},{"text":"Keeping the pores closed lets the plants take in more sunlight.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"The night air holds richer carbon dioxide than the day's air does.","is_correct":false,"misconception_token":"plausible-but-unstated"}]$q$::jsonb, $q$Cooler nighttime air means the plants lose less water while taking in carbon dioxide.$q$, $q$The passage links night pores to losing 'far less water' in the cool dark. It doesn't claim CO2 can be absorbed only at night (other plants use daylight), that night air is richer in CO2, or that closed pores gather sunlight.$q$, 'published',
   '7d085716-e3ba-5e9f-99e0-1ee104b60c43')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-ebr-p08 (evidence-based-reading, information-and-ideas, 9-12) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('a1b14c39-e72c-5056-ba01-82874f871309',
   'read-ebr-p08',
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', '9-12', null, $q$Economists once assumed that people always make choices that maximize their own benefit. Later experiments told a more complicated story: participants often rejected unfair offers even when doing so cost them money, apparently valuing fairness over pure gain. These results suggested that human decisions are shaped by more than self-interest alone.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('bab50b8c-e0e3-57fb-931a-404758c1a5d1',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'medium',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"People always act to maximize their own benefit.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Economists no longer study human decision-making at all.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"Experiments revealed that people weigh fairness, not just personal gain, when making decisions.","is_correct":true},{"text":"Participants in the experiments earned more money than they had expected.","is_correct":false,"misconception_token":"plausible-but-unstated"}]$q$::jsonb, $q$Experiments revealed that people weigh fairness, not just personal gain, when making decisions.$q$, $q$The passage's point is that fairness, not just self-interest, shapes decisions. The first wrong choice restates the assumption the experiments overturned; the others are never stated.$q$, 'published',
   'a1b14c39-e72c-5056-ba01-82874f871309')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-ebr-p09 (evidence-based-reading, information-and-ideas, 9-12) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('ffed7ea3-4db4-5046-b8bc-4651bd24dcad',
   'read-ebr-p09',
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', '9-12', null, $q$A team studying a remote lake found that its water had grown clearer over ten years. At first they credited stricter pollution limits. But they also noticed the arrival of an invasive mussel that filters algae from the water as it feeds. The researchers concluded that the mussels, not the new regulations, were the main cause of the change.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('731248c8-9623-5fbc-95f3-86f2a75b468d',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'medium',
   $q$Which choice best states the researchers' conclusion?$q$, $q$[{"text":"The invasive mussel made the lake's water more polluted.","is_correct":false,"misconception_token":"reverses-relationship"},{"text":"Stricter pollution limits were the main reason the lake grew clearer.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"An invasive mussel, rather than pollution limits, was chiefly responsible for the clearer water.","is_correct":true},{"text":"Invasive species are always harmful to the lakes they enter.","is_correct":false,"misconception_token":"too-broad"}]$q$::jsonb, $q$An invasive mussel, rather than pollution limits, was chiefly responsible for the clearer water.$q$, $q$The researchers concluded the mussel, not regulation, mainly caused the clearing. The passage rules out regulation as the main cause, says the mussel filtered (cleared) algae rather than polluting, and never claims all invasive species are harmful.$q$, 'published',
   'ffed7ea3-4db4-5046-b8bc-4651bd24dcad')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('56cba3ab-6ab1-587e-8771-b0d755725d99',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'medium',
   $q$Which finding, if true, would most support the researchers' conclusion?$q$, $q$[{"text":"The invasive mussel is originally native to another continent.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"The lake's water became a little clearer in each of the ten years.","is_correct":false,"misconception_token":"wrong-evidence"},{"text":"Most people had expected the pollution limits to work.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"In a nearby lake with the same pollution limits but no mussels, the water stayed cloudy.","is_correct":true}]$q$::jsonb, $q$In a nearby lake with the same pollution limits but no mussels, the water stayed cloudy.$q$, $q$A comparison lake with the same limits but no mussels staying cloudy isolates the mussel as the cause — strong support. That the water cleared each year shows the effect but not its cause; the mussel's origin and people's expectations are irrelevant.$q$, 'published',
   'ffed7ea3-4db4-5046-b8bc-4651bd24dcad')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-ebr-p10 (evidence-based-reading, information-and-ideas, 9-12) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('c6ba3969-0b4d-56fa-a221-2743fec588f2',
   'read-ebr-p10',
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', '9-12', null, $q$Grandfather rarely spoke about the years he spent at sea. But every so often, setting down his tea, he would describe a particular harbor at dusk — the smell of salt, the creak of the ropes — with such precision that the kitchen seemed to fall away. Then he would fall silent again, as if he had said too much.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('b1ac1590-fb43-52b4-89fb-00742dce02c7',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'medium',
   $q$Which choice best describes what the passage suggests about the grandfather?$q$, $q$[{"text":"He has forgotten most of the years he spent at sea.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"His memories of the sea remain vivid and moving, even though he seldom shares them.","is_correct":true},{"text":"He wishes he had never gone to sea in the first place.","is_correct":false,"misconception_token":"unsupported-inference"},{"text":"He avoids talking about the sea because the memories bore him.","is_correct":false,"misconception_token":"misreads-tone"}]$q$::jsonb, $q$His memories of the sea remain vivid and moving, even though he seldom shares them.$q$, $q$The vivid, precise memory and his sudden silence 'as if he had said too much' suggest the memories still move him deeply. He hasn't forgotten them, he isn't bored, and the passage never says he regrets going.$q$, 'published',
   'c6ba3969-0b4d-56fa-a221-2743fec588f2')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-ebr-p11 (evidence-based-reading, information-and-ideas, 9-12) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('77f67eb7-d004-5626-bfcd-d240fd20a5fc',
   'read-ebr-p11',
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', '9-12', null, $q$Engineers designing quieter aircraft have borrowed an idea from owls, whose feathers have a soft, frayed edge that breaks up the rushing air and muffles sound. By adding a similar jagged trailing edge to airplane wings and wind-turbine blades, designers have measurably reduced the noise these machines make.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('d6248a24-708f-5d3b-80ca-e6b9f86ed043',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'medium',
   $q$Which choice most logically completes the text's explanation of the design?$q$, $q$[{"text":"smooth wing edges reduce noise better than frayed ones do.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"the new design makes the machines fly noticeably faster than before.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"the jagged edge quiets the machines by disrupting the airflow that would otherwise create noise.","is_correct":true},{"text":"owls are the quietest of all flying animals.","is_correct":false,"misconception_token":"plausible-but-unstated"}]$q$::jsonb, $q$the jagged edge quiets the machines by disrupting the airflow that would otherwise create noise.$q$, $q$The passage says owl feathers' frayed edges 'break up the rushing air' to muffle sound, and the wing copies that — so the jagged edge quiets noise by disrupting airflow. Speed isn't mentioned, owls aren't ranked against other animals, and frayed (not smooth) edges reduce the noise.$q$, 'published',
   '77f67eb7-d004-5626-bfcd-d240fd20a5fc')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-ebr-p12 (evidence-based-reading, information-and-ideas, 9-12) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('7a8f6cbb-972d-59fd-be4b-bc91f18cdfc8',
   'read-ebr-p12',
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', '9-12', null, $q$The mayor's plan to close the old riverside factory district and build a park has been called a gift to the city. Yet the plan sets aside no money to retrain the four hundred workers the factories employ. A park that residents cannot afford to enjoy, because they have lost their jobs, is a hollow kind of gift.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('0f33fba7-601b-5753-8d87-197de25c4af0',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'medium',
   $q$Which choice best states the author's main point?$q$, $q$[{"text":"Riverside parks are more valuable than factories.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"The city does not need any new parks at all.","is_correct":false,"misconception_token":"too-broad"},{"text":"The mayor's plan will clearly succeed in helping the city's workers.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"The park plan is flawed because it ignores the workers who would lose their jobs.","is_correct":true}]$q$::jsonb, $q$The park plan is flawed because it ignores the workers who would lose their jobs.$q$, $q$The author calls the park a 'hollow gift' precisely because it ignores the four hundred workers — that is the main point. The author doesn't reject parks in general, doesn't say the plan helps workers (the opposite), and doesn't compare the value of parks and factories.$q$, 'published',
   '7a8f6cbb-972d-59fd-be4b-bc91f18cdfc8')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('f49e736b-6210-5d91-a1cf-f3459233c7e7',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'hard',
   $q$As it is used in the text, the phrase 'a hollow kind of gift' primarily serves to$q$, $q$[{"text":"underscore that the plan's benefits are undercut by what it overlooks.","is_correct":true},{"text":"suggest that the finished park will be physically empty and unused.","is_correct":false,"misconception_token":"wrong-word-meaning"},{"text":"propose a specific alternative to building the park.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"praise the mayor for a generous and well-designed plan.","is_correct":false,"misconception_token":"misreads-tone"}]$q$::jsonb, $q$underscore that the plan's benefits are undercut by what it overlooks.$q$, $q$'Hollow gift' turns the praise ('a gift') against itself, stressing that ignoring the workers empties the plan of real value. It isn't praise, doesn't mean the park is literally empty, and offers no alternative.$q$, 'published',
   '7a8f6cbb-972d-59fd-be4b-bc91f18cdfc8')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-ebr-p13 (evidence-based-reading, information-and-ideas, 9-12) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('2950a621-2b83-5cdf-ba24-76a3ecbd9d6b',
   'read-ebr-p13',
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', '9-12', null, $q$Certain cave-dwelling fish have, over many generations, lost their eyes entirely. Biologists once viewed this simply as decay from disuse. A newer view holds that building and maintaining eyes costs energy, and in a lightless cave where eyes are useless, fish that spent less energy on them may have survived and reproduced more successfully. Eyelessness, in this view, was not merely lost but favored.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('58bad1b7-ec78-587d-b763-8bdf135fdc3f',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'hard',
   $q$Which choice best captures the distinction the passage draws between the two views?$q$, $q$[{"text":"The newer view holds that the fish will eventually regrow their eyes.","is_correct":false,"misconception_token":"unsupported-inference"},{"text":"The older view claimed that eyes cost too much energy to maintain.","is_correct":false,"misconception_token":"partly-right"},{"text":"Both views agree that losing their eyes harmed the cave fish.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"The older view saw eye loss as passive decay; the newer view sees it as an advantage that was actively favored.","is_correct":true}]$q$::jsonb, $q$The older view saw eye loss as passive decay; the newer view sees it as an advantage that was actively favored.$q$, $q$The contrast is between eye loss as passive decay (older) and as an energy-saving advantage that was favored (newer). The newer view says the loss helped (not harmed), says nothing about regrowing eyes, and it is the newer view — not the older — that stresses energy cost.$q$, 'published',
   '2950a621-2b83-5cdf-ba24-76a3ecbd9d6b')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-ebr-p14 (evidence-based-reading, information-and-ideas, 9-12) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('f8c580c0-56f8-505f-ad04-86ca3f310cf8',
   'read-ebr-p14',
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', '9-12', null, $q$A study tracked whether posting calorie counts on menus changed what diners ordered. On average, the labels made little difference to the meals people chose. But the researchers cautioned against dismissing labels entirely: among diners who said they were actively trying to eat healthily, the counts did shift orders toward lower-calorie dishes. The effect, they argued, depended on the diner.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('d988ef0e-7ee7-5d18-853d-c10a4c3677a0',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'hard',
   $q$Which finding, if true, would most support the researchers' caution against dismissing menu labels?$q$, $q$[{"text":"Diners who were already motivated to eat healthily ordered fewer calories when counts were shown.","is_correct":true},{"text":"On average, diners ignored the calorie counts entirely.","is_correct":false,"misconception_token":"reverses-relationship"},{"text":"The calorie counts were printed in large, easy-to-read type.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"Most of the restaurants in the study already posted calorie counts.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$Diners who were already motivated to eat healthily ordered fewer calories when counts were shown.$q$, $q$The researchers' caution rests on the labels working for motivated diners, so evidence of that effect supports them. The average non-effect supports the opposite view, and the number of restaurants or the type size is irrelevant.$q$, 'published',
   'f8c580c0-56f8-505f-ad04-86ca3f310cf8')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('3b54933f-51ec-5f84-9d4f-60bcf921736e',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'hard',
   $q$Which choice most logically follows from the study's findings?$q$, $q$[{"text":"Menu labels change the behavior of nearly all diners.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Removing calorie counts would help people eat more healthily.","is_correct":false,"misconception_token":"reverses-relationship"},{"text":"Whether menu labels change behavior depends largely on a diner's existing goals.","is_correct":true},{"text":"Calorie labels are the single most effective public-health tool available.","is_correct":false,"misconception_token":"too-broad"}]$q$::jsonb, $q$Whether menu labels change behavior depends largely on a diner's existing goals.$q$, $q$The split result — little average effect but a real effect for motivated diners — points to behavior depending on the diner's goals. Labels don't move nearly all diners, removing them wouldn't help health, and the passage never ranks labels against other tools.$q$, 'published',
   'f8c580c0-56f8-505f-ad04-86ca3f310cf8')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-ebr-p15 (evidence-based-reading, information-and-ideas, 9-12) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('25b925de-51fe-5a41-991e-3a43c0d0ddf6',
   'read-ebr-p15',
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', '9-12', null, $q$Writing in 1791, a pamphleteer urged the new republic to fund public schools. An educated citizenry, she argued, was the surest defense against tyranny: rulers found it far harder to deceive people who could read the laws and the history of their own country. To leave the poor unschooled, she warned, was to leave the whole nation vulnerable.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('c2d36629-9fdb-5b25-8463-9be057ff50e8',
   null,
   (select id from public.skills where slug = 'evidence-based-reading'),
   'information-and-ideas', 'medium',
   $q$Which choice best states the pamphleteer's central claim?$q$, $q$[{"text":"Public education protects a republic by making its citizens harder to deceive.","is_correct":true},{"text":"Reading history matters more than reading the law.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"Tyranny is impossible in any republic that has a constitution.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"Only wealthy citizens can be trusted to govern a republic.","is_correct":false,"misconception_token":"reverses-relationship"}]$q$::jsonb, $q$Public education protects a republic by making its citizens harder to deceive.$q$, $q$Her claim is that an educated public guards against tyranny because informed citizens are harder to deceive. She champions schooling the poor (not distrusting them), ranks neither kind of reading over the other, and never says a constitution makes tyranny impossible.$q$, 'published',
   '25b925de-51fe-5a41-991e-3a43c0d0ddf6')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-mi-p01 (main-idea, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('95d6f454-3f4b-521f-91f6-fa644ad508f5',
   'read-mi-p01',
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', '3-5', null, $q$Ants are small, but they are very strong. A single ant can lift a crumb many times heavier than its own body. Working together, a group of ants can carry food much bigger than any one of them.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('15fb10f6-5e87-5047-a8b3-ac8cfb29263a',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'easy',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"Ants cannot move food that is bigger than they are.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Ants are strong for their size and can carry heavy things, especially together.","is_correct":true},{"text":"Ants are the smallest insects in the whole world.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"One ant once found a very large crumb.","is_correct":false,"misconception_token":"detail-not-main-idea"}]$q$::jsonb, $q$Ants are strong for their size and can carry heavy things, especially together.$q$, $q$The passage is mostly about how strong ants are for their size and how they carry heavy food together. The other choices are not stated, focus on a small detail, or say the opposite of the passage.$q$, 'published',
   '95d6f454-3f4b-521f-91f6-fa644ad508f5')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-mi-p02 (main-idea, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('84486513-0918-5610-92d5-fb9dfd6a46da',
   'read-mi-p02',
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', '3-5', null, $q$Maria wanted to grow tomatoes. She planted seeds in a sunny spot and watered them every day. She pulled out the weeds so they would not crowd her plants. After many weeks, red tomatoes finally appeared.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('f9b51cfc-80dc-5896-9588-b683de3aeeb8',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'easy',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"Maria took care of her plants over time, and they grew tomatoes.","is_correct":true},{"text":"Maria watered her seeds only one time.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Weeds are the biggest problem for every garden.","is_correct":false,"misconception_token":"too-broad"},{"text":"Tomatoes turn red when they are ready.","is_correct":false,"misconception_token":"detail-not-main-idea"}]$q$::jsonb, $q$Maria took care of her plants over time, and they grew tomatoes.$q$, $q$The passage tells how Maria cared for her plants until they grew tomatoes. It doesn't say weeds are every garden's biggest problem, she watered daily (not once), and the color of ripe tomatoes is just a small detail.$q$, 'published',
   '84486513-0918-5610-92d5-fb9dfd6a46da')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-mi-p03 (main-idea, information-and-ideas, 3-5) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('a206db02-801c-54fe-8a1c-88fc84d4700d',
   'read-mi-p03',
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', '3-5', null, $q$Bats are not birds, even though they can fly. Bats have fur, not feathers, and they feed milk to their babies, just like other mammals. They are the only mammals that can truly fly.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('962d27e3-b902-5524-9498-d2458e6f060c',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'easy',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"All mammals are able to fly.","is_correct":false,"misconception_token":"too-broad"},{"text":"Bats are flying mammals, not birds.","is_correct":true},{"text":"Bat babies drink milk.","is_correct":false,"misconception_token":"detail-not-main-idea"},{"text":"Bats are a kind of bird that happens to have fur.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$Bats are flying mammals, not birds.$q$, $q$The main point is that bats are mammals that fly, not birds. The passage says they are not birds, that only bats among mammals fly (not all mammals), and the milk detail supports the point but is not the main idea.$q$, 'published',
   'a206db02-801c-54fe-8a1c-88fc84d4700d')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('0ece7629-564f-5f27-b1a5-fffbadd68b55',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'medium',
   $q$Which detail from the passage best shows that bats are mammals?$q$, $q$[{"text":"Bats have fur and feed milk to their babies.","is_correct":true},{"text":"Bats can fly through the air.","is_correct":false,"misconception_token":"wrong-evidence"},{"text":"Bats are not birds.","is_correct":false,"misconception_token":"partly-right"},{"text":"Bats come out at night.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$Bats have fur and feed milk to their babies.$q$, $q$Having fur and feeding milk are mammal traits, so that detail supports the point. Flying doesn't prove it (birds fly too), 'not birds' is the claim rather than the evidence for it, and coming out at night isn't in the passage.$q$, 'published',
   'a206db02-801c-54fe-8a1c-88fc84d4700d')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-mi-p04 (main-idea, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('975efc5c-cf05-59fe-a6c6-90491aa87b03',
   'read-mi-p04',
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', '3-5', null, $q$The school held a book fair to raise money for the library. Students brought coins and bought used books for a dollar each. By the end of the week, the fair had earned enough to buy ten new books for the library.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('1e5cb2fa-b7f3-5bde-9f7a-55849731f7f7',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'easy',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"Used books always cost exactly one dollar.","is_correct":false,"misconception_token":"too-broad"},{"text":"Students enjoy collecting coins.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"The library had only ten books in all.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"A school book fair raised money to buy new library books.","is_correct":true}]$q$::jsonb, $q$A school book fair raised money to buy new library books.$q$, $q$The passage is about the book fair raising money for new library books. A dollar was the fair's price (not always), ten was how many new books were bought, and 'students enjoy coins' isn't in the passage.$q$, 'published',
   '975efc5c-cf05-59fe-a6c6-90491aa87b03')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-mi-p05 (main-idea, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('b66ec796-afc2-5265-bb97-fe3bcddc9304',
   'read-mi-p05',
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', '3-5', null, $q$Penguins live where it is very cold. To stay warm, they huddle close together in large groups. The penguins on the outside slowly move to the middle, and the ones in the middle move out, so everyone gets a turn in the warm center.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('7e75509c-5313-5975-ac57-3a1c12267fb7',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'easy',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"The center of the huddle is the warmest spot.","is_correct":false,"misconception_token":"detail-not-main-idea"},{"text":"Penguins never move once they start to huddle.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Penguins are the only animals that live in cold places.","is_correct":false,"misconception_token":"too-broad"},{"text":"Penguins huddle together and take turns in the middle to stay warm.","is_correct":true}]$q$::jsonb, $q$Penguins huddle together and take turns in the middle to stay warm.$q$, $q$The passage explains how penguins share warmth by huddling and taking turns. They are not the only cold-weather animals, they do move (taking turns), and the warm center is a detail that supports the main idea.$q$, 'published',
   'b66ec796-afc2-5265-bb97-fe3bcddc9304')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-mi-p06 (main-idea, information-and-ideas, 3-5) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('ea993fee-c70d-54ea-ac24-23ce6db3b41a',
   'read-mi-p06',
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', '3-5', null, $q$Long ago, people told time by looking at the sun. When the sun was high in the sky, they knew it was the middle of the day. But on cloudy days, and at night, the sun could not help them. That is one reason people invented clocks.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('2dbe14c8-f1ba-5603-a8f4-deedce6d4ab5',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'medium',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"People long ago did not care about time at all.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"The sun is always the best way to tell time.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"People invented clocks partly because the sun could not always tell them the time.","is_correct":true},{"text":"Clocks were invented at night.","is_correct":false,"misconception_token":"partly-right"}]$q$::jsonb, $q$People invented clocks partly because the sun could not always tell them the time.$q$, $q$The passage explains that because the sun failed on cloudy days and at night, people made clocks. The sun isn't always best, people did track time, and 'at night' names a problem with the sun, not when clocks were invented.$q$, 'published',
   'ea993fee-c70d-54ea-ac24-23ce6db3b41a')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('ce188600-69fb-51ef-b8e3-6868c3841165',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'easy',
   $q$According to the passage, when could the sun NOT help people tell time?$q$, $q$[{"text":"When they were already using a clock.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"When the sun was high in the sky.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"On cloudy days and at night.","is_correct":true},{"text":"Only during the winter.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$On cloudy days and at night.$q$, $q$The passage says the sun could not help on cloudy days and at night. A high sun was when it DID help, winter is never mentioned, and clocks are not given as a reason the sun failed.$q$, 'published',
   'ea993fee-c70d-54ea-ac24-23ce6db3b41a')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-mi-p07 (main-idea, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('b9f986e8-0089-5822-9d3b-0676b0960526',
   'read-mi-p07',
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', '3-5', null, $q$Honey never goes bad. Jars of honey found in very old tombs were still good to eat after thousands of years. Bees make honey in a special way that keeps tiny germs from growing in it.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('d21e033b-c5d2-5e37-8b9b-9a1d6a616760',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'easy',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"Honey can last a very long time without spoiling.","is_correct":true},{"text":"All foods last forever if you keep them in a tomb.","is_correct":false,"misconception_token":"too-broad"},{"text":"Bees like to eat honey when it is old.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"Honey was once found in a single old tomb.","is_correct":false,"misconception_token":"detail-not-main-idea"}]$q$::jsonb, $q$Honey can last a very long time without spoiling.$q$, $q$The passage is about how honey lasts without spoiling. Not all foods last forever, the tomb example is a supporting detail, and bees eating old honey is never mentioned.$q$, 'published',
   'b9f986e8-0089-5822-9d3b-0676b0960526')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-mi-p08 (main-idea, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('551df8cf-dfde-57ba-abbd-80dbc5b6ef69',
   'read-mi-p08',
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', '3-5', null, $q$Deon was nervous about the swim race. His hands shook as he stood on the block. But when the whistle blew, he dove in and swam as hard as he could. He did not win, but he beat his own best time, and that made him proud.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('c70a096f-f1fb-52bc-882a-18dc3b73f662',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'medium',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"Deon won first place in the swim race.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Winning is the only reason anyone should feel proud.","is_correct":false,"misconception_token":"too-broad"},{"text":"Deon was nervous but tried his best and was proud of improving.","is_correct":true},{"text":"Deon's hands shook before the race.","is_correct":false,"misconception_token":"detail-not-main-idea"}]$q$::jsonb, $q$Deon was nervous but tried his best and was proud of improving.$q$, $q$The passage is about Deon facing his nerves, doing his best, and feeling proud of beating his own time. He did not win, the passage does not say winning is the only source of pride, and his shaking hands are a small detail.$q$, 'published',
   '551df8cf-dfde-57ba-abbd-80dbc5b6ef69')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-mi-p09 (main-idea, information-and-ideas, 3-5) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('d1d8de80-5ed1-5275-920b-5afb1c6f5814',
   'read-mi-p09',
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', '3-5', null, $q$Sea turtles lay their eggs on sandy beaches. When the baby turtles hatch, they crawl toward the brightest light, which is usually the moon shining on the ocean. This helps them find their way to the water. But bright lights from buildings can confuse them and send them the wrong way.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('57a2d659-f10f-5f51-ade7-d0b147961c69',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'medium',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"The moon is brighter than the ocean is deep.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"Sea turtles cannot see any light at all.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Baby sea turtles use light to find the ocean, but city lights can lead them the wrong way.","is_correct":true},{"text":"Baby turtles hatch out of eggs.","is_correct":false,"misconception_token":"detail-not-main-idea"}]$q$::jsonb, $q$Baby sea turtles use light to find the ocean, but city lights can lead them the wrong way.$q$, $q$The passage explains that hatchlings follow the brightest light to the sea and that building lights can misdirect them. They do use light, the moon and ocean are not compared, and hatching from eggs is a supporting detail.$q$, 'published',
   'd1d8de80-5ed1-5275-920b-5afb1c6f5814')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('9108014c-c39d-5dc4-a792-f2da3b7e3504',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'medium',
   $q$Based on the passage, why might turning off beach lights at night help baby turtles?$q$, $q$[{"text":"Darkness would make the turtles grow faster.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"The turtles would then lay many more eggs.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"The turtles would crawl away from the water.","is_correct":false,"misconception_token":"reverses-relationship"},{"text":"Without bright building lights, the turtles are more likely to head toward the moonlit ocean.","is_correct":true}]$q$::jsonb, $q$Without bright building lights, the turtles are more likely to head toward the moonlit ocean.$q$, $q$If building lights are off, the brightest light is again the moon on the ocean, guiding turtles the right way. Egg-laying and growth are not discussed, and turning off lights would lead them toward the water, not away.$q$, 'published',
   'd1d8de80-5ed1-5275-920b-5afb1c6f5814')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-mi-p10 (main-idea, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('6f0e124c-bec2-5171-ac45-9e2a2fc17c60',
   'read-mi-p10',
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', '3-5', null, $q$Recycling helps our planet. When we recycle paper, cans, and bottles, they can be made into new things instead of being thrown away. This saves materials and keeps trash out of the ground.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('184d7798-5457-50f3-8739-9e4945c4262b',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'medium',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"Paper is the only thing that can ever be recycled.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Recycling turns used items into new ones and helps the planet.","is_correct":true},{"text":"Trash can end up in the ground.","is_correct":false,"misconception_token":"detail-not-main-idea"},{"text":"Everyone in the world recycles every single day.","is_correct":false,"misconception_token":"plausible-but-unstated"}]$q$::jsonb, $q$Recycling turns used items into new ones and helps the planet.$q$, $q$The passage is about how recycling reuses materials and helps the planet. Cans and bottles are recycled too, no one is said to recycle daily, and trash in the ground is a detail rather than the main point.$q$, 'published',
   '6f0e124c-bec2-5171-ac45-9e2a2fc17c60')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-mi-p11 (main-idea, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('efdd338c-c13f-5ff5-9e6a-2eb3e29199ea',
   'read-mi-p11',
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', '3-5', null, $q$A chameleon can change the color of its skin. Sometimes it changes color to match a leaf or branch so that it is hard to see. Other times it changes color to show how it feels or to warm up in the sun.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('d6757d3f-9049-59e7-a108-13c7c44f4217',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'medium',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"A chameleon once sat on a branch.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"Chameleons change color only to hide from danger.","is_correct":false,"misconception_token":"too-narrow"},{"text":"Chameleons change color for more than one reason.","is_correct":true},{"text":"Chameleons are always the color green.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$Chameleons change color for more than one reason.$q$, $q$The passage lists several reasons chameleons change color, so the main idea is that they do it for more than one reason. Hiding is only one reason, they are not always green, and no chameleon sitting on a branch is described.$q$, 'published',
   'efdd338c-c13f-5ff5-9e6a-2eb3e29199ea')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-mi-p12 (main-idea, information-and-ideas, 3-5) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('cb874667-a642-5ba4-911f-55e7eb9f129d',
   'read-mi-p12',
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', '3-5', null, $q$Volcanoes can be dangerous, but they also help the land. When a volcano erupts, it spreads ash over the ground. Over time, this ash breaks down and makes the soil rich, so plants grow well near volcanoes.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('f8215d76-6e83-5bd4-a23d-70ddf4f1d908',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'medium',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"Ash spreads over the ground after an eruption.","is_correct":false,"misconception_token":"detail-not-main-idea"},{"text":"Volcanoes are only dangerous and are never helpful.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Plants cannot grow anywhere except right next to volcanoes.","is_correct":false,"misconception_token":"too-broad"},{"text":"Even though volcanoes are dangerous, their ash can make soil good for plants.","is_correct":true}]$q$::jsonb, $q$Even though volcanoes are dangerous, their ash can make soil good for plants.$q$, $q$The passage balances the danger of volcanoes with how their ash enriches soil. It does not say volcanoes are only dangerous or that plants grow only near volcanoes, and "ash spreads" is a detail that leads to the main idea.$q$, 'published',
   'cb874667-a642-5ba4-911f-55e7eb9f129d')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('12e55877-c013-5d3b-9de4-b5481c003343',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'hard',
   $q$Which of these would be the best title for the passage?$q$, $q$[{"text":"How Volcanoes Can Help Plants Grow","is_correct":true},{"text":"Everything About Rocks and Mountains","is_correct":false,"misconception_token":"too-broad"},{"text":"Why Volcanic Ash Is Gray","is_correct":false,"misconception_token":"out-of-scope"},{"text":"All About How Dangerous Volcanoes Are","is_correct":false,"misconception_token":"too-narrow"}]$q$::jsonb, $q$How Volcanoes Can Help Plants Grow$q$, $q$The passage is about volcanoes helping plants through their ash, so that title fits best. A title only about danger leaves out the helpful main point (too narrow), 'rocks and mountains' is far too general, and ash's color is never discussed.$q$, 'published',
   'cb874667-a642-5ba4-911f-55e7eb9f129d')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-mi-p13 (main-idea, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('507affae-c2cd-5950-baa0-a0c1d4e9b0e5',
   'read-mi-p13',
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', '3-5', null, $q$Owls are good night hunters. Their large eyes help them see in very little light. Their soft feathers let them fly almost silently, so mice and other small animals do not hear them coming.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('bca9167d-d5ef-58db-982f-c80dba9094a6',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'hard',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"Owls do their hunting during the day.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Mice are the smartest of all animals.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"Owls have very large eyes.","is_correct":false,"misconception_token":"detail-not-main-idea"},{"text":"Owls have special features that make them skilled hunters at night.","is_correct":true}]$q$::jsonb, $q$Owls have special features that make them skilled hunters at night.$q$, $q$The passage explains how owls' eyes and feathers make them good night hunters — that's the main idea. Large eyes are one detail, owls hunt at night (not day), and nothing is said about mice being smart.$q$, 'published',
   '507affae-c2cd-5950-baa0-a0c1d4e9b0e5')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-mi-p14 (main-idea, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('e8a4960a-db0c-5ad3-a3aa-20862ed62b6c',
   'read-mi-p14',
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', '3-5', null, $q$Long ago, sailors used the stars to find their way across the ocean. They learned which stars stayed in the same place in the sky. By following those stars at night, they could sail toward the right land even when they could not see it.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('ff8b3840-2f86-5397-8cc7-4560d5bed382',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'hard',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"Sailors long ago used the stars to guide their ships across the ocean.","is_correct":true},{"text":"Sailors were only able to sail during the daytime.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Some stars stay in the same place in the sky.","is_correct":false,"misconception_token":"detail-not-main-idea"},{"text":"The ocean is very large and very deep.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$Sailors long ago used the stars to guide their ships across the ocean.$q$, $q$The passage is about sailors using steady stars to navigate at night. They sailed at night (not only day), the size of the ocean is not the point, and "some stars stay put" is a detail that supports the main idea.$q$, 'published',
   'e8a4960a-db0c-5ad3-a3aa-20862ed62b6c')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-mi-p15 (main-idea, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('8d6298ab-d9f0-58ce-9d5c-cc9a8b41a847',
   'read-mi-p15',
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', '3-5', null, $q$A rainbow appears when the sun shines through rain. The tiny drops of water bend the sunlight and split it into many colors. That is why we often see rainbows right after it stops raining, while the sun is still out.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('e593fd32-b78d-5827-8e3b-b351db7c967d',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'easy',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"Rainbows only ever appear in the middle of the night.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Rain itself is naturally made of many colors.","is_correct":false,"misconception_token":"reverses-relationship"},{"text":"Rainbows form when sunlight shines through raindrops and splits into colors.","is_correct":true},{"text":"The sun is extremely hot.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$Rainbows form when sunlight shines through raindrops and splits into colors.$q$, $q$The passage explains that rainbows form when sunlight passes through raindrops. Rainbows need sunlight (not night), it is the light that splits into colors (not the rain that is colored), and the sun's heat is not discussed.$q$, 'published',
   '8d6298ab-d9f0-58ce-9d5c-cc9a8b41a847')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-mi-p16 (main-idea, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('adfe1ed6-16ad-58bb-b2ac-6e0908c5ef4a',
   'read-mi-p16',
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', '3-5', null, $q$Some people think all spiders are insects, but they are not. Insects have six legs and three body parts. Spiders have eight legs and only two body parts. Spiders belong to a different animal group called arachnids.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('795fe31d-ff98-5241-a78f-d1a6af92ecf1',
   null,
   (select id from public.skills where slug = 'main-idea'),
   'information-and-ideas', 'hard',
   $q$Which choice best states the main idea of the text?$q$, $q$[{"text":"Spiders are not insects; they belong to a different group and have eight legs.","is_correct":true},{"text":"Spiders are the scariest animals of all.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"Spiders have two body parts.","is_correct":false,"misconception_token":"detail-not-main-idea"},{"text":"Spiders and insects are exactly the same kind of animal.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$Spiders are not insects; they belong to a different group and have eight legs.$q$, $q$The main idea is that spiders are arachnids, not insects, with eight legs and two body parts. Spiders and insects are not the same, "scariest" is not in the passage, and "two body parts" is a detail that supports the main idea.$q$, 'published',
   'adfe1ed6-16ad-58bb-b2ac-6e0908c5ef4a')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-rc-p01 (reading-comprehension, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('5d926412-90a5-531b-b958-65ae0cc3bc57',
   'read-rc-p01',
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', '3-5', null, $q$Sam's dog, Biscuit, loves to play fetch. Every afternoon, Sam throws a ball across the yard, and Biscuit races after it. Biscuit brings the ball back and drops it at Sam's feet, waiting for another throw.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('18f00b81-2ba3-5869-a6bb-a2dd722de89a',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'easy',
   $q$What does Biscuit do after chasing the ball?$q$, $q$[{"text":"He waits for Sam to go find the ball.","is_correct":false,"misconception_token":"reverses-relationship"},{"text":"He brings it back and drops it at Sam's feet.","is_correct":true},{"text":"He hides the ball somewhere in the yard.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"He chews the ball into little pieces.","is_correct":false,"misconception_token":"plausible-but-unstated"}]$q$::jsonb, $q$He brings it back and drops it at Sam's feet.$q$, $q$The passage says Biscuit brings the ball back and drops it at Sam's feet. He doesn't hide or chew it, and Sam doesn't have to find it — Biscuit returns it.$q$, 'published',
   '5d926412-90a5-531b-b958-65ae0cc3bc57')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-rc-p02 (reading-comprehension, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('bc37690a-a1f4-5c67-8ffe-81616692af3c',
   'read-rc-p02',
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', '3-5', null, $q$The library is open every day except Sunday. On weekdays it opens at nine in the morning. On Saturday it opens later, at noon, and closes early so the workers can rest.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('11c3c292-3641-527c-afce-3b2ee90e7fbd',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'easy',
   $q$On which day is the library closed?$q$, $q$[{"text":"Sunday.","is_correct":true},{"text":"Every weekday morning.","is_correct":false,"misconception_token":"reverses-relationship"},{"text":"Saturday.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"The library is open on all seven days.","is_correct":false,"misconception_token":"too-broad"}]$q$::jsonb, $q$Sunday.$q$, $q$The passage says the library is open every day except Sunday. It's open Saturdays (at noon) and on weekday mornings, and it is not open all seven days.$q$, 'published',
   'bc37690a-a1f4-5c67-8ffe-81616692af3c')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-rc-p03 (reading-comprehension, information-and-ideas, 3-5) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('9cf9ba07-71b2-5188-b45c-6c3f4a74b340',
   'read-rc-p03',
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', '3-5', null, $q$Ana planted a small apple tree in her backyard. For the first two years, it grew taller but had no fruit. Ana was patient and kept watering it. In the third year, the tree finally grew its first apples, and Ana shared them with her neighbors.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('9f79a8b1-8bcf-50a5-9444-5ca63c671a6b',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'easy',
   $q$How many years passed before the tree grew apples?$q$, $q$[{"text":"Two years.","is_correct":false,"misconception_token":"partly-right"},{"text":"Three years.","is_correct":true},{"text":"Ten years.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"One year.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$Three years.$q$, $q$The tree grew its first apples in the third year. After one and two years it still had none, and ten years is never mentioned.$q$, 'published',
   '9cf9ba07-71b2-5188-b45c-6c3f4a74b340')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('7d4e4b91-02d3-5574-a8c2-527a2b30caea',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'medium',
   $q$What do Ana's actions show about her?$q$, $q$[{"text":"She is patient and willing to wait for good results.","is_correct":true},{"text":"She gives up easily when things are slow.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"She thinks the tree will never grow any fruit.","is_correct":false,"misconception_token":"unsupported-inference"},{"text":"She cares only about apples and nothing else.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$She is patient and willing to wait for good results.$q$, $q$Ana waited three years and kept watering, then shared the apples — that shows patience. She didn't give up, she kept caring for the tree (so she didn't think it hopeless), and 'cares only about apples' isn't supported.$q$, 'published',
   '9cf9ba07-71b2-5188-b45c-6c3f4a74b340')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-rc-p04 (reading-comprehension, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('657452d9-0cf0-5ee9-8793-cf7da118c4a9',
   'read-rc-p04',
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', '3-5', null, $q$When it gets cold in the fall, many birds fly south to warmer places. This long trip is called migration. The birds return north in the spring, when the weather warms up and there is more food to find.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('b0adbbe1-18e6-58e7-be2c-aa0ca4923493',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'easy',
   $q$Why do the birds fly south in the fall?$q$, $q$[{"text":"Because they get lost on the way.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"Because there is more food up north in the fall.","is_correct":false,"misconception_token":"reverses-relationship"},{"text":"To stay in the coldest weather they can find.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"To reach warmer places when it gets cold.","is_correct":true}]$q$::jsonb, $q$To reach warmer places when it gets cold.$q$, $q$The birds fly south to reach warmer places when it turns cold. They are not lost, they leave the cold (not seek it), and more food up north is a reason they return in spring.$q$, 'published',
   '657452d9-0cf0-5ee9-8793-cf7da118c4a9')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-rc-p05 (reading-comprehension, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('a442eb30-73d1-5a8c-b594-109f4d0b9bd2',
   'read-rc-p05',
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', '3-5', null, $q$Jena forgot her lunch at home. At noon, she felt worried and hungry. Then her friend Ravi noticed and offered to share his sandwich and apple. Jena smiled and thanked him.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('09499e5a-3262-5854-9c18-a844bd31bc3e',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'easy',
   $q$How does Ravi help Jena?$q$, $q$[{"text":"He eats her lunch for her.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"He drives her home to get her lunch.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"He buys her a brand-new lunch.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"He shares his own food with her.","is_correct":true}]$q$::jsonb, $q$He shares his own food with her.$q$, $q$Ravi shares his sandwich and apple with Jena. He does not buy lunch, take her home, or eat her lunch — she forgot hers.$q$, 'published',
   'a442eb30-73d1-5a8c-b594-109f4d0b9bd2')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-rc-p06 (reading-comprehension, information-and-ideas, 3-5) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('9d5f1a59-1122-5cd6-9218-8408e1cb9852',
   'read-rc-p06',
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', '3-5', null, $q$A spider builds its web out of silk that comes from inside its body. The web is sticky, so insects that fly into it get stuck. When an insect is caught, the spider feels the web shake and hurries over to catch its meal.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('12bf2276-3832-5ab6-b25e-52c791eb70d0',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'medium',
   $q$How does a spider know an insect has landed in its web?$q$, $q$[{"text":"The web changes color when an insect lands.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"It hears the insect buzzing loudly.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"It feels the web shake.","is_correct":true},{"text":"The insect flies over to the spider.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$It feels the web shake.$q$, $q$The passage says the spider feels the web shake. It does not say the spider hears buzzing or that the web changes color, and the insect is stuck, so it cannot fly to the spider.$q$, 'published',
   '9d5f1a59-1122-5cd6-9218-8408e1cb9852')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('209d6a68-29dc-56d1-ad00-aeb0c1f7d2d6',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'easy',
   $q$What is the spider's web made of?$q$, $q$[{"text":"Drops of water.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Sticky leaves from a tree.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"Silk that comes from inside the spider's body.","is_correct":true},{"text":"Thin pieces of wood.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$Silk that comes from inside the spider's body.$q$, $q$The web is made of silk from inside the spider's body. It is not made of leaves, wood, or water.$q$, 'published',
   '9d5f1a59-1122-5cd6-9218-8408e1cb9852')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-rc-p07 (reading-comprehension, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('cedf4844-89ca-5b30-a971-e31b58294fd4',
   'read-rc-p07',
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', '3-5', null, $q$Marcus built a fort out of couch cushions in the living room. He stacked them into walls and left a small gap for a door. He crawled inside and read his favorite comic book by flashlight.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('3a085e59-1448-5bba-b7d7-e4836b9fdfc1',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'easy',
   $q$Where did Marcus build his fort?$q$, $q$[{"text":"In the living room.","is_correct":true},{"text":"In his bedroom.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"At the public library.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"Outside in the yard.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$In the living room.$q$, $q$The passage says the fort was in the living room. Not the bedroom, the yard, or the library.$q$, 'published',
   'cedf4844-89ca-5b30-a971-e31b58294fd4')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-rc-p08 (reading-comprehension, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('8c83fd55-4c5c-552c-9c94-685a335255be',
   'read-rc-p08',
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', '3-5', null, $q$Turtles carry their homes on their backs. A turtle's shell is part of its body and cannot come off. When a turtle feels scared, it pulls its head and legs inside the shell to stay safe.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('ae3116c3-cd46-51c0-860a-85ed8e726c86',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'medium',
   $q$Why does a turtle pull into its shell when it is scared?$q$, $q$[{"text":"It is trying to go to sleep.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"The shell comes off whenever it is scared.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"The hard shell protects its head and legs from danger.","is_correct":true},{"text":"It wants to look bigger to other animals.","is_correct":false,"misconception_token":"unsupported-inference"}]$q$::jsonb, $q$The hard shell protects its head and legs from danger.$q$, $q$The turtle hides inside its hard shell to stay safe from danger. It is not sleeping, the shell cannot come off, and looking bigger is never mentioned.$q$, 'published',
   '8c83fd55-4c5c-552c-9c94-685a335255be')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-rc-p09 (reading-comprehension, information-and-ideas, 3-5) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('6d3de056-b052-55a0-b423-15d080c18284',
   'read-rc-p09',
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', '3-5', null, $q$Rain is part of the water cycle. The sun heats water in lakes and oceans, and the water rises into the air as an invisible gas. High up, the gas cools and forms clouds. When the clouds get heavy with water, the water falls back down as rain.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('dd966446-3113-5f65-ad91-c14926af2bda',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'medium',
   $q$According to the passage, what happens right before clouds form?$q$, $q$[{"text":"The sun stops shining.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Rain falls down to the ground.","is_correct":false,"misconception_token":"reverses-relationship"},{"text":"Water rises into the air and cools high up.","is_correct":true},{"text":"The lakes and oceans dry up completely.","is_correct":false,"misconception_token":"too-broad"}]$q$::jsonb, $q$Water rises into the air and cools high up.$q$, $q$Clouds form after water rises and cools high up, so that comes right before. Rain comes after clouds, the sun keeps heating the water, and the lakes do not dry up completely.$q$, 'published',
   '6d3de056-b052-55a0-b423-15d080c18284')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('4a7c6583-9e19-5fb9-bc60-1f4a3ba4dd1a',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'hard',
   $q$Why does it rain when there is a lot of water in the clouds?$q$, $q$[{"text":"The falling rain is what makes the clouds heavy.","is_correct":false,"misconception_token":"reverses-relationship"},{"text":"The clouds are made of soft cotton.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"The sun reaches down and pushes the rain out.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"The clouds get too heavy to hold the water up, so it falls.","is_correct":true}]$q$::jsonb, $q$The clouds get too heavy to hold the water up, so it falls.$q$, $q$The passage says clouds rain when they get heavy with water, so they let go once they are too heavy to hold it up. Clouds are not cotton, rain comes from heavy clouds (not the reverse), and the sun heating water is not the same as pushing rain down.$q$, 'published',
   '6d3de056-b052-55a0-b423-15d080c18284')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-rc-p10 (reading-comprehension, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('da11c938-df74-5289-9478-24bb4a48d6ea',
   'read-rc-p10',
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', '3-5', null, $q$Bees are important helpers for flowers. When a bee lands on a flower to drink its sweet nectar, yellow dust called pollen sticks to its body. The bee carries the pollen to the next flower, which helps new flowers and fruits grow.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('445b88c8-b447-50d2-8bb5-23907cf62d75',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'medium',
   $q$How do bees help flowers?$q$, $q$[{"text":"They drink up all of a flower's nectar so it can rest.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"They carry pollen from one flower to another.","is_correct":true},{"text":"They water the flowers each morning.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"They eat the pollen right off the flowers.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$They carry pollen from one flower to another.$q$, $q$Bees carry pollen between flowers, helping new flowers and fruits grow. They do not help by drinking all the nectar, they carry pollen (not eat it), and they do not water flowers.$q$, 'published',
   'da11c938-df74-5289-9478-24bb4a48d6ea')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-rc-p11 (reading-comprehension, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('abb1681a-4067-55c0-b698-26178ffb398d',
   'read-rc-p11',
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', '3-5', null, $q$Leo's family moved to a new town over the summer. On the first day of school, he did not know anyone and sat alone at lunch. A girl named Priya waved him over to her table and introduced him to her friends. By the end of the day, Leo felt much better.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('78e0a1c3-6a71-5b65-9411-fdc5dea211eb',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'medium',
   $q$Why does Leo feel better by the end of the day?$q$, $q$[{"text":"He found his old friends at the new school.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"He decided to move back to his old town.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"He was welcomed and made new friends.","is_correct":true},{"text":"School ended early that day.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$He was welcomed and made new friends.$q$, $q$Priya welcomed Leo and introduced him to friends, so he felt better. He did not move back, the school day did not end early, and his old friends are not at the new school.$q$, 'published',
   'abb1681a-4067-55c0-b698-26178ffb398d')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-rc-p12 (reading-comprehension, information-and-ideas, 3-5) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('53ea4fea-a7bf-5727-8443-ed56502b9217',
   'read-rc-p12',
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', '3-5', null, $q$Camels are built for the desert. They can go many days without drinking water. The humps on their backs store fat, not water, which their bodies use for energy when food is hard to find. Their wide feet keep them from sinking into the soft sand.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('b3d14201-0cce-562b-acd8-e9326035a88c',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'medium',
   $q$What do a camel's humps store?$q$, $q$[{"text":"Food that the camel finds along the way.","is_correct":false,"misconception_token":"partly-right"},{"text":"Water for the camel to drink later.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Sand from the desert floor.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"Fat that the camel's body uses for energy.","is_correct":true}]$q$::jsonb, $q$Fat that the camel's body uses for energy.$q$, $q$The humps store fat for energy, not water. They do not hold water, sand, or food — the stored fat is what the body uses when food is scarce.$q$, 'published',
   '53ea4fea-a7bf-5727-8443-ed56502b9217')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('c91c0b8d-a97c-58af-89e0-d8eb72ff7f83',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'hard',
   $q$Why are wide feet helpful for a camel in the desert?$q$, $q$[{"text":"They keep the camel from sinking into the soft sand.","is_correct":true},{"text":"They make the camel run faster than any other animal.","is_correct":false,"misconception_token":"too-broad"},{"text":"They keep the camel warm at night.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"They help the camel store even more water.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$They keep the camel from sinking into the soft sand.$q$, $q$Wide feet stop the camel from sinking into soft sand. They do not store water, are not said to make it the fastest animal, and warmth is not mentioned.$q$, 'published',
   '53ea4fea-a7bf-5727-8443-ed56502b9217')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-rc-p13 (reading-comprehension, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('ff450cc4-2523-5196-9f89-a91b23505124',
   'read-rc-p13',
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', '3-5', null, $q$A young kangaroo is called a joey. When a joey is born, it is very tiny. It crawls into a pouch on its mother's belly, where it stays warm and safe and drinks milk until it is big enough to hop around on its own.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('3f4cfff2-ad14-5b13-91aa-59066aff159b',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'easy',
   $q$Where does a baby kangaroo stay after it is born?$q$, $q$[{"text":"On its mother's back.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"Hopping around on its own right away.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"In a nest up in a tree.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"In a pouch on its mother's belly.","is_correct":true}]$q$::jsonb, $q$In a pouch on its mother's belly.$q$, $q$The joey stays in a pouch on its mother's belly. Not a tree nest or its mother's back, and it cannot hop on its own until it is bigger.$q$, 'published',
   'ff450cc4-2523-5196-9f89-a91b23505124')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-rc-p14 (reading-comprehension, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('06ceb972-fe4f-5551-be51-4f9e23fcaeaf',
   'read-rc-p14',
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', '3-5', null, $q$Thunder and lightning happen at the same time during a storm. But we usually see the lightning first and hear the thunder a few seconds later. That is because light travels to our eyes much faster than sound travels to our ears.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('b5f24e43-53eb-5412-a743-edb11fb46327',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'hard',
   $q$Why do we see lightning before we hear thunder?$q$, $q$[{"text":"Light travels faster than sound.","is_correct":true},{"text":"The thunder happens long after the lightning.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"We are standing closer to the lightning than to the thunder.","is_correct":false,"misconception_token":"unsupported-inference"},{"text":"Thunder is quieter than lightning is bright.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$Light travels faster than sound.$q$, $q$We see lightning first because light travels faster than sound. Thunder happens at the same time (not long after), loudness versus brightness is not the reason, and lightning and thunder come from the same place.$q$, 'published',
   '06ceb972-fe4f-5551-be51-4f9e23fcaeaf')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-rc-p15 (reading-comprehension, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('4b0a35f1-fa1e-5833-943e-7b4eb0f00ec6',
   'read-rc-p15',
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', '3-5', null, $q$Ice is lighter than the water it forms from. That is why ice cubes float in a glass instead of sinking. In lakes, this means ice forms on the top in winter, while the water underneath stays liquid, so fish can still swim below the ice.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('75f5c0c3-ae44-5eca-9ef4-2d3fbb4d1a53',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'medium',
   $q$Why can fish survive in a lake during winter?$q$, $q$[{"text":"The fish freeze into the ice and thaw out in spring.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"The whole lake turns into solid ice.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Ice floats on top, so the water beneath it stays liquid.","is_correct":true},{"text":"The fish breathe the ice as if it were air.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$Ice floats on top, so the water beneath it stays liquid.$q$, $q$Because ice floats, the water below stays liquid and fish can swim. The fish do not freeze and thaw, the whole lake does not freeze solid, and fish do not breathe ice.$q$, 'published',
   '4b0a35f1-fa1e-5833-943e-7b4eb0f00ec6')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-rc-p16 (reading-comprehension, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('5f894c2c-1e4e-5eae-be69-86016b4cc071',
   'read-rc-p16',
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', '3-5', null, $q$Nadia wanted to save money for a bicycle. Each week she put half of her allowance into a jar and spent the rest. It took her many months, but the jar slowly filled with coins and bills. On her birthday, she finally counted enough to buy the bike she wanted.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('c0ff8df0-9189-51de-9dcb-59f61fcd733d',
   null,
   (select id from public.skills where slug = 'reading-comprehension'),
   'information-and-ideas', 'hard',
   $q$What is the main lesson of Nadia's story?$q$, $q$[{"text":"Saving a little at a time can add up to something big.","is_correct":true},{"text":"Bicycles cost too much for anyone to buy.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Birthdays are the best time to get gifts.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"You should never spend any of your money.","is_correct":false,"misconception_token":"too-broad"}]$q$::jsonb, $q$Saving a little at a time can add up to something big.$q$, $q$Nadia saved half her allowance over months until she could buy the bike — saving a little adds up. She still spent some money, the bike was not unaffordable, and the lesson is not about birthdays.$q$, 'published',
   '5f894c2c-1e4e-5eae-be69-86016b4cc071')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-se-p01 (story-elements, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('bac071a3-d66b-56f0-b028-53f39433a078',
   'read-se-p01',
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', '3-5', null, $q$It was a rainy Saturday, so Ella and her little brother built a blanket fort in the living room. They filled it with pillows and a flashlight. All afternoon they told stories inside their cozy hideout while the rain tapped on the windows.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('67921b24-9888-5076-ac4a-fcf8367644ed',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'easy',
   $q$Where does this story take place?$q$, $q$[{"text":"In a real cave.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"In the living room.","is_correct":true},{"text":"At school.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"Outside in the rain.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$In the living room.$q$, $q$The story happens in the living room, where they built the fort. Not at school, outside, or a real cave — the rain is outside the window.$q$, 'published',
   'bac071a3-d66b-56f0-b028-53f39433a078')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-se-p02 (story-elements, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('a49335d4-f40e-5c99-a4d8-005d92d031f3',
   'read-se-p02',
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', '3-5', null, $q$Theo could not find his other shoe anywhere. He looked under his bed and in the closet, but it was gone. Finally, he checked by the back door and found the shoe — his puppy had carried it there to chew.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('99ed9504-b6d3-5ea0-bdcf-8b2d34d98b81',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'easy',
   $q$What is the problem in the story?$q$, $q$[{"text":"Theo cannot find his other shoe.","is_correct":true},{"text":"Theo is going to be late for school.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"His puppy has run away and is lost.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"Theo has far too many shoes.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$Theo cannot find his other shoe.$q$, $q$The problem is the missing shoe. His puppy is not lost, he is not late for school, and he does not have too many shoes — he is missing one.$q$, 'published',
   'a49335d4-f40e-5c99-a4d8-005d92d031f3')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-se-p03 (story-elements, information-and-ideas, 3-5) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('fa4f9f30-f66e-5930-ab69-50e5be0f00ba',
   'read-se-p03',
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', '3-5', null, $q$Rosa entered the school art contest, but she was sure her painting was not good enough. Her hands shook as the judges walked by. When they announced that her painting had won first place, Rosa could hardly believe it. She grinned from ear to ear.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('191b14ab-0374-55e9-98f3-38dff2669a76',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'easy',
   $q$How does Rosa feel at the beginning of the story?$q$, $q$[{"text":"Angry at the judges.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"Nervous and unsure of herself.","is_correct":true},{"text":"Proud and confident.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Bored and sleepy.","is_correct":false,"misconception_token":"misreads-tone"}]$q$::jsonb, $q$Nervous and unsure of herself.$q$, $q$At the start, her shaking hands and doubt show Rosa is nervous and unsure. She is not bored, angry, or confident — that comes later.$q$, 'published',
   'fa4f9f30-f66e-5930-ab69-50e5be0f00ba')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('cfa9b6bb-c254-50a2-94e7-71e458ed886e',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'medium',
   $q$How do Rosa's feelings change by the end of the story?$q$, $q$[{"text":"She goes from nervous to happy and proud.","is_correct":true},{"text":"She goes from happy to disappointed.","is_correct":false,"misconception_token":"reverses-relationship"},{"text":"She stays just as nervous the whole time.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"She becomes angry that she won.","is_correct":false,"misconception_token":"misreads-tone"}]$q$::jsonb, $q$She goes from nervous to happy and proud.$q$, $q$Rosa starts nervous and ends grinning after winning, so she moves from nervous to happy and proud. It is not the reverse, she does not stay nervous, and she is glad (not angry) to win.$q$, 'published',
   'fa4f9f30-f66e-5930-ab69-50e5be0f00ba')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-se-p04 (story-elements, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('5b8981e7-687b-598d-9e01-6aefc2962b6b',
   'read-se-p04',
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', '3-5', null, $q$Deep in the forest, an old fox had dug a cozy den beneath the roots of a giant oak tree. Snow fell softly outside, but inside the den it was warm and dry. The fox curled up and went to sleep.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('673fa8e7-b95b-5201-bd4a-6a87544dc2a8',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'easy',
   $q$Where does the fox live?$q$, $q$[{"text":"In a warm house with a family.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"In a cave beside the ocean.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"On top of the oak tree's branches.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"In a den beneath an oak tree in the forest.","is_correct":true}]$q$::jsonb, $q$In a den beneath an oak tree in the forest.$q$, $q$The fox lives in a den beneath the roots of an oak tree in the forest. Not in a house, up in the branches, or by the ocean.$q$, 'published',
   '5b8981e7-687b-598d-9e01-6aefc2962b6b')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-se-p05 (story-elements, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('f58aa8bb-a3e6-5855-888d-b38aa2b4754d',
   'read-se-p05',
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', '3-5', null, $q$Kwame really wanted to ride the tall roller coaster, but he was one inch too short. Instead of being upset, he spent the day on the smaller rides with his cousins and had a great time. Next year, he promised himself, he would be tall enough.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('bd80bf67-17d3-5d51-896d-e57c0358378c',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'easy',
   $q$What kind of person is Kwame, based on the story?$q$, $q$[{"text":"He is scared of every ride at the park.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"He is mean to his cousins.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"He gives up on having any fun at all.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"He makes the best of things instead of staying upset.","is_correct":true}]$q$::jsonb, $q$He makes the best of things instead of staying upset.$q$, $q$Kwame chooses to enjoy the smaller rides instead of sulking, so he makes the best of things. He does not give up on fun, is not mean, and is not scared of the rides.$q$, 'published',
   'f58aa8bb-a3e6-5855-888d-b38aa2b4754d')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-se-p06 (story-elements, information-and-ideas, 3-5) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('39b8adf4-1e75-5416-9d54-3ebd7e5e59aa',
   'read-se-p06',
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', '3-5', null, $q$The little sailboat had drifted far from shore, and dark clouds were rolling in. Captain Lin gripped the wheel and steered straight toward a small island she spotted in the distance. Just as the first raindrops fell, she guided the boat safely into a calm cove.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('91459c2a-1687-5044-8fe6-2d36a86da35e',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'medium',
   $q$What problem does Captain Lin face?$q$, $q$[{"text":"She cannot find the ocean.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"Her boat has run out of food.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"A storm is coming while her boat is far from shore.","is_correct":true},{"text":"The island she sees is sinking.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$A storm is coming while her boat is far from shore.$q$, $q$Captain Lin's problem is the coming storm with her boat far out. There is no mention of running out of food, she is already on the ocean, and the island is not sinking.$q$, 'published',
   '39b8adf4-1e75-5416-9d54-3ebd7e5e59aa')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('26053bf4-2ec4-5f2e-9304-53c2139c9dd7',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'medium',
   $q$How does Captain Lin solve her problem?$q$, $q$[{"text":"She sails farther out into the open sea.","is_correct":false,"misconception_token":"reverses-relationship"},{"text":"She jumps into the water and swims to shore.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"She steers to a nearby island and reaches a calm cove.","is_correct":true},{"text":"She waits for someone else to come rescue her.","is_correct":false,"misconception_token":"plausible-but-unstated"}]$q$::jsonb, $q$She steers to a nearby island and reaches a calm cove.$q$, $q$She steers toward the island and into a calm cove before the storm. She does not swim, wait for rescue, or sail farther out — she heads to safety.$q$, 'published',
   '39b8adf4-1e75-5416-9d54-3ebd7e5e59aa')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-se-p07 (story-elements, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('ddf0fee9-9214-52a6-8b4f-0b62bcb303a3',
   'read-se-p07',
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', '3-5', null, $q$Grandma's kitchen always smelled like cinnamon. Every Sunday, Amir would sit at the wooden table and watch her roll dough for her famous rolls. She would hum an old song, and Amir would wait for the first warm roll straight from the oven.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('5a7c4a85-6409-5015-93b6-e22a97d203e0',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'easy',
   $q$Where does this story take place?$q$, $q$[{"text":"In Grandma's kitchen.","is_correct":true},{"text":"At a bakery in town.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"Outdoors in a garden.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"In Amir's classroom.","is_correct":false,"misconception_token":"plausible-but-unstated"}]$q$::jsonb, $q$In Grandma's kitchen.$q$, $q$The story is set in Grandma's kitchen at her wooden table. Not a bakery, a classroom, or a garden.$q$, 'published',
   'ddf0fee9-9214-52a6-8b4f-0b62bcb303a3')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-se-p08 (story-elements, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('e794aa7f-6c85-50e0-b689-32b8c30c677a',
   'read-se-p08',
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', '3-5', null, $q$Jonah promised to feed the class hamster over the long weekend, but on Saturday he completely forgot. On Sunday, he suddenly remembered and felt terrible. He rushed to school with his mom, gave the hamster food and water, and decided to write himself a note next time.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('42479890-a7c8-535e-86b0-a6cc5af41afc',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'medium',
   $q$What does Jonah learn in the story?$q$, $q$[{"text":"He should never take care of any animal again.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"It is perfectly fine to break a promise.","is_correct":false,"misconception_token":"reverses-relationship"},{"text":"He should find a way to remember his responsibilities.","is_correct":true},{"text":"His mom should do all of his chores for him.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$He should find a way to remember his responsibilities.$q$, $q$Jonah decides to write a note so he will not forget again — he learns to remember his responsibilities. He does not swear off animals, does not think breaking promises is fine, and does not hand his chores to his mom.$q$, 'published',
   'e794aa7f-6c85-50e0-b689-32b8c30c677a')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-se-p09 (story-elements, information-and-ideas, 3-5) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('4a982c23-b88d-513e-8cce-f1386408d7f9',
   'read-se-p09',
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', '3-5', null, $q$The dragon in the story was not fierce at all. He lived alone on a mountain because the villagers were afraid of his fiery sneezes. One day, a brave girl climbed up to meet him and discovered he was gentle and lonely. She invited him to the village, and soon the children loved his warm, crackly laugh.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('e5e38563-722a-5acb-a873-add119018bec',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'medium',
   $q$What is the dragon really like?$q$, $q$[{"text":"Loud and rude to the girl who visits.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"Cruel and dangerous to everyone.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Gentle and lonely, not fierce.","is_correct":true},{"text":"Too shy to ever leave his mountain.","is_correct":false,"misconception_token":"partly-right"}]$q$::jsonb, $q$Gentle and lonely, not fierce.$q$, $q$The dragon turns out to be gentle and lonely, not fierce. He is not cruel or rude, and while he lived alone, he does leave the mountain when invited, so "too shy to ever leave" is only partly right.$q$, 'published',
   '4a982c23-b88d-513e-8cce-f1386408d7f9')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('29dad0bc-58c8-5baf-b2e8-cb4e89841ed4',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'hard',
   $q$What lesson does this story teach?$q$, $q$[{"text":"You should always stay away from anyone new.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Dragons make good pets.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"Living high on a mountain is dangerous.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"Someone who seems scary may turn out to be kind.","is_correct":true}]$q$::jsonb, $q$Someone who seems scary may turn out to be kind.$q$, $q$The scary-seeming dragon is really kind, so the lesson is not to judge by fear. It is not about pets, it rewards the girl for reaching out (not avoiding others), and mountain danger is not the point.$q$, 'published',
   '4a982c23-b88d-513e-8cce-f1386408d7f9')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-se-p10 (story-elements, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('83dee8f2-3625-51e4-bef6-9582a236a670',
   'read-se-p10',
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', '3-5', null, $q$Mia's kite was stuck high in a tree. She could not reach it, no matter how she jumped. Her older brother had an idea: he tied a rope to a tennis ball, threw it over the branch, and gently shook the kite loose.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('e80c8779-05ee-5933-8bfc-0cbfbdac81b2',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'medium',
   $q$How is the problem in the story solved?$q$, $q$[{"text":"Mia climbs the tree and grabs the kite herself.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Her brother uses a rope and a ball to shake the kite loose.","is_correct":true},{"text":"Mia buys a brand-new kite instead.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"The wind blows the kite down all on its own.","is_correct":false,"misconception_token":"plausible-but-unstated"}]$q$::jsonb, $q$Her brother uses a rope and a ball to shake the kite loose.$q$, $q$Her brother's rope-and-ball trick shakes the kite loose — that solves it. Mia does not climb up, the wind does not free it, and she does not buy a new one.$q$, 'published',
   '83dee8f2-3625-51e4-bef6-9582a236a670')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-se-p11 (story-elements, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('3d8efdee-a100-54a6-914d-2fd9ca1a3210',
   'read-se-p11',
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', '3-5', null, $q$The morning of the big game, dark clouds filled the sky. By the time the teams lined up, rain was pouring down. The players slipped and slid across the muddy field, laughing as they chased the ball through the puddles.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('6412e332-37f1-5bdc-8d1c-f5bd54fff3df',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'easy',
   $q$What is the weather like during the game?$q$, $q$[{"text":"So foggy that no one can see.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"Sunny and hot.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Rainy and wet.","is_correct":true},{"text":"Cold and snowy.","is_correct":false,"misconception_token":"plausible-but-unstated"}]$q$::jsonb, $q$Rainy and wet.$q$, $q$It is rainy and wet — the field is muddy and full of puddles. It is not sunny, snowy, or too foggy to see.$q$, 'published',
   '3d8efdee-a100-54a6-914d-2fd9ca1a3210')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-se-p12 (story-elements, information-and-ideas, 3-5) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('60d9edc8-bff5-5fac-bfb9-b5fd9cff0322',
   'read-se-p12',
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', '3-5', null, $q$Sanjay had practiced his speech a hundred times, but standing in front of the whole school, he froze. The silence felt endless. Then he took a deep breath, remembered his first line, and the words began to flow. When he finished, the crowd clapped loudly, and Sanjay let out a huge sigh of relief.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('85ed45bb-e97c-52db-8240-747d66243ab5',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'medium',
   $q$How does Sanjay feel when he first stands up to speak?$q$, $q$[{"text":"Angry at the crowd.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"Calm and relaxed.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Excited to show off.","is_correct":false,"misconception_token":"misreads-tone"},{"text":"Frozen with fear.","is_correct":true}]$q$::jsonb, $q$Frozen with fear.$q$, $q$Sanjay freezes and the silence feels endless, so he is afraid at first. He is not calm, showing off, or angry — relief comes only at the end.$q$, 'published',
   '60d9edc8-bff5-5fac-bfb9-b5fd9cff0322')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('4b5ea961-370e-50e2-9ce3-a7e38f7dbc5b',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'hard',
   $q$What is the turning point of the story?$q$, $q$[{"text":"Sanjay takes a deep breath and remembers his first line.","is_correct":true},{"text":"Sanjay decides never to give a speech again.","is_correct":false,"misconception_token":"unsupported-inference"},{"text":"The principal reads the speech for him.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"Sanjay walks off the stage without speaking.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$Sanjay takes a deep breath and remembers his first line.$q$, $q$The turning point is when Sanjay breathes and remembers his first line, and the words flow. He does not walk off, the story does not say he quits speeches, and no one reads it for him.$q$, 'published',
   '60d9edc8-bff5-5fac-bfb9-b5fd9cff0322')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-se-p13 (story-elements, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('40bcc116-ceaf-5dd0-b566-a8622c9b7732',
   'read-se-p13',
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', '3-5', null, $q$The town of Willow Creek sat in a quiet valley between two green hills. A narrow river ran right through the middle, and a small wooden bridge connected the two sides. Every morning, farmers crossed the bridge to sell fruit in the market square.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('bdca9e2f-cc65-5eb1-a3fd-f830d5f9b289',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'easy',
   $q$Which detail best describes the setting of the story?$q$, $q$[{"text":"A sandy beach beside the sea.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"A town where no one ever leaves home.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"A busy city full of tall buildings.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"A quiet valley town with a river and a wooden bridge.","is_correct":true}]$q$::jsonb, $q$A quiet valley town with a river and a wooden bridge.$q$, $q$Willow Creek is a quiet valley town with a river and a wooden bridge. It is not a big city or a beach, and farmers do leave home to cross to the market.$q$, 'published',
   '40bcc116-ceaf-5dd0-b566-a8622c9b7732')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-se-p14 (story-elements, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('9fa7cfeb-86dd-5674-9eb4-01d78399fa1b',
   'read-se-p14',
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', '3-5', null, $q$Every day after school, Lila visited the old man who lived next door and read the newspaper to him because his eyes were weak. She never asked for anything in return. On the last day of summer, he surprised her with a small painting he had made just for her.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('467f2424-f0ab-58ae-9b4f-cf5b4b598773',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'hard',
   $q$What does the story mainly show about Lila?$q$, $q$[{"text":"She is kind and helps others without expecting a reward.","is_correct":true},{"text":"She only helps people who pay her.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"She dislikes reading out loud.","is_correct":false,"misconception_token":"plausible-but-unstated"},{"text":"She wants the old man's painting from the very start.","is_correct":false,"misconception_token":"unsupported-inference"}]$q$::jsonb, $q$She is kind and helps others without expecting a reward.$q$, $q$Lila reads to her neighbor daily and asks for nothing, so she is kind and giving. She does not require payment, and she does not start out wanting the painting — it is a surprise.$q$, 'published',
   '9fa7cfeb-86dd-5674-9eb4-01d78399fa1b')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-se-p15 (story-elements, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('f087c584-4bbc-5213-86d4-c55c6b8c86fb',
   'read-se-p15',
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', '3-5', null, $q$Owen's family was moving to a new house, and he had to say goodbye to his best friend, Kai. On moving day, Owen felt a lump in his throat. Kai handed him a friendship bracelet and promised they would still visit. Owen managed a small smile as the car pulled away.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('549bef9a-791d-53e1-98b0-b6304c879411',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'medium',
   $q$How does Owen most likely feel on moving day?$q$, $q$[{"text":"Thrilled that he is finally moving away.","is_correct":false,"misconception_token":"misreads-tone"},{"text":"Completely bored by the whole day.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"Sad to leave, but comforted by his friend.","is_correct":true},{"text":"Angry at Kai for the bracelet.","is_correct":false,"misconception_token":"plausible-but-unstated"}]$q$::jsonb, $q$Sad to leave, but comforted by his friend.$q$, $q$Owen's lump in his throat shows sadness, and Kai's bracelet and his small smile show some comfort. He is not thrilled, bored, or angry at Kai.$q$, 'published',
   'f087c584-4bbc-5213-86d4-c55c6b8c86fb')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-se-p16 (story-elements, information-and-ideas, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('fc270acd-c6fc-538e-a5a9-4d2ff0cbd4ed',
   'read-se-p16',
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', '3-5', null, $q$In the story, a greedy king demanded that everything he touched turn to gold. At first he was delighted as coins and crowns piled up. But when he could no longer eat, because even his food turned hard and gold, he begged to have his wish taken away.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('cd4446e2-3eb1-51e4-bafe-0fc105d33239',
   null,
   (select id from public.skills where slug = 'story-elements'),
   'information-and-ideas', 'hard',
   $q$What is the main lesson of this story?$q$, $q$[{"text":"Wanting too much can end up causing harm.","is_correct":true},{"text":"Kings are always unhappy people.","is_correct":false,"misconception_token":"too-broad"},{"text":"It is good to be able to touch things.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"Gold is the most useful thing anyone can own.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$Wanting too much can end up causing harm.$q$, $q$The king's greed for gold leaves him unable to eat, so the lesson is that wanting too much can backfire. Gold is not shown as most useful, the story is not about all kings, and it is not about touching in general.$q$, 'published',
   'fc270acd-c6fc-538e-a5a9-4d2ff0cbd4ed')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-vo-p01 (vocabulary, craft-and-structure, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('57309ea4-bf58-53f7-83ea-e46b973f0c33',
   'read-vo-p01',
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', '3-5', null, $q$The old bridge was so fragile that the workers put up a fence to keep people off it. Even a small push could make its rotten boards crack and fall.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('e6e7245f-0881-5c7a-8c4e-6cd6fb19ee09',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'easy',
   $q$As used in the passage, 'fragile' most nearly means$q$, $q$[{"text":"strong and safe.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"easily broken.","is_correct":true},{"text":"very heavy.","is_correct":false,"misconception_token":"wrong-word-meaning"},{"text":"brightly colored.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$easily broken.$q$, $q$The bridge could crack from a small push, so 'fragile' means easily broken. It does not mean heavy or colorful, and 'strong and safe' is the opposite.$q$, 'published',
   '57309ea4-bf58-53f7-83ea-e46b973f0c33')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-vo-p02 (vocabulary, craft-and-structure, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('1266aa86-8c07-502d-a086-964ac7d73c9e',
   'read-vo-p02',
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', '3-5', null, $q$After the long hike, the travelers were weary. Their legs ached and their eyes drooped, so they stopped to rest under a shady tree.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('53a67b14-5e2c-5253-af54-ba3cf58e0fe6',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'easy',
   $q$As used in the passage, 'weary' most nearly means$q$, $q$[{"text":"very tired.","is_correct":true},{"text":"hungry.","is_correct":false,"misconception_token":"wrong-word-meaning"},{"text":"full of energy.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"lost.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$very tired.$q$, $q$Aching legs and drooping eyes show 'weary' means very tired. It is not full of energy (the opposite), hungry, or lost.$q$, 'published',
   '1266aa86-8c07-502d-a086-964ac7d73c9e')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-vo-p03 (vocabulary, craft-and-structure, 3-5) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('e0941551-f59c-5f21-99c1-32e4d9d51a50',
   'read-vo-p03',
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', '3-5', null, $q$The scientist made a keen observation that no one else had noticed: the plants near the light grew twice as fast. Her sharp eye and careful notes led to an important discovery.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('48c0bcfd-5eeb-5214-9121-0800768769ea',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'medium',
   $q$As used in the passage, 'keen' most nearly means$q$, $q$[{"text":"very loud.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"sharp and quick to notice.","is_correct":true},{"text":"eager to leave.","is_correct":false,"misconception_token":"wrong-word-meaning"},{"text":"dull and slow.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$sharp and quick to notice.$q$, $q$Her sharp eye caught what others missed, so 'keen' means sharp and quick to notice. It is not dull (the opposite) or loud, and the 'eager' meaning of keen does not fit here.$q$, 'published',
   'e0941551-f59c-5f21-99c1-32e4d9d51a50')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('8aa1c894-b3f5-5345-9053-c516480258f7',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'easy',
   $q$As used in the passage, 'observation' most nearly means$q$, $q$[{"text":"something noticed by watching closely.","is_correct":true},{"text":"a rule that must be followed.","is_correct":false,"misconception_token":"wrong-word-meaning"},{"text":"a loud complaint.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"a wild guess.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$something noticed by watching closely.$q$, $q$The observation was what she noticed by watching the plants, so it means something seen by close watching. It is not a rule, a complaint, or a guess — she took careful notes.$q$, 'published',
   'e0941551-f59c-5f21-99c1-32e4d9d51a50')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-vo-p04 (vocabulary, craft-and-structure, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('d31998b9-82c1-5800-aea9-791e75ce4418',
   'read-vo-p04',
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', '3-5', null, $q$The puppy was timid at first, hiding behind its owner's legs whenever a stranger came near. After a few weeks, though, it grew brave enough to greet visitors at the door.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('a7bb8ca8-6b8c-5237-b9dd-57a867db39b9',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'easy',
   $q$As used in the passage, 'timid' most nearly means$q$, $q$[{"text":"bold and friendly.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"playful.","is_correct":false,"misconception_token":"wrong-word-meaning"},{"text":"hungry.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"shy and easily frightened.","is_correct":true}]$q$::jsonb, $q$shy and easily frightened.$q$, $q$The puppy hid from strangers, so 'timid' means shy and easily frightened. 'Bold and friendly' is the opposite, and hungry and playful do not fit.$q$, 'published',
   'd31998b9-82c1-5800-aea9-791e75ce4418')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-vo-p05 (vocabulary, craft-and-structure, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('f8bc3691-64bf-5e93-83f8-ce1dbb3f0531',
   'read-vo-p05',
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', '3-5', null, $q$The desert was completely barren. For miles, there were no trees, no grass, and no water — only bare sand stretching to the horizon.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('86552310-c6f6-502b-83cf-54d1a322c2a4',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'easy',
   $q$As used in the passage, 'barren' most nearly means$q$, $q$[{"text":"full of color.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"cold and icy.","is_correct":false,"misconception_token":"wrong-word-meaning"},{"text":"crowded with plants.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"empty and bare.","is_correct":true}]$q$::jsonb, $q$empty and bare.$q$, $q$With no trees, grass, or water, 'barren' means empty and bare. It is the opposite of full of plants, and it does not mean icy or colorful.$q$, 'published',
   'f8bc3691-64bf-5e93-83f8-ce1dbb3f0531')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-vo-p06 (vocabulary, craft-and-structure, 3-5) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('18255b55-0e0d-599a-9ab1-471c9529b3ca',
   'read-vo-p06',
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', '3-5', null, $q$The coach urged the tired runners to keep going. 'Just one more lap,' she called, encouraging them until they crossed the finish line. Her steady voice pushed them forward when they wanted to quit.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('b3eedfd4-6bb8-5f5e-992a-66d95ee4ecc3',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'medium',
   $q$As used in the passage, 'urged' most nearly means$q$, $q$[{"text":"gently carried.","is_correct":false,"misconception_token":"wrong-word-meaning"},{"text":"quietly ignored.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"strongly encouraged.","is_correct":true},{"text":"carefully measured.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$strongly encouraged.$q$, $q$The coach pushed the runners to keep going, so 'urged' means strongly encouraged. She did not ignore them, carry them, or measure them.$q$, 'published',
   '18255b55-0e0d-599a-9ab1-471c9529b3ca')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('5503e7c2-27fc-5842-a8cd-7fe098d5555a',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'medium',
   $q$As used in the passage, 'steady' most nearly means$q$, $q$[{"text":"brand new.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"shaking and weak.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"calm and constant.","is_correct":true},{"text":"extremely loud.","is_correct":false,"misconception_token":"partly-right"}]$q$::jsonb, $q$calm and constant.$q$, $q$Her steady voice kept the runners going, so 'steady' means calm and constant. It is not shaking, it describes constancy rather than loudness, and it has nothing to do with being new.$q$, 'published',
   '18255b55-0e0d-599a-9ab1-471c9529b3ca')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-vo-p07 (vocabulary, craft-and-structure, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('6768aed8-96e7-5e5c-9a49-ec833da57dda',
   'read-vo-p07',
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', '3-5', null, $q$The instructions were so vague that no one knew what to do. They didn't say how much water to add or how long to wait, so everyone just guessed.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('94872b83-ef4f-5822-a80b-e1ceae324171',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'easy',
   $q$As used in the passage, 'vague' most nearly means$q$, $q$[{"text":"unclear.","is_correct":true},{"text":"very detailed.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"loud.","is_correct":false,"misconception_token":"wrong-word-meaning"},{"text":"colorful.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$unclear.$q$, $q$The instructions did not say how much or how long, so 'vague' means unclear. It is the opposite of detailed, and it is not about color or sound.$q$, 'published',
   '6768aed8-96e7-5e5c-9a49-ec833da57dda')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-vo-p08 (vocabulary, craft-and-structure, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('2066b09f-f2b5-5e1e-9206-46de20282814',
   'read-vo-p08',
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', '3-5', null, $q$The tiny stream eventually swelled into a wide, rushing river after weeks of heavy rain. What had been a trickle now roared past the banks.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('cf99e3ed-20f2-50e1-a7f8-abd5cb89c8eb',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'medium',
   $q$As used in the passage, 'swelled' most nearly means$q$, $q$[{"text":"dried up.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"hurt and ached.","is_correct":false,"misconception_token":"wrong-word-meaning"},{"text":"grew larger.","is_correct":true},{"text":"froze solid.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$grew larger.$q$, $q$The stream became a wide river, so 'swelled' means grew larger. It did not dry up (the opposite); the 'ache' meaning of swell and 'froze' do not fit.$q$, 'published',
   '2066b09f-f2b5-5e1e-9206-46de20282814')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-vo-p09 (vocabulary, craft-and-structure, 3-5) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('d6962d1d-cea9-5e3f-9c8a-c89dff7835a9',
   'read-vo-p09',
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', '3-5', null, $q$The knight was known for his valor. He rode fearlessly into danger to protect the villagers, never once turning away from a fight that needed him.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('5f306707-c0b6-5887-915c-ce6cec0638d9',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'medium',
   $q$As used in the passage, 'valor' most nearly means$q$, $q$[{"text":"great wealth.","is_correct":false,"misconception_token":"wrong-word-meaning"},{"text":"great fear.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"great courage.","is_correct":true},{"text":"great speed.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$great courage.$q$, $q$The knight rode fearlessly into danger, so 'valor' means great courage. It is the opposite of fear and does not mean wealth or speed.$q$, 'published',
   'd6962d1d-cea9-5e3f-9c8a-c89dff7835a9')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('064aaa10-f304-5c16-992e-080c820f0f3a',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'hard',
   $q$As used in the passage, 'fearlessly' most nearly means$q$, $q$[{"text":"with great fear.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"very carefully.","is_correct":false,"misconception_token":"partly-right"},{"text":"very quietly.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"without being afraid.","is_correct":true}]$q$::jsonb, $q$without being afraid.$q$, $q$'Fearlessly' means without being afraid, matching the knight's valor. Careful is not the meaning, 'with great fear' is the opposite, and 'quietly' does not fit.$q$, 'published',
   'd6962d1d-cea9-5e3f-9c8a-c89dff7835a9')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-vo-p10 (vocabulary, craft-and-structure, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('f9e47b48-6786-54c7-b355-47295f6e002e',
   'read-vo-p10',
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', '3-5', null, $q$The soup was bland, so Grandpa added salt, pepper, and a squeeze of lemon. With a little more flavor, it tasted much better.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('36c1326a-8c26-557b-a791-239ac7e42082',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'medium',
   $q$As used in the passage, 'bland' most nearly means$q$, $q$[{"text":"much too spicy.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"having little flavor.","is_correct":true},{"text":"frozen.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"very hot in temperature.","is_correct":false,"misconception_token":"wrong-word-meaning"}]$q$::jsonb, $q$having little flavor.$q$, $q$Grandpa added flavor because the soup was bland, so it means having little flavor. It is the opposite of spicy, and it is not about temperature or being frozen.$q$, 'published',
   'f9e47b48-6786-54c7-b355-47295f6e002e')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-vo-p11 (vocabulary, craft-and-structure, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('b4801434-69fe-5123-acd2-2d16e499a81f',
   'read-vo-p11',
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', '3-5', null, $q$The crowd was enormous. So many people had come to the parade that they filled the streets and sidewalks for blocks in every direction.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('c1aa8d5f-8d08-551b-988a-b92ba9371344',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'medium',
   $q$As used in the passage, 'enormous' most nearly means$q$, $q$[{"text":"very old.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"very small.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"very large.","is_correct":true},{"text":"very quiet.","is_correct":false,"misconception_token":"wrong-word-meaning"}]$q$::jsonb, $q$very large.$q$, $q$The crowd filled the streets for blocks, so 'enormous' means very large. It is the opposite of small and does not mean quiet or old.$q$, 'published',
   'b4801434-69fe-5123-acd2-2d16e499a81f')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-vo-p12 (vocabulary, craft-and-structure, 3-5) — 2 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('9f34907a-3c83-5fe1-bb9d-a0bd5c1f0a33',
   'read-vo-p12',
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', '3-5', null, $q$The detective was persistent. Even when every clue led to a dead end, he refused to give up, returning to the case night after night until he finally solved it.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('bce27bfa-60e8-5abe-bee1-ab6ddd796b63',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'medium',
   $q$As used in the passage, 'persistent' most nearly means$q$, $q$[{"text":"friendly.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"quick to quit.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"very forgetful.","is_correct":false,"misconception_token":"wrong-word-meaning"},{"text":"refusing to give up.","is_correct":true}]$q$::jsonb, $q$refusing to give up.$q$, $q$The detective kept working night after night, so 'persistent' means refusing to give up. It is the opposite of quitting and does not mean forgetful or friendly.$q$, 'published',
   '9f34907a-3c83-5fe1-bb9d-a0bd5c1f0a33')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('86ad1c16-5bae-531e-9244-2d4c286c4135',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'hard',
   $q$As used in the passage, the phrase 'dead end' most nearly means$q$, $q$[{"text":"a point where there is no way forward.","is_correct":true},{"text":"the end of a rope.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"an easy path straight to the answer.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"the death of a person.","is_correct":false,"misconception_token":"wrong-word-meaning"}]$q$::jsonb, $q$a point where there is no way forward.$q$, $q$Clues leading to a 'dead end' means they went nowhere — no way forward. It does not refer to a real death or a rope, and it is the opposite of an easy path.$q$, 'published',
   '9f34907a-3c83-5fe1-bb9d-a0bd5c1f0a33')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-vo-p13 (vocabulary, craft-and-structure, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('a36f715a-fcce-5ead-930a-43208bed5e61',
   'read-vo-p13',
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', '3-5', null, $q$The gift was generous. Aunt Rosa gave far more than anyone expected, filling the whole table with presents for the children.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('6513528e-c1ef-559c-87a5-e2e88d846174',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'easy',
   $q$As used in the passage, 'generous' most nearly means$q$, $q$[{"text":"very colorful.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"very tiny.","is_correct":false,"misconception_token":"wrong-word-meaning"},{"text":"giving very little.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"giving a lot.","is_correct":true}]$q$::jsonb, $q$giving a lot.$q$, $q$Aunt Rosa gave more than expected, so 'generous' means giving a lot. It is the opposite of giving little, and it is not about color or size.$q$, 'published',
   'a36f715a-fcce-5ead-930a-43208bed5e61')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-vo-p14 (vocabulary, craft-and-structure, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('40d72133-45db-51ff-8471-c01e889ef1e0',
   'read-vo-p14',
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', '3-5', null, $q$The hikers were cautious as they crossed the icy path. They tested each step and held the railing tightly so they would not slip.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('56fcb1ca-47c8-5b63-901f-5f13c8ba0bf4',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'hard',
   $q$As used in the passage, 'cautious' most nearly means$q$, $q$[{"text":"careful to avoid danger.","is_correct":true},{"text":"careless and rushed.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"curious about the ice.","is_correct":false,"misconception_token":"partly-right"},{"text":"excited and cheerful.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$careful to avoid danger.$q$, $q$Testing each step and holding the railing shows 'cautious' means careful to avoid danger. It is the opposite of careless, is not about being cheerful, and means careful rather than merely curious.$q$, 'published',
   '40d72133-45db-51ff-8471-c01e889ef1e0')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-vo-p15 (vocabulary, craft-and-structure, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('10efb092-3420-5956-b463-49f5d251126b',
   'read-vo-p15',
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', '3-5', null, $q$The room was spotless. Not a single crumb or speck of dust could be seen anywhere, because Dad had cleaned all morning.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('625a7daf-8fe7-5219-bd91-8f04c61a13fc',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'easy',
   $q$As used in the passage, 'spotless' most nearly means$q$, $q$[{"text":"covered in spots.","is_correct":false,"misconception_token":"contradicts-text"},{"text":"brightly painted.","is_correct":false,"misconception_token":"wrong-word-meaning"},{"text":"perfectly clean.","is_correct":true},{"text":"very large.","is_correct":false,"misconception_token":"out-of-scope"}]$q$::jsonb, $q$perfectly clean.$q$, $q$No crumb or speck of dust was left, so 'spotless' means perfectly clean. It is not covered in spots (the opposite), painted, or large.$q$, 'published',
   '10efb092-3420-5956-b463-49f5d251126b')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

-- read-vo-p16 (vocabulary, craft-and-structure, 3-5) — 1 question(s)
insert into public.passages
  (id, code, skill_id, sat_alignment, grade_band, title, body, status)
values
  ('b59f24cb-e23c-5548-937e-e728b75b4d2e',
   'read-vo-p16',
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', '3-5', null, $q$The teacher's praise was sincere. She truly meant every word when she told the class how proud she was of their hard work, and the students could tell she was not just being polite.$q$, 'published')
on conflict (id) do update set
  code          = excluded.code,
  skill_id      = excluded.skill_id,
  sat_alignment = excluded.sat_alignment,
  grade_band    = excluded.grade_band,
  title         = excluded.title,
  body          = excluded.body,
  status        = excluded.status;
insert into public.generated_questions
  (id, template_id, skill_id, sat_alignment, difficulty, stem, choices, correct_answer, solution, status, passage_id)
values
  ('a918f472-1235-5042-acbc-1ae7a25ecba6',
   null,
   (select id from public.skills where slug = 'vocabulary'),
   'craft-and-structure', 'hard',
   $q$As used in the passage, 'sincere' most nearly means$q$, $q$[{"text":"truly meant and honest.","is_correct":true},{"text":"very quiet.","is_correct":false,"misconception_token":"out-of-scope"},{"text":"polite but not really meant.","is_correct":false,"misconception_token":"partly-right"},{"text":"fake and pretend.","is_correct":false,"misconception_token":"contradicts-text"}]$q$::jsonb, $q$truly meant and honest.$q$, $q$She truly meant every word, so 'sincere' means honest and heartfelt. It is the opposite of fake, is not about being quiet, and the passage says she was more than just polite.$q$, 'published',
   'b59f24cb-e23c-5548-937e-e728b75b4d2e')
on conflict (id) do update set
  template_id    = excluded.template_id,
  skill_id       = excluded.skill_id,
  sat_alignment  = excluded.sat_alignment,
  difficulty     = excluded.difficulty,
  stem           = excluded.stem,
  choices        = excluded.choices,
  correct_answer = excluded.correct_answer,
  solution       = excluded.solution,
  status         = excluded.status,
  passage_id     = excluded.passage_id;

commit;
