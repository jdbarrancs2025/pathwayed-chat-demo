-- ===========================================================================
-- 0014_fix_trial_trigger.sql — fix the app-managed trial not starting on signup
--
-- BUG: new accounts (email and Google OAuth alike) were landing with
-- subscription_status = 'inactive' and a null trial_end instead of the intended
-- 'free_trial' + 7-day window. Root cause: migration 0012's BEFORE INSERT trigger
-- pathwayed_start_trial() only stamps the trial when subscription_status IS NULL,
-- but the profiles row is created (by handle_new_user / the column default) with
-- subscription_status = 'inactive' — a non-null value — so the guard never fires.
-- The trigger may also never have landed on this project at all.
--
-- FIX: widen the guard to start the trial for a brand-new profile that has never
-- trialed and carries no real subscription yet (status null OR 'inactive'), and
-- (re)create the function + trigger idempotently so it is definitely present.
-- has_trialed = true short-circuits it, so an account is NEVER re-granted a trial.
--
-- HOW TO APPLY: paste into the Supabase SQL editor (project ref papiowjjoyhnbyhgtbxq)
-- and run. Idempotent — safe to re-run. Sections 1-2 are the live fix; section 3
-- is a one-time backfill you can eyeball (count preview) before running.
-- ===========================================================================

begin;

-- 1) Widened trial-start function -------------------------------------------
-- Fires for a genuinely new, never-trialed profile whose status is either null
-- or the observed default 'inactive'. Any other status (a real/paid/managed
-- state, or an already-trialed account) is left untouched.
create or replace function public.pathwayed_start_trial()
returns trigger
language plpgsql
as $$
begin
  if coalesce(new.has_trialed, false) = false
     and (new.subscription_status is null or new.subscription_status = 'inactive') then
    new.subscription_status := 'free_trial';
    new.trial_end           := now() + interval '7 days';
    new.has_trialed         := true;
  end if;
  return new;
end;
$$;

-- 2) (Re)create the BEFORE INSERT trigger -----------------------------------
-- Drop/create so this is correct even if 0012's trigger never landed on this
-- project (or landed against a different one).
drop trigger if exists profiles_start_trial on public.profiles;
create trigger profiles_start_trial
  before insert on public.profiles
  for each row
  execute function public.pathwayed_start_trial();

commit;

-- ===========================================================================
-- 3) BACKFILL (one-time) — repair accounts already created without a trial
-- ===========================================================================
-- These ran under the broken guard, so they sit at 'inactive' / null trial_end
-- with has_trialed still false. Same guard as the trigger: never touches an
-- account that has already trialed or holds any other status.
--
-- STEP 3a — PREVIEW: run this SELECT first and eyeball the count before the
-- UPDATE below. This is how many rows the backfill will change.
select count(*) as rows_to_backfill
from public.profiles
where coalesce(has_trialed, false) = false
  and (subscription_status is null or subscription_status = 'inactive');

-- STEP 3b — APPLY: run this only after the count above looks right.
-- update public.profiles
--    set subscription_status = 'free_trial',
--        trial_end           = coalesce(trial_end, now() + interval '7 days'),
--        has_trialed         = true
--  where coalesce(has_trialed, false) = false
--    and (subscription_status is null or subscription_status = 'inactive');
