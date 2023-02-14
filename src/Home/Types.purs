module Home.Types where

import Prelude

import Home.Pkgs.ChromiumSetSearches.Types as ChromiumSetSearches
import Prim.Row as Row
import Prim.RowList (class RowToList, RowList)
import Prim.RowList as RL
import Unsafe.Coerce (unsafeCoerce)

type Pkgs =
  { writeShellScriptBin :: String -> String -> String
  , nixFlakes :: String
  , just :: String
  , sqlite :: String
  , writeText :: String -> String -> String
  | ChromiumSetSearches.Pkgs ()
  }

foreign import data Partial :: Row Type -> Type

partial :: forall r r_ r'. Row.Union r r_ r' => Record r -> Partial r'
partial = unsafeCoerce

type HomeConfig =
  Partial
    ( home ::
        Partial
          ( username :: String
          , homeDirectory :: String
          , stateVersion :: String
          , packages :: Array String
          )
    , targets ::
        Partial
          ( genericLinux ::
              Partial
                ( enable :: Boolean
                )
          )
    , nix ::
        Partial
          ( package :: String
          , extraOptions :: String
          )
    , programs ::
        Partial
          ( "home-manager" :: Partial (enable :: Boolean)
          , "bash" :: Partial (enable :: Boolean)
          , "git" :: Partial (enable :: Boolean)
          , "fish" :: Partial (enable :: Boolean)
          , "chromium" ::
              Partial
                ( enable :: Boolean
                , extensions :: Array { id :: String }
                )
          )
    )

