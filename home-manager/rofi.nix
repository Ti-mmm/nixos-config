{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    plugins = [ pkgs.rofi-emoji ];
    font = "JetBrains Mono Regular 13";
    terminal = "kitty";
    extraConfig = {
      #location = 0;
      modi = "drun,emoji";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "Apps";
      display-emoji = "Emoji";
      sidebar-mode = true;
      border-radius = 10;
    };
    theme = "~/nixos-config/.config/rofi/themes/catppuccin-macchiato.rasi";
  };
}
