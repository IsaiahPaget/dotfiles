GREEN="\033[1;32m"
RED="\033[1;31m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
NC="\033[0m"
echo "${CYAN}### Starting ###${NC}"

mkdir -p ~/Downloads/

echo "${CYAN}### Do you want to update? ###${NC}"
read -p "Confirm (y/n)?" CONT
if [ "$CONT" = "y" ]; then
	sudo apt-get update
	sudo apt-get upgrade
fi

HasCurl() {
	if ! [ -x "$(command -v curl)" ]; then
		echo "${RED}### Could not find Curl ###${NC}"
		exit 1
	fi
}
HasZsh() {
	if ! [ -x "$(command -v zsh)" ]; then
		echo "${RED}### Could not find Zsh ###${NC}"
		exit 1
	fi
}
HasStow() {
	if ! [ -x "$(command -v stow)" ]; then
		echo "${RED}### Could not find Stow ###${NC}"
		exit 1
	fi
}
LoadConfigs() {
	echo "${CYAN}### Load Config? ###${NC}"
	read -p "Confirm (y/n)?" CONT
	if [ "$CONT" = "y" ]; then
		echo "${CYAN}### Load Kanata? ###${NC}"
		read -p "Confirm (y/n)?" CONT
		if [ "$CONT" = "y" ]; then
			stow kanata
		fi
		echo "${CYAN}### Load everything? ###${NC}"
		read -p "Confirm (y/n)?" CONT
		if [ "$CONT" = "y" ]; then
			stow nvim
			stow zsh
			stow tmux
			stow kitty
			stow i3
			stow polybar
			stow picom
			stow rofi
			stow ohmyposh
			return
		fi
		echo "${CYAN}### Load Neovim Config ###${NC}"
		read -p "Confirm (y/n)?" CONT
		if [ "$CONT" = "y" ]; then
			stow nvim
		fi
		echo "${CYAN}### Load Zsh Config ###${NC}"
		read -p "Confirm (y/n)?" CONT
		if [ "$CONT" = "y" ]; then
			stow zsh
		fi
		echo "${CYAN}### Load Tmux Config ###${NC}"
		read -p "Confirm (y/n)?" CONT
		if [ "$CONT" = "y" ]; then
			stow tmux
		fi
		echo "${CYAN}### Load Kitty Config ###${NC}"
		read -p "Confirm (y/n)?" CONT
		if [ "$CONT" = "y" ]; then
			stow kitty
		fi
		echo "${CYAN}### Load I3 Config ###${NC}"
		read -p "Confirm (y/n)?" CONT
		if [ "$CONT" = "y" ]; then
			stow i3
		fi

		echo "${CYAN}### Load Polybar Config ###${NC}"
		read -p "Confirm (y/n)?" CONT
		if [ "$CONT" = "y" ]; then
			stow polybar
		fi
		echo "${CYAN}### Load Picom Config ###${NC}"
		read -p "Confirm (y/n)?" CONT
		if [ "$CONT" = "y" ]; then
			stow picom
		fi
		echo "${CYAN}### Load Rofi Config ###${NC}"
		read -p "Confirm (y/n)?" CONT
		if [ "$CONT" = "y" ]; then
			stow rofi
		fi
	fi
}
# if ! [ -x "$(command -v stow)" ]; then
# 	echo "${CYAN}### Installing Stow ###${NC}"
# 	sudo apt-get install stow
# fi
# if ! [ -x "$(command -v curl)" ]; then
# 	echo "${CYAN}### Installing Curl ###${NC}"
# 	sudo apt-get install curl
# fi

if ! [ -d "$HOME/.local/kitty.app" ]; then
	echo "${CYAN}### Installing Kitty ###${NC}"
	HasCurl
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
	# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
	# your system-wide PATH)
	ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
	# Place the kitty.desktop file somewhere it can be found by the OS
	cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
	# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
	cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
	# Update the paths to the kitty and its icon in the kitty desktop file(s)
	sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
	sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
	# Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
	echo 'kitty.desktop' > ~/.config/xdg-terminals.list
	if ! [ -d "$HOME/.local/kitty.app" ]; then
		echo "${RED}### Could not install Kitty ###${NC}"
	fi
fi
LoadConfigs
echo "${GREEN}### Done Please Restart Terminal ###${NC}"
