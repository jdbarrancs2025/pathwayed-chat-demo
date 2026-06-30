-- PathwayEd — Academic OS, Phase 2 / Step 1: readiness (Pathway Score) storage.
--
-- HOW TO APPLY: paste this whole file into the Supabase SQL editor and run it
-- (same flow as migrations/0001). Idempotent — safe to re-run.
--
-- DEPENDS ON migration 0001 (must already be applied): reuses the helper
-- public.owns_student(uuid) and the trigger function public.touch_updated_at().
--
-- SCOPE (additive only): one table, readiness_scores, holding the computed
-- readiness/Pathway Score per student per type ('pathway','math','reading',
-- 'writing', extensible). Written client-side under RLS (Option A), exactly like
-- student_skill_mastery. This is storage only — the AI Coach, Today's Plan,
-- parent dashboard, and SAT consumers are NOT built here.

begin;

create table if not exists public.readiness_scores (
  id              uuid primary key default gen_random_uuid(),
  student_id      uuid not null references public.students(id) on delete cascade,
  -- 'pathway' (overall) plus per-subject types: 'math' | 'reading' | 'writing'.
  -- Kept as free text so new types (e.g. 'sat') can be added without a migration.
  readiness_type  text not null,
  score           numeric(5,2) not null default 0 check (score between 0 and 100),
  -- Top skills (strengths) and weakest skills (gaps); arrays of objects shaped by
  -- the engine (e.g. { slug, name, mastery }). Default empty.
  strengths       jsonb not null default '[]'::jsonb,
  gaps            jsonb not null default '[]'::jsonb,
  -- Highest-leverage weak skill to practice next (a skills.slug), or null.
  next_skill_slug text,
  -- Forward-compat recommendation payload (the AI Coach reads this later).
  recommendations jsonb not null default '[]'::jsonb,
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now(),
  -- One row per (student, readiness_type); drives the engine's upsert onConflict.
  unique (student_id, readiness_type)
);

-- Keep updated_at fresh on update. Reuses public.touch_updated_at() from
-- migration 0001 (not redefined here).
drop trigger if exists trg_readiness_scores_touch on public.readiness_scores;
create trigger trg_readiness_scores_touch
  before update on public.readiness_scores
  for each row execute function public.touch_updated_at();

-- RLS (Option A — client-side writes): a parent can read AND write readiness only
-- for their own children. Both insert and update policies are required because
-- the engine upserts (insert ... on conflict do update). owns_student() is from
-- migration 0001. No delete policy/grant — cleanup happens via the cascade from
-- students.
alter table public.readiness_scores enable row level security;

drop policy if exists "read own children readiness" on public.readiness_scores;
create policy "read own children readiness"
  on public.readiness_scores for select
  to authenticated
  using (public.owns_student(student_id));

drop policy if exists "insert own children readiness" on public.readiness_scores;
create policy "insert own children readiness"
  on public.readiness_scores for insert
  to authenticated
  with check (public.owns_student(student_id));

drop policy if exists "update own children readiness" on public.readiness_scores;
create policy "update own children readiness"
  on public.readiness_scores for update
  to authenticated
  using (public.owns_student(student_id))
  with check (public.owns_student(student_id));

grant select, insert, update on public.readiness_scores to authenticated;

commit;
