{ pkgs, ... }:
{
  programs.hyprland.enable = true;
  services.udisks2.enable = true;

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
}
