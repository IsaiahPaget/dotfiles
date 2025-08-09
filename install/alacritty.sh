#!/bin/bash

if ! command -v alacritty &>/dev/null; then
	sudo apt-get install alacritty -y
fi
