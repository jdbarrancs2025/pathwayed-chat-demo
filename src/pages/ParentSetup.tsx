import { useState } from 'react'
import { useNavigate } from 'react-router'
import {
  Calculator,
  BookOpen,
  PenTool,
  Calendar,
  CalendarDays,
  CalendarRange,
  Sparkles,
  Check,
} from 'lucide-react'
import { PageLayout } from '@/components/PageLayout'
import { Button } from '@/components/ui/button'
import { Checkbox } from '@/components/ui/checkbox'
import { RadioGroup, RadioGroupItem } from '@/components/ui/radio-group'
import { Label } from '@/components/ui/label'
import { useAppContext } from '@/context/AppContext'
import type { Subject, Schedule, FocusAreas, QuestionCount } from '@/lib/types'

const subjectConfig = {
  math: {
    icon: Calculator,
    label: 'Math',
    color: 'text-blue-600',
    bgColor: 'bg-blue-50',
    borderColor: 'border-blue-200',
    accentColor: 'bg-blue-600',
    ringColor: 'ring-blue-500/20',
  },
  reading: {
    icon: BookOpen,
    label: 'Reading',
    color: 'text-emerald-600',
    bgColor: 'bg-emerald-50',
    borderColor: 'border-emerald-200',
    accentColor: 'bg-emerald-600',
    ringColor: 'ring-emerald-500/20',
  },
  writing: {
    icon: PenTool,
    label: 'Writing',
    color: 'text-amber-600',
    bgColor: 'bg-amber-50',
    borderColor: 'border-amber-200',
    accentColor: 'bg-amber-600',
    ringColor: 'ring-amber-500/20',
  },
} as const

const focusAreaOptions = {
  math: [
    { value: 'word-problems', label: 'Word Problems' },
    { value: 'fractions', label: 'Fractions' },
    { value: 'multiplication', label: 'Multiplication' },
    { value: 'division', label: 'Division' },
  ],
  reading: [
    { value: 'reading-comprehension', label: 'Reading Comprehension' },
    { value: 'vocabulary', label: 'Vocabulary' },
    { value: 'main-idea', label: 'Main Idea' },
  ],
  writing: [
    { value: 'sentence-writing', label: 'Sentence Writing' },
    { value: 'paragraph-writing', label: 'Paragraph Practice' },
    { value: 'creative-writing', label: 'Creative Writing' },
  ],
} as const

const scheduleOptions = [
  {
    value: 'daily' as Schedule,
    label: 'Every day',
    description: 'Best for consistent progress',
    icon: Calendar,
  },
  {
    value: '3x-week' as Schedule,
    label: '3 times per week',
    description: 'Balanced approach',
    icon: CalendarDays,
  },
  {
    value: 'weekends' as Schedule,
    label: 'Weekends only',
    description: 'Weekend learning sessions',
    icon: CalendarRange,
  },
]

