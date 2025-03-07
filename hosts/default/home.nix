{ config, pkgs, inputs, lib, ... }: {

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Disable version mismatch error message
  # home.enableNixpkgsReleaseCheck = false;
  
  imports = [ # App configurations
    ../../modules/home-manager/hyprland.nix
    ../../modules/home-manager/kitty/kitty.nix
    ../../modules/home-manager/editor/helix.nix
    ../../modules/home-manager/zsh.nix
    ../../modules/home-manager/rofi.nix
    ../../modules/home-manager/theme/default.nix
    ../../modules/home-manager/yazi/default.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/waybar/default.nix
    ../../modules/home-manager/btop.nix
    ../../modules/home-manager/apps.nix
    ../../modules/home-manager/vm.nix
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

  services.udiskie = {
    enable = true;
  };

}

