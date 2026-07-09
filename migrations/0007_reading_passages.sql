-- PathwayEd — Reading passages (Phase 2): passage-backed reading questions.
--
-- HOW TO APPLY: paste this whole file into the Supabase SQL editor and run it
--   (or: bun run db:seed migrations/0007_reading_passages.sql).
-- Idempotent — safe to re-run. Depends on migration 0001 (public.skills) and
-- 0004 (public.generated_questions, the question_status enum, and
-- public.touch_updated_at()).
--
-- WHAT THIS IS: the real SAT Reading & Writing "reading set" model — ONE original
-- passage can back MANY questions, so the passage text is stored ONCE in
-- public.passages and each generated_questions row points at it via passage_id
-- (no passage-repeated-per-stem). Mirrors the existing content model exactly:
-- shared, school-agnostic content, gated to the client purely by status —
-- only 'published' rows are readable by the authenticated client; 'draft'/
-- 'reviewed' rows are authored/reviewed via the SERVICE ROLE (SQL editor), which
-- bypasses RLS, exactly like generated_questions and question_templates. No
-- client write policies.

begin;

-- =====================================================================
-- passages — original reading stimuli (shared content). One passage backs many
-- questions via generated_questions.passage_id.
-- =====================================================================
create table if not exists public.passages (
  id            uuid primary key default gen_random_uuid(),
  -- Stable, human-authored idempotency key (e.g. 'read-ebr-p01') so seed
  -- migrations can upsert. Unique allows many NULLs in Postgres.
  code          text unique,
  skill_id      uuid not null references public.skills (id) on delete cascade,
  -- Denormalized copy of skills.sat_alignment for fast filtering (mirrors
  -- generated_questions.sat_alignment). The skill is the source of truth.
  sat_alignment text,
  grade_band    public.grade_band,
  title         text,
  body          text not null,
  status        public.question_status not null default 'draft',
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);

create index if not exists passages_skill_id_idx on public.passages (skill_id);
create index if not exists passages_status_idx on public.passages (status);

drop trigger if exists trg_passages_touch on public.passages;
create trigger trg_passages_touch
  before update on public.passages
  for each row execute function public.touch_updated_at();

-- FK from generated_questions -> passages. Nullable (math/writing questions have
-- no passage). ON DELETE CASCADE: a reading question is meaningless without its
-- passage, so pruning a passage prunes its questions. This is safe for the
-- performance signal because question_attempts already survive question deletion
-- via their OWN on-delete-set-null FK (they denormalize skill_id + sat_alignment).
alter table public.generated_questions
  add column if not exists passage_id uuid references public.passages (id) on delete cascade;

create index if not exists generated_questions_passage_id_idx on public.generated_questions (passage_id);

-- =====================================================================
-- RLS + grants — mirror generated_questions EXACTLY: only published rows are
-- client-readable; no client write policies (authored via the service role).
-- (anon gets the grant to match the sibling tables, but with no policy the
-- authenticated-only published SELECT is the effective access, same as
-- generated_questions.)
-- =====================================================================
alter table public.passages enable row level security;

drop policy if exists "passages published readable" on public.passages;
create policy "passages published readable"
  on public.passages for select
  to authenticated
  using (status = 'published');

grant select on public.passages to anon, authenticated;

commit;
