{ ... }: { # Note: May need to create /media/... beforehand
  # sda2 - Disk 1
  fileSystems."/media/win1" = {
    device = "/dev/disk/by-uuid/BC9ACD809ACD3822";
    fsType = "ntfs";
    #options = [ "users" "nofail" ];
  };

  # sdb3 - Disk 0
  fileSystems."/media/win0" = {
    device = "/dev/disk/by-uuid/001AF1261AF118FC";
    fsType = "ntfs";
    #options = [ "defaults" "users" "nofail" ];
  };

  # sdb5
  #fileSystems."/media/nixold" = {
  #  device = "/dev/disk/by-uuid/70eeb2d9-f7d9-4512-9712-c0430256bf70";
  #  fsType = "ext4";
  #};

  # nvmeOn1p1 - Disk 2
  #fileSystems."/media/nvme" = {
  #  device = "/dev/disk/by-uuid/8e9be0ef-d1d4-40c1-9d66-9a71168dbc32";
  #  fsType = "ext4";
    #options = [ "defaults" "users" "nofail" ];
  #};
}
