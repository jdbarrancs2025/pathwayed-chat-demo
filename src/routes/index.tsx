import { Routes, Route } from 'react-router'
import { AccountSetup } from '@/pages/AccountSetup'
import { GradeSelect } from '@/pages/GradeSelect'
import { TeacherSetup } from '@/pages/TeacherSetup'
import { ParentSetup } from '@/pages/ParentSetup'
import { StudentHome } from '@/pages/StudentHome'
import { StudentSubject } from '@/pages/StudentSubject'
import { ParentView } from '@/pages/ParentView'
import { ParentDashboard } from '@/pages/ParentDashboard'

export function AppRoutes() {
  return (
    <Routes>
      <Route path="/" element={<AccountSetup />} />
      <Route path="/grade-select" element={<GradeSelect />} />
      <Route path="/teacher-setup" element={<TeacherSetup />} />
      <Route path="/parent-setup" element={<ParentSetup />} />
      <Route path="/student" element={<StudentHome />} />
      <Route path="/student/:subject" element={<StudentSubject />} />
      <Route path="/parent-view" element={<ParentView />} />
      <Route path="/parent-dashboard" element={<ParentDashboard />} />
    </Routes>
  )
}
