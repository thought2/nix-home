module Home.Modules.Chromium where

import Prelude

import Home.Types (HomeConfig, Pkgs, slice)

main :: { pkgs :: Pkgs } -> HomeConfig
main { pkgs } = slice
  { programs: slice
      { chromium: slice
          { enable: true
          , extensions:
              [ { id: "cjpalhdlnbpafiamejdnhcphjbkeiagm" } -- uBlock Origin
              , { id: "hdokiejnpimakedhajhdlcegeplioahd" } -- LastPass
              , { id: "aghfnjkcakhmadgdomlmlhhaocbkloab" } -- Just Black
              , { id: "egnjhciaieeiiohknchakcodbpgjnchh" } -- Tab Wrangler
              ]
          }
      }
  , home: slice
      { packages:
          [ pkgs.chromiumSetSearches
              { entries:
                  let
                    mkEntry name shorthand url = { name, shorthand, url }
                  in
                    [ mkEntry
                        "Nix Packages"
                        "np"
                        "https://search.nixos.org/packages?query={searchTerms}"

                    , mkEntry
                        "NixOS Options"
                        "no"
                        "https://search.nixos.org/options?query={searchTerms}"

                    , mkEntry
                        "Nix Flakes"
                        "nf"
                        "https://search.nixos.org/flakes?query={searchTerms}"

                    , mkEntry
                        "Youtube"
                        "yt"
                        "https://www.youtube.com/results?search_query={searchTerms}"
                    ]
              }
          ]
      }
  }