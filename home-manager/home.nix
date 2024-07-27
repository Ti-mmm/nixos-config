{ config, pkgs, inputs, lib, ... }: {
  imports = [ # App configurations
    ./hyprland.nix
    #./hyprpaper.nix # not really needed
    ./kitty.nix
    #./waybar.nix
    ./helix.nix
  ];

  home.username = "tim";
  home.homeDirectory = "/home/tim";
  home.stateVersion = "24.05";
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [ bat fzf ripgrep jq tree eza wl-clipboard ];

  home.sessionVariables = { EDITOR = "hx"; };
  home.shellAliases = {
    l = "exa";
    ls = "exa";
    cat = "bat";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [ "git" "python" "docker" "fzf" ];
    theme = "dpoggi";
  };

}
