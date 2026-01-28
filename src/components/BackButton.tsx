import { ArrowLeft } from 'lucide-react'
import { useNavigate } from 'react-router'
import { Button } from '@/components/ui/button'
import { cn } from '@/lib/utils'

interface BackButtonProps {
  to?: string
  label?: string
  className?: string
}

export function BackButton({ to, label = 'Back', className }: BackButtonProps) {
  const navigate = useNavigate()

  const handleClick = () => {
    if (to) {
      navigate(to)
    } else {
      navigate(-1)
    }
  }

  return (
    <Button
      variant="ghost"
      onClick={handleClick}
      className={cn(
        'gap-2 text-muted-foreground hover:text-foreground transition-colors',
        className
      )}
    >
      <ArrowLeft className="h-4 w-4" />
      <span>{label}</span>
    </Button>
  )
}
