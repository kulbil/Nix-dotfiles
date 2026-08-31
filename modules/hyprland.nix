{ pkgs, ... }:
{
  programs.hyprland.enable = true;
  services.udisks2.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
}
