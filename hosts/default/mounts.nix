{ ... }: { # Note: May need to create /media/... beforehand
  # sda
  fileSystems."/mnt/win11" = {
    device = "/dev/disk/by-uuid/58F018E1F018C6E2";
    fsType = "ntfs";
    options = [ "defaults" "nofail" ];
  };
  # sdb
  fileSystems."/mnt/shared" = {
    device = "/dev/disk/by-uuid/D9DA-2D68";
    fsType = "exfat";
    options = [ "defaults" "nofail" "uid=1000" "gid=1000" "fmask=0022" "dmask=0022" ];
  };
}
