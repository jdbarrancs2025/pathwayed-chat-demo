-- ===========================================================================
-- backfill_covered_entitlements.sql — grant prep modules to students who were
--                                     already marked school_covered
--
-- One-off backfill for the rule api/school-login.ts now applies on every covered
-- sign-in: a school-covered student gets every prep module whose gradeBand
-- contains their grade. Students who signed in before that shipped would
-- otherwise wait until their next sign-in; this catches them now.
--
-- The grade drives the grant, not the school:
--   HSPT  grades 6-8    (src/lib/prep/hspt.ts)
--   ISEE  grades 6-8    (src/lib/prep/isee.ts)
--   SAT   grades 9-12   (src/lib/prep/sat.ts)
-- If a module is added to src/lib/prep/registry.ts, add its band to the
-- prep_bands CTE below before re-running.
--
-- Matches school-login.ts exactly:
--   - status 'active', stripe_subscription_item_id null (nobody paid Stripe),
--     ends_at null;
--   - idempotent, via the (student_id, module_id) unique constraint from
--     migration 0015 — re-running inserts nothing new;
--   - never a downgrade: an entitlement already in an entitled status
--     ('active' / 'past_due') is left alone, and a Stripe-backed row is never
--     written even when it is canceled;
--   - a lapsed school-covered row (canceled, no Stripe item) is reactivated.
--
-- prep_entitlements is read-only to authenticated (migration 0015): only the
-- service role writes it. The Supabase SQL editor runs as a superuser role that
-- bypasses RLS, so this works there. Do not port it to a client call.
--
-- HOW TO APPLY: paste into the Supabase SQL editor (project ref
-- papiowjjoyhnbyhgtbxq) and run. Safe to re-run.
-- ===========================================================================

begin;

-- Module grade bands, mirroring src/lib/prep/registry.ts.
with prep_bands (module_id, lo, hi) as (
  values
    ('hspt', 6, 8),
    ('isee', 6, 8),
    ('sat',  9, 12)
),

-- Every covered student paired with each module their grade qualifies for.
-- 'K' maps to 0 like gradeNumber() in src/lib/prep/access.ts; any other
-- non-numeric grade maps to -1 and therefore matches no band.
covered as (
  select
    s.id as student_id,
    case
      when upper(trim(s.grade)) = 'K' then 0
      when trim(s.grade) ~ '^[0-9]+$' then (trim(s.grade))::int
      else -1
    end as grade_num
  from public.students s
  where s.school_covered = true
),
grants as (
  select c.student_id, b.module_id
  from covered c
  join prep_bands b on c.grade_num between b.lo and b.hi
),

-- Reactivate a lapsed school-covered row. The stripe_subscription_item_id is
-- null check is what keeps real billing state untouched.
reactivated as (
  update public.prep_entitlements e
  set status = 'active', ends_at = null
  from grants g
  where e.student_id = g.student_id
    and e.module_id = g.module_id
    and e.status not in ('active', 'past_due')
    and e.stripe_subscription_item_id is null
  returning e.student_id, e.module_id
)

-- Insert the missing rows. ON CONFLICT DO NOTHING leaves every existing row as
-- it is, including the Stripe-backed ones skipped above.
insert into public.prep_entitlements
  (student_id, module_id, status, stripe_subscription_item_id, ends_at)
select g.student_id, g.module_id, 'active', null, null
from grants g
on conflict (student_id, module_id) do nothing;

commit;

-- Verification: covered students and the modules they now hold.
-- select s.id, s.first_name, s.grade, e.module_id, e.status
-- from public.students s
-- left join public.prep_entitlements e on e.student_id = s.id
-- where s.school_covered = true
-- order by s.grade, s.first_name, e.module_id;
