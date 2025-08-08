#!/bin/sh

if ! command -v redshift &>/dev/null; then
	echo "${CYAN}### Installing Redshift ###${NC}"
	sudo apt-get install redshift -y
fi
