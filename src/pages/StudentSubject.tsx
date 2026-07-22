import { useEffect, useRef, useState } from 'react'
import { useParams, Navigate, useNavigate } from 'react-router'
import { ArrowLeft, Calculator, BookOpen, PenTool } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { useAppContext } from '@/context/AppContext'
import { NikkiChat, QuestionProgress, SessionComplete } from '@/components/student'
import { useNikkiChat } from '@/hooks/useNikkiChat'
import { focusAreaLabels } from '@/lib/practiceQuestions'
import { cn } from '@/lib/utils'
import logoImg from '@/assets/logo-horizontal.png'
import type { Subject } from '@/lib/types'

const validSubjects: Subject[] = ['math', 'reading', 'writing']

const subjectConfig: Record<
  Subject,
  { icon: typeof Calculator; label: string; bgColor: string; gradientFrom: string }
> = {
  math: {
    icon: Calculator,
    label: 'Math',
    bgColor: 'bg-blue-600',
    gradientFrom: 'from-blue-700',
  },
  reading: {
    icon: BookOpen,
    label: 'Reading',
    bgColor: 'bg-emerald-600',
    gradientFrom: 'from-emerald-700',
  },
  writing: {
    icon: PenTool,
    label: 'Writing',
    bgColor: 'bg-amber-600',
    gradientFrom: 'from-amber-700',
  },
}

