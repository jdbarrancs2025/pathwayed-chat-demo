import { useNavigate } from 'react-router'
import { PageLayout } from '@/components/PageLayout'
import { Button } from '@/components/ui/button'
import { useAppContext } from '@/context/AppContext'
import {
  SubjectButton,
  TodaysFocusPanel,
  ProgressStats,
} from '@/components/student'
import type { Subject } from '@/lib/types'

const subjects: Subject[] = ['math', 'reading', 'writing']

export function StudentHome() {
  const navigate = useNavigate()
  const { state } = useAppContext()

  const handleSubjectClick = (subject: Subject) => {
    navigate(`/student/${subject}`)
  }

  const handleParentView = () => {
    if (state.mode === 'school') {
      navigate('/parent-view')
    } else {
      navigate('/parent-dashboard')
    }
  }

  // Dynamic header based on mode
  const headerText =
    state.mode === 'school'
      ? "Hi Jordan — here's what your teacher wants you to work on"
      : "Hi Jordan — here's what to work on today"

  return (
    <PageLayout title="Student Home">
      <div className="space-y-6 pb-6 animate-in fade-in slide-in-from-bottom-2 duration-300">
        {/* Dynamic greeting */}
        <div className="text-center relative">
          {/* Decorative background elements */}
          <div className="absolute -inset-4 -top-6 overflow-hidden rounded-3xl -z-10">
            <div className="absolute inset-0 bg-gradient-to-b from-primary/5 via-primary/3 to-transparent" />
            <div className="absolute top-0 left-1/4 w-24 h-24 bg-[#e85a24]/5 rounded-full blur-2xl" />
            <div className="absolute top-2 right-1/4 w-20 h-20 bg-primary/5 rounded-full blur-2xl" />
          </div>
          <h1 className="text-xl sm:text-2xl font-bold text-primary leading-snug max-w-md mx-auto py-2">
            {headerText}
          </h1>
          <p className="text-xs text-muted-foreground mt-1 font-medium">
            {state.mode === 'school'
              ? 'Assigned by Teacher / Program'
              : 'Practice Plan Set by Parent'}
          </p>
        </div>

        {/* N.I.K.K.I. recommendation */}
        <div className="flex items-center gap-3 px-4 py-3 rounded-xl bg-gradient-to-r from-primary/5 to-accent/5 border border-primary/10">
          <span className="text-lg">💬</span>
          <p className="text-sm text-muted-foreground">
            <span className="font-semibold text-primary">N.I.K.K.I.</span> recommends starting with{' '}
            <span className="font-semibold text-blue-600">Math</span> today
          </p>
        </div>

        {/* Subject buttons */}
        <div className="space-y-3">
          {subjects.map((subject) => (
            <SubjectButton
              key={subject}
              subject={subject}
              focusAreaCount={state.focusAreas[subject].length}
              progressStatus={state.progress[subject]}
              onClick={() => handleSubjectClick(subject)}
            />
          ))}
        </div>

        {/* Today's Focus panel */}
        <TodaysFocusPanel
          focusAreas={state.focusAreas}
          progress={state.progress}
        />

        {/* Progress stats */}
        <ProgressStats progress={state.progress} />

        {/* Parent/Teacher view link */}
        <div className="pt-4 px-2">
          <Button
            variant="ghost"
            onClick={handleParentView}
            className="w-full py-4 text-base font-medium text-muted-foreground hover:text-primary border border-slate-200 hover:border-accent"
          >
            {state.mode === 'school' ? 'Parent/Teacher View' : 'Parent Dashboard'}
          </Button>
        </div>
      </div>
    </PageLayout>
  )
}
