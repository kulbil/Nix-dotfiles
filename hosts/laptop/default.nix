{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules
    ../../modules/wireguard.nix
    ../../modules/certificate.nix #Certificate for eduroam
    ../../modules/eduroam.nix
#    ../../modules/hyprland.nix
#    ../../modules/cosmic.nix
    ../../modules/gnome.nix 
 ];

  system.stateVersion = "26.05";
  networking.hostName = "laptop";
  my.nas.ip = "10.1.0.1";

  services.eduroam = {
    enable = true;
    username = "martiada";
  };
}
