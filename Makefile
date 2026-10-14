.DEFAULT_GOAL := help
.PHONY: help install serve serve-drafts build clean format format-check links docker

help: ## List available targets
	@awk 'BEGIN {FS = ":.*## "} /^[a-z-]+:.*## / {printf "  \033[36m%-14s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## Install Ruby gems and npm dev tools (Prettier)
	bundle install
	npm install

serve: ## Local dev server with live reload on http://localhost:4000
	bundle exec jekyll serve --livereload

serve-drafts: ## Dev server including drafts and future-dated posts
	bundle exec jekyll serve --livereload --drafts --future

build: ## Build the site into _site/ (same as CI)
	bundle exec jekyll build

clean: ## Remove _site/ and the Jekyll cache
	bundle exec jekyll clean

format: ## Format Markdown/Liquid/YAML with Prettier
	npx prettier --write .

format-check: ## Check formatting without changing files (what CI does)
	npx prettier --check .

links: build ## Check for broken links in the built site (needs lychee)
	lychee --config .lycheeignore _site || true

docker: ## Run the site with Docker instead of a local Ruby setup
	docker compose up
