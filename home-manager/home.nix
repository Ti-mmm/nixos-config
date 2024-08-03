{ config, pkgs, inputs, lib, ... }:
let
  # Sleepy Launcher
  aagl-gtk-on-nix = import (builtins.fetchTarball
    "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz");
  gruvboxplus = import ./gruvbox-plus.nix { inherit pkgs; };
in {
  imports = [ # App configurations
    ./hyprland.nix
    #./hyprpaper.nix
    ./kitty.nix
    ./helix.nix
    ./zsh.nix
  ];

  home.username = "tim";
  home.homeDirectory = "/home/tim";
  home.stateVersion = "24.05";
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  gtk.enable = true;
  gtk.theme.package = pkgs.adw-gtk3;
  gtk.theme.name = "adw-gtk3";
  gtk.iconTheme.package = "gruvboxPlus";
  gtk.iconTheme.name = "GruvboxPlus";

  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.name = "adwaita-dark";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    bat
    fzf
    ripgrep
    jq
    tree
    eza
    wl-clipboard
    aagl-gtk-on-nix.sleepy-launcher
  ];

  home.sessionVariables = { EDITOR = "hx"; };
  home.shellAliases = {
    l = "exa";
    ls = "exa";
    cat = "bat";
  };
}
