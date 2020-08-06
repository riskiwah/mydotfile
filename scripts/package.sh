#!/usr/bin/bash

pack=(htop curl plank git firefox wget openvpn
      apt-transport-https dconf-cli uuid-runtime
      zsh ca-certificates gnupg-agent software-properties-common
      jq gnome-tweaks tmux)

install_init(){
    sudo apt update --fix-missing && sudo apt upgrade -y
    sudo -s -- <<EOF
    sudo apt install ${pack[@]} -y
EOF
}

main(){
    install_init
}

main

