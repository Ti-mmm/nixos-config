{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Ti-mmm";
    userEmail = "weissflog.tim@icloud.com";
    extraConfig = {
      push = { autoSetupRemote = true; };
      credential.helper = "${
        pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
    };
  };
}
