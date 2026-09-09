{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.power-profiles-daemon.enable = true;
  programs.hyprland.enable = true;


  environment.systemPackages = with pkgs; [
    swaybg                #Background
    ghostty               #Terminal
    wofi                  #Application Launcher   
    wl-clipboard          #Clipboard
    hyprland              #Tiling manager
    waybar                #Top bar
    dunst                 #Notification manager
    grim                  #Screenshot tool
    slurp                 #Screen region selector for grim
    networkmanagerapplet  #Wifi tray icon
    brightnessctl         #Brightness keys
    playerctl             #Media keys
    udiskie               #Automounting usb drives
    kdePackages.dolphin   #File manager
    kdePackages.solid     #Device/hardware integration for dolphin
  ];
}
