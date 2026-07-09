-- 0008 — CCSS grade tagging + audio-picture render mode
--
-- ADDITIVE / NON-BREAKING. This migration only ADDS nullable columns (plus one
-- column with a safe default) and TAGS existing rows. It drops no columns, no
-- data, and no rows. Re-runnable: every add is `if not exists`, every constraint
-- is dropped-then-added, and the tagging is an idempotent keyed update.
--
--   • skills.ccss_grade / ccss_code / ccss_grade_num  — nullable, so every
--     existing skill stays valid (null until tagged below).
--   • generated_questions.render_mode                 — NOT NULL DEFAULT 'text',
--     so all 580 existing published rows become 'text' automatically and the
--     current text UI keeps rendering them unchanged.
--   • generated_questions.prompt                       — nullable jsonb, null for
--     every existing row (only audio-picture items set it).

begin;

-- ── skills: true Common Core grade tags ──────────────────────────────────────
alter table public.skills
  add column if not exists ccss_grade     text,
  add column if not exists ccss_code      text,
  add column if not exists ccss_grade_num smallint;

-- K=0 … grade 12. Nullable, so untagged skills remain valid.
alter table public.skills drop constraint if exists skills_ccss_grade_num_range;
alter table public.skills add constraint skills_ccss_grade_num_range
  check (ccss_grade_num is null or ccss_grade_num between 0 and 12);

-- Tag the existing skill tree to its true CCSS grade. Only rows whose slug
-- matches are touched; anything not listed keeps null tags.
update public.skills s
set ccss_grade = v.g, ccss_code = v.code, ccss_grade_num = v.n
from (values
  -- Math
  ('multiplication','3',3,'CCSS.MATH.CONTENT.3.OA.C.7'),
  ('division','3',3,'CCSS.MATH.CONTENT.3.OA.C.7'),
  ('fractions','3',3,'CCSS.MATH.CONTENT.3.NF.A.1'),
  ('geometry','3',3,'CCSS.MATH.CONTENT.3.MD.C.7'),
  ('ratios','6',6,'CCSS.MATH.CONTENT.6.RP.A.1'),
  ('percentages','6',6,'CCSS.MATH.CONTENT.6.RP.A.3.C'),
  ('expressions','6',6,'CCSS.MATH.CONTENT.6.EE.A.2'),
  ('proportional-reasoning','7',7,'CCSS.MATH.CONTENT.7.RP.A.2'),
  ('linear-thinking','8',8,'CCSS.MATH.CONTENT.8.EE.B.5'),
  ('algebra-1-concepts','8',8,'CCSS.MATH.CONTENT.8.EE.C.7'),
  ('functions','8',8,'CCSS.MATH.CONTENT.8.F.A.1'),
  ('data-analysis','6',6,'CCSS.MATH.CONTENT.6.SP.B.5'),
  ('hs-geometry','10',10,'CCSS.MATH.CONTENT.HSG.GMD.A.1'),
  ('algebra-2','11',11,'CCSS.MATH.CONTENT.HSA.REI.B.4'),
  ('advanced-functions','12',12,'CCSS.MATH.CONTENT.HSF.IF.A.2'),
  -- Reading
  ('main-idea','3',3,'CCSS.ELA-LITERACY.RI.3.2'),
  ('reading-comprehension','3',3,'CCSS.ELA-LITERACY.RI.3.1'),
  ('story-elements','3',3,'CCSS.ELA-LITERACY.RL.3.3'),
  ('vocabulary','3',3,'CCSS.ELA-LITERACY.RI.3.4'),
  ('evidence-based-reading','9',9,'CCSS.ELA-LITERACY.RI.9-10.1'),
  -- Grammar / conventions
  ('subject-verb-agreement','5',5,'CCSS.ELA-LITERACY.L.3.1.F'),
  ('punctuation-basics','4',4,'CCSS.ELA-LITERACY.L.4.2'),
  ('sentence-structure','5',5,'CCSS.ELA-LITERACY.L.4.1.F'),
  ('verb-tense-and-form','5',5,'CCSS.ELA-LITERACY.L.5.1.C'),
  ('pronoun-agreement','6',6,'CCSS.ELA-LITERACY.L.6.1.B'),
  ('advanced-punctuation','9',9,'CCSS.ELA-LITERACY.L.9-10.2.A'),
  ('modifier-placement','7',7,'CCSS.ELA-LITERACY.L.7.1.C'),
  ('possessives-and-apostrophes','5',5,'CCSS.ELA-LITERACY.L.2.2.C'),
  ('sentence-boundaries','6',6,'CCSS.ELA-LITERACY.L.4.1.F'),
  -- Writing / composition
  ('creative-writing','4',4,'CCSS.ELA-LITERACY.W.4.3'),
  ('paragraph-writing','3',3,'CCSS.ELA-LITERACY.W.3.2'),
  ('sentence-writing','2',2,'CCSS.ELA-LITERACY.L.2.1.F'),
  ('short-response','4',4,'CCSS.ELA-LITERACY.W.4.9'),
  ('writing-structure','9',9,'CCSS.ELA-LITERACY.W.9-10.2')
) as v(slug, g, n, code)
where s.slug = v.slug;

-- ── generated_questions: audio-picture render mode + visual prompt ────────────
alter table public.generated_questions
  add column if not exists render_mode text not null default 'text',
  add column if not exists prompt      jsonb;

alter table public.generated_questions drop constraint if exists generated_questions_render_mode_check;
alter table public.generated_questions add constraint generated_questions_render_mode_check
  check (render_mode in ('text', 'audio_picture'));

commit;
