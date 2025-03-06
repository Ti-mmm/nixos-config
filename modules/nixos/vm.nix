{ pkgs, lib, config, ... }: {
  # IMPORTANT: `virsh net-autostart default` enables the default network
  programs = {
    # Enable dconf (System Management Tool)
    dconf.enable = true;
    virt-manager.enable = true;
  };

  users.groups.libvirtd.members = [ "tim" ];
  users.users.tim.extraGroups = [ "libvirtd" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    #qemu
    #qemu_kvm
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
