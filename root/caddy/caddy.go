package main

import (
	"github.com/caddyserver/caddy/caddy/caddymain"

	// plug in plugins here, for example:
	// _ "import/path/here"
	_ "github.com/caddyserver/dnsproviders/route53"
)

func main() {
	caddymain.EnableTelemetry = false
	caddymain.Run()
}

