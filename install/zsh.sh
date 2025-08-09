#!/bin/bash

if ! command -v zsh &>/dev/null; then
	echo -e "${CYAN}### Installing ZSH ###${NC}"
	sudo apt-get install zsh -y
	stow zsh
fi

