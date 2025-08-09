#!/bin/bash

if ! command -v i3 &>/dev/null; then
	echo "${CYAN}### Installing I3 ###${NC}"
	sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
	                libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
	                libstartup-notification0-dev libxcb-randr0-dev \
	                libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
	                libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
	                autoconf libxcb-xrm0 libxcb-xrm-dev automake \
	                libxcb-shape0-dev pkg-config meson \
		 suckless-tools -y
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
	cd $ROOT_DIR

	stow i3
fi
