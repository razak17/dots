# shell/profile should come before binds
[ -f $HOME/.config/zsh/conf ]        && source $HOME/.config/zsh/conf
[ -f $HOME/.config/zsh/opts ]        && source $HOME/.config/zsh/opts
[ -f $HOME/.config/shell/profile ]   && source $HOME/.config/shell/profile
[ -f $HOME/.config/zsh/aliases ]     && source $HOME/.config/zsh/aliases
[ -f $HOME/.config/zsh/binds ]       && source $HOME/.config/zsh/binds
[ -f $HOME/.config/zsh/func ]        && source $HOME/.config/zsh/func
[ -f $HOME/.config/zsh/prompt ]      && source $HOME/.config/zsh/prompt
[ -f $HOME/.config/zsh/compe ]       && source $HOME/.config/zsh/compe
[ -f $HOME/.fzf.zsh ]                && source $HOME/.fzf.zsh
