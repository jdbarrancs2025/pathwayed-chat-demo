import { useState } from "react"
import { Menu } from "lucide-react"
import { Button } from "@/components/ui/button"
import {
  Sheet,
  SheetContent,
  SheetTrigger,
} from "@/components/ui/sheet"
import { Sidebar, type Persona } from "@/components/Sidebar"

interface AppLayoutProps {
  children: React.ReactNode
}

export function AppLayout({ children }: AppLayoutProps) {
  const [persona, setPersona] = useState<Persona>("student")
  const [autoplayVoice, setAutoplayVoice] = useState(false)
  const [sidebarOpen, setSidebarOpen] = useState(false)

  const handleNewChat = () => {
    // Will be implemented in Phase 4
    console.log("New chat clicked")
  }

  const sidebarContent = (
    <Sidebar
      persona={persona}
      onPersonaChange={setPersona}
      autoplayVoice={autoplayVoice}
      onAutoplayVoiceChange={setAutoplayVoice}
      onNewChat={() => {
        handleNewChat()
        setSidebarOpen(false)
      }}
    />
  )

  return (
    <div className="flex h-screen bg-background">
      {/* Desktop Sidebar - hidden on mobile */}
      <aside className="hidden md:flex md:w-72 lg:w-80 flex-shrink-0">
        {sidebarContent}
      </aside>

      {/* Mobile Header + Sheet */}
      <div className="flex flex-col flex-1 min-w-0">
        {/* Mobile Header */}
        <header className="md:hidden flex items-center justify-between px-4 py-3 bg-sidebar border-b border-sidebar-border">
          <Sheet open={sidebarOpen} onOpenChange={setSidebarOpen}>
            <SheetTrigger asChild>
              <Button
                variant="ghost"
                size="icon"
                className="text-sidebar-foreground hover:bg-sidebar-accent"
              >
                <Menu className="h-6 w-6" />
                <span className="sr-only">Open menu</span>
              </Button>
            </SheetTrigger>
            <SheetContent
              side="left"
              className="w-80 p-0 bg-sidebar border-sidebar-border"
            >
              {sidebarContent}
            </SheetContent>
          </Sheet>
          <span className="text-sidebar-foreground font-semibold">
            PathwayEd
          </span>
          <div className="w-10" /> {/* Spacer for centering */}
        </header>

        {/* Main Content */}
        <main className="flex-1 overflow-hidden">
          {children}
        </main>
      </div>
    </div>
  )
}
