import { useParams, Navigate, useNavigate } from 'react-router'
import { ArrowLeft, Calculator, BookOpen, PenTool, Check } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { useAppContext } from '@/context/AppContext'
import { PracticeSection, NikkiChat } from '@/components/student'
import { getQuestionsForSubject, focusAreaLabels } from '@/lib/practiceQuestions'
import { cn } from '@/lib/utils'
import logoImg from '@/assets/logo.png'
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

  // Validate subject parameter
  if (!subject || !validSubjects.includes(subject as Subject)) {
    return <Navigate to="/student" replace />
  }

  const validSubject = subject as Subject
  const config = subjectConfig[validSubject]
  const Icon = config.icon
  const focusAreas = state.focusAreas[validSubject]
  const isComplete = state.progress[validSubject] === 'complete'

  // Get practice questions based on subject and focus areas
  const questions = getQuestionsForSubject(validSubject, focusAreas)

  // Build subtitle from focus areas
  const focusSubtitle =
    focusAreas.length > 0
      ? focusAreas.map((area) => focusAreaLabels[area] || area).join(', ')
      : 'General practice'

  const handleBack = () => {
    navigate('/student')
  }

  const handleMarkComplete = () => {
    updateSubjectProgress(validSubject, 'complete')
  }

  return (
    <div className="h-dvh flex flex-col bg-gradient-to-b from-slate-50 to-white overflow-hidden">
      {/* Custom Header with subject color */}
      <header
        className={cn(
          'relative px-4 py-4 sm:px-6 sm:py-5',
          `bg-gradient-to-r ${config.gradientFrom} to-primary`
        )}
      >
        {/* Subtle pattern overlay */}
        <div
          className="absolute inset-0 opacity-[0.03]"
          style={{
            backgroundImage: `url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='1'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E")`,
          }}
        />

        <div className="relative mx-auto flex items-center justify-between">
          {/* Back button */}
          <Button
            variant="ghost"
            size="icon"
            onClick={handleBack}
            className="text-white/90 hover:text-white hover:bg-white/10 transition-colors"
            aria-label="Go back"
          >
            <ArrowLeft className="h-5 w-5 sm:h-6 sm:w-6" />
          </Button>

          {/* Logo and subject info */}
          <div className="flex flex-col items-center gap-1">
            <div className="flex items-center gap-2.5">
              <img
                src={logoImg}
                alt="PathwayEd"
                className="h-8 w-8 sm:h-9 sm:w-9 object-contain drop-shadow-sm"
              />
              <div className="flex items-center gap-2">
                <Icon className="h-5 w-5 text-white" />
                <span className="text-white font-semibold text-lg sm:text-xl tracking-tight">
                  {config.label}
                </span>
              </div>
            </div>
            <span className="text-white/80 text-xs sm:text-sm font-medium">
              {focusSubtitle}
            </span>
          </div>

          {/* Spacer for balance */}
          <div className="w-10 sm:w-12" />
        </div>

        {/* Bottom accent line */}
        <div className="absolute bottom-0 left-0 right-0 h-0.5 bg-gradient-to-r from-transparent via-white/40 to-transparent" />
      </header>

      {/* Main content */}
      <main className="flex-1 overflow-y-auto overscroll-contain">
        <div className="mx-auto w-full max-w-2xl px-4 py-6 sm:px-6 sm:py-8 space-y-6">
          {/* Section A: Practice Questions */}
          {questions && <PracticeSection questions={questions} />}

          {/* Section B: N.I.K.K.I. Chat */}
          <NikkiChat
            subject={validSubject}
            focusAreas={focusAreas}
            appMode={state.mode}
          />

          {/* Section C: Mark Complete Button */}
          <div className="pt-2 pb-4">
            <Button
              onClick={handleMarkComplete}
              disabled={isComplete}
              className={cn(
                'w-full h-12 text-base font-semibold rounded-xl transition-all duration-200',
                isComplete
                  ? 'bg-green-500 hover:bg-green-500 cursor-default shadow-md'
                  : 'shadow-lg shadow-primary/20 hover:shadow-xl hover:shadow-primary/30'
              )}
            >
              {isComplete ? (
                <span className="flex items-center gap-2">
                  <Check className="h-5 w-5" />
                  Completed!
                </span>
              ) : (
                'Mark Complete'
              )}
            </Button>
          </div>
        </div>
      </main>
    </div>
  )
}
