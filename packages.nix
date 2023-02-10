{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.nixpkgs-fmt
    pkgs.signal-desktop
    pkgs.just
    pkgs.purs-tidy
    pkgs.psa
    pkgs.zephyr
    pkgs.purs
    pkgs.spago
    pkgs.yarn
    pkgs.chromium-set-searches
  ];
}
