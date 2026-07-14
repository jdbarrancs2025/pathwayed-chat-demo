-- ===========================================================================
-- 0011_session_timing.sql — coarse session timing for the school-progress rollup
--
-- The sessions table is one row per (student, subject) holding the saved
-- transcript, touched via upsert (updated_at = last activity). It has no
-- per-sitting start/end, so total_minutes cannot be computed today. This adds a
-- first-touch / last-touch span as a coarse, honest engagement signal:
--   started_at — set once on insert (DB default), preserved across upserts.
--   ended_at   — refreshed on each save (the saveTranscript upsert sets it).
-- The Edge Function caps each row's span (2h) so a subject resumed across days
-- can't inflate the number, and existing rows read ~0 minutes. Real per-sitting
-- timing is a follow-up; this does not claim minutes it cannot defend.
-- ===========================================================================

alter table public.sessions
  add column if not exists started_at timestamptz,
  add column if not exists ended_at   timestamptz;

-- Backfill from the only timestamp we have. started_at = ended_at here, so
-- historical rows contribute 0 minutes (honest: we didn't measure them).
update public.sessions
   set started_at = coalesce(started_at, updated_at),
       ended_at   = coalesce(ended_at, updated_at)
 where started_at is null or ended_at is null;

-- Future inserts get started_at automatically; it is NOT in the upsert payload,
-- so on-conflict updates preserve the original first-touch time.
alter table public.sessions
  alter column started_at set default now(),
  alter column started_at set not null;
