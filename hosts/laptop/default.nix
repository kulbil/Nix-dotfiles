{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules
    ../../modules/wireguard.nix
    ../../modules/hyprland.nix
  ];

  system.stateVersion = "26.05";
  networking.hostName = "laptop";
  my.nas.ip = "10.1.0.1";
}
