module Home.Pkgs.ChromiumSetSearches.Types where

import Prelude

type SearchEntry =
  { name :: String
  , shorthand :: String
  , url :: String
  }

type Pkgs r =
  ( chromiumSetSearches :: { entries :: Array SearchEntry } -> String
  | r
  )