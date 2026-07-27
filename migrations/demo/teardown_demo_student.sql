-- ===========================================================================
-- teardown_demo_student.sql  --  removes the demo child and every seeded row.
-- Project: papiowjjoyhnbyhgtbxq  (tutoring / pathwayed-chat-demo)
--
-- Run this after the demo. Deletes ONLY the students row named "Demo Student"
-- owned by phillip.tomlin@dmvdream.org, plus every child row keyed to it.
-- Matching on parent_id AND first_name means no other child, and no other
-- family, can be caught by this.
--
-- Most of these tables are ON DELETE CASCADE from students, so deleting the
-- child alone would be enough. The explicit deletes run first anyway so the
-- counts are visible and the intent does not depend on cascade behaviour
-- staying as it is today.
--
-- It also cleans up rows the APP wrote during the demo, not just the seed:
-- readiness_scores (recomputed on first dashboard view), question_attempts and
-- mastery_snapshots (written while you drive a live session), and any prep rows
-- if you open a Prep module. That is the difference between "undo the seed" and
-- "leave no trace", and you want the second one.
-- ===========================================================================

begin;

-- Preview what is about to go. Check this before committing.
with demo as (
  select s.id from public.students s
  join public.profiles p on p.id = s.parent_id
  where lower(p.email) = 'phillip.tomlin@dmvdream.org'
    and s.first_name = 'Demo Student'
)
select 'students'              as what, count(*) from public.students              where id         in (select id from demo)
union all select 'sessions',              count(*) from public.sessions              where student_id in (select id from demo)
union all select 'feedback',              count(*) from public.feedback              where student_id in (select id from demo)
union all select 'student_skill_mastery', count(*) from public.student_skill_mastery where student_id in (select id from demo)
union all select 'student_focus_skills',  count(*) from public.student_focus_skills  where student_id in (select id from demo)
union all select 'readiness_scores',      count(*) from public.readiness_scores      where student_id in (select id from demo)
union all select 'question_attempts',     count(*) from public.question_attempts     where student_id in (select id from demo)
union all select 'mastery_snapshots',     count(*) from public.mastery_snapshots     where student_id in (select id from demo)
union all select 'prep_entitlements',     count(*) from public.prep_entitlements     where student_id in (select id from demo)
union all select 'prep_settings',         count(*) from public.prep_settings         where student_id in (select id from demo)
union all select 'prep_attempts',         count(*) from public.prep_attempts         where student_id in (select id from demo)
union all select 'prep_essay_attempts',   count(*) from public.prep_essay_attempts   where student_id in (select id from demo);

-- --- Delete children of the demo student -----------------------------------
-- The temp table pins the id list, so every delete below targets exactly the
-- same student even though the students row is removed at the end.
create temporary table demo_student_ids on commit drop as
select s.id
from public.students s
join public.profiles p on p.id = s.parent_id
where lower(p.email) = 'phillip.tomlin@dmvdream.org'
  and s.first_name = 'Demo Student';

delete from public.prep_essay_attempts   where student_id in (select id from demo_student_ids);
delete from public.prep_attempts         where student_id in (select id from demo_student_ids);
delete from public.prep_settings         where student_id in (select id from demo_student_ids);
delete from public.prep_entitlements     where student_id in (select id from demo_student_ids);
delete from public.mastery_snapshots     where student_id in (select id from demo_student_ids);
delete from public.question_attempts     where student_id in (select id from demo_student_ids);
delete from public.readiness_scores      where student_id in (select id from demo_student_ids);
delete from public.student_focus_skills  where student_id in (select id from demo_student_ids);
delete from public.student_skill_mastery where student_id in (select id from demo_student_ids);
delete from public.feedback              where student_id in (select id from demo_student_ids);
delete from public.sessions              where student_id in (select id from demo_student_ids);

-- generated_questions carries a student_id for per-student generated items.
-- Only rows tied to the demo student are removed; the shared bank is untouched.
delete from public.generated_questions   where student_id in (select id from demo_student_ids);

-- --- Finally the child itself ----------------------------------------------
delete from public.students where id in (select id from demo_student_ids);

commit;

-- ===========================================================================
-- RESTORE THE TRIAL WINDOW  --  run ONLY if you ran the trial extension in
-- seed_demo_student.sql and want the original expiry back.
--
-- There is no way to recover the exact previous trial_end from the database,
-- so note it down from the ACCESS CHECK query BEFORE extending. Then set it
-- back explicitly here. Leaving the extension in place is harmless: it grants
-- your own account 14 more days and touches no plan, seats, or Stripe state.
-- ===========================================================================
-- update public.profiles
--    set trial_end = '<paste the original timestamp here>'
--  where lower(email) = 'phillip.tomlin@dmvdream.org';

-- --- Verify: every count must be 0 -----------------------------------------
select 'demo children remaining' as what, count(*)
from public.students s
join public.profiles p on p.id = s.parent_id
where lower(p.email) = 'phillip.tomlin@dmvdream.org'
  and s.first_name = 'Demo Student';

-- Your real children should be untouched. Eyeball this list.
select s.first_name, s.grade, s.active
from public.students s
join public.profiles p on p.id = s.parent_id
where lower(p.email) = 'phillip.tomlin@dmvdream.org'
order by s.first_name;
