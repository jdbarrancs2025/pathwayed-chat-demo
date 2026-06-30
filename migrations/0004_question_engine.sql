-- PathwayEd — Question Engine, Stage 1: schema only (ADDITIVE).
--
-- HOW TO APPLY: paste this whole file into the Supabase SQL editor and run it.
-- This repo has no migration runner; schema is applied by hand and
-- src/lib/database.types.ts is hand-maintained to match. Idempotent — safe to
-- re-run. Depends on migration 0001 (public.skills, public.students,
-- public.owns_student(uuid), public.touch_updated_at()).
--
-- WHAT THIS IS: the foundation that turns the soft mastery signal into real
-- scored-performance data. HYBRID content model:
--   * question_templates  — reusable specs (deterministic MATH templates first;
--     'llm_generated' kind reserved for prompt-driven generation). Shared,
--     school-agnostic content (no tenancy in this repo).
--   * generated_questions — the cached, concrete questions (the originals),
--     each with a review status.
--   * question_attempts   — the real performance signal: one row per answered
--     question, owned by the student's parent (owns_student), APPEND-ONLY.
--
-- DRAFT GATE (no admin role exists in this repo — users are parents keyed by
-- students.parent_id = auth.uid()): client visibility is gated purely by
-- `status` — only 'published' rows are readable by the authenticated client.
-- 'draft'/'reviewed' rows are authored and reviewed via the SERVICE ROLE (SQL
-- editor / server function), which bypasses RLS — exactly how skills content is
-- managed today. No client write policies on the content tables.
--
-- MISCONCEPTION TOKEN FORMAT (one format, used IDENTICALLY everywhere so Stage 4
-- explanation-by-distractor and later analytics can exact-match group by it):
--   lowercase kebab-case matching ^[a-z][a-z0-9-]*$  e.g. 'sign-error',
--   'distribution-error', 'wrong-operation', 'off-by-one'.
--   Used in: question_templates.distractor_spec[].misconception_token,
--            generated_questions.choices[].misconception_token,
--            question_attempts.chosen_misconception_token (CHECK-enforced here).
--
-- correct_answer (text, NOT NULL) handles BOTH SAT response types:
--   * multiple-choice: the canonical correct option's value; aligns with the
--     choices[] entry where is_correct = true. Stage 3 scores MC primarily by
--     chosen_choice_index -> choices[idx].is_correct; correct_answer is the
--     canonical/display value.
--   * student-produced response / grid-in: choices = [] and chosen_choice_index
--     is null; correct_answer holds the free-response value (e.g. '3/4', '-2',
--     '1.5'). Stage 3 normalizes the typed response and equivalence-matches it
--     against correct_answer.
--
-- NOT IN STAGE 1: any generation or scoring logic, and no session_id link on
-- attempts (the sessions PK lives outside these migrations; revisit in Stage 3).

begin;

-- --- Enums (idempotent, mirrors the skill_level pattern in 0001) ------------
do $$ begin
  create type public.question_difficulty as enum ('easy', 'medium', 'hard');
exception when duplicate_object then null; end $$;

do $$ begin
  create type public.question_kind as enum ('template_math', 'llm_generated');
exception when duplicate_object then null; end $$;

do $$ begin
  create type public.question_status as enum ('draft', 'reviewed', 'published');
exception when duplicate_object then null; end $$;

