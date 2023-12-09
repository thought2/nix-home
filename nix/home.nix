{ pkgs, config, ... }: {
  services.clipmenu.enable = true;
  home.packages = [
    pkgs.nodePackages.purescript-language-server
    pkgs.nodePackages.typescript-language-server
    pkgs.rlwrap
    pkgs.tdesktop
    pkgs.fish
  ];

  programs.bash = {
    enable = true;
    profileExtra = ''
      export XDG_DATA_DIRS=$HOME/.home-manager-share:$XDG_DATA_DIRS
      export PATH=$HOME/.cabal/bin:$PATH
    '';
    initExtra = ''
      export PATH=$HOME/.cabal/bin:$PATH
      source $HOME/.ghcup/env
    '';
    bashrcExtra = ''
      export PATH=$HOME/.cabal/bin:$PATH
    '';
  };

  nix.package = pkgs.nixFlakes;

  nix.extraOptions = "experimental-features = nix-command flakes";

  home.activation = {
    linkDesktopApplications = {
      after = [ "writeBoundary" "createXdgUserDirectories" ];
      before = [ ];
      data = ''
        rm -rf ${config.xdg.dataHome}/"applications/home-manager"
        mkdir -p ${config.xdg.dataHome}/"applications/home-manager"
        cp -Lr ${config.home.homeDirectory}/.nix-profile/share/applications/* ${config.xdg.dataHome}/"applications/home-manager/"
      '';
    };
  };

  home = {
    username = "m";
    homeDirectory = "/home/m";
    stateVersion = "22.11";
  };

  targets.genericLinux.enable = true;

  programs."home-manager".enable = true;
}
