#!/bin/sh
for i in *.nix; do
  echo "Copying $i to $HOME/.config/nixpkgs/$i"
  cp ${i} "$HOME/.config/nixpkgs/$i"
  echo "Switching Home-Manager's configuration..."
  home-manager switch
done
