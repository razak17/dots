ex ()
{
if [ -f $1 ]; then
	case $1 in
	*.tar.bz2)	tar xjf $1	;;
	*.tar.gz)	tar xzf $1	;;
	*.bz2)		bunzip2 $1	;;
	*.gz)		gunzip $1	;;
	*.rar)		unrar x $1	;;
	*.tar)		tar xf $1	;;
	*.tbz2)		tar xjf $1	;;
	*.tgz)		tar xzf $1	;;
	*.zip)		unzip $1	;;
	*.Z)		uncompress $1	;;
	*.7z)		7z x $1		;;
	*.deb)		ar x $1		;;
	*.tar.xz)	tar xf $1	;;
	*.tar.zst)	unzstd $1	;;
	*)		echo "'$1' cannot be extracted via ex()" ;;

    esac
else
    echo "'$1'is not a valid file"
fi
}

alias ali='alias | bat --style=numbers,grid -l cpp'
# Zsh
alias ohmyzsh='nvim ~/.oh-my-zsh'
alias a="nvim ~/.config/zsh/aliases.zsh"
alias cx="nvim ~/docs/x/x.txt"
alias xh="nvim ~/Dev/Scripts/tmux.sh"
alias cdd="cd -"
alias cdlo="cd ~/.local"
alias vc="nvim ~/.config/nvim/init.vim"
# alias vc="nvim ~/.config/nvim/init.lua"
alias lc="nvim ~/.config/nvim/lua/init.lua"
alias zs='source ~/.zshrc'
alias zc="nvim ~/.zshrc"
alias b="bash"
alias so="source"
alias sx="startx"
alias kx="killall xinit"
alias m="mkdir"
alias e="touch"
alias wd="pwd"
alias swap="cat /proc/sys/vm/swappiness"
alias sw="i swapon"
alias sf="sudo swapoff -v"
# alias ex="exit"
alias cdnm="/home/razak/.asdf/installs/nodejs/15.5.1/.npm/lib/node_modules"
alias ir="sudo rm"
alias irm="sudo rm -r"
alias lsl="ls -l"
alias xsh="~/dots/tmux.sh"
alias nxsh="nvim ~/dots/tmux.sh"
alias dsm="~/dots/install.sh"
alias ndsm="nvim ~/dots/install.sh"
alias rnscd="systemctl restart nscd"
alias dls="cat ~/Documents/L400-1/assignments/deadlines.txt"
alias br='sudo brightnessctl set'
# alias brx='echo -e "enter brightness:\n"; read val; xrandr --output eDP-1 --brightness "${val}"'
alias brx='xrandr --output eDP-1 --brightness'

# xrandr --output eDP-1 --brightness 2

# General
alias i='sudo'
alias is='sudo su'
alias v="nvim ."
alias nv="nvim"
alias cl='clear'
alias c='clear'
# alias cat="ccat"
alias clocale="dpkg-reconfigure locales"
alias al="nvim ~/.config/alacritty/alacritty.yml"
alias ipsql="systemctl start postgresql"
alias iredis="sudo /etc/init.d/redis_6379 start"
alias idocker="systemctl start docker.service"
alias imodem="systemctl start ModemManager.service"
alias xrdbc="xrdb ~/.Xdefaults"
alias xs="startx"
alias rmf="rm -r"
alias irmf="sudo rm -r"
alias icpf="sudo cp -r"
alias lh="ls -a"
alias slss="sudo /opt/lampp/lampp start"
alias sls="sudo /opt/lampp/lampp stop"
alias fm="firefox -ProfileManager"

# Docker and Docker Compose
alias di="docker"
alias dirm="docker rmi"
alias dil="docker login"
alias ds="docker ps"
alias dii="docker images"
alias dc="docker-compose"
alias dce="docker-compose exec"
alias dci="docker-compose up"
alias dcd="docker-compose down"

# Ranger
alias f="ranger"
alias rc='ranger ~/.config'
alias repos='ranger ~/Repos'

# Pacman
alias p='sudo pacman -S'
alias emerge='sudo pacman -S'
alias r='sudo pacman -Rs'
alias y='yay -S'
alias upd='sudo pacman -Syu'
alias am="sudo pacman -Rs -"
alias rcache="sudo pacman -Sc"

# Tmux
alias x="tmux -L Main"
alias xsp="tmux display -p '#{socket_path}'"
alias xm="tmux -Ltest"
alias xls="tmux ls"
alias mxls="tmux -Ltest ls"
alias nx='tmux new -s'
alias mnx="tmux -Ltest new -s"
alias ax='tmux attach -t'
alias max="tmux -Ltest attach -t"
alias xc="nvim ~/.config/tmux/tmux.conf"

