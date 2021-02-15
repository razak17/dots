#!/usr/bin/env bash

dirs=(
  '.config/alacritty'
  '.config/ranger'
  '.config/redshift'
  '.config/tmux'
  '.config/zsh'
)

link_util() {
  if [[ "$#" -gt 1 ]]; then
    ln -s $1 $2
  else
    echo missing args
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
  # create directories
  create_dirs

  link_util ~/dots/.config/nvim/ ~/.config/
  link_util ~/dots/.config/nvim/init.vim /home/razak/.config/nvim/init.vim

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

demo() {
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
  "-d")
    demo
    ;;
  "-r")
    run
    ;;
  "-f")
    link $1
    ;;
  *) echo "Unavailable command... $curr"
  esac
done
