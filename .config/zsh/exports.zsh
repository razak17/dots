typeset -U PATH path

if [ -d "/home/razak/.oh-my-zsh" ]; then
  export ZSH="/home/razak/.oh-my-zsh"
fi

if [ -x "~/.fzf.zsh" ]; then
  source ~/.fzf.zsh
fi

if [ -x "/usr/bin/go" ]; then
  export GOPATH="$HOME/.local/share/go"
fi

if [ -x "$HOME/lib/azure-cli" ]; then
  source '$HOME/lib/azure-cli/az.completion'
fi

# fnm                                                                              │
if [ -x "$HOME/.fnm/fnm" ]; then
  export FNMPATH="/home/razak/.fnm"
  NODE="$FNMPATH/node-versions/v15.5.1/installation"
  node_modules="$PATH:$NODE/bin"
  node_modules_alt="$PATH:$NODE/lib/node_modules/bin"
fi

# Which plugins would you like to load?
plugins=(
  git
  docker
  docker-compose
  zsh-z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

path=("$HOME/.local/bin" "$GOPATH" "$FNMPATH" "$node_modules_alt"  "$node_modules" "$path[@]")

export PATH
export npm_config_prefix="$NODE/lib/node_modules"

# Colorful Man Pages
export PAGER=less
export LESS_TERMCAP_mb=$'\E[01;31m'         # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'    # begin bold
export LESS_TERMCAP_me=$'\E[0m'             # end mode
export LESS_TERMCAP_se=$'\E[0m'             # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'      # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'             # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m'   # begin underline

# XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export EDITOR='nvim'

#autoload -U colors && colors
export CLICOLOR=1
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# Enable a better reverse search experience.
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80% --color=dark"

eval "$(fnm env)"
source $ZSH/oh-my-zsh.sh
