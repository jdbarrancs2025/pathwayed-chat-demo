import { useNavigate } from 'react-router'
import { PageLayout } from '@/components/PageLayout'
import { Button } from '@/components/ui/button'

export function ParentDashboard() {
  const navigate = useNavigate()

  const handleBackToStudent = () => {
    navigate('/student')
  }

  const handleNewSession = () => {
    navigate('/')
  }

  return (
    <PageLayout title="Parent Dashboard" showBack backTo="/student">
      <div className="flex flex-col items-center text-center">
        <h1 className="text-2xl sm:text-3xl font-bold text-primary mb-2">
          Parent Dashboard
        </h1>
        <p className="text-muted-foreground mb-8 max-w-sm">
          Track your child's learning progress over time
        </p>

        <div className="w-full p-6 bg-secondary/50 rounded-xl mb-6">
          <p className="text-sm text-muted-foreground">
            Progress tracking and analytics will be implemented in Phase 9
          </p>
        </div>

        <div className="w-full space-y-3">
          <Button onClick={handleBackToStudent} className="w-full">
            Back to Student View
          </Button>
          <Button onClick={handleNewSession} variant="outline" className="w-full">
            Start New Session
          </Button>
        </div>
      </div>
    </PageLayout>
  )
}
