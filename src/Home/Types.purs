module Home.Types where

import Prelude

import Home.Pkgs.ChromiumSetSearches.Types as ChromiumSetSearches
import Prim.RowList (class RowToList, RowList)
import Prim.RowList as RL

type Pkgs =
  { writeShellScriptBin :: String -> String -> String
  , nixFlakes :: String
  , just :: String
  | ChromiumSetSearches.Pkgs ()
  }

type HomeConfig =
  { home ::
      { username :: String
      , homeDirectory :: String
      , stateVersion :: String
      , packages :: Array String
      }
  , targets :: { genericLinux :: { enable :: Boolean } }
  , nix ::
      { package :: String
      , extraOptions :: String
      }
  , programs ::
      { "home-manager" :: { enable :: Boolean }
      , "bash" :: { enable :: Boolean }
      , "git" :: { enable :: Boolean }
      , "fish" :: { enable :: Boolean }
      }
  }
