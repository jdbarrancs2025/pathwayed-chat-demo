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
        }
        Insert: {
          id: string
          display_name?: string | null
          nikki?: string | null
        }
        Update: {
          id?: string
          display_name?: string | null
          nikki?: string | null
        }
        Relationships: []
      }
      consents: {
        Row: {
          id: string
          user_id: string
          created_at: string
        }
        Insert: {
          id?: string
          user_id: string
          created_at?: string
        }
        Update: {
          id?: string
          user_id?: string
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
