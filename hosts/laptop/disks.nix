{ ... }:

{
  fileSystems."/home/martin/drives/B_SSD_250GB" = {
    device = "/dev/disk/by-label/B_SSD_250GB";
    fsType = "ext4";
  };

  fileSystems."/home/martin/drives/C_SSD_250GB-SATA" = {
    device = "/dev/disk/by-label/C_SSD_250GB-SATA";
    fsType = "ext4";
  };

  fileSystems."/home/martin/drives/D_HDD_2TB" = {
    device = "/dev/disk/by-label/D_HDD_2TB";
    fsType = "ext4";
  };

    fileSystems."/home/martin/drives/E_HDD_1TB" = {
    device = "/dev/disk/by-label/E_HDD_1TB";
    fsType = "ext4";
  };
}
