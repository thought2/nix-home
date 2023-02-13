module Home.Pkgs.ChromiumSetSearches where

import Prelude

import Home.Types (Pkgs)

main :: Pkgs -> String
main pkgs = pkgs.writeShellScriptBin "chromium-set-searches"
  "echo hello!"