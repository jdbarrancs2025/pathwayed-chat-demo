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
        }
        Insert: {
          id?: string
          parent_id: string
          first_name: string
          grade: string
          level: string
        }
        Update: {
          id?: string
          parent_id?: string
          first_name?: string
          grade?: string
          level?: string
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
        }
        Insert: {
          id?: string
          student_id: string
          subject: string
          messages: Json
          updated_at?: string
        }
        Update: {
          id?: string
          student_id?: string
          subject?: string
          messages?: Json
          updated_at?: string
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
    }
    Views: Record<string, never>
    Functions: Record<string, never>
    Enums: Record<string, never>
    CompositeTypes: Record<string, never>
  }
}
