#!/bin/bash

if ! command -v tmux &>/dev/null; then
	echo "${CYAN}### Installing Tmux ###${NC}"
	sudo apt-get install tmux -y

	if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
		echo "${CYAN}### Installing Tmux Plugin Manager ###${NC}"
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	fi

	stow tmux
fi

