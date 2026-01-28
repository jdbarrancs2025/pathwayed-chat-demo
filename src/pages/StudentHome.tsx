import { useNavigate } from 'react-router'
import { Calculator, BookOpen, PenTool } from 'lucide-react'
import { PageLayout } from '@/components/PageLayout'
import { Button } from '@/components/ui/button'
import { useAppContext } from '@/context/AppContext'
import type { Subject } from '@/lib/types'

const subjects: { id: Subject; label: string; icon: typeof Calculator; color: string }[] = [
  { id: 'math', label: 'Math', icon: Calculator, color: 'bg-blue-500 hover:bg-blue-600' },
  { id: 'reading', label: 'Reading', icon: BookOpen, color: 'bg-green-500 hover:bg-green-600' },
  { id: 'writing', label: 'Writing', icon: PenTool, color: 'bg-purple-500 hover:bg-purple-600' },
]

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

  return (
    <PageLayout title="Choose a Subject">
      <div className="flex flex-col items-center text-center">
        <h1 className="text-2xl sm:text-3xl font-bold text-primary mb-2">
          Hi there!
        </h1>
        <p className="text-muted-foreground mb-8 max-w-sm">
          What would you like to work on today?
        </p>

        <div className="w-full grid gap-4 mb-8">
          {subjects.map(({ id, label, icon: Icon, color }) => (
            <Button
              key={id}
              onClick={() => handleSubjectClick(id)}
              className={`w-full h-auto py-5 flex items-center gap-4 text-white ${color}`}
            >
              <Icon className="h-7 w-7" />
              <span className="text-xl font-semibold">{label}</span>
            </Button>
          ))}
        </div>

        <Button
          variant="ghost"
          onClick={handleParentView}
          className="text-muted-foreground"
        >
          Parent/Teacher View
        </Button>
      </div>
    </PageLayout>
  )
}
