
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
          { programs = slice 
              { chromium = slice 
                  { enable = true;
                    extensions = [{id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";}
                      {id = "hdokiejnpimakedhajhdlcegeplioahd";}
                      {id = "aghfnjkcakhmadgdomlmlhhaocbkloab";}
                      {id = "egnjhciaieeiiohknchakcodbpgjnchh";}];
                  };
              };
            home = slice 
              { packages = 
                  [ 
                    ( pkgs.chromiumSetSearches 
                      { entries = 
                          let
                            mkEntry = name: shorthand: url: 
                              { name = name;
                                shorthand = shorthand;
                                url = url;
                              };
                          in
                            [(mkEntry "Nix Packages" "np" "https://search.nixos.org/packages?query={searchTerms}")
                            (mkEntry "NixOS Options" "no" "https://search.nixos.org/options?query={searchTerms}")
                            (mkEntry "Nix Flakes" "nf" "https://search.nixos.org/flakes?query={searchTerms}")
                            (mkEntry "Youtube" "yt" "https://www.youtube.com/results?search_query={searchTerms}")];
                      }
                    )
                  ];
              };
          };
      __patternFail = builtins.throw "Pattern match failure in src/Home/Modules/Chromium.purs at 7:1 - 7:39";
    in
      __pattern0 __patternFail;
in
  {inherit main;}