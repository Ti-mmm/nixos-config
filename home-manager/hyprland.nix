{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    # this is hyprland.conf

    # Configure monitors
    monitor = [
      "DP-2, 2560x1440@165.00Hz, 0x0, 1" # Main monitor
      #"DP-2, 1920x1080@143.61Hz, 0x0, 1"  # Second monitor
      ",highrr,auto-left,1"
    ];

    # Set used programs
    "$terminal" = "kitty";
    "$fileManager" = "dolphin";
    "$menu" = "rofi -show drun -show-icons";
    "$emoji" = "rofi -show emoji -show-icons";
    # Blur for waybar
    blurls = "waybar";

    # Autostart apps and processes at launch
    exec-once = [
      "waybar"
      "discord"
      "swww-daemon"
      "fcitx5 -d -r"
      "dunst"
      "steam"
      "firefox"
    ];

    env = [
      "XCURSOR_SIZE,24"
      "XCURSOR_THEME,Bibata-Modern-Ice"
      #"HYPRCURSOR_SIZE,24"
      #"HYPRCURSOR_THEME,Bibata-Modern-Ice"
      #  "WLR_DRM_NO_ATOMIC,1"
      #"QT_QPA_PLATFORM,wayland"
      "QT_QPA_PLATFORMTHEME,qt6ct"

      # Use iGPU for Hyprland rendering and Nvidia card for games
      #"AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"

      # Nvidia envs
      #"LIBVA_DRIVER_NAME,nvidia"
      #"XDG_SESSION_TYPE,wayland"
      #"GBM_BACKEND,nvidia-drm"
      #"__GLX_VENDOR_LIBRARY_NAME,nvidia"
      # Nvidia-vaapi-driver
      #"NVD_BACKEND,direct"

      "XDG_CURRENT_DESKTOP,Hyprland"
      #  "XDG_SESSION_DESKTOP,Hyprland"
      #  "GTK_USE_PORTAL,1"

      # Fcitx5 envs
      #"GTK_IM_MODULE='wayland'"
      #"QT_IM_MODULE='wayland;fcitx;ibus'"
      #"XMODIFIERS='@im=fcitx'"
    ];

    general = {
      gaps_in = 3;
      gaps_out = 10;
      border_size = 2;
      #"col.active_border" = "rgba(24abffee) rgba(8863ffee) 45deg";
      "col.active_border" = "rgba(a6e3a1ee) rgba(94e2d5ee) 45deg"; # green -> teal
      "col.inactive_border" = "rgba(595959aa)";
      resize_on_border = false;
      allow_tearing = false;
      layout = "dwindle";
    };
    decoration = {
      rounding = 10;
      active_opacity = 1;
      inactive_opacity = 1;
      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        color = "0xee1a1a1a";
      };
      blur = {
        enabled = true;
        size = 8;
        passes = 2;
        vibrancy = "0.1696";
        noise = 0.01;
        contrast = 0.9;
        brightness = 0.8;
      };
    };
    animations = {
      enabled = true;
      bezier = [
        "myBezier, 0.05, 0.9, 0.1, 1.05"
        #"easeOutCubic, 0.33, 1, 0.68, 1"
      ];
      animation = [
        "windows,1,7,myBezier"
        "windowsOut,1,7,default,popin 80%"
        "border,1,10,default"
        "borderangle,1,8,default"
        "fade,1,7,default"
        "workspaces,1,6,default"
      ];
    };
    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };
    #master.new_is_master = true;
    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
    };

    # https://wiki.hyprland.org/Configuring/Variables/#Input
    input = {
      kb_layout = "us";
      kb_variant = "intl";
      kb_model = "";
      kb_options = ""; # for multiple layouts: grp:win_space_toggle
      kb_rules = "";
      repeat_delay = "250";

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
      "$mainMod SHIFT,O,exec,$emoji"
      "$mainMod,P,pseudo,"
      "$mainMod,J,togglesplit,"
      "$mainMod,F,fullscreen,"
      "$mainMod,S,exec,hyprshot -m region"

      # Move to other windows
      "$mainMod,left, movefocus, l"
      "$mainMod,right,movefocus, r"
      "$mainMod,up,   movefocus, u"
      "$mainMod,down, movefocus, d"

      "$mainMod,1,workspace,1"
      "$mainMod,2,workspace,2"
      "$mainMod,3,workspace,3"
      "$mainMod,4,workspace,4"
      "$mainMod,5,workspace,5"
      "$mainMod,6,workspace,6"

      "$mainMod SHIFT,1,movetoworkspace,1"
      "$mainMod SHIFT,2,movetoworkspace,2"
      "$mainMod SHIFT,3,movetoworkspace,3"
      "$mainMod SHIFT,4,movetoworkspace,4"
      "$mainMod SHIFT,5,movetoworkspace,5"
      "$mainMod SHIFT,6,movetoworkspace,6"
    ];
    binde = [
      # Audion control, can be held, limit is 150%
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 2%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 2%-"
      # Resize windows
      "$mainMod SHIFT,left,  resizeactive, -10 0"
      "$mainMod SHIFT,right, resizeactive,  10 0"
    ];
    # Mouse binds
    bindm = ["$mainMod, mouse:272, movewindow" "$mainMod, mouse:273, resizewindow"];

    windowrule = [
      "pseudo, fcitx"
    ];
  };
}
# I hate my life

