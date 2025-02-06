{ config, pkgs, inputs, lib, ... }: {
  gtk = {
    enable = true;
    
    theme.name = "Flat-Remix-Black-Dark";
    theme.package = pkgs.flat-remix-gtk;
    
    iconTheme.name = "flat-remix-icon-theme";
    iconTheme.package = pkgs.flat-remix-icon-theme;

    cursorTheme = {
      size = 24;
      name = "Bibata-Modern-Ice";
    };
    cursorTheme.package = pkgs.bibata-cursors;
  };
  
  qt = {
    enable = true;
    
    platformTheme.name = "gtk";
    style.name = "Flat-Remix-Black-Dark";
    style.package = pkgs.flat-remix-gtk;
  };
}
