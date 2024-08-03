{ config, pkgs, ... }: {

  # This file collectively imports all the modules found in nixosModules
  # to make importing them to configuration.nix simpler.
  imports = [
    ./nvidia.nix
    ./hyprland.nix
    ./steam.nix
    ./sound.nix
    ./theme.nix
  ];
}
