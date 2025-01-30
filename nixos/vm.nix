{ pkgs, lib, config, ... }: {
  # Enable dconf (System Management Toll)
  programs.dconf.enable = true;

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    #qemu
    #qemu_kvm
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    #libvirt
    #OVMF
    pciutils
  ];

  virtualisation = {
    libvirtd = {
      enable = true;
      #qemu.Package = pkgs.qemu_kvm;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
      extraConfig = ''hooks = "/etc/libvirt/hooks";''; # add path for hooks
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;

  boot.kernelParams = [ "intel_iommu=on" ];
  # Load vfio on kernel boot / forces iGPU to be used for Hyprland!
  # boot.kernelModules = [ "vfio" "vfio_pci" "vfio_iommu_type1" ];
  boot.extraModprobeConfig = "options vfio-pci ids=10de:1e07,10de:10f7";

}
