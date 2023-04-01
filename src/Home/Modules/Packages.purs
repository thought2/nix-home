module Home.Modules.Packages where

import Prelude

import Home.Types (HomeConfig, Pkgs, slice)
import Unsafe.Coerce (unsafeCoerce)

main :: { pkgs :: Pkgs } -> HomeConfig
main { pkgs } = slice
  { home: slice
      { packages:
          [ pkgs."nixpkgs-fmt"
          , pkgs."signal-desktop"
          , pkgs."just"
          , pkgs."purs-tidy"
          , pkgs."psa"
          , pkgs."zephyr"
          , pkgs."purs"
          , pkgs."spago"
          , pkgs."yarn"
          , pkgs."nodejs"
          , pkgs."purenix"
          --, pkgs."peek"
          , pkgs."byzanz"
          , pkgs."esbuild"
          , unsafeCoerce pkgs # _."tdesktop"
          ]
      }
  }

