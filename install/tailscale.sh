#!/bin/bash


if command -v tailscale &>/dev/null; then
  echo "Tailscale already installed"
else
	curl -fsSL https://tailscale.com/install.sh | sh
fi
