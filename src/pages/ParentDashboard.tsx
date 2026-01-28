import { useNavigate } from 'react-router'
import {
  Clock,
  BookOpen,
  Flame,
  Calculator,
  PenTool,
  AlertTriangle,
  Settings,
  LayoutDashboard,
  TrendingUp,
} from 'lucide-react'
import { PageLayout } from '@/components/PageLayout'
import { Button } from '@/components/ui/button'
import { useAppContext } from '@/context/AppContext'
import type { Subject, ProgressStatus } from '@/lib/types'

const subjectConfig = {
  math: {
    icon: Calculator,
    label: 'Math',
    color: 'text-blue-600',
    bgColor: 'bg-blue-50',
    borderColor: 'border-blue-200',
    accentColor: 'bg-blue-600',
    progressColor: 'bg-blue-500',
    lightAccent: 'bg-blue-100',
  },
  reading: {
    icon: BookOpen,
    label: 'Reading',
    color: 'text-emerald-600',
    bgColor: 'bg-emerald-50',
    borderColor: 'border-emerald-200',
    accentColor: 'bg-emerald-600',
    progressColor: 'bg-emerald-500',
    lightAccent: 'bg-emerald-100',
  },
  writing: {
    icon: PenTool,
    label: 'Writing',
    color: 'text-amber-600',
    bgColor: 'bg-amber-50',
    borderColor: 'border-amber-200',
    accentColor: 'bg-amber-600',
    progressColor: 'bg-amber-500',
    lightAccent: 'bg-amber-100',
  },
} as const

function getProgressPercent(status: ProgressStatus): number {
  switch (status) {
    case 'complete':
      return 100
    case 'in-progress':
      return 50
    default:
      return 0
  }
}

function getProgressLabel(status: ProgressStatus): string {
  switch (status) {
    case 'complete':
      return 'Complete'
    case 'in-progress':
      return 'In Progress'
    default:
      return 'Not Started'
  }
}

