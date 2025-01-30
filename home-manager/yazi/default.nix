{ config, pkgs, ... }: {
  programs.yazi = {
    enable = true;

    enableBashIntegration = config.programs.bash.enable;
    enableZshIntegration  = config.programs.zsh.enable;

    settings = {
      manager = {
        sort_by = "alphabetical";
        sort_sensitive = true;
        sort_reverse = false;
        linemode = "none";
        show_hidden = false;
        show_symlink = true;
      };
      preview = {
        tab_size = 2;
        max_width = 600;
        max_height = 900;
        cache_dir = "${config.xdg.cacheHome}";
      };

      flavors = {
        use = ./catppuccin-macchiato.yazi;
        # Starting with 0.4.0
        dark = ./catppuccin-macchiato.yazi;
      };
    };
  };
}
