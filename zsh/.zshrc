# Speedup startup
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-vi-mode zsh-autosuggestions autoupdate zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# ZVM surround
export ZVM_VI_SURROUND_BINDKEY=s-prefix

function zvm_after_init() {
  # Set up fzf key bindings and fuzzy completion
  source <(fzf --zsh)

  # tmux sessionizer
  tmux-sessionizer-widget() { BUFFER="$HOME/.local/bin/tmux-sessionizer"; zle accept-line; }
  zle -N tmux-sessionizer-widget
  bindkey '^f' tmux-sessionizer-widget
}

# Machine specific override
source "$HOME/.zshrc.local"
