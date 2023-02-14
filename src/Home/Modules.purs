module Home.Modules where

import Prelude

import Home.Modules.Chromium as M.Chromium
import Home.Modules.Home as M.Home
import Home.Modules.Packages as M.Packages
import Home.Modules.VSCode as M.VSCode

import Home.Types (Pkgs, HomeConfig)

main :: { pkgs :: Pkgs } -> Array HomeConfig
main { pkgs } =
  [ M.Chromium.main { pkgs }
  , M.Home.main { pkgs }
  , M.Packages.main { pkgs }
  , M.VSCode.main { pkgs }
  ]