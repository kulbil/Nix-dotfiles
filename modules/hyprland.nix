{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    withUWSM = false;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
}
