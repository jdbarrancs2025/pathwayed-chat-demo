-- ===========================================================================
-- 0023_flip_tiered_v3.sql - publish/retire runbook for the v3 tiered pools.
--
-- NOT A SCHEMA MIGRATION. This file is a runbook: run ONE skill block at a time,
-- verify inside the transaction, then commit. Nothing here is idempotent by
-- design, because each block asserts the counts it expects before you commit.
--
-- PREREQUISITES, in order:
--   1. migrations/0022_question_status_retired.sql  (adds the 'retired' status)
--   2. seeds/0023_tiered_math_questions_v3.sql      (inserts 192 v3 DRAFT rows)
--
-- WHY v3 EXISTS. The v2 multiplication pool is already published and live. Three
-- defects were found once it was in front of students: the advanced band behaved
-- as hard-only and served six identical items in a row, the hard pool contained
-- commuted duplicates (box x 3 = 27 and box x 9 = 27), and the feedback copy had
-- em-dashes and one truncated sentence. Fixing generation changes what a tier
-- contains, and question ids are sha1("template_code:slot"), so regenerating under
-- the v2 codes would have REWRITTEN live published rows in place. That would
-- silently re-label existing question_attempts as having been served content the
-- student never saw. A new namespace is the only additive way to change a tier.
--
-- SO MULTIPLICATION RETIRES TWICE: once for v1 (already done) and once for v2
-- (below). The other three skills retire v1 only, since their v2 was never
-- published. Both cases are handled by the same statement, which retires anything
-- published that is not v3.
-- ===========================================================================


-- ---------------------------------------------------------------------------
-- BEFORE YOU START. Record the baseline; it must be unchanged afterwards.
-- ---------------------------------------------------------------------------
select ssm.student_id, sk.slug, ssm.status, ssm.evidence_accuracy, ssm.attempts_counted
from public.student_skill_mastery ssm
join public.skills sk on sk.id = ssm.skill_id
where sk.slug in ('multiplication','fractions','percentages','data-analysis')
  and ssm.attempts_counted > 0
order by sk.slug;

-- Must be 0. A frozen timed-prep attempt holding an id we retire would lose that
-- question on resume, because the resume path filters on status='published'.
select count(*) as frozen_ids_at_risk
from public.prep_attempts pa
cross join lateral jsonb_array_elements_text(pa.question_ids) qid
join public.generated_questions gq on gq.id = qid::uuid
join public.skills sk on sk.id = gq.skill_id
where sk.slug in ('multiplication','fractions','percentages','data-analysis')
  and pa.status not in ('submitted','expired');


-- ===========================================================================
-- BLOCK 1 of 4 - multiplication. This one REPLACES A PUBLISHED v2 SET.
-- ===========================================================================
begin;

-- 1a. Publish the 48 v3 items FIRST, so there is never a moment with no
--     published questions for the skill.
update public.generated_questions gq
   set status = 'published'
  from public.skills sk, public.question_templates qt
 where sk.id = gq.skill_id
   and qt.id = gq.template_id
   and sk.slug = 'multiplication'
   and qt.code like '%-v3'
   and gq.status = 'draft';

-- 1b. Retire EVERYTHING published for this skill that is not v3. For
--     multiplication that is the 20 v1 items (already retired, so no-op) plus the
--     48 v2 items that are currently live. Rows are kept, never deleted, so every
--     question_attempts row stays joinable and every per-question time median
--     survives.
update public.generated_questions gq
   set status = 'retired'
  from public.skills sk
 where sk.id = gq.skill_id
   and sk.slug = 'multiplication'
   and gq.status = 'published'
   and (gq.template_id is null
        or gq.template_id not in (select id from public.question_templates where code like '%-v3'));

-- VERIFY BEFORE COMMITTING.
-- Expect: published = 16 easy / 20 medium / 12 hard, retired = 68 (20 v1 + 48 v2),
-- draft = 0.
select gq.status, gq.difficulty, count(*) as items
from public.generated_questions gq
join public.skills sk on sk.id = gq.skill_id
where sk.slug = 'multiplication'
group by 1,2 order by 1,2;

