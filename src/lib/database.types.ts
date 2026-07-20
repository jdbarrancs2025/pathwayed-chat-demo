export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

/**
 * Minimal hand-written Supabase schema types.
 *
 * `profiles` already exists (created by the handle_new_user trigger, keyed by
 * the auth user id) with `display_name` and `nikki` columns — we do not create
 * or alter it. `consents` holds one row per consenting auth user. Regenerate
 * with the Supabase CLI (`supabase gen types typescript`) once the full schema
 * is in place.
 */
export interface Database {
  public: {
    Tables: {
      profiles: {
        Row: {
          id: string
          display_name: string | null
          nikki: string | null
          subscription_status: string | null
          plan: string | null
          billing_period: string | null
          stripe_customer_id: string | null
          extra_kids: number | null
          // App-managed trial (migration 0012): trial window + one-trial-per-account
          // marker, and the seat cap once subscribed (included plan seats + the
          // Additional Child add-on quantity, written by the Stripe webhook).
          trial_end: string | null
          current_period_end: string | null
          has_trialed: boolean
          paid_seats: number | null
          trial_reminder_sent_at: string | null
          trial_ended_email_sent_at: string | null
          // Optional account "parent PIN" (migration 0013): bcrypt hash gating the
          // Parent dashboard / Settings / Sign out when a child is signed in on a
          // shared device. Null = no PIN (open access). Written only via the
          // set_parent_pin / clear_parent_pin RPCs; the client only reads null-ness.
          parent_pin_hash: string | null
        }
        Insert: {
          id: string
          display_name?: string | null
          nikki?: string | null
          subscription_status?: string | null
          plan?: string | null
          billing_period?: string | null
          stripe_customer_id?: string | null
          extra_kids?: number | null
          trial_end?: string | null
          current_period_end?: string | null
          has_trialed?: boolean
          paid_seats?: number | null
          trial_reminder_sent_at?: string | null
          trial_ended_email_sent_at?: string | null
          parent_pin_hash?: string | null
        }
        Update: {
          id?: string
          display_name?: string | null
          nikki?: string | null
          subscription_status?: string | null
          plan?: string | null
          billing_period?: string | null
          stripe_customer_id?: string | null
          extra_kids?: number | null
          trial_end?: string | null
          current_period_end?: string | null
          has_trialed?: boolean
          paid_seats?: number | null
          trial_reminder_sent_at?: string | null
          trial_ended_email_sent_at?: string | null
          parent_pin_hash?: string | null
        }
        Relationships: []
      }
      consents: {
        Row: {
          id: string
          parent_id: string
          parent_name: string | null
          method: string
          consent_version: string
          consented_at: string
        }
        Insert: {
          id?: string
          parent_id: string
          parent_name?: string | null
          method: string
          consent_version: string
          consented_at?: string
        }
        Update: {
          id?: string
          parent_id?: string
          parent_name?: string | null
          method?: string
          consent_version?: string
          consented_at?: string
        }
        Relationships: []
      }
      students: {
        Row: {
          id: string
          parent_id: string
          first_name: string
          grade: string
          level: string
          // Academic OS Phase 1 (migration 0001): forward-compat learning
          // preferences (modality, pace, …). Grade band is NOT stored — it is
          // derived from `grade` via gradeBand() in src/lib/gradeBand.ts.
          learning_preferences: Json
          // Placement (migration 0006): parent consent to show above-grade / SAT
          // framing. Governs framing only, not whether the child advances.
          above_grade_ok: boolean
          // Parent-chosen Nikki visual per child: 'video' | 'orb' | 'voice'
          // (default 'video'). Check-constrained in the DB.
          avatar_mode: string
          // School-license bridge: stable Dean student id (null for B2C) and
          // the covered marker. Set server-side after a Dean resolve; never
          // client-set (it drives the Stripe bypass).
          dean_student_id: string | null
          school_covered: boolean
          // Seat enforcement (migration 0012): a child counts against the plan's
          // seat cap only while active. Over-cap children are marked inactive by
          // the parent's seat picker (never deleted).
          active: boolean
          // Optional per-child sign-in PIN (migration 0013): bcrypt hash of a
          // 4-digit PIN, or null when the child has none (direct entry). Written
          // only via the set_student_pin / clear_student_pin RPCs; the client
          // reads null-ness to decide whether to prompt at the "Who's learning" picker.
          pin_hash: string | null
        }
        Insert: {
          id?: string
          parent_id: string
          first_name: string
          grade: string
          level: string
          learning_preferences?: Json
          above_grade_ok?: boolean
          avatar_mode?: string
          dean_student_id?: string | null
          school_covered?: boolean
          active?: boolean
          pin_hash?: string | null
        }
        Update: {
          id?: string
          parent_id?: string
          first_name?: string
          grade?: string
          level?: string
          learning_preferences?: Json
          above_grade_ok?: boolean
          avatar_mode?: string
          dean_student_id?: string | null
          school_covered?: boolean
          active?: boolean
          pin_hash?: string | null
        }
        Relationships: []
      }
      sessions: {
        Row: {
          id: string
          student_id: string
          subject: string
          messages: Json
          updated_at: string
          // Coarse session timing (migration 0011): first-touch / last-touch.
          started_at: string
          ended_at: string | null
          // Academic OS Phase 1 (migration 0001): skills touched this session
          // and the mastery deltas written, so a finished session self-describes.
          skills_practiced: Json
          mastery_updates: Json
        }
        Insert: {
          id?: string
          student_id: string
          subject: string
          messages: Json
          updated_at?: string
          started_at?: string
          ended_at?: string | null
          skills_practiced?: Json
          mastery_updates?: Json
        }
        Update: {
          id?: string
          student_id?: string
          subject?: string
          messages?: Json
          updated_at?: string
          started_at?: string
          ended_at?: string | null
          skills_practiced?: Json
          mastery_updates?: Json
        }
        Relationships: []
      }
      feedback: {
        Row: {
          id: string
          student_id: string
          subject: string
          rating: string
          note: string | null
          created_at: string
        }
        Insert: {
          id?: string
          student_id: string
          subject: string
          rating: string
          note?: string | null
          created_at?: string
        }
        Update: {
          id?: string
          student_id?: string
          subject?: string
          rating?: string
          note?: string | null
          created_at?: string
        }
        Relationships: []
      }
      // Academic OS Phase 1 (migration 0001): self-referential taxonomy
      // (Subject -> Domain -> Skill -> MicroSkill). `slug` equals a focusAreas
      // value on Skill rows so the resolver is a clean join.
      skills: {
        Row: {
          id: string
          level: Database['public']['Enums']['skill_level']
          parent_id: string | null
          subject: string
          name: string
          slug: string | null
          grade_band: Database['public']['Enums']['grade_band'] | null
          // True Common Core grade (migration: re-level). grade_band is kept for
          // back-compat; ccss_grade_num ('K'=0 .. 12) is the orderable placement key.
          ccss_grade: string | null
          ccss_code: string | null
          ccss_grade_num: number | null
          sat_alignment: string | null
          prerequisite_skills: string[]
          description: string | null
          created_at: string
        }
        Insert: {
          id?: string
          level: Database['public']['Enums']['skill_level']
          parent_id?: string | null
          subject: string
          name: string
          slug?: string | null
          grade_band?: Database['public']['Enums']['grade_band'] | null
          ccss_grade?: string | null
          ccss_code?: string | null
          ccss_grade_num?: number | null
          sat_alignment?: string | null
          prerequisite_skills?: string[]
          description?: string | null
          created_at?: string
        }
        Update: {
          id?: string
          level?: Database['public']['Enums']['skill_level']
          parent_id?: string | null
          subject?: string
          name?: string
          slug?: string | null
          grade_band?: Database['public']['Enums']['grade_band'] | null
          ccss_grade?: string | null
          ccss_code?: string | null
          ccss_grade_num?: number | null
          sat_alignment?: string | null
          prerequisite_skills?: string[]
          description?: string | null
          created_at?: string
        }
        Relationships: []
      }
      // Academic OS Phase 1 (migration 0001): per-student mastery, written
      // client-side under RLS gated by owns_student(parent_id).
      student_skill_mastery: {
        Row: {
          id: string
          student_id: string
          skill_id: string
          mastery_percentage: number
          accuracy: number
          attempts: number
          last_practiced: string | null
          created_at: string
          updated_at: string
          // Evidence-driven mastery (migration 0010), computed from graded
          // question_attempts by recompute_skill_mastery(). These are the
          // authoritative, parent/school-facing signals; mastery_percentage/
          // accuracy/attempts above are the legacy self-rated values, kept.
          status: 'not_started' | 'practicing' | 'advanced' | 'mastered'
          evidence_accuracy: number | null
          attempts_counted: number
          first_bar_met_at: string | null
          recheck_passed_at: string | null
          computed_at: string | null
          legacy_self_rating_mastery: number | null
        }
        Insert: {
          id?: string
          student_id: string
          skill_id: string
          mastery_percentage?: number
          accuracy?: number
          attempts?: number
          last_practiced?: string | null
          created_at?: string
          updated_at?: string
          status?: 'not_started' | 'practicing' | 'advanced' | 'mastered'
          evidence_accuracy?: number | null
          attempts_counted?: number
          first_bar_met_at?: string | null
          recheck_passed_at?: string | null
          computed_at?: string | null
          legacy_self_rating_mastery?: number | null
        }
        Update: {
          id?: string
          student_id?: string
          skill_id?: string
          mastery_percentage?: number
          accuracy?: number
          attempts?: number
          last_practiced?: string | null
          created_at?: string
          updated_at?: string
          status?: 'not_started' | 'practicing' | 'advanced' | 'mastered'
          evidence_accuracy?: number | null
          attempts_counted?: number
          first_bar_met_at?: string | null
          recheck_passed_at?: string | null
          computed_at?: string | null
          legacy_self_rating_mastery?: number | null
        }
        Relationships: []
      }
      // Practice-SAT Phase 2: per-student focus skills (missed SAT skills the
      // learning path serves next). Active = resolved_at is null. Written
      // client-side under RLS gated by owns_student(student_id).
      student_focus_skills: {
        Row: {
          id: string
          student_id: string
          skill_id: string
          source: string
          created_at: string
          resolved_at: string | null
        }
        Insert: {
          id?: string
          student_id: string
          skill_id: string
          source?: string
          created_at?: string
          resolved_at?: string | null
        }
        Update: {
          id?: string
          student_id?: string
          skill_id?: string
          source?: string
          created_at?: string
          resolved_at?: string | null
        }
        Relationships: []
      }
      // Academic OS Phase 2 (migration 0002): computed readiness / Pathway Score
      // per student per type ('pathway' overall + 'math'/'reading'/'writing').
      // Written client-side under RLS gated by owns_student(student_id).
      readiness_scores: {
        Row: {
          id: string
          student_id: string
          readiness_type: string
          score: number
          strengths: Json
          gaps: Json
          next_skill_slug: string | null
          recommendations: Json
          // Academic OS Phase 2 (migration 0003): engine version that computed
          // this row, for self-healing recompute when the engine changes.
          engine_version: number
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          student_id: string
          readiness_type: string
          score?: number
          strengths?: Json
          gaps?: Json
          next_skill_slug?: string | null
          recommendations?: Json
          engine_version?: number
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          student_id?: string
          readiness_type?: string
          score?: number
          strengths?: Json
          gaps?: Json
          next_skill_slug?: string | null
          recommendations?: Json
          engine_version?: number
          created_at?: string
          updated_at?: string
        }
        Relationships: []
      }
      // Question Engine Stage 1 (migration 0004): hybrid content model. Shared,
      // school-agnostic content; client sees only status='published' rows.
      // Drafts are authored/reviewed via the service role.
      question_templates: {
        Row: {
          id: string
          code: string | null
          skill_id: string
          sat_alignment: string | null
          difficulty: Database['public']['Enums']['question_difficulty']
          kind: Database['public']['Enums']['question_kind']
          generation_spec: Json
          distractor_spec: Json
          status: Database['public']['Enums']['question_status']
          version: number
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          code?: string | null
          skill_id: string
          sat_alignment?: string | null
          difficulty: Database['public']['Enums']['question_difficulty']
          kind: Database['public']['Enums']['question_kind']
          generation_spec?: Json
          distractor_spec?: Json
          status?: Database['public']['Enums']['question_status']
          version?: number
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          code?: string | null
          skill_id?: string
          sat_alignment?: string | null
          difficulty?: Database['public']['Enums']['question_difficulty']
          kind?: Database['public']['Enums']['question_kind']
          generation_spec?: Json
          distractor_spec?: Json
          status?: Database['public']['Enums']['question_status']
          version?: number
          created_at?: string
          updated_at?: string
        }
        Relationships: []
      }
      // Original reading stimuli (Phase 2). One passage backs many
      // generated_questions rows via generated_questions.passage_id; only
      // status='published' rows are client-readable (RLS mirrors
      // generated_questions).
      passages: {
        Row: {
          id: string
          code: string | null
          skill_id: string
          sat_alignment: string | null
          grade_band: Database['public']['Enums']['grade_band'] | null
          title: string | null
          body: string
          status: Database['public']['Enums']['question_status']
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          code?: string | null
          skill_id: string
          sat_alignment?: string | null
          grade_band?: Database['public']['Enums']['grade_band'] | null
          title?: string | null
          body: string
          status?: Database['public']['Enums']['question_status']
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          code?: string | null
          skill_id?: string
          sat_alignment?: string | null
          grade_band?: Database['public']['Enums']['grade_band'] | null
          title?: string | null
          body?: string
          status?: Database['public']['Enums']['question_status']
          created_at?: string
          updated_at?: string
        }
        Relationships: []
      }
      generated_questions: {
        Row: {
          id: string
          template_id: string | null
          skill_id: string
          sat_alignment: string | null
          difficulty: Database['public']['Enums']['question_difficulty']
          stem: string
          choices: Json
          correct_answer: string
          solution: string | null
          status: Database['public']['Enums']['question_status']
          // Reading-set link (migration 0007): the passage this question is
          // asked about, or null for math/writing standalone stems.
          passage_id: string | null
          // K–2 pre-reader (audio-picture) support: render mode + optional visual
          // prompt. Existing rows default to 'text'.
          render_mode: string
          prompt: Json | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          template_id?: string | null
          skill_id: string
          sat_alignment?: string | null
          difficulty: Database['public']['Enums']['question_difficulty']
          stem: string
          choices?: Json
          correct_answer: string
          solution?: string | null
          status?: Database['public']['Enums']['question_status']
          passage_id?: string | null
          render_mode?: string
          prompt?: Json | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          template_id?: string | null
          skill_id?: string
          sat_alignment?: string | null
          difficulty?: Database['public']['Enums']['question_difficulty']
          stem?: string
          choices?: Json
          correct_answer?: string
          solution?: string | null
          status?: Database['public']['Enums']['question_status']
          passage_id?: string | null
          render_mode?: string
          prompt?: Json | null
          created_at?: string
          updated_at?: string
        }
        Relationships: []
      }
      // The real scored-performance signal. APPEND-ONLY (RLS allows select +
      // insert only), owned via owns_student(student_id) like mastery.
      question_attempts: {
        Row: {
          id: string
          student_id: string
          generated_question_id: string | null
          skill_id: string
          sat_alignment: string | null
          is_correct: boolean
          chosen_choice_index: number | null
          chosen_misconception_token: string | null
          time_ms: number | null
          created_at: string
          // Placement (migration 0006): true for diagnostic-recorded attempts so
          // seeding can tell them apart from real practice history.
          is_diagnostic: boolean
        }
        Insert: {
          id?: string
          student_id: string
          generated_question_id?: string | null
          skill_id: string
          sat_alignment?: string | null
          is_correct: boolean
          chosen_choice_index?: number | null
          chosen_misconception_token?: string | null
          time_ms?: number | null
          created_at?: string
          is_diagnostic?: boolean
        }
        Update: {
          id?: string
          student_id?: string
          generated_question_id?: string | null
          skill_id?: string
          sat_alignment?: string | null
          is_correct?: boolean
          chosen_choice_index?: number | null
          chosen_misconception_token?: string | null
          time_ms?: number | null
          created_at?: string
          is_diagnostic?: boolean
        }
        Relationships: []
      }
    }
    Views: Record<string, never>
    Functions: {
      // Optional PIN management (migration 0013). set/clear return void; verify
      // returns whether the supplied 4-digit PIN matches the stored bcrypt hash.
      set_student_pin: {
        Args: { p_student_id: string; p_pin: string }
        Returns: undefined
      }
      clear_student_pin: {
        Args: { p_student_id: string }
        Returns: undefined
      }
      verify_student_pin: {
        Args: { p_student_id: string; p_pin: string }
        Returns: boolean
      }
      set_parent_pin: {
        Args: { p_pin: string }
        Returns: undefined
      }
      clear_parent_pin: {
        Args: Record<string, never>
        Returns: undefined
      }
      verify_parent_pin: {
        Args: { p_pin: string }
        Returns: boolean
      }
    }
    Enums: {
      // Must match the canonical resolver gradeBand() in src/lib/gradeBand.ts.
      grade_band: 'k-2' | '3-5' | '6-8' | '9-12'
      skill_level: 'subject' | 'domain' | 'skill' | 'microskill'
      // Question Engine Stage 1 (migration 0004).
      question_difficulty: 'easy' | 'medium' | 'hard'
      question_kind: 'template_math' | 'llm_generated'
      question_status: 'draft' | 'reviewed' | 'published'
    }
    CompositeTypes: Record<string, never>
  }
}
