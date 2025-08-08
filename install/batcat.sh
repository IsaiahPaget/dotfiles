#!/bin/sh

if ! command -v batcat &>/dev/null; then
	echo "${CYAN}### Installing Bat ###${NC}"
	sudo apt-get install bat -y
fi
