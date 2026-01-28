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
    <div className="bg-white rounded-2xl border-2 border-slate-100 shadow-sm p-4 sm:p-5">
      <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider mb-4">
        Today's Focus
      </h2>

      <div className="space-y-3">
        {subjects.map((subject) => {
          const areas = focusAreas[subject]
          if (areas.length === 0) return null

          const config = subjectConfig[subject]
          const Icon = config.icon
          const isComplete = progress[subject] === 'complete'

          return (
            <div
              key={subject}
              className="flex items-start gap-3 p-3 rounded-xl bg-slate-50"
            >
              {/* Subject icon */}
              <div className={cn('p-2 rounded-lg', config.bgColor)}>
                <Icon className={cn('h-4 w-4', config.color)} />
              </div>

              {/* Focus areas */}
              <div className="flex-1 min-w-0">
                <span className={cn('font-medium text-sm', config.color)}>
                  {config.label}
                </span>
                <p className="text-xs text-muted-foreground mt-0.5 truncate">
                  {areas.map((area) => focusAreaLabels[area] || area).join(', ')}
                </p>
              </div>

              {/* Status */}
              <div
                className={cn(
                  'p-1.5 rounded-full flex-shrink-0',
                  isComplete ? 'bg-green-100' : 'bg-slate-200'
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
