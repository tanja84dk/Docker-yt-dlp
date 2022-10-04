# including my config file with private dev repo and username
include ../.config/Makefile

VERSION ?= "2022.10.04"
APP_NAME ?= "yt-dlp"

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
		@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# DOCKER TASKS
# Build the container
build: ## Build all the containers
		docker build --rm -t $(REPO)/$(USERNAME)/$(APP_NAME):$(VERSION) -t $(REPO)/$(USERNAME)/$(APP_NAME):latest -t $(USERNAME)/$(APP_NAME):$(VERSION) -t $(USERNAME)/$(APP_NAME):latest -f Dockerfile .

build-nc: ## Build all the containers without caching
		docker build --rm --no-cache -t $(REPO)/$(USERNAME)/$(APP_NAME):$(VERSION) -t $(REPO)/$(USERNAME)/$(APP_NAME):latest -t $(USERNAME)/$(APP_NAME):$(VERSION) -t $(USERNAME)/$(APP_NAME):latest -f Dockerfile .

build-pull: ## Build all the containers with pulling newest base
		docker build --pull --rm -t $(REPO)/$(USERNAME)/$(APP_NAME):$(VERSION) -t $(REPO)/$(USERNAME)/$(APP_NAME):latest -t $(USERNAME)/$(APP_NAME):$(VERSION) -t $(USERNAME)/$(APP_NAME):latest -f Dockerfile .

build-pull-nc: ## Build all the containers with pulling newest base without caching
		docker build --pull --no-cache --rm -t $(REPO)/$(USERNAME)/$(APP_NAME):$(VERSION) -t $(REPO)/$(USERNAME)/$(APP_NAME):latest -t $(USERNAME)/$(APP_NAME):$(VERSION) -t $(USERNAME)/$(APP_NAME):latest -f Dockerfile .

buid-dev: ## Build all the dev containers
		docker build --rm -t $(REPO)/$(USERNAME)/$(APP_NAME):$(VERSION) -t $(REPO)/$(USERNAME)/$(APP_NAME):latest -f Dockerfile .

build-docker: ## Build all the docker containers
		docker build --rm -t $(USERNAME)/$(APP_NAME):$(VERSION) -t $(USERNAME)/$(APP_NAME):latest -f Dockerfile .

push-dev: ## Push to dev
		docker push $(REPO)/$(USERNAME)/$(APP_NAME):$(VERSION)
		docker push $(REPO)/$(USERNAME)/$(APP_NAME):latest

push-docker: ## Push to Docker
		docker push $(USERNAME)/$(APP_NAME):$(VERSION)
		docker push $(USERNAME)/$(APP_NAME):latest

