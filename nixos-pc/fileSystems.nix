{ ... }: { # Note: May need to create /media/... beforehand
  # sda3 - Disk 0
  fileSystems."media/Win0" = {
    device = "/dev/disk/by-uuid/001AF1261AF118FC";
    fsType = "ntfs";
    options = [ "users" "nofail" ];
  };

  # sdb2 - Disk 1
  fileSystems."media/Win1" = {
    device = "/dev/disk/by-uuid/BC9ACD809ACD3822";
    fsType = "ntfs";
    options = [ "users" "nofail" ];
  };

  # nvmeOn1p2 - Disk 2
  fileSystems."media/Win2" = {
    device = "/dev/disk/by-uuid/D6D65F10D65EF06B";
    fsType = "ntfs";
    options = [ "users" "nofail" ];
	};

	# external drive ( for steam games )
	fileSystems."media/ExtIntenso" = {
		device = "/dev/disk/by-uuid/E828E9EB28E9B928";
		fsType = "ntfs";
		options = [ "users" "nofail" ];
	};
}
