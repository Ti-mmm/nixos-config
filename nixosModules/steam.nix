{ pkgs, lib, ... }:

{
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [ mangohud lutris ];
  # Note: Some optimizations for nvidia cards can be found in "nvidia.nix"
}
