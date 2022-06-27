!/bin/sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home
nix-channel --update
echo "export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}" >> $HOME/.bashrc
nix-shell '<home-manager>' -A install
