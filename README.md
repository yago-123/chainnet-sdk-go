# Chainnet SDK Go

## Releases

`chainnet-sdk-go` versioning is independent from `chainnet`. Tag SDK releases based on the Go client impact, not the server
version, and push tags matching `v*` to trigger GitHub Releases automatically.

Version upgrades follow SDK semver from the Go consumer point of view: patch for non-breaking fixes, minor for backward-compatible
additions, and major for breaking public API changes. While the SDK remains in `v0.x`, release notes should still call
out breaking changes explicitly.

## Usage

```go
package main

import (
	"context"
	"fmt"
	"log"

	"github.com/yago-123/chainnet-sdk-go/v1beta"
)

func main() {
	client, err := v1beta.NewClient("http://localhost:8080", nil)
	if err != nil {
		log.Fatal(err)
	}

	tip, err := client.GetLatestChain(context.Background())
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("latest height: %d\n", tip.Height)
}
```

The client normalizes the base URL and targets `/api/v1beta` automatically.
