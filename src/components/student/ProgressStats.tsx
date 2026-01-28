import { Clock, CheckCircle2 } from 'lucide-react'
import type { Progress } from '@/lib/types'

interface ProgressStatsProps {
  progress: Progress
}

export function ProgressStats({ progress }: ProgressStatsProps) {
  // Count completed subjects
  const completedCount = Object.values(progress).filter(
    (status) => status === 'complete'
  ).length
  const totalCount = Object.keys(progress).length

  return (
    <div className="grid grid-cols-2 gap-3">
      {/* Time today - hardcoded as per spec */}
      <div className="bg-white rounded-xl border-2 border-slate-100 p-4 flex items-center gap-3">
        <div className="p-2 rounded-lg bg-primary/10">
          <Clock className="h-5 w-5 text-primary" />
        </div>
        <div>
          <span className="block text-lg font-bold text-primary">12 min</span>
          <span className="text-xs text-muted-foreground">Time today</span>
        </div>
      </div>

      {/* Activities completed */}
      <div className="bg-white rounded-xl border-2 border-slate-100 p-4 flex items-center gap-3">
        <div className="p-2 rounded-lg bg-accent/10">
          <CheckCircle2 className="h-5 w-5 text-accent" />
        </div>
        <div>
          <span className="block text-lg font-bold text-primary">
            {completedCount} of {totalCount}
          </span>
          <span className="text-xs text-muted-foreground">Completed</span>
        </div>
      </div>
    </div>
  )
}
