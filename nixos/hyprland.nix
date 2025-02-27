{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
  };

  services.displayManager.ly.enable = true;

  environment.systemPackages = with pkgs; [
    swww
    hyprcursor
    waybar
    # waybar-mpris
    flameshot
    libnotify
    rofi-emoji-wayland
    hyprpolkitagent
    wl-clipboard
  ];

  # Enables Sceensharing
  services.dbus.enable = true;
}
