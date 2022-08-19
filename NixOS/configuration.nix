{ config, pkgs, callPackage, ... }:

{

imports =
  [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

# Allow unfree packages
nixpkgs.config.allowUnfree = true;

services.xserver.videoDrivers = [ "nvidia" ];
hardware.opengl.enable = true;
hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

# Bootloader.
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.loader.efi.efiSysMountPoint = "/boot/efi";

# Setup keyfile
boot.initrd.secrets = {
  "/crypto_keyfile.bin" = null;
};

# Enable swap on luks
boot.initrd.luks.devices."luks-feba7f47-5c04-4c44-85d4-bc84b0e6296e".device = "/dev/disk/by-uuid/feba7f47-5c04-4c44-85d4-bc84b0e6296e";
boot.initrd.luks.devices."luks-feba7f47-5c04-4c44-85d4-bc84b0e6296e".keyFile = "/crypto_keyfile.bin";

networking.hostName = "GameTop"; 
networking.networkmanager.enable = true;

time.timeZone = "America/Montreal";
i18n.defaultLocale = "fr_CA.UTF-8";

i18n.extraLocaleSettings = 
{
LC_MESSAGES = "en_US.UTF-8";
};

services.xserver.enable = true;

services.xserver.displayManager.sddm.enable = true;
services.xserver.displayManager.autoLogin.enable = true;
services.xserver.displayManager.autoLogin.user = "superfly";

services.xserver.desktopManager.plasma5.enable = true;

services.pipewire = {
  enable = true;
  alsa.enable = true;
  pulse.enable = true;
  jack.enable = true;
};

# Enable Flatpak
services.flatpak.enable = true;
xdg.portal.enable = true;

security.polkit.enable = true;
security.rtkit.enable = true;

users.users.superfly = {
    isNormalUser = true;
    extraGroups = [ "wheel" "syncthing" ]; 
};

nix.allowedUsers = [ "superfly" ];

programs.ssh = {
  startAgent = true;
};

system.stateVersion = "22.04"; 
}
