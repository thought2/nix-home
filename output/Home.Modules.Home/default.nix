
let
  module = 
    { "Home.Types" = import ../Home.Types;
      "Prelude" = import ../Prelude;
    };
  slice = module."Home.Types".slice module."Prim".undefined;
  main = v: 
    let
      __pattern0 = __fail: 
        let
          pkgs = v.pkgs;
        in
          slice 
          { home = slice 
              { username = "m";
                homeDirectory = "/home/m";
                stateVersion = "22.11";
                packages = [pkgs.just];
              };
            targets = slice {genericLinux = slice {enable = true;};};
            nix = slice 
              { package = pkgs.nixFlakes;
                extraOptions = "experimental-features = nix-command flakes";
              };
            programs = slice 
              { "home-manager" = slice {enable = true;};
                bash = slice {enable = true;};
                git = slice {enable = true;};
                fish = slice {enable = true;};
              };
          };
      __patternFail = builtins.throw "Pattern match failure in src/Home/Modules/Home.purs at 7:1 - 7:39";
    in
      __pattern0 __patternFail;
in
  {inherit main;}