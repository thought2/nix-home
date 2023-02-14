
let
  module = 
    { "Data.Semigroup" = import ../Data.Semigroup;
      "Home.Types" = import ../Home.Types;
      "Prelude" = import ../Prelude;
    };
  slice = module."Home.Types".slice module."Prim".undefined;
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupArray;
  main = v: 
    let
      __pattern0 = __fail: 
        let
          pkgs = v.pkgs;
        in
          slice 
          { programs = slice 
              { vscode = slice 
                  { enable = true;
                    package = pkgs.vscodium;
                    extensions = 
                      let
                        vpkgs = pkgs."vscode-extensions";
                      in
                        append [vpkgs.streetsidesoftware."code-spell-checker"
                        vpkgs."dracula-theme"."theme-dracula"
                        vpkgs.stkb.rewrap
                        vpkgs.skellock.just
                        vpkgs.haskell.haskell
                        vpkgs.tyriar."sort-lines"
                        vpkgs.jnoortheen."nix-ide"
                        vpkgs.gruntfuggly."todo-tree"
                        vpkgs.esbenp."prettier-vscode"
                        vpkgs._2gua."rainbow-brackets"] 
                        ( pkgs."vscode-utils".extensionsFromVscodeMarketplace 
                          [ 
                            { name = "ide-purescript";
                              publisher = "nwolverson";
                              version = "0.26.1";
                              sha256 = "sha256-ccTuoDSZKf1WsTRX2TxXeHy4eRuOXsAc7rvNZ2b56MU=";
                            }
                            
                            { name = "language-purescript";
                              publisher = "nwolverson";
                              version = "0.2.8";
                              sha256 = "sha256-2uOwCHvnlQQM8s8n7dtvIaMgpW8ROeoUraM02rncH9o=";
                            }
                            
                            { name = "vscode-dhall-lsp-server";
                              publisher = "dhall";
                              version = "0.0.4";
                              sha256 = "sha256-WopWzMCtiiLrx3pHNiDMZYFdjS359vu3T+6uI5A+Nv4=";
                            }
                            
                            { name = "dhall-lang";
                              publisher = "dhall";
                              version = "0.0.4";
                              sha256 = "sha256-7vYQ3To2hIismo9IQWRWwKsu4lXZUh0Or89WDLMmQGk=";
                            }
                            
                            { name = "mdx";
                              publisher = "silvenon";
                              version = "0.1.0";
                              sha256 = "sha256-4zdlvH91dTFKWBnHyjFEzBuT8g/dBzgNQpK2D/bD+tc=";
                            }
                          ]
                        );
                  };
              };
          };
      __patternFail = builtins.throw "Pattern match failure in src/Home/Modules/VSCode.purs at 7:1 - 7:39";
    in
      __pattern0 __patternFail;
in
  {inherit main;}