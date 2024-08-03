{ config, pkgs, ... }: {

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };

  programs.waybar.settings = { # config
    "name": "top_bar",
    "layer": "top", // Waybar at top layer
    "position": "top", // Waybar position (top|bottom|left|right)
    "height": 36, // Waybar height (to be removed for auto height)
    "spacing": 4, // Gaps between modules (4px)
    "modules-left": ["hyprland/workspaces", "hyprland/submap"],
    "modules-center": ["clock#time", "custom/separator", "clock#week", "custom/sepa>
    "modules-right": [ "bluetooth", "network", "group/misc", "custom/logout_menu" ],

    // Modules Config
    "hyprland/workspaces": {
        "on-click": "activate",
        "format": "{icon}",
        "format-icons": {
            // "1": "󰲠",
            // "2": "󰲢",
            // "3": "󰲤",
            // "4": "󰲦",
            // "5": "󰲨",
            // "6": "󰲪",
            // "7": "󰲬",
            // "8": "󰲮",
            // "9": "󰲰",
            // "10": "󰿬",

            "active": "",
            "default": "",
            "empty": ""
        },
        "persistent_workspaces": {
            "*": 10,
        },
    },

    "hyprland/submap": {
  };

  programs.waybar.style = '' # style.css
#backlight.high {
  color: @text;
}

#pulseaudio.bluetooth {
  color: @sapphire;
}

#pulseaudio.muted {
  color: @surface2;
}

#pulseaudio {
  color: @text;
}

#pulseaudio.low {
  color: @overlay0;
}

#pulseaudio.lower-medium {
  color: @overlay1;
}

#pulseaudio.medium {
  color: @overlay2;
}

#pulseaudio.upper-medium {
  color: @subtext0;
}

#pulseaudio.high {
  color: @subtext1;
}

#systemd-failed-units {
  color: @red;
}
  '';
}
