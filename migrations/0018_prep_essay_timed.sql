-- ===========================================================================
-- 0018_prep_essay_timed.sql — server-authoritative timing + finalize + feedback
--                             for the ISEE practice essay (prep_essay_attempts)
--
-- The essay reuses the timed-engine discipline of 0016/0017, adapted to
-- prep_essay_attempts (which has no `status` column — an essay is IN PROGRESS while
-- submitted_at IS NULL, and FINALIZED once it is set):
--   * started_at is stamped with now() (server clock) on insert — the 30:00 window
--     is measured from the server, so refresh/close/device-swap grant no time.
--   * While in progress, a client may autosave ONLY the draft (essay_text), and
--     only inside the time window. It cannot set submitted_at or nikki_feedback.
--   * Finalize (stamp submitted_at) happens ONLY through prep_essay_finalize, which
--     sets a transaction-local GUC the guard checks. No backward transition: a
--     finalized essay is immutable to clients.
--   * Nikki feedback is written ONLY by the server (prep_essay_save_feedback,
--     service-role only) after finalize — the feedback needs the Anthropic key,
--     which never reaches the browser. Feedback is write-once (only when null).
--
-- Mirrors 0016's guard/GUC pattern; the GUC-unset-is-NULL bug fixed in 0017 is
-- avoided here from the start (coalesce to '').
--
-- 0015 created prep_essay_attempts (table + owns_student RLS + grants). This
-- migration adds: a partial unique index (one in-progress essay per child), a guard
-- trigger, and four functions. No column change.
--
-- HOW TO APPLY: paste into the Supabase SQL editor (project ref papiowjjoyhnbyhgtbxq)
-- and run. Idempotent — safe to re-run. src/lib/database.types.ts is hand-maintained
-- to match (Functions: prep_essay_start, prep_essay_remaining_seconds,
-- prep_essay_finalize; prep_essay_save_feedback is service-role only).
-- ===========================================================================

begin;

-- At most one in-progress (unsubmitted) essay per child, so start/resume never
-- forks. Backs prep_essay_start's resume under concurrency.
create unique index if not exists prep_essay_one_in_progress_idx
  on public.prep_essay_attempts (student_id)
  where submitted_at is null;

-- Serialize an essay row to jsonb WITH server-computed remaining_seconds, so every
-- RPC hands the client authoritative time in one shot. remaining is 0 once
-- finalized (submitted_at set), null when we cannot compute a window.
create or replace function public.prep_essay_json(a public.prep_essay_attempts)
returns jsonb
language sql
stable
set search_path = public
as $$
  select jsonb_build_object(
    'id', a.id,
    'student_id', a.student_id,
    'prompt_id', a.prompt_id,
    'essay_text', a.essay_text,
    'nikki_feedback', a.nikki_feedback,
    'started_at', a.started_at,
    'submitted_at', a.submitted_at,
    'time_limit_sec', a.time_limit_sec,
    'remaining_seconds', case
      when a.submitted_at is not null then 0
      when a.started_at is null or a.time_limit_sec is null then null
      else greatest(0, a.time_limit_sec - floor(extract(epoch from (now() - a.started_at)))::int)
    end
  );
$$;

-- ---------------------------------------------------------------------------
-- Guard trigger: data-layer enforcement, runs for EVERY writer.
--   INSERT: server stamps started_at = now(); a new essay is unsubmitted with no
--           feedback (a client cannot fake a start time, a submission, or feedback).
--   UPDATE, client path (GUC unset): allowed ONLY as a draft autosave of an
--           in-progress essay — just essay_text, and only inside the time window.
--           A submitted essay is immutable; submitted_at / nikki_feedback are
--           untouchable from the client.
--   UPDATE, server path (GUC set by an RPC): finalize + feedback. The one invariant
--           still enforced is NO BACKWARD TRANSITION (submitted_at, once set, may
--           not be cleared).
-- ---------------------------------------------------------------------------
create or replace function public.prep_essay_attempts_guard()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  -- coalesce so an UNSET GUC is boolean false, never NULL (the 0017 lesson).
  v_server boolean := coalesce(current_setting('app.prep_essay_server', true), '') = '1';
  v_deadline timestamptz;
begin
  if tg_op = 'INSERT' then
    new.started_at := now();
    if new.submitted_at is not null then
      raise exception 'a new prep essay must start unsubmitted';
    end if;
    if new.nikki_feedback is not null then
      raise exception 'a new prep essay cannot carry feedback';
    end if;
    return new;
  end if;

  -- UPDATE. Server RPCs (GUC set) own finalize + feedback; only the no-backward-
  -- transition rule is enforced on that path.
  if v_server then
    if old.submitted_at is not null and new.submitted_at is null then
      raise exception 'prep essay % cannot return to in-progress', old.id;
    end if;
    return new;
  end if;

  -- Client path: a submitted essay is immutable.
  if old.submitted_at is not null then
    raise exception 'prep essay % is submitted and cannot be modified', old.id;
  end if;

  -- In progress: only the draft text may change (no self-finalize, no self-feedback).
  if new.student_id is distinct from old.student_id
    or new.prompt_id is distinct from old.prompt_id
    or new.started_at is distinct from old.started_at
    or new.time_limit_sec is distinct from old.time_limit_sec
    or new.submitted_at is distinct from old.submitted_at
    or new.nikki_feedback is distinct from old.nikki_feedback then
    raise exception 'only the essay draft may change during a prep essay';
  end if;

  -- ...and only inside the time window (server clock + 5s grace).
  if old.started_at is not null and old.time_limit_sec is not null then
    v_deadline := old.started_at + make_interval(secs => old.time_limit_sec) + interval '5 seconds';
    if now() > v_deadline then
      raise exception 'prep essay % time window has ended', old.id;
    end if;
  end if;
  return new;
