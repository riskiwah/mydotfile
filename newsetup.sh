#!/usr/bin/bash

set -x

if [ "$(id -u)" != "0" ]; then
    echo "please use sudo!"
    exit 1
fi

pack=(htop curl plank git firefox wget openvpn
      apt-transport-https dconf-cli uuid-runtime
      zsh ca-certificates gnupg-agent software-properties-common
      ristretto jq)

create_dir(){
    mkdir .themes .icon
}

install_utils(){
    sudo apt update && sudo apt upgrade -y
    sudo -s -- <<EOF
    sudo apt install ${pack[@]} -y
EOF
}

vscode(){
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt install code -y
}

zsh(){
    chsh -s "$(which zsh)"
    yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ln -sfv $HOME/code/mydotfile/zsh/test2.zsh-theme "$ZSH"/themes/test2.zsh-theme
    ln -sfv $HOME/code/mydotfile/zsh/.zshrc ~/.zshrc
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

golang(){
    enter | sudo add-apt-repository ppa:longsleep/golang-backports
    sudo apt install golang-go
}

gcloud(){
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    sudo apt-get update && sudo apt-get install google-cloud-sdk -y
    sudo apt install kubectl
}

spotify(){
    curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update && sudo apt-get install spotify-client
}

chrome(){
    wget -P "$HOME"/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i "$HOME"/Downloads/google-chrome-stable_current_amd64.deb
}

media(){
    sudo add-apt-repository ppa:nilarimogard/webupd8
    sudo apt install audacious audacious-plugins -y
}

main(){
    create_dir
    install_utils
    vscode
    zsh
    docker
    golang
    gcloud
    media
}

main
echo "Done, dont forget to check!"