{ config, pkgs, ... }:
{
	#programs.hyprlock.enable = true;
	#programs.hyprlock.package = pkgs.hyprlock;
	#services.hypridle.enable = true;
	#services.hypridle.package = pkgs.hypridle;

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
  };

  wayland.windowManager.hyprland.settings = { # this is hyprland.conf

    # Configure monitors
    monitor = [
      #",preferred,auto,auto"
      "DP-1, 2560x1440@165.00Hz, 1920x0, 1"
      "DP-2, 1920x1080@143.61Hz, 0x0, 1"
      "Unknown-1, disable"
    ];

    # Set used programs
    "$terminal" = "kitty";
    "$fileManager" = "dolphin";
    "$menu" = "rofi -show drun -show-icons";

		# Blur for waybar
		blurls = "waybar";

    # Autostart apps and processes at launch
    exec-once = [
      "dunst & waybar & hyprpaper"
      "[workspace 1 silent] $terminal"
      "[workspace 2 silent] firefox"
      "hyprctl dispatch exec '[workspace 2] webcord'"
    ];

    env = [
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
      "WLR_DRM_NO_ATOMIC,1"
      "QT_QPA_PLATFORM,wayland"
      "QT_QPA_PLATFORMTHEME,qt5ct"
      "NVD_BACKEND,direct"
      "LIBVA_DRIVER_NAME,nvidia"
      "XDG_SESSION_TYPE,wayland"
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_DESKTOP,Hyprland"
      "GBM_BACKEND,nvidia-drm"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "ELECTRON_OZONE_PLATFORM_HINT,auto"
      "GTK_USE_PORTAL,1"
    ];

    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 2;
      "col.active_border" = "rgba(24abffee) rgba(8863ffee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";
      resize_on_border = false;
      allow_tearing = true;
      layout = "dwindle";
    };
    decoration = {
      rounding = 10;
      active_opacity = 1;
      inactive_opacity = 1;
      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        vibrancy = "0.1696";
      };
    };
    animations = {
      enabled = true;
      #bezier = "testBezier, 0.08, 1.3, 0.6, 1";
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows,1,7,myBezier"
        "windowsOut,1,7,default,popin 80%"
        "border,1,10,default"
        "borderangle,1,8,default"
        "fade,1,7,default"
        "workspaces,1,6,default"
      ];
    };
    dwindle = { pseudotile = true; preserve_split = true; };
    master.new_is_master = true;
    misc = { force_default_wallpaper = 0; disable_hyprland_logo = true; };

    # https://wiki.hyprland.org/Configuring/Variables/#Input
    input = {
      kb_layout = "us";
      kb_variant = "";
      kb_model = "";
      kb_options = "";
      kb_rules = "";

      follow_mouse = 1;
      sensitivity = "-0.2";
      force_no_accel = true;
      touchpad.natural_scroll = false;
    };
    gestures.workspace_swipe = false;

    # Keybindings
    "$mainMod" = "SUPER";
    bind = [
      "$mainMod,Q,exec,$terminal"
      "$mainMod,C,killactive,"
      "$mainMod,M,exit"
      "$mainMod,E,exec,$fileManager"
      "$mainMod,V,togglefloating,"
      "$mainMod,O,exec,$menu"
      "$mainMod,P,pseudo,"
      "$mainMod,J,togglesplit,"
      "$mainMod,F,fullscreen,"

      "$mainMod,left, movefocus, l"
      "$mainMod,right,movefocus, r"
      "$mainMod,up,   movefocus, u"
      "$mainMod,down, movefocus, d"

      "$mainMod,1,workspace,1"
      "$mainMod,2,workspace,2"
      "$mainMod,3,workspace,3"
      "$mainMod,4,workspace,4"

      "$mainMod SHIFT,1,movetoworkspace,1"
      "$mainMod SHIFT,2,movetoworkspace,2"
      "$mainMod SHIFT,3,movetoworkspace,3"
      "$mainMod SHIFT,4,movetoworkspace,4"
    ];
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    windowrulev2 = [
      "suppressevent maximize, class:.*"
      "immediate,class:^steam_app_\d+$"
    ];
  };
}
# I hate my life
