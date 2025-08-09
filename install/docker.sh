#!/bin/bash

if ! command -v docker &>/dev/null; then
	echo "${CYAN}### Installing Docker ###${NC}"
	# URL="https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb"
	# DOWNLOAD_DIR="$HOME/Downloads"
	# DEB_FILE="docker-desktop-amd64.deb"
	# DEB_PATH="$DOWNLOAD_DIR/$DEB_FILE"
	# HasCurl
	# sudo apt install  ca-certificates  curl  gnupg  lsb-release
	# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	# echo  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	# sudo apt update
	# sudo apt install docker-ce docker-ce-cli containerd.io -y
	# curl -L -o "$DEB_PATH" "$URL"
	# sudo apt install -y "$DEB_PATH"
	#
	sudo apt install apt-transport-https ca-certificates software-properties-common -y
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
	sudo apt update -y
	sudo apt install docker-ce -y
	sudo systemctl enable docker
	sudo systemctl start docker
	sudo groupadd docker
	sudo usermod -aG docker $USER
fi

if ! command -v docker-compose &>/dev/null; then
	echo "${CYAN}### Installing Docker Compose ###${NC}"
	sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
fi

