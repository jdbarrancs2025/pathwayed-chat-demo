export type AppMode = 'school' | 'home' | null

export type Subject = 'math' | 'reading' | 'writing'

export type ProgressStatus = 'not-started' | 'in-progress' | 'complete'

export type Schedule = 'daily' | '3x-week' | 'weekends'

export interface FocusAreas {
  math: string[]
  reading: string[]
  writing: string[]
}

export interface Progress {
  math: ProgressStatus
  reading: ProgressStatus
  writing: ProgressStatus
}

export interface AppState {
  mode: AppMode
  focusAreas: FocusAreas
  progress: Progress
  schedule?: Schedule
}
