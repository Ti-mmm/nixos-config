{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [ "git" ]; # "python" "docker" "fzf"
    # theme = "gnzh";
    # other themes: agnoster dpoggi
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = pkgs.lib.importTOML ./theme/pastel-powerline.toml;
  };
}
