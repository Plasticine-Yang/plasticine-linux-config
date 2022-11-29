# ============================ oh-my-zsh configuration ============================

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Whether auto update oh-my-zsh -- disabled auto reminder
zstyle ':omz:update' mode disabled  # disable automatic updates

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
plugins=(
  git
	vi-mode
	z
	history-substring-search
	dirhistory
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# ============================ User configuration ============================

# vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
