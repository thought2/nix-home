
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
          slice {home = slice {packages = [pkgs."nixpkgs-fmt"
              pkgs."signal-desktop"
              pkgs.just
              pkgs."purs-tidy"
              pkgs.psa
              pkgs.zephyr
              pkgs.purs
              pkgs.spago
              pkgs.yarn
              pkgs.nodejs
              pkgs.purenix
              pkgs.byzanz
              pkgs.esbuild];};};
      __patternFail = builtins.throw "Pattern match failure in src/Home/Modules/Packages.purs at 7:1 - 7:39";
    in
      __pattern0 __patternFail;
in
  {inherit main;}