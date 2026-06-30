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
        }
        Insert: {
          id?: string
          parent_id: string
          first_name: string
          grade: string
          level: string
          learning_preferences?: Json
        }
        Update: {
          id?: string
          parent_id?: string
          first_name?: string
          grade?: string
          level?: string
          learning_preferences?: Json
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
          skills_practiced?: Json
          mastery_updates?: Json
        }
        Update: {
          id?: string
          student_id?: string
          subject?: string
          messages?: Json
          updated_at?: string
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
        }
        Relationships: []
      }
    }
    Views: Record<string, never>
    Functions: Record<string, never>
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
