.PHONY: install

install: ## Install and configure the environment
	@bash scripts/install.sh

update:
	@bash scripts/update_dotfiles.sh
