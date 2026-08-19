-- ===========================================================================
-- 0027_clear_discarded_placement_runs.sql
--
-- OPTIONAL. The code fix stands on its own; this only cleans up two students
-- whose stored state is an artifact of the bug. Read the whole header before
-- running it, because it DELETES rows and there is no undo.
--
-- HOW TO APPLY: paste into the Supabase SQL editor and run against
-- papiowjjoyhnbyhgtbxq. Idempotent (re-running finds nothing to delete).
--
-- ---------------------------------------------------------------------------
-- WHAT WENT WRONG
-- ---------------------------------------------------------------------------
-- listPracticeableSkills read every published question in one unbounded select.
-- PostgREST silently capped that at max-rows (1000 of 2850), and because the
-- truncated slice defined which skills exist, whole grades collapsed. Grade 12
-- showed ONE skill, so the placement diagnostic served a ONE-question run, which
-- is below PLACEMENT_MIN_QUESTIONS (4). A below-floor run is deliberately
-- discarded rather than seeded, and the gate deciding whether to offer placement
-- read student_skill_mastery only. Nothing was ever seeded, so the identical
-- one-question check was offered again on every visit.
--
-- ---------------------------------------------------------------------------
-- WHY THESE ROWS
-- ---------------------------------------------------------------------------
-- The two students below have diagnostic attempts and NO mastery row. That
-- combination only happens when a run was discarded, so these attempts are
-- residue of runs the product threw away, not placement data anyone can use.
--
--   Junia  7c80043d-1a58-4faf-b3af-8b3f8c159351  grade 12  10 attempts
--   Becca  b704e05c-8461-4e33-8911-9d4a22b447cb  grade 8    3 attempts
--
-- Junia is school_covered, Becca is not. The bug never read coverage; they are
-- here for the same reason.
--
-- ---------------------------------------------------------------------------
-- YOU PROBABLY DO NOT NEED THIS
-- ---------------------------------------------------------------------------
-- After the code fix, hasPlacement() counts their answers, so neither child is
-- pinned on the offer any more: both reach Skills building and get a lesson.
-- What they lack is a real placement, and either of them can get one in a single
-- tap from the child's home screen or the parent dashboard ("reassess", which
-- passes ?fresh=1). That path is non-destructive and now produces a full rung of
-- 6 to 13 questions.
--
-- Run this ONLY if you would rather the app offer placement to them
-- automatically on next visit instead of waiting for someone to tap reassess.
--
-- COST: 13 question_attempts rows are permanently deleted. They are diagnostic
-- answers, not graded practice, so nothing downstream reads them: mastery is
-- empty for both students, and readiness/evidence count non-diagnostic attempts
-- only. THERE IS NO ROLLBACK. Take a snapshot first if that matters to you.
-- ===========================================================================

begin;

-- ---------------------------------------------------------------------------
-- BEFORE. Expect the two rows described above.
-- ---------------------------------------------------------------------------
select st.first_name,
       st.grade,
       st.school_covered,
       count(a.id) as discarded_diagnostic_attempts
  from public.students st
  join public.question_attempts a
    on a.student_id = st.id
   and a.is_diagnostic
 where st.id not in (select student_id from public.student_skill_mastery)
 group by st.first_name, st.grade, st.school_covered
 order by st.grade;

-- ---------------------------------------------------------------------------
-- The delete. Scoped by the same "attempts but no mastery" shape, so it can
-- never touch a student who has been genuinely placed, and re-running it after
-- a fresh placement is a no-op.
--
-- is_diagnostic is in the predicate on purpose: a graded practice attempt is
-- real evidence and must survive even for an unplaced student.
-- ---------------------------------------------------------------------------
delete from public.question_attempts a
 where a.is_diagnostic
   and a.student_id not in (select student_id from public.student_skill_mastery);

-- ---------------------------------------------------------------------------
-- AFTER. Expect ZERO rows. Both students will be offered a real placement on
-- their next visit to Skills building, and the grade 12 rung is now 6 questions
-- rather than 1, so the run seeds instead of being discarded.
-- ---------------------------------------------------------------------------
select st.first_name,
       st.grade,
       count(a.id) as remaining_diagnostic_attempts
  from public.students st
  join public.question_attempts a
    on a.student_id = st.id
   and a.is_diagnostic
 where st.id not in (select student_id from public.student_skill_mastery)
 group by st.first_name, st.grade;

commit;

-- ---------------------------------------------------------------------------
-- ROLLBACK: none. Deleted attempts are gone. The students are unharmed either
-- way: they simply take the placement check once, which is what should have
-- happened the first time.
-- ---------------------------------------------------------------------------
