source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

direnv hook fish | source
fnm env | source

# opencode
fish_add_path /home/isaiah/.opencode/bin
