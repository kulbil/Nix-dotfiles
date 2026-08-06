{ pkgs, ... }:
{
  # Install steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Flatpak support
  services.flatpak.enable = true;
  services.flatpak.remotes = [
    { name = "flathub"; location = "https://dl.flathub.org/repo/flathub.flatpakrepo"; }
  ];
  services.flatpak.packages = [
    { appId = "com.discordapp.Discord"; origin = "flathub"; }  # replace with your apps
    { appId = "org.vinegarhq.Sober"; origin = "flathub"; }  # replace with your apps
  ];


  xdg.portal.enable = true; # Needed for Flatpak app integration (file pickers, theming, etc.)

  xdg.portal.extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ]; # xdg-desktop-portal-kde is the right portal for Plasma

  programs.thunderbird.enable = false; #Uninstalls thunderbird

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    librewolf
    pear-desktop
    vscode
    proton-authenticator
    neovim
    obsidian
    libreoffice
    git
    qbittorrent
    vlc
    jellyflix
    fastfetch
    osu-lazer
    prismlauncher
    dolphin-emu
    cemu

    kdePackages.kmail
    kdePackages.kmail-account-wizard
    kdePackages.korganizer
    kdePackages.kaddressbook
    kdePackages.kdepim-runtime
    kdePackages.akonadi
  ];
}
