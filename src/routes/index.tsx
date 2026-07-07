import { Routes, Route, Navigate } from 'react-router'
import { Welcome } from '@/pages/Welcome'
import { ResetPassword } from '@/pages/ResetPassword'
import { Consent } from '@/pages/Consent'
import { YourChildren } from '@/pages/YourChildren'
import { AddChild } from '@/pages/AddChild'
import { StudentPicker } from '@/pages/StudentPicker'
import { KidHome } from '@/pages/KidHome'
import { SkillsBuilding } from '@/pages/SkillsBuilding'
import { HomeworkStart } from '@/pages/HomeworkStart'
import { Practice } from '@/pages/Practice'
import { PracticeSat } from '@/pages/PracticeSat'
import { Diagnostic } from '@/pages/Diagnostic'
import { Session } from '@/pages/Session'
import { ParentArea } from '@/pages/ParentArea'
import { Settings } from '@/pages/Settings'
import { AccountSetup } from '@/pages/AccountSetup'
import { GradeSelect } from '@/pages/GradeSelect'
import { TeacherSetup } from '@/pages/TeacherSetup'
import { ParentSetup } from '@/pages/ParentSetup'
import { StudentHome } from '@/pages/StudentHome'
import { StudentSubject } from '@/pages/StudentSubject'

export function AppRoutes() {
  return (
    <Routes>
      <Route path="/" element={<Welcome />} />
      <Route path="/reset-password" element={<ResetPassword />} />
      <Route path="/consent" element={<Consent />} />
      {/* Persona-selection step retired (orb is the only visual presence). Redirect
          any lingering link into onboarding rather than 404. */}
      <Route path="/choose-nikki" element={<Navigate to="/children" replace />} />
      <Route path="/children" element={<YourChildren />} />
      <Route path="/children/new" element={<AddChild />} />
      <Route path="/children/:id/edit" element={<AddChild />} />
      <Route path="/students" element={<StudentPicker />} />
      <Route path="/students/:id" element={<KidHome />} />
      {/* Arrival choices (Phase 1 stubs): skills building (Phase 2) + homework (Phase 3). */}
      <Route path="/students/:id/learn" element={<SkillsBuilding />} />
      <Route path="/students/:id/homework" element={<HomeworkStart />} />
      <Route path="/students/:id/session/:subject" element={<Session />} />
      <Route path="/students/:id/practice/:skill" element={<Practice />} />
      {/* Practice SAT — Phase 1: HS-only, consent-gated, Math-only. The page
          re-checks the gate and redirects anyone who fails it. */}
      <Route path="/students/:id/practice-sat" element={<PracticeSat />} />
      {/* Placement diagnostic — Phase 1 (silent scoring). Temporary direct-hit
          verification route; not yet wired into onboarding. */}
      <Route path="/students/:id/diagnostic" element={<Diagnostic />} />
      <Route path="/parent" element={<ParentArea />} />
      <Route path="/settings" element={<Settings />} />
      <Route path="/account-setup" element={<AccountSetup />} />
      <Route path="/grade-select" element={<GradeSelect />} />
      <Route path="/teacher-setup" element={<TeacherSetup />} />
      <Route path="/parent-setup" element={<ParentSetup />} />
      <Route path="/student" element={<StudentHome />} />
      <Route path="/student/:subject" element={<StudentSubject />} />
      {/* Legacy mock parent screens (ParentDashboard, ParentView) retired — both
          old routes now redirect to the one real dashboard. (/parent-view is
          still linked from the untouched legacy StudentHome, so we redirect
          rather than 404 it.) */}
      <Route path="/parent-dashboard" element={<Navigate to="/parent" replace />} />
      <Route path="/parent-view" element={<Navigate to="/parent" replace />} />
    </Routes>
  )
}
