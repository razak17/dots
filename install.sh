#!/usr/bin/env bash

mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvim/vscode
mkdir -p ~/.config/nvim/snippets
mkdir -p ~/.config/nvim/lua
mkdir -p ~/.config/nvim/lua/aesth
mkdir -p ~/.config/nvim/lua/lsp
mkdir -p ~/.config/nvim/lua/packer
mkdir -p ~/.config/nvim/lua/plugin
mkdir -p ~/.config/nvim/lua/utils

# alacritty
for f in `find ./.config/alacritty -regex ".*\.yml$"`; do
  echo f: $f
  rm -rf ~$f
  ln -s ~/dots/$f ~/$f
done

ranger
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

# nvim
for f in `find ./.config/nvim -regex ".*\.vim$\|.*\.lua$\|.*\.json$"`; do
  echo f: $f
  rm -rf ~/$f
  ln -s ~/dots/$f ~/$f
done

# tmux
for f in `find ./.config/tmux -regex ".*\.conf$"`; do
  echo f: $f
  rm -rf ~/$f
  ln -s ~/dots/$f ~/$f
done
