{ pkgs, lib, ... }: {

  programs = {
  
    steam = {
      enable = true;
      protontricks = {
        enable = true;
        package = pkgs.protontricks;
      };
      # extraCompatPackages = [ pkgs.unstable.proton-ge-bin ];
    };

    gamescope = {
      enable = true;
      capSysNice = true;
    };

    gamemode = {
      enable = true;
      settings = {
        general = {
          softrealtime = "on";
        };
        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          nv_powermizer_mode = 1;
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [ mangohud wine bottles steamcmd ];
}
