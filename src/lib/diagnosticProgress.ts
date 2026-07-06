import type { DiagnosticQuestion, PracticeableSkill } from '@/lib/questions'
import type { DiagnosticResult } from '@/lib/diagnostic'

/**
 * Pause-and-resume for the placement diagnostic.
 *
 * KNOWN LIMIT: this is device-local (localStorage). A resume follows the browser,
 * not the student. Before any multi-device or SHARED-device use (e.g. DIL
 * after-school on shared tablets), move this to a per-student DB row so a
 * paused assessment resumes for the right child on any device.
 */
export interface DiagnosticProgress {
  consent: boolean
  started: boolean
  questions: DiagnosticQuestion[]
  atBand: string
  extensionSkills: PracticeableSkill[]
  index: number
  results: DiagnosticResult[]
  extended: boolean
}

const key = (studentId: string) => `pathwayed:diagnostic:${studentId}`

export function loadDiagnosticProgress(studentId: string): DiagnosticProgress | null {
  try {
    const raw = localStorage.getItem(key(studentId))
    if (!raw) return null
    const p = JSON.parse(raw) as DiagnosticProgress
    // Only a real in-progress run is resumable.
    if (!p.started || !Array.isArray(p.questions) || p.questions.length === 0) return null
    return p
  } catch {
    return null
  }
}

export function saveDiagnosticProgress(studentId: string, p: DiagnosticProgress): void {
  try {
    localStorage.setItem(key(studentId), JSON.stringify(p))
  } catch {
    /* storage full / private mode — pause-resume is best-effort */
  }
}

export function clearDiagnosticProgress(studentId: string): void {
  try {
    localStorage.removeItem(key(studentId))
  } catch {
    /* ignore */
  }
}