export function ParentSetup() {
  const navigate = useNavigate()
  const { setFocusAreas, setSchedule, setQuestionCount } = useAppContext()

  const [selectedSubjects, setSelectedSubjects] = useState<Subject[]>([])
  const [selectedFocusAreas, setSelectedFocusAreas] = useState<FocusAreas>({
    math: [],
    reading: [],
    writing: [],
  })
  const [selectedSchedule, setSelectedSchedule] = useState<Schedule>('daily')
  const [selectedQuestionCount, setSelectedQuestionCount] = useState<QuestionCount>(5)

  const toggleSubject = (subject: Subject) => {
    setSelectedSubjects((prev) => {
      const isSelected = prev.includes(subject)
      if (isSelected) {
        // Clear focus areas when unchecking subject
        setSelectedFocusAreas((prevAreas) => ({
          ...prevAreas,
          [subject]: [],
        }))
        return prev.filter((s) => s !== subject)
      }
      return [...prev, subject]
    })
  }

  const toggleFocusArea = (subject: Subject, value: string) => {
    setSelectedFocusAreas((prev) => {
      const current = prev[subject]
      const isSelected = current.includes(value)
      return {
        ...prev,
        [subject]: isSelected
          ? current.filter((v) => v !== value)
          : [...current, value],
      }
    })
  }

  // Validation: at least one subject and one focus area
  const hasSubject = selectedSubjects.length > 0
  const hasFocusArea = Object.values(selectedFocusAreas).some(
    (areas) => areas.length > 0
  )
  const isValid = hasSubject && hasFocusArea

  const handleSave = () => {
    if (!isValid) return
    setFocusAreas(selectedFocusAreas)
    setSchedule(selectedSchedule)
    setQuestionCount(selectedQuestionCount)
    navigate('/student')
  }

  return (
    <PageLayout title="Parent Setup" showBack backTo="/grade-select">
      <div className="space-y-8 pb-6 animate-in fade-in slide-in-from-bottom-2 duration-300">
        {/* Header */}
        <div className="text-center relative">
          <div className="absolute inset-0 -top-4 bg-gradient-to-b from-primary/5 to-transparent rounded-3xl -z-10" />
          <div className="inline-flex items-center justify-center w-12 h-12 rounded-2xl bg-gradient-to-br from-primary/10 to-[#e85a24]/10 mb-3">
            <Sparkles className="h-6 w-6 text-primary" />
          </div>
          <h1 className="text-2xl sm:text-3xl font-bold text-primary mb-2">
            Set Up Jordan's Learning Plan
          </h1>
          <p className="text-muted-foreground text-sm sm:text-base max-w-md mx-auto">
            Choose subjects, focus areas, and a practice schedule
          </p>
        </div>

        {/* Step 1: Subjects */}
        <section className="space-y-4">
          <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider flex items-center gap-3">
            <span className="h-px flex-1 bg-gradient-to-r from-transparent via-border to-border" />
            <span className="flex items-center gap-2">
              <span className="w-5 h-5 rounded-full bg-primary text-white text-xs flex items-center justify-center font-bold">
                1
              </span>
              Choose Subjects
            </span>
            <span className="h-px flex-1 bg-gradient-to-l from-transparent via-border to-border" />
          </h2>

          <div className="grid grid-cols-3 gap-3">
            {(Object.keys(subjectConfig) as Subject[]).map((subject) => {
              const config = subjectConfig[subject]
              const Icon = config.icon
              const isSelected = selectedSubjects.includes(subject)

              return (
                <button
                  key={subject}
                  type="button"
                  onClick={() => toggleSubject(subject)}
                  className={`relative p-4 rounded-xl border-2 transition-all duration-200 ${
                    isSelected
                      ? `${config.borderColor} ${config.bgColor} shadow-md ring-4 ${config.ringColor}`
                      : 'border-slate-200 bg-white hover:border-slate-300 hover:shadow-sm'
                  }`}
                >
                  {isSelected && (
                    <div className="absolute -top-1.5 -right-1.5">
                      <div
                        className={`w-5 h-5 rounded-full ${config.accentColor} flex items-center justify-center shadow-sm`}
                      >
                        <Check className="h-3 w-3 text-white" />
                      </div>
                    </div>
                  )}
                  <div
                    className={`mx-auto mb-2 p-2.5 rounded-xl ${
                      isSelected ? config.accentColor : 'bg-slate-100'
                    } w-fit transition-colors duration-200`}
                  >
                    <Icon
                      className={`h-5 w-5 ${
                        isSelected ? 'text-white' : 'text-slate-500'
                      }`}
                    />
                  </div>
                  <p
                    className={`text-sm font-semibold ${
                      isSelected ? config.color : 'text-slate-600'
                    }`}
                  >
                    {config.label}
                  </p>
                </button>
              )
            })}
          </div>
        </section>

        {/* Step 2: Focus Areas (Progressive Disclosure) */}
        {selectedSubjects.length > 0 && (
          <section className="space-y-4 animate-in fade-in slide-in-from-bottom-2 duration-300">
            <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider flex items-center gap-3">
              <span className="h-px flex-1 bg-gradient-to-r from-transparent via-border to-border" />
              <span className="flex items-center gap-2">
                <span className="w-5 h-5 rounded-full bg-primary text-white text-xs flex items-center justify-center font-bold">
                  2
                </span>
                Select Focus Areas
              </span>
              <span className="h-px flex-1 bg-gradient-to-l from-transparent via-border to-border" />
            </h2>

            <div className="space-y-4">
              {selectedSubjects.map((subject) => {
                const config = subjectConfig[subject]
                const Icon = config.icon
                const options = focusAreaOptions[subject]
                const selectedCount = selectedFocusAreas[subject].length

                return (
                  <div
                    key={subject}
                    className={`rounded-xl border-2 ${config.borderColor} ${config.bgColor} p-4 transition-all duration-200 animate-in fade-in slide-in-from-left-2 ${
                      selectedCount > 0 ? 'shadow-md' : ''
                    }`}
                  >
                    {/* Subject header */}
                    <div className="flex items-center gap-3 mb-3">
                      <div
                        className={`p-2 rounded-lg ${config.accentColor} text-white shadow-sm`}
                      >
                        <Icon className="h-4 w-4" />
                      </div>
                      <span className={`font-semibold ${config.color}`}>
                        {config.label}
                      </span>
                      {selectedCount > 0 && (
                        <span
                          className={`ml-auto text-xs font-medium px-2 py-0.5 rounded-full ${config.accentColor} text-white`}
                        >
                          {selectedCount} selected
                        </span>
                      )}
                    </div>

                    {/* Checkbox options */}
                    <div className="grid grid-cols-2 gap-2">
                      {options.map((option) => {
                        const isChecked = selectedFocusAreas[subject].includes(
                          option.value
                        )
                        return (
                          <label
                            key={option.value}
                            className={`flex items-center gap-3 p-3 rounded-lg cursor-pointer transition-all duration-150 ${
                              isChecked
                                ? 'bg-white shadow-sm border border-transparent'
                                : 'bg-white/50 hover:bg-white/80 border border-transparent'
                            }`}
                          >
                            <Checkbox
                              checked={isChecked}
                              onCheckedChange={() =>
                                toggleFocusArea(subject, option.value)
                              }
                              className="data-[state=checked]:bg-primary data-[state=checked]:border-primary"
                            />
                            <span
                              className={`text-sm font-medium ${
                                isChecked
                                  ? 'text-primary'
                                  : 'text-muted-foreground'
                              }`}
                            >
                              {option.label}
                            </span>
                          </label>
                        )
                      })}
                    </div>
                  </div>
                )
              })}
            </div>
          </section>
        )}

        {/* Step 3: Schedule */}
        <section className="space-y-4">
          <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider flex items-center gap-3">
            <span className="h-px flex-1 bg-gradient-to-r from-transparent via-border to-border" />
            <span className="flex items-center gap-2">
              <span className="w-5 h-5 rounded-full bg-primary text-white text-xs flex items-center justify-center font-bold">
                3
              </span>
              Set Schedule
            </span>
            <span className="h-px flex-1 bg-gradient-to-l from-transparent via-border to-border" />
          </h2>

          <RadioGroup
            value={selectedSchedule}
            onValueChange={(value: Schedule) => setSelectedSchedule(value)}
            className="space-y-3"
          >
            {scheduleOptions.map((option) => {
              const Icon = option.icon
              const isSelected = selectedSchedule === option.value

              return (
                <label
                  key={option.value}
                  className={`flex items-center gap-4 p-4 rounded-xl border-2 cursor-pointer transition-all duration-200 ${
                    isSelected
                      ? 'border-primary bg-primary/5 shadow-sm ring-4 ring-primary/10'
                      : 'border-slate-200 bg-white hover:border-slate-300 hover:shadow-sm'
                  }`}
                >
                  <RadioGroupItem
                    value={option.value}
                    id={option.value}
                    className="sr-only"
                  />
                  <div
                    className={`p-2.5 rounded-xl transition-colors duration-200 ${
                      isSelected
                        ? 'bg-primary text-white'
                        : 'bg-slate-100 text-slate-500'
                    }`}
                  >
                    <Icon className="h-5 w-5" />
                  </div>
                  <div className="flex-1">
                    <Label
                      htmlFor={option.value}
                      className={`cursor-pointer font-semibold block ${
                        isSelected ? 'text-primary' : 'text-slate-700'
                      }`}
                    >
                      {option.label}
                    </Label>
                    <p className="text-xs text-muted-foreground mt-0.5">
                      {option.description}
                    </p>
                  </div>
                  {isSelected && (
                    <div className="w-6 h-6 rounded-full bg-primary flex items-center justify-center">
                      <Check className="h-4 w-4 text-white" />
                    </div>
                  )}
                </label>
              )
            })}
          </RadioGroup>
        </section>

        {/* Step 4: Practice Questions */}
        <section className="space-y-4">
          <h2 className="text-sm font-semibold text-muted-foreground uppercase tracking-wider flex items-center gap-3">
            <span className="h-px flex-1 bg-gradient-to-r from-transparent via-border to-border" />
            <span className="flex items-center gap-2">
              <span className="w-5 h-5 rounded-full bg-primary text-white text-xs flex items-center justify-center font-bold">
                4
              </span>
              Practice Questions
            </span>
            <span className="h-px flex-1 bg-gradient-to-l from-transparent via-border to-border" />
          </h2>

          <RadioGroup
            value={String(selectedQuestionCount)}
            onValueChange={(value: string) =>
              setSelectedQuestionCount(Number(value) as QuestionCount)
            }
            className="space-y-3"
          >
            {([
              { value: 3, label: '3 questions', description: 'Quick practice' },
              { value: 5, label: '5 questions', description: 'Standard' },
              { value: 10, label: '10 questions', description: 'Extended practice' },
            ] as const).map((option) => {
              const isSelected = selectedQuestionCount === option.value
              return (
                <label
                  key={option.value}
                  className={`flex items-center gap-4 p-4 rounded-xl border-2 cursor-pointer transition-all duration-200 ${
                    isSelected
                      ? 'border-primary bg-primary/5 shadow-sm ring-4 ring-primary/10'
                      : 'border-slate-200 bg-white hover:border-slate-300 hover:shadow-sm'
                  }`}
                >
                  <RadioGroupItem
                    value={String(option.value)}
                    id={`pq-${option.value}`}
                    className="sr-only"
                  />
                  <div className="flex-1">
                    <Label
                      htmlFor={`pq-${option.value}`}
                      className={`cursor-pointer font-semibold block ${
                        isSelected ? 'text-primary' : 'text-slate-700'
                      }`}
                    >
                      {option.label}
                    </Label>
                    <p className="text-xs text-muted-foreground mt-0.5">
                      {option.description}
                    </p>
                  </div>
                  {isSelected && (
                    <div className="w-6 h-6 rounded-full bg-primary flex items-center justify-center">
                      <Check className="h-4 w-4 text-white" />
                    </div>
                  )}
                </label>
              )
            })}
          </RadioGroup>
        </section>

        {/* Save Button */}
        <div className="pt-4">
          <Button
            onClick={handleSave}
            disabled={!isValid}
            className="w-full h-12 text-base font-semibold rounded-xl shadow-lg shadow-primary/20 transition-all duration-200 hover:shadow-xl hover:shadow-primary/30 disabled:shadow-none"
          >
            {isValid ? (
              <span className="flex items-center gap-2">
                <Sparkles className="h-5 w-5" />
                Save & Start Learning
              </span>
            ) : !hasSubject ? (
              'Select at least one subject'
            ) : (
              'Select at least one focus area'
            )}
          </Button>

          {!isValid && (
            <p className="text-center text-xs text-muted-foreground mt-3">
              {!hasSubject
                ? 'Choose subjects above to continue'
                : 'Choose focus areas for your selected subjects'}
            </p>
          )}
        </div>
      </div>
    </PageLayout>
  )
}
