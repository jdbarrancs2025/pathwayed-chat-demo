-- ===========================================================================
-- 0015_prep_modules.sql — test-prep modules (HSPT, ISEE): entitlements,
--                         settings, attempts, and essay attempts
--
-- Four per-child tables backing the test-prep modules. "Child profile" here is a
-- row in public.students (the app calls a child a "profile"); every table keys on
-- profile_id -> public.students(id) and authorizes exactly like the other
-- per-child tables, through public.owns_student() (keys on parent_id = auth.uid()).
--
-- What this migration establishes:
--   prep_entitlements    — which module a child may use, and its billing status.
--                          Written by the Stripe webhook as the service role
--                          (bypasses RLS); read by the client under RLS.
--   prep_settings        — per-child, per-module settings (e.g. a target test date).
--   prep_attempts        — one row per attempted section (train / practice /
--                          timed_section / full_test), with a partial unique index
--                          allowing at most one in-progress attempt per section.
--   prep_essay_attempts  — ISEE-style essays (prompt, text, Nikki feedback).
--
-- RLS + grants: every table gets the established owns_student() policies AND
-- explicit select/insert/update/delete grants to authenticated. Grants are stated
-- explicitly because RLS without a matching grant yields silent 403s here.
--
-- HOW TO APPLY: paste into the Supabase SQL editor (project ref papiowjjoyhnbyhgtbxq)
-- and run. Idempotent — safe to re-run. src/lib/database.types.ts is hand-
-- maintained to match (add the four tables when the app starts reading them).
-- ===========================================================================

begin;

-- 1) prep_entitlements -------------------------------------------------------
-- One row per (child, module). The webhook writes status + the Stripe
-- subscription item as the service role; the client reads its own children's
-- entitlements under RLS to know which modules are unlocked.
create table if not exists public.prep_entitlements (
  id                         uuid primary key default gen_random_uuid(),
  profile_id                 uuid not null references public.students(id) on delete cascade,
  module_id                  text not null,
  status                     text not null
                               check (status in ('active', 'canceled', 'past_due')),
  stripe_subscription_item_id text,
  created_at                 timestamptz not null default now(),
  ends_at                    timestamptz,
  unique (profile_id, module_id)
);

alter table public.prep_entitlements enable row level security;

drop policy if exists "read own children prep entitlements" on public.prep_entitlements;
create policy "read own children prep entitlements"
  on public.prep_entitlements for select
  to authenticated
  using (public.owns_student(profile_id));

drop policy if exists "insert own children prep entitlements" on public.prep_entitlements;
create policy "insert own children prep entitlements"
  on public.prep_entitlements for insert
  to authenticated
  with check (public.owns_student(profile_id));

drop policy if exists "update own children prep entitlements" on public.prep_entitlements;
create policy "update own children prep entitlements"
  on public.prep_entitlements for update
  to authenticated
  using (public.owns_student(profile_id))
  with check (public.owns_student(profile_id));

drop policy if exists "delete own children prep entitlements" on public.prep_entitlements;
create policy "delete own children prep entitlements"
  on public.prep_entitlements for delete
  to authenticated
  using (public.owns_student(profile_id));

grant select, insert, update, delete on public.prep_entitlements to authenticated;

-- 2) prep_settings -----------------------------------------------------------
-- Per-child, per-module settings. Composite primary key (profile_id, module_id)
-- gives one settings row per child per module and indexes profile_id lookups.
create table if not exists public.prep_settings (
  profile_id  uuid not null references public.students(id) on delete cascade,
  module_id   text not null,
  test_date   date,
  primary key (profile_id, module_id)
);

alter table public.prep_settings enable row level security;

drop policy if exists "read own children prep settings" on public.prep_settings;
create policy "read own children prep settings"
  on public.prep_settings for select
  to authenticated
  using (public.owns_student(profile_id));

drop policy if exists "insert own children prep settings" on public.prep_settings;
create policy "insert own children prep settings"
  on public.prep_settings for insert
  to authenticated
  with check (public.owns_student(profile_id));

drop policy if exists "update own children prep settings" on public.prep_settings;
create policy "update own children prep settings"
  on public.prep_settings for update
  to authenticated
  using (public.owns_student(profile_id))
  with check (public.owns_student(profile_id));

drop policy if exists "delete own children prep settings" on public.prep_settings;
create policy "delete own children prep settings"
  on public.prep_settings for delete
  to authenticated
  using (public.owns_student(profile_id));

grant select, insert, update, delete on public.prep_settings to authenticated;

