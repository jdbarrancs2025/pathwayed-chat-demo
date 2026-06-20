import { supabase } from '@/lib/supabase'

/** The parent's chosen Nikki appearance ('orb' | 'p1' | 'p2' | 'p3'); defaults to 'orb'. */
export async function getNikkiChoice(parentId: string): Promise<string> {
  const { data } = await supabase.from('profiles').select('nikki').eq('id', parentId).maybeSingle()
  return data?.nikki ?? 'orb'
}
