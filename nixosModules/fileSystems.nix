{ ... }: { # Note: May need to create /media/... beforehand
  # sda2 - Disk 1
  fileSystems."/media/win1" = {
    device = "/dev/disk/by-uuid/BC9ACD809ACD3822";
    fsType = "ntfs";
    options = [ "defaults" "nofail" ];
  };

  # sdb3 - Disk 0
  fileSystems."/media/win0" = {
    device = "/dev/disk/by-uuid/001AF1261AF118FC";
    fsType = "ntfs";
    options = [ "defaults" "nofail" ];
  };
}
