# config
CASE_SENSITIVE="true"
HIST_STAMPS="mm/dd/yyyy           "
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

autoload -U colors && colors	# Load colors

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

zle_highlight=('paste:none')
zshcache_time="$(date +%s%N)"

# Which plugins would you like to load?
plugins=(
  git
  docker
  docker-compose
  zsh-z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# options
typeset -g -A key
typeset -U PATH path

setopt always_to_end        # move cursor to end if word had one match
setopt auto_cd              # cd by typing directory name if it's not a command
setopt auto_list            # automatically list choices on ambiguous completion
setopt auto_menu            # automatically use menu completion
setopt correct_all          # autocorrect commands

unsetopt nomatch
unsetopt PROMPT_SP


setopt append_history
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks   # remove superfluous blanks from history items
setopt inc_append_history   # save history entries as soon as they are entered
setopt share_history        # share history between different instances
setopt interactive_comments # allow comments in interactive shells
setopt complete_aliases     # autocomplete for aliases

# IMPORTANT: shell/profile should come before binds (avoid weird behavior)
[ -f $HOME/.config/zsh/aliases ]     && source $HOME/.config/zsh/aliases
[ -f $HOME/.config/shell/profile ]   && source $HOME/.config/shell/profile
[ -f $HOME/.config/zsh/binds ]       && source $HOME/.config/zsh/binds
[ -f $HOME/.config/zsh/func ]        && source $HOME/.config/zsh/func

# prompt
PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%\r%{$fg[red]%}@%{$fg[white]%}%\m%{$fg[blue]%}]%{$reset_color%}%  %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%}'
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# compe
autoload -U compinit

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

compinit
_comp_options+=(globdots)

source $HOME/lib/azure-cli/az.completion
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash
