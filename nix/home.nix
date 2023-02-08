{ config, pkgs, ... }:

{
  home.username = "m";
  home.homeDirectory = "/home/m";
  home.stateVersion = "22.11";

  targets.genericLinux.enable = true;

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  programs.home-manager.enable = true;

  programs.bash.enable = true;

  programs.git = {
    enable = true;
  };

  programs.fish.enable = true;
}
