module Home.Pkgs where

import Prelude
import Home.Types (Pkgs)
import Home.Pkgs.ChromiumSetSearches as Home.Pkgs.ChromiumSetSearches
import Home.Pkgs.ChromiumSetSearches.Types as Home.Pkgs.ChromiumSetSearches.Types

type Pkgs' = { | Home.Pkgs.ChromiumSetSearches.Types.Pkgs () }

main :: { pkgs :: Pkgs } -> Pkgs'
main { pkgs } =
  { chromiumSetSearches:
      (Home.Pkgs.ChromiumSetSearches.main { pkgs }).chromiumSetSearches
  }