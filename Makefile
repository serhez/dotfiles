.PHONY: install

install: ## Install and configure the environment
	@bash scripts/install_dotfiles.sh

fetch-local: ## Fetch local changes made to dotfiles and update this repo
	@bash scripts/fetch_local_dotfiles.sh
