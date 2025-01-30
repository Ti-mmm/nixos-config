{ config, lib, pkgs, ... }:

{
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  # Nvidia driver settings
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    # vulkan_beta
  };

  # Oflload mode: only use nvidia gpu when it is specifically called
  #hardware.nvidia.prime = {
  #  offload.enable = true;
  #  offload.enableOffloadCmd = true;

  #  intelBusId = "PCI:0:2:0";
  #  nvidiaBusId = "PCI:01:0:0";
  #};

}
