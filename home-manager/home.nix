{ config, pkgs, inputs, lib, ... }: {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

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

  home.packages = with pkgs; [ bat fzf ripgrep jq tree eza wl-clipboard ];

  home.sessionVariables = { EDITOR = "hx"; };
  home.shellAliases = { yz = "yazi"; };
}
