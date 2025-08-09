#!/bin/bash

if ! command -v fzf &>/dev/null; then
	echo "${CYAN}### Installing Fzf ###${NC}"
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
fi
