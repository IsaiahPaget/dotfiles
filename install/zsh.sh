#!/bin/bash

if ! command -v zsh &>/dev/null; then
	echo -e "${CYAN}### Installing ZSH ###${NC}"
	sudo pacman -S zsh --noconfirm
	stow zsh
fi

