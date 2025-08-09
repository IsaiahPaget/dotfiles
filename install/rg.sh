#!/bin/bash

if ! command -v rg &>/dev/null; then
	echo "${CYAN}### Installing Ripgrep ###${NC}"
	sudo apt-get install ripgrep -y
fi
