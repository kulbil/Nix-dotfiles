{ ... }:
{
  services.xserver.enable = true;

  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  xdg.portal.extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ]; # xdg-desktop-portal-kde is the right portal for Plasma
}
