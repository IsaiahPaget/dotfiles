#!/bin/bash

if ! command -v stow &>/dev/null; then
	echo -e "${CYAN}### Installing Stow ###${NC}"
	sudo pacman -S stow -y
fi
if ! command -v curl &>/dev/null; then
	echo -e "${CYAN}### Installing Curl ###${NC}"
	sudo pacman -S curl -y
fi
