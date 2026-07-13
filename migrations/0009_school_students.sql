-- 0009_school_students.sql — school-covered students (school-license bridge)
--
-- A "school-covered" student is one resolved as covered by the Dean project.
-- On their FIRST login we create ONE real students row keyed to the stable Dean
-- student id, so they flow through the SAME lessons/mastery/focus code paths as
-- B2C students (nothing about the learning experience branches on coverage).
--
-- 9-12 SSO students authenticate against THIS project themselves, so their row is
-- owned by their own auth uid (students.parent_id = auth.uid()) and works under
-- the existing owns_student() RLS with NO policy changes. Store the MINIMUM:
-- dean_student_id (stable key), first_name, grade, and the school_covered marker.
-- No PIN, email, or roster is stored here.
--
-- Apply by hand in the Supabase SQL editor (this repo has no migration runner).

alter table public.students
  add column if not exists dean_student_id text,
  add column if not exists school_covered boolean not null default false;

-- One local row per Dean student. Partial so B2C rows (null) are unconstrained.
create unique index if not exists students_dean_student_id_key
  on public.students (dean_student_id)
  where dean_student_id is not null;
