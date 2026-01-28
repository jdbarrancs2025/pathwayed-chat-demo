import { useNavigate } from 'react-router'
import { useAppContext } from '@/context/AppContext'
import logoImg from '@/assets/logo.png'

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
    <div className="h-dvh bg-white flex items-center justify-center px-4 py-8 overflow-y-auto">
      {/* Subtle background pattern */}
      <div
        className="fixed inset-0 opacity-[0.02] pointer-events-none"
        style={{
          backgroundImage: `url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%231e3a6e' fill-opacity='1'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E")`,
        }}
      />

      <div className="relative w-full max-w-md text-center animate-in fade-in slide-in-from-bottom-4 duration-500">
        {/* Logo with gentle bounce animation */}
        <div className="mb-8">
          <img
            src={logoImg}
            alt="PathwayEd"
            className="mx-auto h-20 w-20 sm:h-24 sm:w-24 object-contain drop-shadow-md animate-in zoom-in duration-300"
          />
          <h2 className="mt-3 text-xl sm:text-2xl font-bold text-primary tracking-tight">
            PathwayEd
          </h2>
        </div>

        {/* Main heading */}
        <h1 className="text-2xl sm:text-3xl font-bold text-primary mb-2 leading-tight">
          How will PathwayEd be used
          <br />
          for this student?
        </h1>
        <p className="text-muted-foreground mb-10 text-sm sm:text-base">
          Choose the learning environment that fits best
        </p>

        {/* Selection buttons */}
        <div className="space-y-4">
          {/* School button - primary emphasis */}
          <button
            onClick={handleSchoolMode}
            className="group w-full rounded-2xl bg-gradient-to-br from-primary to-[#2a4a7f] p-6 sm:p-8 text-white shadow-lg shadow-primary/20 transition-all duration-300 hover:shadow-xl hover:shadow-primary/30 hover:scale-[1.02] active:scale-[0.98] focus:outline-none focus-visible:ring-4 focus-visible:ring-primary/30"
          >
            <div className="flex items-center gap-4">
              <span className="text-4xl sm:text-5xl transition-transform duration-300 group-hover:scale-110 group-hover:rotate-3">
                🏫
              </span>
              <div className="text-left flex-1">
                <div className="font-semibold text-lg sm:text-xl mb-1">
                  Through my school
                </div>
                <div className="text-white/80 text-sm sm:text-base">
                  or after-school program
                </div>
              </div>
              <svg
                className="w-5 h-5 sm:w-6 sm:h-6 opacity-60 transition-transform duration-300 group-hover:translate-x-1"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M9 5l7 7-7 7"
                />
              </svg>
            </div>
          </button>

          {/* Home button - outline style */}
          <button
            onClick={handleHomeMode}
            className="group w-full rounded-2xl border-2 border-primary/20 bg-white p-6 sm:p-8 text-primary shadow-sm transition-all duration-300 hover:border-accent hover:shadow-lg hover:shadow-accent/10 hover:scale-[1.02] active:scale-[0.98] focus:outline-none focus-visible:ring-4 focus-visible:ring-accent/30"
          >
            <div className="flex items-center gap-4">
              <span className="text-4xl sm:text-5xl transition-transform duration-300 group-hover:scale-110 group-hover:-rotate-3">
                🏠
              </span>
              <div className="text-left flex-1">
                <div className="font-semibold text-lg sm:text-xl mb-1">
                  At home
                </div>
                <div className="text-muted-foreground text-sm sm:text-base">
                  for extra practice
                </div>
              </div>
              <svg
                className="w-5 h-5 sm:w-6 sm:h-6 opacity-40 transition-all duration-300 group-hover:opacity-60 group-hover:translate-x-1 group-hover:text-accent"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M9 5l7 7-7 7"
                />
              </svg>
            </div>
          </button>
        </div>

        {/* Footer note */}
        <p className="mt-10 text-xs text-muted-foreground/70">
          You can change this setting anytime
        </p>
      </div>
    </div>
  )
}
