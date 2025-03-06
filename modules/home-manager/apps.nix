{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    (discord.override {
      #withOpenASAR = true;
      withVencord  = true;
    })
    vesktop
    arrpc # rich presence
  ];
}
