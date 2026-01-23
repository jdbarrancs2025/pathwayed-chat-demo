import { Switch } from "@/components/ui/switch"
import { MessageSquarePlus, Volume2, BookOpen, PenTool, GraduationCap, Heart } from "lucide-react"
import logo from "@/assets/logo.png"

export type Mode = "student-support" | "writing-coach" | "teacher-support" | "parent-support"

interface SidebarProps {
  mode: Mode
  onModeChange: (mode: Mode) => void
  autoplayVoice: boolean
  onAutoplayVoiceChange: (enabled: boolean) => void
  onNewChat: () => void
}

const modes: { value: Mode; label: string; icon: React.ElementType; description: string }[] = [
  { value: "student-support", label: "Student Support", icon: BookOpen, description: "Math & Reading" },
  { value: "writing-coach", label: "Writing Coach", icon: PenTool, description: "Plan & Revise" },
  { value: "teacher-support", label: "Teacher Support", icon: GraduationCap, description: "Strategies" },
  { value: "parent-support", label: "Parent Support", icon: Heart, description: "Home Help" },
]

export function Sidebar({
  mode,
  onModeChange,
  autoplayVoice,
  onAutoplayVoiceChange,
  onNewChat,
}: SidebarProps) {
  return (
    <div className="flex flex-col h-full bg-gradient-to-b from-[#2a4a7f] to-[#1a2f52] text-white p-4 rounded-3xl">
      {/* Logo in white card */}
      <div className="flex justify-center pt-4 pb-6">
        <div className="bg-white rounded-2xl p-3 shadow-lg shadow-black/20">
          <img
            src={logo}
            alt="PathwayEd"
            className="h-14 w-auto"
          />
        </div>
      </div>

      {/* Mode Selection */}
      <nav className="flex flex-col gap-2 mb-6 px-1">
        {modes.map((option) => {
          const Icon = option.icon
          const isSelected = mode === option.value

          return (
            <button
              key={option.value}
              onClick={() => onModeChange(option.value)}
              className={`
                group relative w-full p-3 rounded-2xl text-left
                transition-all duration-300 ease-out
                ${isSelected
                  ? "bg-white/15 shadow-lg shadow-black/10"
                  : "hover:bg-white/8"
                }
              `}
            >
              {/* Glow effect for selected state */}
              {isSelected && (
                <div className="absolute inset-0 rounded-2xl bg-gradient-to-r from-orange/20 to-orange/5 animate-pulse"
                  style={{ animationDuration: '3s' }}
                />
              )}

              {/* Content */}
              <div className="relative flex items-center gap-3">
                {/* Icon container */}
                <div className={`
                  flex items-center justify-center w-10 h-10 rounded-xl
                  transition-all duration-300
                  ${isSelected
                    ? "bg-accent text-white shadow-md shadow-accent/30 scale-105"
                    : "bg-white/10 text-white/80 group-hover:bg-white/15 group-hover:scale-105"
                  }
                `}>
                  <Icon className="w-5 h-5" />
                </div>

                {/* Text */}
                <div className="flex-1 min-w-0">
                  <div className={`
                    font-semibold text-sm leading-tight truncate
                    transition-colors duration-200
                    ${isSelected ? "text-white" : "text-white/90 group-hover:text-white"}
                  `}>
                    {option.label}
                  </div>
                  <div className={`
                    text-xs mt-0.5 truncate
                    transition-colors duration-200
                    ${isSelected ? "text-white/70" : "text-white/50 group-hover:text-white/60"}
                  `}>
                    {option.description}
                  </div>
                </div>

                {/* Selected indicator */}
                <div className={`
                  w-2 h-2 rounded-full transition-all duration-300
                  ${isSelected
                    ? "bg-accent scale-100 shadow-sm shadow-accent/50"
                    : "bg-white/20 scale-75 opacity-0 group-hover:opacity-100"
                  }
                `} />
              </div>
            </button>
          )
        })}
      </nav>

      {/* Divider */}
      <div className="h-px bg-white/10 mx-4 mb-4" />

      {/* Autoplay Voice Toggle */}
      <div className="flex justify-center mb-4">
        <button
          onClick={() => onAutoplayVoiceChange(!autoplayVoice)}
          className={`
            flex items-center gap-3 py-2.5 px-5 rounded-full
            transition-all duration-200 ease-out
            ${autoplayVoice
              ? "bg-white/15 shadow-inner"
              : "hover:bg-white/8"
            }
          `}
        >
          <Volume2 className={`
            h-4.5 w-4.5 transition-colors duration-200
            ${autoplayVoice ? "text-accent" : "text-white/70"}
          `} />
          <span className="font-medium text-sm text-white/90">Voice</span>
          <Switch
            checked={autoplayVoice}
            onCheckedChange={onAutoplayVoiceChange}
            className="data-[state=checked]:bg-accent ml-1 scale-90"
          />
        </button>
      </div>

      {/* Spacer */}
      <div className="flex-1" />

      {/* New Chat Button at bottom */}
      <div className="flex justify-center pb-4">
        <button
          onClick={onNewChat}
          className="
            group flex items-center gap-2 py-3 px-6 rounded-full
            bg-gradient-to-r from-accent to-[#f06a34]
            text-white font-semibold text-sm
            transition-all duration-300 ease-out
            shadow-lg shadow-accent/25
            hover:shadow-xl hover:shadow-accent/35
            hover:scale-[1.03] active:scale-[0.98]
            hover:from-[#f06a34] hover:to-accent
          "
        >
          <MessageSquarePlus className="h-4.5 w-4.5 transition-transform duration-300 group-hover:rotate-12" />
          New Chat
        </button>
      </div>
    </div>
  )
}
