package main

import (
	"github.com/mholt/caddy/caddy/caddymain"

	// plug in plugins here, for example:
	// _ "import/path/here"
)

func main() {
	caddymain.EnableTelemetry = false
	caddymain.Run()
}

