{ config, pkgs, inputs, lib, ... }: {
  gtk = {
    enable = true;
          theme = {
        #name = "Dracula";
        #name = "Catppuccin-Mocha-Compact-Blue-Dark";
        name = "Orchis-Dark-Compact";
        #package = pkgs.dracula-theme;
        # package = pkgs.catppuccin-gtk.override {
        #   accents = ["blue"];
        #   size = "compact";
        #   variant = "mocha";
        # };
        package = pkgs.orchis-theme;
    };
    #theme.name = "adw-gtk3";
    #theme.package = pkgs.adw-gtk3;
    
    #iconTheme.name = "Flat-Remix-Cyan-Dark";
    #iconTheme.package = pkgs.flat-remix-icon-theme;

    cursorTheme = {
      size = 24;
      name = "Bibata-Modern-Ice";
    };
    cursorTheme.package = pkgs.bibata-cursors;
  };
  
  qt = {
    enable = true;
    
    platformTheme.name = "gtk2";
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };
}
