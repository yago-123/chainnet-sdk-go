OPENAPI_SPEC := api/openapi.yaml
OPENAPI_GENERATED_DIR := v1beta/generated

.PHONY: openapi-check
openapi-check:
	@echo "Checking OpenAPI spec..."
	@ruby -e 'require "yaml"; YAML.load_file(ARGV.fetch(0)); puts "OpenAPI spec YAML is valid: #{ARGV[0]}"' $(OPENAPI_SPEC)

.PHONY: openapi-generate
openapi-generate:
	@echo "Generating OpenAPI SDK code..."
	@mkdir -p $(OPENAPI_GENERATED_DIR)
	@oapi-codegen -generate types -package generated -o $(OPENAPI_GENERATED_DIR)/types.gen.go $(OPENAPI_SPEC)
	@oapi-codegen -generate client -package generated -o $(OPENAPI_GENERATED_DIR)/client.gen.go $(OPENAPI_SPEC)

.PHONY: test
test:
	@echo "Running SDK tests..."
	@go test ./...

.PHONY: fmt
fmt:
	@go fmt ./...
