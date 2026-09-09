{ ... }:
{
  # Aliases
  programs.bash.shellAliases = {
    nixbuild = "sudo nixos-rebuild switch --flake /home/martin/nixos-config#$(hostname)";
    hyprconf = "nano nixos-config/modules/homeModules/hyprland/hyprland.lua";
  };
}
