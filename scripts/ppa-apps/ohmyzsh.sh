#!/usr/bin/bash

chsh -s "$(which zsh)"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -sfv "$HOME"/code/mydotfile/zsh/test2.zsh-theme "$ZSH"/themes/test2.zsh-theme
ln -sfv "$HOME"/code/mydotfile/zsh/.zshrc ~/.zshrc