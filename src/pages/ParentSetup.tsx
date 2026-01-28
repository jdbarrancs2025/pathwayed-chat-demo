import { useNavigate } from 'react-router'
import { PageLayout } from '@/components/PageLayout'
import { Button } from '@/components/ui/button'

export function ParentSetup() {
  const navigate = useNavigate()

  const handleContinue = () => {
    navigate('/student')
  }

  return (
    <PageLayout title="Parent Setup" showBack backTo="/">
      <div className="flex flex-col items-center text-center">
        <h1 className="text-2xl sm:text-3xl font-bold text-primary mb-2">
          Parent Setup
        </h1>
        <p className="text-muted-foreground mb-8 max-w-sm">
          Configure your child's learning preferences and schedule
        </p>

        <div className="w-full p-6 bg-secondary/50 rounded-xl mb-6">
          <p className="text-sm text-muted-foreground">
            Schedule and focus area configuration will be implemented in Phase 7
          </p>
        </div>

        <Button onClick={handleContinue} className="w-full">
          Continue to Student View
        </Button>
      </div>
    </PageLayout>
  )
}