end;
$$;

drop trigger if exists prep_essay_attempts_guard_trg on public.prep_essay_attempts;
create trigger prep_essay_attempts_guard_trg
  before insert or update on public.prep_essay_attempts
  for each row
  execute function public.prep_essay_attempts_guard();

-- ---------------------------------------------------------------------------
-- Start (or resume) an essay. Resume wins: an existing in-progress essay is
-- returned unchanged (same started_at, same prompt) so refresh/close never forks
-- or resets the clock. p_prompt_id is used only for a fresh insert.
-- ---------------------------------------------------------------------------
create or replace function public.prep_essay_start(
  p_student_id uuid,
  p_prompt_id text,
  p_time_limit_sec integer
)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_row public.prep_essay_attempts;
begin
  if not public.owns_student(p_student_id) then
    raise exception 'not authorized for this student';
  end if;

  select * into v_row
  from public.prep_essay_attempts
  where student_id = p_student_id
    and submitted_at is null
  limit 1;

  if not found then
    insert into public.prep_essay_attempts
      (student_id, prompt_id, essay_text, time_limit_sec)
    values
      (p_student_id, p_prompt_id, '', p_time_limit_sec)
    returning * into v_row;
  end if;

  return public.prep_essay_json(v_row);
end;
$$;

-- Authoritative remaining seconds (for the client's periodic sync).
create or replace function public.prep_essay_remaining_seconds(p_attempt_id uuid)
returns integer
language plpgsql
stable
security definer
set search_path = public
as $$
declare
  v_row public.prep_essay_attempts;
begin
  select * into v_row from public.prep_essay_attempts where id = p_attempt_id;
  if not found or not public.owns_student(v_row.student_id) then
    return null;
  end if;
  if v_row.submitted_at is not null then
    return 0;
  end if;
  if v_row.started_at is null or v_row.time_limit_sec is null then
    return null;
  end if;
  return greatest(0, v_row.time_limit_sec - floor(extract(epoch from (now() - v_row.started_at)))::int);
end;
$$;

-- ---------------------------------------------------------------------------
-- Finalize an essay: stamp submitted_at (server clock) and store the final draft.
-- Idempotent: an already-submitted essay is returned unchanged (no backward move).
-- p_client_expired is accepted for symmetry with the MCQ engine but the essay's
-- outcome is not scored — submitted vs expired is not a distinction the essay needs.
-- ---------------------------------------------------------------------------
create or replace function public.prep_essay_finalize(
  p_attempt_id uuid,
  p_essay_text text default null,
  p_client_expired boolean default false
)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_row public.prep_essay_attempts;
begin
  select * into v_row from public.prep_essay_attempts where id = p_attempt_id for update;
  if not found or not public.owns_student(v_row.student_id) then
    raise exception 'not authorized or essay not found';
  end if;

  if v_row.submitted_at is not null then
    return public.prep_essay_json(v_row); -- already finalized
  end if;

  perform set_config('app.prep_essay_server', '1', true);
  update public.prep_essay_attempts
     set submitted_at = now(),
         essay_text = coalesce(p_essay_text, essay_text)
   where id = p_attempt_id
   returning * into v_row;

  return public.prep_essay_json(v_row);
end;
$$;

-- ---------------------------------------------------------------------------
-- Attach Nikki's feedback. SERVER ONLY (service role): the feedback is generated
-- server-side against the Anthropic key and written here. Write-once (only when
-- nikki_feedback is null), so a retry never overwrites. Not exposed to clients.
-- ---------------------------------------------------------------------------
create or replace function public.prep_essay_save_feedback(
  p_attempt_id uuid,
  p_feedback text
)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_row public.prep_essay_attempts;
begin
  perform set_config('app.prep_essay_server', '1', true);
  update public.prep_essay_attempts
     set nikki_feedback = p_feedback
   where id = p_attempt_id
     and nikki_feedback is null
   returning * into v_row;

  if not found then
    -- Either already has feedback or no such row — return the current state.
    select * into v_row from public.prep_essay_attempts where id = p_attempt_id;
  end if;
  return public.prep_essay_json(v_row);
end;
$$;

-- Grants: the three client RPCs to authenticated (definer bodies enforce
-- ownership); feedback-writing to the service role only.
revoke all on function public.prep_essay_start(uuid, text, integer) from public;
revoke all on function public.prep_essay_remaining_seconds(uuid) from public;
revoke all on function public.prep_essay_finalize(uuid, text, boolean) from public;
revoke all on function public.prep_essay_save_feedback(uuid, text) from public;

grant execute on function public.prep_essay_start(uuid, text, integer) to authenticated;
grant execute on function public.prep_essay_remaining_seconds(uuid) to authenticated;
grant execute on function public.prep_essay_finalize(uuid, text, boolean) to authenticated;
grant execute on function public.prep_essay_save_feedback(uuid, text) to service_role;

commit;

-- service_role sanity (our standard): confirm the role that runs the feedback path
-- can execute it and read the table. Separate block so a failure is a loud alarm,
-- not a rollback of the schema above.
do $$
begin
  if not has_function_privilege('service_role', 'public.prep_essay_save_feedback(uuid, text)', 'EXECUTE') then
    raise exception 'service_role is missing EXECUTE on prep_essay_save_feedback';
  end if;
  if not has_table_privilege('service_role', 'public.prep_essay_attempts', 'SELECT') then
    raise exception 'service_role is missing SELECT on public.prep_essay_attempts';
  end if;
  raise notice 'prep essay timed engine installed';
end;
$$;
