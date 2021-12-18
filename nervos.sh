#!/bin/bash

user='sabi'

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

function install_nervos_base {
  apt update
  apt install -y vim python3 python3-pip wget sudo htop apache2-utils
  install_docker
  mkdir -p /opt/sabi/lain/
  wget -O /opt/sabi/lain/lain.py https://raw.githubusercontent.com/sabi/lain/main/lain.py
  python3 /opt/sabi/lain/lain.py
  chmod 755 /opt/sabi/lain/lain.py
  }

function install_docker {
  apt install -y ca-certificates curl gnupg lsb-release
  curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  apt update
  apt -y install docker-ce docker-ce-cli containerd.io
}

function install_workspace_tools {
  apt install -y i3-wm
  pip3 install pywal
  }

function set_system_configs {
  cp config/ssh/sshd_config /etc/ssh/sshd_config
  }

function set_user_configs {
  su $user
  mkdir -p ~/.config
  cp config/bash/bashrc ~/.bashrc
  cp config/bash/bashrc ~/.bashrc
  cp config/i3/config ~/.config/i3/config
  cp config/i3/i3status.conf ~/.i3status.conf
  exit
  }

function system_install_server {
  install_nervos_base
  set_system_configs
  }

function system_install_workspace {
  install_nervos_base
  install_workspace_tools
  set_system_configs
  set_user_configs
  }
  
