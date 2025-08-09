#!/bin/bash

if ! command -v gh &>/dev/null; then
	echo "${CYAN}### Installing Github CLI ###${NC}"
	sudo apt-get install gh -y
fi
