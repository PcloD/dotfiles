package main

import (
	"github.com/bit101/blgo"
	"github.com/bit101/blgo/anim"
	"github.com/bit101/blgo/random"
	"github.com/bit101/blgo/util"
)

const timeInSeconds = 5
const fps = 30
const frames = timeInSeconds * fps
const framesDir = "frames"
const outFileName = "out.gif"
const width = 400.0
const height = 400.0

func main() {
	animation := anim.NewAnimation(width, height, frames)
	animation.Render(framesDir, "frame", render)
	util.ConvertToGIF(framesDir, outFileName, fps)
	util.ViewImage(outFileName)
}

func render(surface *blgo.Surface, percent float64) {
	surface.ClearRGB(1, 1, 1)
	surface.SetSourceRGB(0, 0, 1)
	for i := 0; i < 100; i++ {
		surface.LineTo(random.FloatRange(0, width), random.FloatRange(0, height))
	}
	surface.Stroke()
}
