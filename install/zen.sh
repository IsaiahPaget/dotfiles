#!/bin/bash

if ! command -v zen-browser &>/dev/null; then
	echo "${CYAN}### Installing Zen ###${NC}"
	sudo yay -S zen-browser --noconfirm
fi
