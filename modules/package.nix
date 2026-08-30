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
    { appId = "com.discordapp.Discord"; origin = "flathub"; }  # Discord
    { appId = "org.vinegarhq.Sober"; origin = "flathub"; }  # Sober
    { appId = "com.dec05eba.gpu_screen_recorder"; origin = "flathub"; }  # GPU recorder
  ];


  xdg.portal.enable = true; # Needed for Flatpak app integration (file pickers, theming, etc.)

  xdg.portal.extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ]; # xdg-desktop-portal-kde is the right portal for Plasma

  programs.thunderbird.enable = false; #Uninstalls thunderbird

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    kitty
    anki
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
    eden
    kdePackages.kdenlive
    r2modman
    aerc

    (python3.withPackages (python-pkgs: with python-pkgs; [
      ollama
    ]))

    kdePackages.kmail
    kdePackages.kmail-account-wizard
    kdePackages.korganizer
    kdePackages.kaddressbook
    kdePackages.kdepim-runtime
    kdePackages.akonadi
  ];
}
