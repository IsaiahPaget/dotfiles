#!/bin/bash

if ! command -v oh-my-posh &>dev/null; then
	echo -e "${CYAN}### Installing Oh my Posh ###${NC}"
	sudo pacman -S oh-my-posh --noconfirm
	stow ohmyposh
fi

