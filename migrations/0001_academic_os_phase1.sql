-- PathwayEd — Academic OS, Phase 1: data backbone + grade-band logic.
--
-- HOW TO APPLY: paste this whole file into the Supabase SQL editor and run it.
-- This repo has no migration runner; schema is applied by hand (see
-- docs/webhook-schema.sql) and src/lib/database.types.ts is hand-maintained to
-- match. This script is idempotent — safe to re-run.
--
-- SCOPE (Phase 1, ADDITIVE ONLY — nothing existing is dropped or altered in a
-- breaking way):
--   * skill taxonomy (Subject -> Domain -> Skill -> MicroSkill) in one
--     self-referential table, keyed for lookup by `slug` (= focusAreas value).
--   * per-student mastery rows, written client-side under RLS (Option A).
--   * two additive columns on `sessions` (skills_practiced, mastery_updates).
--   * one additive column on `students` (learning_preferences).
--
-- DELIBERATELY NOT IN PHASE 1: pathway_score, readiness levels, SAT readiness,
-- the digital twin. `skills.sat_alignment` is a forward-compat text label only.

begin;

-- =====================================================================
-- 1) Enums
-- =====================================================================

-- Grade bands MUST match the canonical resolver gradeBand() in
-- api/teaching-cycle.ts exactly (lowercase). Grade band is derived at runtime
-- from students.grade — it is NOT stored on students.
do $$ begin
  create type public.grade_band as enum ('k-2', '3-5', '6-8', '9-12');
exception when duplicate_object then null; end $$;

-- The four levels of the taxonomy hierarchy.
do $$ begin
  create type public.skill_level as enum ('subject', 'domain', 'skill', 'microskill');
exception when duplicate_object then null; end $$;

-- =====================================================================
-- 2) skills — the taxonomy (global reference data, not per-user)
-- =====================================================================
-- One self-referential table holds all four levels. Mastery is tracked against
-- whichever rows carry a `slug` (the Skill level, matching focusAreas values).
create table if not exists public.skills (
  id                  uuid primary key default gen_random_uuid(),
  level               public.skill_level not null,
  -- Parent in the hierarchy (a Skill's parent is a Domain, etc.). Null for the
  -- top-level Subject rows. Cascade so reseeding a subtree is clean.
  parent_id           uuid references public.skills(id) on delete cascade,
  -- Denormalized app subject ('math' | 'reading' | 'writing') for fast dashboard
  -- filtering by the session's subject. Set on every row.
  subject             text not null,
  -- Human-facing label, e.g. 'Equivalent Fractions'.
  name                text not null,
  -- EXACT focusAreas value (src/lib/focusAreas.ts), e.g. 'fractions','main-idea'.
  -- The Step 3 resolver joins focusAreas value -> skills.slug. Unique when set;
  -- null for rows that have no corresponding focus area (e.g. Subject/Domain).
  slug                text unique,
  -- Grade band this row belongs to (null on Subject/Domain rows that span bands).
  grade_band          public.grade_band,
  -- Forward-compat SAT alignment label (e.g. 'Heart of Algebra'); filled later.
  sat_alignment       text,
  -- Prerequisite skills, stored as an array of prerequisite SLUGS (not UUIDs) so
  -- the taxonomy is hand-seedable and resolves the same way as everything else.
  prerequisite_skills text[] not null default '{}',
  description         text,
  created_at          timestamptz not null default now()
);

create index if not exists skills_parent_id_idx on public.skills (parent_id);
create index if not exists skills_subject_band_level_idx
  on public.skills (subject, grade_band, level);

-- Taxonomy is world-readable reference data for any signed-in user; it is seeded
-- via the SQL editor (table owner, bypasses RLS). No client write policies, so
-- the anon/authenticated clients can read but never modify it.
alter table public.skills enable row level security;

drop policy if exists "skills are readable by authenticated users" on public.skills;
create policy "skills are readable by authenticated users"
  on public.skills for select
  to authenticated
  using (true);

grant select on public.skills to anon, authenticated;

-- =====================================================================
-- 3) owns_student() — ownership helper for RLS (keys on parent_id)
-- =====================================================================
-- SECURITY DEFINER so it can read students regardless of the caller's own RLS,
-- avoiding policy recursion. Pinned search_path per Supabase lint guidance.
create or replace function public.owns_student(p_student_id uuid)
returns boolean
language sql
security definer
set search_path = public
stable
as $$
  select exists (
    select 1
    from public.students s
    where s.id = p_student_id
      and s.parent_id = auth.uid()
  );
$$;

-- =====================================================================
-- 4) student_skill_mastery — per-student mastery (client-written under RLS)
-- =====================================================================
create table if not exists public.student_skill_mastery (
  id                  uuid primary key default gen_random_uuid(),
  student_id          uuid not null references public.students(id) on delete cascade,
  skill_id            uuid not null references public.skills(id) on delete cascade,
  -- 0..100. Phase 1 formula is a simple recency-weighted running accuracy
  -- (documented in the upsert code, Step 3). No ML.
  mastery_percentage  numeric(5,2) not null default 0 check (mastery_percentage between 0 and 100),
  accuracy            numeric(5,2) not null default 0 check (accuracy between 0 and 100),
  attempts            integer not null default 0 check (attempts >= 0),
  last_practiced      timestamptz,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now(),
  -- One mastery row per (student, skill); drives the Step 3 upsert onConflict.
  unique (student_id, skill_id)
);

create index if not exists student_skill_mastery_skill_id_idx
  on public.student_skill_mastery (skill_id);

-- Keep updated_at fresh on every update (the upsert also sets it explicitly;
-- this guarantees it even for partial updates).
create or replace function public.touch_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists trg_student_skill_mastery_touch on public.student_skill_mastery;
create trigger trg_student_skill_mastery_touch
  before update on public.student_skill_mastery
  for each row execute function public.touch_updated_at();

-- RLS (Option A — client-side writes): a parent can read AND write mastery only
-- for their own children. Both insert and update policies are required because
-- Step 3 uses upsert (insert ... on conflict do update).
alter table public.student_skill_mastery enable row level security;

drop policy if exists "read own children mastery" on public.student_skill_mastery;
create policy "read own children mastery"
  on public.student_skill_mastery for select
  to authenticated
  using (public.owns_student(student_id));

drop policy if exists "insert own children mastery" on public.student_skill_mastery;
create policy "insert own children mastery"
  on public.student_skill_mastery for insert
  to authenticated
  with check (public.owns_student(student_id));

drop policy if exists "update own children mastery" on public.student_skill_mastery;
create policy "update own children mastery"
  on public.student_skill_mastery for update
  to authenticated
  using (public.owns_student(student_id))
  with check (public.owns_student(student_id));

grant select, insert, update on public.student_skill_mastery to authenticated;

-- =====================================================================
-- 5) Additive columns on existing tables
-- =====================================================================
-- sessions: record which skills were touched and what mastery changed, so a
-- finished session is self-describing and the dashboard can show recent deltas.
-- Existing rows backfill to empty arrays; existing inserts are unaffected.
alter table public.sessions
  add column if not exists skills_practiced jsonb not null default '[]'::jsonb;
alter table public.sessions
  add column if not exists mastery_updates jsonb not null default '[]'::jsonb;

-- students: forward-compat learning preferences (modality, pace, etc.). Cheap,
-- nullable-by-default-empty, additive. NOT grade_band — that stays derived.
alter table public.students
  add column if not exists learning_preferences jsonb not null default '{}'::jsonb;

commit;
