-- ===========================================================================
-- 0013_child_pins.sql — optional per-child sign-in PIN + optional parent PIN
--
-- Children never get their own auth account: they remain profiles under the
-- parent's authenticated session. These PINs are LIGHT, shared-device gating —
-- they let a child open their own space (and keep a child out of the parent
-- area) on a device the parent is already signed into. They are NOT an auth
-- boundary (the parent's session token is what actually authorizes every read),
-- so "no lockout needed yet" is fine.
--
-- What this migration establishes:
--   students.pin_hash        — bcrypt hash of a child's 4-digit PIN (null = none).
--   profiles.parent_pin_hash — bcrypt hash of the account's parent PIN (null = none).
--   SECURITY DEFINER RPCs to set / clear / verify each, so the raw PIN is hashed
--   in the database and never stored in the clear. Ownership is enforced inside
--   every function (owns_student() for children, auth.uid() for the parent).
--
-- The hash columns stay owner-only under the EXISTING students/profiles RLS, so
-- only the owning parent can read or change them. Writes always go through the
-- RPCs below (the client never writes pin_hash directly) so hashing is uniform.
--
-- HOW TO APPLY: paste into the Supabase SQL editor (project ref papiowjjoyhnbyhgtbxq)
-- and run. Idempotent — safe to re-run. src/lib/database.types.ts is hand-
-- maintained to match (students.pin_hash, profiles.parent_pin_hash, Functions).
-- ===========================================================================

begin;

-- pgcrypto provides crypt() + gen_salt() for bcrypt hashing. On Supabase it lives
-- in the `extensions` schema; the functions below pin that onto their search_path.
create extension if not exists pgcrypto;

-- 1) Columns -----------------------------------------------------------------
alter table public.students
  add column if not exists pin_hash text;

alter table public.profiles
  add column if not exists parent_pin_hash text;

-- 2) Per-child PIN RPCs ------------------------------------------------------
-- SECURITY DEFINER so they can write pin_hash regardless of the caller's RLS,
-- but each asserts ownership first (owns_student keys on parent_id = auth.uid()).
-- search_path is pinned (public for owns_student, extensions for crypt/gen_salt).

create or replace function public.set_student_pin(p_student_id uuid, p_pin text)
returns void
language plpgsql
security definer
set search_path = public, extensions
as $$
begin
  if not public.owns_student(p_student_id) then
    raise exception 'not authorized to set this child''s PIN';
  end if;
  if p_pin !~ '^\d{4}$' then
    raise exception 'PIN must be exactly 4 digits';
  end if;
  update public.students
     set pin_hash = crypt(p_pin, gen_salt('bf', 8))
   where id = p_student_id;
end;
$$;

create or replace function public.clear_student_pin(p_student_id uuid)
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  if not public.owns_student(p_student_id) then
    raise exception 'not authorized to clear this child''s PIN';
  end if;
  update public.students set pin_hash = null where id = p_student_id;
end;
$$;

create or replace function public.verify_student_pin(p_student_id uuid, p_pin text)
returns boolean
language plpgsql
security definer
set search_path = public, extensions
stable
as $$
declare
  v_hash text;
begin
  if not public.owns_student(p_student_id) then
    return false;
  end if;
  select pin_hash into v_hash from public.students where id = p_student_id;
  return v_hash is not null and v_hash = crypt(p_pin, v_hash);
end;
$$;

-- 3) Parent (account) PIN RPCs ----------------------------------------------
-- Keyed to the caller's own profile (profiles.id = auth.uid()). Used to gate the
-- Parent dashboard / Settings / Sign out when a child is signed in on the device.

create or replace function public.set_parent_pin(p_pin text)
returns void
language plpgsql
security definer
set search_path = public, extensions
as $$
begin
  if auth.uid() is null then
    raise exception 'not authenticated';
  end if;
  if p_pin !~ '^\d{4}$' then
    raise exception 'PIN must be exactly 4 digits';
  end if;
  update public.profiles
     set parent_pin_hash = crypt(p_pin, gen_salt('bf', 8))
   where id = auth.uid();
end;
$$;

create or replace function public.clear_parent_pin()
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  if auth.uid() is null then
    raise exception 'not authenticated';
  end if;
  update public.profiles set parent_pin_hash = null where id = auth.uid();
end;
$$;

create or replace function public.verify_parent_pin(p_pin text)
returns boolean
language plpgsql
security definer
set search_path = public, extensions
stable
as $$
declare
  v_hash text;
begin
  if auth.uid() is null then
    return false;
  end if;
  select parent_pin_hash into v_hash from public.profiles where id = auth.uid();
  return v_hash is not null and v_hash = crypt(p_pin, v_hash);
end;
$$;

-- 4) Grants ------------------------------------------------------------------
-- The hash columns are covered by the existing owner-only RLS + table grants on
-- students/profiles (asserted here so a tightened-grant project stays correct);
-- the client only ever reads them (pin_hash IS NULL? → "does a PIN exist"). All
-- writes go through the RPCs, which run as definer, so EXECUTE is what matters.
grant select on public.students to authenticated;
grant select on public.profiles to authenticated;

revoke all on function public.set_student_pin(uuid, text)    from public;
revoke all on function public.clear_student_pin(uuid)        from public;
revoke all on function public.verify_student_pin(uuid, text) from public;
revoke all on function public.set_parent_pin(text)           from public;
revoke all on function public.clear_parent_pin()             from public;
revoke all on function public.verify_parent_pin(text)        from public;

grant execute on function public.set_student_pin(uuid, text)    to authenticated;
grant execute on function public.clear_student_pin(uuid)        to authenticated;
grant execute on function public.verify_student_pin(uuid, text) to authenticated;
grant execute on function public.set_parent_pin(text)           to authenticated;
grant execute on function public.clear_parent_pin()             to authenticated;
grant execute on function public.verify_parent_pin(text)        to authenticated;

commit;

-- 5) service_role grant verification (our standard) --------------------------
-- Confirm the service role can still write the new hash columns (it bypasses RLS
-- for any future server-side maintenance). Run separately so a failure here is a
-- loud alarm, not a rollback of the schema above.
do $$
begin
  if not has_column_privilege('service_role', 'public.students', 'pin_hash', 'UPDATE') then
    raise exception 'service_role is missing UPDATE on public.students.pin_hash';
  end if;
  if not has_column_privilege('service_role', 'public.profiles', 'parent_pin_hash', 'UPDATE') then
    raise exception 'service_role is missing UPDATE on public.profiles.parent_pin_hash';
  end if;
  raise notice 'service_role grant verification passed for pin_hash + parent_pin_hash';
end;
$$;
