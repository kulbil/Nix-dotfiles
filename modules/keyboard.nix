{ ... }:
{
  services.xserver.xkb = {
    layout = "no";
    variant = "";
  };
  console.keyMap = "no";

  services.keyd.enable = true;
  services.keyd.keyboards.default = {
    ids = [ "*" ];
    settings.main = {
      rightcontrol = "rightalt";
    };
  };
}
