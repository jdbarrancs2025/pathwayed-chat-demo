-- ===========================================================================
-- 0019_admissions_season_email.sql — sent-tracking for the admissions-season email
--
-- The admissions-season email (api/admissions-season-email.ts) goes to parent
-- accounts with a qualifying active plan and at least one grade 6-8 child without a
-- prep entitlement — ONE email per account, when the season opens. It reuses the
-- trial-email idempotency pattern (per-profile timestamp column, migration 0012):
-- the column is stamped once the mail is sent, so a re-run never emails the same
-- account twice.
--
-- HOW TO APPLY: paste into the Supabase SQL editor (project ref papiowjjoyhnbyhgtbxq)
-- and run. Idempotent — safe to re-run. No client/database.types.ts change needed
-- (the column is read/written only by the service-role cron, never the browser).
-- ===========================================================================

begin;

alter table public.profiles
  -- Admissions-season email idempotency: stamped once the season email is sent, so
  -- the manually-triggered send fires at most once per account.
  add column if not exists admissions_season_email_sent_at timestamptz;

commit;

-- service_role sanity (our standard): the cron writes this column as the service
-- role. Confirm it can, so a tightened-grant project fails loudly here instead of
-- the cron silently no-op'ing. Separate block so a failure is an alarm, not a
-- rollback of the column add.
do $$
begin
  if not has_column_privilege('service_role', 'public.profiles', 'admissions_season_email_sent_at', 'UPDATE') then
    raise exception 'service_role is missing UPDATE on public.profiles.admissions_season_email_sent_at';
  end if;
  raise notice 'admissions_season_email_sent_at ready';
end;
$$;
