
let
  module = 
    { "Home.Pkgs.ChromiumSetSearches.Types" = import ../Home.Pkgs.ChromiumSetSearches.Types;
      "Home.Types" = import ../Home.Types;
      "Prelude" = import ../Prelude;
    };
  main = v: 
    let
      __pattern0 = __fail: 
        let
          pkgs = v.pkgs;
        in
          
          let
            chromiumSetSearches = v1: 
              let
                __pattern0 = __fail: 
                  let
                    entries = v1.entries;
                  in
                    pkgs.writeShellScriptBin "chromium-set-searches" "echo hello!";
                __patternFail = builtins.throw "Pattern match failure in src/Home/Pkgs/ChromiumSetSearches.purs at 13:3 - 15:20";
              in
                __pattern0 __patternFail;
          in
            {chromiumSetSearches = chromiumSetSearches;};
      __patternFail = builtins.throw "Pattern match failure in src/Home/Pkgs/ChromiumSetSearches.purs at 8:1 - 8:45";
    in
      __pattern0 __patternFail;
in
  {inherit main;}