-- ===========================================================================
-- 0016_prep_timed_section.sql — server-authoritative timing + scoring for the
--                               prep timed-section engine
--
-- The timed engine's truth lives in the database, never the client:
--   * started_at is stamped with now() (server clock) when an attempt is created.
--   * Remaining time is time_limit_sec minus elapsed since started_at, computed
--     server-side. The client renders a countdown but re-syncs to this and never
--     owns it — refresh, app close, device swap, and clock tampering grant no time.
--   * Status transitions go one way only: in_progress -> submitted | expired.
--   * Score is computed here from the frozen question set against the question
--     bank, so a client cannot inflate it.
--
-- No schema change to prep_attempts (0015 is already applied in prod). Everything
-- is RPCs + a guard trigger:
--   prep_start_section   — resume the in-progress attempt for a section, or create
--                          one (started_at = now(), mode timed_section).
--   prep_remaining_seconds — authoritative remaining time for polling.
--   prep_finalize_attempt  — validate + expire/submit + score the DB's answers.
--   prep_attempts_guard    — BEFORE INSERT/UPDATE trigger enforcing server time,
--                            the one-way transition, and the time window on answer
--                            writes; finalize+score only via the RPC (GUC-gated).
--
-- HOW TO APPLY: paste into the Supabase SQL editor (project ref papiowjjoyhnbyhgtbxq)
-- and run. Idempotent — safe to re-run. src/lib/database.types.ts is hand-
-- maintained to match (Functions: prep_start_section, prep_remaining_seconds,
-- prep_finalize_attempt).
-- ===========================================================================

begin;

-- Small helper: serialize an attempt row to jsonb WITH the server-computed
-- remaining_seconds, so every RPC hands the client authoritative time in one shot.
create or replace function public.prep_attempt_json(a public.prep_attempts)
returns jsonb
language sql
stable
set search_path = public
as $$
  select jsonb_build_object(
    'id', a.id,
    'student_id', a.student_id,
    'module_id', a.module_id,
    'section_id', a.section_id,
    'mode', a.mode,
    'status', a.status,
    'started_at', a.started_at,
    'submitted_at', a.submitted_at,
    'time_limit_sec', a.time_limit_sec,
    'question_ids', a.question_ids,
    'answers', a.answers,
    'score', a.score,
    'full_test_group_id', a.full_test_group_id,
    'remaining_seconds', case
      when a.status <> 'in_progress' then 0
      when a.started_at is null or a.time_limit_sec is null then null
      else greatest(0, a.time_limit_sec - floor(extract(epoch from (now() - a.started_at)))::int)
    end
  );
$$;

-- ---------------------------------------------------------------------------
-- Guard trigger: the data-layer enforcement of the architecture rules. It runs
-- for EVERY writer (client under RLS and the RPCs), so the invariants hold no
-- matter who writes.
--   INSERT: server stamps started_at = now(); a new attempt is in_progress with
--           no score (a client cannot fake a start time or a finished score).
--   UPDATE while in_progress:
--     - a mid-test edit may change ONLY answers, and only within the time window
--       (now() <= started_at + time_limit + 5s grace) — post-window writes error;
--     - a finalize (-> submitted|expired, plus score) is allowed ONLY through
--       prep_finalize_attempt, which sets a transaction-local GUC.
--   UPDATE of a finalized row: rejected (immutable; no backward transition).
-- ---------------------------------------------------------------------------
create or replace function public.prep_attempts_guard()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_finalizing boolean := current_setting('app.prep_finalize', true) = '1';
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

  -- UPDATE
  if old.status <> 'in_progress' then
    raise exception 'prep attempt % is finalized (%) and cannot be modified', old.id, old.status;
  end if;

  if new.status = 'in_progress' then
    -- Mid-test edit: only answers may move, and only inside the time window.
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
  elsif new.status in ('submitted', 'expired') then
    if not v_finalizing then
      raise exception 'prep attempts are finalized only through prep_finalize_attempt';
    end if;
    return new;
  else
    raise exception 'invalid prep attempt status %', new.status;
  end if;
end;
$$;

drop trigger if exists prep_attempts_guard_trg on public.prep_attempts;
create trigger prep_attempts_guard_trg
  before insert or update on public.prep_attempts
  for each row
  execute function public.prep_attempts_guard();

