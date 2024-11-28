#!/bin/bash

if command -v nix &>/dev/null; then
  echo "Nix is already installed. Skipping installation."
else
  curl -L https://nixos.org/nix/install | sh
fi

NIX_CONF=$HOME/.config/nix/nix.conf
if [[ -f $HOME/.config/nix/nix.conf ]]; then
  echo "Nix configuration detected at $NIX_CONF"
else
  echo "Configuring Nix for single-user mode..."
  # Ensure .config/nix directory exists
  mkdir -p $(dirname $NIX_CONF)
  # Add configuration to nix.conf
  cat <<EOT > $NIX_CONF
experimental-features = nix-command flakes
EOT
fi

if ! nix-channel --list | grep -q home-manager; then
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
else
  echo "Channel for home-manager detected."
fi

if command -v home-manager &>/dev/null; then
  echo "Home manager detected."
else
  nix-shell '<home-manager>' -A install
fi

if [[ -d $HOME/.config/home-manager ]]; then
  echo "Home manager config already exists."
else
  ln -s $(realpath $(dirname $0)/home-manager) $HOME/.config/home-manager
fi

