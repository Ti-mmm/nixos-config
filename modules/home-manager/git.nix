{ pkgs, lib, ... }:
{
  programs.git = {
    enable = true;
    userName = "Ti-mmm";
    userEmail = "weissflog.tim@icloud.com";
    extraConfig = {
      color.ui = true;
      core.editor = "hx";
      credential.helper = "store";
      github.user = "Ti-mmm";
      push.autoSetupRemote = true;
    };
  };
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
  };
}
