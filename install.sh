#!/usr/bin/env bash

dirs=(
  '.config/alacritty'
  '.config/nvim'
  '.config/ranger'
  '.config/redshift'
  '.config/tmux'
  '.config/zsh'
  '.config/nvim/plugin'
  '.config/nvim/after/plugin'
  '.config/nvim/vscode'
  '.config/nvim/snippets'
  '.config/nvim/lua'
  '.config/nvim/lua/aesth'
  '.config/nvim/lua/lsp'
  '.config/nvim/lua/packer'
  '.config/nvim/lua/plugin'
  '.config/nvim/lua/utils'
)

link() {
  if [[ "$#" -gt 0 ]]; then
    ln -s ~/dots/.config/nvim/$1 ~/.config/nvim/$1
  else
    ln -s ~/dots/.config/nvim/ ~/.config/
  fi
}

create_dirs() {
  for d in ${dirs[@]}; do
    echo creating dir: $d
    mkdir -p ~/$d
  done
}

link_folders() {
  for i in ${dirs[@]}; do
    echo linking: ~/dots/$i to ~/$i
    ln -s ~/dots/$i ~/$i
  done
}

run () {
  # nvim
  link

  # alacritty
  for f in `find ./.config/alacritty -regex ".*\.yml$"`; do
    echo f: $f
    rm -rf ~$f
    ln -s ~/dots/$f ~/$f
  done

  # ranger
  for f in `find ./.config/ranger -regex ".*\rc.conf$"`; do
    echo f: $f
    rm -rf ~$f
    ln -s ~/dots/$f ~/$f
  done

  # redshift
  for f in `find ./.config/redshift -regex ".*\.conf$"`; do
    echo f: $f
    rm -rf ~$f
    ln -s ~/dots/$f ~/$f
  done

  # zshrc
  for f in `find . -regex ".*\.zshrc$\|.*\.zsh_history$"`; do
    echo f: $f
    rm -rf ~/$f
    ln -s ~/dots/$f ~/$f
  done

  # zsh
  for f in `find ./.config/zsh -regex ".*\.zsh$"`; do
    echo f: $f
    rm -rf ~$f
    ln -s ~/dots/$f ~/$f
  done

  # tmux
  for f in `find ./.config/tmux -regex ".*\.conf$"`; do
    echo f: $f
    rm -rf ~/$f
    ln -s ~/dots/$f ~/$f
  done
}

while [[ "$#" -gt 0 ]]; do
  curr=$1
  shift
  case "$curr" in
  "-r")
    run
    ;;
  "-f")
    link $1
    ;;
  *) echo "Unavailable command... $curr"
  esac
done
