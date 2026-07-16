import type { ReactNode } from 'react'
import { ArrowLeft } from 'lucide-react'
import { useNavigate } from 'react-router'
import { Button } from '@/components/ui/button'
import { HeaderMenu } from '@/components/HeaderMenu'
import { cn } from '@/lib/utils'
import logoImg from '@/assets/pathwayed-logo.png'

interface PageLayoutProps {
  children: ReactNode
  title?: string
  showBack?: boolean
  backTo?: string
  className?: string
  contentClassName?: string
  maxWidth?: 'sm' | 'md' | 'lg' | 'xl' | '2xl'
}

const maxWidthClasses = {
  sm: 'max-w-sm',
  md: 'max-w-md',
  lg: 'max-w-lg',
  xl: 'max-w-xl',
  '2xl': 'max-w-2xl',
}

export function PageLayout({
  children,
  title,
  showBack = false,
  backTo,
  className,
  contentClassName,
  maxWidth = 'lg',
}: PageLayoutProps) {
  const navigate = useNavigate()

  const handleBack = () => {
    if (backTo) {
      navigate(backTo)
    } else {
      navigate(-1)
    }
  }

  return (
    <div
      className={cn(
        'h-dvh flex flex-col bg-gradient-to-b from-slate-50 to-white overflow-hidden',
        className
      )}
    >
      {/* Header */}
      <header className="relative bg-gradient-to-br from-[#1e3a6e] via-[#2a4a7f] to-[#1a3460] px-4 py-5 sm:px-6 sm:py-6 overflow-hidden">
        {/* Radial gradient overlay for premium glow */}
        <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_top,rgba(255,255,255,0.12),transparent_60%)]" />

        {/* Decorative blur circles for depth */}
        <div className="absolute -top-8 -left-8 w-32 h-32 bg-[#e85a24]/20 rounded-full blur-3xl" />
        <div className="absolute -top-4 -right-12 w-40 h-40 bg-white/5 rounded-full blur-3xl" />
        <div className="absolute -bottom-16 left-1/3 w-48 h-48 bg-[#2a4a7f]/40 rounded-full blur-3xl" />

        <div className="relative mx-auto flex items-center justify-between">
          {/* Back button area */}
          <div className="w-12 sm:w-14">
            {showBack && (
              <Button
                variant="ghost"
                size="icon"
                onClick={handleBack}
                className="h-10 w-10 rounded-xl bg-white/5 text-white/90 hover:text-white hover:bg-white/15 backdrop-blur-sm border border-white/10 transition-all duration-200 hover:scale-105"
                aria-label="Go back"
              >
                <ArrowLeft className="h-5 w-5" />
              </Button>
            )}
          </div>

          {/* Logo and title */}
          <div className="flex flex-col items-center gap-2">
            <button
              onClick={() => navigate('/')}
              className="flex items-center gap-3 bg-white/10 backdrop-blur-sm rounded-2xl px-4 py-2 border border-white/10 shadow-lg shadow-black/5 cursor-pointer transition-all duration-200 hover:bg-white/15 active:bg-white/20 active:scale-[0.98] hover:scale-[1.02]"
            >
              {/* White card around the MARK ONLY — the Sidebar's solution.
                  The pill itself stays bg-white/10 because it also holds the
                  white wordmark beside this; making the whole pill white would
                  paint that text white-on-white.

                  The card is required, not cosmetic. Measured on this header:
                  the pill resolves to ~#354e7d, and the mark's navy sits at
                  1.48:1 against it — invisible. The old logo only read here
                  because it carried a baked #f6f6f6 panel (7.66:1); the card
                  reproduces that deliberately instead of by accident. */}
              <span className="bg-white rounded-xl p-1.5 shadow-sm shadow-black/10">
                <img
                  src={logoImg}
                  alt=""
                  className="block h-14 w-14 sm:h-16 sm:w-16 object-contain"
                />
              </span>
              <span className="text-white font-bold text-xl sm:text-2xl tracking-tight drop-shadow-sm">
                PathwayEd
              </span>
            </button>
            {title && (
              <span className="text-white/95 text-xs sm:text-sm font-medium bg-white/10 backdrop-blur-sm px-4 py-1.5 rounded-full border border-white/10">
                {title}
              </span>
            )}
          </div>

          {/* App menu */}
          <div className="w-12 sm:w-14 flex justify-end">
            <HeaderMenu />
          </div>
        </div>

        {/* Enhanced bottom accent line with glow */}
        <div className="absolute bottom-0 left-0 right-0">
          <div className="h-1 bg-gradient-to-r from-transparent via-[#e85a24] to-transparent" />
          <div className="absolute inset-0 h-2 bg-gradient-to-r from-transparent via-[#e85a24]/50 to-transparent blur-sm -translate-y-1" />
        </div>
      </header>

      {/* Main content */}
      <main className="flex-1 min-h-0 overflow-y-auto overscroll-contain">
        <div
          className={cn(
            'mx-auto w-full px-4 py-6 sm:px-6 sm:py-8',
            maxWidthClasses[maxWidth],
            contentClassName
          )}
        >
          {children}
        </div>
      </main>
    </div>
  )
}
