{ pkgs, inputs, config, ... }:

{
  # Configured in home-manager/hyprland.nix
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    #package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  # Hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # fix cursor flickering:
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  # Install required Software
  environment.systemPackages = with pkgs; [
    qt5ct
    hyprpaper
    hypridle
    hyprlock
    hyprcursor
    xwaylandvideobridge
    waybar
    kitty
    dunst
    libnotify
    rofi-wayland
    nvidia-vaapi-driver
  ];
  security.polkit.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals =
    [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];

  #services.displayManager.sddm = {
  #enable = true;
  #wayland.enable = true;
  # services.xserver.displayManager.sddm.theme = "where??";
  #};
}