-- ---------------------------------------------------------------------------
-- Start (or resume) a timed section. Resume wins: if an in-progress attempt for
-- this section already exists, return it unchanged (same started_at, same frozen
-- questions) so refresh/close/resume never forks or resets the clock. The partial
-- unique index (0015) backs this up under concurrency.
-- ---------------------------------------------------------------------------
create or replace function public.prep_start_section(
  p_student_id uuid,
  p_module_id text,
  p_section_id text,
  p_time_limit_sec integer,
  p_question_ids jsonb
)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_row public.prep_attempts;
begin
  if not public.owns_student(p_student_id) then
    raise exception 'not authorized for this student';
  end if;

  select * into v_row
  from public.prep_attempts
  where student_id = p_student_id
    and module_id = p_module_id
    and section_id = p_section_id
    and status = 'in_progress'
  limit 1;

  if not found then
    insert into public.prep_attempts
      (student_id, module_id, section_id, mode, status, time_limit_sec, question_ids, answers)
    values
      (p_student_id, p_module_id, p_section_id, 'timed_section', 'in_progress',
       p_time_limit_sec, coalesce(p_question_ids, '[]'::jsonb), '{}'::jsonb)
    returning * into v_row;
  end if;

  return public.prep_attempt_json(v_row);
end;
$$;

-- Authoritative remaining seconds for an attempt (for the client's periodic sync).
create or replace function public.prep_remaining_seconds(p_attempt_id uuid)
returns integer
language plpgsql
stable
security definer
set search_path = public
as $$
declare
  v_row public.prep_attempts;
begin
  select * into v_row from public.prep_attempts where id = p_attempt_id;
  if not found or not public.owns_student(v_row.student_id) then
    return null;
  end if;
  if v_row.status <> 'in_progress' then
    return 0;
  end if;
  if v_row.started_at is null or v_row.time_limit_sec is null then
    return null;
  end if;
  return greatest(0, v_row.time_limit_sec - floor(extract(epoch from (now() - v_row.started_at)))::int);
end;
$$;

-- ---------------------------------------------------------------------------
-- Finalize an attempt: decide submitted vs expired from the SERVER clock, then
-- score the answers ALREADY stored on the row (the guard trigger is the only path
-- answers reach the DB, so they are exactly the ones recorded within the window).
-- Idempotent: a finalized attempt is returned unchanged (never transitions back).
-- ---------------------------------------------------------------------------
create or replace function public.prep_finalize_attempt(
  p_attempt_id uuid,
  p_client_expired boolean default false
)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_row public.prep_attempts;
  v_total int;
  v_correct int;
  v_expired boolean;
  v_status text;
begin
  select * into v_row from public.prep_attempts where id = p_attempt_id for update;
  if not found or not public.owns_student(v_row.student_id) then
    raise exception 'not authorized or attempt not found';
  end if;

  if v_row.status <> 'in_progress' then
    return public.prep_attempt_json(v_row); -- already finalized; no backward move
  end if;

  v_expired := coalesce(p_client_expired, false)
    or (v_row.started_at is not null and v_row.time_limit_sec is not null
        and now() > v_row.started_at + make_interval(secs => v_row.time_limit_sec) + interval '5 seconds');
  v_status := case when v_expired then 'expired' else 'submitted' end;

  v_total := coalesce(jsonb_array_length(v_row.question_ids), 0);
  if v_total = 0 then
    v_correct := 0;
  else
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
  end if;

  perform set_config('app.prep_finalize', '1', true);
  update public.prep_attempts
     set status = v_status,
         submitted_at = now(),
         score = case when v_total = 0 then 0 else round(v_correct::numeric / v_total, 4) end
   where id = p_attempt_id
   returning * into v_row;

  return public.prep_attempt_json(v_row);
end;
$$;

-- Grants: EXECUTE for the signed-in role only (definer bodies enforce ownership).
revoke all on function public.prep_start_section(uuid, text, text, integer, jsonb) from public;
revoke all on function public.prep_remaining_seconds(uuid) from public;
revoke all on function public.prep_finalize_attempt(uuid, boolean) from public;

grant execute on function public.prep_start_section(uuid, text, text, integer, jsonb) to authenticated;
grant execute on function public.prep_remaining_seconds(uuid) to authenticated;
grant execute on function public.prep_finalize_attempt(uuid, boolean) to authenticated;

commit;

-- service_role sanity (our standard): the definer functions run as the owner, but
-- confirm the service role can still read the bank + attempts a future job might
-- need. Runs separately so a failure is a loud alarm, not a rollback.
do $$
begin
  if not has_table_privilege('service_role', 'public.prep_attempts', 'SELECT') then
    raise exception 'service_role is missing SELECT on public.prep_attempts';
  end if;
  if not has_table_privilege('service_role', 'public.generated_questions', 'SELECT') then
    raise exception 'service_role is missing SELECT on public.generated_questions';
  end if;
  raise notice 'prep timed-section functions installed';
end;
$$;
