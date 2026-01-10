mv ~/.config/hypr ~/.config/hypr.back
stow hypr

mv ~/.config/git/ ~/.config/git.bak
stow git

mv ~/.bashrc .bashrc.bak
stow bash

mv ~/.config/nvim/lua/config/options.lua ~/.config/nvim/lua/config/options.bak
mv ~/.config/nvim/lua/config/keymaps.lua ~/.config/nvim/lua/config/keymaps.bak

stow nvim
