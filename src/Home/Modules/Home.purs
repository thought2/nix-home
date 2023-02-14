module Home.Modules.Home where

import Prelude

import Home.Types (HomeConfig, Pkgs, slice)

main :: { pkgs :: Pkgs } -> HomeConfig
main { pkgs } = slice
  { home: slice
      { username: "m"
      , homeDirectory: "/home/m"
      , stateVersion: "22.11"
      , packages:
          [ pkgs.just
          ]
      }
  , targets: slice
      { genericLinux: slice { enable: true }
      }
  , nix: slice
      { package: pkgs.nixFlakes
      , extraOptions: "experimental-features = nix-command flakes"
      }
  , programs: slice
      { "home-manager": slice { enable: true }
      , "bash": slice { enable: true }
      , "git": slice { enable: true }
      , "fish": slice { enable: true }
      }
  }