-- 3) prep_attempts -----------------------------------------------------------
-- One row per attempted section. A full test is a set of section rows sharing a
-- full_test_group_id. mode and status are constrained text (no enum type, per the
-- spec). The partial unique index enforces at most one in-progress attempt per
-- child per module+section, so a resumed attempt never forks.
create table if not exists public.prep_attempts (
  id                 uuid primary key default gen_random_uuid(),
  profile_id         uuid not null references public.students(id) on delete cascade,
  module_id          text not null,
  section_id         text not null,
  mode               text not null
                       check (mode in ('train', 'practice', 'timed_section', 'full_test')),
  status             text not null
                       check (status in ('in_progress', 'submitted', 'expired')),
  started_at         timestamptz,
  submitted_at       timestamptz,
  time_limit_sec     integer,
  question_ids       jsonb,
  answers            jsonb,
  score              numeric,
  full_test_group_id uuid
);

create index if not exists prep_attempts_profile_id_idx
  on public.prep_attempts (profile_id);
create index if not exists prep_attempts_profile_module_idx
  on public.prep_attempts (profile_id, module_id);

-- At most one in-progress attempt per child per section. module_id is included so
-- the guard is correct even if two modules ever share a section_id string.
create unique index if not exists prep_attempts_one_in_progress_idx
  on public.prep_attempts (profile_id, module_id, section_id)
  where status = 'in_progress';

alter table public.prep_attempts enable row level security;

drop policy if exists "read own children prep attempts" on public.prep_attempts;
create policy "read own children prep attempts"
  on public.prep_attempts for select
  to authenticated
  using (public.owns_student(profile_id));

drop policy if exists "insert own children prep attempts" on public.prep_attempts;
create policy "insert own children prep attempts"
  on public.prep_attempts for insert
  to authenticated
  with check (public.owns_student(profile_id));

drop policy if exists "update own children prep attempts" on public.prep_attempts;
create policy "update own children prep attempts"
  on public.prep_attempts for update
  to authenticated
  using (public.owns_student(profile_id))
  with check (public.owns_student(profile_id));

drop policy if exists "delete own children prep attempts" on public.prep_attempts;
create policy "delete own children prep attempts"
  on public.prep_attempts for delete
  to authenticated
  using (public.owns_student(profile_id));

grant select, insert, update, delete on public.prep_attempts to authenticated;

-- 4) prep_essay_attempts -----------------------------------------------------
-- Essay attempts (ISEE-style): a prompt, the child's text, and optional Nikki
-- feedback. Indexed on profile_id for a child's essay history.
create table if not exists public.prep_essay_attempts (
  id             uuid primary key default gen_random_uuid(),
  profile_id     uuid not null references public.students(id) on delete cascade,
  prompt_id      text not null,
  essay_text     text,
  nikki_feedback text,
  started_at     timestamptz,
  submitted_at   timestamptz,
  time_limit_sec integer
);

create index if not exists prep_essay_attempts_profile_id_idx
  on public.prep_essay_attempts (profile_id);

alter table public.prep_essay_attempts enable row level security;

drop policy if exists "read own children prep essay attempts" on public.prep_essay_attempts;
create policy "read own children prep essay attempts"
  on public.prep_essay_attempts for select
  to authenticated
  using (public.owns_student(profile_id));

drop policy if exists "insert own children prep essay attempts" on public.prep_essay_attempts;
create policy "insert own children prep essay attempts"
  on public.prep_essay_attempts for insert
  to authenticated
  with check (public.owns_student(profile_id));

drop policy if exists "update own children prep essay attempts" on public.prep_essay_attempts;
create policy "update own children prep essay attempts"
  on public.prep_essay_attempts for update
  to authenticated
  using (public.owns_student(profile_id))
  with check (public.owns_student(profile_id));

drop policy if exists "delete own children prep essay attempts" on public.prep_essay_attempts;
create policy "delete own children prep essay attempts"
  on public.prep_essay_attempts for delete
  to authenticated
  using (public.owns_student(profile_id));

grant select, insert, update, delete on public.prep_essay_attempts to authenticated;

commit;

-- 5) service_role grant verification (our standard) --------------------------
-- The Stripe webhook writes prep_entitlements as the service role (bypassing RLS).
-- Confirm that role can still write all four tables, so a tightened-grant project
-- fails loudly here instead of the webhook silently no-op'ing. Run separately so a
-- failure here is an alarm, not a rollback of the schema above.
do $$
begin
  if not has_table_privilege('service_role', 'public.prep_entitlements', 'INSERT') then
    raise exception 'service_role is missing INSERT on public.prep_entitlements';
  end if;
  if not has_table_privilege('service_role', 'public.prep_entitlements', 'UPDATE') then
    raise exception 'service_role is missing UPDATE on public.prep_entitlements';
  end if;
  if not has_table_privilege('service_role', 'public.prep_settings', 'INSERT') then
    raise exception 'service_role is missing INSERT on public.prep_settings';
  end if;
  if not has_table_privilege('service_role', 'public.prep_attempts', 'INSERT') then
    raise exception 'service_role is missing INSERT on public.prep_attempts';
  end if;
  if not has_table_privilege('service_role', 'public.prep_essay_attempts', 'INSERT') then
    raise exception 'service_role is missing INSERT on public.prep_essay_attempts';
  end if;
  raise notice 'service_role grant verification passed for prep_* tables';
end;
$$;
