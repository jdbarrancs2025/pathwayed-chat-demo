-- PathwayEd — placement diagnostic support (Phase 2/3): additive columns.
--
-- HOW TO APPLY: bun run db:seed migrations/0006_placement_diagnostic.sql
-- Idempotent (add column if not exists); safe to re-run.
--
-- Depends on migration 0001 (public.students) and 0004 (public.question_attempts).

begin;

-- Mark diagnostic-recorded attempts so placement seeding can distinguish them
-- from real practice history. Practice/tutoring attempts stay false (default);
-- only the diagnostic sets true. Lets the seed skip skills the student has
-- actually practiced instead of clobbering their earned mastery.
alter table public.question_attempts
  add column if not exists is_diagnostic boolean not null default false;

-- Per-child parent consent to surface ABOVE-GRADE / SAT framing. The diagnostic
-- still advances the child at their real mastery level regardless of this flag;
-- it governs framing/emphasis ONLY. Default false (grade-focused until a parent
-- opts in).
alter table public.students
  add column if not exists above_grade_ok boolean not null default false;

commit;
