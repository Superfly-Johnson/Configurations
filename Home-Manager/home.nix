{options, config, lib, pkgs, ... }:

{
    home.username = "superfly";
    home.homeDirectory = "/home/superfly";

    home.stateVersion = "22.05";

    programs.git = {
        enable = true;
        userName = "Superfly Johnson";
        userEmail = "superfly.johnson@outlook.com";
    };

    home.packages = [
        pkgs.libreoffice
        pkgs.musescore
        pkgs.ardour
        pkgs.freecad
        pkgs.keepassxc
        pkgs.konversation
        pkgs.nvi
    ];

    services.syncthing.enable = true;

    services.emacs = {
        enable = true;
        client.enable = true;
        defaultEditor = true;
        socketActivation.enable = true;
    };

    programs.home-manager.enable = true;
}
