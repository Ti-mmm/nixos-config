{ config, pkgs, inputs, lib, ... }:
{
  imports = [ # App configurations
    ./hyprland.nix
    #./hyprpaper.nix # not really needed
    ./kitty.nix
    #./waybar.nix
  ];

  home.username = "tim";
  home.homeDirectory = "/home/tim";
  home.stateVersion = "24.05";
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
        bat
        fzf
        ripgrep
        jq
        tree
        eza
	wl-clipboard
	];
  
  programs.neovim = {
  	enable = true;
  	viAlias = true;
	vimAlias = true;
  	};

	home.sessionVariables = {
		EDITOR="nvim";
	};
	home.shellAliases = {
		l = "exa";
		ls = "exa";
		cat = "bat";
		n = "nano -i -T 2";
		dot = "cd ~/Ti-mmm/dotfiles/";
		# Git Aliases
		ga = "git add";
		gc = "git commit";
		gp = "git push";
	};

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
	};

	programs.zsh.oh-my-zsh= {
		enable = true;
		plugins = ["git" "python" "docker" "fzf"];
		theme = "dpoggi";
	};

}
