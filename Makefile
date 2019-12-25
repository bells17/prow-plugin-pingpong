VERSION ?= latest
GOVERSION ?= 1.13.5
BUILD_DIR := bin
CMD := pingpong
PKG ?= github.com/bells17/prow-plugin-pingpong
REGISTRY ?= bells17

all: vendor build

.PHONY: vendor
vendor:
		@GO111MODULE=on go mod download
		@GO111MODULE=on go mod tidy
		@GO111MODULE=on go mod vendor

.PHONY: clean
clean:
		@echo "==> Cleaning releases"
		@GOOS=linux go clean -i -x ./...
		rm -f $(PWD)/$(BUILD_DIR)/$(CMD)

.PHONY: mkdir
mkdir:
		@mkdir -p $(BUILD_DIR)

.PHONY: compile
compile: mkdir
		@echo "==> Building the project"
		@docker run -v $(PWD):/go/src/$(PKG) \
			-w /go/src/$(PKG) \
			-e GOOS=linux -e GOARCH=amd64 -e CGO_ENABLED=0 -e GOFLAGS=-mod=vendor golang:$(GOVERSION)-alpine3.10 \
			go build -o $(BUILD_DIR)/$(CMD) .

.PHONY: build
build: compile
		@echo "==> Building the docker image"
		@docker build -t $(REGISTRY)/$(CMD):$(VERSION) .

.PHONY: push
push:
		@echo "==> Pushing the docker image"
		@docker push $(REGISTRY)/$(CMD):$(VERSION)
