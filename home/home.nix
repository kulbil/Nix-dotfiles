{ pkgs, ... }:

{
  home.username = "martin";
  home.homeDirectory = "/home/martin";
  home.stateVersion = "26.05";

  programs.plasma = {
    enable = true;
    workspace = {
      colorScheme = "BreezeDark";
      # wallpaper = "/path/to/wallpaper.png";
    };
  };
}