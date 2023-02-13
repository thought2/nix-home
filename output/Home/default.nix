
let
  module = 
    { "Home.Types" = import ../Home.Types;
      "Prelude" = import ../Prelude;
    };
  partial = module."Home.Types".partial module."Prim".undefined;
  main = v: 
    let
      __pattern0 = __fail: 
        let
          pkgs = v.pkgs;
        in
          partial 
          { home = partial 
              { username = "m";
                homeDirectory = "/home/m";
                stateVersion = "22.11";
                packages = [pkgs.just];
              };
            targets = partial {genericLinux = partial {enable = true;};};
            nix = partial 
              { package = pkgs.nixFlakes;
                extraOptions = "experimental-features = nix-command flakes";
              };
            programs = partial 
              { "home-manager" = partial {enable = true;};
                bash = partial {enable = true;};
                git = partial {enable = true;};
                fish = partial {enable = true;};
              };
          };
      __patternFail = builtins.throw "Pattern match failure in src/Home.purs at 7:1 - 7:39";
    in
      __pattern0 __patternFail;
in
  {inherit main;}