#!/bin/bash

set -e

# Create the# assuming you always name this file .dotfiles
ROOT_DIR=~/.dotfiles/

mkdir -p ~/Downloads/
DOWNLOADS_DIR=~/Downloads/

GREEN="\033[1;32m"
RED="\033[1;31m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
NC="\033[0m"

echo -e "${GREEN}### Starting ###${NC}"

##
# Optional Upgrade
##
echo -e "${CYAN}### Do you want to update? ###${NC}"
read -p "Confirm (y/n)?" CONT
if [ "$CONT" = "y" ]; then
	sudo apt update && sudo apt upgrade -y
fi

##
# Preflight
##
echo -e "${GREEN}### Preparing for takeoff ###${NC}"
source ./preflight.sh

##
# Install everything
##
echo -e "${CYAN}### Running install scripts ###${NC}"
for file in "$ROOT_DIR/install/"*; do
	cd $ROOT_DIR
    if [ -f "$file" ]; then
		short_path="${file#$ROOT_DIR}"   # remove $ROOT_DIR prefix
        echo -e "${YELLOW}Sourcing $short_path${NC}"
        source "$file"
    fi
done

echo -e "${GREEN}### Done Please Restart Terminal ###${NC}"
