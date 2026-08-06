{ ... }:

{
  imports =
    [
      #./hosts/laptop #Switch to this for the laptop
      ./hosts/desktop
    ];

  system.stateVersion = "26.05"; # Did you read the comment?

}
