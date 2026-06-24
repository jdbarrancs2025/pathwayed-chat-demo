import { configDefaults, defineConfig } from 'vitest/config'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'
import path from 'path'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react(), tailwindcss()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
  // Vitest runs unit tests only; Playwright owns e2e/ (its test() API is
  // incompatible with Vitest's collector).
  test: {
    exclude: [...configDefaults.exclude, 'e2e/**'],
  },
})
