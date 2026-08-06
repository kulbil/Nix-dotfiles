{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disks.nix

    ../../modules/nas.nix
    ../../modules
  ];

  networking.hostName = "desktop";
  my.nas.ip = "10.0.0.24";
}
