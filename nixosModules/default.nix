{ config, pkgs, ... }: {

  # This file collectively imports all the modules found in nixosModules
  # to make importing them to configuration.nix simpler.
  # TODO: make the imports actual modules
  imports = [
    ./fonts.nix
    ./fileSystems.nix
    ./nvidia.nix
    ./hyprland.nix
    ./steam.nix
    ./sound.nix
    ./theme.nix
  ];
}
