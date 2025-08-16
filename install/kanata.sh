#!/bin/bash

if ! command -v kanata &>/dev/null; then
	echo "${CYAN}### Installing Kanata ###${NC}"
	cargo install kanata

	sudo groupadd -f uinput
	sudo usermod -aG input,uinput $USER
	echo 'KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"' | \
		sudo tee /etc/udev/rules.d/99-uinput.rules > /dev/null

	sudo udevadm control --reload-rules
	sudo udevadm trigger
	sudo modprobe uinput

	stow kanata
fi

