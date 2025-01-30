{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.desktopManager.plasma5.enable = true;
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    konsole
    oxygen
    plasma-browser-integration
  ];

  # Enable automatic login for the user. /! Not supported on ly
  #services.displayManager.autoLogin.enable = true;
  #services.displayManager.autoLogin.user = "tim";
}
