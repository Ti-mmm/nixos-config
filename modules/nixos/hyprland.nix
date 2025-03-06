{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
  };

  services.displayManager.ly.enable = true;
  # services.displayManager.autoLogin.enable = true;
  # services.displayManager.autoLogin.user = "tim";

  environment.systemPackages = with pkgs; [
    swww
    # hyprcursor
    waybar
    # waybar-mpris
    flameshot
    libnotify
    hyprpolkitagent
    # wl-clipboard
  ];

  # Enables Sceensharing
  services.dbus.enable = true;
}
