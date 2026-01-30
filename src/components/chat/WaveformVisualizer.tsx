import { useRef, useEffect } from "react"
import { cn } from "@/lib/utils"

interface WaveformVisualizerProps {
  analyserNode: AnalyserNode | null
  isRecording: boolean
  className?: string
}

export function WaveformVisualizer({ analyserNode, isRecording, className }: WaveformVisualizerProps) {
  const canvasRef = useRef<HTMLCanvasElement>(null)
  const animFrameRef = useRef<number>(0)

  useEffect(() => {
    const canvas = canvasRef.current
    if (!canvas || !analyserNode || !isRecording) return

    const ctx = canvas.getContext("2d")
    if (!ctx) return

    const dpr = window.devicePixelRatio || 1
    const rect = canvas.getBoundingClientRect()
    canvas.width = rect.width * dpr
    canvas.height = rect.height * dpr
    ctx.scale(dpr, dpr)

    const bufferLength = analyserNode.frequencyBinCount
    const dataArray = new Uint8Array(bufferLength)

    const width = rect.width
    const height = rect.height
    const centerY = height / 2
    const barCount = 32
    const barWidth = Math.max(2, (width / barCount) * 0.6)
    const gap = width / barCount

    const draw = () => {
      analyserNode.getByteTimeDomainData(dataArray)

      ctx.clearRect(0, 0, width, height)

      for (let i = 0; i < barCount; i++) {
        // Sample evenly from the data array
        const dataIndex = Math.floor((i / barCount) * bufferLength)
        const value = dataArray[dataIndex]
        // Normalize: 128 is silence, 0 and 255 are extremes
        const amplitude = Math.abs(value - 128) / 128
        const barHeight = Math.max(2, amplitude * centerY * 1.8)

        const x = i * gap + (gap - barWidth) / 2

        ctx.fillStyle = "#e85a24"
        ctx.beginPath()
        ctx.roundRect(x, centerY - barHeight, barWidth, barHeight * 2, barWidth / 2)
        ctx.fill()
      }

      animFrameRef.current = requestAnimationFrame(draw)
    }

    draw()

    return () => {
      cancelAnimationFrame(animFrameRef.current)
    }
  }, [analyserNode, isRecording])

  return (
    <canvas
      ref={canvasRef}
      className={cn("w-full h-9", className)}
    />
  )
}
