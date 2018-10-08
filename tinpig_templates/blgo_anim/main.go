package main

import (
	"github.com/bit101/blgo"
	"github.com/bit101/blgo/anim"
	"github.com/bit101/blgo/random"
	"github.com/bit101/blgo/util"
)

const (
	timeInSeconds = 5
	fps           = 30
	frames        = timeInSeconds * fps
	framesDir     = "frames"
	outFileName   = "out.gif"
	width         = 400.0
	height        = 400.0
)

var surface *blgo.Surface

func main() {
	surface = blgo.NewSurface(width, height)
	animation := anim.NewAnimation(surface, frames, framesDir)
	animation.Render(render)
	util.ConvertToGIF(framesDir, outFileName, fps)
	util.ViewImage(outFileName)
}

func render(percent float64) {
	surface.ClearRGB(1, 1, 1)
	surface.SetSourceRGB(0, 0, 1)
	for i := 0; i < 100; i++ {
		surface.LineTo(random.FloatRange(0, width), random.FloatRange(0, height))
	}
	surface.Stroke()
}
