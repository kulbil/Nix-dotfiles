{ ... }:
{
  # HARICA root certificates for UiO eduroam
  security.pki.certificateFiles = [
    "${pkgs.harica-ca-certs}/etc/ssl/certs/harica-root-ca.pem"
  ];
}
