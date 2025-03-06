{ pkgs, ... }:
{
  # Themes / Cursors
  environment.systemPackages = with pkgs; [
    papirus-icon-theme # rofi icons
    adwaita-icon-theme # vm.nix
    qogir-icon-theme
    # bibata-cursors # Hyprcursor cursor theme
    kdePackages.breeze-icons
    # libsForQt5.breeze-qt5
    # libsForQt5.breeze-gtk
    # libsForQt5.lightly
    kdePackages.breeze
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
