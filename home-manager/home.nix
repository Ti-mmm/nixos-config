{ config, pkgs, inputs, lib, ... }: {

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  imports = [ # App configurations
    ./hyprland.nix
    ./kitty/kitty.nix
    ./editor/helix.nix
    ./zsh.nix
    ./rofi.nix
    ./theme.nix
    ./yazi/default.nix
    ./git.nix
    ./waybar.nix # Still need to set waybar.settings
    ./btop.nix
  ];

  home.username = "tim";
  home.homeDirectory = "/home/tim";
  home.stateVersion = "24.05";
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  home.packages = with pkgs; [ bat fzf ripgrep jq tree eza wl-clipboard ];

  home.sessionVariables = { EDITOR = "hx"; };
  home.shellAliases = { yz = "yazi"; };



}

