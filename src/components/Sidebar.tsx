import { MessageSquarePlus, Volume2, BookOpen, PenTool, GraduationCap, Heart } from "lucide-react"
import logo from "@/assets/logo-horizontal.png"

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
            className="h-10 w-auto max-w-full"
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
                group relative w-full p-3.5 sm:p-3 min-h-[52px] rounded-2xl text-left
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
                {/* Icon container - minimum 44px touch target */}
                <div className={`
                  flex items-center justify-center w-11 h-11 sm:w-10 sm:h-10 rounded-xl
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

      {/* Autoplay Voice Toggle - Playful pill design */}
      <div className="flex justify-center mb-4 px-2">
        <div
          role="button"
          tabIndex={0}
          onClick={() => onAutoplayVoiceChange(!autoplayVoice)}
          onKeyDown={(e) => e.key === 'Enter' && onAutoplayVoiceChange(!autoplayVoice)}
          className={`
            group relative flex items-center gap-3 py-3 px-4 rounded-2xl cursor-pointer
            transition-all duration-500 ease-out select-none
            ${autoplayVoice
              ? "bg-gradient-to-r from-accent/20 to-orange-400/10 shadow-lg shadow-accent/10"
              : "bg-white/5 hover:bg-white/10"
            }
          `}
        >
          {/* Animated background glow when active */}
          {autoplayVoice && (
            <div
              className="absolute inset-0 rounded-2xl bg-gradient-to-r from-accent/10 via-transparent to-accent/5 animate-pulse"
              style={{ animationDuration: '2s' }}
            />
          )}

          {/* Speaker icon with sound waves animation */}
          <div className={`
            relative flex items-center justify-center w-9 h-9 rounded-xl
            transition-all duration-300
            ${autoplayVoice
              ? "bg-accent text-white shadow-md shadow-accent/40 scale-105"
              : "bg-white/10 text-white/60 group-hover:bg-white/15 group-hover:text-white/80"
            }
          `}>
            <Volume2 className="w-4.5 h-4.5 relative z-10" />
            {/* Sound wave rings when active */}
            {autoplayVoice && (
              <>
                <span className="absolute inset-0 rounded-xl border-2 border-accent/40 animate-ping" style={{ animationDuration: '1.5s' }} />
                <span className="absolute inset-[-4px] rounded-xl border border-accent/20 animate-ping" style={{ animationDuration: '2s', animationDelay: '0.3s' }} />
              </>
            )}
          </div>

          {/* Label */}
          <span className={`
            font-semibold text-sm transition-colors duration-300
            ${autoplayVoice ? "text-white" : "text-white/70 group-hover:text-white/90"}
          `}>
            Voice
          </span>

          {/* Custom toggle track */}
          <div className={`
            relative w-12 h-7 rounded-full transition-all duration-300 ml-auto
            ${autoplayVoice
              ? "bg-accent shadow-inner shadow-accent/50"
              : "bg-white/15 group-hover:bg-white/20"
            }
          `}>
            {/* Toggle thumb with bounce animation */}
            <div className={`
              absolute top-1 w-5 h-5 rounded-full shadow-md
              transition-all duration-300 ease-out
              ${autoplayVoice
                ? "left-6 bg-white scale-110"
                : "left-1 bg-white/80 group-hover:bg-white group-hover:scale-105"
              }
            `}>
              {/* Inner glow on thumb when active */}
              {autoplayVoice && (
                <div className="absolute inset-0 rounded-full bg-gradient-to-br from-white via-white to-orange-100" />
              )}
            </div>
          </div>
        </div>
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
