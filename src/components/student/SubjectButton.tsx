import { Calculator, BookOpen, PenTool, Check, Hourglass, Clock } from 'lucide-react'
import { cn } from '@/lib/utils'
import type { Subject, ProgressStatus } from '@/lib/types'

interface SubjectButtonProps {
  subject: Subject
  focusAreaCount: number
  progressStatus: ProgressStatus
  onClick: () => void
}

const subjectConfig: Record<
  Subject,
  {
    icon: typeof Calculator
    label: string
    bgColor: string
    hoverColor: string
    iconBg: string
  }
> = {
  math: {
    icon: Calculator,
    label: 'Math',
    bgColor: 'bg-blue-500',
    hoverColor: 'hover:bg-blue-600',
    iconBg: 'bg-blue-600',
  },
  reading: {
    icon: BookOpen,
    label: 'Reading',
    bgColor: 'bg-emerald-500',
    hoverColor: 'hover:bg-emerald-600',
    iconBg: 'bg-emerald-600',
  },
  writing: {
    icon: PenTool,
    label: 'Writing',
    bgColor: 'bg-amber-500',
    hoverColor: 'hover:bg-amber-600',
    iconBg: 'bg-amber-600',
  },
}

const statusIcons: Record<ProgressStatus, { icon: typeof Check; label: string }> = {
  complete: { icon: Check, label: 'Completed' },
  'in-progress': { icon: Hourglass, label: 'In progress' },
  'not-started': { icon: Clock, label: 'Not started' },
}

export function SubjectButton({
  subject,
  focusAreaCount,
  progressStatus,
  onClick,
}: SubjectButtonProps) {
  const config = subjectConfig[subject]
  const Icon = config.icon
  const StatusIcon = statusIcons[progressStatus].icon

  return (
    <button
      onClick={onClick}
      className={cn(
        'w-full p-4 rounded-2xl text-white transition-all duration-200',
        'flex items-center gap-4',
        'shadow-lg hover:shadow-xl active:scale-[0.98]',
        config.bgColor,
        config.hoverColor
      )}
    >
      {/* Subject icon */}
      <div className={cn('p-3 rounded-xl', config.iconBg)}>
        <Icon className="h-6 w-6" />
      </div>

      {/* Subject info */}
      <div className="flex-1 text-left">
        <span className="block text-lg font-semibold">{config.label}</span>
        {focusAreaCount > 0 && (
          <span className="text-sm text-white/80">
            {focusAreaCount} focus {focusAreaCount === 1 ? 'area' : 'areas'}
          </span>
        )}
      </div>

      {/* Progress indicator */}
      <div
        className={cn(
          'p-2 rounded-full',
          progressStatus === 'complete'
            ? 'bg-white/30'
            : progressStatus === 'in-progress'
              ? 'bg-white/20'
              : 'bg-white/10'
        )}
        title={statusIcons[progressStatus].label}
      >
        <StatusIcon
          className={cn(
            'h-5 w-5',
            progressStatus === 'complete' ? 'text-white' : 'text-white/70'
          )}
        />
      </div>
    </button>
  )
}
