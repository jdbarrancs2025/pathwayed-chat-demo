import { Lightbulb, HelpCircle } from 'lucide-react'
import type { FocusAreaQuestions } from '@/lib/practiceQuestions'

interface PracticeSectionProps {
  questions: FocusAreaQuestions
}

export function PracticeSection({ questions }: PracticeSectionProps) {
  return (
    <div className="bg-white rounded-2xl border-2 border-slate-100 shadow-sm overflow-hidden">
      {/* Header */}
      <div className="bg-gradient-to-r from-primary/5 to-accent/5 px-4 py-3 border-b border-slate-100">
        <h2 className="font-semibold text-primary">{questions.title}</h2>
        <p className="text-sm text-muted-foreground mt-0.5">
          {questions.description}
        </p>
      </div>

      {/* Questions */}
      <div className="p-4 space-y-4">
        {questions.questions.map((q, index) => (
          <div key={q.id} className="flex gap-3">
            {/* Question number */}
            <div className="flex-shrink-0 w-7 h-7 rounded-full bg-primary/10 flex items-center justify-center">
              <span className="text-sm font-semibold text-primary">
                {index + 1}
              </span>
            </div>

            {/* Question content */}
            <div className="flex-1 min-w-0">
              <p className="text-sm text-slate-700 leading-relaxed">
                {q.question}
              </p>
              {q.hint && (
                <div className="flex items-start gap-2 mt-2 p-2.5 bg-amber-50 rounded-lg">
                  <Lightbulb className="h-4 w-4 text-amber-600 flex-shrink-0 mt-0.5" />
                  <p className="text-xs text-amber-800">
                    <span className="font-medium">Hint:</span> {q.hint}
                  </p>
                </div>
              )}
            </div>
          </div>
        ))}
      </div>

      {/* Help prompt */}
      <div className="px-4 py-3 bg-slate-50 border-t border-slate-100">
        <div className="flex items-center gap-2 text-sm text-muted-foreground">
          <HelpCircle className="h-4 w-4" />
          <span>Need help? Ask N.I.K.K.I. below!</span>
        </div>
      </div>
    </div>
  )
}
