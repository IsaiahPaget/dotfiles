#!/bin/bash

if ! command -v rofi &>/dev/null; then
	echo "${CYAN}### Installing Rofi ###${NC}"
	sudo apt-get install rofi -y
	stow rofi
fi
