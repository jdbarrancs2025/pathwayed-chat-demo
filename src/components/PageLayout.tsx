import type { ReactNode } from 'react'
import { ArrowLeft } from 'lucide-react'
import { useNavigate } from 'react-router'
import { Button } from '@/components/ui/button'
import { cn } from '@/lib/utils'
import logoImg from '@/assets/logo.png'

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
        'min-h-dvh flex flex-col bg-gradient-to-b from-slate-50 to-white',
        className
      )}
    >
      {/* Header */}
      <header className="relative bg-gradient-to-r from-[#2a4a7f] to-[#1e3a6e] px-4 py-4 sm:px-6 sm:py-5">
        {/* Subtle pattern overlay for depth */}
        <div
          className="absolute inset-0 opacity-[0.03]"
          style={{
            backgroundImage: `url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='1'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E")`,
          }}
        />

        <div className="relative mx-auto flex items-center justify-between">
          {/* Back button area */}
          <div className="w-10 sm:w-12">
            {showBack && (
              <Button
                variant="ghost"
                size="icon"
                onClick={handleBack}
                className="text-white/90 hover:text-white hover:bg-white/10 transition-colors"
                aria-label="Go back"
              >
                <ArrowLeft className="h-5 w-5 sm:h-6 sm:w-6" />
              </Button>
            )}
          </div>

          {/* Logo and title */}
          <div className="flex flex-col items-center gap-1">
            <div className="flex items-center gap-2.5">
              <img
                src={logoImg}
                alt="PathwayEd"
                className="h-8 w-8 sm:h-9 sm:w-9 object-contain drop-shadow-sm"
              />
              <span className="text-white font-semibold text-lg sm:text-xl tracking-tight">
                PathwayEd
              </span>
            </div>
            {title && (
              <span className="text-white/80 text-xs sm:text-sm font-medium">
                {title}
              </span>
            )}
          </div>

          {/* Spacer for balance */}
          <div className="w-10 sm:w-12" />
        </div>

        {/* Bottom accent line */}
        <div className="absolute bottom-0 left-0 right-0 h-0.5 bg-gradient-to-r from-transparent via-[#e85a24] to-transparent opacity-60" />
      </header>

      {/* Main content */}
      <main className="flex-1 overflow-y-auto overscroll-contain">
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
