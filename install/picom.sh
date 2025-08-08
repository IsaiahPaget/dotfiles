#!/bin/sh

if ! command -v picom &>/dev/null; then
	echo "${CYAN}### Installing Picom ###${NC}"
	sudo apt-get install picom -y
	stow picom
fi
