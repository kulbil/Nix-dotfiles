{ pkgs, nixpkgs-unstable, ... }:
{
  services.ollama = {
    enable = true;
    package = (import nixpkgs-unstable {
      system = pkgs.system;
    }).ollama-rocm;
  };
}
