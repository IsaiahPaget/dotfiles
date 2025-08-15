### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
	print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
	command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
	command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
		print -P "%F{33} %F{34}Installation successful.%f%b" || \
		print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
	zdharma-continuum/zinit-annex-as-monitor \
	zdharma-continuum/zinit-annex-bin-gem-node \
	zdharma-continuum/zinit-annex-patch-dl \
	zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
if [[ -f ~/.fzf.zsh ]]; then
	[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

zinit load zsh-users/zsh-completions
# zinit load zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-syntax-highlighting
zinit load Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit
if [[ -z "$_compinit_done" ]]; then
  compinit
  _compinit_done=1
fi
zinit cdreplay -q


eval "$(oh-my-posh init zsh --config ~/.config/isaiah.omp.toml)"

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

alias vim="nvim"
alias wifi="nmtui"
alias la="ls -A --color"

# git
alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"
alias gl='git log --graph --all --pretty=format:"%C(yellow)%h %C(blue) %an  %ar%C(green)  %D%n%s%n"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=$HOME/.local/bin:$PATH
export PATH="$HOME/.local/Odin:$PATH"
export PATH="$HOME/.local/go/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
if [ -x "$(command -v rbenv)" ]; then
	eval "$(rbenv init -)"
fi
export PATH="/home/isaiahpaget/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/isaiahpaget/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

export PATH="/home/isaiah/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/isaiah/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
. "/home/$USER/.deno/env"
