import { useParams, Navigate } from 'react-router'
import { PageLayout } from '@/components/PageLayout'
import type { Subject } from '@/lib/types'

const validSubjects: Subject[] = ['math', 'reading', 'writing']

const subjectTitles: Record<Subject, string> = {
  math: 'Math Practice',
  reading: 'Reading Practice',
  writing: 'Writing Practice',
}

export function StudentSubject() {
  const { subject } = useParams<{ subject: string }>()

  // Validate subject parameter
  if (!subject || !validSubjects.includes(subject as Subject)) {
    return <Navigate to="/student" replace />
  }

  const validSubject = subject as Subject

  return (
    <PageLayout title={subjectTitles[validSubject]} showBack backTo="/student">
      <div className="flex flex-col items-center text-center">
        <h1 className="text-2xl sm:text-3xl font-bold text-primary mb-2">
          {subjectTitles[validSubject]}
        </h1>
        <p className="text-muted-foreground mb-8 max-w-sm">
          Let's work on {subject} together!
        </p>

        <div className="w-full p-6 bg-secondary/50 rounded-xl">
          <p className="text-sm text-muted-foreground">
            N.I.K.K.I. chat interface will be integrated in Phase 8
          </p>
        </div>
      </div>
    </PageLayout>
  )
}
