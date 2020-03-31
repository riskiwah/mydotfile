#!/usr/bin/bash

set -x

utils=(htop curl plank git firefox wget
      apt-transport-https dconf-cli uuid-runtime
      zsh ca-certificates gnupg-agent software-properties-common
      eog kubectl)

create_dir(){
    mkdir .themes .icon
}

install_utils(){
    sudo apt update && sudo apt upgrade -y
    sudo -s -- <<EOF
    sudo apt install ${utils[@]} -y
EOF
}

vscode(){
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt install code
}

zsh(){
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    chsh -s "$(which zsh)"
    cp -v ./zsh/test2 ~/.oh-my-zsh/themes/test2.zsh-theme
    cp -v zsh/.zshrc ~/.zshrc
}

docker(){
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y
    sudo usermod -aG docker "$USER"
}

gcloud(){
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    sudo apt-get update && sudo apt-get install google-cloud-sdk -y
}

media(){
    sudo add-apt-repository ppa:nilarimogard/webupd8
    sudo apt install audacious audacious-plugins
}

main(){
    install_utils
    vscode
    zsh
    docker
    gcloud
    media
}

main
echo "hehe"