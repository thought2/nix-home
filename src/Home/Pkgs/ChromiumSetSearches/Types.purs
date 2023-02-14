module Home.Pkgs.ChromiumSetSearches.Types where

import Prelude

import Nix (Derivation)

type SearchEntry =
  { name :: String
  , shorthand :: String
  , url :: String
  }

type Pkgs r =
  ( chromiumSetSearches :: { entries :: Array SearchEntry } -> Derivation
  | r
  )