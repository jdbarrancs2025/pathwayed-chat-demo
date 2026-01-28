import { Calculator, BookOpen, PenTool, Check, Hourglass } from 'lucide-react'
import { cn } from '@/lib/utils'
import { focusAreaLabels } from '@/lib/practiceQuestions'
import type { FocusAreas, Progress, Subject } from '@/lib/types'

interface TodaysFocusPanelProps {
  focusAreas: FocusAreas
  progress: Progress
}

const subjectConfig: Record<
  Subject,
  { icon: typeof Calculator; label: string; color: string; bgColor: string }
> = {
  math: {
    icon: Calculator,
    label: 'Math',
    color: 'text-blue-600',
    bgColor: 'bg-blue-100',
  },
  reading: {
    icon: BookOpen,
    label: 'Reading',
    color: 'text-emerald-600',
    bgColor: 'bg-emerald-100',
  },
  writing: {
    icon: PenTool,
    label: 'Writing',
    color: 'text-amber-600',
    bgColor: 'bg-amber-100',
  },
}

export function TodaysFocusPanel({ focusAreas, progress }: TodaysFocusPanelProps) {
  const subjects: Subject[] = ['math', 'reading', 'writing']

  const hasAnyFocusAreas = subjects.some(
    (subject) => focusAreas[subject].length > 0
  )

  if (!hasAnyFocusAreas) {
    return null
  }

  return (
    <div className="relative overflow-hidden bg-gradient-to-br from-white to-slate-50/80 rounded-2xl border border-slate-200/80 shadow-sm p-4 sm:p-5">
      {/* Subtle decorative gradient overlay */}
      <div className="absolute top-0 right-0 w-32 h-32 bg-gradient-to-bl from-primary/5 to-transparent rounded-bl-full -z-0" />

      {/* Header with accent bar */}
      <div className="relative flex items-center gap-3 mb-4">
        <div className="w-1 h-5 bg-gradient-to-b from-[#e85a24] to-[#f97316] rounded-full" />
        <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider">
          Today's Focus
        </h2>
      </div>

      <div className="relative space-y-3">
        {subjects.map((subject) => {
          const areas = focusAreas[subject]
          if (areas.length === 0) return null

          const config = subjectConfig[subject]
          const Icon = config.icon
          const isComplete = progress[subject] === 'complete'

          return (
            <div
              key={subject}
              className={cn(
                'flex items-start gap-3 p-3.5 rounded-xl transition-all duration-200',
                isComplete
                  ? 'bg-gradient-to-r from-green-50/80 to-emerald-50/50 border border-green-100/50'
                  : 'bg-slate-50/80 border border-slate-100/50 hover:bg-slate-100/50'
              )}
            >
              {/* Subject icon */}
              <div className={cn('p-2.5 rounded-xl shadow-sm', config.bgColor)}>
                <Icon className={cn('h-4 w-4', config.color)} />
              </div>

              {/* Focus areas */}
              <div className="flex-1 min-w-0">
                <span className={cn('font-semibold text-sm', config.color)}>
                  {config.label}
                </span>
                <p className="text-xs text-muted-foreground mt-0.5 truncate">
                  {areas.map((area) => focusAreaLabels[area] || area).join(', ')}
                </p>
              </div>

              {/* Status */}
              <div
                className={cn(
                  'p-2 rounded-xl flex-shrink-0 transition-all duration-300',
                  isComplete
                    ? 'bg-gradient-to-br from-green-100 to-emerald-100 shadow-sm'
                    : 'bg-slate-200/80'
                )}
              >
                {isComplete ? (
                  <Check className="h-3.5 w-3.5 text-green-600" />
                ) : (
                  <Hourglass className="h-3.5 w-3.5 text-slate-500" />
                )}
              </div>
            </div>
          )
        })}
      </div>
    </div>
  )
}
