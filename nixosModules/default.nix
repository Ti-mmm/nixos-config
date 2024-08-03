{ config, pkgs, ... }: {

  # This file collectively imports all the modules found in nixosModules
  # to make importing them to configuration.nix simpler.
  imports = [
<<<<<<< HEAD
=======
    ./fonts.nix
    ./fileSystems.nix
>>>>>>> parent of 0f87c42 (move files)
    ./nvidia.nix
    ./hyprland.nix
    ./steam.nix
    ./sound.nix
    ./theme.nix
  ];
}
