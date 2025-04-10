SHELL := /bin/bash

DOTFILES_DIR = ./dot_files/
_DOTFILES = $(shell ls -A $(DOTFILES_DIR))
_DOTFILES_BLACKLIST = .bashrc

.PHONY: install
install:
	@echo "Copying Dot Files..."
	@for file in $(_DOTFILES); do \
		if [[ ! " $(_DOTFILES_BLACKLIST) " =~ " $$file " ]]; then \
			cp $(DOTFILES_DIR)$$file ~/; \
		fi \
	done
	@echo "Setting up Symbolic Link to configs/dotfiles/.bashrc ..."
	@rm $(HOME)/.bashrc || true
	@ln -s $(PWD)/dot_files/.bashrc $(HOME)/.bashrc 
