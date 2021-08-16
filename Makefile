DOCKER       = docker
HUGO_VERSION = 0.82.0
DOCKER_IMAGE = dojo-hugo
DOCKER_IMAGE_ID = $(shell docker images -q $(DOCKER_IMAGE):latest)
DOCKER_RUN   = $(DOCKER) run --rm --interactive --tty --volume $(PWD):/src
DOCKER_RUN_IN_GITHUB_ACTIONS = $(DOCKER) run --rm --volume $(PWD):/src
HUGO_LOCAL_OUTPUT_DIR = 'docs-local/'

.PHONY: all build build-preview serve docker-all

# If the first argument is "docker-new-module"...
ifeq (docker-new-module,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "docker-new-module"
  NEW_MODULE_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(NEW_MODULE_ARGS):;@:)
endif

# Generic
#-------------------------------------------------------------------------------

help:  ## Show this help
	@echo "\nIf you have docker installed, use the following targets (make docker-serve is probably what you want for local development): \n"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' | grep "^docker-"
	@echo "\nIf you have hugo installed, use the following targets: \n"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' | grep "^hugo-"
	@echo "\nOther targets: \n"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' | grep -v "^docker-" | grep -v "^hugo-" | grep -v "^_"
	@echo "\n"
	@echo "Don't forget to checkout contributions.md for more info on how to contribute to this repo."
	@echo "\n"

clean: ## Remove the docs-local/ folder from your system
	rm -rf $(HUGO_LOCAL_OUTPUT_DIR)

# Hugo specific
#-------------------------------------------------------------------------------

build:                ## (via hugo) Build site with production settings
	hugo -d $(HUGO_LOCAL_OUTPUT_DIR)

build-preview:        ## (via hugo) Build site with drafts and future posts enabled
	hugo -D -F -d $(HUGO_LOCAL_OUTPUT_DIR)

non-production-build: ## (via hugo) Build the non-production site, which adds noindex headers to prevent indexing
	hugo --enableGitInfo

serve:                ## (via hugo) Boot the development server
	hugo -D server --watch --bind 0.0.0.0 -d $(HUGO_LOCAL_OUTPUT_DIR)




# Docker specific
#-------------------------------------------------------------------------------

docker-image:                          ## (via docker) Build or rebuild the docker image needed for docker targets (use when you make changes to the Dockerfile)
	$(DOCKER) build . --tag $(DOCKER_IMAGE) --build-arg HUGO_VERSION=$(HUGO_VERSION)

_docker-image-check:                  ## (via docker) )nly build a docker image if required (could be replaced my docker-compose)
ifeq ($(strip $(DOCKER_IMAGE_ID)),)
	$(DOCKER) build . --tag $(DOCKER_IMAGE) --build-arg HUGO_VERSION=$(HUGO_VERSION)
endif

docker-build:      _docker-image-check ## (via docker) Build hugo site
	$(DOCKER_RUN) $(DOCKER_IMAGE) hugo -d $(HUGO_LOCAL_OUTPUT_DIR)

docker-build-prod: _docker-image-check ## (via docker) Build hugo site (prod) - used by the CI/CD tool
	$(DOCKER_RUN_IN_GITHUB_ACTIONS) $(DOCKER_IMAGE) hugo

docker-preview:    _docker-image-check ## (via docker) Preview hugo site
	$(DOCKER_RUN) $(DOCKER_IMAGE) hugo -D -d $(HUGO_LOCAL_OUTPUT_DIR)

docker-serve:      _docker-image-check ## (via docker) Run hugo server locally
	$(DOCKER_RUN) -p 1313:1313 $(DOCKER_IMAGE) hugo -D server --watch --bind 0.0.0.0 -d $(HUGO_LOCAL_OUTPUT_DIR)

docker-shell: _docker-image-check      ## (via docker) - Start a shell where you can run adhoc/interactive commands in a hugo environment
	$(DOCKER_RUN) -p 1313:1313 $(DOCKER_IMAGE) sh

docker-new-module: _docker-image-check ## (via docker) - Create a new lesson (make docker-new-module foo)
	$(DOCKER_RUN) -p 1313:1313 $(DOCKER_IMAGE) hugo new --kind topic lessons/$(NEW_MODULE_ARGS)

docker-clean:                          ## (via docker) Deletes files as root without needing sudo, useful for linux users where files are created as root by docker container so sudo isn't needed
	$(DOCKER_RUN) $(DOCKER_IMAGE) rm -rf $(HUGO_LOCAL_OUTPUT_DIR)
