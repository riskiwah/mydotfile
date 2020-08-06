#!/usr/bin/bash

# Init ricing directory
mkdir "$HOME"/.themes "$HOME"/.icons

# Tmux symlinks
ln -sfv "$HOME"/code/mydotfile/.tmux.conf ~/.tmux.conf

SCRIPTS_PATH="./scripts"

bash "$SCRIPTS_PATH"/package.sh
bash "$SCRIPTS_PATH"/ppa.sh

