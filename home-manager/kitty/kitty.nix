{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    shellIntegration.enableZshIntegration = true;
    font.name = "JetBrainsMono";
    font.size = 14;
    settings = {
      "include" = "mocha.conf";

      # Bottom bar
      tab_bar_min_tabs = 1;
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";

    wayland_titlebar_color = "background";
    enable_audio_bell = false;
    confirm_os_window_close = 0;
    background_opacity = "0.30";
    };
  };
 
  # mocha theme
  home.file.".config/kitty/mocha.conf".source = ./mocha.conf;
}
