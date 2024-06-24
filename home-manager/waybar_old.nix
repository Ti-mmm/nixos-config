{ config, pkgs, ... }: {

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };

  programs.waybar.settings = { # config
  name = "top_bar";
  layer = "top";
  position = "top";
  height = 36;
  spacing = 4;
  modules-left = [ "hyprland/workspaces" "hyprland/submap" ];
  modules-center = [ "clock#time" "custom/separator" "clock#week" "custom/separator_dot" "clock#month" "custom/separator" "clock#calendar" ];
  modules-right = [ "bluetooth" "network" "group/misc" "custom/logout_menu" ];

	"hyprland/workspaces" = {
		on-click = "activate";
		format = "{icon}";
		format-icons = {
			"active": "";
			"default": "";
			"empty": "";
		};
		persistent_workspaces = { "*" = 4; };
	};

	"hyprland/submap" = {
		format = "<span color='#a6da95'>Mode:</span> {}";
		tooltip = false;
	};

	"clock#time" = {
		format = "{:%I:%M %p %Ez}";
	};

	"custom/separator" = {
		format = "|";
		tooltip = false;
	};

	"custom/separator_dot" = {
		format = "•";
		tooltip = false;
	};

	"clock#week" = { format = "{:%a}"; };
	"clock#month" = { format = "{:%h}"; };
	
	
		






  };

  programs.waybar.style = { # style.css



  };
}
