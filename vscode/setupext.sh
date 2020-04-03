#!/usr/bin/bash

set -x

code --install-extension HookyQR.beautify
code --install-extension ipedrazas.kubernetes-snippets
code --install-extension ivory-lab.jenkinsfile-support
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.python
code --install-extension ms-vscode.Go

# symlinks

ln -sfv $HOME/code/mydotfile/vscode/settings.json $HOME/.config/Code/User/settings.json