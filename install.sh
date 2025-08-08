#!/bin/sh

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

echo "${CYAN}### Starting ###${NC}"

##
# Optional Upgrade
##
echo "${CYAN}### Do you want to update? ###${NC}"
read -p "Confirm (y/n)?" CONT
if [ "$CONT" = "y" ]; then
	sudo apt update && sudo apt upgrade -y
fi

##
# Preflight
##
source ./preflight.sh

##
# Install everything
##
echo "${CYAN}### Running install scripts ###${NC}"
for file in "$ROOT_DIR/install/"*; do
	cd $ROOT_DIR
    if [ -f "$file" ]; then
        echo -e "${YELLOW}Sourcing $file${NC}"
        source "$file"
    fi
done

