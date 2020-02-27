package main

import (
	"fmt"
	"os"

	"github.com/labstack/echo"
)

var hostname, _ = os.Hostname()

func main() {
	router := echo.New()

	router.GET("/", simpleHandler)
	router.Start("0.0.0.0:4000")
}

func simpleHandler(ctx echo.Context) error {
	return ctx.HTML(200, fmt.Sprintf("<h1> hello I'm running at %s </h1>", hostname))
}
