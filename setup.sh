GREEN="\033[1;32m"
RED="\033[1;31m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
NC="\033[0m"
echo "${CYAN}###Starting###${NC}"

sudo apt-get update
sudo apt-get upgrade

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
}
if ! [ -x "$(command -v stow)" ]; then
	echo "${CYAN}### Installing Stow ###${NC}"
	sudo apt-get install stow
fi
if ! [ -x "$(command -v curl)" ]; then
	echo "${CYAN}### Installing Curl ###${NC}"
	sudo apt-get install curl
fi
if ! [ -x "$(command -v zsh)" ]; then
	echo "${CYAN}### Installing ZSH ###${NC}"
	sudo apt-get install zsh
fi
if ! [ -d "$HOME/.oh-my-zsh" ]; then
	echo "${CYAN}### Installing oh-my-zsh ###${NC}"
	HasCurl
	HasZsh
	echo "${YELLOW}### Type 'exit' after going through the oh-my-zsh installer ###${NC}"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"	
	if ! [ -d "$HOME/.oh-my-zsh" ]; then
		echo "${RED}### Could not install oh-my-zsh ###${NC}"
	fi
fi
if ! [ -x "$(command -v rg)" ]; then
	echo "${CYAN}### Installing Ripgrep ###${NC}"
	sudo apt-get install ripgrep
	if ! [ -x "$(command -v rg)" ]; then
		echo "${RED}### Could not install Ripgrep ###${NC}"
	fi
fi
if ! [ -x "$(command -v nvim)" ]; then
	echo "${CYAN}### Installing Neovim ###${NC}"
	HasCurl
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod u+x nvim.appimage
	mkdir -p /opt/nvim
	mv nvim.appimage /opt/nvim/nvim
	export PATH="$PATH:/opt/nvim/"
	if ! [ -x "$(command -v nvim)" ]; then
		./nvim.appimage --appimage-extract
		./squashfs-root/AppRun --version
		sudo mv squashfs-root /
        	sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
	fi
	if ! [ -x "$(command -v nvim)" ]; then
		echo "${RED}### Could not install Neovim ###${NC}"
	fi
fi
if ! [ -x "$(command -v tmux)" ]; then
	echo "${CYAN}### Installing Tmux ###${NC}"
	sudo apt-get install tmux
	if ! [ -x "$(command -v tmux)" ]; then
		echo "${RED}### Could not install Tmux ###${NC}"
	fi
fi

if ! [ -d "$HOME/.tmux/plugins/tpm" ]; then
	echo "${CYAN}### Installing Tmux Plugin Manager ###${NC}"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	source ~/.tmux.conf
	if ! [ -d "$HOME/.tmux/plugins/tpm" ]; then
		echo "${RED}### Could not install Tmux Plugin Manager ###${NC}"
	fi
fi
if ! [ -x "$(command -v gh)" ]; then
	echo "${CYAN}### Installing Github CLI ###${NC}"
	sudo apt-get install gh
	if ! [ -x "$(command -v gh)" ]; then
		echo "${RED}### Could not install Github CLI ###${NC}"
	fi
fi
if ! [ -x "$(command -v feh)" ]; then
	echo "${CYAN}### Installing Feh ###${NC}"
	if ! [ -d "$HOME/Pictures/Wallpapers" ]; then
		mkdir -p ~/Pictures/Wallpapers
	fi
	sudo apt-get install feh
	if ! [ -x "$(command -v feh)" ]; then
		echo "${RED}### Could not install Feh ###${NC}"
	fi
fi
if ! [ -x "$(command -v rofi)" ]; then
	echo "${CYAN}### Installing Rofi ###${NC}"
	sudo apt-get install rofi
	if ! [ -x "$(command -v rofi)" ]; then
		echo "${RED}### Could not install Rofi ###${NC}"
	fi
fi

if ! [ -x "$(command -v node)" ]; then
	echo "${CYAN}### Installing Node ###${NC}"
	HasCurl
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
	nvm install node
fi
if ! [ -x "$(command -v picom)" ]; then
	echo "${CYAN}### Installing Picom ###${NC}"
	sudo apt-get install picom
	if ! [ -x "$(command -v picom)" ]; then
		echo "${RED}### Could not install Picom ###${NC}"
	fi
fi
if ! [ -x "$(command -v polybar)" ]; then
	echo "${CYAN}### Installing Polybar ###${NC}"
	sudo apt-get install polybar
	if ! [ -x "$(command -v polybar)" ]; then
		echo "${RED}### Could not install Polybar ###${NC}"
	fi
fi
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
if ! [ -f "$HOME/.local/share/fonts/JetBrainsMonoNerdFont-BoldItalic.ttf" ]; then
	echo "${CYAN}### Installing JetBrainsMonoNerdFont ###${NC}"
	HasCurl
	mkdir ~/.local/share/fonts
	curl -L -o ~/.local/share/fonts/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
	cd ~/.local/share/fonts
	unzip JetBrainsMono.zip
	rm JetBrainsMono.zip
	fc-cache -fv
	if ! [ -f "$HOME/.local/share/fonts/JetBrainsMonoNerdFont-BoldItalic.ttf" ]; then
		echo "${RED}### Could not install JetBrainsMonoNerdFont ###${NC}"
	fi
fi
LoadConfigs
echo "${GREEN}### Done Please Restart Terminal ###${NC}"
