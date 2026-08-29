{ pkgs, ... }:

/*
let
  andromedaLauncher = pkgs.stdenvNoCC.mkDerivation {
    pname = "andromeda-launcher";
    version = "unstable";
    src = pkgs.fetchFromGitHub {
      owner = "EliverLara";
      repo = "AndromedaLauncher";
      rev = "59aac937ab4b150b93977e187356e97ef952654d"; # pin a real commit
      hash = "sha256-ID0C2MHxJNsN9eKvsKPzpRdAmCEoHRIGJX0ufUjYnWo="; # switch will error with the real hash the first time
    };
    installPhase = ''
      mkdir -p $out/share/plasma/plasmoids/AndromedaLauncher
      cp -r ./* $out/share/plasma/plasmoids/AndromedaLauncher/
    '';
  };
in
*/
{

  home.username = "martin";
  home.stateVersion = "26.05";

  imports =
    [
      ../modules/homeModules/git
    ];

  #home.packages = [ andromedaLauncher ];

  programs.plasma = {
    enable = true;

    overrideConfig = true;


    #Config file changes found using rc2nix
    #Command ran: nix run github:nix-community/plasma-manager > plasma-config.nix

    configFile = {

      kwinrc.EdgeBarrier.EdgeBarrier = 0; #Disables edges between monitors
      kwinrc.Effect-overview.BorderActivate = 9; #Not quite sure but something to do with displays
      kwinrc.Plugins.shakecursorEnabled = false; #Disables cursor shaking
      kded5rc.Module-browserintegrationreminder.autoload = false; #Disables the system tray notif for the firefox extention

      #Change this if mouse id has changed
      #kcminputrc."Libinput/4012/6878/keyd virtual pointer".PointerAcceleration = 0.000;
      #kcminputrc."Libinput/4012/6878/keyd virtual pointer".PointerAccelerationProfile = 1;

      kcminputrc."Libinput/1133/16531/Logitech PRO X".PointerAcceleration = 0.000;
      kcminputrc."Libinput/1133/16531/Logitech PRO X".PointerAccelerationProfile = 1;

      kdeglobals.Favorites.FavoriteApps = "org.kde.dolphin.desktop,librewolf.desktop,com.discordapp.Discord.desktop,org.kde.konsole.desktop";

      kdeglobals.PreviewSettings.MaximumRemoteSize = 10737418240; #Remote file preview size 10GiB
    };

    shortcuts = {
      kmix.mic_mute = [ ];
    };

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
            name = "org.kde.plasma.kickoff";
            config = {
              General = {
                icon = "nix-snowflake";
              };
            };
          }


          /*
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
          */

          {
            iconTasks.launchers = [
              "preferred://filemanager"
              "applications:librewolf.desktop"
              "applications:com.discordapp.Discord.desktop"
              "applications:com.github.th_ch.youtube_music.desktop"
            ];
          }

          "org.kde.plasma.panelspacer"
          {
            systemTray.items = {
              shown = [
                "org.kde.plasma.volume"
              ];

              hidden = [
                "org.kde.plasma.clipboard"
                "org.kde.plasma.brightness"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.devicenotifier"
                "org.kde.plasma.mediacontroller"
                "org.kde.plasma.notifications"
                "org.kde.plasma.manage-inputmethod"
                "org.kde.plasma.cameraindicator"
                "org.kde.plasma.keyboardindicator"
                "org.kde.plasma.weather"
                "org.kde.plasma.battery"
                "org.kde.plasma.keyboardlayout"
                "org.kde.plasma.printmanager"
                "org.kde.kscreen"
                "xdg-desktop-portal-kde" #To hide the red dot for recording stuff
              ];
            };
          }

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

      {
        location = "bottom";
        screen = 1;
        hiding = "autohide";
        floating = true;
        lengthMode = "fit";
        widgets = [

          {
            iconTasks.launchers = [
              "preferred://filemanager"
              "applications:librewolf.desktop"
              "applications:com.discordapp.Discord.desktop"
              "applications:com.github.th_ch.youtube_music.desktop"
            ];
          }
        ];
      }

      {
        location = "top";
        screen = 1;
        hiding = "autohide";
        floating = true;
        lengthMode = "fit";
        widgets = [
          {
            name = "org.kde.plasma.panelspacer";
            config = { General = { expanding = false; length = 100; }; };
          }

          { name = "org.kde.plasma.digitalclock"; config = { Appearance = { fontWeight = 400; }; }; }

          {
            name = "org.kde.plasma.panelspacer";
            config = { General = { expanding = false; length = 100; }; };
          }
        ];
      }

      {
        location = "bottom";
        screen = 2;
        hiding = "autohide";
        floating = true;
        lengthMode = "fit";
        widgets = [

          {
            iconTasks.launchers = [
              "preferred://filemanager"
              "applications:librewolf.desktop"
              "applications:com.discordapp.Discord.desktop"
              "applications:com.github.th_ch.youtube_music.desktop"
            ];
          }
        ];
      }

      {
        location = "top";
        screen = 2;
        hiding = "autohide";
        floating = true;
        lengthMode = "fit";
        widgets = [
          {
            name = "org.kde.plasma.panelspacer";
            config = { General = { expanding = false; length = 100; }; };
          }

          { name = "org.kde.plasma.digitalclock"; config = { Appearance = { fontWeight = 400; }; }; }

          {
            name = "org.kde.plasma.panelspacer";
            config = { General = { expanding = false; length = 100; }; };
          }
        ];
      }
    ];
  };
}
