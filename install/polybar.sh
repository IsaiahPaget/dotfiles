#!/bin/bash

if ! command -v polybar &>/dev/null; then
	echo "${CYAN}### Installing Polybar ###${NC}"
	sudo apt-get install polybar -y

	stow polybar
fi
