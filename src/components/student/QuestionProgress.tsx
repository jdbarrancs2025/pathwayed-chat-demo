import { cn } from '@/lib/utils'
import type { Subject } from '@/lib/types'

interface QuestionProgressProps {
  currentQuestion: number | null
  totalQuestions: number | null
  subject: Subject
}

const subjectColors: Record<Subject, { fill: string; track: string; text: string }> = {
  math: { fill: 'bg-blue-500', track: 'bg-blue-100', text: 'text-blue-600' },
  reading: { fill: 'bg-emerald-500', track: 'bg-emerald-100', text: 'text-emerald-600' },
  writing: { fill: 'bg-amber-500', track: 'bg-amber-100', text: 'text-amber-600' },
}

export function QuestionProgress({ currentQuestion, totalQuestions, subject }: QuestionProgressProps) {
  if (currentQuestion === null || totalQuestions === null) return null

  const colors = subjectColors[subject]
  const pct = Math.round((currentQuestion / totalQuestions) * 100)

  return (
    <div className="bg-white rounded-2xl border-2 border-slate-100 shadow-sm px-4 py-3">
      <div className="flex items-center justify-between mb-2">
        <span className="text-sm font-medium text-slate-700">
          Question {currentQuestion} of {totalQuestions}
        </span>
        <span className={cn('text-sm font-medium', colors.text)}>{pct}%</span>
      </div>
      <div className={cn('h-2.5 rounded-full overflow-hidden', colors.track)}>
        <div
          className={cn('h-full rounded-full transition-all duration-500 ease-out', colors.fill)}
          style={{ width: `${pct}%` }}
        />
      </div>
    </div>
  )
}