-- =====================================================================
-- question_templates — reusable question specs (shared content)
-- =====================================================================
create table if not exists public.question_templates (
  id              uuid primary key default gen_random_uuid(),
  -- Stable, human-authored idempotency key (e.g. 'math-linear-eq-easy-v1') so
  -- seed migrations can upsert with `on conflict (code) do update`. Nullable:
  -- runtime/LLM templates may have none. Unique allows many NULLs in Postgres.
  code            text unique,
  skill_id        uuid not null references public.skills (id) on delete cascade,
  -- Denormalized copy of skills.sat_alignment for fast filtering. May drift from
  -- the skill's value; the skill is the source of truth.
  sat_alignment   text,
  difficulty      public.question_difficulty not null,
  kind            public.question_kind not null,
  -- Slot/variable definitions + constraints + correct-answer formula (math
  -- templates). For 'llm_generated', the prompt/generation spec. Shape lives in
  -- app code (Stage 2); stored as jsonb.
  generation_spec jsonb not null default '{}'::jsonb,
  -- Array of distractor patterns, each tagged with a misconception_token
  -- (kebab-case, see header). e.g. [{ "pattern": "...", "misconception_token": "sign-error" }]
  distractor_spec jsonb not null default '[]'::jsonb,
  status          public.question_status not null default 'draft',
  version         integer not null default 1,
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

create index if not exists question_templates_skill_id_idx on public.question_templates (skill_id);
create index if not exists question_templates_sat_alignment_idx on public.question_templates (sat_alignment);
create index if not exists question_templates_status_idx on public.question_templates (status);

drop trigger if exists trg_question_templates_touch on public.question_templates;
create trigger trg_question_templates_touch
  before update on public.question_templates
  for each row execute function public.touch_updated_at();

-- =====================================================================
-- generated_questions — cached, concrete questions (the originals)
-- =====================================================================
create table if not exists public.generated_questions (
  id              uuid primary key default gen_random_uuid(),
  -- Nullable for pure-LLM questions with no template. on delete set null so
  -- cached questions survive a template being pruned.
  template_id     uuid references public.question_templates (id) on delete set null,
  skill_id        uuid not null references public.skills (id) on delete cascade,
  sat_alignment   text,
  difficulty      public.question_difficulty not null,
  stem            text not null,
  -- Multiple-choice options: [{ "text": "...", "is_correct": bool,
  --   "misconception_token": "sign-error" (on wrong choices only) }].
  -- Grid-in / student-produced response: [] (use correct_answer instead).
  choices         jsonb not null default '[]'::jsonb,
  -- Canonical answer for BOTH MC (the correct option value) and grid-in (the
  -- free-response value). See header.
  correct_answer  text not null,
  solution        text,
  status          public.question_status not null default 'draft',
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);

create index if not exists generated_questions_skill_id_idx on public.generated_questions (skill_id);
create index if not exists generated_questions_sat_alignment_idx on public.generated_questions (sat_alignment);
create index if not exists generated_questions_status_idx on public.generated_questions (status);
create index if not exists generated_questions_template_id_idx on public.generated_questions (template_id);

drop trigger if exists trg_generated_questions_touch on public.generated_questions;
create trigger trg_generated_questions_touch
  before update on public.generated_questions
  for each row execute function public.touch_updated_at();

-- =====================================================================
-- question_attempts — the real performance signal (APPEND-ONLY)
-- =====================================================================
create table if not exists public.question_attempts (
  id                         uuid primary key default gen_random_uuid(),
  student_id                 uuid not null references public.students (id) on delete cascade,
  -- on delete set null: attempts are precious performance data and must survive
  -- a question being pruned. skill_id + sat_alignment are denormalized below so
  -- scoring still works without the question row.
  generated_question_id      uuid references public.generated_questions (id) on delete set null,
  skill_id                   uuid not null references public.skills (id) on delete cascade,
  sat_alignment              text,
  is_correct                 boolean not null,
  -- null for grid-in / student-produced response (no chosen option).
  chosen_choice_index        integer,
  -- kebab-case misconception token (see header); CHECK-enforced for clean
  -- exact-match analytics grouping.
  chosen_misconception_token text
    check (chosen_misconception_token is null or chosen_misconception_token ~ '^[a-z][a-z0-9-]*$'),
  time_ms                    integer check (time_ms is null or time_ms >= 0),
  created_at                 timestamptz not null default now()
);

create index if not exists question_attempts_student_skill_idx on public.question_attempts (student_id, skill_id);
create index if not exists question_attempts_student_created_idx on public.question_attempts (student_id, created_at);
create index if not exists question_attempts_question_idx on public.question_attempts (generated_question_id);

-- =====================================================================
-- RLS + grants
-- =====================================================================
alter table public.question_templates  enable row level security;
alter table public.generated_questions enable row level security;
alter table public.question_attempts   enable row level security;

-- Content tables: only PUBLISHED rows are visible to the client. No client write
-- policies — drafts/reviewed are managed via the service role (mirrors skills).
drop policy if exists "question_templates published readable" on public.question_templates;
create policy "question_templates published readable"
  on public.question_templates for select
  to authenticated
  using (status = 'published');

drop policy if exists "generated_questions published readable" on public.generated_questions;
create policy "generated_questions published readable"
  on public.generated_questions for select
  to authenticated
  using (status = 'published');

-- Attempts: a parent can read AND insert attempts only for their own children
-- (owns_student), mirroring student_skill_mastery. APPEND-ONLY: no update/delete
-- policies.
drop policy if exists "question_attempts select own" on public.question_attempts;
create policy "question_attempts select own"
  on public.question_attempts for select
  to authenticated
  using (public.owns_student(student_id));

drop policy if exists "question_attempts insert own" on public.question_attempts;
create policy "question_attempts insert own"
  on public.question_attempts for insert
  to authenticated
  with check (public.owns_student(student_id));

-- Grants (mirror skills for content; mirror mastery for attempts, minus the
-- update grant since attempts are append-only).
grant select on public.question_templates  to anon, authenticated;
grant select on public.generated_questions to anon, authenticated;
grant select, insert on public.question_attempts to authenticated;

commit;
