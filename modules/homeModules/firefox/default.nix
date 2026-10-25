{ ... }:
{
  programs.firefox = {
    enable = true;

    profiles.default = {
      id = 0;
      isDefault = true;
    };
  };
}
