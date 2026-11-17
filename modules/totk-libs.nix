{ pkgs, ... }:
{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    vulkan-loader alsa-lib libpulseaudio fribidi wayland libxkbcommon libdecor libGL
    xorg.libX11 xorg.libXext xorg.libXcursor xorg.libXi xorg.libXfixes
    xorg.libXrandr xorg.libXScrnSaver xorg.libXtst
  ];
}
