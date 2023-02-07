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

  programs.vscode = {
    package = pkgs.vscodium;
    enable = true;
    extensions =
      let
        vpkgs = pkgs.vscode-extensions;
      in
      [
        vpkgs.dracula-theme.theme-dracula
        vpkgs.stkb.rewrap
        vpkgs.skellock.just
        vpkgs.haskell.haskell
        vpkgs.tyriar.sort-lines
        vpkgs.jnoortheen.nix-ide
        vpkgs.gruntfuggly.todo-tree
        vpkgs.oderwat.indent-rainbow
        vpkgs.esbenp.prettier-vscode
        vpkgs._2gua.rainbow-brackets
        # vpkgs.brettm12345.nixfmt-vscode
        # vpkgs.b4dm4n.vscode-nixpkgs-fmt
        vpkgs.streetsidesoftware.code-spell-checker
      ];
  };

  programs.git = {
    enable = true;
  };

  programs.chromium = {
    enable = true;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
      { id = "hdokiejnpimakedhajhdlcegeplioahd"; } # LastPass
      { id = "aghfnjkcakhmadgdomlmlhhaocbkloab"; } # Just Black
      { id = "egnjhciaieeiiohknchakcodbpgjnchh"; } # Tab Wrangler
    ];
  };

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
  ];
}
