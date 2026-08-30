{ pkgs, ... }:
{
  services.flatpak.enable = true;
  services.flatpak.remotes = [
    { name = "flathub"; location = "https://dl.flathub.org/repo/flathub.flatpakrepo"; }
  ];
  services.flatpak.packages = [
    { appId = "com.discordapp.Discord"; origin = "flathub"; }  # Discord
    { appId = "org.vinegarhq.Sober"; origin = "flathub"; }  # Sober
    { appId = "com.dec05eba.gpu_screen_recorder"; origin = "flathub"; }  # GPU recorder
  ];

  xdg.portal.enable = true; # Needed for Flatpak app integration (file pickers, theming, etc.)
}
