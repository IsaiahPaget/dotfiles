#!/bin/bash

if ! command -v feh &>/dev/null; then
	echo "${CYAN}### Installing Feh ###${NC}"
	mkdir -p ~/Pictures/Wallpapers
	sudo apt-get install feh -y
fi
