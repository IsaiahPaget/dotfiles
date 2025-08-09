#!/bin/bash

if ! command -v node &>/dev/null; then
	echo "${CYAN}### Installing Node ###${NC}"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
	nvm install node
fi

