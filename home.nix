{ config, pkgs, ... }:

{
  home.username = "m";
  home.homeDirectory = "/home/m";
  home.stateVersion = "22.11";

  targets.genericLinux.enable = true;

  programs.home-manager.enable = true;

  programs.bash.enable = true;

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  programs.git = {
    enable = true;
  };
}
