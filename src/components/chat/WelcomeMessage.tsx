import { Sparkles, GraduationCap, BookOpen, Users } from "lucide-react"

interface WelcomeMessageProps {
  onSuggestionClick: (message: string) => void
}

export function WelcomeMessage({ onSuggestionClick }: WelcomeMessageProps) {
  const suggestions = [
    {
      icon: BookOpen,
      text: "Help me understand fractions",
      color: "from-blue-500 to-indigo-500",
    },
    {
      icon: GraduationCap,
      text: "Tips for staying focused while studying",
      color: "from-emerald-500 to-teal-500",
    },
    {
      icon: Users,
      text: "How can I support my child's learning?",
      color: "from-amber-500 to-orange-500",
    },
  ]

  return (
    <div className="flex flex-col items-center justify-center h-full px-4 sm:px-6 pt-8 sm:pt-12 md:pt-16 pb-8 sm:pb-12 animate-in fade-in duration-500 landscape:pt-4 landscape:pb-4">
      {/* Animated mascot/icon area */}
      <div className="relative mb-6 sm:mb-8 landscape:mb-4">
        {/* Glowing background */}
        <div className="absolute inset-0 bg-gradient-to-br from-accent/20 to-primary/20 rounded-full blur-3xl scale-150 animate-pulse" />

        {/* Main icon container - responsive sizing */}
        <div className="relative w-20 h-20 sm:w-24 sm:h-24 landscape:w-16 landscape:h-16 bg-gradient-to-br from-primary to-[#2a4a7f] rounded-3xl flex items-center justify-center shadow-2xl shadow-primary/30 rotate-3 hover:rotate-0 transition-transform duration-300">
          <Sparkles className="w-10 h-10 sm:w-12 sm:h-12 landscape:w-8 landscape:h-8 text-white" />

          {/* Decorative dots */}
          <div className="absolute -top-2 -right-2 w-5 h-5 bg-accent rounded-full shadow-lg shadow-accent/50 animate-bounce" style={{ animationDelay: "0ms" }} />
          <div className="absolute -bottom-1 -left-3 w-3 h-3 bg-amber-400 rounded-full shadow-lg animate-bounce" style={{ animationDelay: "150ms" }} />
          <div className="absolute top-1/2 -right-4 w-2 h-2 bg-emerald-400 rounded-full shadow-lg animate-bounce" style={{ animationDelay: "300ms" }} />
        </div>
      </div>

      {/* Welcome text */}
      <div className="text-center mb-6 sm:mb-8 md:mb-10 max-w-md landscape:mb-4">
        <h2 className="text-xl sm:text-2xl md:text-3xl lg:text-4xl font-bold text-primary mb-2 sm:mb-3">
          Hi there! I'm PathwayEd
        </h2>
        <p className="text-slate-500 text-sm sm:text-base md:text-lg leading-relaxed landscape:text-sm">
          Your friendly learning companion. I'm here to help students, teachers, and parents with anything education-related!
        </p>
      </div>

      {/* Suggestion chips */}
      <div className="w-full max-w-lg space-y-2 sm:space-y-3">
        <p className="text-xs uppercase tracking-wider text-slate-400 text-center mb-3 sm:mb-4 font-medium landscape:hidden">
          Try asking me...
        </p>

        <div className="grid gap-2 sm:gap-3">
          {suggestions.map((suggestion, index) => (
            <button
              key={index}
              onClick={() => onSuggestionClick(suggestion.text)}
              className="group flex items-center gap-3 sm:gap-4 w-full p-3 sm:p-4 bg-white rounded-2xl border-2 border-slate-100 hover:border-accent/30 shadow-sm hover:shadow-md transition-all duration-200 text-left hover:scale-[1.02] active:scale-[0.98]"
              style={{
                animationDelay: `${index * 100}ms`,
              }}
            >
              {/* Icon - minimum 44px touch target */}
              <div className={`flex-shrink-0 w-11 h-11 sm:w-10 sm:h-10 rounded-xl bg-gradient-to-br ${suggestion.color} flex items-center justify-center shadow-md group-hover:scale-110 transition-transform duration-200`}>
                <suggestion.icon className="w-5 h-5 text-white" />
              </div>

              {/* Text */}
              <span className="flex-1 text-sm sm:text-base text-slate-600 group-hover:text-slate-800 font-medium transition-colors">
                "{suggestion.text}"
              </span>

              {/* Arrow indicator */}
              <div className="flex-shrink-0 w-8 h-8 rounded-full bg-slate-50 group-hover:bg-accent/10 flex items-center justify-center transition-colors">
                <svg
                  className="w-4 h-4 text-slate-400 group-hover:text-accent group-hover:translate-x-0.5 transition-all"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                </svg>
              </div>
            </button>
          ))}
        </div>
      </div>

      {/* Fun footer note */}
      <p className="mt-6 sm:mt-8 md:mt-10 text-xs text-slate-400 text-center landscape:hidden">
        Powered by{" "}
        <span className="font-semibold text-primary">Pathway Education</span>
        {" "}· Making learning fun for everyone
      </p>
    </div>
  )
}
