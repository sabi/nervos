#!/bin/bash

echo "Enter username: "
read user

version='0.1'

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

function install_nervos_base {
  apt update
  apt install -y vim python3 python3-pip wget sudo htop apache2-utils dialog lsof file
  install_docker
  install_lain
  }

function install_lain {
  pip3 install requests
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
  apt -y install docker-ce docker-ce-cli containerd.io docker-compose
}

function install_workspace_tools {
  apt install -y i3-wm imagemagick i3lock
  pip3 install pywal
  }

function set_system_configs {
  cp config/ssh/sshd_config /etc/ssh/sshd_config
  chmod 644 /etc/ssh/sshd_config
  systemctl restart ssh
  }

function set_user_configs {
  su $user
  mkdir -p ~/.config
  cp config/bash/bashrc ~/.bashrc
  cp config/bash/bash_aliases ~/.bash_aliases
  cp config/i3/config ~/.config/i3/config
  cp config/i3/i3status.conf ~/.i3status.conf
  cp config/.Xresources && xrdb -merge ~/.Xresources
  source ~/.bashrc
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

# Non-free
function install_discord {
  wget http://ftp.mx.debian.org/debian/pool/main/libi/libindicator/libindicator3-7_0.5.0-3+b1_amd64.deb
  sudo apt install ./libindicator3-7_*_amd64.deb
  wget http://ftp.mx.debian.org/debian/pool/main/liba/libappindicator/libappindicator3-1_0.4.92-7_amd64.deb
  sudo apt install ./libappindicator3-1_*_amd64.deb
  wget https://dl.discordapp.net/apps/linux/0.0.16/discord-0.0.16.deb
  dpkg-deb -x discord-0.0.16.deb unpack
  dpkg-deb --control discord-0.0.16.deb
  mv DEBIAN/ unpack/
  sed -i 's/libappindicator3-1/libayatana-appindicator3-1/g' unpack/DEBIAN/control
  dpkg -b unpack discord-fixed.deb
  sudo apt install ./discord-fixed.deb -y
}

function install_spotify {
  curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
  echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
  curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
  sudo apt update && sudo apt install spotify-client -y
}

function configure_firefox {
  echo TODO: Configure Autoscroll
}

COMMAND=$(echo "$1"|tr "{A-Z}" "{a-z}")

case "$COMMAND" in
  'base')
    install_nervos_base;;
  'workstation')
    system_install_workspace;;
  'server')
    system_install_server;;
esac
