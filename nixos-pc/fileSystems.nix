{ ... }: { # Note: May need to create /media/... beforehand
  # sda2 - Disk 1
  fileSystems."media/win1" = {
    device = "/dev/disk/by-uuid/BC9ACD809ACD3822";
    fsType = "ntfs";
    #options = [ "users" "nofail" ];
  };

  # sdb3 - Disk 0
  fileSystems."media/win0" = {
    device = "/dev/disk/by-uuid/001AF1261AF118FC";
    fsType = "ntfs";
    #options = [ "defaults" "users" "nofail" ];
  };

  # nvmeOn1p2 - Disk 2
  fileSystems."media/nvme" = {
    device = "/dev/disk/by-uuid/5fd226ec-5708-44c8-b790-e3f633b2084b";
    fsType = "ext4";
    #options = [ "defaults" "users" "nofail" ];
	};
}
