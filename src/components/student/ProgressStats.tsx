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
      <div className="relative overflow-hidden bg-gradient-to-br from-white to-primary/5 rounded-xl border border-slate-200/80 p-4 flex items-center gap-3 shadow-sm hover:shadow-md transition-shadow duration-200">
        {/* Decorative gradient overlay */}
        <div className="absolute top-0 right-0 w-16 h-16 bg-gradient-to-bl from-primary/10 to-transparent rounded-bl-full" />
        <div className="relative p-2.5 rounded-xl bg-gradient-to-br from-primary/15 to-primary/5 shadow-sm">
          <Clock className="h-5 w-5 text-primary" />
        </div>
        <div className="relative">
          <span className="block text-lg font-bold text-primary">12 min</span>
          <span className="text-xs text-muted-foreground font-medium">Time today</span>
        </div>
      </div>

      {/* Activities completed */}
      <div className="relative overflow-hidden bg-gradient-to-br from-white to-[#e85a24]/5 rounded-xl border border-slate-200/80 p-4 flex items-center gap-3 shadow-sm hover:shadow-md transition-shadow duration-200">
        {/* Decorative gradient overlay */}
        <div className="absolute top-0 right-0 w-16 h-16 bg-gradient-to-bl from-[#e85a24]/10 to-transparent rounded-bl-full" />
        <div className="relative p-2.5 rounded-xl bg-gradient-to-br from-[#e85a24]/15 to-[#e85a24]/5 shadow-sm">
          <CheckCircle2 className="h-5 w-5 text-[#e85a24]" />
        </div>
        <div className="relative">
          <span className="block text-lg font-bold text-primary">
            {completedCount} of {totalCount}
          </span>
          <span className="text-xs text-muted-foreground font-medium">Completed</span>
        </div>
      </div>
    </div>
  )
}
