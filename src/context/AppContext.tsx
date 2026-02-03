/* eslint-disable react-refresh/only-export-components */
import { createContext, useContext, useState, useCallback, type ReactNode } from 'react'
import type { AppMode, AppState, FocusAreas, GradeBand, ProgressStatus, QuestionCount, Schedule, Subject } from '@/lib/types'

const defaultState: AppState = {
  mode: null,
  gradeBand: null,
  questionCount: 5,
  focusAreas: {
    math: [],
    reading: [],
    writing: [],
  },
  progress: {
    math: 'not-started',
    reading: 'not-started',
    writing: 'not-started',
  },
  schedule: undefined,
}

interface AppContextValue {
  state: AppState
  setMode: (mode: AppMode) => void
  setGradeBand: (gradeBand: GradeBand) => void
  setQuestionCount: (questionCount: QuestionCount) => void
  setFocusAreas: (focusAreas: FocusAreas) => void
  updateSubjectProgress: (subject: Subject, status: ProgressStatus) => void
  setSchedule: (schedule: Schedule | undefined) => void
  resetState: () => void
}

const AppContext = createContext<AppContextValue | null>(null)

interface AppProviderProps {
  children: ReactNode
}

export function AppProvider({ children }: AppProviderProps) {
  const [state, setState] = useState<AppState>(defaultState)

  const setMode = useCallback((mode: AppMode) => {
    setState((prev) => ({ ...prev, mode }))
  }, [])

  const setGradeBand = useCallback((gradeBand: GradeBand) => {
    setState((prev) => ({ ...prev, gradeBand }))
  }, [])

  const setQuestionCount = useCallback((questionCount: QuestionCount) => {
    setState((prev) => ({ ...prev, questionCount }))
  }, [])

  const setFocusAreas = useCallback((focusAreas: FocusAreas) => {
    setState((prev) => ({ ...prev, focusAreas }))
  }, [])

  const updateSubjectProgress = useCallback((subject: Subject, status: ProgressStatus) => {
    setState((prev) => ({
      ...prev,
      progress: {
        ...prev.progress,
        [subject]: status,
      },
    }))
  }, [])

  const setSchedule = useCallback((schedule: Schedule | undefined) => {
    setState((prev) => ({ ...prev, schedule }))
  }, [])

  const resetState = useCallback(() => {
    setState(defaultState)
  }, [])

  return (
    <AppContext.Provider
      value={{
        state,
        setMode,
        setGradeBand,
        setQuestionCount,
        setFocusAreas,
        updateSubjectProgress,
        setSchedule,
        resetState,
      }}
    >
      {children}
    </AppContext.Provider>
  )
}

export function useAppContext(): AppContextValue {
  const context = useContext(AppContext)
  if (!context) {
    throw new Error('useAppContext must be used within an AppProvider')
  }
  return context
}
