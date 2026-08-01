{ pkgs, ... }:
{
  # Install firefox.
  programs.firefox.enable = true;

  # Install steam
  programs.steam = {
    enable = true;

    # Optional but recommended
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

  # Needed for Flatpak app integration (file pickers, theming, etc.)
  xdg.portal.enable = true;
  # xdg-desktop-portal-kde is the right portal for Plasma
  xdg.portal.extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    #  kitty          # terminal
    #  wofi           # app launcher
    #  waybar         # status bar
    #  dunst          # notifications
    #  awww           # wallpaper daemon
    #  grim           # screenshots
    #  slurp          # screenshot region selector
    #  wl-clipboard   # clipboard
    #  networkmanagerapplet  # wifi tray icon
    #  brightnessctl  # brightness keys
    #  playerctl      # media keys
    
    #  kdePackages.dolphin   # file manager
    #  kdePackages.solid     # device/hardware integration for dolphin
    #  udiskie               # auto-mounts removable media in the system tray
    
    #  gedit                 # text editor    

    #  pkgs.bibata-cursors # cursor package   
    #  sddm-astronaut 


    # vesktop
    # discord
    librewolf
    # ytmdesktop
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
  ];
}
