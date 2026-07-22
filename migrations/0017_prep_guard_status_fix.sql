-- ===========================================================================
-- 0017_prep_guard_status_fix.sql — close the status-transition hole in the prep
--                                  attempts guard, and repair one wedged row
--
-- Bug (found in live testing): a direct client PATCH {status:'submitted'} on an
-- in_progress prep_attempts row succeeded and finalized it WITHOUT grading
-- (score null). Root cause in 0016's guard trigger:
--
--     v_finalizing boolean := current_setting('app.prep_finalize', true) = '1';
--
-- current_setting(..., true) returns NULL when the GUC is unset, so
-- (NULL = '1') is NULL, so v_finalizing is NULL. In the finalize branch
-- `if not v_finalizing then raise ...`, `not NULL` is NULL, and PL/pgSQL treats
-- an IF whose condition is NULL as false — so the raise never fired and the
-- status change went through. ({score:1} was still rejected because it kept
-- status in_progress and hit the "only answers may change" check; finalized-row
-- edits were rejected too. Only the finalize branch leaked.)
--
-- Fix: coalesce so an unset GUC is a real boolean false, AND restructure the
-- trigger so ANY status change (to submitted OR expired) is allowed only through
-- the GUC-gated finalize path. Everything else raises.
--
-- 0016 is applied in prod and is NOT edited; this migration only replaces the
-- guard function (the existing trigger picks up the new body) and repairs the row.
--
-- HOW TO APPLY: paste into the Supabase SQL editor (project ref papiowjjoyhnbyhgtbxq)
-- and run. Idempotent — safe to re-run. No client/database.types.ts change.
-- ===========================================================================

begin;

-- 1) The fix -----------------------------------------------------------------
create or replace function public.prep_attempts_guard()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  -- coalesce so an UNSET GUC is boolean false, never NULL (the 0016 bug).
  v_finalizing boolean := coalesce(current_setting('app.prep_finalize', true), '') = '1';
  v_deadline timestamptz;
begin
  if tg_op = 'INSERT' then
    new.started_at := now();
    if new.status is distinct from 'in_progress' then
      raise exception 'a new prep attempt must start in_progress';
    end if;
    if new.score is not null then
      raise exception 'a new prep attempt cannot carry a score';
    end if;
    return new;
  end if;

  -- UPDATE. A finalized attempt is immutable (no backward transition, no edits).
  if old.status <> 'in_progress' then
    raise exception 'prep attempt % is finalized (%) and cannot be modified', old.id, old.status;
  end if;

  -- ANY status change is a finalize: allowed ONLY through the GUC-gated
  -- prep_finalize_attempt, and only to submitted|expired. A client write never
  -- sets the GUC, so a client can never change status by any path. Covers both
  -- 'submitted' and 'expired'.
  if new.status is distinct from old.status then
    if not v_finalizing then
      raise exception 'prep attempts are finalized only through prep_finalize_attempt';
    end if;
    if new.status not in ('submitted', 'expired') then
      raise exception 'invalid prep attempt status transition to %', new.status;
    end if;
    return new;
  end if;

  -- Same status (in_progress): a mid-test edit — only answers may change, and
  -- only within the time window.
  if new.student_id is distinct from old.student_id
    or new.module_id is distinct from old.module_id
    or new.section_id is distinct from old.section_id
    or new.mode is distinct from old.mode
    or new.started_at is distinct from old.started_at
    or new.time_limit_sec is distinct from old.time_limit_sec
    or new.question_ids is distinct from old.question_ids
    or new.score is distinct from old.score
    or new.submitted_at is distinct from old.submitted_at
    or new.full_test_group_id is distinct from old.full_test_group_id then
    raise exception 'only answers may change during a prep attempt';
  end if;
  if old.started_at is not null and old.time_limit_sec is not null then
    v_deadline := old.started_at + make_interval(secs => old.time_limit_sec) + interval '5 seconds';
    if now() > v_deadline then
      raise exception 'prep attempt % time window has ended', old.id;
    end if;
  end if;
  return new;
end;
$$;

-- The 0016 trigger (prep_attempts_guard_trg) already points at this function by
-- name, so replacing the body above is enough. Re-assert it defensively so a DB
-- that somehow lost the trigger still ends up guarded.
drop trigger if exists prep_attempts_guard_trg on public.prep_attempts;
create trigger prep_attempts_guard_trg
  before insert or update on public.prep_attempts
  for each row
  execute function public.prep_attempts_guard();

-- 2) Scoring helper (same logic as prep_finalize_attempt) --------------------
-- Extracted so the one-time repair below grades identically to the RPC. Not
-- exposed to clients.
create or replace function public.prep_compute_score(p_attempt_id uuid)
returns numeric
language plpgsql
stable
security definer
set search_path = public
as $$
declare
  v_row public.prep_attempts;
  v_total int;
  v_correct int;
begin
  select * into v_row from public.prep_attempts where id = p_attempt_id;
  if not found then
    return null;
  end if;
  v_total := coalesce(jsonb_array_length(v_row.question_ids), 0);
  if v_total = 0 then
    return 0;
  end if;
  select count(*) into v_correct
  from jsonb_array_elements_text(v_row.question_ids) as q(qid)
  join public.generated_questions gq on gq.id = q.qid::uuid
  cross join lateral (
    select (c.idx - 1) as correct_index
    from jsonb_array_elements(gq.choices) with ordinality as c(elem, idx)
    where (c.elem ->> 'is_correct') = 'true'
    order by c.idx
    limit 1
  ) ci
  where (v_row.answers ->> q.qid) ~ '^[0-9]+$'
    and (v_row.answers ->> q.qid)::int = ci.correct_index;
  return round(v_correct::numeric / v_total, 4);
end;
$$;

revoke all on function public.prep_compute_score(uuid) from public;

-- 3) Repair the wedged row ---------------------------------------------------
-- Attempt 06847994-... was finalized to 'submitted' by the leaked PATCH but never
-- graded (score null). Grade it with the same logic as the RPC. The guard now
-- (rightly) forbids updating a finalized row, so disable it for this single
-- one-time write, then re-enable. Idempotent via `score is null`.
alter table public.prep_attempts disable trigger prep_attempts_guard_trg;
update public.prep_attempts
   set score = public.prep_compute_score('06847994-32ec-4be9-a650-bf0f0919521f')
 where id = '06847994-32ec-4be9-a650-bf0f0919521f'
   and status = 'submitted'
   and score is null;
alter table public.prep_attempts enable trigger prep_attempts_guard_trg;

commit;

-- Confirmation (separate, so it never rolls back the fix).
do $$
declare
  v_score numeric;
begin
  select score into v_score from public.prep_attempts
   where id = '06847994-32ec-4be9-a650-bf0f0919521f';
  raise notice 'prep_attempts_guard hardened; repaired attempt score = %', coalesce(v_score::text, 'row not found');
end;
$$;
