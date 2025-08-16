#!/bin/bash

if ! command -v bat &>/dev/null; then
	echo "${CYAN}### Installing Bat ###${NC}"
	sudo pacman -S bat -y
fi
