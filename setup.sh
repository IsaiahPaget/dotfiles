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
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
	chmod u+x nvim-linux-x86_64.appimage
	mkdir -p ~/.local/bin/
	mv nvim-linux-x86_64.appimage ~/.local/bin/nvim
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
if ! [ -x "$(command -v fzf)" ]; then
	echo "${CYAN}### Installing Fzf ###${NC}"
	sudo apt-get install fzf
	if ! [ -x "$(command -v fzf)" ]; then
		echo "${RED}### Could not install Fzf ###${NC}"
	fi
fi
if ! [ -x "$(command -v batcat)" ]; then
	echo "${CYAN}### Installing Bat ###${NC}"
	sudo apt-get install bat
	if ! [ -x "$(command -v batcat)" ]; then
		echo "${RED}### Could not install Bat ###${NC}"
	fi
fi
if ! [ -x "$(command -v rofi)" ]; then
	echo "${CYAN}### Installing Rofi ###${NC}"
	sudo apt-get install rofi
	if ! [ -x "$(command -v rofi)" ]; then
		echo "${RED}### Could not install Rofi ###${NC}"
	fi
fi
if ! [ -x "$(command -v docker)" ]; then
	echo "${CYAN}### Installing Docker ###${NC}"
	URL="https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb"
	DOWNLOAD_DIR="$HOME/Downloads"
	DEB_FILE="docker-desktop-amd64.deb"
	DEB_PATH="$DOWNLOAD_DIR/$DEB_FILE"
	HasCurl
	sudo apt install  ca-certificates  curl  gnupg  lsb-release
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt update
	sudo apt install docker-ce docker-ce-cli containerd.io -y
	curl -L -o "$DEB_PATH" "$URL"
	sudo apt install -y "$DEB_PATH"
	if ! [ -x "$(command -v docker)" ]; then
		echo "${RED}### Could not install Docker ###${NC}"
	fi
fi
if ! [ -x "$(command -v docker-compose)" ]; then
	echo "${CYAN}### Installing Docker Compose ###${NC}"
	sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	
	if ! [ -x "$(command -v docker-compose)" ]; then
		echo "${RED}### Could not install Docker Compose ###${NC}"
	fi
fi
if ! [ -x "$(command -v node)" ]; then
	echo "${CYAN}### Installing Node ###${NC}"
	HasCurl
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
	nvm install node
fi
if ! [ -x "$(command -v i3)" ]; then
	echo "${CYAN}### Installing I3 ###${NC}"
	HasCurl
	sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
	                libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
	                libstartup-notification0-dev libxcb-randr0-dev \
	                libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
	                libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
	                autoconf libxcb-xrm0 libxcb-xrm-dev automake \
	                libxcb-shape0-dev pkg-config meson \
		 suckless-tools
	mkdir -p ~/.local/i3/
	URL="https://i3wm.org/downloads/i3-4.23.tar.xz"
	DOWNLOAD_DIR="$HOME/.local/i3"
	TAR_FILE="i3-4.23.tar.xz"
	TAR_PATH="$DOWNLOAD_DIR/$TAR_FILE"
	I3_PATH="$DOWNLOAD_DIR/i3-4.23"
	I3_BUILD_PATH="$I3_PATH/build"
	curl -L -o "$TAR_PATH" "$URL"
	tar xvf "$TAR_PATH" -C "$DOWNLOAD_DIR"
	mkdir -p "$I3_BUILD_PATH"
	cd "$I3_BUILD_PATH"
	meson ..
	ninja
	sudo ninja install
	cd $HOME
	if ! [ -d "$I3_PATH" ]; then
		echo "${RED}### Could not download I3 ###${NC}"
	fi
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
if ! [ -x "$(command -v redshift)" ]; then
	echo "${CYAN}### Installing Redshift ###${NC}"
	sudo apt-get install redshift
	if ! [ -x "$(command -v redshift)" ]; then
		echo "${RED}### Could not install Redshift ###${NC}"
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
