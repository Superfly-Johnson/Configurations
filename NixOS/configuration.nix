{ config, pkgs, callPackage, ... }:

{

imports =
  [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

# Use the systemd-boot EFI boot loader.
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

networking.hostName = "superfly-t550-nixos"; 
networking.networkmanager.enable = true;

# The global useDHCP flag is deprecated, therefore explicitly set to false here.
# Per-interface useDHCP will be mandatory in the future, so this generated config
# replicates the default behaviour.
networking.useDHCP = false;
networking.interfaces.enp0s25.useDHCP = true;
networking.interfaces.wlp3s0.useDHCP = true;

time.timeZone = "America/Montreal";
i18n.defaultLocale = "fr_CA.UTF-8";

i18n.extraLocaleSettings = 
{
    LC_MESSAGES = "en_US.UTF-8";
};

# Enable X11
  services.xserver.enable = true;
  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

services.pipewire = {
  enable = true;
  alsa.enable = true;
  pulse.enable = true;
  jack.enable = true;
};

services.emacs.enable = true;

# Enable Flatpak
services.flatpak.enable = true;
xdg.portal.enable = true;

security.polkit.enable = true;
security.rtkit.enable = true;

services = {
    syncthing = {
	enable = true;
        user = "superfly";
	dataDir = "/home/superfly/Sync";    # Default folder for new synced folders
	configDir = "/home/superfly/.config/syncthing";   # Folder for Syncthing's settings and keys
    };
};

users.users.superfly = {
    isNormalUser = true;
    extraGroups = [ "wheel" "syncthing" ]; 
};

environment.systemPackages = with pkgs; [
  wget
  git
  rsync
  emacs
  libreoffice
  firefox
  keepassxc
  gnupg
  barrier
  python
];

nixpkgs.overlays = [
  (import (builtins.fetchTarball {
    url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
  }))
];

system.stateVersion = "21.11"; 
}
