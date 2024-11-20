#!/usr/bin/env bash
cd $(dirname $0)
echo "Stowing config files"
set -x
stow -t $HOME -S nvim
