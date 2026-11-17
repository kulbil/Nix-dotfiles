{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disks.nix

    ../../modules
    ../../modules/package-desktop.nix
    ../../modules/kde.nix
    ../../modules/ollama.nix
    ../../modules/totk-libs.nix
  ];

  system.stateVersion = "26.05";
  networking.hostName = "desktop";
  my.nas.ip = "10.0.0.24";
}
