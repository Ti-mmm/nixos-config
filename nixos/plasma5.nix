{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;

  # Enable automatic login for the user. /! Not supported on ly
  #services.displayManager.autoLogin.enable = true;
  #services.displayManager.autoLogin.user = "tim";
}
