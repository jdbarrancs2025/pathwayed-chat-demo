-- ===========================================================================
-- 0010_mastery_certainty.sql — evidence-driven mastery (two-tier + spaced recheck)
--
-- Mastery has been driven by an end-of-session SELF-RATING. That is a confidence
-- proxy, not proof, and it is about to be the headline number on a school-facing
-- console. This migration re-bases mastery on the honest signal we ALREADY
-- collect: graded question_attempts (is_correct, time_ms, is_diagnostic).
--
-- TWO BARS (do not collapse):
--   ADVANCE  — >= 70% accuracy over >= 5 graded, non-diagnostic attempts.
--              "Ready for the next skill." Cheap to be wrong (kid loops back).
--   MASTERED — >= 85% accuracy over >= 8 QUALITY attempts (graded, non-diagnostic,
--              not-too-fast), AND a SPACED RE-CHECK: >= 3 days after the accuracy
--              /count bar was first met, >= 2 further quality attempts, overall
--              quality accuracy still >= 85%. A durable, parent/school-facing claim.
--
-- EVIDENCE FLOOR: no "mastered" below 8 quality attempts, no matter the accuracy.
-- Below the floor the honest status is "practicing" / "we don't know yet".
--
-- DIAGNOSTICS are placement, not proof — is_diagnostic = true is excluded entirely.
--
-- TIME QUALITY: an attempt answered in under 40% of the median time for THAT
-- question (median computed only where the question has >= 5 timed attempts) is a
-- guess/recall, not understanding — excluded from the MASTERED evidence count.
-- It is NOT used to fail anyone, and the ADVANCE bar does not discount speed.
--
-- History is preserved: existing rows are kept; the old self-rated value is
-- snapshotted into legacy_self_rating_mastery; mastery_percentage/accuracy/
-- attempts columns are left untouched.
-- ===========================================================================

-- --- 1) new columns on student_skill_mastery -------------------------------
alter table public.student_skill_mastery
  add column if not exists status text not null default 'not_started'
    check (status in ('not_started', 'practicing', 'advanced', 'mastered')),
  add column if not exists evidence_accuracy numeric(5,2)
    check (evidence_accuracy is null or evidence_accuracy between 0 and 100),
  add column if not exists attempts_counted integer not null default 0
    check (attempts_counted >= 0),
  add column if not exists first_bar_met_at timestamptz,
  add column if not exists recheck_passed_at timestamptz,
  add column if not exists computed_at timestamptz,
  add column if not exists legacy_self_rating_mastery numeric(5,2);

-- --- 2) supporting indexes on question_attempts ----------------------------
create index if not exists question_attempts_student_skill_graded_idx
  on public.question_attempts (student_id, skill_id)
  where is_diagnostic = false;

create index if not exists question_attempts_qid_timed_idx
  on public.question_attempts (generated_question_id)
  where time_ms is not null and is_diagnostic = false;

-- --- 3) the engine: recompute one (student, skill) from graded attempts -----
-- SECURITY DEFINER so it can read all of the student's attempts and write the
-- mastery row regardless of the caller. Called by the trigger below; not granted
-- to clients.
create or replace function public.recompute_skill_mastery(p_student uuid, p_skill uuid)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_all_n        int;
  v_all_correct  int;
  v_all_acc      numeric;
  v_q_n          int;   -- quality attempts (graded, non-diagnostic, not too fast)
  v_q_correct    int;
  v_q_acc        numeric;
  v_post_n       int;   -- quality attempts >= 3 days after first_bar_met_at
  v_existing_first timestamptz;
  v_first_met    timestamptz;
  v_recheck_at   timestamptz;
  v_status       text;
