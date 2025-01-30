{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    qemu
    qemu_kvm
    virt-manager
    libvirt
    OVMF
    pciutils
  ];

  boot.kernelParams = [ "intel_iommu=on" ];

  virtualisation.libvirtd.enable = true;

}
