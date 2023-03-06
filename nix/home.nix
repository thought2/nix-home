{ pkgs, config, ... }: {
  services.clipmenu.enable = true;
  home.packages = [
    pkgs.nodePackages.purescript-language-server
    pkgs.nodePackages.typescript-language-server
    pkgs.rlwrap
    pkgs.tdesktop
  ];
}
