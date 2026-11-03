
{ config, lib, ... }:

let
  cfg = config.services.eduroam;
in
{
  options.services.eduroam = {
    enable = lib.mkEnableOption "UiO eduroam Wi-Fi";

    username = lib.mkOption {
      type = lib.types.str;
      default = "";
      example = "abc123";
      description = ''
        Your UiO username, without the @uio.no suffix.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      {
        assertion = cfg.username != "";
        message = "services.eduroam.username must be set.";
      }
    ];

    # GNOME uses NetworkManager. Do not configure a second
    # independent Wi-Fi manager.
    networking.networkmanager.enable = true;

    networking.networkmanager.ensureProfiles.profiles.eduroam-uio = {
      connection = {
        id = "eduroam (UiO)";
        type = "wifi";
        autoconnect = true;
        autoconnect-priority = 100;
      };

      wifi = {
        mode = "infrastructure";
        ssid = "eduroam";
      };

      wifi-security = {
        key-mgmt = "wpa-eap";
      };

      "802-1x" = {
        eap = "ttls";
        phase2-auth = "pap";

        identity = "${cfg.username}@uio.no";
        domain-suffix-match = "uio.no";

        ca-cert = "/etc/ssl/certs/harica-tls-ecc-root-2021.pem";
        system-ca-certs = false;

        password-flags = 1;
      };

      ipv4 = {
        method = "auto";
      };

      ipv6 = {
        method = "auto";
      };
    };
  };
}
