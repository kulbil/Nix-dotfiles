{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dolphin-emu
    cemu
    eden
    r2modman

    (python3.withPackages (python-pkgs: with python-pkgs; [
      ollama
    ]))

    kdePackages.kmail
    kdePackages.kmail-account-wizard
    kdePackages.korganizer
    kdePackages.kaddressbook
    kdePackages.kdepim-runtime
    kdePackages.akonadi
    kdePackages.kdenlive
  ];
}
