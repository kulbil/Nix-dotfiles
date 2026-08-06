{ config, lib, ... }:

{
  #Basically saying to nix that there is a type of variable that exists
  options.my.nas.ip = lib.mkOption {
    type = lib.types.str;
    description = "IP address of NAS server";
  };


  config.fileSystems."/mnt/CloudDrive" = {
    device = "${config.my.nas.ip}:/mnt/user/CloudDrive";
    fsType = "nfs";

    options = [
      "_netdev"
      "nofail"
      "x-systemd.automount"
      "soft"
      "timeo=50"
      "retrans=2"
    ];
  };


  config.fileSystems."/mnt/DockerStorage" = {
    device = "${config.my.nas.ip}:/mnt/user/DockerStorage";
    fsType = "nfs";

    options = [
      "_netdev"
      "nofail"
      "x-systemd.automount"
      "soft"
      "timeo=50"
      "retrans=2"
    ];
  };
}