export function ParentDashboard() {
  const navigate = useNavigate()
  const { state } = useAppContext()

  const handleBackToStudent = () => {
    navigate('/student')
  }

  const handleChangeGoals = () => {
    navigate('/parent-setup')
  }

  // Get subjects with assigned focus areas
  const activeSubjects = (Object.keys(state.focusAreas) as Subject[]).filter(
    (subject) => state.focusAreas[subject].length > 0
  )

  // Get subjects that need attention (not-started status)
  const needsAttentionSubjects = activeSubjects.filter(
    (subject) => state.progress[subject] === 'not-started'
  )

  // Calculate stats
  const activeSubjectCount = activeSubjects.length
  const totalSubjects = 3

  return (
    <PageLayout title="Parent Dashboard" showBack backTo="/student">
      <div className="space-y-6 pb-6 animate-in fade-in slide-in-from-bottom-2 duration-300">
        {/* Header */}
        <div className="text-center relative">
          <div className="absolute inset-0 -top-4 bg-gradient-to-b from-primary/5 to-transparent rounded-3xl -z-10" />
          <div className="inline-flex items-center justify-center w-12 h-12 rounded-2xl bg-gradient-to-br from-primary/10 to-[#e85a24]/10 mb-3">
            <LayoutDashboard className="h-6 w-6 text-primary" />
          </div>
          <h1 className="text-2xl sm:text-3xl font-bold text-primary mb-2">
            Jordan's Learning Dashboard
          </h1>
          <p className="text-muted-foreground text-sm sm:text-base max-w-md mx-auto">
            Track progress and manage learning goals
          </p>
        </div>

        {/* Stats Cards */}
        <section className="space-y-3">
          <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider flex items-center gap-3">
            <span className="h-px flex-1 bg-gradient-to-r from-transparent via-border to-border" />
            <span className="flex items-center gap-2">
              <span className="w-1.5 h-1.5 rounded-full bg-[#e85a24]" />
              This Week
            </span>
            <span className="h-px flex-1 bg-gradient-to-l from-transparent via-border to-border" />
          </h2>

          <div className="grid grid-cols-3 gap-3">
            {/* Practice Time Card */}
            <div className="relative group">
              <div className="absolute -inset-0.5 bg-gradient-to-br from-primary/20 to-[#e85a24]/20 rounded-xl opacity-0 group-hover:opacity-100 blur-sm transition-opacity duration-300" />
              <div className="relative p-4 bg-gradient-to-br from-white to-slate-50 rounded-xl border border-slate-200/50 shadow-sm text-center">
                <div className="mx-auto mb-2 w-10 h-10 rounded-xl bg-gradient-to-br from-primary/10 to-primary/5 flex items-center justify-center">
                  <Clock className="h-5 w-5 text-primary" />
                </div>
                <p className="text-2xl font-bold text-primary">52</p>
                <p className="text-xs text-muted-foreground">min</p>
                <p className="text-[10px] text-muted-foreground/70 mt-1 font-medium uppercase tracking-wide">
                  This Week
                </p>
              </div>
            </div>

            {/* Subjects Active Card */}
            <div className="relative group">
              <div className="absolute -inset-0.5 bg-gradient-to-br from-emerald-500/20 to-emerald-600/20 rounded-xl opacity-0 group-hover:opacity-100 blur-sm transition-opacity duration-300" />
              <div className="relative p-4 bg-gradient-to-br from-white to-slate-50 rounded-xl border border-slate-200/50 shadow-sm text-center">
                <div className="mx-auto mb-2 w-10 h-10 rounded-xl bg-gradient-to-br from-emerald-500/10 to-emerald-500/5 flex items-center justify-center">
                  <BookOpen className="h-5 w-5 text-emerald-600" />
                </div>
                <p className="text-2xl font-bold text-emerald-600">
                  {activeSubjectCount}
                </p>
                <p className="text-xs text-muted-foreground">of {totalSubjects}</p>
                <p className="text-[10px] text-muted-foreground/70 mt-1 font-medium uppercase tracking-wide">
                  Subjects Active
                </p>
              </div>
            </div>

            {/* Learning Streak Card */}
            <div className="relative group">
              <div className="absolute -inset-0.5 bg-gradient-to-br from-orange-500/20 to-red-500/20 rounded-xl opacity-0 group-hover:opacity-100 blur-sm transition-opacity duration-300" />
              <div className="relative p-4 bg-gradient-to-br from-white to-slate-50 rounded-xl border border-slate-200/50 shadow-sm text-center">
                <div className="mx-auto mb-2 w-10 h-10 rounded-xl bg-gradient-to-br from-orange-500/10 to-red-500/5 flex items-center justify-center">
                  <Flame className="h-5 w-5 text-orange-500" />
                </div>
                <p className="text-2xl font-bold text-orange-500">4</p>
                <p className="text-xs text-muted-foreground">days</p>
                <p className="text-[10px] text-muted-foreground/70 mt-1 font-medium uppercase tracking-wide">
                  Learning Streak
                </p>
              </div>
            </div>
          </div>
        </section>

        {/* Progress By Subject */}
        {activeSubjects.length > 0 && (
          <section className="space-y-4">
            <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider flex items-center gap-3">
              <span className="h-px flex-1 bg-gradient-to-r from-transparent via-border to-border" />
              <span className="flex items-center gap-2">
                <span className="w-1.5 h-1.5 rounded-full bg-[#e85a24]" />
                Progress by Subject
              </span>
              <span className="h-px flex-1 bg-gradient-to-l from-transparent via-border to-border" />
            </h2>

            <div className="space-y-3">
              {activeSubjects.map((subject) => {
                const config = subjectConfig[subject]
                const Icon = config.icon
                const progressStatus = state.progress[subject]
                const progressPercent = getProgressPercent(progressStatus)
                const progressLabel = getProgressLabel(progressStatus)
                const focusAreaCount = state.focusAreas[subject].length

                return (
                  <div
                    key={subject}
                    className={`rounded-xl border-2 ${config.borderColor} ${config.bgColor} p-4 transition-all duration-200`}
                  >
                    {/* Subject header */}
                    <div className="flex items-center justify-between mb-3">
                      <div className="flex items-center gap-3">
                        <div
                          className={`p-2 rounded-lg ${config.accentColor} text-white shadow-sm`}
                        >
                          <Icon className="h-4 w-4" />
                        </div>
                        <div>
                          <span className={`font-semibold ${config.color} block`}>
                            {config.label}
                          </span>
                          <span className="text-xs text-muted-foreground">
                            {focusAreaCount} focus area{focusAreaCount !== 1 ? 's' : ''}
                          </span>
                        </div>
                      </div>
                      <div className="text-right">
                        <span className={`text-sm font-semibold ${config.color}`}>
                          {progressPercent}%
                        </span>
                        <span className="text-xs text-muted-foreground block">
                          {progressLabel}
                        </span>
                      </div>
                    </div>

                    {/* Progress bar */}
                    <div className="h-2.5 bg-white/70 rounded-full overflow-hidden shadow-inner">
                      <div
                        className={`h-full ${config.progressColor} rounded-full transition-all duration-500 ease-out`}
                        style={{ width: `${progressPercent}%` }}
                      />
                    </div>
                  </div>
                )
              })}
            </div>
          </section>
        )}

        {/* Needs Attention Card */}
        {needsAttentionSubjects.length > 0 && (
          <section className="space-y-3 animate-in fade-in slide-in-from-bottom-2 duration-300">
            <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider flex items-center gap-3">
              <span className="h-px flex-1 bg-gradient-to-r from-transparent via-border to-border" />
              <span className="flex items-center gap-2">
                <span className="w-1.5 h-1.5 rounded-full bg-amber-500" />
                Needs Attention
              </span>
              <span className="h-px flex-1 bg-gradient-to-l from-transparent via-border to-border" />
            </h2>

            <div className="relative">
              <div className="absolute -inset-0.5 bg-gradient-to-r from-amber-400/30 via-amber-500/20 to-amber-400/30 rounded-2xl blur-sm opacity-60" />
              <div className="relative p-4 bg-gradient-to-br from-amber-50 to-amber-100/50 rounded-xl border-2 border-amber-200 shadow-sm">
                <div className="flex items-start gap-3">
                  <div className="flex-shrink-0 p-2 rounded-lg bg-amber-500 text-white shadow-sm">
                    <AlertTriangle className="h-4 w-4" />
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="font-semibold text-amber-800 text-sm mb-1">
                      {needsAttentionSubjects.length} subject
                      {needsAttentionSubjects.length !== 1 ? 's' : ''} not started
                    </p>
                    <p className="text-amber-700 text-xs leading-relaxed">
                      {needsAttentionSubjects
                        .map((s) => subjectConfig[s].label)
                        .join(', ')}{' '}
                      {needsAttentionSubjects.length === 1 ? 'hasn\'t' : 'haven\'t'} been
                      practiced yet this week.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </section>
        )}

        {/* No Active Subjects Message */}
        {activeSubjects.length === 0 && (
          <section className="space-y-3">
            <div className="relative">
              <div className="absolute -inset-0.5 bg-gradient-to-r from-[#1e3a6e]/20 via-[#e85a24]/20 to-[#1e3a6e]/20 rounded-2xl opacity-50 blur-sm" />
              <div className="relative p-6 bg-gradient-to-br from-white to-slate-50 rounded-xl border border-slate-200/50 text-center">
                <div className="mx-auto mb-3 w-12 h-12 rounded-2xl bg-gradient-to-br from-primary/10 to-[#e85a24]/10 flex items-center justify-center">
                  <TrendingUp className="h-6 w-6 text-primary/60" />
                </div>
                <p className="text-muted-foreground text-sm mb-1">
                  No learning goals set yet
                </p>
                <p className="text-xs text-muted-foreground/70">
                  Set up subjects and focus areas to start tracking progress
                </p>
              </div>
            </div>
          </section>
        )}

        {/* Action Buttons */}
        <section className="space-y-3 pt-2">
          <div className="grid grid-cols-2 gap-3">
            <Button
              onClick={handleChangeGoals}
              variant="outline"
              className="h-12 font-semibold rounded-xl border-2 hover:bg-slate-50 transition-all flex items-center justify-center gap-2"
            >
              <TrendingUp className="h-4 w-4" />
              Change Goals
            </Button>
            <Button
              onClick={handleChangeGoals}
              variant="outline"
              className="h-12 font-semibold rounded-xl border-2 hover:bg-slate-50 transition-all flex items-center justify-center gap-2"
            >
              <Settings className="h-4 w-4" />
              Change Schedule
            </Button>
          </div>

          <Button
            onClick={handleBackToStudent}
            className="w-full h-12 text-base font-semibold rounded-xl shadow-lg shadow-primary/20 transition-all duration-200 hover:shadow-xl hover:shadow-primary/30"
          >
            Back to Student View
          </Button>
        </section>
      </div>
    </PageLayout>
  )
}
