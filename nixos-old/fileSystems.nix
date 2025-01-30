{ ... }: { # Note: May need to create /media/... beforehand
  # sda2 - Disk 1
  fileSystems."/media/shared" = {
    device = "/dev/disk/by-uuid/D9DA-2D68";
    fsType = "exfat";
    options = [ "defaults" "nofail" ];
  };

  # sdb3 - Disk 0
  fileSystems."/media/win11" = {
    device = "/dev/disk/by-uuid/0A5AEAB95AEAA0A5";
    fsType = "ntfs";
    options = [ "defaults" "nofail" ];
  };
}
