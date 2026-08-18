-- ===========================================================================
-- 0026_junia_interim_sat_access.sql - SAT access for one covered student, now.
--
-- HOW TO APPLY: paste into the Supabase SQL editor and run against
-- papiowjjoyhnbyhgtbxq. Idempotent, and safe to run before or after 0025.
--
-- WHO. junia.tenney27@pallottihs.info
--   profile  e9499e87-8070-4d36-b225-385aad1605c9  (plan null, free_trial)
--   student  7c80043d-1a58-4faf-b3af-8b3f8c159351  (Junia, grade 12)
-- Linked by students.parent_id = the auth uid, which is also profiles.id.
-- Her trial_end is 2026-08-25, so this needs to be in place before then.
--
-- WHY NOT school_covered. Until 0025 is applied, students.school_covered is
-- writable by any signed-in parent, so it is not yet an access grant worth
-- leaning on. prep_entitlements is the opposite: its only policy is
--
--   "read own children prep entitlements" | SELECT | using (owns_student(...))
--
-- with no insert or update policy at all, so the client cannot write it and RLS
-- denies by default. It is the one gate in the product that already holds.
--
-- THIS IS NOT A WORKAROUND THAT LATER NEEDS UNDOING. It writes exactly the row
-- api/school-login.ts already writes for a covered student, byte for byte: status
-- 'active', a NULL stripe_subscription_item_id (so nothing bills and no webhook
-- owns it), and no ends_at. When the Dean link starts working,
-- grantCoveredPrepEntitlements() reads this row, sees an entitled status, and
-- leaves it untouched. It never downgrades and never duplicates: the insert is an
-- ON CONFLICT DO NOTHING against the (student_id, module_id) unique constraint.
--
-- WHAT IT GRANTS, AND WHAT IT DOES NOT.
--   GRANTS: the SAT prep module. Its six kid-facing gates all ask the same
--   question, "is there a row for this student and module in an entitled status",
--   in PrepModuleTiles, testReadinessLoad, and the PrepModuleHome /
--   PrepTimedSection / PrepReview / PrepEssay route guards.
--
--   DOES NOT TOUCH THE TRIAL LOCK. SubscriptionGate wraps KidHome, sessions,
--   homework help and Practice SAT; the /prep routes deliberately sit OUTSIDE it
--   so a prep-only family can still reach what they paid for. So after 2026-08-25
--   this alone leaves Junia able to open SAT prep by direct link while her home
--   screen shows the subscribe prompt. Fixing that is the second statement below,
--   which needs 0025 applied first.
--
--   DOES NOT CHANGE SAT FRAMING. above_grade_ok stays false, so the kid-facing SAT
--   voice and the Practice SAT entry point stay off. That is grade plus parent
--   preference, deliberately left alone.
-- ===========================================================================

begin;

-- ---------------------------------------------------------------------------
-- 1. The entitlement. Run this one on its own if 0025 is not applied yet.
-- ---------------------------------------------------------------------------
insert into public.prep_entitlements
  (student_id, module_id, status, stripe_subscription_item_id, ends_at)
values
  ('7c80043d-1a58-4faf-b3af-8b3f8c159351', 'sat', 'active', null, null)
on conflict (student_id, module_id) do nothing;

-- ---------------------------------------------------------------------------
-- 2. Coverage, which is what exempts her from the day-seven lock.
--
-- APPLY 0025 FIRST. Setting this column while it is still parent-writable is
-- harmless for Junia herself, but the app only starts READING it as an access
-- grant once the service role is its only writer. Running 0025 first is what
-- makes that true.
--
-- This is the same value api/school-login.ts sets after a verified Dean resolve,
-- so a later real resolve is a no-op rather than a correction. dean_student_id is
-- deliberately left NULL: that is the Dean console's identity to issue, and
-- inventing one here would fake the link this row does not have.
-- ---------------------------------------------------------------------------
update public.students
   set school_covered = true
 where id = '7c80043d-1a58-4faf-b3af-8b3f8c159351';

-- ---------------------------------------------------------------------------
-- VERIFY BEFORE COMMITTING. Expect one row:
--   Junia | 12 | school_covered t | dean_student_id NULL | sat | active | NULL
-- ---------------------------------------------------------------------------
select s.first_name,
       s.grade,
       s.school_covered,
       s.dean_student_id,
       e.module_id,
       e.status,
       e.stripe_subscription_item_id
from public.students s
left join public.prep_entitlements e on e.student_id = s.id
where s.id = '7c80043d-1a58-4faf-b3af-8b3f8c159351';

commit;

-- ---------------------------------------------------------------------------
-- ROLLBACK.
-- ---------------------------------------------------------------------------
-- update public.students set school_covered = false
--  where id = '7c80043d-1a58-4faf-b3af-8b3f8c159351';
-- delete from public.prep_entitlements
--  where student_id = '7c80043d-1a58-4faf-b3af-8b3f8c159351'
--    and module_id = 'sat'
--    and stripe_subscription_item_id is null;
