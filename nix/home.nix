{ pkgs, config, ... }: {
  services.clipmenu.enable = true;
  home.packages = [
    pkgs.nodePackages.purescript-language-server
    pkgs.nodePackages.typescript-language-server
    pkgs.rlwrap
    pkgs.tdesktop
  ];
{pkgs, config, ...}: {
  programs.bash = {
    enable = true;
    profileExtra = ''
      export XDG_DATA_DIRS=$HOME/.home-manager-share:$XDG_DATA_DIRS
    '';
  };

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
}
