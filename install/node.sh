#!/bin/bash

if ! command -v node &>/dev/null; then
	echo "${CYAN}### Installing Node and npm ###${NC}"
	yay -S nodejs npm

fi

