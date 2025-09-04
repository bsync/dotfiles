#!/usr/bin/env bash
SPATH=$(dirname $(realpath $BASH_SOURCE[0]))
[[ -d ~/.config ]] || mkdir -p ~/.config
[[ -L ~/.config/nvim ]] || ln -s ${SPATH}/config/nvim ~/.config/nvim
[[ -f ${SPATH}/nvim ]] || wget -O - https://github.com/neovim/neovim-releases/releases/download/v0.11.3/nvim-linux-x86_64.appimage >${SPATH}/nvim
chmod u+x ${SPATH}/nvim
alias nvim=${SPATH}/nvim
