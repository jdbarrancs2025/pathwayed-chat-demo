import { describe, expect, it } from "vitest"
import { isNoSpeech } from "./transcribe.js"

// Guards the filter that stops hallucinated transcripts from reaching a child's
// chat. Live kid testing surfaced Japanese and Hindi text coming back from
// near-silent recordings and being sent to Nikki as if the child had said it.
describe("isNoSpeech", () => {
  it("rejects empty and whitespace-only transcripts", () => {
    expect(isNoSpeech("")).toBe(true)
    expect(isNoSpeech("   \n\t ")).toBe(true)
  })

  it("rejects wrong-language hallucinations", () => {
    expect(isNoSpeech("ご視聴ありがとうございました")).toBe(true)
    expect(isNoSpeech("नमस्ते दोस्तों")).toBe(true)
    expect(isNoSpeech("字幕はここまでです")).toBe(true)
  })

  it("rejects the stock Whisper filler phrases, case-insensitively", () => {
    expect(isNoSpeech("Thank you for watching!")).toBe(true)
    expect(isNoSpeech("please subscribe")).toBe(true)
    expect(isNoSpeech("Thanks for watching.")).toBe(true)
  })

  it("keeps the short numeric answers kids actually give", () => {
    expect(isNoSpeech("9")).toBe(false)
    expect(isNoSpeech("32")).toBe(false)
    expect(isNoSpeech("subtract five")).toBe(false)
    expect(isNoSpeech("3/4")).toBe(false)
  })

  it("keeps normal English answers, including punctuation and accents", () => {
    expect(isNoSpeech("I think the answer is twelve, because 4 times 3 is 12.")).toBe(false)
    expect(isNoSpeech("Um... can you say that again?")).toBe(false)
    // A stray accented character must not tip a real sentence over the threshold.
    expect(isNoSpeech("The café had eight tables and we counted them all")).toBe(false)
  })

  it("keeps a sentence that merely mentions watching something", () => {
    expect(isNoSpeech("I was watching the video about fractions")).toBe(false)
  })
})
