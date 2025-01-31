DOTFILES_DIR = ./dot_files/
_DOTFILES = $(shell ls -A $(DOTFILES_DIR))

.PHONY: install
install:
	for file in $(_DOTFILES); do cp $(DOTFILES_DIR)$$file ~/; done
