#!/bin/sh

sudo apt-get install fonts-font-awesome
echo "${CYAN}### Installing Font Awesome ###${NC}"
if ! [ -f "$HOME/.local/share/fonts/JetBrainsMonoNerdFont-BoldItalic.ttf" ]; then
	echo "${CYAN}### Installing JetBrainsMonoNerdFont ###${NC}"
	mkdir ~/.local/share/fonts
	curl -L -o ~/.local/share/fonts/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
	cd ~/.local/share/fonts
	unzip JetBrainsMono.zip
	rm JetBrainsMono.zip
	fc-cache -fv
fi