# Youtube DL
alias dydl='youtube_dl'
alias ydlformat='youtube_dl -F'
alias ydldf='youtube_dl -f'

# Sudo
# alias p='sudo apt-get install'
# alias sg='sudo apt-get install'
# alias r='sudo apt-get remove'
# alias rg='sudo apt-get remove'
# alias am='sudo apt autoremove'
# alias ag='apt list --upgradable'
# alias upd='sudo apt-get update'
# alias upg='sudo apt-get upgrade'
# alias upgf='sudo apt full-upgrade'
# Allow third-party repos (Parrot os)
# alias insecupd='sudo apt-get update --allow-insecure-repositories'
# alias unauthupd='sudo apt-get update --allow-unauthenticated'
# Add your user to a group
alias uadd='sudo usermod -aG'
# Connect to role
alias crole='sudo -i -u'
# Apt installs
# alias pl='sudo apt list --installed'
# Install from list
alias ipl='sudo xargs -a packages_list.txt apt install'
# Installs count
# alias ipc='sudo dpkg-query -f '${binary:Package}\n' -W | wc -l'
# Save list of all installed packages to txt file
# alias ipcf='sudo dpkg-query -f '${binary:Package}\n' -W > packages_list.txt'

# Others
alias plague='curl https://corona-stats.online/states/us'
alias condapython='/root/anaconda3/bin/python'
alias juiceshop='docker run --rm -p 3000:3000 bkimminich/juice-shop'
alias incwatchers='echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p'

# Refresh fonts directory
alias rfonts='fc-cache -vf ~/.local/share/fonts/'
alias remfonts='fc-cache -f -v'

# Misc
alias lg='lazygit'
alias gpu_watch="watch -n -1 nvidia-smi"
alias gp='git add . && git commit -m "auto push" && git push'
# alias ls='exa --color=always --group-directories-first'
alias kill_vbox="kill $(ps -e | grep VirtualBox | awk '{ print $1 }')"
alias list_systemctl="systemctl list-unit-files --state=enabled"
alias set_python_path="source set_python_path"
alias greeter="dm-tool switch-to-greeter"
alias small_text="sed -i 's/size: 22.0/size: 15.0/g' ~/.config/alacritty/alacritty.yml"
alias big_text="sed -i 's/size: 15.0/size: 22.0/g' ~/.config/alacritty/alacritty.yml"
alias logout="dm-tool switch-to-greeter"
alias i3-logout="i3-msg exit"
alias monitors="xrandr -q | grep " connected" | cut -d ' ' -f1"
alias sk="screenkey -s small --scr 1"
alias skk="killall screenkey"

# Bookmarks
# Ex: wr evaluates to the absolute path to your user's home directory.
export wr=~/Dev/
export cc=~/Dev/Code
export co=~/.config
export nca=~/.cache/nvim
export sw=~/.local/share/nvim/swap
export pr=~/Dev/Code/projects
export ut=~/Dev/Code/m_
export cmp=~/Dev/Code/cp
export ds=~/Dev/Code/learn/ds
export sc=~/Dev/Scripts
export doc=~/Documents
export dots=~/dots
export docs=~/docs
export dw=~/Downloads
export nv=~/.config/nvim
export cg=~/.config/
export sn=~/.config/nvim/snips
export vs=~/VSCode-linux-x64/bin/code
export pa=/run/media/razak/55CD-9C80
export ce=/run/media/razak/55CD-9C80/Portable/Documents/Programming

alias cdwr='cd "$wr"'
alias cdcg='cd "$cg"'
alias cdcc='cd "$cc"'
alias cdco='cd "$co"'
alias cdnca='cd "$nca"'
alias cdsw='cd "$sw"'
alias cdpr='cd "$pr"'
alias cdut='cd "$ut"'
alias cdcp='cd "$cmp"'
alias cdds='cd "$ds"'
alias cdsc='cd "$sc"'
alias cdoc='cd "$doc"'
alias cdocs='cd "$docs"'
alias cdots='cd "$dots"'
alias cddw='cd "$dw"'
alias cdcc='cd "$cc"'
alias cdnv='cd "$nv"'
alias cdnv='cd "$nv"'
alias cdsn='cd "$sn"'
alias cdpa='cd "$pa"'
alias cdce='cd "$ce"'
alias code="$vs"
