{ ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."martin" = {
    isNormalUser = true;
    description = "Martin Danielsen";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      thunderbird
    ];
  };
}