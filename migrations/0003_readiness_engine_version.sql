-- PathwayEd — Academic OS, Phase 2: readiness engine_version (self-healing).
--
-- HOW TO APPLY: paste into the Supabase SQL editor and run (same flow as the
-- other migrations). Idempotent, additive. Depends on migration 0002.
--
-- Adds engine_version to readiness_scores so a stored row can be detected as
-- computed by an older engine and recomputed on next view (default 0 < current
-- ENGINE_VERSION). The existing RLS policies + grants on readiness_scores
-- already cover the new column (RLS is row-level; no column changes needed).

begin;

alter table public.readiness_scores
  add column if not exists engine_version integer not null default 0;

commit;
