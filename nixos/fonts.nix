{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    font-awesome
    nerd-font-patcher
    qt5ct
  ];
}
