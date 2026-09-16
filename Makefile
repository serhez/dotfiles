.PHONY: install test

install: ## Install and configure the environment
	@bash _scripts/install_dotfiles.sh

fetch-local: ## Fetch local changes made to dotfiles and update this repo
	@bash _scripts/fetch_local_dotfiles.sh

test: ## Run dotfiles helper tests
	@sh tests/filter_codex_config.sh
