import { Trophy } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { cn } from '@/lib/utils'
import type { Subject } from '@/lib/types'

interface SessionCompleteProps {
  subject: Subject
  totalQuestions: number
  onPracticeMore: () => void
  onBackToHome: () => void
}

const subjectColors: Record<Subject, { icon: string; button: string }> = {
  math: {
    icon: 'text-blue-500',
    button: 'bg-blue-600 hover:bg-blue-700 text-white shadow-lg shadow-blue-200/50',
  },
  reading: {
    icon: 'text-emerald-500',
    button: 'bg-emerald-600 hover:bg-emerald-700 text-white shadow-lg shadow-emerald-200/50',
  },
  writing: {
    icon: 'text-amber-500',
    button: 'bg-amber-600 hover:bg-amber-700 text-white shadow-lg shadow-amber-200/50',
  },
}

export function SessionComplete({ subject, totalQuestions, onPracticeMore, onBackToHome }: SessionCompleteProps) {
  const colors = subjectColors[subject]

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm">
      <div className="bg-white rounded-3xl shadow-2xl p-8 max-w-sm mx-4 text-center animate-in zoom-in-95 duration-300">
        <div className={cn('inline-flex items-center justify-center w-16 h-16 rounded-full bg-slate-50 mb-4', colors.icon)}>
          <Trophy className="h-8 w-8" />
        </div>

        <h2 className="text-2xl font-bold text-slate-800 mb-2">Great Job!</h2>
        <p className="text-slate-600 mb-6">
          You completed all {totalQuestions} practice questions!
        </p>

        <div className="flex flex-col gap-3">
          <Button
            onClick={onPracticeMore}
            className={cn('w-full h-12 rounded-xl font-semibold', colors.button)}
          >
            Practice More
          </Button>
          <Button
            variant="outline"
            onClick={onBackToHome}
            className="w-full h-12 rounded-xl font-semibold border-2 border-slate-200 text-slate-600 hover:bg-slate-50 hover:text-slate-700"
          >
            Back to Home
          </Button>
        </div>
      </div>
    </div>
  )
}
