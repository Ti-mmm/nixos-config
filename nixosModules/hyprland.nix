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

  # Install related Software
  environment.systemPackages = with pkgs; [
    qt5ct
    hyprpaper # Wallpapers
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

    # might fix some issues
    wayland-protocols
    wayland-utils
    meson

    # Desktop portals
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xwayland
  ];

  security.polkit.enable = true;

  # Enable Sceensharing
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals =
      [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
  };

  #services.displayManager.sddm = {
  #enable = true;
  #wayland.enable = true;
  # services.xserver.displayManager.sddm.theme = "where??";
  #};
}
