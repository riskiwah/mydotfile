#!/usr/bin/env bash

set -n # only read command but do not execute them
set -o noexec

# sudo warn :)
sudo sh -c "echo Defaults lecture="always" >> /etc/sudoers"

# create dir
mkdir .themes .icons

# install some utills
sudo apt install htop curl \ 
    apt-transport-https plank \
    git firefox dconf-cli wget \
    uuid-runtime

# install vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/

sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# install zsh
sudo apt install zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

chsh -s $(which zsh)

# install docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get install docker-ce docker-ce-cli containerd.io -y

sudo usermod -aG docker $USER

# install gcloud
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

sudo apt install apt-transport-https ca-certificates gnupg

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

sudo apt-get update && sudo apt-get install google-cloud-sdk -y

sudo apt-get install kubectl

# symlink / cp zsh
cp -v ./zsh/test2 ~/.oh-my-zsh/themes/test2.zsh-theme

cp -v zsh/.zshrc ~/.zshrc

# some media install
sudo add-apt-repository ppa:nilarimogard/webupd8

sudo apt install vlc eog \
    audacious audacious-plugins