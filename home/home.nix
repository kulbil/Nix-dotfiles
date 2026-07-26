{ pkgs, ... }:
let
  andromedaLauncher = pkgs.stdenvNoCC.mkDerivation {
    pname = "andromeda-launcher";
    version = "unstable";
    src = pkgs.fetchFromGitHub {
      owner = "EliverLara";
      repo = "AndromedaLauncher";
      rev = "59aac937ab4b150b93977e187356e97ef952654d"; # pin a real commit
      hash = pkgs.lib.fakeHash; # switch will error with the real hash the first time
    };
    installPhase = ''
      mkdir -p $out/share/plasma/plasmoids/AndromedaLauncher
      cp -r ./* $out/share/plasma/plasmoids/AndromedaLauncher/
    '';
  };
in
{
  home.username = "martin";
  home.stateVersion = "26.05";

  home.packages = [ andromedaLauncher ];

  programs.plasma = {
    enable = true;

    workspace = {
      colorScheme = "BreezeDark";
      lookAndFeel = "org.kde.breeze.desktop";
      wallpaper = ../wallpapers/grass.png;
    };

    panels = [
      {
        location = "bottom";
        screen = 0;
        widgets = [
          "org.kde.plasma.panelspacer"

          {
            name = "AndromedaLauncher";
            config = {
              General = {
                activationIndicator = false;
                enableGreeting = false;
                launcherPosition = 1;
              };
              ConfigDialog = {
                DialogHeight = 630;
                DialogWidth = 810;
              };
            };
          }

          {
            iconTasks.launchers = [
              "preferred://filemanager"
              "applications:com.discordapp.Discord.desktop"
              "preferred://browser"
            ];
          }

          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"

          {
            name = "org.kde.plasma.digitalclock";
            config = {
              Appearance = {
                fontWeight = 400;
              };
            };
          }
        ];
      }
    ];
  };
}
