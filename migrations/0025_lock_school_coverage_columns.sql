-- ===========================================================================
-- 0025_lock_school_coverage_columns.sql - make school coverage server-written.
--
-- HOW TO APPLY: paste into the Supabase SQL editor and run against
-- papiowjjoyhnbyhgtbxq. Idempotent: the revoke/grant pair can be re-run safely.
--
-- THE HOLE. public.students has exactly one policy:
--
--   students_own | ALL | using (parent_id = auth.uid()) | check (parent_id = auth.uid())
--
-- and `authenticated` holds table-level INSERT and UPDATE, which in Postgres means
-- EVERY column. The policy authorizes the ROW, never the COLUMN, and there is no
-- trigger on the table. So any signed-in parent can run this from a browser:
--
--   supabase.from('students').update({ school_covered: true }).eq('id', myChild)
--
-- school_covered drives the Stripe bypass (the trial lock, and the covered prep
-- grant in api/school-login.ts). Self-setting it is therefore a self-serve unlock
-- of paid content. dean_student_id is locked with it because it is the identity
-- half of the same bridge: forging it points a row at another school's student.
--
-- Both columns are written ONLY by the service role, after a verified Dean
-- resolve, in api/school-login.ts and api/mint-session.ts. Neither has ever been
-- a legitimate client write.
--
-- WHY COLUMN GRANTS RATHER THAN A POLICY OR A TRIGGER. A policy cannot express
-- "this column may not change" without re-reading the old row, and a trigger would
-- have to be maintained in step with every future column. Revoking the table-level
-- privilege and re-granting the exact allowed column list makes the permitted set
-- explicit and reviewable, and it fails closed: a column added later is NOT
-- writable by the client until someone deliberately adds it here.
--
-- REGRESSION SURFACE. The re-granted list is every column the client actually
-- writes today, taken from src/lib/students.ts:
--   createStudent        -> insert (parent_id, first_name, grade, level, avatar_mode)
--   updateStudent        -> update (first_name, grade, level, avatar_mode)
--   setAboveGradeConsent -> update (above_grade_ok)
--   promoteWorkingGrade  -> update (working_grade, working_grade_updated_at,
--                                   working_grade_reason)
--   setAvatarMode        -> update (avatar_mode)
--   setStudentActive     -> update (active)
-- SELECT and DELETE are untouched: the client reads the row (school_covered is
-- readable, it just stops being writable) and deletes children it owns.
-- pin_hash stays off the list because PINs are set only through the
-- set_student_pin / clear_student_pin SECURITY DEFINER functions.
-- ===========================================================================

begin;

-- ---------------------------------------------------------------------------
-- Drop the blanket column coverage, then re-grant the exact allowed set.
-- ORDER MATTERS: a table-level grant outranks any column list, so the revoke has
-- to land first or the re-grant is decorative.
-- ---------------------------------------------------------------------------
revoke insert, update on public.students from authenticated, anon;

grant insert (parent_id, first_name, grade, level, avatar_mode)
  on public.students to authenticated;

grant update (
  first_name,
  grade,
  level,
  avatar_mode,
  above_grade_ok,
  working_grade,
  working_grade_updated_at,
  working_grade_reason,
  active
) on public.students to authenticated;

-- ---------------------------------------------------------------------------
-- VERIFY BEFORE COMMITTING.
--
-- (1) Expect ZERO rows. Any row here means the lock did not take.
-- ---------------------------------------------------------------------------
select column_name, privilege_type
from information_schema.column_privileges
where table_schema = 'public'
  and table_name = 'students'
  and grantee in ('anon', 'authenticated')
  and column_name in ('school_covered', 'dean_student_id')
  and privilege_type in ('INSERT', 'UPDATE');

-- ---------------------------------------------------------------------------
-- (2) Expect the nine UPDATE columns listed above, and nothing else.
-- ---------------------------------------------------------------------------
select column_name, privilege_type
from information_schema.column_privileges
where table_schema = 'public'
  and table_name = 'students'
  and grantee = 'authenticated'
  and privilege_type in ('INSERT', 'UPDATE')
order by privilege_type, column_name;

commit;

-- ---------------------------------------------------------------------------
-- ROLLBACK, if a parent write turns out to be missing from the list above.
-- Prefer adding the one missing column to the grant over this: restoring the
-- table-level grant re-opens school_covered to every parent in the product.
-- ---------------------------------------------------------------------------
-- grant insert, update on public.students to authenticated;
