-- PathwayEd — Question Engine: tighten table grants to intent (Option A).
--
-- HOW TO APPLY: paste into the Supabase SQL editor and run. Idempotent
-- (revoke/grant are safe to re-run). Depends on migration 0004.
--
-- WHY: Supabase installs a project-level default privilege at bootstrap —
--   ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO
--   anon, authenticated, service_role
-- — so every new table in `public` auto-receives ALL privileges (SELECT/INSERT/
-- UPDATE/DELETE/TRUNCATE/REFERENCES/TRIGGER) for anon + authenticated. The
-- 0004 tables therefore over-grant far beyond what that migration asked for.
-- RLS is still the real gate (practice data stays protected), but the grants
-- should match intent. This migration revokes the excess on the three Question
-- Engine tables and re-grants only what's intended.
--
-- SCOPE (deliberately narrow): ONLY the three 0004 tables. The schema-wide
-- default privilege REMAINS, and the EXISTING tables (skills,
-- student_skill_mastery, readiness_scores) still carry the same over-grant.
-- A future dedicated 0006 security-hardening pass should:
--   * `alter default privileges in schema public revoke all on tables from
--      anon, authenticated;` so future tables stop over-granting, and
--   * revoke-all + re-grant intent on the existing tables.
-- That pass must be run carefully as the owning role (postgres) and NOT during
-- launch week — hence it is intentionally deferred here.

begin;

-- --- Revoke the default-privilege over-grant on the three tables ------------
revoke all on public.question_templates  from anon, authenticated;
revoke all on public.generated_questions from anon, authenticated;
revoke all on public.question_attempts   from anon, authenticated;

-- --- Re-grant intent --------------------------------------------------------
-- Content tables: read-only to the client (drafts/writes go through the service
-- role, which bypasses grants/RLS). Visibility is further gated to
-- status='published' by the RLS policies in 0004.
grant select on public.question_templates  to anon, authenticated;
grant select on public.generated_questions to anon, authenticated;

-- Attempts: APPEND-ONLY. select + insert only (no update/delete). RLS scopes
-- rows to owns_student(student_id).
grant select, insert on public.question_attempts to authenticated;

commit;
