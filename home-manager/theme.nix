{ config, pkgs, inputs, lib, ... }: {
  gtk = {
    enable = true;
    theme.name = "Breeze-Dark";
    #cursorTheme = {
    #  size = 24;
    #  name = "Bibata-Modern-Ice";
    #};
  };
  qt.platformTheme = "gtk2";
}
