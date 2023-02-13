module Home where

import Prelude

import Home.Types (HomeConfig, Pkgs, partial)

main :: { pkgs :: Pkgs } -> HomeConfig
main { pkgs } = partial
  { home: partial
      { username: "m"
      , homeDirectory: "/home/m"
      , stateVersion: "22.11"
      , packages:
          [ pkgs.just
          ]
      }
  , targets: partial
      { genericLinux: partial { enable: true }
      }
  , nix: partial
      { package: pkgs.nixFlakes
      , extraOptions: "experimental-features = nix-command flakes"
      }
  , programs: partial
      { "home-manager": partial { enable: true }
      , "bash": partial { enable: true }
      , "git": partial { enable: true }
      , "fish": partial { enable: true }
      }
  }