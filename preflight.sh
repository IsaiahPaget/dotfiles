#!/bin/bash

if ! command -v stow &>/dev/null; then
	echo "${CYAN}### Installing Stow ###${NC}"
	sudo apt-get install stow -y
fi
if ! command -v curl &>/dev/null; then
	echo "${CYAN}### Installing Curl ###${NC}"
	sudo apt-get install curl -y
fi
