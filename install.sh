#!/bin/bash

if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="alacritty,i3,nvim,polybar,tmux,zsh,bin,picom,rofi-scripts"
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
fi

STOW_FOLDERS=$STOW_FOLDERS DOTFILES=$DOTFILES

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do 
  echo "stow $folder"
  stow -D $folder
  stow $folder
done

