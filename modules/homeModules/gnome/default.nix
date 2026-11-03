{ config, pkgs, lib, ... }:

let
  wallpaper = "file://${../../../wallpapers/grass.png}";
in
{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/desktop/background" = {
      picture-uri = wallpaper;
      picture-uri-dark = wallpaper;
  #    picture-options = "zoom";
    };

    "org/gnome/desktop/screensaver" = {
      picture-uri = wallpaper;
   #   picture-options = "zoom";
    };

    # Add more settings below as you go, e.g.:
    # "org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };
}
