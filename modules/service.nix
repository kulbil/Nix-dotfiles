{ ... }:
{
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.xserver.enable = true;
  programs.hyprland.enable = false; #Change if u want hyprland again
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Automatic mounting of USB drives, enable if u use hyprland
  # services.udisks2.enable = true;
}
