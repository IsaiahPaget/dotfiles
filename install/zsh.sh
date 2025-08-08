#!/bin/sh

if ! command -v zsh &>/dev/null; then
	echo "${CYAN}### Installing ZSH ###${NC}"
	sudo apt-get install zsh -y
	stow zsh
fi

