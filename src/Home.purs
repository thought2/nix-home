module Home where

import Prelude

import Home.Types (HomeConfig, Pkgs)

main :: { pkgs :: Pkgs } -> HomeConfig
main { pkgs } =
  { home:
      { username: "m"
      , homeDirectory: "/home/m"
      , stateVersion: "22.11"
      , packages:
          [ 
             pkgs.just
        --   , pkgs.chromiumSetSearches
        --       { entries:
        --           [ { name: "Nix Packages"
        --             , shorthand: "np"
        --             , url: "https://search.nixos.org/packages?query={searchTerms}"
        --             }
        --           ]
        --       }
          ]
      }
  , targets:
      { genericLinux: { enable: true }
      }
  , nix:
      { package: pkgs.nixFlakes
      , extraOptions: "experimental-features = nix-command flakes"
      }
  , programs:
      { "home-manager": { enable: true }
      , "bash": { enable: true }
      , "git": { enable: true }
      , "fish": { enable: true }
      }
  }