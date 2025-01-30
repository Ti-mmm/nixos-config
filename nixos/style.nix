{ pkgs, ... }:
{
  # Themes / Cursors
  environment.systemPackages = with pkgs; [
    papirus-icon-theme # rofi icons
    adwaita-icon-theme # vm.nix
    bibata-cursors # Hyprcursor cursor theme
    libsForQt5.breeze-icons
    libsForQt5.breeze-qt5
    libsForQt5.breeze-gtk
    kdePackages.breeze
    catppuccin-kvantum
  ];

  # Fonts
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    #(nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    font-awesome
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji

    fira-code
    fira-code-symbols

    unifont
  ];
}
