typeset -g -A key

[ -f $HOME/.config/zsh/aliases.zsh ] && source $HOME/.config/zsh/aliases.zsh
[ -f $HOME/.config/zsh/exports.zsh ] && source $HOME/.config/zsh/exports.zsh
[ -f $HOME/.config/zsh/env.zsh ]     && source $HOME/.config/zsh/env.zsh
[ -f $HOME/.config/zsh/binds.zsh ]   && source $HOME/.config/zsh/binds.zsh
[ -f $HOME/.config/zsh/func.zsh ]    && source $HOME/.config/zsh/func.zsh
[ -f $HOME/.config/zsh/prompt.zsh ]  && source $HOME/.config/zsh/prompt.zsh


eval "$(fnm env)"
source $ZSH/oh-my-zsh.sh

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

autoload -U compinit && compinit

zle_highlight=('paste:none')
zshcache_time="$(date +%s%N)"

# forces zsh to realize new commands
zstyle ':completion:*' completer _oldlist _expand _complete _match _ignored _approximate
# select completions with arrow keys
zstyle ':completion:*' menu select
# group results by category
zstyle ':completion:*' group-name ''
# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh
# enabling autocompletion of privileged environments in privileged commands
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':urlglobber' url-other-schema
zmodload -i zsh/complist
