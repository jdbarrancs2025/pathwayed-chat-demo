-- ===========================================================================
-- 0021_working_grade_progression.sql — audit columns for the earned skill grade
--
-- HOW TO APPLY: paste this whole file into the Supabase SQL editor and run it
--   against project papiowjjoyhnbyhgtbxq (or: bun run db:seed migrations/0021_working_grade_progression.sql).
-- Idempotent — every add is `if not exists`. Safe to re-run.
-- Depends on migration 0001 (public.students).
--
-- WHAT THIS IS. students.working_grade ALREADY EXISTS in this database (integer,
-- nullable, default null; verified before writing this migration). It was added out
-- of band and nothing has ever read or written it. This migration does NOT recreate
-- it. It adds the two audit columns the promotion path needs so a move up the
-- ladder is explainable to a parent, and documents the column's meaning.
--
-- THE TWO GRADES, WHICH MUST NOT BE CONFLATED:
--   students.grade         — CHRONOLOGICAL. How old the child is. This is what pins
--                            age-appropriate content (reading passages above all).
--                            Never moved by the engine.
--   students.working_grade — EARNED. How hard the SKILLS may get. Raised by one rung
--                            when the child clears the ADVANCE bar on every skill at
--                            their current working grade in a subject. Never lowered
--                            automatically. Null means "not yet promoted", and the
--                            app reads it as equal to grade.
-- ===========================================================================

begin;

-- When the working grade last moved, and why. Nullable: a child who has never been
-- promoted has nothing to explain. Written together with working_grade by
-- raiseWorkingGrade() in src/lib/students.ts.
alter table public.students
  add column if not exists working_grade_updated_at timestamptz,
  add column if not exists working_grade_reason     text;

-- K = 0 through grade 12, matching skills.ccss_grade_num. Null stays valid.
alter table public.students drop constraint if exists students_working_grade_range;
alter table public.students add constraint students_working_grade_range
  check (working_grade is null or working_grade between 0 and 12);

comment on column public.students.working_grade is
  'EARNED skill grade (K=0..12), null until first promotion; app defaults it to grade. '
  'Governs how far UP the practice ladder reaches. Does NOT govern content '
  'age-appropriateness, which stays pinned to students.grade.';
comment on column public.students.working_grade_updated_at is
  'When working_grade last moved.';
comment on column public.students.working_grade_reason is
  'Why working_grade last moved, e.g. "cleared every grade 9 math skill".';

-- NOT BACKFILLED ON PURPOSE. Leaving working_grade null for the 37 existing students
-- keeps them at their chronological grade (the app coalesces null to grade), so this
-- migration changes nobody's ceiling on the day it runs. Promotions accrue from real
-- evidence going forward.

commit;
