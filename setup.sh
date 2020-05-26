#!/bin/sh

OS=$(uname)

if [ "$OS" = "Darwin" ]
then
  echo "Detected MacOS"
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  echo "Installing programs"
  brew install yadm fish starship tmux neovim node

elif [ "$OS" = "Linux" ]
then
  . /etc/os-release
  if [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]
  then
    echo "Detected Ubuntu/Debian"
    sudo apt-get update
    sudo apt-get install -y yadm fish tmux neovim nodejs

  elif [ "$ID" = "fedora" ]
  then
    echo "Detected Fedora"
    sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:TheLocehiliosan:yadm/Fedora_Rawhide/home:TheLocehiliosan:yadm.repo
    sudo dnf install -y yadm fish tmux neovim nodejs

  elif [ "$ID" = "rhel" ] || [ "$ID" = "centos" ]
  then
    echo "Detected CentOS/RHEL"
    sudo wget https://download.opensuse.org/repositories/home:TheLocehiliosan:yadm/RHEL_7/home:TheLocehiliosan:yadm.repo /etc/yum.repos.d/
    sudo yum install -y yadm fish tmux neovim nodejs

  elif [ "$ID" = "arch" ]
  then
    echo "Detected Arch"
    yay -Syu yadm-git fish tmux neovim node

  elif [ "$ID" = "sles" ] || [ "$ID" = "opensuse" ]
  then
    echo "Detected SUSE"
    sudo zypper addrepo https://download.opensuse.org/repositories/home:TheLocehiliosan:yadm/SLE_15_SP1/home:TheLocehiliosan:yadm.repo
    sudo zypper refresh
    sudo zypper install yadm

  elif [ "$ID" = "gentoo" ]
  then
    echo "Detected Gentoo"
    emerge -atc app-admin/yadm app-shells/fish app-misc/tmux app-editors/neovim net-libs/nodejs

  else
    echo "Unknown Linux"
    echo "Installing Linuxbrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    echo "Adding brew to PATH"
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

    echo "Installing programs"
    brew install yadm fish starship tmux neovim node
  fi
  
  echo "Installing Starship"
  curl -fsSL https://starship.rs/install.sh | bash
fi

yadm clone https://dotfiles.kwatra.me
