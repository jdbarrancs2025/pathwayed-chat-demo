export type AppMode = 'school' | 'home' | null

export type Subject = 'math' | 'reading' | 'writing'

export type ProgressStatus = 'not-started' | 'in-progress' | 'complete'

export type Schedule = 'daily' | '3x-week' | 'weekends'

export type GradeBand = '3-5' | '6-8' | '9-12'

export type QuestionCount = 3 | 5 | 10

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
  gradeBand: GradeBand | null
  questionCount: QuestionCount
  focusAreas: FocusAreas
  progress: Progress
  schedule?: Schedule
}
