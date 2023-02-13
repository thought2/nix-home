module Home.Pkgs.ChromiumSetSearches where

import Prelude

import Home.Types (Pkgs)
import Home.Pkgs.ChromiumSetSearches.Types as Ty

main :: { pkgs :: Pkgs } -> { | Ty.Pkgs () }
main { pkgs } =
  { chromiumSetSearches
  }
  where
  chromiumSetSearches { entries } =
    pkgs.writeShellScriptBin "chromium-set-searches"
      "echo hello!"

