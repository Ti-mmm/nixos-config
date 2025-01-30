{ config, pkgs, ... }: {

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    style = "~/nixos-config/.config/waybar/style.css";
  };
  home.file.".config/waybar/config".source =
    ~/nixos-config/.config/waybar/config;
  #home.file.".config/waybar/config".text = '''';
  #home.file.".config/waybar/style.css".text = '''';
  #home.file.".config/waybar/macchiato.css".text = '''';

}
