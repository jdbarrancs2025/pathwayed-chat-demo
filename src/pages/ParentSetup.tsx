import { useNavigate } from 'react-router'
import { Settings } from 'lucide-react'
import { PageLayout } from '@/components/PageLayout'
import { Button } from '@/components/ui/button'

export function ParentSetup() {
  const navigate = useNavigate()

  const handleContinue = () => {
    navigate('/student')
  }

  return (
    <PageLayout title="Parent Setup" showBack backTo="/">
      <div className="flex flex-col items-center text-center animate-in fade-in slide-in-from-bottom-2 duration-300">
        {/* Header with decorative background */}
        <div className="relative mb-6">
          <div className="absolute -inset-4 bg-gradient-to-b from-primary/5 to-transparent rounded-3xl -z-10" />
          <h1 className="text-2xl sm:text-3xl font-bold text-primary mb-2">
            Parent Setup
          </h1>
          <p className="text-muted-foreground max-w-sm">
            Configure your child's learning preferences and schedule
          </p>
        </div>

        {/* Premium placeholder card */}
        <div className="w-full relative mb-6">
          <div className="absolute -inset-0.5 bg-gradient-to-r from-[#1e3a6e]/20 via-[#e85a24]/30 to-[#1e3a6e]/20 rounded-2xl blur-sm opacity-60" />
          <div className="relative p-8 bg-gradient-to-br from-white to-slate-50 rounded-2xl border border-slate-200/50 shadow-sm">
            {/* Decorative icon */}
            <div className="mx-auto mb-4 w-14 h-14 rounded-2xl bg-gradient-to-br from-primary/10 to-[#e85a24]/10 flex items-center justify-center">
              <Settings className="h-7 w-7 text-primary/60" />
            </div>
            <p className="text-sm text-muted-foreground">
              Schedule and focus area configuration will be implemented in Phase 7
            </p>
            {/* Decorative dots */}
            <div className="flex justify-center gap-1.5 mt-4">
              <span className="w-1.5 h-1.5 rounded-full bg-primary/20" />
              <span className="w-1.5 h-1.5 rounded-full bg-[#e85a24]/30" />
              <span className="w-1.5 h-1.5 rounded-full bg-primary/20" />
            </div>
          </div>
        </div>

        <Button
          onClick={handleContinue}
          className="w-full h-12 text-base font-semibold rounded-xl shadow-lg shadow-primary/20 transition-all duration-200 hover:shadow-xl hover:shadow-primary/30"
        >
          Continue to Student View
        </Button>
      </div>
    </PageLayout>
  )
}
