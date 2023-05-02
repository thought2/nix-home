
let
  module = 
    { "Data.Function" = import ../Data.Function;
      "Home.Types" = import ../Home.Types;
      "Prelude" = import ../Prelude;
      "Unsafe.Coerce" = import ../Unsafe.Coerce;
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
              pkgs.yarn
              pkgs.nodejs
              pkgs.purenix
              pkgs.byzanz
              pkgs.esbuild
              ((v1: v1.tdesktop) (module."Unsafe.Coerce".unsafeCoerce pkgs))];};};
              pkgs.purenix
              pkgs.tdesktop
              pkgs.zoom
              pkgs.miniserve
              pkgs.esbuild
              pkgs.thunderbird
              ((v1: v1.htop) (module."Unsafe.Coerce".unsafeCoerce pkgs))];};};
      __patternFail = builtins.throw "Pattern match failure in src/Home/Modules/Packages.purs at 8:1 - 8:39";
    in
      __pattern0 __patternFail;
in
  {inherit main;}