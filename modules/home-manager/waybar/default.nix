{ config, pkgs, ... }:
let
  manageWaybarConfig = true;
in {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };
  home.file = if manageWaybarConfig then {
    ".config/waybar/config".source = ./config;
    ".config/waybar/style.css".source = ./style.css;
    ".config/waybar/macchiato.css".source = ./macchiato.css;
    ".config/waybar/mocha.css".source = ./mocha.css;
  } else {};
}
