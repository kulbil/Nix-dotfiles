{ ... }:
{
  # Aliases
  programs.bash.shellAliases = {
    nixconf = "sudo nano /etc/nixos/configuration.nix";
    nixbuild = "sudo nixos-rebuild switch --flake /home/martin/nixos-config#nixos";
  #  hyprconf = "sudo nano .config/hypr/hyprland.conf";
  };
}