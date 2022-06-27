!/bin/sh
pacman -S emacs syncthing git openssh
pacman -S nix
systemctl enable nix-daemon.service
echo "allowed-users = superfly" >> /etc/nix/nix.conf
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update 
nix-env --upgrade
