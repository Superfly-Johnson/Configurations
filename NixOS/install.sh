#!/bin/sh
for i in ./*.nix; do
echo "Copying ${i} to /etc/nixos..."
cp ${i} /etc/nixos/
echo "Switching Nix' configuration..."
nixos-rebuild switch
done
