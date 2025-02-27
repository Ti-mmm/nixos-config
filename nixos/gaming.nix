{ pkgs, lib, ... }:

{
  # programs.steam.gamescopeSession.enable = true;
  # programs.gamemode.enable = true;
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

  # services.minecraft-server = {
  #   enable = true;
  #   package = pkgs.papermcServers.papermc-1_21;
  #   eula = true;
  #   openFirewall = true; # Opens the port the server is running on (by default 25565 but in this case 43000)
  #   declarative = true;
  #   whitelist = {
  #     # This is a mapping from Minecraft usernames to UUIDs. You can use https://mcuuid.net/ to get a Minecraft UUID for a username
  #     Tim_mmm   = "8d93318e-dc66-4d62-bb0b-786280f6691d";
  #     Schildlee = "a018f809-7c8d-4017-8a61-97a85add4709";
  #   };
  #   serverProperties = {
  #     server-port = 25565;
  #     difficulty = 3;
  #     gamemode = 1;
  #     max-players = 4;
  #     motd = "NixOS Minecraft server!";
  #     white-list = true;
  #     allow-cheats = true;
  #   };
  #   jvmOpts = "-Xms4092M -Xmx4092M -XX:+UseG1GC -XX:+CMSIncrementalPacing -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10";
  # };
}
