{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    anki
    librewolf
    pear-desktop
    vscode
    proton-authenticator
    neovim
    obsidian
    libreoffice
    git
    qbittorrent
    vlc
    jellyflix
    fastfetch
    osu-lazer
    prismlauncher
    aerc
  ];
}
