import { useNavigate } from 'react-router'
import { BarChart3 } from 'lucide-react'
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
      <div className="flex flex-col items-center text-center animate-in fade-in slide-in-from-bottom-2 duration-300">
        {/* Header with decorative background */}
        <div className="relative mb-6">
          <div className="absolute -inset-4 bg-gradient-to-b from-primary/5 to-transparent rounded-3xl -z-10" />
          <h1 className="text-2xl sm:text-3xl font-bold text-primary mb-2">
            Parent Dashboard
          </h1>
          <p className="text-muted-foreground max-w-sm">
            Track your child's learning progress over time
          </p>
        </div>

        {/* Premium placeholder card */}
        <div className="w-full relative mb-6">
          <div className="absolute -inset-0.5 bg-gradient-to-r from-[#1e3a6e]/20 via-[#e85a24]/30 to-[#1e3a6e]/20 rounded-2xl blur-sm opacity-60" />
          <div className="relative p-8 bg-gradient-to-br from-white to-slate-50 rounded-2xl border border-slate-200/50 shadow-sm">
            {/* Decorative icon */}
            <div className="mx-auto mb-4 w-14 h-14 rounded-2xl bg-gradient-to-br from-primary/10 to-[#e85a24]/10 flex items-center justify-center">
              <BarChart3 className="h-7 w-7 text-primary/60" />
            </div>
            <p className="text-sm text-muted-foreground">
              Progress tracking and analytics will be implemented in Phase 9
            </p>
            {/* Decorative dots */}
            <div className="flex justify-center gap-1.5 mt-4">
              <span className="w-1.5 h-1.5 rounded-full bg-primary/20" />
              <span className="w-1.5 h-1.5 rounded-full bg-[#e85a24]/30" />
              <span className="w-1.5 h-1.5 rounded-full bg-primary/20" />
            </div>
          </div>
        </div>

        <div className="w-full space-y-3">
          <Button
            onClick={handleBackToStudent}
            className="w-full h-12 text-base font-semibold rounded-xl shadow-lg shadow-primary/20 transition-all duration-200 hover:shadow-xl hover:shadow-primary/30"
          >
            Back to Student View
          </Button>
          <Button
            onClick={handleNewSession}
            variant="outline"
            className="w-full h-11 font-medium rounded-xl border-2 hover:bg-slate-50 transition-all"
          >
            Start New Session
          </Button>
        </div>
      </div>
    </PageLayout>
  )
}
