{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/nas.nix
    ../../modules/wireguard.nix
    ../../modules
  ];

  networking.hostName = "laptop";
  my.nas.ip = "10.1.0.1";
}
