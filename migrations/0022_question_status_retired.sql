-- ===========================================================================
-- 0022_question_status_retired.sql - a 'retired' question status, plus the
-- comment that stops the two meanings of `difficulty` merging again.
--
-- HOW TO APPLY: paste into the Supabase SQL editor and run against
-- papiowjjoyhnbyhgtbxq. Safe to re-run: the enum add is `if not exists` and the
-- comments are idempotent by nature.
--
-- RUN THIS BEFORE THE PUBLISH/RETIRE FLIP, NOT BEFORE SEEDING 0022.
-- seeds/0022 only inserts draft rows and does not use this value. This migration
-- exists so that when the tiered items are published, the v1 items they replace can
-- be taken out of service WITHOUT being deleted.
--
-- WHY 'retired' RATHER THAN DELETING. Every question_attempts row points at a
-- generated_questions row. Those rows are the evidence behind every mastery claim,
-- they carry the per-question time median that filters guessing in
-- recompute_skill_mastery, and they are what the serve path checks to avoid
-- repeating a question a student has already answered. Deleting a question would
-- orphan its attempts and destroy that history; rewriting its difficulty in place
-- would silently re-label attempts as having been served at a difficulty the
-- student was never actually given. Retiring does neither: the row stays, its
-- history stays joinable, and the client stops serving it because the client only
-- ever selects status='published'.
-- ===========================================================================

begin;

-- Postgres cannot add an enum value inside a transaction block on older versions;
-- ALTER TYPE ... ADD VALUE IF NOT EXISTS is transactional from PG12 onward, which
-- Supabase exceeds. If your client rejects it, run this one statement on its own.
alter type public.question_status add value if not exists 'retired';

commit;

-- ---------------------------------------------------------------------------
-- The two meanings of "difficulty", written down so they stop colliding.
-- ---------------------------------------------------------------------------
comment on column public.generated_questions.difficulty is
  'WITHIN-SKILL item hardness: how hard this item is compared with others for the '
  'SAME skill. It is NOT where the skill sits on the grade staircase - that is '
  'skills.ccss_grade_num, which is the single source of truth for grade level. '
  'Fifteen legacy math skills seeded before this distinction was drawn carry one '
  'difficulty across their whole pool because their tag recorded staircase '
  'position; those are being re-authored with a real spread (see '
  'src/lib/tieredMathTemplates.ts). Serving reads this via difficultyRamp.ts, '
  'which detects a single-difficulty pool and falls back to plain shuffling.';

comment on column public.question_templates.difficulty is
  'WITHIN-SKILL item hardness for the items this template generates. See the '
  'comment on generated_questions.difficulty; skills.ccss_grade_num is the grade.';

comment on column public.skills.ccss_grade_num is
  'True Common Core grade (K=0 .. 12). THE source of truth for where a skill sits '
  'on the grade staircase. Never inferred from generated_questions.difficulty.';
