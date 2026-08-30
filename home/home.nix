{ pkgs, ... }:
{
  home.username = "martin";
  home.stateVersion = "26.05";
  imports =
    [
      ../modules/homeModules/git
    ];
}
