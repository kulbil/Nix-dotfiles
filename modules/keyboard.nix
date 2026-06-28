{ ... }:
{
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "no";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "no";

  # configuration.nix
  services.keyd.enable = true;
  services.keyd.keyboards.default = {
    ids = [ "*" ];
    settings.main = {
      rightcontrol = "rightalt";
    };
  };
}