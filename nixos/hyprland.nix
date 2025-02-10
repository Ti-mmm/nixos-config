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
    kitty
    dunst
    flameshot
    libnotify
    rofi-wayland
    rofi-emoji-wayland
    hyprpolkitagent
    hyprshot
    wl-clipboard
    wtype
  ];

  #environment.variables = {
  #  XCURSOR_THEME = "Bibata-Modern-Ice";
  #  XCURSOR_SIZE = "24";
  #};

  # Enable Sceensharing
  services.dbus.enable = true;
}
