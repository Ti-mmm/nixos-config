{ config, lib, pkgs, ... }: {

  # Enable OpenGL
  hardware.graphics.enable = true;

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.deviceSection = ''Option "Coolbits" "28"'';

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta; # stable|beta|vulkan_beta
    # vulkan_beta
    prime = {
      sync.enable = false;
      offload.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";

    };
  };
}
