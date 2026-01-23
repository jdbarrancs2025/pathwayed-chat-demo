import { AppLayout } from "@/components/AppLayout"

function App() {
  return (
    <AppLayout>
      <div className="flex items-center justify-center h-full">
        <div className="text-center px-4">
          <h1 className="text-3xl font-bold text-primary mb-4">
            PathwayEd AI Chat
          </h1>
          <p className="text-muted-foreground">
            Chat interface coming in Phase 3
          </p>
        </div>
      </div>
    </AppLayout>
  )
}

export default App
