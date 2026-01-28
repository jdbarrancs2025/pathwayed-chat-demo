import { useNavigate } from 'react-router'
import {
  Clock,
  CalendarDays,
  Target,
  CheckCircle2,
  Timer,
  MessageSquare,
  Calculator,
  BookOpen,
  PenTool,
  GraduationCap,
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
  },
  reading: {
    icon: BookOpen,
    label: 'Reading',
    color: 'text-emerald-600',
    bgColor: 'bg-emerald-50',
    borderColor: 'border-emerald-200',
    accentColor: 'bg-emerald-600',
  },
  writing: {
    icon: PenTool,
    label: 'Writing',
    color: 'text-amber-600',
    bgColor: 'bg-amber-50',
    borderColor: 'border-amber-200',
    accentColor: 'bg-amber-600',
  },
} as const

const focusAreaLabels: Record<string, string> = {
  fractions: 'Fractions',
  geometry: 'Geometry',
  'word-problems': 'Word Problems',
  multiplication: 'Multiplication',
  division: 'Division',
  'main-idea': 'Main Idea',
  vocabulary: 'Vocabulary',
  'reading-comprehension': 'Reading Comprehension',
  'short-response': 'Short Response',
  'paragraph-writing': 'Paragraph Writing',
  'sentence-writing': 'Sentence Writing',
  'creative-writing': 'Creative Writing',
}

function getStatusConfig(status: ProgressStatus) {
  switch (status) {
    case 'complete':
      return {
        icon: CheckCircle2,
        label: 'Complete',
        bgColor: 'bg-emerald-50',
        textColor: 'text-emerald-700',
        iconColor: 'text-emerald-500',
        borderColor: 'border-emerald-200',
      }
    case 'in-progress':
      return {
        icon: Timer,
        label: 'In Progress',
        bgColor: 'bg-amber-50',
        textColor: 'text-amber-700',
        iconColor: 'text-amber-500',
        borderColor: 'border-amber-200',
      }
    default:
      return {
        icon: Clock,
        label: 'Not Started',
        bgColor: 'bg-slate-50',
        textColor: 'text-slate-500',
        iconColor: 'text-slate-400',
        borderColor: 'border-slate-200',
      }
  }
}

