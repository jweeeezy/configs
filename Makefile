SHELL := /bin/bash

DOTFILES_DIR = dotfiles
_DOTFILES = $(shell ls -A $(DOTFILES_DIR))
_DOTFILES_BLACKLIST = .gitconfig

# The Install command will create symbolic links in your home directory for all
# files in the dot-files directory except the filename is listed in the
# _DTOFILES_BLACKLIST, which will be copied instead.
# If there is already a file in your home directory, a backup will be created.
# Also installs useful bash scripts as symlinks in your /usr/local/bin/
.PHONY: install
install:
	@echo "Linking Dot Files..."
	@for file in $(_DOTFILES); do \
		if echo "$(_DOTFILES_BLACKLIST)" | grep -qw "$$file"; then \
			echo "Copying blacklisted file: $$file"; \
			cp $(DOTFILES_DIR)/$$file $(HOME)/$$file; \
		else \
			if [ -f $(HOME)/$$file ] && [ ! -L $(HOME)/$$file ]; then \
				echo "Backing up existing $$file to $$file.bak"; \
				mv $(HOME)/$$file $(HOME)/$$file.bak; \
			fi; \
			echo "Linking $$file"; \
			ln -sfn $(HOME)/configs/$(DOTFILES_DIR)/$$file $(HOME)/$$file; \
		fi; \
	done
	@echo "Installing Check Git Statuses Tool (needs sudo authorization) ..."
	@sudo ln -sf $(HOME)/configs/tools/bash/check_git_statuses.sh /usr/local/bin/check_git_statuses
	@echo "Installing Insert Template Project Tool (needs sudo authorization) ..."
	@sudo ln -sf $(HOME)/configs/tools/bash/insert_template_project.sh /usr/local/bin/insert_template_project.sh
	@echo "Installing Remove Credentials from Bash History Tool (needs sudo authorization) ..."
	@sudo ln -sf $(HOME)/configs/tools/bash/remove_credentials_from_bash_history.sh /usr/local/bin/remove_credentials_from_bash_history.sh


# Development Targets

.PHONY: venv
venv:
	@python3 -m venv .venv

.PHONY: install_dev_deps
install_dev_deps:
	@if [ -z "$$VIRTUAL_ENV" ]; then \
		echo "Error: Please activate a virtual environment."; \
		exit 1; \
	fi
	@pip install -r dev-requirements.txt
	@pre-commit install
	@pre-commit autoupdate

.PHONY: quality_gate
quality_gate:
	@pre-commit run --all-files
