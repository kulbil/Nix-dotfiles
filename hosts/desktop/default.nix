{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disks.nix

    ../../modules
  ];

  system.stateVersion = "26.05";
  networking.hostName = "desktop";
  my.nas.ip = "10.0.0.24";
}
