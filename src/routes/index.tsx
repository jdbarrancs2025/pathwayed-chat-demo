import { Routes, Route, Navigate } from 'react-router'
import { Welcome } from '@/pages/Welcome'
import { ResetPassword } from '@/pages/ResetPassword'
import { Consent } from '@/pages/Consent'
import { ChooseNikki } from '@/pages/ChooseNikki'
import { YourChildren } from '@/pages/YourChildren'
import { AddChild } from '@/pages/AddChild'
import { StudentPicker } from '@/pages/StudentPicker'
import { KidHome } from '@/pages/KidHome'
import { Practice } from '@/pages/Practice'
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
      <Route path="/choose-nikki" element={<ChooseNikki />} />
      <Route path="/children" element={<YourChildren />} />
      <Route path="/children/new" element={<AddChild />} />
      <Route path="/children/:id/edit" element={<AddChild />} />
      <Route path="/students" element={<StudentPicker />} />
      <Route path="/students/:id" element={<KidHome />} />
      <Route path="/students/:id/session/:subject" element={<Session />} />
      <Route path="/students/:id/practice/:skill" element={<Practice />} />
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
