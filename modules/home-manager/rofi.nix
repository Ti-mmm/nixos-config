{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = [ pkgs.rofi-emoji-wayland ];
    font = "JetBrainsMono Nerd Font 14";
    terminal = "kitty";
    location = "center";
    extraConfig = {
      #location = "top";
      modi = "drun,emoji";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = " Apps ";
      display-emoji = "Emoji";
      # sidebar-mode = true;
      # yoffset = 40;
      border-radius = 10;
    };
    theme = "~/.config/rofi/themes/mocha.rasi";
  };
  home.file.".config/rofi/themes/mocha.rasi".source = ./theme/rofi.rasi;
}
