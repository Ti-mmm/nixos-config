{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    jetbains-mono
    nerd-font-patcher
  ]
}
