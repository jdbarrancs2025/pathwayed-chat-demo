/* eslint-disable react-refresh/only-export-components */
import { createContext, useContext, useState, useCallback, type ReactNode } from 'react'
import type { AppMode, AppState, FocusAreas, ProgressStatus, Schedule, Subject } from '@/lib/types'

const defaultState: AppState = {
  mode: null,
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
