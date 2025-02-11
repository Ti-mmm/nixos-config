{ pkgs, ... }: {
  programs.btop = {
    enable = true;
    package = pkgs.btop;

    settings = {
      color_theme = "TTY";
      theme_background = false;
    };
  };
}
