
let
  module = 
    { "Home.Pkgs.ChromiumSetSearches" = import ../Home.Pkgs.ChromiumSetSearches;
      "Home.Pkgs.ChromiumSetSearches.Types" = import ../Home.Pkgs.ChromiumSetSearches.Types;
      "Home.Types" = import ../Home.Types;
      "Prelude" = import ../Prelude;
    };
  main = v: 
    let
      __pattern0 = __fail: 
        let
          pkgs = v.pkgs;
        in
          {chromiumSetSearches = (module."Home.Pkgs.ChromiumSetSearches".main {pkgs = pkgs;}).chromiumSetSearches;};
      __patternFail = builtins.throw "Pattern match failure in src/Home/Pkgs.purs at 10:1 - 10:34";
    in
      __pattern0 __patternFail;
in
  {inherit main;}