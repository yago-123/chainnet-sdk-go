# Chainnet SDK Go

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