-- If the numbers are wrong: rollback;   otherwise:
commit;


-- ===========================================================================
-- BLOCK 2 of 4 - fractions. v1 only; its v2 was never published.
-- ===========================================================================
begin;

update public.generated_questions gq
   set status = 'published'
  from public.skills sk, public.question_templates qt
 where sk.id = gq.skill_id and qt.id = gq.template_id
   and sk.slug = 'fractions' and qt.code like '%-v3' and gq.status = 'draft';

update public.generated_questions gq
   set status = 'retired'
  from public.skills sk
 where sk.id = gq.skill_id and sk.slug = 'fractions' and gq.status = 'published'
   and (gq.template_id is null
        or gq.template_id not in (select id from public.question_templates where code like '%-v3'));

-- Expect: published 16/20/12, retired 20, draft 48 (the unpublished v2 set).
select gq.status, gq.difficulty, count(*) as items
from public.generated_questions gq join public.skills sk on sk.id = gq.skill_id
where sk.slug = 'fractions' group by 1,2 order by 1,2;

commit;


-- ===========================================================================
-- BLOCK 3 of 4 - percentages.
-- ===========================================================================
begin;

update public.generated_questions gq
   set status = 'published'
  from public.skills sk, public.question_templates qt
 where sk.id = gq.skill_id and qt.id = gq.template_id
   and sk.slug = 'percentages' and qt.code like '%-v3' and gq.status = 'draft';

update public.generated_questions gq
   set status = 'retired'
  from public.skills sk
 where sk.id = gq.skill_id and sk.slug = 'percentages' and gq.status = 'published'
   and (gq.template_id is null
        or gq.template_id not in (select id from public.question_templates where code like '%-v3'));

select gq.status, gq.difficulty, count(*) as items
from public.generated_questions gq join public.skills sk on sk.id = gq.skill_id
where sk.slug = 'percentages' group by 1,2 order by 1,2;

commit;


-- ===========================================================================
-- BLOCK 4 of 4 - data-analysis.
-- ===========================================================================
begin;

update public.generated_questions gq
   set status = 'published'
  from public.skills sk, public.question_templates qt
 where sk.id = gq.skill_id and qt.id = gq.template_id
   and sk.slug = 'data-analysis' and qt.code like '%-v3' and gq.status = 'draft';

update public.generated_questions gq
   set status = 'retired'
  from public.skills sk
 where sk.id = gq.skill_id and sk.slug = 'data-analysis' and gq.status = 'published'
   and (gq.template_id is null
        or gq.template_id not in (select id from public.question_templates where code like '%-v3'));

select gq.status, gq.difficulty, count(*) as items
from public.generated_questions gq join public.skills sk on sk.id = gq.skill_id
where sk.slug = 'data-analysis' group by 1,2 order by 1,2;

commit;


-- ===========================================================================
-- ROLLBACK for one skill. Substitute the slug. Restores v3 to draft and brings
-- back whatever was published immediately before.
--
-- CANNOT UNDO: attempts already recorded against v3 items. Those question_attempts
-- rows are permanent and have already been counted into status, evidence_accuracy,
-- and attempts_counted by the recompute trigger. Rolling back the flip does not
-- remove them and does not recompute anything, so a student keeps v3 evidence while
-- being served the older pool again. Rollback is clean ONLY before anyone practises.
-- ===========================================================================
-- begin;
-- update public.generated_questions gq set status = 'draft'
--   from public.skills sk, public.question_templates qt
--  where sk.id = gq.skill_id and qt.id = gq.template_id
--    and sk.slug = 'multiplication' and qt.code like '%-v3' and gq.status = 'published';
-- update public.generated_questions gq set status = 'published'
--   from public.skills sk, public.question_templates qt
--  where sk.id = gq.skill_id and qt.id = gq.template_id
--    and sk.slug = 'multiplication' and qt.code like '%-v2' and gq.status = 'retired';
-- select gq.status, gq.difficulty, count(*) from public.generated_questions gq
--   join public.skills sk on sk.id = gq.skill_id
--  where sk.slug = 'multiplication' group by 1,2 order by 1,2;
-- commit;
