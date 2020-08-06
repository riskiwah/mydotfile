#!/usr/bin/bash

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install code -y

# Some extension
code --install-extension HookyQR.beautify
code --install-extension ipedrazas.kubernetes-snippets
code --install-extension ivory-lab.jenkinsfile-support
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.python
code --install-extension ms-vscode.Go

# Symlinks
ln -sfv "$HOME"/code/mydotfile/vscode/settings.json "$HOME"/.config/Code/User/settings.json