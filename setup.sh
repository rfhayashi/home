#!/usr/bin/env bash

set -e pipefail

# create dev directory
mkdir -p ~/dev

# install curl
sudo apt install -y curl

# install nix
if ! which nix; then
  sh <(curl -L https://nixos.org/nix/install) --daemon
  echo "Restart the terminal and run this script again"
  exit 0
fi

# install home-manager
if ! which home-manager; then
  mkdir -p ~/.config/home-manager
  ln -s $(pwd)/home.nix ~/.config/home-manager/home.nix
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install
fi

