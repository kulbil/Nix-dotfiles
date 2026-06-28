{ ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Install steam
  programs.steam = {
    enable = true;

    # Optional but recommended
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

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


    vesktop
    librewolf
    ytmdesktop
    vscode
    proton-authenticator
    neovim
    obsidian
    libreoffice
    git
  ];
}