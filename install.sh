#!/usr/bin/env bash
SPATH=$(dirname $(realpath $BASH_SOURCE[0]))
[[ -L ~/.config/nvim ]] || ln -s ${SPATH}/.config/nvim ~/.config/nvim
[[ -f ${SPATH}/nvim ]] || wget -O - https://github.com/neovim/neovim/releases/download/v0.10.2/nvim.appimage > ${SPATH}/nvim
chmod u+x ${SPATH}/nvim
alias nvim=${SPATH}/nvim
