import { useNavigate } from 'react-router'
import { School, Home } from 'lucide-react'
import { PageLayout } from '@/components/PageLayout'
import { Button } from '@/components/ui/button'
import { useAppContext } from '@/context/AppContext'

export function AccountSetup() {
  const navigate = useNavigate()
  const { setMode } = useAppContext()

  const handleSchoolMode = () => {
    setMode('school')
    navigate('/teacher-setup')
  }

  const handleHomeMode = () => {
    setMode('home')
    navigate('/parent-setup')
  }

  return (
    <PageLayout title="Welcome">
      <div className="flex flex-col items-center text-center">
        <h1 className="text-2xl sm:text-3xl font-bold text-primary mb-2">
          Welcome to PathwayEd
        </h1>
        <p className="text-muted-foreground mb-8 max-w-sm">
          Choose how you'd like to use PathwayEd today
        </p>

        <div className="w-full space-y-4">
          <Button
            onClick={handleSchoolMode}
            className="w-full h-auto py-6 flex flex-col items-center gap-3 bg-primary hover:bg-primary/90"
          >
            <School className="h-8 w-8" />
            <div>
              <div className="font-semibold text-lg">School Mode</div>
              <div className="text-sm text-primary-foreground/80">
                For classroom use with teacher oversight
              </div>
            </div>
          </Button>

          <Button
            onClick={handleHomeMode}
            variant="outline"
            className="w-full h-auto py-6 flex flex-col items-center gap-3 border-2 hover:bg-accent hover:text-accent-foreground hover:border-accent"
          >
            <Home className="h-8 w-8" />
            <div>
              <div className="font-semibold text-lg">Home Mode</div>
              <div className="text-sm opacity-80">
                For independent learning at home
              </div>
            </div>
          </Button>
        </div>
      </div>
    </PageLayout>
  )
}
