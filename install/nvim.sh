#!/bin/bash
if ! command -v nvim >/dev/null 2>&1; then
    curl -LO https://github.com/neovim/neovim/releases/download/v0.11.7/nvim-linux-x86_64.appimage

    chmod u+x nvim-linux-x86_64.appimage

    sudo mv nvim-linux-x86_64.appimage /usr/bin/nvim
fi
