
let
  module = 
    { "Home.Modules.Chromium" = import ../Home.Modules.Chromium;
      "Home.Modules.Home" = import ../Home.Modules.Home;
      "Home.Modules.Packages" = import ../Home.Modules.Packages;
      "Home.Modules.VSCode" = import ../Home.Modules.VSCode;
      "Home.Types" = import ../Home.Types;
      "Prelude" = import ../Prelude;
    };
  main = v: 
    let
      __pattern0 = __fail: 
        let
          pkgs = v.pkgs;
        in
          [(module."Home.Modules.Chromium".main {pkgs = pkgs;})
          (module."Home.Modules.Home".main {pkgs = pkgs;})
          (module."Home.Modules.Packages".main {pkgs = pkgs;})
          (module."Home.Modules.VSCode".main {pkgs = pkgs;})];
      __patternFail = builtins.throw "Pattern match failure in src/Home/Modules.purs at 12:1 - 12:45";
    in
      __pattern0 __patternFail;
in
  {inherit main;}