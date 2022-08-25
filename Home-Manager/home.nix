{options, config, lib, pkgs, ... }:

with lib;

let home = "${config.home.homeDirectory}";

in

{
  home.username = "superfly";
  home.homeDirectory = "/home/superfly";

home.stateVersion = "22.05";

programs.git = {
    enable = true;
    userName = "Superfly Johnson";
    userEmail = "superfly.johnson@outlook.com";
};

services.syncthing.enable = true;

services.emacs = {
enable = true;
client.enable = true;
defaultEditor = true;
socketActivation.enable = true;
};

programs.home-manager.enable = true;
}
