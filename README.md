This repo uses nix home-manager to setup my home directories from scratch on new linux distros.

clone the repo into your home directory and run ./dotfiles/install.sh

The install script "should" perform the following operations:
    - install nix 
    - install home-manager
    - sym link .config/home-manager to point at the home-manager directory in the cloned repo
    - use the home-manager to install the nix packages and configurations listed in home.nix
