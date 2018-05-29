package main

import (
	"github.com/bit101/blg"
)

const width = 400.0
const height = 400.0

func main() {
	surface := blg.NewSurface(400, 400)

	surface.WriteToPNG("out.png")
}