export function ParentView() {
  const navigate = useNavigate()
  const { state } = useAppContext()

  const handleBackToStudent = () => {
    navigate('/student')
  }

  const handleNewSession = () => {
    navigate('/')
  }

  // Calculate stats based on focus areas and progress
  const totalSkills = Object.values(state.focusAreas).flat().length
  const completedSubjects = Object.values(state.progress).filter(
    (p) => p === 'complete'
  ).length
  const completedSkills = completedSubjects > 0 ? Math.min(completedSubjects, totalSkills) : 0

  // Get all subjects with assigned focus areas
  const assignedSubjects = (Object.keys(state.focusAreas) as Subject[]).filter(
    (subject) => state.focusAreas[subject].length > 0
  )

  return (
    <PageLayout title="School Assignments" showBack backTo="/student">
      <div className="space-y-6 pb-6 animate-in fade-in slide-in-from-bottom-2 duration-300">
        {/* Header */}
        <div className="text-center relative">
          <div className="absolute inset-0 -top-4 bg-gradient-to-b from-primary/5 to-transparent rounded-3xl -z-10" />
          <div className="inline-flex items-center justify-center w-12 h-12 rounded-2xl bg-gradient-to-br from-primary/10 to-[#e85a24]/10 mb-3">
            <GraduationCap className="h-6 w-6 text-primary" />
          </div>
          <h1 className="text-2xl sm:text-3xl font-bold text-primary mb-2">
            This Week's School Assignments
          </h1>
          <p className="text-muted-foreground text-sm sm:text-base max-w-md mx-auto">
            View Jordan's assigned practice from Ms. Martinez
          </p>
        </div>

        {/* Stats Cards */}
        <section className="space-y-3">
          <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider flex items-center gap-3">
            <span className="h-px flex-1 bg-gradient-to-r from-transparent via-border to-border" />
            <span className="flex items-center gap-2">
              <span className="w-1.5 h-1.5 rounded-full bg-[#e85a24]" />
              Weekly Progress
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
                <p className="text-2xl font-bold text-primary">47</p>
                <p className="text-xs text-muted-foreground">min</p>
                <p className="text-[10px] text-muted-foreground/70 mt-1 font-medium uppercase tracking-wide">
                  Practice Time
                </p>
              </div>
            </div>

            {/* Days Active Card */}
            <div className="relative group">
              <div className="absolute -inset-0.5 bg-gradient-to-br from-emerald-500/20 to-emerald-600/20 rounded-xl opacity-0 group-hover:opacity-100 blur-sm transition-opacity duration-300" />
              <div className="relative p-4 bg-gradient-to-br from-white to-slate-50 rounded-xl border border-slate-200/50 shadow-sm text-center">
                <div className="mx-auto mb-2 w-10 h-10 rounded-xl bg-gradient-to-br from-emerald-500/10 to-emerald-500/5 flex items-center justify-center">
                  <CalendarDays className="h-5 w-5 text-emerald-600" />
                </div>
                <p className="text-2xl font-bold text-emerald-600">3</p>
                <p className="text-xs text-muted-foreground">of 5</p>
                <p className="text-[10px] text-muted-foreground/70 mt-1 font-medium uppercase tracking-wide">
                  Days Active
                </p>
              </div>
            </div>

            {/* Skills Complete Card */}
            <div className="relative group">
              <div className="absolute -inset-0.5 bg-gradient-to-br from-amber-500/20 to-[#e85a24]/20 rounded-xl opacity-0 group-hover:opacity-100 blur-sm transition-opacity duration-300" />
              <div className="relative p-4 bg-gradient-to-br from-white to-slate-50 rounded-xl border border-slate-200/50 shadow-sm text-center">
                <div className="mx-auto mb-2 w-10 h-10 rounded-xl bg-gradient-to-br from-[#e85a24]/10 to-amber-500/5 flex items-center justify-center">
                  <Target className="h-5 w-5 text-[#e85a24]" />
                </div>
                <p className="text-2xl font-bold text-[#e85a24]">{completedSkills}</p>
                <p className="text-xs text-muted-foreground">of {totalSkills || 5}</p>
                <p className="text-[10px] text-muted-foreground/70 mt-1 font-medium uppercase tracking-wide">
                  Skills Complete
                </p>
              </div>
            </div>
          </div>
        </section>

        {/* Assigned Skills Section */}
        <section className="space-y-4">
          <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider flex items-center gap-3">
            <span className="h-px flex-1 bg-gradient-to-r from-transparent via-border to-border" />
            <span className="flex items-center gap-2">
              <span className="w-1.5 h-1.5 rounded-full bg-[#e85a24]" />
              Assigned Skills
            </span>
            <span className="h-px flex-1 bg-gradient-to-l from-transparent via-border to-border" />
          </h2>

          {assignedSubjects.length > 0 ? (
            <div className="space-y-3">
              {assignedSubjects.map((subject) => {
                const config = subjectConfig[subject]
                const Icon = config.icon
                const focusAreas = state.focusAreas[subject]
                const progressStatus = state.progress[subject]
                const statusConfig = getStatusConfig(progressStatus)
                const StatusIcon = statusConfig.icon

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
                        <span className={`font-semibold ${config.color}`}>
                          {config.label}
                        </span>
                      </div>
                      {/* Status badge */}
                      <div
                        className={`flex items-center gap-1.5 px-2.5 py-1 rounded-full ${statusConfig.bgColor} border ${statusConfig.borderColor}`}
                      >
                        <StatusIcon className={`h-3.5 w-3.5 ${statusConfig.iconColor}`} />
                        <span className={`text-xs font-medium ${statusConfig.textColor}`}>
                          {statusConfig.label}
                        </span>
                      </div>
                    </div>

                    {/* Focus areas */}
                    <div className="flex flex-wrap gap-2">
                      {focusAreas.map((area) => (
                        <span
                          key={area}
                          className="px-3 py-1.5 bg-white/70 rounded-lg text-sm text-slate-600 font-medium border border-white/50 shadow-sm"
                        >
                          {focusAreaLabels[area] || area}
                        </span>
                      ))}
                    </div>
                  </div>
                )
              })}
            </div>
          ) : (
            <div className="relative">
              <div className="absolute -inset-0.5 bg-gradient-to-r from-[#1e3a6e]/20 via-[#e85a24]/20 to-[#1e3a6e]/20 rounded-2xl opacity-50 blur-sm" />
              <div className="relative p-6 bg-gradient-to-br from-white to-slate-50 rounded-xl border border-slate-200/50 text-center">
                <p className="text-muted-foreground text-sm">
                  No skills have been assigned yet.
                </p>
              </div>
            </div>
          )}
        </section>

        {/* Teacher Notes Card */}
        <section className="space-y-3">
          <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider flex items-center gap-3">
            <span className="h-px flex-1 bg-gradient-to-r from-transparent via-border to-border" />
            <span className="flex items-center gap-2">
              <span className="w-1.5 h-1.5 rounded-full bg-[#e85a24]" />
              Teacher Notes
            </span>
            <span className="h-px flex-1 bg-gradient-to-l from-transparent via-border to-border" />
          </h2>

          <div className="relative">
            <div className="absolute -inset-0.5 bg-gradient-to-r from-primary/20 via-[#e85a24]/15 to-primary/20 rounded-2xl blur-sm opacity-60" />
            <div className="relative p-5 bg-gradient-to-br from-white to-primary/5 rounded-xl border border-primary/10 shadow-sm">
              <div className="flex gap-4">
                <div className="flex-shrink-0">
                  <div className="w-11 h-11 rounded-full bg-gradient-to-br from-primary to-primary/80 flex items-center justify-center shadow-md">
                    <MessageSquare className="h-5 w-5 text-white" />
                  </div>
                </div>
                <div className="flex-1 min-w-0">
                  <p className="font-semibold text-primary text-sm mb-1">
                    Ms. Martinez
                  </p>
                  <p className="text-slate-600 text-sm leading-relaxed">
                    "Jordan is doing great with fractions! Let's keep practicing main idea this week."
                  </p>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* Footer Note */}
        <div className="text-center py-3">
          <p className="text-xs text-muted-foreground/70 max-w-xs mx-auto">
            Learning goals are set by Jordan's teacher. Contact school for changes.
          </p>
        </div>

        {/* Action Buttons */}
        <div className="space-y-3 pt-2">
          <Button
            onClick={handleBackToStudent}
            className="w-full h-12 text-base font-semibold rounded-xl shadow-lg shadow-primary/20 transition-all duration-200 hover:shadow-xl hover:shadow-primary/30"
          >
            Back to Student View
          </Button>
          <Button
            onClick={handleNewSession}
            variant="outline"
            className="w-full h-11 font-medium rounded-xl border-2 text-slate-700 hover:bg-slate-50 hover:text-slate-900 transition-all"
          >
            Start New Session
          </Button>
        </div>
      </div>
    </PageLayout>
  )
}
