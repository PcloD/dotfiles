package main

import (
	"github.com/bit101/blgo"
	"github.com/bit101/blgo/util"
)

const width = 400.0
const height = 400.0

func main() {
	surface := blgo.NewSurface(width, height)

	surface.WriteToPNG("out.png")
	util.ViewImage("out.png")
}
