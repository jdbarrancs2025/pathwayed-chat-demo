import { test, expect } from "@playwright/test"

test("app loads and shows the PathwayEd title", async ({ page }) => {
  await page.goto("/")
  await expect(page).toHaveTitle("PathwayEd")
})
