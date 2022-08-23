#!/bin/sh
source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
export XDG_DATA_DIRS="${XDG_DATA_DIRS};$HOME/.nix-profile/share/applications/"
