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
    theme = "dpoggi";
    # other themes: agnoster dpoggi
  };
}
