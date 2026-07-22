-- ===========================================================================
-- 0020_mastery_snapshots.sql — per-child mastery/readiness history for
--                              growth-over-time (recorder only; no UI yet)
--
-- Starts capturing a weekly point-in-time copy of each child's readiness/mastery
-- so growth can be charted later against REAL history. There is no way to
-- reconstruct past weeks after the fact — this table exists so we begin recording
-- now. Written ONLY by the service-role cron (api/snapshot-mastery.ts); parents can
-- READ their own children's snapshots under RLS, but never write them.
--
--   payload — a point-in-time copy of the engine's OWN outputs (no new scoring):
--             { readiness: [readiness_scores rows], mastery: [student_skill_mastery
--             rows] }, i.e. overall pathway score + per-subject readiness + per-skill
--             mastery, each in the shape those tables already use. captured_date is
--             the per-day idempotency key (one row per child per day).
--
-- RLS + grants: read-only for authenticated via owns_student() (migration 0001);
-- there is deliberately NO insert/update/delete policy — the cron writes as the
-- service role, which bypasses RLS. Grants are stated explicitly (select only)
-- because RLS without a matching grant yields silent 403s here.
--
-- HOW TO APPLY: paste into the Supabase SQL editor (project ref papiowjjoyhnbyhgtbxq)
-- and run. Idempotent — safe to re-run. No src/lib/database.types.ts change (the
-- browser client does not read this table yet — recorder only, no UI).
-- ===========================================================================

begin;

create table if not exists public.mastery_snapshots (
  id            uuid primary key default gen_random_uuid(),
  student_id    uuid not null references public.students(id) on delete cascade,
  captured_at   timestamptz not null default now(),
  -- Per-day idempotency key: the cron sets this to the run's UTC date, and the
  -- partial unique index below makes a double-run a no-op for the same child+day.
  captured_date date not null default current_date,
  -- Point-in-time copy of the engine's existing outputs (readiness_scores +
  -- student_skill_mastery rows). jsonb so the shape can evolve without a migration.
  payload       jsonb not null default '{}'::jsonb
);

-- Time-series read path: a child's snapshots in captured order.
create index if not exists mastery_snapshots_student_captured_idx
  on public.mastery_snapshots (student_id, captured_at);

-- At most one snapshot per child per day, so a re-trigger (or an overlapping run)
-- cannot write two rows for the same child on the same day. Partial (captured_date
-- is always set here, but the predicate keeps the guarantee scoped to dated rows).
create unique index if not exists mastery_snapshots_one_per_day_idx
  on public.mastery_snapshots (student_id, captured_date)
  where captured_date is not null;

alter table public.mastery_snapshots enable row level security;

-- Read-only for authenticated: snapshots are server-owned. There is deliberately no
-- insert/update/delete policy — the cron writes as the service role (bypasses RLS
-- and grants). A parent can read only their own children's snapshots.
drop policy if exists "read own children mastery snapshots" on public.mastery_snapshots;
create policy "read own children mastery snapshots"
  on public.mastery_snapshots for select
  to authenticated
  using (public.owns_student(student_id));

-- Any write policies from an earlier draft are removed, so read-only is the whole
-- story for authenticated.
drop policy if exists "insert own children mastery snapshots" on public.mastery_snapshots;
drop policy if exists "update own children mastery snapshots" on public.mastery_snapshots;
drop policy if exists "delete own children mastery snapshots" on public.mastery_snapshots;

grant select on public.mastery_snapshots to authenticated;
revoke insert, update, delete on public.mastery_snapshots from authenticated;

commit;

-- service_role grant verification (our standard): the cron writes this table as the
-- service role. Confirm that role can insert, so a tightened-grant project fails
-- loudly here instead of the cron silently no-op'ing. Separate block so a failure is
-- an alarm, not a rollback of the schema above.
do $$
begin
  if not has_table_privilege('service_role', 'public.mastery_snapshots', 'INSERT') then
    raise exception 'service_role is missing INSERT on public.mastery_snapshots';
  end if;
  if not has_table_privilege('service_role', 'public.readiness_scores', 'SELECT') then
    raise exception 'service_role is missing SELECT on public.readiness_scores';
  end if;
  if not has_table_privilege('service_role', 'public.student_skill_mastery', 'SELECT') then
    raise exception 'service_role is missing SELECT on public.student_skill_mastery';
  end if;
  raise notice 'mastery_snapshots ready';
end;
$$;
