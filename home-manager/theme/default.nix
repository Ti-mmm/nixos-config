{ config, pkgs, inputs, lib, ... }:
let
  font = {
    name = "JetbrainsMono Nerd Font";
    package = pkgs.nerd-fonts.jetbrains-mono;
  };
  cursorTheme = {
    name = "Bibata-Modern-Ice";
    size = 24;
    package = pkgs.bibata-cursors;
  };
  #iconTheme = {
  #  name = "MoreWaita";
  #  package = pkgs.morewaita-icon-theme.overrideAttrs { src = inputs.morewaita; };
  #};
in {
  catppuccin = {
    enable = true; # Use on any and all
    flavor = "mocha";
    accent = "mauve";

    gtk.enable = true; # deprecated but still work
    rofi.enable = false;
    fcitx5.apply = true;
    hyprland.enable = true;
    waybar.enable = false;
    btop.enable = false;
  };

  home = {
    # Discord and Vesktop
    file.".config/vesktop/themes/mocha-mauve.css".source = ./vesktop.css;
    file.".config/Vencord/themes/mocha-mauve.css".source = ./vesktop.css;
  
    packages = with pkgs; [
      cantarell-fonts
      font-awesome
      font.package
      cursorTheme.package
      adwaita-icon-theme
      papirus-icon-theme
      nerd-fonts.jetbrains-mono
      nerd-fonts.ubuntu-mono
      
    ];

    sessionVariables = {
      XCURSOR_THEME = cursorTheme.name;
      XCURSOR_SIZE  = "${toString cursorTheme.size}";
    };
    pointerCursor =
      cursorTheme
      // { gtk.enable = true; };

  };
  
  fonts.fontconfig.enable = true;

  gtk.enable = true;

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

}
