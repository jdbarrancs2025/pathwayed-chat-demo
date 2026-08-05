-- ===========================================================================
-- cleanup_demo_test_attempts.sql - remove testing residue from the Demo Student.
--
-- SCOPE: student ba7b54ea-c352-4379-a95d-760a8b058dcc ONLY, and within that only
-- the multiplication and fractions skills. Every statement carries the student id,
-- so it cannot touch another account even if run twice or partially.
--
-- WHAT IS THERE (measured 2026-08-05):
--   multiplication  15 graded attempts  -> student_skill_mastery: practicing, 60.0%, 15 counted
--   fractions        2 graded attempts  -> student_skill_mastery: practicing, 100.0%, 2 counted
--   0 diagnostic attempts on either.
-- Neither mastery row is created by migrations/demo/seed_demo_student.sql, so both
-- are testing residue and removing them returns the account to its seeded state.
--
-- WHY A MANUAL RECOMPUTE IS REQUIRED.
-- The mastery engine is kept fresh by question_attempts_recompute_mastery, which is
-- an AFTER INSERT trigger and nothing else. Verified against the live database:
--   on_insert = true, on_update = false, on_delete = false.
-- So deleting attempts does NOT recompute anything. Without step 2 the mastery rows
-- would keep claiming 15 and 2 counted attempts with zero attempts behind them,
-- which is worse than leaving the data alone.
--
-- WHAT recompute_skill_mastery(student, skill) DOES: it re-reads every graded,
-- non-diagnostic question_attempts row for that pair and rewrites status,
-- evidence_accuracy, attempts_counted, first_bar_met_at and computed_at from
-- scratch. With no attempts left it writes status='not_started',
-- evidence_accuracy=null, attempts_counted=0. It is SECURITY DEFINER and revoked
-- from anon/authenticated, so run this as the SQL editor's owner role.
-- Note it never clears recheck_passed_at (that is deliberately durable), which is
-- irrelevant here since neither row has one.
-- ===========================================================================

begin;

-- ---------------------------------------------------------------------------
-- 1. Delete the attempts. Scoped to one student and two skills.
-- ---------------------------------------------------------------------------
delete from public.question_attempts qa
 using public.skills sk
 where sk.id = qa.skill_id
   and qa.student_id = 'ba7b54ea-c352-4379-a95d-760a8b058dcc'
   and sk.slug in ('multiplication', 'fractions');
-- Expect: DELETE 17

-- ---------------------------------------------------------------------------
-- 2. Recompute, because no trigger fires on delete.
-- ---------------------------------------------------------------------------
select public.recompute_skill_mastery(
         'ba7b54ea-c352-4379-a95d-760a8b058dcc'::uuid,
         (select id from public.skills where slug = 'multiplication'));

select public.recompute_skill_mastery(
         'ba7b54ea-c352-4379-a95d-760a8b058dcc'::uuid,
         (select id from public.skills where slug = 'fractions'));

-- ---------------------------------------------------------------------------
-- 3. Remove the now-empty rows entirely, so the two skills disappear from the
--    dashboard rather than sitting there as "Not enough yet". Safe because
--    neither is part of the demo seed. Delete this block if you would rather keep
--    them visible at zero.
-- ---------------------------------------------------------------------------
delete from public.student_skill_mastery ssm
 using public.skills sk
 where sk.id = ssm.skill_id
   and ssm.student_id = 'ba7b54ea-c352-4379-a95d-760a8b058dcc'
   and sk.slug in ('multiplication', 'fractions')
   and ssm.attempts_counted = 0;
-- Expect: DELETE 2

-- ---------------------------------------------------------------------------
-- VERIFY BEFORE COMMITTING.
-- ---------------------------------------------------------------------------
-- Expect: 0 rows.
select sk.slug, count(*) as remaining_attempts
from public.question_attempts qa
join public.skills sk on sk.id = qa.skill_id
where qa.student_id = 'ba7b54ea-c352-4379-a95d-760a8b058dcc'
  and sk.slug in ('multiplication', 'fractions')
group by 1;

-- Expect: the 9 seeded skills only, with multiplication and fractions absent.
select sk.slug, ssm.status, ssm.evidence_accuracy, ssm.attempts_counted
from public.student_skill_mastery ssm
join public.skills sk on sk.id = ssm.skill_id
where ssm.student_id = 'ba7b54ea-c352-4379-a95d-760a8b058dcc'
order by ssm.attempts_counted desc, sk.slug;

-- Expect: 0. Proves no other student was touched.
select count(*) as other_students_affected
from public.question_attempts qa
join public.skills sk on sk.id = qa.skill_id
where sk.slug in ('multiplication', 'fractions')
  and qa.student_id <> 'ba7b54ea-c352-4379-a95d-760a8b058dcc'
  and qa.created_at::date = current_date;

commit;
