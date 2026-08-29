{ pkgs, ... }:
{
  programs.gpu-screen-recorder.enable = true;

  systemd.user.services.gpu-screen-recorder = {
    description = "GPU Screen Recorder instant replay";

    after = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = ''
        ${pkgs.gpu-screen-recorder}/bin/gpu-screen-recorder \
          -w portal \
          -c mp4 \
          -f 60 \
          -a 'app-inverse:Chromium,WEBRTC VoiceEngine,LibreWolf' \
          -a alsa_input.usb-20022021_Thronmax_MDrill_One_Pro-00.analog-stereo \
          -r 120 \
          -o %h/Videos/Replays
      '';

      Restart = "on-failure";
      RestartSec = "2s";
    };
  };
}
