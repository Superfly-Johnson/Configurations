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

programs.emacs.enable = true;
services.emacs = {
enable = true;
client.enable = true;
defaultEditor = true;
socketActivation.enable = true;
};

xdg.enable = true;

programs.home-manager.enable = true;
}
