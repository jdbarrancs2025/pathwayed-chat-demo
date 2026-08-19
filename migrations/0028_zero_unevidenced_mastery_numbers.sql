-- ===========================================================================
-- 0028_zero_unevidenced_mastery_numbers.sql
--
-- Removes a misleading NUMBER from 120 rows. Keeps every row, keeps every
-- history value, deletes nothing.
--
-- HOW TO APPLY: paste into the Supabase SQL editor and run against
-- papiowjjoyhnbyhgtbxq. Idempotent, and safe to re-run.
--
-- ---------------------------------------------------------------------------
-- WHAT THESE ROWS ARE
-- ---------------------------------------------------------------------------
-- 120 of the 147 rows in student_skill_mastery have:
--
--     status            = 'not_started'
--     attempts_counted  = 0            (no graded evidence at all)
--     computed_at       IS NULL        (the 0010 trigger has never touched them)
--     mastery_percentage > 0           (a number nothing earned)
--
-- They were written by two paths that pre-date the evidence engine: the
-- end-of-session write in recordSessionMastery (removed in the commit that
-- accompanies this migration) and seedDiagnosticMastery. computed_at IS NULL is
-- an exact discriminator: all 27 rows with real evidence have it set.
--
-- ---------------------------------------------------------------------------
-- WHY NOT JUST DELETE THE ROWS
-- ---------------------------------------------------------------------------
-- Because hasPlacement() treats "a mastery row exists" as "this child has been
-- placed". Deleting these would flip 8 children who genuinely completed a
-- placement back to unplaced and re-offer them the check. That trades an inert
-- row for a live regression, which is a bad trade.
--
-- The rows themselves are honest. status is 'not_started' and attempts_counted
-- is 0, which is exactly right: we have not measured these skills. Only
-- mastery_percentage and accuracy claim otherwise.
--
-- ---------------------------------------------------------------------------
-- WHY BOTHER, IF NOTHING READS IT
-- ---------------------------------------------------------------------------
-- Nothing does today. masteryDisplay gates on attempts_counted <= 0 and shows
-- "not enough practice yet" with no number; recordReadiness selects status,
-- evidence_accuracy and attempts_counted; nextLesson reads status only.
--
-- The risk is the next query someone writes. A row reading mastery_percentage=60
-- inside a table called student_skill_mastery invites exactly one mistake, and
-- this codebase has already made it: nextLesson used to fall back to that column,
-- and the comment recording the fix notes that 52 of the 58 rows the fallback
-- trusted had ZERO counted attempts. Leaving the number in place leaves the trap
-- armed.
-- ===========================================================================

begin;

-- ---------------------------------------------------------------------------
-- BEFORE. Expect 120 rows, all not_started, all with a number to remove.
-- ---------------------------------------------------------------------------
select count(*)                                            as unevidenced_rows,
       count(*) filter (where mastery_percentage > 0)       as with_a_number,
       count(*) filter (where legacy_self_rating_mastery is null) as not_yet_archived
  from public.student_skill_mastery
 where computed_at is null;

-- ---------------------------------------------------------------------------
-- 1. ARCHIVE FIRST. Migration 0010 snapshotted the pre-0010 self-rated values
--    into legacy_self_rating_mastery, but rows written AFTER 0010 never got that
--    treatment. This catches them, so step 2 destroys no history and the change
--    stays reversible.
--
--    Guarded on IS NULL so a re-run cannot overwrite a real archived value with
--    an already-zeroed one.
-- ---------------------------------------------------------------------------
update public.student_skill_mastery
   set legacy_self_rating_mastery = mastery_percentage
 where computed_at is null
   and legacy_self_rating_mastery is null;

-- ---------------------------------------------------------------------------
-- 2. THEN ZERO. Both columns are NOT NULL default 0, so 0 is the schema's own
--    "nothing here", and it is what a freshly created row would carry anyway.
--
--    status, attempts_counted, first_bar_met_at, recheck_passed_at and
--    computed_at are all left alone: they are already correct, and computed_at
--    staying NULL keeps this predicate meaningful if the migration is re-run.
-- ---------------------------------------------------------------------------
update public.student_skill_mastery
   set mastery_percentage = 0,
       accuracy           = 0
 where computed_at is null;

-- ---------------------------------------------------------------------------
-- AFTER. Expect: 120 rows still present, all zeroed, all archived, and the
-- evidenced rows untouched at 2 advanced / 2 mastered / 23 practicing.
-- ---------------------------------------------------------------------------
select count(*)                                                as unevidenced_rows,
       count(*) filter (where mastery_percentage = 0 and accuracy = 0) as zeroed,
       count(*) filter (where legacy_self_rating_mastery is not null)  as archived
  from public.student_skill_mastery
 where computed_at is null;

select status, count(*) as rows
  from public.student_skill_mastery
 where computed_at is not null
 group by status
 order by status;

commit;

-- ---------------------------------------------------------------------------
-- ROLLBACK. The archive step is what makes this possible.
-- ---------------------------------------------------------------------------
-- update public.student_skill_mastery
--    set mastery_percentage = legacy_self_rating_mastery,
--        accuracy           = legacy_self_rating_mastery
--  where computed_at is null
--    and legacy_self_rating_mastery is not null;
--
-- Note this restores mastery_percentage and accuracy to the SAME archived value.
-- They were not necessarily equal before: the archive column holds only
-- mastery_percentage. If that distinction ever matters, snapshot the table
-- instead of relying on this rollback.
-- ---------------------------------------------------------------------------
