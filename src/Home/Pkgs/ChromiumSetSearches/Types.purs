module Home.Pkgs.ChromiumSetSearches.Types where

import Prelude

type Pkgs r =
  ( chromiumSetSearches :: { entries :: Array {name :: String, shorthand :: String, url :: String} } -> String
  | r
  )