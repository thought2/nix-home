
let
  module = 
    { "Home.Types" = import ../Home.Types;
      "Prelude" = import ../Prelude;
    };
  main = v: 
    let
      __pattern0 = __fail: 
        let
          pkgs = v.pkgs;
        in
          
          { home = 
              { username = "m";
                homeDirectory = "/home/m";
                stateVersion = "22.11";
                packages = [];
              };
            targets = {genericLinux = {enable = true;};};
            nix = 
              { package = pkgs.nixFlakes;
                extraOptions = "experimental-features = nix-command flakes";
              };
            programs = 
              { "home-manager" = {enable = true;};
                bash = {enable = true;};
                git = {enable = true;};
                fish = {enable = true;};
              };
          };
      __patternFail = builtins.throw "Pattern match failure in src/Home.purs at 7:1 - 7:39";
    in
      __pattern0 __patternFail;
in
  {inherit main;}