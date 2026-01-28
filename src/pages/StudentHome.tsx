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
        <div className="text-center">
          <h1 className="text-xl sm:text-2xl font-bold text-primary leading-snug max-w-md mx-auto">
            {headerText}
          </h1>
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
        <div className="pt-2">
          <Button
            variant="ghost"
            onClick={handleParentView}
            className="w-full text-muted-foreground hover:text-primary"
          >
            {state.mode === 'school' ? 'Parent/Teacher View' : 'Parent Dashboard'}
          </Button>
        </div>
      </div>
    </PageLayout>
  )
}
