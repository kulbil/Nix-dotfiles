{ config, pkgs, lib, ... }:

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  environment.systemPackages = with pkgs; [
    gnomeExtensions.ddterm
    gjs
    gnome-tweaks
  ];

  # Make the GTK, VTE, and libhandy GI typelibs discoverable
  environment.sessionVariables.GI_TYPELIB_PATH =
    lib.makeSearchPath "lib/girepository-1.0" [
      pkgs.gtk3
      pkgs.vte
      pkgs.libhandy
    ];
}
