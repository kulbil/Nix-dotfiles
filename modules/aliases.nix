{ ... }:
{
  # Aliases
  programs.bash.shellAliases = {
    nixbuild = "sudo nixos-rebuild switch --flake /home/martin/nixos-config#$(hostname)";
  #  hyprconf = "sudo nano .config/hypr/hyprland.conf";
  };
}