export function StudentSubject() {
  const { subject } = useParams<{ subject: string }>()
  const navigate = useNavigate()
  const { state, updateSubjectProgress } = useAppContext()
  const [isTtsActive, setIsTtsActive] = useState(false)
  const [showCompletionOverlay, setShowCompletionOverlay] = useState(false)

  // Compute a safe subject for hooks (hooks must not be called conditionally)
  const isValidSubject = !!subject && validSubjects.includes(subject as Subject)
  const validSubject = (isValidSubject ? subject : 'math') as Subject
  const config = subjectConfig[validSubject]
  const Icon = config.icon
  const focusAreas = state.focusAreas[validSubject]

  // Lift useNikkiChat to this level — single source of truth for chat state
  const {
    messages,
    isLoading,
    error,
    sendMessage,
    dismissError,
    currentQuestion,
    totalQuestions,
    isSessionComplete,
    resetSession,
  } = useNikkiChat({
    context: {
      subject: validSubject,
      focusAreas,
      appMode: state.mode,
      gradeBand: state.gradeBand ?? undefined,
      questionCount: state.questionCount,
    },
  })

  // Auto-complete subject progress when session finishes
  useEffect(() => {
    if (isSessionComplete) {
      updateSubjectProgress(validSubject, 'complete')
    }
  }, [isSessionComplete, validSubject, updateSubjectProgress])

  // Track whether TTS was observed active after session completion
  const seenTtsActiveRef = useRef(false)

  useEffect(() => {
    if (isSessionComplete && isTtsActive) {
      seenTtsActiveRef.current = true
    }
    if (!isSessionComplete) {
      seenTtsActiveRef.current = false
    }
  }, [isSessionComplete, isTtsActive])

  useEffect(() => {
    if (!isSessionComplete) return
    if (isLoading || isTtsActive) return

    // TTS played and finished → show overlay quickly
    // TTS hasn't started yet → wait a grace period (covers race condition + readAloud off)
    const delay = seenTtsActiveRef.current ? 600 : 2000

    const timer = window.setTimeout(() => {
      setShowCompletionOverlay(true)
    }, delay)

    return () => window.clearTimeout(timer)
  }, [isSessionComplete, isLoading, isTtsActive])

  // Redirect if invalid subject (after all hooks)
  if (!isValidSubject) {
    return <Navigate to="/student" replace />
  }

  // Build subtitle from focus areas
  const focusSubtitle =
    focusAreas.length > 0
      ? focusAreas.map((area) => focusAreaLabels[area] || area).join(', ')
      : 'General practice'

  const handleBack = () => {
    navigate('/student')
  }

  const handlePracticeMore = () => {
    setShowCompletionOverlay(false)
    updateSubjectProgress(validSubject, 'in-progress')
    resetSession()
  }

  const handleBackToHome = () => {
    navigate('/student')
  }

  return (
    <div className="h-dvh flex flex-col bg-gradient-to-b from-slate-50 to-white overflow-hidden">
      {/* Custom Header with subject color */}
      <header
        className={cn(
          'relative px-4 py-5 sm:px-6 sm:py-6 overflow-hidden',
          `bg-gradient-to-br ${config.gradientFrom} to-primary`
        )}
      >
        {/* Radial gradient overlay for premium glow */}
        <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_top,rgba(255,255,255,0.15),transparent_60%)]" />

        {/* Decorative blur circles */}
        <div className="absolute -top-8 -left-8 w-32 h-32 bg-white/10 rounded-full blur-3xl" />
        <div className="absolute -top-4 -right-12 w-40 h-40 bg-white/5 rounded-full blur-3xl" />
        <div className="absolute -bottom-16 left-1/2 w-48 h-48 bg-black/10 rounded-full blur-3xl" />

        <div className="relative mx-auto flex items-center justify-between">
          {/* Back button */}
          <Button
            variant="ghost"
            size="icon"
            onClick={handleBack}
            className="h-10 w-10 rounded-xl bg-white/5 text-white/90 hover:text-white hover:bg-white/15 backdrop-blur-sm border border-white/10 transition-all duration-200 hover:scale-105"
            aria-label="Go back"
          >
            <ArrowLeft className="h-5 w-5" />
          </Button>

          {/* Logo and subject info */}
          <div className="flex flex-col items-center gap-2">
            <div className="flex items-center gap-3 bg-white/10 backdrop-blur-sm rounded-2xl px-4 py-2 border border-white/10 shadow-lg shadow-black/5">
              <img
                src={logoImg}
                alt="PathwayEd"
                className="h-8 sm:h-10 w-auto object-contain drop-shadow-md"
              />
              <div className="flex items-center gap-2">
                <Icon className="h-5 w-5 sm:h-6 sm:w-6 text-white drop-shadow-sm" />
                <span className="text-white font-bold text-xl sm:text-2xl tracking-tight drop-shadow-sm">
                  {config.label}
                </span>
              </div>
            </div>
            <span className="text-white/95 text-xs sm:text-sm font-medium bg-white/10 backdrop-blur-sm px-4 py-1.5 rounded-full border border-white/10">
              {focusSubtitle}
            </span>
          </div>

          {/* Spacer for balance */}
          <div className="w-12 sm:w-14" />
        </div>

        {/* Enhanced bottom accent line with glow */}
        <div className="absolute bottom-0 left-0 right-0">
          <div className="h-1 bg-gradient-to-r from-transparent via-white/60 to-transparent" />
          <div className="absolute inset-0 h-2 bg-gradient-to-r from-transparent via-white/30 to-transparent blur-sm -translate-y-1" />
        </div>
      </header>

      {/* Main content */}
      <main className="flex-1 overflow-y-auto overscroll-contain">
        <div className="mx-auto w-full max-w-2xl px-4 py-6 sm:px-6 sm:py-8 space-y-4">
          {/* Question Progress */}
          <QuestionProgress
            currentQuestion={currentQuestion}
            totalQuestions={totalQuestions}
            subject={validSubject}
          />

          {/* N.I.K.K.I. Chat */}
          <NikkiChat
            subject={validSubject}
            messages={messages}
            isLoading={isLoading}
            error={error}
            sendMessage={sendMessage}
            dismissError={dismissError}
            onTtsActiveChange={setIsTtsActive}
          />
        </div>
      </main>

      {/* Session Complete Overlay */}
      {showCompletionOverlay && (
        <SessionComplete
          subject={validSubject}
          totalQuestions={totalQuestions ?? state.questionCount}
          onPracticeMore={handlePracticeMore}
          onBackToHome={handleBackToHome}
        />
      )}
    </div>
  )
}
