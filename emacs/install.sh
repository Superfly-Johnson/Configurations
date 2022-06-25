#!/bin/sh
echo "Copying config.org to '${HOME}/.emacs.d/config.org'..."
if [[ -d "$HOME/.emacs.d" ]]
then
  echo "$HOME/.emacs.d doesn't exist. Creating it..."
  mkdir "$HOME/.emacs.d"
fi
cp ./init.el ${HOME}/.emacs.d/init.el
cp ./config.org ${HOME}/.emacs.d/config.org