begin
  select first_bar_met_at into v_existing_first
    from public.student_skill_mastery
   where student_id = p_student and skill_id = p_skill;

  with atts as (
    select qa.generated_question_id, qa.is_correct, qa.time_ms, qa.created_at
    from public.question_attempts qa
    where qa.student_id = p_student
      and qa.skill_id = p_skill
      and qa.is_diagnostic = false
  ),
  med as (
    -- Per-question median time, only where >= 5 timed attempts exist to trust it.
    select q2.generated_question_id,
           percentile_cont(0.5) within group (order by q2.time_ms) as median_ms,
           count(*) as timed_n
    from public.question_attempts q2
    where q2.is_diagnostic = false
      and q2.time_ms is not null
      and q2.generated_question_id in (
        select distinct generated_question_id from atts where generated_question_id is not null
      )
    group by q2.generated_question_id
  ),
  flagged as (
    select a.*,
      (a.time_ms is not null and m.median_ms is not null and m.timed_n >= 5
         and a.time_ms < 0.4 * m.median_ms) as too_fast
    from atts a
    left join med m on m.generated_question_id = a.generated_question_id
  )
  select
    count(*),
    count(*) filter (where is_correct),
    count(*) filter (where not too_fast),
    count(*) filter (where not too_fast and is_correct),
    count(*) filter (where not too_fast
                       and v_existing_first is not null
                       and created_at >= v_existing_first + interval '3 days')
  into v_all_n, v_all_correct, v_q_n, v_q_correct, v_post_n
  from flagged;

  v_all_acc := case when v_all_n > 0 then round(100.0 * v_all_correct / v_all_n, 1) else null end;
  v_q_acc   := case when v_q_n   > 0 then round(100.0 * v_q_correct   / v_q_n,   1) else null end;

  -- MASTERED accuracy+count bar first met? Stamp first_bar_met_at once (persist).
  v_first_met := v_existing_first;
  if v_first_met is null and v_q_n >= 8 and v_q_acc >= 85 then
    v_first_met := now();
  end if;

  -- Spaced re-check passed? (>= 3 days after first bar, >= 2 further quality
  -- attempts, overall quality accuracy still >= 85%.)
  v_recheck_at := null;
  if v_first_met is not null and v_q_n >= 8 and v_q_acc >= 85
     and now() >= v_first_met + interval '3 days'
     and v_post_n >= 2 then
    v_recheck_at := now();
  end if;

  -- Status. mastered only after the spaced re-check; advanced is the ADVANCE bar.
  if v_all_n = 0 then
    v_status := 'not_started';
  elsif v_recheck_at is not null then
    v_status := 'mastered';
  elsif v_all_n >= 5 and v_all_acc >= 70 then
    v_status := 'advanced';
  else
    v_status := 'practicing';
  end if;

  insert into public.student_skill_mastery
    (student_id, skill_id, status, evidence_accuracy, attempts_counted,
     first_bar_met_at, recheck_passed_at, computed_at, last_practiced)
  values
    (p_student, p_skill, v_status, v_q_acc, v_q_n,
     v_first_met, v_recheck_at, now(), now())
  on conflict (student_id, skill_id) do update set
    status             = excluded.status,
    evidence_accuracy  = excluded.evidence_accuracy,
    attempts_counted   = excluded.attempts_counted,
    first_bar_met_at   = excluded.first_bar_met_at,
    -- mastered is durable: never clear a passed re-check on a later recompute.
    recheck_passed_at  = coalesce(public.student_skill_mastery.recheck_passed_at, excluded.recheck_passed_at),
    computed_at        = excluded.computed_at,
    last_practiced     = excluded.last_practiced;
end;
$$;

revoke all on function public.recompute_skill_mastery(uuid, uuid) from public, anon, authenticated;

-- --- 4) keep mastery fresh: recompute on each graded attempt ----------------
create or replace function public.trg_recompute_mastery()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  perform public.recompute_skill_mastery(new.student_id, new.skill_id);
  return null;
end;
$$;

drop trigger if exists question_attempts_recompute_mastery on public.question_attempts;
create trigger question_attempts_recompute_mastery
  after insert on public.question_attempts
  for each row
  when (new.is_diagnostic = false)
  execute function public.trg_recompute_mastery();

-- --- 5) backfill ------------------------------------------------------------
-- (a) snapshot the old self-rated value so it stays visible.
update public.student_skill_mastery
   set legacy_self_rating_mastery = mastery_percentage
 where legacy_self_rating_mastery is null;

-- (b) recompute from real evidence for every (student, skill) that has graded
--     attempts. Rows with no graded evidence keep status='not_started',
--     attempts_counted=0 — the honest "we don't know yet".
do $$
declare r record;
begin
  for r in
    select distinct student_id, skill_id
    from public.question_attempts
    where is_diagnostic = false
  loop
    perform public.recompute_skill_mastery(r.student_id, r.skill_id);
  end loop;
end $$;
