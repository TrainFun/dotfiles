# Speedup startup
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
if [[ ! -d $ZSH ]]; then
  echo "oh-my-zsh not found, installing..."
  KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
ZSH_THEME="robbyrussell"
plugins=(git zsh-vi-mode zsh-autosuggestions autoupdate zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Show hostname when SSH
[[ -v SSH_TTY ]] && PS1="[%{$fg[green]%}%n%{$reset_color%}@%{$fg[yellow]%}%M%{$reset_color%}] $PS1"

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
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
