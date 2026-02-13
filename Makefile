VERSION ?= $(shell git describe --tags --always --dirty)
LDFLAGS = -ldflags "-X main.Version=$(VERSION)"

PKGS = $(shell go list ./...)
BINARY = captive-browser

TMP_DIR ?= .tmp
COVERAGE_FILE = $(TMP_DIR)/coverage.txt
COVERAGE_HTML_FILE = $(TMP_DIR)/coverage.html

.DEFAULT_GOAL := help

.PHONY: build
build: ## Build the binary
	@echo "--> Building $(BINARY) $(VERSION)..."
	go build $(LDFLAGS) -o $(BINARY) .

.PHONY: install
install: ## Install the binary
	@echo "--> Installing $(BINARY) $(VERSION)..."
	go install $(LDFLAGS) .

.PHONY: test
test: ## Run tests
	@mkdir -p $(dir $(COVERAGE_FILE))
	go test -covermode=atomic -coverprofile=$(COVERAGE_FILE) -race -failfast -timeout=30s $(PKGS)

.PHONY: cover
cover: test ## Run tests and open coverage report
	go tool cover -html=$(COVERAGE_FILE) -o $(COVERAGE_HTML_FILE)
	@echo "--> Coverage report: $(COVERAGE_HTML_FILE)"

.PHONY: lint
lint: ## Run linter (requires golangci-lint)
	golangci-lint run

.PHONY: clean
clean: ## Clean build artifacts
	rm -f $(BINARY)
	rm -rf $(TMP_DIR) dist
	go clean
	go mod tidy -v

.PHONY: version
version: ## Show current version
	@echo "$(VERSION)"

.PHONY: help
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
