#!/bin/bash

if command -v nix &>/dev/null; then
  echo "nix is already installed. Skipping installation."
else
  curl -L https://nixos.org/nix/install | sh
fi

NIX_CONF=$HOME/.config/nix/nix.conf
if [[ -f $HOME/.config/nix/nix.conf ]]; then
  echo "nix configuration already exists at $NIX_CONF. Skipping configuration."
else
  echo "Configuring Nix for single-user mode..."
  # Ensure .config/nix directory exists
  mkdir -p $(dirname $NIX_CONF)
  # Add configuration to nix.conf
  cat <<EOT > $NIX_CONF
experimental-features = nix-command flakes
EOT
fi

if nix-channel --list | grep -q home-manager; then
  echo "Channel for home-manager already exists; skipping channel update."
else
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
fi

if command -v home-manager &>/dev/null; then
  echo "home-manager already exists; skipping installation."
else
  nix-shell '<home-manager>' -A install
fi

if [[ -d $HOME/.config/home-manager ]]; then
  echo "home-manager config already exists; skipping configuration."
else
  ln -s $(realpath $(dirname $0)/home-manager) $HOME/.config/home-manager
fi

