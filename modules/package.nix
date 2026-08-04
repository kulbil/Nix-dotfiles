{ pkgs, ... }:
{
  # Install steam
  programs.steam = {
    enable = true;

    # Optional but recommended
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      Preferences = {
        "privacy.resistFingerprinting" = false;
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";kon
      };
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed"; # UBlock Origins
        };
        "446900e4-71c2-419f-a6a7-df9c091e268b" = { # Bitwarden
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        "jid0-adyhmvsP91nUO8pRv0Mn2VKeB84@jetpack" = { # Raindrop.io
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/raindropio/latest.xpi";
          installation_mode = "normal_installed";
        };
        "{cb31ec5d-c49a-4e5a-b240-16c767444f62}" = { # Indie Wiki Buddy
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/indie-wiki-buddy/latest.xpi";
          installation_mode = "normal_installed";
        };
        "{47bf427e-c83d-457d-9b3d-3db4118574bd}" = { # NightTab
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/nighttab/latest.xpi";
          installation_mode = "normal_installed";
        };
      };
    };
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


    # librewolf
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
