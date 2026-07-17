-- ===========================================================================
-- 0012_app_managed_trial.sql — move the 7-day trial from Stripe into the app
--
-- We stop asking Stripe to run the free trial (no trial_period_days at checkout,
-- no Stripe object created at signup). Instead a new parent account starts an
-- APP-MANAGED trial: subscription_status = 'free_trial' with trial_end 7 days out.
-- Subscribing later charges immediately and flips the status to 'active'.
--
-- What this migration establishes:
--   profiles.has_trialed  — one free trial per account (set true when it starts).
--   profiles.paid_seats   — seat cap once subscribed (included plan seats + the
--                           Additional Child add-on quantity from the webhook).
--   profiles.trial_end / current_period_end — ensured present (see docs/webhook-schema.sql).
--   students.active        — whether a child profile counts against the seat cap.
--   A BEFORE INSERT trigger on profiles that stamps the trial window on new rows,
--   so the trial starts the moment handle_new_user creates the profile — no Stripe.
--
-- HOW TO APPLY: paste into the Supabase SQL editor (project ref papiowjjoyhnbyhgtbxq)
-- and run. Idempotent — safe to re-run.
-- ===========================================================================

begin;

-- 1) New columns -------------------------------------------------------------
alter table public.profiles
  add column if not exists has_trialed boolean not null default false,
  add column if not exists paid_seats  integer,
  -- These two are also in docs/webhook-schema.sql; add-if-not-exists here so the
  -- app-managed trial works even on a DB where that doc step was never applied.
  add column if not exists trial_end          timestamptz,
  add column if not exists current_period_end timestamptz,
  -- Trial-email idempotency (api/trial-emails.ts cron): stamped once each mail
  -- is sent so the Day-5 reminder and Day-7 "ended" email fire at most once.
  add column if not exists trial_reminder_sent_at    timestamptz,
  add column if not exists trial_ended_email_sent_at timestamptz;

-- A child profile counts against the seat cap only while active. New children
-- are active; over-cap children are marked inactive by the parent's seat picker
-- (never deleted). Existing rows backfill to active (default) — honest, since
-- they were usable before this migration.
alter table public.students
  add column if not exists active boolean not null default true;

-- 2) Start the trial on new profiles ----------------------------------------
-- handle_new_user (trigger on auth.users) inserts a bare profiles row. Rather
-- than redefine that function, a dedicated BEFORE INSERT trigger on profiles
-- stamps the app-managed trial window when a row arrives with no subscription
-- state. This is the single place the trial "starts", so has_trialed is set here.
create or replace function public.pathwayed_start_trial()
returns trigger
language plpgsql
as $$
begin
  -- Only stamp a brand-new, unsubscribed profile. A row that already carries a
  -- subscription_status (e.g. a future backfill/import) is left untouched.
  if new.subscription_status is null then
    new.subscription_status := 'free_trial';
    new.trial_end           := now() + interval '7 days';
    new.has_trialed         := true;
  end if;
  return new;
end;
$$;

drop trigger if exists profiles_start_trial on public.profiles;
create trigger profiles_start_trial
  before insert on public.profiles
  for each row
  execute function public.pathwayed_start_trial();

-- 3) Backfill existing rows --------------------------------------------------
-- Existing parents who never subscribed (null status) get the same app-managed
-- trial, dated from now. Anyone who already has a subscription_status (the one
-- live 'trialing' sub, or any 'active'/'past_due'/'canceled') is NOT re-trialed;
-- we only record that they have consumed their trial.
update public.profiles
   set subscription_status = 'free_trial',
       trial_end           = coalesce(trial_end, now() + interval '7 days'),
       has_trialed         = true
 where subscription_status is null;

update public.profiles
   set has_trialed = true
 where subscription_status is not null
   and has_trialed = false;

-- Seat cap for already-subscribed rows: included plan seats + stored extra_kids.
-- (elementary=1, middle=2, high=2 — mirrors INCLUDED_SEATS in api/billing-core.ts.)
update public.profiles
   set paid_seats = case plan
                      when 'elementary' then 1
                      when 'middle'     then 2
                      when 'high'       then 2
                      else 0
                    end + coalesce(extra_kids, 0)
 where subscription_status in ('active', 'trialing', 'past_due')
   and paid_seats is null;

-- 4) Grants ------------------------------------------------------------------
-- The client reads its own profile and toggles students.active under RLS as the
-- authenticated role; the webhook writes profiles as the service role (which
-- bypasses grants + RLS). New columns are covered by the existing table-level
-- grants, but we assert intent explicitly so a tightened-grant project stays correct.
grant select, update on public.profiles to authenticated;
grant select, update on public.students to authenticated;

commit;

-- 5) service_role grant verification (our standard) --------------------------
-- Confirm the service role can still write the columns the Stripe webhook and
-- the trial-email cron depend on. Supabase grants ALL to service_role by default;
-- this block FAILS LOUDLY if that ever regressed, instead of the webhook silently
-- no-op'ing writes. Run separately from the transaction above so a failure here
-- doesn't roll back the schema change (the schema is correct; the grant is the alarm).
do $$
begin
  if not has_table_privilege('service_role', 'public.profiles', 'UPDATE') then
    raise exception 'service_role is missing UPDATE on public.profiles';
  end if;
  if not has_table_privilege('service_role', 'public.students', 'UPDATE') then
    raise exception 'service_role is missing UPDATE on public.students';
  end if;
  if not has_column_privilege('service_role', 'public.profiles', 'paid_seats', 'UPDATE') then
    raise exception 'service_role is missing UPDATE on public.profiles.paid_seats';
  end if;
  if not has_column_privilege('service_role', 'public.profiles', 'has_trialed', 'UPDATE') then
    raise exception 'service_role is missing UPDATE on public.profiles.has_trialed';
  end if;
  raise notice 'service_role grant verification passed for profiles + students';
end;
$$;
