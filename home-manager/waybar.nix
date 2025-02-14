{ config, pkgs, ... }: {

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };
  home.file.".config/waybar/config".source = ./waybar/config;
  home.file.".config/waybar/style.css".source = ./waybar/style.css;
  home.file.".config/waybar/macchiato.css".source = ./waybar/macchiato.css;
  home.file.".config/waybar/mocha.css".source = ./waybar/mocha.css;

}
